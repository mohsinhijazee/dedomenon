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

require 'yaml'

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
| You'll be asked for the passwords of these users.         |
| Remeber them for later references                         |
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

# This hash will hold the passwords of the database users which are
# prompted by create_user task
user_passwords = {}

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
      command = "sudo -u postgres createuser #{options} 1>/dev/null"
      user_passwords[db_user[0]] = get_password("Enter password for postgres user '#{db_user[0]}'")
      # Create the user and then alter the password
      system command
      alter_role_query = "ALTER ROLE #{db_user[0]} WITH ENCRYPTED PASSWORD '#{user_passwords[db_user[0]]}'"
      system %Q[ sudo -u postgres psql -c "#{alter_role_query};" 1>/dev/null]
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
  
  desc 'Generates config/database.yml'
  task :generate_config_file  do
    puts "Generating config/database.yml..."
    yml = plug_passwords("#{RAILS_ROOT}/config/database.yml.example", user_passwords)
    File.open("#{RAILS_ROOT}/config/database.yml", "w") do |file|
      file.puts "# Autogenerated database connection info on #{Time.now.to_s}"
      file.puts "# By rake task dedomenon:setup"
      file.puts(yml.to_yaml)
    end
    puts "Generation of config/database.yml is complete"
  end
  
  desc 'Runs migrations on production database'
  task :run_migrations do
    RAILS_ENV = ENV['RAILS_ENV'] = 'production'
    Rake::Task['db:migrate'].invoke
  end
  
  desc 'Setups dedomenon for you including users, databases.'
  task :setup => [:create_crosstab,       :load_translations, 
                  :generate_config_file,  :run_migrations] do
    puts "* Now you can run applciation by ruby script/server -e production"
    puts "* If you want to use application in test and development modes," 
    puts "  You will have to run migratiosn yourself by:"
    puts "   * RAILS_ENV=development rake db:migrate"      
    puts "   * RAILS_ENV=test rake db:migrate"      
    puts " * Demo account is available for you:"
    puts "    * admin@mydedomenon.com is admin user"
    puts "    * user@mydedomenon.com is normal user"
    puts "    * Password for both users is 'dedomenon'"
    
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
  
  # Gets a password and returns it.
def get_password(prompt)
  first = ''
  second = nil
  #$stdout.flush
  #$stdin.flush
  while first != second do
    
    print "#{prompt}: "
    first = $stdin.gets.chomp
    print "Enter it again: "
    second = $stdin.gets.chomp
    
    $stderr.puts 'Passwords do not match!' if first != second
  end
  
  return first
end

# This function plugins the passwords of each user in appropiate section
# First argumetn is string having full path of file to be altered
# Second is a hash where passwords are hashed by user names
def plug_passwords(yml_file, passwords)
  
  yml = YAML.load_file yml_file
  
  # For the connection information of each of the database
  yml.each do |database, connection_info|
    # For each of the password 
    passwords.each do |username, password|
      # If its this user, place password
      if connection_info['username'] == username
        connection_info['password'] = password
      end
    end
  end
  return yml
end

  
end

