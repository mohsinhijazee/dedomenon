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


require File.dirname(__FILE__) + '/../../test_helper'
require 'admin/translations_controller'

# Re-raise errors caught by the controller.
class Admin::TranslationsController; def rescue_action(e) raise e end; end

class Admin::TranslationsControllerTest < Test::Unit::TestCase
#  fixtures :translations

  def setup
    @controller = Admin::TranslationsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    
    assert true
  end
#
#  def test_list
#    get :list
#    assert_rendered_file 'list'
#    assert_template_has 'translations'
#  end
#
#  def test_show
#    get :show, 'id' => 1
#    assert_rendered_file 'show'
#    assert_template_has 'translation'
#    assert_valid_record 'translation'
#  end
#
#  def test_new
#    get :new
#    assert_rendered_file 'new'
#    assert_template_has 'translation'
#  end
#
#  def test_create
#    num_translations = Translation.find_all.size
#
#    post :create, 'translation' => { }
#    assert_redirected_to :action => 'list'
#
#    assert_equal num_translations + 1, Translation.find_all.size
#  end
#
#  def test_edit
#    get :edit, 'id' => 1
#    assert_rendered_file 'edit'
#    assert_template_has 'translation'
#    assert_valid_record 'translation'
#  end
#
#  def test_update
#    post :update, 'id' => 1
#    assert_redirected_to :action => 'show', :id => 1
#  end
#
#  def test_destroy
#    assert_not_nil Translation.find(1)
#
#    post :destroy, 'id' => 1
#    assert_redirected_to :action => 'list'
#
#    assert_raise(ActiveRecord::RecordNotFound) {
#      translation = Translation.find(1)
#    }
#  end
end
