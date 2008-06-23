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

# Contains following tasks. 
#  create_users
#  create_databases
#  create_crosstab
#  load_translations
#  copy_config_file
#  setup
user_info_header = %Q~
-------------------------------------------------------------
|                       Step 1                              |
|               Dedomenon User's Creation                   |
-------------------------------------------------------------
| This step will create two users in your PostgesSQL server.|
|                                                           |
|   * 'myowndb' user is normal user used for production     |
|     and development databases.                            |
|   * 'myowndbtester' is a super user for test database     |
|                                                           |
| You'll be asked for the passwords of these users. Write   |
| them  down as you  will have  to   mention  them  under   |
| config/database.yml for each user mentioned.              |
|                                                           |
-------------------------------------------------------------
~

database_info_header = %Q~
-------------------------------------------------------------
|                       Step 2                              |
|               Dedomenon Databases Creation                |
-------------------------------------------------------------
| This step will create four databases:                     |
|                                                           |
|   * 'myowndb_dev' is development database with owner      |
|     'myowndb'                                             |
|   * 'myowndb_test' is the test database with owner        |
|     'myowndbtester'                                       |
|   * 'myowndb_prod'is production databae with owner        |
|     'myowndb'                                             |
|   * 'myowndb_ui_translations' holds UI translations with  |
|     owner 'myowndb'                                       |
|                                                           |
| You'll be asked for the passwords of these users. Write   |
| them  down as you  will have  to   mention  them  under   |
| config/database.yml for each user mentioned.              |
|                                                           |
-------------------------------------------------------------
~
crosstab_info_header = %Q~
-------------------------------------------------------------
|                       Step 3                              |
|               Crosstab Function Creation                  |
-------------------------------------------------------------
|                                                           |
|  This step will create crosstab functiosn in databases.   |
|                                                           |
------------------------------------------------------------|
~

loading_translations = %Q~
-------------------------------------------------------------
|                        Step 4                             |
|               Loading database translations               |
-------------------------------------------------------------
|                                                           |
|  This step will load UI translations to database          |
|                                                           |
------------------------------------------------------------|
~
namespace :dedomenon do
  #FIXME: Should properly report what its doing
  desc 'Creates users for dedomenon in postgres'
  task :create_users => :environment do 
    puts user_info_header
    [
      # First is the user name, rest are the options
      ['myowndb', '--no-superuser', '--no-createdb', '--no-createrole'],
      ['myowndbtester', '--superuser']
    ].each do |db_user| 
      options = "#{db_user.join(' ')}"
      
      command = "sudo -u postgres createuser #{options} -P 1>/dev/null"
      system command
      puts "Creating user '#{db_user[0]}'..."
      #puts command
    end
  end
  
  #FIXME: Should properly report what its doing
  desc 'Creates databases for dedomenon'
  task :create_databases => :create_users do
    puts database_info_header
    [
      # First is the database name, second is the owner of database
      ['myowndb_dev', 'myowndb'],
      ['myowndb_test', 'myowndbtester'],
      ['myowndb_prod', 'myowndb'],
      ['myowndb_ui_translations', 'myowndb'],
    ].each do |database|
      puts "Creating database '#{database[0]}' for user '#{database[1]}'..."
      options = " #{database[0]} -O #{database[1]}"
      command = "sudo -u postgres createdb #{options} -E UNICODE 1>/dev/null"
      system command
      #puts command
    end
  end
  
  desc 'Creates cross_tab functions in dedomenon databases'
  task :create_crosstab => :create_databases do
    puts crosstab_info_header
    [
      'madb',
      'madb-test',
      'myowndb_prod',
    ].each do |database|
      puts "Creating cross_tab fucntions for database '#{database}'..."
      sql_script = "#{RAILS_ROOT}/db/create_crosstab.sql"
      command = "sudo -u postgres psql -d #{database} < #{sql_script} 1>/dev/null"
      system command
      #puts command
    end
  end
  
  desc 'Loads the translations database for dedomenon UI'
  task :load_translations => :create_databases do
    puts loading_translations
    sql_script = "#{RAILS_ROOT}/db/myowndb_ui_translations_dump.sql"
    puts "Loading UI translations to myowndb_ui_translations database..."
    command = "sudo -u postgres psql -d myowndb_ui_translations < #{sql_script} 1>/dev/null"
    system command
    #puts command
  end
  
  desc 'Copies config/database.yml'
  task :copy_config_file  do
    puts "Copying config/database.yml.example to config/database.yml..."
    cp "#{RAILS_ROOT}/config/database.yml.example", 
       "#{RAILS_ROOT}/config/database.yml"
  end
  
  desc 'Setups dedomenon for you including users, databases.'
  task :setup => [:create_crosstab,:load_translations, :copy_config_file] do
    puts " * Now you can edit config/database.yml and mention passwords for respective users"
    puts " * After mentioning the passwords, you should run migrations."
  end
  
end

