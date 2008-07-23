--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

--
-- Name: tablefunc_crosstab_2; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tablefunc_crosstab_2 AS (
	row_name text,
	category_1 text,
	category_2 text
);


--
-- Name: tablefunc_crosstab_3; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tablefunc_crosstab_3 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text
);


--
-- Name: tablefunc_crosstab_4; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE tablefunc_crosstab_4 AS (
	row_name text,
	category_1 text,
	category_2 text,
	category_3 text,
	category_4 text
);


--
-- Name: connectby(text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION connectby(text, text, text, text, integer, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text'
    LANGUAGE c STABLE STRICT;


--
-- Name: connectby(text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION connectby(text, text, text, text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text'
    LANGUAGE c STABLE STRICT;


--
-- Name: connectby(text, text, text, text, text, integer, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION connectby(text, text, text, text, text, integer, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE c STABLE STRICT;


--
-- Name: connectby(text, text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION connectby(text, text, text, text, text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'connectby_text_serial'
    LANGUAGE c STABLE STRICT;


--
-- Name: crosstab(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab(text, integer) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


--
-- Name: crosstab(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab(text, text) RETURNS SETOF record
    AS '$libdir/tablefunc', 'crosstab_hash'
    LANGUAGE c STABLE STRICT;


--
-- Name: crosstab2(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab2(text) RETURNS SETOF tablefunc_crosstab_2
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


--
-- Name: crosstab3(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab3(text) RETURNS SETOF tablefunc_crosstab_3
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


--
-- Name: crosstab4(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosstab4(text) RETURNS SETOF tablefunc_crosstab_4
    AS '$libdir/tablefunc', 'crosstab'
    LANGUAGE c STABLE STRICT;


--
-- Name: normal_rand(integer, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION normal_rand(integer, double precision, double precision) RETURNS SETOF double precision
    AS '$libdir/tablefunc', 'normal_rand'
    LANGUAGE c STRICT;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_type_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE account_type_values (
    id integer NOT NULL,
    account_type_id integer,
    detail text,
    value text
);


--
-- Name: account_type_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_type_values_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: account_type_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_type_values_id_seq OWNED BY account_type_values.id;


--
-- Name: account_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE account_types (
    id integer NOT NULL,
    name text,
    active boolean DEFAULT false,
    free boolean DEFAULT false,
    number_of_users text DEFAULT 'madb_unlimited'::text,
    number_of_databases text DEFAULT '1'::text,
    monthly_fee double precision DEFAULT 99.99,
    maximum_file_size integer DEFAULT 51200,
    maximum_monthly_file_transfer bigint DEFAULT 10485760,
    maximum_attachment_number integer DEFAULT 50
);


--
-- Name: account_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: account_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_types_id_seq OWNED BY account_types.id;


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    account_type_id integer,
    name text NOT NULL,
    street text,
    zip_code text,
    city text,
    country text,
    status text DEFAULT 'inactive'::text,
    end_date date DEFAULT now(),
    subscription_id text,
    subscription_gateway text,
    vat_number text,
    attachment_count integer DEFAULT 0,
    lock_version integer DEFAULT 0
);


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE accounts_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: data_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE data_types (
    id integer NOT NULL,
    name text,
    class_name text
);


--
-- Name: data_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE data_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: data_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE data_types_id_seq OWNED BY data_types.id;


--
-- Name: databases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE databases (
    id integer NOT NULL,
    account_id integer NOT NULL,
    name text,
    lock_version integer DEFAULT 0
);


--
-- Name: databases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE databases_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: databases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE databases_id_seq OWNED BY databases.id;


--
-- Name: date_detail_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE date_detail_values (
    id integer NOT NULL,
    detail_id integer,
    instance_id integer,
    value timestamp without time zone,
    lock_version integer DEFAULT 0
);


--
-- Name: date_detail_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE date_detail_values_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: date_detail_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE date_detail_values_id_seq OWNED BY date_detail_values.id;


--
-- Name: ddl_detail_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ddl_detail_values (
    id integer NOT NULL,
    detail_id integer,
    instance_id integer,
    detail_value_proposition_id integer,
    lock_version integer DEFAULT 0
);


--
-- Name: ddl_detail_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ddl_detail_values_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: ddl_detail_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ddl_detail_values_id_seq OWNED BY ddl_detail_values.id;


--
-- Name: detail_status; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE detail_status (
    id integer NOT NULL,
    name text
);


--
-- Name: detail_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE detail_status_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: detail_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE detail_status_id_seq OWNED BY detail_status.id;


--
-- Name: detail_value_propositions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE detail_value_propositions (
    id integer NOT NULL,
    detail_id integer,
    value text,
    lock_version integer DEFAULT 0
);


--
-- Name: detail_value_propositions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE detail_value_propositions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: detail_value_propositions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE detail_value_propositions_id_seq OWNED BY detail_value_propositions.id;


--
-- Name: detail_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE detail_values (
    id integer NOT NULL,
    detail_id integer,
    instance_id integer,
    value text,
    "type" text,
    lock_version integer DEFAULT 0
);


--
-- Name: detail_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE detail_values_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: detail_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE detail_values_id_seq OWNED BY detail_values.id;


--
-- Name: details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE details (
    id integer NOT NULL,
    name text,
    data_type_id integer,
    status_id integer,
    database_id integer,
    lock_version integer DEFAULT 0
);


--
-- Name: details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE details_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE details_id_seq OWNED BY details.id;


--
-- Name: entities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE entities (
    id integer NOT NULL,
    database_id integer NOT NULL,
    name text,
    has_public_form boolean DEFAULT false,
    lock_version integer DEFAULT 0
);


--
-- Name: entities2details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE entities2details (
    id integer NOT NULL,
    entity_id integer,
    detail_id integer,
    status_id integer,
    displayed_in_list_view boolean DEFAULT true,
    maximum_number_of_values integer,
    display_order integer DEFAULT 100
);


--
-- Name: entities2details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE entities2details_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: entities2details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE entities2details_id_seq OWNED BY entities2details.id;


--
-- Name: entities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE entities_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: entities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE entities_id_seq OWNED BY entities.id;


--
-- Name: instances; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE instances (
    id integer NOT NULL,
    entity_id integer,
    created_at timestamp with time zone,
    lock_version integer DEFAULT 0
);


--
-- Name: instances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE instances_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE instances_id_seq OWNED BY instances.id;


--
-- Name: integer_detail_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE integer_detail_values (
    id integer NOT NULL,
    detail_id integer,
    instance_id integer,
    value bigint,
    lock_version integer DEFAULT 0
);


--
-- Name: integer_detail_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE integer_detail_values_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: integer_detail_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE integer_detail_values_id_seq OWNED BY integer_detail_values.id;


--
-- Name: invoice_numbers; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE invoice_numbers
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE invoices (
    id integer NOT NULL,
    invoice_number integer DEFAULT nextval('invoice_numbers'::regclass),
    invoice_date timestamp without time zone DEFAULT now(),
    account_id integer,
    gross_amount double precision,
    amount double precision,
    vat_applied double precision,
    company text,
    address text,
    city text,
    country text,
    item text
);


--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE invoices_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE invoices_id_seq OWNED BY invoices.id;


--
-- Name: links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE links (
    id integer NOT NULL,
    parent_id integer,
    child_id integer,
    relation_id integer
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE links_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE links_id_seq OWNED BY links.id;


--
-- Name: paypal_communications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE paypal_communications (
    id integer NOT NULL,
    t timestamp without time zone DEFAULT now(),
    account_id integer,
    txn_type text,
    communication_type text,
    direction text,
    content text
);


--
-- Name: paypal_communications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE paypal_communications_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: paypal_communications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE paypal_communications_id_seq OWNED BY paypal_communications.id;


--
-- Name: preferences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE preferences (
    id integer NOT NULL,
    user_id integer,
    display_help boolean
);


--
-- Name: preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE preferences_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE preferences_id_seq OWNED BY preferences.id;


--
-- Name: relation_side_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relation_side_types (
    id integer NOT NULL,
    name text
);


--
-- Name: relation_side_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE relation_side_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: relation_side_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE relation_side_types_id_seq OWNED BY relation_side_types.id;


--
-- Name: relations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relations (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    parent_side_type_id integer NOT NULL,
    child_side_type_id integer NOT NULL,
    from_parent_to_child_name text NOT NULL,
    from_child_to_parent_name text,
    lock_version integer DEFAULT 0
);


--
-- Name: relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE relations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE relations_id_seq OWNED BY relations.id;


--
-- Name: schema_info; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_info (
    version integer
);


--
-- Name: transfers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transfers (
    id integer NOT NULL,
    created_at timestamp without time zone,
    account_id integer,
    user_id integer,
    detail_value_id integer,
    instance_id integer,
    entity_id integer,
    size integer NOT NULL,
    file text,
    direction text
);


--
-- Name: transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE transfers_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE transfers_id_seq OWNED BY transfers.id;


--
-- Name: user_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_types (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: user_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_types_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_types_id_seq OWNED BY user_types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    account_id integer NOT NULL,
    user_type_id integer DEFAULT 2,
    "login" character varying(80),
    "password" character varying,
    email character varying(40),
    firstname character varying(80),
    lastname character varying(80),
    uuid character(32),
    salt character(32),
    verified integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    logged_in_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE account_type_values ALTER COLUMN id SET DEFAULT nextval('account_type_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE account_types ALTER COLUMN id SET DEFAULT nextval('account_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE data_types ALTER COLUMN id SET DEFAULT nextval('data_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE databases ALTER COLUMN id SET DEFAULT nextval('databases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE date_detail_values ALTER COLUMN id SET DEFAULT nextval('date_detail_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ddl_detail_values ALTER COLUMN id SET DEFAULT nextval('ddl_detail_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE detail_status ALTER COLUMN id SET DEFAULT nextval('detail_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE detail_value_propositions ALTER COLUMN id SET DEFAULT nextval('detail_value_propositions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE detail_values ALTER COLUMN id SET DEFAULT nextval('detail_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE details ALTER COLUMN id SET DEFAULT nextval('details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE entities ALTER COLUMN id SET DEFAULT nextval('entities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE entities2details ALTER COLUMN id SET DEFAULT nextval('entities2details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE instances ALTER COLUMN id SET DEFAULT nextval('instances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE integer_detail_values ALTER COLUMN id SET DEFAULT nextval('integer_detail_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE invoices ALTER COLUMN id SET DEFAULT nextval('invoices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE links ALTER COLUMN id SET DEFAULT nextval('links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE paypal_communications ALTER COLUMN id SET DEFAULT nextval('paypal_communications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE preferences ALTER COLUMN id SET DEFAULT nextval('preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE relation_side_types ALTER COLUMN id SET DEFAULT nextval('relation_side_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE relations ALTER COLUMN id SET DEFAULT nextval('relations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE transfers ALTER COLUMN id SET DEFAULT nextval('transfers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE user_types ALTER COLUMN id SET DEFAULT nextval('user_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: account_type_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_type_values
    ADD CONSTRAINT account_type_values_pkey PRIMARY KEY (id);


--
-- Name: account_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_types
    ADD CONSTRAINT account_types_pkey PRIMARY KEY (id);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: data_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY data_types
    ADD CONSTRAINT data_types_pkey PRIMARY KEY (id);


--
-- Name: databases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY databases
    ADD CONSTRAINT databases_pkey PRIMARY KEY (id);


--
-- Name: date_detail_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY date_detail_values
    ADD CONSTRAINT date_detail_values_pkey PRIMARY KEY (id);


--
-- Name: ddl_detail_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ddl_detail_values
    ADD CONSTRAINT ddl_detail_values_pkey PRIMARY KEY (id);


--
-- Name: detail_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY detail_status
    ADD CONSTRAINT detail_status_pkey PRIMARY KEY (id);


--
-- Name: detail_value_propositions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY detail_value_propositions
    ADD CONSTRAINT detail_value_propositions_pkey PRIMARY KEY (id);


--
-- Name: detail_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY detail_values
    ADD CONSTRAINT detail_values_pkey PRIMARY KEY (id);


--
-- Name: details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY details
    ADD CONSTRAINT details_pkey PRIMARY KEY (id);


--
-- Name: entities2details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY entities2details
    ADD CONSTRAINT entities2details_pkey PRIMARY KEY (id);


--
-- Name: entities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT entities_pkey PRIMARY KEY (id);


--
-- Name: instances_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: integer_detail_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY integer_detail_values
    ADD CONSTRAINT integer_detail_values_pkey PRIMARY KEY (id);


--
-- Name: invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: paypal_communications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY paypal_communications
    ADD CONSTRAINT paypal_communications_pkey PRIMARY KEY (id);


--
-- Name: preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (id);


--
-- Name: relation_side_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relation_side_types
    ADD CONSTRAINT relation_side_types_pkey PRIMARY KEY (id);


--
-- Name: relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relations
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);


--
-- Name: transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT transfers_pkey PRIMARY KEY (id);


--
-- Name: u_parent_child_relation; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY links
    ADD CONSTRAINT u_parent_child_relation UNIQUE (parent_id, child_id, relation_id);


--
-- Name: user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_types
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: entities2details__detail_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX entities2details__detail_id ON entities2details USING btree (detail_id);


--
-- Name: entities2details__entity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX entities2details__entity_id ON entities2details USING btree (entity_id);


--
-- Name: i_date_detail_value__detail_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_date_detail_value__detail_id ON date_detail_values USING btree (detail_id);


--
-- Name: i_date_detail_value__instance_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_date_detail_value__instance_id ON date_detail_values USING btree (instance_id);


--
-- Name: i_ddl_detail_value__detail_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_ddl_detail_value__detail_id ON ddl_detail_values USING btree (detail_id);


--
-- Name: i_ddl_detail_value__instance_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_ddl_detail_value__instance_id ON ddl_detail_values USING btree (instance_id);


--
-- Name: i_detail_value__detail_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_detail_value__detail_id ON detail_values USING btree (detail_id);


--
-- Name: i_detail_value__instance_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_detail_value__instance_id ON detail_values USING btree (instance_id);


--
-- Name: i_entities2details__detail_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_entities2details__detail_id ON entities2details USING btree (detail_id);


--
-- Name: i_entities2details__entity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_entities2details__entity_id ON entities2details USING btree (entity_id);


--
-- Name: i_instances__entity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_instances__entity_id ON instances USING btree (entity_id);


--
-- Name: i_links__child_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_links__child_id ON links USING btree (child_id);


--
-- Name: i_links__parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_links__parent_id ON links USING btree (parent_id);


--
-- Name: i_relations__child_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_relations__child_id ON relations USING btree (child_id);


--
-- Name: i_relations__parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX i_relations__parent_id ON relations USING btree (parent_id);


--
-- Name: account_type_values_account_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_type_values
    ADD CONSTRAINT account_type_values_account_type_id_fkey FOREIGN KEY (account_type_id) REFERENCES account_types(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: accounts_account_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_account_type_id_fkey FOREIGN KEY (account_type_id) REFERENCES account_types(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: databases_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY databases
    ADD CONSTRAINT databases_account_id_fkey FOREIGN KEY (account_id) REFERENCES accounts(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: date_detail_values_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY date_detail_values
    ADD CONSTRAINT date_detail_values_detail_id_fkey FOREIGN KEY (detail_id) REFERENCES details(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: date_detail_values_instance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY date_detail_values
    ADD CONSTRAINT date_detail_values_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES instances(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: ddl_detail_values_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ddl_detail_values
    ADD CONSTRAINT ddl_detail_values_detail_id_fkey FOREIGN KEY (detail_id) REFERENCES details(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: ddl_detail_values_detail_value_proposition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ddl_detail_values
    ADD CONSTRAINT ddl_detail_values_detail_value_proposition_id_fkey FOREIGN KEY (detail_value_proposition_id) REFERENCES detail_value_propositions(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: ddl_detail_values_instance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ddl_detail_values
    ADD CONSTRAINT ddl_detail_values_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES instances(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: detail_value_propositions_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detail_value_propositions
    ADD CONSTRAINT detail_value_propositions_detail_id_fkey FOREIGN KEY (detail_id) REFERENCES details(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: detail_values_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detail_values
    ADD CONSTRAINT detail_values_detail_id_fkey FOREIGN KEY (detail_id) REFERENCES details(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: detail_values_instance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detail_values
    ADD CONSTRAINT detail_values_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES instances(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: details_data_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY details
    ADD CONSTRAINT details_data_type_id_fkey FOREIGN KEY (data_type_id) REFERENCES data_types(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: details_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY details
    ADD CONSTRAINT details_database_id_fkey FOREIGN KEY (database_id) REFERENCES databases(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: details_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY details
    ADD CONSTRAINT details_status_id_fkey FOREIGN KEY (status_id) REFERENCES detail_status(id) ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;


--
-- Name: entities2details_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities2details
    ADD CONSTRAINT entities2details_detail_id_fkey FOREIGN KEY (detail_id) REFERENCES details(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: entities2details_entity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities2details
    ADD CONSTRAINT entities2details_entity_id_fkey FOREIGN KEY (entity_id) REFERENCES entities(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: entities2details_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities2details
    ADD CONSTRAINT entities2details_status_id_fkey FOREIGN KEY (status_id) REFERENCES detail_status(id) ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;


--
-- Name: entities_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT entities_database_id_fkey FOREIGN KEY (database_id) REFERENCES databases(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: fk_accounts_account_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT fk_accounts_account_type_id FOREIGN KEY (account_type_id) REFERENCES account_types(id) ON DELETE SET NULL;


--
-- Name: fk_databases_account_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY databases
    ADD CONSTRAINT fk_databases_account_id FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE;


--
-- Name: fk_date_detail_values__instance_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY date_detail_values
    ADD CONSTRAINT fk_date_detail_values__instance_id FOREIGN KEY (instance_id) REFERENCES instances(id) ON DELETE CASCADE;


--
-- Name: fk_ddl_detail_values__instance_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ddl_detail_values
    ADD CONSTRAINT fk_ddl_detail_values__instance_id FOREIGN KEY (instance_id) REFERENCES instances(id) ON DELETE CASCADE;


--
-- Name: fk_ddl_detail_values__proposition_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ddl_detail_values
    ADD CONSTRAINT fk_ddl_detail_values__proposition_id FOREIGN KEY (detail_value_proposition_id) REFERENCES detail_value_propositions(id) ON DELETE CASCADE;


--
-- Name: fk_detail_values__detail_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detail_values
    ADD CONSTRAINT fk_detail_values__detail_id FOREIGN KEY (detail_id) REFERENCES details(id) ON DELETE CASCADE;


--
-- Name: fk_detail_values__instance_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY detail_values
    ADD CONSTRAINT fk_detail_values__instance_id FOREIGN KEY (instance_id) REFERENCES instances(id) ON DELETE CASCADE;


--
-- Name: fk_details_data_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY details
    ADD CONSTRAINT fk_details_data_type_id FOREIGN KEY (data_type_id) REFERENCES data_types(id) ON DELETE CASCADE;


--
-- Name: fk_details_database_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY details
    ADD CONSTRAINT fk_details_database_id FOREIGN KEY (database_id) REFERENCES databases(id) ON DELETE CASCADE;


--
-- Name: fk_details_status_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY details
    ADD CONSTRAINT fk_details_status_id FOREIGN KEY (status_id) REFERENCES detail_status(id) ON DELETE CASCADE;


--
-- Name: fk_entities2details_detail_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities2details
    ADD CONSTRAINT fk_entities2details_detail_id FOREIGN KEY (detail_id) REFERENCES details(id) ON DELETE CASCADE;


--
-- Name: fk_entities2details_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities2details
    ADD CONSTRAINT fk_entities2details_entity_id FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE;


--
-- Name: fk_entities_database_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entities
    ADD CONSTRAINT fk_entities_database_id FOREIGN KEY (database_id) REFERENCES databases(id) ON DELETE CASCADE;


--
-- Name: fk_entity_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY instances
    ADD CONSTRAINT fk_entity_type FOREIGN KEY (entity_id) REFERENCES entities(id) ON DELETE CASCADE;


--
-- Name: fk_from_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY links
    ADD CONSTRAINT fk_from_id FOREIGN KEY (parent_id) REFERENCES instances(id) ON DELETE CASCADE;


--
-- Name: fk_from_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relations
    ADD CONSTRAINT fk_from_id FOREIGN KEY (parent_id) REFERENCES entities(id) ON DELETE CASCADE;


--
-- Name: fk_integer_detail_values__instance_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY integer_detail_values
    ADD CONSTRAINT fk_integer_detail_values__instance_id FOREIGN KEY (instance_id) REFERENCES instances(id) ON DELETE CASCADE;


--
-- Name: fk_invoices_account_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY invoices
    ADD CONSTRAINT fk_invoices_account_id FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE SET NULL;


--
-- Name: fk_relation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY links
    ADD CONSTRAINT fk_relation_id FOREIGN KEY (relation_id) REFERENCES relations(id) ON DELETE CASCADE;


--
-- Name: fk_relations__child_side_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relations
    ADD CONSTRAINT fk_relations__child_side_type_id FOREIGN KEY (child_side_type_id) REFERENCES relation_side_types(id) ON DELETE CASCADE;


--
-- Name: fk_relations__parent_side_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relations
    ADD CONSTRAINT fk_relations__parent_side_type_id FOREIGN KEY (parent_side_type_id) REFERENCES relation_side_types(id) ON DELETE CASCADE;


--
-- Name: fk_to_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY links
    ADD CONSTRAINT fk_to_id FOREIGN KEY (child_id) REFERENCES instances(id) ON DELETE CASCADE;


--
-- Name: fk_to_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relations
    ADD CONSTRAINT fk_to_id FOREIGN KEY (child_id) REFERENCES entities(id) ON DELETE CASCADE;


--
-- Name: fk_transfers_account_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT fk_transfers_account_id FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE;


--
-- Name: fk_transfers_detail_value_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT fk_transfers_detail_value_id FOREIGN KEY (detail_value_id) REFERENCES detail_values(id) ON DELETE SET NULL;


--
-- Name: fk_transfers_instance_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT fk_transfers_instance_id FOREIGN KEY (instance_id) REFERENCES instances(id) ON DELETE SET NULL;


--
-- Name: fk_transfers_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transfers
    ADD CONSTRAINT fk_transfers_user_id FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- Name: fk_users_account_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_users_account_id FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE;


--
-- Name: fk_users_user_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_users_user_type_id FOREIGN KEY (user_type_id) REFERENCES user_types(id) ON DELETE CASCADE;


--
-- Name: instances_entity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY instances
    ADD CONSTRAINT instances_entity_id_fkey FOREIGN KEY (entity_id) REFERENCES entities(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: integer_detail_values_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY integer_detail_values
    ADD CONSTRAINT integer_detail_values_detail_id_fkey FOREIGN KEY (detail_id) REFERENCES details(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: integer_detail_values_instance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY integer_detail_values
    ADD CONSTRAINT integer_detail_values_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES instances(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: links_child_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_child_id_fkey FOREIGN KEY (child_id) REFERENCES instances(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: links_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES instances(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: links_relation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_relation_id_fkey FOREIGN KEY (relation_id) REFERENCES relations(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: preferences_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY preferences
    ADD CONSTRAINT preferences_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: relations_child_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relations
    ADD CONSTRAINT relations_child_id_fkey FOREIGN KEY (child_id) REFERENCES entities(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: relations_child_side_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relations
    ADD CONSTRAINT relations_child_side_type_id_fkey FOREIGN KEY (child_side_type_id) REFERENCES relation_side_types(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: relations_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relations
    ADD CONSTRAINT relations_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES entities(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: relations_parent_side_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relations
    ADD CONSTRAINT relations_parent_side_type_id_fkey FOREIGN KEY (parent_side_type_id) REFERENCES relation_side_types(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: users_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_account_id_fkey FOREIGN KEY (account_id) REFERENCES accounts(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- Name: users_user_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_user_type_id_fkey FOREIGN KEY (user_type_id) REFERENCES user_types(id) ON UPDATE SET DEFAULT ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_info (version) VALUES (35)