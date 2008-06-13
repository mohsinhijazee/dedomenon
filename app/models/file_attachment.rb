################################################################################
#This file is part of Dedomenon.
#
#Dedomenon is free software: you can redistribute it and/or modify
#it under the terms of the GNU Affero General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#Dedomenon is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU Affero General Public License for more details.
#
#You should have received a copy of the GNU Affero General Public License
#along with Dedomenon.  If not, see <http://www.gnu.org/licenses/>.
#
#Copyright 2008 Raphaël Bauduin
################################################################################

# *Description*
# Handles a FileAttachment type in Dedomenon.
# 
require 'actionpack'
class FileAttachment < DetailValue
  
  #PENDING: Think about it
  @@base_dir = MadbSettings.s3_local_dir
  #@@base_dir = "#{RAILS_ROOT}/tmp/data/"
  #@@bucket_name = MadbSettings.s3_bucket_name 
  belongs_to :instance
  belongs_to :detail
  serialize :value  #for file_name, mimetype, bucket and key
  
  after_save    :save_file
  after_destroy :remove_file
  #allow_concurrency = true

  def self.table_name
    "detail_values"
  end

  def account_id 
    self.instance.entity.database.account_id
  end
  
  def database_id
    self.instance.entity.database_id
  end
  
  def entity_id  
    self.instance.entity_id
  end

  def size
   # @s3_conn = S3::AWSAuthConnection.new(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
   # @s3_conn.head(@@bucket_name, s3_key).http_response.content_length
   @attachment.size
  end
  
  # TODO: CHANGE IT
  def download_url
#     o = value
#     generator = S3::QueryStringAuthGenerator.new(AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
#     generator.expires_in = 60
#     return generator.get(@@bucket_name, s3_key)
  end

  
  def value=(v)
    @attachment = v
    #v.size
    h = { :filename => File.basename(@attachment.original_filename), :filetype => @attachment.content_type, :uploaded => false}
    write_attribute(:value, h)
    puts "File size: #{v.size}"
    puts self.value.to_json
  end
  
  def instance_prefix
      %Q{#{account_id}/#{database_id}/#{entity_id}/#{instance_id}}
  end
  
  def local_instance_path
    %Q{#{@@base_dir}/#{instance_prefix}}
  end
  
  def save_file
    #puts "In FileAttachment.save() "
    @attachment.rewind
    
    if !FileTest.directory?( local_instance_path )
      FileUtils.mkdir_p( local_instance_path )
    end
     
     File.open("#{local_instance_path}/#{self.id.to_s}", "wb") do |f| 
       f.write(@attachment.read) 
     end
     o = value
     o[:uploaded] = true
     # Save the value id also
     o[:valueid] = id
     write_attribute(:value, o)
     puts "File saved at: #{local_instance_path}#{self.id.to_s}"
  end
  
  def destroy_file
    puts "In FileAttachment.destroy() "
    begin
      File.delete("#{local_instance_path}/#{self.id.to_s}")
    rescue Exception => e
      puts e.message
    end
  end
  
  # This method is overridden from the DetailValueModule
  def self.format_detail(options = {})
    return "" if options[:value].nil?
    options[:format] = :html if options[:format].nil?
    
    begin
      file_properties = YAML.load options[:value]
    rescue TypeError, ArgumentError
      file_properties = options
    end
    
    case options[:format]
      when :html
        debugger
     	  controller = options[:controller] 
     	  url = controller.url_for :controller => 'file_attachments', 
     	        :action => 'download', :id => file_properties[:valueid]
     	  return %Q{<a href="#{url}">#{html_escape(file_properties[:filename])}</a>}
     	when :first_column
     	  return file_properties[:filename]
     	when :csv
     	  return file_properties[:filename]
    end
  end
  
  def to_form_row(i=0, o = {})
    #entity_input is used for the id of the input containing the field
    #we need to add random characters to the entity name so scripts generated can distinguish fields in a form
     entity_input = %Q{#{o[:form_id]}_#{o[:entity].name}}.gsub(/ /,"_")
     entity = entity_input+"_"+String.random(3)
		 id = detail.name+"["+i.to_s+"]"
     
    upload_allowed = false
    # If the file transfer plugin is not installed, then allow uploads
    upload_allowed = true if !self.respond_to? :allows_upload?
    # And is upto allows_upload if it respond to it.
    upload_allowed = allows_upload? if self.respond_to? :allows_upload?
    
    if upload_allowed
      replace_icon=%Q{<img id="replace_file_#{entity}_#{id}" class="action_cell" src="/images/icon/big/edit.png" alt="replace_file"/>}
      input_field = %Q{<input type="hidden" id="#{o[:entity].name}_#{detail.name}[#{i.to_s}]_id" name="#{detail.name}[#{i.to_s}][id]" value="#{self.id}"><input detail_id="#{detail.id}" class="unchecked_form_value" type="file" id ="#{entity_input}_#{id}_value" name="#{id}[value]"/>}
      undo_icon = %Q{<img onclick="undoFileUpload_#{entity}_#{i}();" id="undo_file_#{entity}_#{id}" class="action_cell" src="/images/icon/big/undo.png" alt="undo_replace_file"/>}
     upload_file_function = %Q{function displayFileUpload_#{entity}_#{i}(e, reversible)
       {
         file_cell = $('#{entity}_#{id}_cell');
            YAHOO.madb.container["#{entity}_#{id}_original_value"] = file_cell.innerHTML;
            YAHOO.util.Event.addListener("undo_file_#{entity}_#{id}",'click',undoFileUpload_#{entity}_#{i});
            var content = '#{input_field}';
            if (reversible)
            {
              content=content+'#{undo_icon}';
            }
            file_cell.innerHTML= content;
            YAHOO.madb.upload_field_tooltips_#{entity}_#{i}();
            YAHOO.madb.hide_current_file_tooltips_#{entity}_#{i}();
       }
       }
    else
      replace_icon="#{self.class.no_transfer_allowed_icon}"
      input_field ="#{self.class.no_transfer_allowed_icon}"
     upload_file_function = %Q{function displayFileUpload_#{entity}_#{i}(e, reversible)
       {
         file_cell = $('#{entity}_#{id}_cell');
         file_cell.innerHTML= '<img src="/images/icon/big/error.png" alt="no_upload" id="no_upload_icon_#{entity}_#{id}">';
         new YAHOO.widget.Tooltip("no_upload_tooltip_#{entity}_#{id}", {  
                       context:"no_upload_icon_#{entity}_#{id}",  
                       text:YAHOO.madb.translations['madb_file_transfer_quota_reached'], 
                       showDelay:100,
                       hideDelay:100,
                       autodismissdelay: 20000} ); 

         }
       }
    end
     #idof the hidden field containing the id of this detail_value, used later in the javascript to reset the value of the hidden field whe we delete the attachment.
     hidden_field_id = %Q{#{o[:entity].name}_#{detail.name}[#{i.to_s}]_id} 
     if value.nil?
      return %Q{<tr><td>#{detail.name}:</td><td id="#{entity}_#{id}_cell">#{input_field}</td></tr> }
     else
      return %Q{
      <tr><td>#{detail.name}:</td><td id="#{entity}_#{id}_cell">#{value[:filename]}<img id="delete_file_#{entity}_#{id}" class="action_cell" src="/images/icon/big/delete.png" alt="delete_file"/>#{replace_icon}</td></tr><script type="text/javascript">

  YAHOO.madb.upload_field_tooltips_#{entity}_#{i} =  function() {
      YAHOO.madb.undo_tooltip_#{entity}_#{i} = new YAHOO.widget.Tooltip("undo_file_tooltip_#{entity}_#{id}", {  
           context:"undo_file_#{entity}_#{id}",  
           text:YAHOO.madb.translations['madb_go_back_do_no_replace_current_file'], 
           showDelay:100,
           hideDelay:100,
           autodismissdelay: 20000} ); 
  }

  YAHOO.madb.hide_current_file_tooltips_#{entity}_#{i} =  function() { 
      YAHOO.madb.delete_tooltip_#{entity}_#{i}.hide();
      YAHOO.madb.replace_tooltip_#{entity}_#{i}.hide();
  }

  YAHOO.madb.hide_upload_field_tooltips_#{entity}_#{i} =  function() { 
      YAHOO.madb.undo_tooltip_#{entity}_#{i}.hide();
  }

  YAHOO.madb.current_file_tooltips_#{entity}_#{i} =  function() { 
      YAHOO.madb.delete_tooltip_#{entity}_#{i} = new YAHOO.widget.Tooltip("delete_file_tooltip_#{entity}_#{id}", {  
           context:"delete_file_#{entity}_#{id}",  
           text:YAHOO.madb.translations['madb_delete_file'], 
           showDelay:100,
           hideDelay:100,
           autodismissdelay: 20000} ); 
      YAHOO.madb.replace_tooltip_#{entity}_#{i} = new YAHOO.widget.Tooltip("replace_file_tooltip_#{entity}_#{id}", {  
           context:"replace_file_#{entity}_#{id}",  
           text:YAHOO.madb.translations['madb_replace_file'], 
           showDelay:100,
           hideDelay:100,
           autodismissdelay: 20000} ); 
  }
  YAHOO.madb.current_file_tooltips_#{entity}_#{i}();

   YAHOO.util.Event.addListener("replace_file_#{entity}_#{id}",'click',displayFileUpload_#{entity}_#{i}, true);
   YAHOO.util.Event.addListener("delete_file_#{entity}_#{id}",'click',delete_file_#{entity}_#{i});

  function delete_file_#{entity}_#{i}()
  {
    dojo.io.bind({
        url: "#{o[:controller].url_for(:controller => "detail_values", :action =>"delete", :id => self.id )}",
        load: function(type, data, evt)
        { 
          displayFileUpload_#{entity}_#{i}(null, false);
          if (document.getElementById('#{hidden_field_id}')!=null) 
            {
              document.getElementById('#{hidden_field_id}').setAttribute('value','');
            }
        },
            
        error: function(type, error){ alert(error.message) },
        mimetype: "text/plain"
    });

  }
  #{upload_file_function}
   function undoFileUpload_#{entity}_#{i}()
     {
          $('#{entity}_#{id}_cell').innerHTML =           YAHOO.madb.container["#{entity}_#{id}_original_value"];
          YAHOO.util.Event.addListener("replace_file_#{entity}_#{id}",'click',displayFileUpload_#{entity}_#{i}, true);
          YAHOO.util.Event.addListener("delete_file_#{entity}_#{id}",'click',delete_file_#{entity}_#{i});
          YAHOO.madb.current_file_tooltips_#{entity}_#{i}();
          YAHOO.madb.hide_upload_field_tooltips_#{entity}_#{i}();
     }
     </script>
      }
     end
    #else #no transfer allowed
    #  return %Q{<tr><td>#{detail.name}:</td><td id="#{entity}_#{id}_cell">#{value ? value[:filename] : ""}#{self.class.no_transfer_allowed_icon}</td></tr> }
    #end
	end



end
