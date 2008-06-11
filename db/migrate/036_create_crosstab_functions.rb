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

# This migration creates functions for the PossgesSQL
# Yet is at number 036 But perhaps it must execute in partial databases

require 'yaml'
class CreateCrosstabFunctions < ActiveRecord::Migration
  
  # *Description*
  #   Creates functions
  def self.create_functions
    # Load the database configuration files
    db_configs = YAML.load_file "#{RAILS_ROOT}/config/database.yml"
    # Get the username for the current name
    username = db_configs[RAILS_ENV]['username']
    connection = ActiveRecord::Base.connection
    create_functions_sql = %Q~

    CREATE OR REPLACE FUNCTION connectby(text, text, text, text, int4, text)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'connectby_text'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION connectby(text, text, text, text, int4, text) OWNER TO #{username};

    CREATE OR REPLACE FUNCTION connectby(text, text, text, text, int4)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'connectby_text'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION connectby(text, text, text, text, int4) OWNER TO #{username};

    CREATE OR REPLACE FUNCTION connectby(text, text, text, text, text, int4, text)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION connectby(text, text, text, text, text, int4, text) OWNER TO #{username};

    CREATE OR REPLACE FUNCTION connectby(text, text, text, text, text, int4)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION connectby(text, text, text, text, text, int4) OWNER TO #{username};

    CREATE OR REPLACE FUNCTION crosstab(text, int4)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'crosstab'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION crosstab(text, int4) OWNER TO #{username};

    CREATE OR REPLACE FUNCTION crosstab(text, text)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'crosstab_hash'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION crosstab(text, text) OWNER TO #{username};

    CREATE OR REPLACE FUNCTION normal_rand(int4, float8, float8)
    RETURNS SETOF float8 AS
    '$libdir/tablefunc', 'normal_rand'
    LANGUAGE 'c' VOLATILE STRICT;
    ALTER FUNCTION normal_rand(int4, float8, float8) OWNER TO #{username};
  ~
  
    connection.execute create_functions_sql
    

  end
  
  # *Description*
  #  Drops fucntions
  def self.drop_functions
    
    connection = ActiveRecord::Base.connection
    
    drop_functions_sql = %Q~
    DROP FUNCTION connectby(text, text, text, text, int4, text);
    DROP FUNCTION connectby(text, text, text, text, int4);
    DROP FUNCTION connectby(text, text, text, text, text, int4, text);
    DROP FUNCTION connectby(text, text, text, text, text, int4);
    DROP FUNCTION crosstab(text, int4);
    DROP FUNCTION crosstab(text, text);
    DROP FUNCTION normal_rand(int4, float8, float8);
    ~
    
    connection.execute drop_functions_sql
    
  end
  
  def self.up
    create_functions
  end

  def self.down
    drop_functions
  end
end
