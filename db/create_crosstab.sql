/*
This SQL script creates crosstab functions for myowndb databases.
To execute:
$ sudo -u postgres psql -d databaseName < create_crosstab.sql
Written by: Mohsin Hijazee
*/

    CREATE OR REPLACE FUNCTION connectby(text, text, text, text, int4, text)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'connectby_text'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION connectby(text, text, text, text, int4, text) OWNER TO postgres;

    CREATE OR REPLACE FUNCTION connectby(text, text, text, text, int4)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'connectby_text'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION connectby(text, text, text, text, int4) OWNER TO postgres;

    CREATE OR REPLACE FUNCTION connectby(text, text, text, text, text, int4, text)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION connectby(text, text, text, text, text, int4, text) OWNER TO postgres;

    CREATE OR REPLACE FUNCTION connectby(text, text, text, text, text, int4)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION connectby(text, text, text, text, text, int4) OWNER TO postgres;

    CREATE OR REPLACE FUNCTION crosstab(text, int4)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'crosstab'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION crosstab(text, int4) OWNER TO postgres;

    CREATE OR REPLACE FUNCTION crosstab(text, text)
    RETURNS SETOF record AS
    '$libdir/tablefunc', 'crosstab_hash'
    LANGUAGE 'c' STABLE STRICT;
    ALTER FUNCTION crosstab(text, text) OWNER TO postgres;

    CREATE OR REPLACE FUNCTION normal_rand(int4, float8, float8)
    RETURNS SETOF float8 AS
    '$libdir/tablefunc', 'normal_rand'
    LANGUAGE 'c' VOLATILE STRICT;
    ALTER FUNCTION normal_rand(int4, float8, float8) OWNER TO postgres;
