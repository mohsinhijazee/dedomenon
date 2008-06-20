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

class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.column :account_id,   :integer,                                 :null => false, :references => :accounts, :deferrable => true
      t.column :user_type_id, :integer,                 :default => 2,                  :references => :user_types, :deferrable => true
      t.column :login,        :string,   :limit => 80
      t.column :password,     :string,   :limit => nil
      t.column :email,        :string,   :limit => 40
      t.column :firstname,    :string,   :limit => 80
      t.column :lastname,     :string,   :limit => 80
      t.column :uuid,         :string,   :limit => 32
      t.column :salt,         :string,   :limit => 32
      t.column :verified,     :integer,                 :default => 0
      t.column :created_at,   :datetime
      t.column :updated_at,   :datetime
      t.column :logged_in_at, :datetime
    end
    
    # Create two users for the demo account so that user can log in.
    # First user is super user with id 777 , the ohter is ordinary with 999.
    password = 'dedomenon'
    admin_login = 'admin@mydedomenon.com'
    normal_login = 'user@mydedomenon.com'
    user = User.new(
      :id                                             =>  777,
      :account_id                                     => 111,
      :user_type_id                                   => 1,
      :login                                          => admin_login,
      :password                                       => password,
      :email                                          => admin_login,
      :firstname                                      => 'Dedomenon',
      :lastname                                       => 'Administrator',
      :verified                                       => 1
    )
    
    user.login_confirmation = user.login
    user.password_confirmation = user.password
    user.save!
    
    # Create the ordinary user
    user = User.new(
      :id                                             => 999,
      :account_id                                     => 111,
      :user_type_id                                   => 2,
      :login                                          => normal_login,
      :password                                       => password,
      :email                                          => normal_login,
      :firstname                                      => 'Dedomenon',
      :lastname                                       => 'User',
      :verified                                       => 1
    )
    
    user.login_confirmation = user.login
    user.password_confirmation = user.password
    user.save!
    
    ActiveRecord::Base.connection.execute("UPDATE users SET id=777 WHERE login='#{admin_login}';")
    ActiveRecord::Base.connection.execute("UPDATE users SET id=999 WHERE login='#{normal_login}';")
    
  end

  def self.down
    drop_table :users
  end
end
