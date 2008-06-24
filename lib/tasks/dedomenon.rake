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
# FUTURE: Task should be able to obtain the passwords of the users and then
#         generated the config/database.yml file automatically and after it,
#         it should automatically run migrations.
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
  task :create_users do 
    puts user_info_header
    [
      # First is the user name, rest are the options
      ['myowndb', '--no-superuser', '--no-createdb', '--no-createrole'],
      ['myowndbtester', '--superuser']
    ].each do |db_user| 
      options = "#{db_user.join(' ')}"
      puts "Creating user '#{db_user[0]}'..."
      command = "sudo -u postgres createuser #{options} -P 1>/dev/null"
      system command
      puts "User '#{db_user[0]}' created..."
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
      puts "Database '#{database[0]}' created with owner '#{database[1]}'"
      #puts command
    end
  end
  
  desc 'Creates cross_tab functions in dedomenon databases'
  task :create_crosstab => :create_databases do
    puts crosstab_info_header
    [
      'myowndb_dev',
      'myowndb_test',
      'myowndb_prod',
    ].each do |database|
      puts "Creating cross_tab fucntions for database '#{database}'..."
      sql_script = "#{RAILS_ROOT}/db/create_crosstab.sql"
      command = "sudo -u postgres psql -d #{database} < #{sql_script} 1>/dev/null"
      system command
      puts "cross_tab functions created for database '#{database}'"
      #puts command
    end
  end
  
  desc 'Loads the translations database for dedomenon UI'
  task :load_translations => :create_databases do
    puts loading_translations
    sql_script = "#{RAILS_ROOT}/db/myowndb_ui_translations_dump.sql"
    puts "Loading UI translations to myowndb_ui_translations database..."
    puts "This will ask you for the password of the 'myowndb' user."
    command = "psql myowndb_ui_translations -h localhost -U myowndb -W < #{sql_script} 1>/dev/null"
    system command
    puts "Translations database loaded"
    #puts command
  end
  
  desc 'Copies config/database.yml'
  task :copy_config_file  do
    puts "Copying config/database.yml.example to config/database.yml..."
    cp "#{RAILS_ROOT}/config/database.yml.example", 
       "#{RAILS_ROOT}/config/database.yml"
    puts "config/database.yml.example copied to config/database.yml"
  end
  
  desc 'Setups dedomenon for you including users, databases.'
  task :setup => [:create_crosstab,:load_translations, :copy_config_file] do
    puts " * Now you can edit config/database.yml and mention passwords for respective users"
    puts " * After mentioning the passwords, you should run migrations."
  end
  
  desc 'Drops all the postgres databases and postgres users'
  task :purge do
    # Drop the databases
    ['myowndb_dev',
      'myowndb_test',
      'myowndb_prod',
      'myowndb_ui_translations'
    ].each do |database|
      puts "Dropping database '#{database}'..."
      system %Q~ sudo -u postgres psql -c "DROP DATABASE #{database};" 1>/dev/null~
      puts "Database '#{database}' dropped..."
    end
    
    # Drop the users
    [
      'myowndbtester',
      'myowndb'
    ].each do |user|
      puts "Dropping user '#{user}'..."
      system %Q~ sudo -u postgres psql -c "DROP ROLE #{user};" 1>/dev/null~
      puts "User '#{user}' dropped..."
    end
  end
  
end

