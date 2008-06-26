--
-- PostgreSQL database dump
--

SET client_encoding = 'UNICODE';
-- SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE languages_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('languages_id_seq', 7, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: languages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE languages (
    lang text NOT NULL,
    active boolean DEFAULT false,
    id integer DEFAULT nextval('languages_id_seq'::regclass) NOT NULL
);


--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE translations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('translations_id_seq', 2272, true);


--
-- Name: translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE translations (
    id integer DEFAULT nextval('translations_id_seq'::regclass) NOT NULL,
    t_id text,
    value text,
    lang text,
    scope text DEFAULT 'system'::text,
    id_filter text,
    updated_at timestamp without time zone
);


--
-- Name: translator2language_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE translator2language_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: translator2language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('translator2language_id_seq', 18, true);


--
-- Name: translator2language; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE translator2language (
    id integer DEFAULT nextval('translator2language_id_seq'::regclass) NOT NULL,
    translator_id integer,
    language_id integer
);


--
-- Name: translators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE translators_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: translators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('translators_id_seq', 8, true);


--
-- Name: translators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE translators (
    id integer DEFAULT nextval('translators_id_seq'::regclass) NOT NULL,
    "login" text,
    deletor boolean DEFAULT false,
    coder boolean DEFAULT false
);


--
-- Name: translators_hints_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE translators_hints_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: translators_hints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('translators_hints_id_seq', 645, true);


--
-- Name: translators_hints; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE translators_hints (
    id integer DEFAULT nextval('translators_hints_id_seq'::regclass) NOT NULL,
    t_id text,
    notes text,
    urls text
);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO languages (lang, active, id) VALUES ('nl', true, 1);
INSERT INTO languages (lang, active, id) VALUES ('fr', true, 2);
INSERT INTO languages (lang, active, id) VALUES ('en', true, 3);
INSERT INTO languages (lang, active, id) VALUES ('it', true, 4);
INSERT INTO languages (lang, active, id) VALUES ('pt', true, 5);
INSERT INTO languages (lang, active, id) VALUES ('pt-br', true, 6);
INSERT INTO languages (lang, active, id) VALUES ('ru', true, 7);


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (932, 'madb_listing_translations', 'madb_listing_translations', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1152, 'madb_help_info_you_can_disable_help_in_your_settings', 'U kan dit help uitschakellen in uw instellingen', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1145, 'madb_help_info_you_can_disable_help_in_your_settings', 'You can disable this help in your settings', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1772, 'madb_p_submenu_content_products', '<p><b>Pour plus d''informations</b></p>
<p><a href="contact">Contactez-nous</a>, nous sommes également disponible pour le développement d''applications spécifiques!</p>', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1774, 'madb_p_submenu_content_products', '<p><b>For more informations</b></p>
<p><a href="contact">Contact us</a>, we are also available for development of specific applications!</p>', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1784, 'madb_p_contact', 'Contact', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1785, 'madb_p_contact', 'Contact', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1801, 'lastname', 'Nom de famille', 'fr', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1802, 'lastname', 'Familie naam', 'nl', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1808, 'nl', 'Nederlands', 'nl', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1810, 'next_page', 'Page suivante', 'fr', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1811, 'next_page', 'Volgende pagina', 'nl', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1812, 'next_page', 'Next page', 'en', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1813, 'previous_page', 'Pag eprécédente', 'fr', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1814, 'previous_page', 'Vorige pagina', 'nl', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1815, 'previous_page', 'Previous page', 'en', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1816, 'entity', 'Entiteit', 'nl', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1818, 'new_translation', 'Nouvelle traduction', 'fr', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1819, 'new_translation', 'Vertaling invoeren', 'nl', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1820, 'new_translation', 'New translation', 'en', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1821, 'reset', 'Herzetten', 'nl', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1822, 'reset', 'Réinitialiser', 'fr', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1823, 'reset', 'Reset', 'en', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1825, 'submit_all', 'Tout appliquer', 'fr', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1826, 'submit_all', 'Alles versturen', 'nl', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1827, 'submit_all', 'Submit all', 'en', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1829, 'find_translations_matching', 'Filter translations on', 'en', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1830, 'entity', 'Entité {{entity}}', 'fr', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1831, 'find_translations_matching', 'Afficher uniquement les traductions correspondat à', 'fr', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1832, 'find_translations_matching', 'Vertaling filtreren op', 'nl', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1833, 'create_new', 'Enter a new {{entity}}', 'en', 'system', '', '2006-03-26 16:27:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1834, 'create_new', 'Nieuw {{entity}} aanmaken', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1835, 'create_new', 'Ajout de {{entity}}', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1836, 'entity', 'Entity', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1837, 'en', 'English', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1838, 'cancel', 'Annuler', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1839, 'cancel', 'Annuleren', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1840, 'cancel', 'Cancel', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1841, 'fr', 'Français', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1842, 'admin_databases', 'Géstion des DBs', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1843, 'admin_databases', 'Manage DBs', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1844, 'admin_databases', 'Beheer van Dbs', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (935, 'madb_reset', 'madb_reset', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (942, 'madb_enter_id_of_the_translation', 'madb_enter_id_of_the_translation', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (956, 'madb_add_new', 'madb_add_new', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (958, 'madb_modify_entity', 'madb_modify_entity', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (959, 'madb_next_page', 'madb_next_page', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (960, 'madb_editing_translations', 'madb_editing_translations', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (961, 'madb_notes', 'madb_notes', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (962, 'madb_urls_where_translation_appears', 'madb_urls_where_translation_appears', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (964, 'madb_resize', 'madb_resize', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (967, 'madb_manage_translations', 'Gérer les traductions', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (948, 'madb_manage_translations', 'Vertalingen beheren', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (968, 'madb_manage_translations', 'Manage translations', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1080, 'madb_login', 'Login', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1148, 'madb_login', 'Login', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1025, 'madb_login', 'Login', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1081, 'madb_password', 'Mot de passe', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1149, 'madb_password', 'Paswoord', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1026, 'madb_password', 'Password', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1031, 'madb_name', 'Name', 'en', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1045, 'madb_name', 'Nom', 'fr', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1034, 'madb_name', 'Naam', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1150, 'madb_use', 'Utiliser', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1035, 'madb_use', 'Gebruiken', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1032, 'madb_use', 'Use', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (992, 'madb_my_databases', 'Mes bases de données', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (954, 'madb_my_databases', 'Mijn databanken', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1019, 'madb_my_databases', 'My databases', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1015, 'madb_admin_databases', 'Manage databases', 'en', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (988, 'madb_admin_databases', 'Gérer mes DBs', 'fr', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (950, 'madb_admin_databases', 'Databanken beheren', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1016, 'madb_admin_users', 'Manage users', 'en', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (989, 'madb_admin_users', 'Gérer les utilisateurs', 'fr', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (951, 'madb_admin_users', 'Gebruikers beheren', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1017, 'madb_settings', 'Settings', 'en', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (990, 'madb_settings', 'Préférences', 'fr', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (952, 'madb_settings', 'Instellingen', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1151, 'madb_help_info_you_can_disable_help_in_your_settings', 'Vous pouvez désactiver cette aide dans vos  préférences.', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (943, 'madb_new_translation', 'madb_new_translation', 'nl', 'system', '', '2006-07-22 12:59:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1018, 'madb_logout', 'Logout', 'en', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (991, 'madb_logout', 'Terminer', 'fr', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (953, 'madb_logout', 'Uitloggen', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1159, 'madb_help_info_database_list_entities', 'Cette page liste les objets définis dans la base de données que vous utilisez actuellement.', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1160, 'madb_help_info_database_list_entities', 'Die pagina geeft een lijst terug van gedefinieerde objecten in de databank die u gebruikt.', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1161, 'madb_help_info_database_list_entities', 'This page gives a list of entities (tables) defined in the current database.', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1058, 'madb_edit', 'Editer', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1166, 'madb_edit', 'Aanpassen', 'nl', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1113, 'madb_edit', 'Edit', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1164, 'madb_filter_on', 'Filtrer sur le champs', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1141, 'madb_filter_on', 'Filter on field', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1165, 'madb_with_value', 'dont la valeur correspond à', 'fr', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1142, 'madb_with_value', 'with value corresponding to', 'en', 'system', '', '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (999, 'madb_submit', 'Submit', 'en', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (972, 'madb_submit', 'Envoyer', 'fr', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (934, 'madb_submit', 'Versturen', 'nl', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1000, 'madb_reset', 'Reset', 'en', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (973, 'madb_reset', 'Remise à zéro', 'fr', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1105, 'madb_open_in_new_window', 'In new window', 'en', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1051, 'madb_open_in_new_window', 'Dans une nouvelle fenêtre', 'fr', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1114, 'madb_delete', 'Delete', 'en', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1059, 'madb_delete', 'Effacer', 'fr', 'system', NULL, '2006-03-26 16:27:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1049, 'madb_create_new_entity', 'Ajouter une nouvelle entrée {{entity_name}}', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1103, 'madb_create_new_entity', 'Add a new {{entity_name}}', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1006, 'madb_cancel', 'Cancel', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1046, 'madb_view', 'Afficher', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1112, 'madb_view', 'View', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1208, 'madb_help_info_entities_view_intro', 'Voici les détails de l''entrée sélectionnée. Notez qu''il n''y a que les champs ayant une valeur qui sont affichés! Les champs vide ne sont pas affiché. En suivant le lien d''édition, il vous sera possible d''éditer tous les champs de cette entrée.', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1207, 'madb_help_info_entities_view_intro', 'Here are the details of the record you selected. Note only fields with a value are displayed, empty fields are not displayed! Editing the entry will let you enter values for all fields of the record.', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1198, 'madb_related_entities', 'Related records', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1119, 'madb_submit_all', 'Submit all', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1199, 'madb_help_info_entities_views_related_entities', 'Below are displayed the entries related to the current entry.
<br>
Each list display the entries related with one relation
<br>
If the definition of the relation accepts that you link more entries, two links will be displayed that will let you link an existing entry or link a newly created entry.
<br>
Each list can be filtered and opened in a new window. It is also possible to display the details of a related entity thanks to the links displayed in the last columns of the lists.', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1172, 'madb_help_info_entities_views_related_entities', 'Ci-dessous se trouvent les entrées reliée a l''entrée sélectionnée.
<br>
Chacune des listes correspond à une relation vers d''autres entrées.<br>
Si la définition de la relation vous permet de lier d''autres entités, deux liens seront affichés qui vous permettront de relier une entrée existante ou une nouvelle entrée respectivement.
<br>
Chaque liste peut être filtrée et ouverte dans une nouvelle fenêtre. Il vous est également possible de directement afficher les détails d''une entrée liée à l''entrée actuelle grâce aux liens affichés dans les dernière colonne de la liste.', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1163, 'madb_help_info_entities_list_intro', '<p>Cette page liste les données actuellement présente dans table sélectionnée et vous donne un accès rapide à l''insertion d''une nouvelle entrée.</p>
<p>
La liste peut être limitée aux entrées correspondant au critère de recherche entré. Il vous suffit de choisir le champs et la valeur recherchée. Il est également possible d''ouvrir la liste dans une nouvelle fenêtre.
</p>
<p>
Les liens dans les dernières colonnes de la liste vous permettent de facilement visualiser ou éditer les détails d''une entrée,
</p>
', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1167, 'madb_help_info_entities_list_intro', '<p>This page lists the entries in the current table and lets you directly enter a new record</p>
<p>Records displayed can be filtered by choosing the field to filter on and entering the value you''re looking for. You can also open the list in a new window</p>
<p>
The links in the last columns give you easy access to view an record''s details, to edit an entry or to delete it.
</p>
</p>', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1171, 'madb_related_entities', 'Entrées liées', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1024, 'madb_please_login', 'Please log in', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1079, 'madb_please_login', 'Veuillez vous identifier', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1229, 'madb_register_for_an_account', 'S''enregister', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1225, 'madb_register_for_an_account', 'Sign up', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1040, 'madb_submit_all', 'Tout envoyer', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (963, 'madb_submit_all', 'Alles versturen', 'nl', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1230, 'mabd_forgot_your_password_question', 'Mot de passe perdu?', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1231, 'mabd_forgot_your_password_question', 'Passwoord vergeten?', 'nl', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1226, 'mabd_forgot_your_password_question', 'Forgot your password?', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1029, 'madb_madb', 'MyownDB', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1084, 'madb_madb', 'MaDB', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1232, 'madb_help', 'Aide', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1233, 'madb_help', 'Hulp', 'nl', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1234, 'madb_help', 'Help', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1021, 'madb_add_new', 'Enter new record', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (994, 'madb_add_new', 'Saisie d''une entrée', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1022, 'madb_search', 'Search', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (995, 'madb_search', 'Recherche', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (957, 'madb_search', 'Zoeken', 'nl', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1023, 'madb_modify_entity', 'Modifiy structure', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (996, 'madb_modify_entity', 'Modifier la structure', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1020, 'madb_admin_database', 'Administrate database', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (993, 'madb_admin_database', 'Administrer la DB', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (955, 'madb_admin_database', 'Databank beheren', 'nl', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1135, 'madb_unlink', 'Unlink', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1074, 'madb_unlink', 'Désassocier', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (979, 'madb_cancel', 'Annuler', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (941, 'madb_cancel', 'Annuleren', 'nl', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1168, 'madb_no_data_found', 'Aucune donnée à afficher', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1241, 'madb_no_data_found', 'No data to display', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1250, 'madb_searched_database', 'Base de données à utiliser', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1253, 'madb_searched_database', 'Database to search in', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1255, 'madb_searched_entity', 'Display records in ', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1251, 'madb_searched_entity', 'Rechercher les entrées de type', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1261, 'madb_searched_value', 'Valeur recherchée', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1262, 'madb_searched_value', 'Value searched', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1247, 'madb_choose_database', 'Sélectionnez la DB', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1264, 'madb_choose_database', 'Choose database', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1248, 'madb_all', 'Tous', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1266, 'madb_all', 'All', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1258, 'madb_searched_detail', 'Champs à examiner', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1259, 'madb_searched_detail', 'Field to search', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1269, 'madb_refresh', 'Rafraîchir', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1272, 'madb_refresh', 'Refresh', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1183, 'fr', 'Français', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1189, 'fr', 'Français', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1182, 'en', 'English', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1188, 'en', 'English', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1278, 'madb_help_info_search_index', '<p>The search functionality lets you find records from one database corresponding to the value you enter.</p>
<p>
The search can be done on one or all tables defined in the database. When you search only on table, you can also decide which field to examine during the search.
</p>
<p></p>', 'en', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1246, 'madb_help_info_search_index', 'La fonctionalité de recherche vous permet de retrouver les entrées d''une base de données correspondant à la valeur entrée.
<p>La recherche peut s''effectuer sur une seule ou toutes les tables définies  dans la base de données. Lorsque la recherche ne concerne qu''une table, il est possible de n''examiner qu''un champs lors de la recherche.</p>
', 'fr', 'system', '', '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1279, 'madb_enter_value_to_search_for', 'Enter a value to look for', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1249, 'madb_enter_value_to_search_for', 'Entrez la valeur à rechercher', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1295, 'madb_links', 'Associations', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1325, 'madb_link_existing_detail', 'Ajouter un champs basé sur un détail existant', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1326, 'madb_add_new_detail', 'Ajouter un champs basé sur un nouveau détail', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1324, 'madb_rename', 'Renommer', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1314, 'madb_data_type', 'Type', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1346, 'madb_links', 'Relations', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1357, 'madb_to_parents', 'Relations to parents', 'en', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1306, 'madb_to_parents', 'Associations vers les parents', 'fr', 'system', NULL, '2006-03-26 16:27:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1347, 'madb_to_children ', 'Relations to children', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1296, 'madb_to_children ', 'Associations vers les enfants', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1298, 'madb_relation_name', 'Nom de l''association', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1349, 'madb_relation_name', 'Relation name', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1350, 'madb_child', 'Child', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1299, 'madb_child', 'Enfant', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1352, 'madb_multiple_children_allowed', 'May one parent have multiple children', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1301, 'madb_multiple_children_allowed', 'Un parent peut-il avoir plusieurs enfants', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1303, 'madb_yes_many_children_allowed', 'oui, une entrée {{parent_entity}} peut être associée a plusieurs entrées {{child_entity}}', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1354, 'madb_yes_many_children_allowed', 'yes, a {{parent_entity}} can be linked to multiple {{child_entity}}', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1300, 'madb_multiple_parents_allowed', 'Un enfant peut-il avoir plusieurs parents', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1351, 'madb_multiple_parents_allowed', 'May a child have multiple parents', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1413, 'madb_from_child_to_parent_relation_name', 'Nom de l''association de <span class="no_css_child_name">{{child_entity}}</span> à <span class="no_css_parent_name">{{parent_entity}}</span>
', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1411, 'madb_from_child_to_parent_relation_name', 'Name of relation from <span class="no_css_child_name">{{child_entity}}</span> to <span class="no_css_parent_name">{{parent_entity}}</span>', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1368, 'madb_can_one_child_entity_have_several_parents_question', 'Une entrée <span class="no_css_child_name">{{child_entity}}</span> peut-elle être associée à plusieurs <span class="no_css_parent_name">{{parent_entity}}</span>', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1385, 'madb_can_one_child_entity_have_several_parents_question', 'Can one <span class="no_css_child_name">{{child_entity}}</span>  be linked to several <span class="no_css_parent_name">{{parent_entity}}</span>', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1386, 'madb_can_one_parent_entity_have_several_children_question', 'Can one <span class="no_css_parent_name">{{parent_entity}}</span>  be linked to several <span class="no_css_child_name">{{child_entity}}</span>', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1369, 'madb_can_one_parent_entity_have_several_children_question', 'Une entrée <span class="no_css_parent_name">{{parent_entity}}</span> peut-elle être associée à plusieurs <span class="no_css_child_name">{{child_entity}}</span>', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1210, 'madb_add_new_related_entity', 'Associer une nouvelle entrée {{entity}}', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1201, 'madb_add_new_related_entity', 'Link a new {{entity}}', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1060, 'madb_really_delete_entity_question', 'Effacer l''entrée {{entity}} avec {{title}} {{value}}?', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1335, 'madb_show_detail_spec', 'Detail specs', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1284, 'madb_show_detail_spec', 'Spécifications du détails', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1336, 'madb_show_detail_spec_link_title', 'Show the specifications of the detail used to define this field.', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1285, 'madb_show_detail_spec_link_title', 'Affiche les spécification du détail utilisé pour définir ce champs', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1337, 'madb_edit_entity_to_detail', 'Change field specs', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1286, 'madb_edit_entity_to_detail', 'Modifier le champs', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1338, 'madb_edit_entity_to_detail_link_title', 'Toggle field''s display in list', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1287, 'madb_edit_entity_to_detail_link_title', 'Décidez de l''affichage du champs dans les listes', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1339, 'madb_unlink_detail_from_entity', 'Remove', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1288, 'madb_unlink_detail_from_entity', 'Effacer le champs', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1340, 'madb_unlink_detail_from_entity_link_title', 'Remove filed and all its values', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1431, 'madb_no_only_one_child_allowed', 'Non, une entrée {{parent_entity}} ne peut être associée qu''à une entrée {{child_entity}}
', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1432, 'madb_no_only_one_child_allowed', 'No, a {{parent_entity}} can be linked to only one {{child_entity}}', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1305, 'madb_add_link_to_child_entity', 'Définir une nouvelle association vers une entité enfant', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1356, 'madb_add_link_to_child_entity', 'Define a new relation to a child entity', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1361, 'madb_add_link_to_parent_entity', 'Define a new relation to a parent entity', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1310, 'madb_add_link_to_parent_entity', 'Définir une nouvelle association vers une entité parente', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1415, 'madb_parent_entity', 'Parent', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1434, 'madb_parent_entity', 'Parent', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1382, 'madb_child_entity', 'Child', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1365, 'madb_child_entity', 'Enfant', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1344, 'madb_link_existing_detail', 'Add field based on existing detail', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1345, 'madb_add_new_detail', 'Add field based on new detail', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1343, 'madb_rename', 'Rename', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1283, 'madb_details_for_entity', 'Champs de la table {{entity}}', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1334, 'madb_details_for_entity', 'Fields for table {{entity}}', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1341, 'madb_input_form_is_publicly_accessible', 'Make input form public', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1290, 'madb_input_form_is_publicly_accessible', 'Publier le formulaire de saisie', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1342, 'madb_public_form_will_be_available_at', 'The form will be available at ', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1291, 'madb_public_form_will_be_available_at', 'Le formulaire sera accessible à ', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1280, 'madb_entity', '{{entity}}', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1332, 'madb_entity', '{{entity}}', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1355, 'madb_confirm_delete_all_links', 'Deleting this relation will delete all links of this type between records. Do you want to continue?', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1304, 'madb_confirm_delete_all_links', 'Effacer cette association supprimera tous les liens correspondant entres les entrées dans les tables. Voulez-vous continuer?', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1436, 'madb_define_link', 'Modification de la relation entre {{parent}} et {{child}}', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1435, 'madb_define_link', 'Modify the relation between {{parent}} and {{child}}', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1437, 'madb_help_info_admin_entities_edit_link', 'You can modify existing relations, with certain restrictions though:
<ul>
<li>you can''t change the table it relates to</li>
<li>the sides of the relation that accept many records can''t be changed to only accept one record ("to many" relations can''t be changed in "to one" relations)</li>
</ul>', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1438, 'madb_help_info_admin_entities_edit_link', 'Vous pouvez modifier une association existante, avec certaines limitations:
<ul>
<li>vous ne pouvez pas changer la table associée</li>
<li>vous ne pouvez modifier une association acceptant plusieurs entrées en une associations n''accdeptant qu''une entrée (pour le plus techniciens: une  association "to many" ne peut être modifiée en une association "to one")</li>
</ul>', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1363, 'madb_help_info_admin_entities_define_link', 'Vous pouvez spécifier toutes les caractéristiques d''une nouvelle association:
<ul>
<li>la table associée</li>
<li>le nom de l''association, dans chaque sens</li>
<li>le type de l''association, dans chaque sens</li>
</ul>', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1380, 'madb_help_info_admin_entities_define_link', 'You can enter all specifications of a new relation:
<ul>
<li>the associated table</li>
<li>the name of the association,in each direction</li>
<li>the type of the relation, in each direction</li>
</ul>', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1446, 'madb_help_info_entities_edition', 'You can here edit a record and specify a value for each field.', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1456, 'madb_help_info_settings_show_intro', 'Vous pouvez modifier vos préférences, et par exemple désactiver l''affichage de cette aide.', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1462, 'madb_help_info_settings_show_intro', 'You can modify your settings, for example deactivating this help.', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1459, 'madb_enter_your_new_password_below', 'Entrez votre nouveau mot de passe ci-dessous', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1457, 'madb_display_info_help', 'Afficher l''aide intégrée', 'fr', 'system', '', '2006-07-30 16:28:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1464, 'madb_enter_your_new_password_below', 'Enter your new password  below', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1460, 'madb_choose_password', 'Votre nouveau mot de passe', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1466, 'madb_choose_password', 'Your new password', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1461, 'madb_confirm_password', 'Confirmez votre nouveau mot de passe', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1468, 'madb_confirm_password', 'Confirm your new password', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1472, 'madb_change_password', 'Change password', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1458, 'madb_change_password', 'Changez votre mot de passe', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1391, 'madb_entities', 'Tables', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1451, 'madb_entities', 'Tables', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1392, 'madb_details', 'Details', 'en', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1452, 'madb_details', 'Details', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1453, 'madb_destroy', 'Supprimer', 'fr', 'system', NULL, '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1474, 'madb_really_delete_database_question', 'Etes-vous sur de vouloir effacer la base de données {{database}}?', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1475, 'madb_really_delete_database_question', 'Are you sure you want to delete the database {{database}}?', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1473, 'madb_create_database', 'Créer une nouvelle base de données.', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1480, 'madb_create_database', 'Create a new database.', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1483, 'madb_help_info_admin_details_list', 'Voici la liste des détails définis pour la base de données active. Un detail est utilisé pour définir les champs des tables de la base de données. <br>
Le type du détail (texte court, texte long, choix dans une liste, email, etc) influencera son affichage dans le formulaire de saisie (les textes longs sont affichés dans un cadre de texte) et dans la liste.(les email sont affiché sous forme de lien).<br>', 'fr', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1485, 'madb_help_info_admin_details_list', 'Here is the list of details defined for the active database. A detail is used to define the fields of the tables in that database.<br>
The type of the detail (short text, long text, choice in list, email, etc) influences the display in the form (long text in text areas) and in the lists (emails are displayed as links)<br>', 'en', 'system', '', '2006-03-26 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1484, 'madb_define_new_detail', 'Entrer un nouveau détail', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1487, 'madb_define_new_detail', 'Define a new detail', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1479, 'madb_show', 'Afficher', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1489, 'madb_show', 'Show', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1374, 'madb_data_type', 'Type', 'en', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1312, 'madb_help_info_admin_details_show', 'Voici les spécifications du détail: son nom et le type de donnée.<br> Les possibilités d''éditions d''un détail existant sont limitées.', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1419, 'madb_help_info_admin_details_show', 'Here are the specs of the detail: its name and data type. The scope of changes possible to an existing detail is limited.', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1396, 'madb_yes', 'Yes', 'en', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1320, 'madb_yes', 'Oui', 'fr', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1495, 'madb_administrate', 'Administrer', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1397, 'madb_administrate', 'Administrate', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1401, 'madb_no', 'No', 'en', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1321, 'madb_no', 'Non', 'fr', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1497, 'madb_new_entity', 'Créer une table', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1402, 'madb_new_entity', 'Create table', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1503, 'madb_entities_list', '{{db}}: list des tables', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1504, 'madb_entities_list', '{{db}}: list of tables', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1498, 'madb_help_info_admin_entities_list', 'Cette page liste les tables définies dans la base de données active. Chaque table peut être:
<ul>
<li>administrée, c''est-à-dire ajouter des champs à la table, la renommer, modifier ses association  avec d''autres tables , etc..</li>
<li>effacée. Attention, cela efface toutes les données contenues dans la table! </li>
</ul>', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1395, 'madb_help_info_admin_entities_list', 'This page lists all tables for the currently active database. Each table can be 
<ul>
<li>admistrated, this means you can add fields to the table, rename it, modify it links with other tables, etc</li>
<li>deleted. Note that deleting a table deletes all the data it contains!</li>
</ul>', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1393, 'madb_destroy', 'Delete', 'en', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1494, 'madb_help_info_admin_details_value_propositions_for_edit', 'Il n''est actuellement pas possible de modifier la liste de propositions.', 'fr', 'system', '', '2006-07-30 16:20:40');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1477, 'madb_edit_database', 'Modification d''une base de données', 'fr', 'system', '', '2006-07-30 16:27:58');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1330, 'madb_help_info_admin_entities_show_intro', '<p>You can here define the fields of the tables in your databases by reusing a detail already defined in the database, or by defining a new detail (that you''ll be able to reuse to define fields of other tables).</p>
<p>The order of the fields can be changed by drag and drop, and this order will be used in all displays (list, drop down lists)</p>
<p>
For each field, three links let you
<ul>
<li>visualise the caractéristics of the detail used to define this field(eg its type:date, text, choice in a list of propositions) .</li>
<li>enter the caracteristics of the field itself (eg is it displayed in lists, can it have multiple values)</li>
<li>remove the field from the table. This doesn''t delete the detail that was used to define the field (you can reuse the detail to define other fields)</li>
</ul>
</p>
<p>
You can also decide to publish the entry form for this table outside this application.
</p>', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1281, 'madb_help_info_admin_entities_show_intro', '<p>Vous pouvez définir les champs  des tables de votre base de données en réutilisant un détail déja défini dans la base de données, ou en définissant un nouveau détail (que vous pourrez alors réutiliser pour définir les champs d''autres tables).
</p>
<p>L''ordre d''affichage des details peut-être modifié par glisser-déposer, et sera appliqué dans tous les affichages (liste et  boîtes de sélections)</p>
<p>Pour chaque champs de la table, trois liens vous permettens de 
<ul>
<li>visualiser les caractéristiques du détail utilisé pour définir le champs(par exemple son type: date, texte, choix dans une liste, ...),</li>
<li>préciser les caractéristique du champs de cette tables (affichage dans les listes, multiples valeurs autorisée</li> 
<li>retirer le champs de la table. Cette opération n''efface pas le détail, de sorte que vous pouvez le réutiliser pour définir d''autres champs.</li>
</ul>
</p>
<p>Il est également possible de spécifier que le formulaire d''entrée de cette table peut-être accéder à l''extérieur de cette application</p>', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1348, 'madb_help_info_admin_entities_show_links_to_other_entities', '<p>A record in a table can be associated with other records in the same or a different table. In the example of a customers database, a contact is associated with a company.
</p>
<p>
Below you can define the relations in which the current table is used.  A relation, by definition, has a parent side and a child side. This distinction is necessary to be able to define the type of the relation in both directions: from parent to child and from child to parent.
<ul>
<li>
Can a parent record be linked to multiple children record, and vice-versa? For example, a customer can be linked to multiple invoices, but an invoice can only be link to one customer. The choice to label one table as the parent side and the other as a child side is up to the database administrator.
</li>
</ul>
', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1297, 'madb_help_info_admin_entities_show_links_to_other_entities', '<p>Une entrée dans une table peut être associée à une ou plusieurs entrées dans la même table ou dans une table différente. Dans l''exemple d''une base de donnée client, un contact est associé à une société.
</p>
<p>
Vous pouvez définir ce-dessous les associations impliquant la table actuelle. Une association lie, par définition, une entité parent à une entité enfant. Cette distincion est nécéssaire pour pouvoir préciser le type d''association dans les deux sens: de parent à enfant et d''enfant à parent.
<ul>
<li> Une entrée parent peut-elle être associée à différentes entrées enfant, et vice-versa? Un client peut être associé à différentes factures, mais une facture ne peut être associée qu''à un client. Notez que le choix incombe à l''administrateur de la base de donnée quant au choix de l''entité parent et enfant dans une association.
</li>
</ul>
Ci-dessous sont listées les associations impliquant la table actuelle. vous pouvez ajouter, effacer et modifier des associations. ', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1517, 'madb_help_info_admin_entities_add_existing_choose', 'Choisissez le détail à utiliser pour définir le nouveau champs.', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1508, 'madb_help_info_admin_entities_add_existing_choose', 'Choose the detail to use to define the new field.', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1317, 'madb_help_info_spec_of_detail_for_entity', 'Préciser si le champs doit apparaître dans les listes. Acutellement, une seule valeur peut-être entrée pour un champs.', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1426, 'madb_help_info_spec_of_detail_for_entity', 'Please configure if the field shold be displayed in lists. Currently only one value can be entered for a field.', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1428, 'madb_displayed_in_list_view', 'Shoudl the field be displayed in lists?', 'en', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1319, 'madb_displayed_in_list_view', 'Le champs doit-il être affiché dans les listes?', 'fr', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1322, 'madb_maximum_number_of_values', 'Nombre de valeur acceptée par ce champs:', 'fr', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1429, 'madb_maximum_number_of_values', 'Number of values that can be entered for this field:', 'en', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1523, 'madb_really_unlink_detail_question', 'Voulez-vous vraiment effacer le champs {{detail}}?', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1521, 'madb_really_unlink_detail_question', 'Really remove field {{detail}}?', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1449, 'madb_help_info_admin_databases_list', 'Voici la liste des bases de données existantes. Pour chaque base de données, vous pouvez accéder aux tables et détails définis. Un détails est utilisé pour définir les champs des tables, et peut-être utilisé plusieurs fois. Vous pouvez aussi renommer ou effacer chaque base de données.', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1389, 'madb_help_info_admin_databases_list', 'Here is the list of existing databases.
For each database you can access the tables and details defined. Details are used to define the fields of the tables, and each detail can be used several times in several tables. You can also rename and delete each database.', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1535, 'madb_help_info_admin_details_value_propositions_for_new', 'Ce type de détail n''acceptera que les valeurs que vous précisez ci-dessous. Ce détail sera affiché comme une liste déroulante dans le formulaire de saisie.', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1375, 'madb_help_info_admin_details_value_propositions_for_new', 'This type of detail only accepts the value that you define below. The detail will be displayed as a drop down list in the entry form.', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1537, 'madb_quick_submit', 'Ajout rapide', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1378, 'madb_quick_submit', 'Quick submit', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1539, 'madb_remove_propositions', 'Effacer la proposition', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1376, 'madb_remove_propositions', 'Remove proposition', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1541, 'madb_add_proposition', 'Ajouter la proposition', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1377, 'madb_add_proposition', 'Add proposition', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1372, 'madb_help_info_admin_details_new', 'When creating a detail, you can give it a name, and specify a data type.
The type of the detail has implications on the values accepted and the display of the value in the application (a detail of type email only accepts valid email addresses as value, and is displayed as a link).
', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1533, 'madb_help_info_admin_details_new', 'Lors de la création d''un détail, vous pouvez lui donner un nom et spécifier le type de donnée lui étant associé.
Le type du détail  a une implication sur les valeurs acceptées et la représentation du détail dans l''application (un détail de type email n''accepte que des valeurs correspondan à une adresse email valide, et est représenté comme lien).
', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1549, 'madb_help_info_admin_details_new_quick_commit', 'Le bouton "Ajout rapide" vous permet d''immédiatement ajouter un champs basé sur ce nouveau détail. Ce champs sera affiché dans les listes et n''acceptera qu''une valeur. Si ces paramètres par défaut ne vous conviennent pas, vous pouvez utiliser le bouton standard, qui vous permettra de préciser vos propres paramètres.', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1550, 'madb_help_info_admin_details_new_quick_commit', 'The quick commit button lets you immediately add a field based on this new detail. The field will be displayed in lists and accept only one values. If you don''t want to use these defaults, you can use the standard submit button. ', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1556, 'madb_delete_detail_question', 'Etes-vous sûr de vouloir effacer le detail {{detail}}?', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1555, 'madb_delete_detail_question', 'Are you sure you want to delete the detail {{detail}}?', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1388, 'madb_databases_list', 'Existing databases', 'en', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1448, 'madb_databases_list', 'Bases de données existantes', 'fr', 'system', NULL, '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1574, 'madb_lastname', 'Nom de famille', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1566, 'madb_lastname', 'Lastname', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1575, 'madb_firstname', 'Prénom', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1565, 'madb_firstname', 'Firstname', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1577, 'madb_email_confirmation', 'Confirmez l''adresse email', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1572, 'madb_email_confirmation', 'Confirm the email address', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1578, 'madb_user_type', 'Profil utilisateur', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1567, 'madb_user_type', 'User profile', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1580, 'madb_email', 'Email', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1579, 'madb_email', 'Email', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1582, 'madb_new_users', 'Ajouter de nouveaux comptes', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1571, 'madb_new_users', 'Add new accounts', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1584, 'madb_delete_user_question', 'Supprimmer le login {{login}}?', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1583, 'madb_delete_user_question', 'Really delete login {{login}}?', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1594, 'madb_user_verified', 'Compte validé?', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1593, 'madb_user_verified', 'Accoun validated?', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1595, 'madb_reset_password', 'Réinitialiser le mot de passe', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1569, 'madb_reset_password', 'Reset password', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1597, 'madb_create_user', 'Créer un compte', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1596, 'madb_create_user', 'Create an account', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1598, 'madb_users_was_successfully_created', 'Le compte a été créé.', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1599, 'madb_users_was_successfully_created', 'Account has been created.', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1606, 'madb_notice_password_updated', 'Mot de passe mis a jour', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1607, 'madb_notice_password_updated', 'Password updated', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1602, 'madb_password_reset_mail_sent', 'Un mail a été envoyé avec le nouveau mot de passe.', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1610, 'madb_you_dont_have_sufficient_credentials_for_action', 'Vous n''avez pas les droits nécessaire pour effectuer cette opération!', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1611, 'madb_you_dont_have_sufficient_credentials_for_action', 'You don''t have the rights necessary to perform this operation!', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1620, 'madb_page', 'Page', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1621, 'madb_page', 'Page', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1601, 'madb_password_reset_mail_sent', 'A mail has been sent with the new password.', 'en', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1613, 'madb_mail_password_change_intro', 'Suite à votre demande ou à l''administrateur de votre compte, voici un nouveau mot de passe pour votre compte MaDB.net. Nous vous conseillons de modifier ce mot de passe lors de votre première connection.

Veuillez vous authentifier grâce à ces données:', 'fr', 'system', '', '2006-03-26 16:27:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1614, 'madb_mail_password_change_intro', 'At your request or your administrator''s request, here is your new password for your account on MyOwnDB.net.We advise you to change your password at your first login.

Your new login credentials are:', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1627, 'madb_enter_your_email_address_to_have_a_new_password_sent_to_you', 'Entrez votre adresse électronique pour recevoir un courriel avec les informations nécessaire pour obtenir un nouveau mot de passe.', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1626, 'madb_enter_your_email_address_to_have_a_new_password_sent_to_you', 'Enter your email address and we''ll send you a mail with instructions to get a new password.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1629, 'madb_forgotten_password', 'Mot de passe oublié', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1625, 'madb_forgotten_password', 'Lost password', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1631, 'madb_reset_password_title', 'J''ai oublié mon mot de passe et voudrais en changer!', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1630, 'madb_reset_password_title', 'I forgot my password, and I want to change it.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1636, 'forgotten_password_mail_intro', 'Siute à votre demande ou celle de votre administrateur, votre mot de passe a été réinitialisé. Veuillez vous authentifier avec les données suivantes:', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1634, 'forgotten_password_mail_intro', 'At your request, or at your administrator''s request, your password has been reset. If it was not at your request, then you should be aware that someone has entered your email address as theirs in the forgotten password section of MyOwnDB.net.

Your new credentials are:



', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1638, 'madb_forgotten_password_mail_outro', 'Nous vous conseillons de changer immédiatement de mot de passe en cliquant sur "Préférences" dans le menu.', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1639, 'madb_forgotten_password_mail_outro', 'It''s advisable for you to change your password as soon as you login. It''s as simple as navigating to ''Settings''.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1617, 'madb_mail_outro', 'Nous vous remercions pour votre confiance, et nous tenons à votre disposition.

L''équipe de MaDB.net', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1641, 'madb_new_password_could_not_be_mailed', 'Le courriel n''a pas pu être envoyé à {{email}}', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1642, 'madb_new_password_could_not_be_mailed', 'The mail could not be sent to {{email}}', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1645, 'madb_new_password_sent', 'Un nouveau mot de passe a été envoyé à {{mail}}', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1644, 'madb_new_password_sent', 'The new password was sent to {{mail}}', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1648, 'madb_could_not_find_account_with_email', 'Nous n''avons pas pu retrouver un compte avec l''adress électronique {{mail}}.', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1647, 'madb_could_not_find_account_with_email', 'We could not find an account with email {{mail}}.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1649, 'madb_account_verified', 'Votre accompte est maintenant confirmé. Vous pouvez désormais vous authentifier.', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1650, 'madb_account_verified', 'Your account is now verified, and you can log in the application.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1664, 'madb_choose_password_creation', 'Mot de passe', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1665, 'madb_choose_password_creation', 'Password', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1667, 'madb_confirm_password_creation', 'Confirmation du mot de passe', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1668, 'madb_confirm_password_creation', 'Password confirmation', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1670, 'madb_company_name', 'Société', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1654, 'madb_company_name', 'Company', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1671, 'madb_company_street', 'Adresse', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1655, 'madb_company_street', 'Address', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1672, 'madb_company_zip_code', 'Code postal', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1656, 'madb_company_zip_code', 'Zip code', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1673, 'madb_company_city', 'Ville', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1657, 'madb_company_city', 'City', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1658, 'madb_company_country', 'Country', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1674, 'madb_company_country', 'Pays (liste en anglais)', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1545, 'madb_choose', 'Choisissez', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1509, 'madb_choose', 'Choose', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1675, 'madb_account_signup', 'Créez votre compte', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1652, 'madb_account_signup', 'Signup', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1676, 'madb_company', 'Société', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1653, 'madb_company', 'Company', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1677, 'madb_administrator_user', 'Compte administrateur', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1660, 'madb_administrator_user', 'Administrator user', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1678, 'madb_signup', 'Créer mon compte', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1573, 'madb_signup', 'Signup', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1683, 'madb_your_login_information_is', 'Pour rappel, voici votre login. Le mot de passe est celui que vous avez entré lors de la création de votre compte.', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1684, 'madb_your_login_information_is', 'Here is your login, and the password is the one you entered at the creation of your account.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1686, 'madb_please_confirm_your_registration_by_clicking_on_this_link', 'Suivez ce lien pour confirmer votre inscription. ', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1681, 'madb_please_confirm_your_registration_by_clicking_on_this_link', 'Follow this link to confirm your account:', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1689, 'madb_this_entity_has_no_detail_displayed_in_list_view_and_this_will_show_theses_lists_as_empty', 'Cette table n''a aucun champs affiché dans les listes, et ces listes apparaitront vide, même si des entrées existent!', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1688, 'madb_this_entity_has_no_detail_displayed_in_list_view_and_this_will_show_theses_lists_as_empty', 'This table has no detail displayed in lists, and those list will appear as empty, though records may exist in the database.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1691, 'madb_has_public_form', 'Public entry form?', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1690, 'madb_has_public_form', 'Formulaire de saisie public?', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1115, 'madb_really_delete_entity_question', 'Really delete {{entity}} with {{title}} {{value}}?', 'en', 'system', NULL, '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1692, 'madb_really_delete_entity_table_question', 'Effacer la table {{name}}?', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1693, 'madb_really_delete_entity_table_question', 'Drop table {{name}}?', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1482, 'madb_details_list', '{{database}}: liste de détails définis', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1532, 'madb_details_list', '{{database}}: list of existing details', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1695, 'madb_no_instance_found', 'Aucune donnée à afficher.', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1696, 'madb_no_instance_found', 'No data to display.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1698, 'madb_password_must_be_five_chars_and_equal_to_confirmation', 'Votre passe doit comprendre au moins 5 caractères, et sa valeur doit être confirmée.', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1699, 'madb_password_must_be_five_chars_and_equal_to_confirmation', 'Your password must be at least 5 characters long, and you must confirm its value.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1700, 'madb_this_is_a_popup_window_warning', 'This is a popup window!', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1701, 'madb_this_is_a_popup_window_warning', 'Attention, ceci n''est pas la fenêtre principale de l''application!', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1271, 'madb_click_here_to_disply_main_window', 'Afficher la fenêtre principal', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1703, 'madb_click_here_to_disply_main_window', 'Focus main window', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1705, 'madb_an_error_occured', 'Une erreur a eu lieu au cours de l''opération.', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1706, 'madb_an_error_occured', 'An error occured during the requested operation.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1708, 'madb_error_record_already_linked', 'Les deux entrées que vous essayez d''associer le sont déja.', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1709, 'madb_error_record_already_linked', 'The records you want to link are already linked.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1717, 'madb_no_only_one_parent', 'Non', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1718, 'madb_no_only_one_parent', 'No', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1715, 'madb_yes_multiple_child', 'Yes', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1714, 'madb_yes_multiple_child', 'Oui', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1712, 'madb_no_only_one_child', 'No', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1711, 'madb_no_only_one_child', 'Non', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1308, 'madb_yes_many_parents_allowed', 'oui, une entrée {{child_entity}} peut être associée a plusieurs entrées {{parent_entity}}', 'fr', 'system', NULL, '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1359, 'madb_yes_many_parents_allowed', 'yes, a {{child_entity}} can be linked to multiple {{parent_entity}}', 'en', 'system', NULL, '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1720, 'madb_yes_multiple_parent', 'Oui', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1721, 'madb_yes_multiple_parent', 'Yes', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1726, 'madb_short_text', 'Texte court', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1723, 'madb_short_text', 'Short text', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1727, 'madb_date', 'Date', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1724, 'madb_date', 'Date', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1728, 'madb_long_text', 'Texte long', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1725, 'madb_long_text', 'Long text', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1729, 'madb_integer', 'Nombre entier', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1730, 'madb_integer', 'Integer number', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1732, 'madb_choose_in_list', 'Choix dans une liste de proposition', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1733, 'madb_choose_in_list', 'Choice in proposition list', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1737, 'madb_normal_user', 'Accès en lecture et écriture', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1735, 'madb_normal_user', 'Read/write access', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1738, 'madb_primary_user', 'Accès administrateur', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1736, 'madb_primary_user', 'Administrator', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1739, 'madb_entries_found_but_no_details_to_be_displayed_in_list', 'Des entrées existent, mais aucun champs n''est configuré pour être affiché dans les listes. Contactez votre administrateur pour modifier la configuration.', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1740, 'madb_entries_found_but_no_details_to_be_displayed_in_list', 'Records were found, but no fields is configured to be displayed in lists. Please contact your administrator.', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1200, 'madb_link_to_existing_entity', 'Link an existing {{entity}}', 'en', 'system', NULL, '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1209, 'madb_link_to_existing_entity', 'Associer une entrée {{entity}} existante', 'fr', 'system', NULL, '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1158, 'madb_entity_menu_link_title', 'Affiche la liste des {{entity}}', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1147, 'madb_entity_menu_link_title', 'Display list of {{entity}}', 'en', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1157, 'madb_database_menu_link_title', 'Afficher la liste des tables', 'fr', 'system', '', '2006-03-26 16:27:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1146, 'madb_database_menu_link_title', 'Display table list', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1245, 'madb_help_info_entities_edition', 'Vous pouvez ici éditer une entrée, et spécifier une valeur pour chaque champs.', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1289, 'madb_unlink_detail_from_entity_link_title', 'Effacer le champs et les valeurs associées', 'fr', 'system', NULL, '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1441, 'madb_create_new', 'Insérez une entrée {{entity}}', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1744, 'madb_create_new', 'Enter a new {{entity}}', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1410, 'madb_from_parent_to_child_relation_name', 'Name of relation from <span class="no_css_parent_name">{{parent_entity}}</span> to <span class="no_css_child_name">{{child_entity}}</span>', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1412, 'madb_from_parent_to_child_relation_name', 'Nom de l''association de <span class="no_css_parent_name">{{parent_entity}}</span> à <span class="no_css_child_name">{{child_entity}}</span>', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1746, 'madb_no_only_one_parent_allowed', 'Non, une entrée {{child_entity}} ne peut être associée qu''à une entrée {{parent_entity}}
', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1747, 'madb_no_only_one_parent_allowed', 'No, a {{child_entity}} can be linked to only one {{parent_entity}}', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1130, 'madb_busy', 'Busy', 'en', 'system', NULL, '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1069, 'madb_busy', 'Occupé', 'fr', 'system', NULL, '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1749, 'madb_error_data_not_found', 'Les données demandée n''ont pu être trouvées.', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1742, 'madb_error_data_not_found', 'Requested data could not be found.', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1268, 'madb_error_data_incorrect', 'La requête effectuée est invalide (paramètres invalides).', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1750, 'madb_error_data_incorrect', 'The request was invalid (invalid parameters).', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1102, 'madb_list', 'List of {{entity}}', 'en', 'system', NULL, '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1047, 'madb_list', 'Liste des {{entity}}', 'fr', 'system', NULL, '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1125, 'madb_entity_details', 'Details of the {{entity}}', 'en', 'system', NULL, '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1065, 'madb_entity_details', 'Détails de l''entrée {{entity}}', 'fr', 'system', NULL, '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1753, 'madb_add_and_instance', 'Ajoutez une nouvelle entrée {{entity}}', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1752, 'madb_add_and_instance', 'Enter a new {{entity}}', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1755, 'madb_search_results', 'Search results', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1754, 'madb_search_results', 'Résultats de la recherche', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1756, 'madb_list_of_databases', 'Liste des bases de données', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1757, 'madb_list_of_databases', 'List of databases', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1759, 'madb_admin_entity', 'Définition de la table {{entity}}', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1760, 'madb_admin_entity', 'Definition of table {{entity}}', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1763, 'madb_web_url', 'Adresse d''un site web', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1764, 'madb_web_url', 'Website address', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1371, 'madb_new_detail_title', 'New detail', 'en', 'system', NULL, '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1543, 'madb_new_detail_title', 'Nouveau détail', 'fr', 'system', NULL, '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1857, 'madb_p_blog', 'Blog', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1858, 'madb_p_blog', 'Blog', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1859, 'madb_p_demos', 'Captures d''écrans et Démos', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1860, 'madb_p_demos', 'Screenshots and Demos', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1861, 'madb_p_home', 'Accueil', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1862, 'madb_p_home', 'Home', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1865, 'madb_p_products_services', 'Produits et Services', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1866, 'madb_p_products_services', 'Products and Services', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1869, 'madb_p_homepage_title', 'MyOwnDB, the web database', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1870, 'madb_p_homepage_title', 'MaDB.net: la base de données web', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1771, 'madb_p_main_content_products', '<h2>Products</h2>
Currently, the application is only available as a demo. The application will shortly be available in different configurations:
<ul>
<li><b>Web application</b>: once you have created your account on MyOwnDB.com, you can use the application. This is the standard proposition, which is the easiest to get access to as it uses the existing infrastructure.</li>
<li><b>Dedicated Server</b>: this allows you to have your data stored on one of our servers, but that is only used by you. Access to the application can also be limited to your office network.</li>
<li><b>On site Server</b>: this configuration allows you to have the application running on one of your servers</li>
</ul>
<h2>Services</h2>
We propose services to help you better manage your data:
<ul>
<li><b>Custom Development</b>: if you have specific needs, we can possibly integrate your request in the development cycle of the standard application available at <a href="http://www.myowndb.com">MyOwnDB.com</a>. Or we can also adapt the application very precisely in the dedicated server or onsite configurations described above.</li>
<li><b>Data organisation</b>: we can help you organise and structure your data to ease its management with MyOwnDB. A good data structure is very important, as it is the foundation on which you build your knowledge! We can advise on how to structure your data.</li>
<li><b>New translations</b>:If you want to use the application in a language not yet available, we can help.</li>
</ul>

<a href="contact">Contact us</a> for more information!', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1769, 'madb_p_main_content_products', '<h2>Produits</h2>
Actuellement, l''application MaDB.net est disponible en démonstration uniquement.
L''application sera très bientôt  proposée en plusieurs configurations:
<ul>
<li><b>Application web</b>: après avoir créé votre compte sur MaDB.net, vous utilisez l''application mise à disposition sur le web. Ceci est l''offre standard et la plus accessible car utilisant l''infrastructure en place..</li>
<li><b>Serveur dédié</b>: cette offre vous permet de stocker vos données sur un de nos serveur qui n''est utilisé que par vous. L''accès au serveur peut également être limité (par exemple, n''accepter que les connections venant de votre entreprise).</i>
<li><b>Serveur sur Site</b>: cette offre vous permet d''avoir l''application MaDB.net tournant sur votre serveur, dans vos locaux. Cette offre est la plus flexible pour le client.</li>
</ul>

<h2>Services</h2>
Nous proposons différents services dans le but de vous apporter une meilleure gestion de vos données:
<ul>
<li><b>Développements spécifiques</b>: si vous avez des demandes spécifques, nous pourrons éventuellement les intégrer dans le cycle de développement de l''application dispobible à <a href="http://www.madb.net">MaDB.net</a>. Ou nous pouvons adapter très précisément l''application dans les configurations "Serveur dédié" ou "Serveur sur Site" décrites ci-dessus.</li>
<li><b>Organisation des données</b>: nos pouvons vous aider à organiser et structurer vos données. Une bonne structure de données est vraiment très importante car elle apporte la fondation sur laquelle vous pouvez construire vos sonnaissances! Nous pouvons vous conseiller sur la structuration de vos données.</li>
<li><b>Nouvelles Traductions</b>: Si vous devez utiliser MaDB.net dans une langue non proposée, nous pouvons vous aider.</li>
</ul>

Pour plus d''information, vous pouvez nous <a href="contact">contacter</a>.

', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1800, 'madb_p_submenu_content_demos', '<p><b>About the demos</b></p>
<p>Demos will be updated with new releases of the application if the feature shown in the demo has changed. Cosmetic changes will not trigger the update of the demo.</p>', 'en', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1799, 'madb_p_submenu_content_demos', '<p><b>A propos des démos</b></p>
<p>Les démos seront adaptées lors de mises à jours de l''application si la fonctionalité illustrée est modifiée. Des modification "cosmétiques" de l''application ne provoqueront pas la mise a jour de la démo.</p>', 'fr', 'system', '', '2006-03-26 16:27:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1873, 'madb_p_submenu_content_contact', '<p><b>Contactez-nous!</b></p>
<p>Que ce soit pour une demande d''information ou une remarque, nous nous ferons un devoir de traiter votre communication avec la plus grande attention.</p>', 'fr', 'system', '', '2006-03-26 17:45:48');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1874, 'madb_p_submenu_content_contact', '<p><b>Contact us!</b></p>
<p>When you send us a mail, be it a request for information or a remark, you can be sure it will be treated with due attention.</p>', 'en', 'system', '', '2006-03-26 17:45:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1876, 'madb_browser_demo_login_message_ie', 'MaDB.net est optimisé pour Firefox. Faites-vous une faveur et utilisez ce navigateur supportant les derniers standards!', 'fr', 'system', '', '2006-03-27 22:53:48');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1877, 'madb_browser_demo_login_message_ie', 'MyOwnDB.com is optimised for Firefox. Do yourself a favour and use a browser supporting modern standards!', 'en', 'system', '', '2006-03-27 22:53:49');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1682, 'madb_welcome_to_myowndb', 'Bienvenue sur MaDB.net!
Dès que vous aurez confirmé votre compte en suivant le lien ci-dessous, vous aurez accès aux outils MaDB.net vous permettant de gérer vos données en lignes.', 'fr', 'system', '', '2006-03-30 11:44:54');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1679, 'madb_welcome_to_myowndb', 'Welcome to MyOwnDB.com!
Once you have verified your account by following the link below, you''ll have access to the tools made available on MyOwnDB.com to let you manage your data online.', 'en', 'system', '', '2006-03-30 11:44:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1154, 'madb_help_info_database_list', 'U vind op die pagina de lijst van bestaande databanken om te kiezen welke u wilt gebruiken.', 'nl', 'system', '', '2006-03-30 12:03:36');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1144, 'madb_help_info_database_list', 'You find on this page the list of existing databases and you can choose which one you want to use. If this is the first time you use the application, you have to create a database through the entry "Manage databases" at the top of the screen. ', 'en', 'system', '', '2006-03-30 12:03:37');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1153, 'madb_help_info_database_list', 'Vous retouvez sur cette page la liste des bases de données définies et choisir laquelle vous voulez utiliser. S''il s''agit de votre première utilisation de l''application, vous devez d''abord créer votre première base de données en cliquant sur l''entrée "Gérer mes DBs" dans la barre au sommet de l''écran.', 'fr', 'system', '', '2006-03-30 12:03:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1882, 'madb_login_unsuccessful_account_not_yet_verified', 'Votre compte n''a pas encore été confirmé. Lors de votre inscription, vous avez reçu un mail vous demandant de confirmer votre inscription en suivant simplement un lien. Une fois votre compte confirmé, vous pourrez vous authentifier.', 'fr', 'system', '', '2006-03-30 12:23:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1883, 'madb_login_unsuccessful_account_not_yet_verified', 'Your account hasn''t been verified yet. Please be sure to follow the instructions in the mail sent when you signed up. You should first confirm your account, and you''ll then be able to log in successfully.', 'en', 'system', '', '2006-03-30 12:23:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1885, 'madb_login_unsuccessful', 'Login ou mot de passe incorrect.', 'fr', 'system', '', '2006-03-30 12:27:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1886, 'madb_login_unsuccessful', 'Login failed. Check you entered your login and password correctly.', 'en', 'system', '', '2006-03-30 12:27:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1888, 'madb_login_successful', 'Authentification réussie!', 'fr', 'system', '', '2006-03-30 12:27:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1889, 'madb_login_successful', 'Login successful!', 'en', 'system', '', '2006-03-30 12:27:46');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1891, 'madb_an_error_prevented_the_creation_of_your_account', 'Une erreur a empeché la création de votre compte. Les administrateurs du services ont été prévenus.', 'fr', 'system', '', '2006-03-30 12:35:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1892, 'madb_an_error_prevented_the_creation_of_your_account', 'An error prevented the creation of your account. The administrators of the service have been notified.', 'en', 'system', '', '2006-03-30 12:35:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1894, 'madb_account_type_free', 'Gratuit', 'fr', 'system', '', '2006-03-30 16:20:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1895, 'madb_account_type_free', 'Free', 'en', 'system', '', '2006-03-30 16:20:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1903, 'madb_account_type_signup', 'Type d''abonnement', 'fr', 'system', '', '2006-03-30 17:04:53');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1904, 'madb_account_type_signup', 'Subscription level', 'en', 'system', '', '2006-03-30 17:04:54');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1906, 'madb_error_saving_database', 'La base de données n''a pu être créée', 'fr', 'system', '', '2006-03-30 17:39:25');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1907, 'madb_error_saving_database', 'The database could not be created', 'en', 'system', '', '2006-03-30 17:39:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1909, 'madb_limit_of_account_reached', 'Vous avez atteint les limites de votre abonnement. Il est peut-être temps de passer à un niveau d''abonnement supérieur. Vous trouverez toutes les informations sous la rubrique "Préférences" dans le coin supérieur droit de l''écran.  Merci pour votre intense utilisation de MaDB.net!', 'fr', 'system', '', '2006-03-30 17:46:11');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1910, 'madb_limit_of_account_reached', 'You have reached the limits of your subscription level. Please evaluate upgrading to a higher level. You''ll find all necessary information in your settings. Thanks for your intensive use of MyOwnDB.com!', 'en', 'system', '', '2006-03-30 17:46:12');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1912, 'madb_error_saving_user', 'Erreur dans la création de l''utilisateur', 'fr', 'system', '', '2006-03-31 12:15:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1913, 'madb_error_saving_user', 'Error creating the user', 'en', 'system', '', '2006-03-31 12:15:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1915, 'madb_password_too_short', 'Mot de passe trop court (minimum 5 caractères)', 'fr', 'system', '', '2006-03-31 12:16:10');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1916, 'madb_password_too_short', 'Password too short (minimum 5 characters)', 'en', 'system', '', '2006-03-31 12:16:11');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1918, 'madb_login_too_short', 'Login trop court (êtes-vous sûr qu''il s''agit d"une adresse émail valide?)', 'fr', 'system', '', '2006-03-31 12:17:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1919, 'madb_login_too_short', 'Login too short (are you sure this is a valid email address?)', 'en', 'system', '', '2006-03-31 12:17:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1921, 'madb_login_not_a_valid_email', 'Votre login doit être une adresse email valide!', 'fr', 'system', '', '2006-03-31 12:18:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1922, 'madb_login_not_a_valid_email', 'Your login has to be a valid email address!', 'en', 'system', '', '2006-03-31 12:18:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1924, 'madb_login_already_taken', 'Ce login existe déja. Si vous avez oublié votre mot de passe vous pouvez le récupérer depuis la page de login.', 'fr', 'system', '', '2006-03-31 12:19:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1925, 'madb_login_already_taken', 'This login is already taken. If you forgot your password, you can reinitialise it from the login page.', 'en', 'system', '', '2006-03-31 12:19:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1927, 'madb_login_cannot_be_blank', 'Le mot de passe ne peut pas être vide!', 'fr', 'system', '', '2006-03-31 12:20:02');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1928, 'madb_login_cannot_be_blank', 'The password cannot be blank!', 'en', 'system', '', '2006-03-31 12:20:03');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1930, 'madb_login_not_confirmed', 'La confirmation du login ne correspond pas.', 'fr', 'system', '', '2006-03-31 12:21:41');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1933, 'madb_password_and_confirmation_needed', 'Veillez à bien entrer votre mot de passe et sa confirmation', 'fr', 'system', '', '2006-03-31 12:22:47');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1934, 'madb_password_and_confirmation_needed', 'Please check you typed your password and its confirmation', 'en', 'system', '', '2006-03-31 12:22:47');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1936, 'madb_password_not_confirmed', 'Veuillez entrer la confirmation de votre mot de passe.', 'fr', 'system', '', '2006-03-31 12:23:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1937, 'madb_password_not_confirmed', 'Please confirm your password.', 'en', 'system', '', '2006-03-31 12:23:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1897, 'madb_number_of_databases', 'Nombre de bases de données', 'fr', 'system', '', '2006-08-28 21:06:49');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1939, 'madb_error_in_account', 'Erreur dans la création de la société (voir ci-dessus)', 'fr', 'system', '', '2006-03-31 12:24:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1940, 'madb_error_in_account', 'Error in the creation of the company (see above)', 'en', 'system', '', '2006-03-31 12:24:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1942, 'madb_enter_account_name', 'Entrez un nom de société ou d''organisation(entrez vos nom/prénom si vous êtes un particulier)', 'fr', 'system', '', '2006-03-31 12:26:22');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1945, 'madb_choose_country', 'Indiquez votre pays', 'fr', 'system', '', '2006-03-31 12:26:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1946, 'madb_choose_country', 'Indicate your country', 'en', 'system', '', '2006-03-31 12:26:52');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1948, 'madb_unlimited_number_of_users', 'Illimité', 'fr', 'system', '', '2006-03-31 12:27:43');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1949, 'madb_unlimited_number_of_users', 'Unlimited', 'en', 'system', '', '2006-03-31 12:27:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1951, 'madb_error_saving_account', 'Erreur dans l''insertion de votre société', 'fr', 'system', '', '2006-03-31 12:28:55');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1952, 'madb_error_saving_account', 'Error creating your company', 'en', 'system', '', '2006-03-31 12:28:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1954, 'madb_select_account_type', 'Votre choix:', 'fr', 'system', '', '2006-03-31 12:30:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1955, 'madb_select_account_type', 'your choice:', 'en', 'system', '', '2006-03-31 12:30:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1931, 'madb_login_not_confirmed', 'Login confirmation isn''t correct.', 'en', 'system', '', '2006-03-31 12:32:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1943, 'madb_enter_account_name', 'Enter your company or organisation name (if this is a personal account, enter your fist and last name)', 'en', 'system', '', '2006-03-31 12:35:24');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1958, 'madb_login_email', 'Email (Will be your login):', 'en', 'system', '', '2006-03-31 12:38:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1957, 'madb_login_email', 'Email (Sera votre login):', 'fr', 'system', '', '2006-03-31 12:38:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1879, 'madb_welcom_to_madb_signup_subject', '[MaDB] - Bienvenue sur MaDB.net', 'fr', 'system', '', '2006-03-31 12:42:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1880, 'madb_welcom_to_madb_signup_subject', '[MyOwnDB] - Welcome to MyOwnDB.com', 'en', 'system', '', '2006-03-31 12:42:36');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1960, 'tos_acceptance_needed', 'Vous devez  indiquer que vous avez lu et compris et que vous acceptez les conditions d''utilisation (Terms of Service) rédigées en Anglais.', 'fr', 'system', '', '2006-03-31 15:23:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1961, 'tos_acceptance_needed', 'You must agree to the Terms of Service', 'en', 'system', '', '2006-03-31 15:23:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1964, 'madb_tos_accepted', 'I have read and accept the <a class="link" href="/TOS.html">Terms of Service</a>', 'en', 'system', '', '2006-03-31 15:54:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1963, 'madb_tos_accepted', 'J''ai lu et compris et j''accepte les <a class="link" href="/TOS.html">conditions d''utilisation</a> rédigées en Anglais ', 'fr', 'system', '', '2006-03-31 15:54:07');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1966, 'madb_host', 'www.madb.net', 'fr', 'system', '', '2006-04-01 12:02:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1967, 'madb_host', 'www.myowndb.com', 'en', 'system', '', '2006-04-01 12:02:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1379, 'madb_define_new_link', 'Define the new link', 'en', 'system', NULL, '2006-04-01 14:23:05');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1362, 'madb_define_new_link', 'Définition d''une association', 'fr', 'system', NULL, '2006-04-01 14:23:20');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1969, 'madb_change_password_subject', '[MaDB] Changement de mot de passe', 'fr', 'system', '', '2006-04-03 21:32:42');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1970, 'madb_change_password_subject', '[MyOwnDB] New password', 'en', 'system', '', '2006-04-03 21:32:42');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1972, 'madb_forgot_password_subject', '[MaDB]: oubli de votre mot de passe', 'fr', 'system', '', '2006-04-03 21:33:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1973, 'madb_forgot_password_subject', '[MyOwnDB]: forgotten password', 'en', 'system', '', '2006-04-03 21:33:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1618, 'madb_mail_outro', 'We thank you for using our services, and stay at your service.

The MyOwnDB.com team.', 'en', 'system', '', '2006-04-03 21:50:02');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1787, 'madb_p_submenu_content_home', '<p><b>A propos</b><p>
<p>MaDB.net est une application web exploitant les dernières technoligies pour proposer une application dynamique.</p><p><b><a href="/app/authentication/demo_login">Essayez la démo</a>!</b></p>', 'fr', 'system', '', '2006-04-04 10:33:40');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1788, 'madb_p_submenu_content_home', '<p><b>About</b>:<p>
<p>MyOwnDB.com is a web application using the latest development techniques to provide a dynamic interface.</p><p><b><a href="/app/authentication/demo_login">Test the demo</a>!</b></p>', 'en', 'system', '', '2006-04-04 10:33:42');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1975, 'madb_new_database_title', 'Création d''une nouvelle Base de Donnée', 'fr', 'system', '', '2006-04-04 10:35:55');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1623, 'madb_new_database_title', 'Creation of a new Database', 'en', 'system', '', '2006-04-04 10:35:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1976, 'madb_error_incorrect_data', 'Requête incorrecte.', 'fr', 'system', '', '2006-04-04 21:35:52');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1387, 'madb_error_incorrect_data', 'Incorrect request.', 'en', 'system', '', '2006-04-04 21:35:54');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1977, 'madb_detail_name_cannot_be_id', 'Le nom du détail ne peut actuellement être "id".', 'fr', 'system', '', '2006-04-05 20:56:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1978, 'madb_detail_name_cannot_be_id', 'The name of the detail may currently not be "id".', 'en', 'system', '', '2006-04-05 20:56:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1980, 'madb_error_saving_detail', 'Problème de sauvegarde du détail.', 'fr', 'system', '', '2006-04-05 20:57:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1981, 'madb_error_saving_detail', 'Problem saving the detail.', 'en', 'system', '', '2006-04-05 20:57:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1983, 'madb_duplicate_detail_name_in_db', 'Un détail du même nom existe déja dans cette base de données.', 'fr', 'system', '', '2006-04-05 21:52:36');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1984, 'madb_duplicate_detail_name_in_db', 'A detail with the same name already exists in this database.', 'en', 'system', '', '2006-04-05 21:52:36');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1986, 'madb_detail_name_cannot_be_empty', 'Le nom du détail ne peut être laissé blanc.', 'fr', 'system', '', '2006-04-05 21:54:15');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1987, 'madb_detail_name_cannot_be_empty', 'The detail name cannot be blank.', 'en', 'system', '', '2006-04-05 21:54:15');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1315, 'madb_help_info_admin_details_value_propositions_for_show', 'Voici les propositions pour ce détail', 'fr', 'system', '', '2006-04-05 22:19:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1420, 'madb_help_info_admin_details_value_propositions_for_show', 'Here are the value propositions for this detail', 'en', 'system', '', '2006-04-05 22:19:37');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1989, 'madb_account_activation_impossible_because_not_found', 'Votre compte n''a pu être vérifié. Vérifiez-que le lien qui vous a été envoyé est bien affiché sur une ligne. Vous pouvez essayer de copier l''adresse du lien et la coller dans la bare d''adresse de votre navigateur internet. Si le problème persiste, veuillez contacter <a href="mailto:admin@madb.net">admin@madb.net</a>', 'fr', 'system', '', '2006-04-07 21:42:52');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1990, 'madb_account_activation_impossible_because_not_found', 'You account could not be verified. Check that the link sent to you is displayed on one line in you mail client. You can also try to copy the address of the link sent to you, and paste it in the address bar of your browser. If the problem persists, please contact <a href="mailto:admin@myowndb.com">admin@myowndb.com</a>.', 'en', 'system', '', '2006-04-07 21:42:52');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1992, 'madb_export', 'Exporter ces données', 'fr', 'system', '', '2006-04-08 18:56:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1993, 'madb_export', 'Export these data', 'en', 'system', '', '2006-04-08 18:56:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1442, 'madb_insertion_was_successful', 'Vos données ont été enregistrées.', 'fr', 'system', '', '2006-04-09 13:51:40');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1995, 'madb_insertion_was_successful', 'Your data has been saved.', 'en', 'system', '', '2006-04-10 21:11:11');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1867, 'madb_p_latest_news', '<p><i>Dernière mise à jour:</i></p>
<p><b>File upload available! <a href="/demos/file_uploads.html">Visualisez la démo!</a></b>', 'fr', 'system', '', '2006-07-20 22:56:49');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1871, 'madb_p_main_content_contact', '<h2>Contacts</h2>

Pour tous vos commentaires, remarques, suggestions, requêtes d''information, vous pouvez  envoyer un courriel à <a href="mailto:info@madb.net">info@madb.net</a> ou le formulaire ci-dessous, généré par l''application madb.net.<br>
Nous vous répondrons dans les plus brefs délais.


<iframe src="http://www.madb.net/app/entities/public_form/838" style="height:22em;width:100%;border:0px"></iframe>', 'fr', 'system', '', '2006-04-10 21:09:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1872, 'madb_p_main_content_contact', '<h2>Contact</h2>

For all your feedback, remarks, suggestions, enquiries, please send a mail to <a href="mailto:info@madb.net">info@madb.net</a> or  use the form below, generated by the MyOwnDB application. You can expect a fast answer.

<iframe src="http://www.madb.net/app/entities/public_form/838" style="height:22em;width:100%;border:0px"></iframe>', 'en', 'system', '', '2006-04-10 21:09:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1997, 'madb_p_submenu_content_post_to_delicious', '<a href="http://del.icio.us/post" onclick="window.open(''http://del.icio.us/post?v=4&noui&jump=close&url=''+encodeURIComponent(location.href)+''&title=''+encodeURIComponent(document.title), ''delicious'',''toolbar=no,width=700,height=400''); return false;">Sauvez sur del.icio.us</a>', 'fr', 'system', '', '2006-04-11 13:13:12');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1998, 'madb_p_submenu_content_post_to_delicious', '<a href="http://del.icio.us/post" onclick="window.open(''http://del.icio.us/post?v=4&noui&jump=close&url=''+encodeURIComponent(location.href)+''&title=''+encodeURIComponent(document.title), ''delicious'',''toolbar=no,width=700,height=400''); return false;"> Save on del.icio.us</a>', 'en', 'system', '', '2006-04-11 13:13:13');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2000, 'madb_number_of_records_in_list', '{{number}} elements', 'fr', 'system', '', '2006-04-14 12:52:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2001, 'madb_number_of_records_in_list', '{{number}} items', 'en', 'system', '', '2006-04-14 12:52:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2003, 'madb_p_submenu_content_social_bookmarking', 'Bookmarkez Madb.net', 'fr', 'system', '', '2006-04-14 15:52:58');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2004, 'madb_p_submenu_content_social_bookmarking', 'Bookmark MyOwnDB.com', 'en', 'system', '', '2006-04-14 15:52:58');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1863, 'madb_p_main_content_home', '<img src="/images/myowndb-head.gif">
<h2>Qu''est donc MaDB.net?</h2>
<p>MaDB.net est une application web dont le but est de vous faciliter la gestion de vos données. Vous pouvez comparer l''application à une base de données (dans laquelle vous pouvez définir la structure de vos données) vous fournissant immédiatement une intérface utilisateur vous permettant de gérer vos données.</p>

<div id="signup_frame"> <a href="/app/authentication/signup">Enregistrez-vous!</a></div>

<h2>Quels sont les avantages?</h2>
<p>MaDB.net a plusieurs avantages par rapport aux applications habituelles:
<ul>
<li><b>interface web</b>: vos données sont <i>accessible</i> d''où que vous soyez: bureau, maison, hotel, .... Des développements futus vous permettront de <i>partager</i> vos données si vous le désirez.</li>
<li><b>multi-utilisateurs</b>: Vous gérez les utilisateurs ayant accès à l''application. Et pas besoin qu''ils soient à coté de vous pour entrer leur mot de passe, entrez simplement leur adress email et ils recevront des instructions détaillées.!</li>
<li><b>facile à configurer</b>: <i>Un navigateur internet suffit</i> pour profiter des avantages de maDB.net comme utilisateur (manipulant les données) ou comme administrateur (définissant les données stockées).</li>
<li><b>facile à utiliser</b>: l''application a été développée dans le but de vous faciliter la saisie, la modification et la recherche de vos données. vous ne devriez jamais avois besoin de plus de deux clics de souris pour atteindre la fonctionalité voulue!</li>
<li><b>multilingue</b>: tout le monde ne parle pas anglais, et l''interface de l''application est multilingue, avec le fraçais et l''anglais disponible dès maintenant. Les définitions des données (noms des tables, des champs,...) seront bientôt multilingues également.</li>
<li><b>aide intégrée</b>: des explications sont intégrées dans l''interface pour vous aider à rapidement maîtriser l''outil. Une fois l''aide superflue, vous pouvez désactiver son affichage dans vos préférences.</li>
</ul>', 'fr', 'system', '', '2006-04-14 16:13:55');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1864, 'madb_p_main_content_home', '<img src="/images/myowndb-head.gif">
<h2>What is MyownDB?</h2>
<p>Myowndb is a web application with the goal to let you manage your data easily. You can view it as a database with which you get an interface to enter, modify, delete and search data once you''ve define its structure.</p>
<div id="signup_frame"> <a href="/app/authentication/signup">Sign up!</a></div>

<h2>What are the advantages?</h2>
<p>MyOwnDB has several advantages compared to usual applications:
<ul>
<li><b>web-based</b>: this means that your data is <i>accessible</i> from anywhere: your work, your home, your hotel. Further development of the application will also let you <i>share your data</i> easily.</li>
<li><b>multi-user</b>: you can manage users having access to the application. And no need to have them present in the next cubicle: just enter their email address and they''ll get instructions sent to them!</li>
<li><b>easy to configure</b>: All you need is a browser to take advantage of the application as a user (manipulating the data) or as an administrator (defining the structure of the data).</li>
<li><b>easy to use</b>: the application has been developed to make entering, searching and organising data easy. Getting to the functionality you need shouldn''t take more than 2 clicks!</li>
<li><b>multi-lingual</b>: not everybody speak english, and the application''s interface is multi-lingual, with french and english currently available. data definitions (table names, field names,...) will soon also be definable in multiple languages.</li>
<li><b>integrated help</b>: Helping text is integrated in the interface to help you master the tool rapidly. Once the help becomes unnecessary, you can deactivated it in your settings.</li>
</ul>', 'en', 'system', '', '2006-04-14 16:13:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2009, 'madb_welcome_to_myowndb_paying_account', 'Bienvenue sur madb.net!

Vous trouverez ci-dessous les informations concernant votre compte utilisateur.', 'fr', 'system', '', '2006-04-22 15:07:19');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2010, 'madb_welcome_to_myowndb_paying_account', 'Welcome to MyOwnDB!

you''ll find below the information about your account.
', 'en', 'system', '', '2006-04-22 15:07:19');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2007, 'madb_we_have_received_your_first_payment_and_account_is_activated.', 'We have received your first payment and your account has been activated. You can login at :', 'en', 'system', '', '2006-04-22 15:10:03');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2006, 'madb_we_have_received_your_first_payment_and_account_is_activated.', 'Nous avons réceptionné votre premier paiement et votre compte est maintenant activé. Vous pouvez  vous authentifier en suivant ce lien:', 'fr', 'system', '', '2006-04-22 15:10:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2015, 'madb_your_current_subscription_plan', 'Vous utilisez actuellement un abonnement <span class="subscription_type">{{subscription}}</span>.', 'fr', 'system', '', '2006-05-04 21:38:46');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2016, 'madb_your_current_subscription_plan', 'You''re currently using a subscription <span class="subscription_type">{{subscription}}</span>', 'en', 'system', '', '2006-05-04 21:38:46');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2021, 'madb_mail_account_expired', 'Cher utilisateur,

votre compte utilisateur sur MaDB.net est arrivé à expiration. Nous regrettons de vous perdre comme utilisateur, mais espérons que de futur développpement vous ferons changer d''avis. Si vous avez des reproches ou remarques à propos de l''application nous apprécierions que vous preniez le temps de nous les transmettre à info@madb.net.

En espérant vous revoir bientôt sur http://www.madb.net

L''équipe de MaDB.net', 'fr', 'system', '', '2006-05-06 11:12:09');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2022, 'madb_mail_account_expired', 'Dear user,

You account on MyOwnDB has expired. We regret to loose you as a user, but hope that futur developments will make you change your mind. If you have remarks about the application, we would appreciate if you took the time to share them with us by sending a mail to info@myowndb.com.

Hoping to see you back soon on http://www.myowndb.com

the MyOwnDB team.', 'en', 'system', '', '2006-05-06 11:12:09');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2024, 'madb_eot_subject', 'Expiration de votre complet MaDB.net', 'fr', 'system', '', '2006-05-06 11:16:09');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2025, 'madb_eot_subject', 'MyOwnDB Account expired', 'en', 'system', '', '2006-05-06 11:16:09');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2027, 'madb_login_not_allowed_for_account_contact_admin', 'Authentification non acceptée. Veuillez contacter admin@madb.net.', 'fr', 'system', '', '2006-05-07 12:07:13');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2028, 'madb_login_not_allowed_for_account_contact_admin', 'Ahtentication not accepted, please contact admin@myowndb.com.', 'en', 'system', '', '2006-05-07 12:07:13');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2030, 'madb_excluding_vat', 'hors TVA', 'fr', 'system', '', '2006-05-28 20:17:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2031, 'madb_excluding_vat', 'excluding VAT', 'en', 'system', '', '2006-05-28 20:17:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2033, 'madb_vat_explanations', '<!--NO NEW LINES NI THIS OR IT BREAKS THE INTERFACE-->Si vous êtes localisé <string>en dehors de l''Union européenne</strong>, vous ne paierez <strong>aucune TVA</strong>.<br/>Si vous agissez au nom d''une <strong>société<strong> établie dans l''Union européenne, fournir votre numéro TVA vous permettra de ne pas payer la TVA sur le prix d''abonnement à madb.net. Pour les sociétés belges, 21% de TVA seront ajoutés, mais pourront être récupéré.<br>Si vous agissez en tant que <strong>particulier établis dans l''Union Européenne, 21% de TVA </strong>seront ajoutés au prix de l''abonnement.', 'fr', 'system', '', '2006-06-04 16:59:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2034, 'madb_vat_explanations', '<!--NO NEW LINES NI THIS OR IT BREAKS THE INTERFACE-->If you''re subscribing from <strong>outside the European Union</strong>, <string>no VAT</strong> will be applied.<br/>If you''re subscribing in the name of a <strong>company</strong> established in the European Union, filling in your VAT number will allow you to not pay VAT on your subscriptions. Belgian companies have to pay 21% VAT.<br>If you''re subscribing as an <strong>individual</strong> established in the European union, 21% VAT will be added to the price of the subscription.', 'en', 'system', '', '2006-06-04 16:59:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2041, 'madb_pay_with_paypal', 'Payer avec Paypal.', 'fr', 'system', '', '2006-06-04 17:24:10');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2042, 'madb_pay_with_paypal', 'Pay with Paypal.', 'en', 'system', '', '2006-06-04 17:24:10');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2036, 'madb_click_button_to_subscribe_through_paypal', 'Cliquez sur le bouton suivant pour vous abonnez à madb.net pour {{amount}} euros par mois. Vous pouvez annuler votre abonnement à tout moment, mais aucun remboursement ne sera effectué.', 'fr', 'system', '', '2006-06-04 17:25:43');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2037, 'madb_click_button_to_subscribe_through_paypal', 'Click the button below to subscribe to myowndb.com for {{amount}} euros paid monthly. You can cancel your subscription any time, but no refund is possible.', 'en', 'system', '', '2006-06-04 17:25:43');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2044, 'madb_company_vat', 'Numéro de TVA', 'fr', 'system', '', '2006-06-04 18:50:11');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2045, 'madb_company_vat', 'VAT registration number', 'en', 'system', '', '2006-06-04 18:50:12');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2047, 'madb_back_to_vat_change', 'Retour aux informations de TVA', 'fr', 'system', '', '2006-06-04 18:52:25');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2048, 'madb_back_to_vat_change', 'Back to VAT information', 'en', 'system', '', '2006-06-04 18:52:25');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2051, 'madb_your_registered_vat_number_confirm_or_change', 'Here is the VAT number that will be used for invoicing. Please confirm or update the data, and you''ll be taken to the upgrade page.', 'en', 'system', '', '2006-06-04 19:01:13');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2053, 'madb_account_not_active_or_cancelled', 'Compte inactif ou annullé.', 'fr', 'system', '', '2006-06-04 20:41:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2054, 'madb_account_not_active_or_cancelled', 'Account inactive or cancelled.', 'en', 'system', '', '2006-06-04 20:41:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2060, 'madb_monthly_fee', 'Prix mensuel', 'fr', 'system', '', '2006-06-07 22:42:25');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2056, 'madb_monthly_fee', 'Monthly fee', 'en', 'system', '', '2006-06-07 22:42:26');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2050, 'madb_your_registered_vat_number_confirm_or_change', 'Voici les données TVA qui seront utilisées pour la facturation. Veuillez confirmer ou adapter ces données, et vous serez ensuite redirigé vers la page des mise à jours.', 'fr', 'system', '', '2006-07-13 21:32:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2061, 'madb_error_creating_instance', 'Problème pour sauvegarder la nouvelle entrée', 'fr', 'system', '', '2006-07-13 21:34:01');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2062, 'madb_error_creating_instance', 'Problem creating new entry', 'en', 'system', '', '2006-07-13 21:34:01');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2064, 'madb_delete_file', 'Effacer le fichier', 'fr', 'system', '', '2006-07-13 21:34:23');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2065, 'madb_delete_file', 'Delete file', 'en', 'system', '', '2006-07-13 21:34:24');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2067, 'madb_file_transfer_quota_reached', 'Vous avez atteint les limites d''utilisation de votre compte.pour l''attachement de fichier. ', 'fr', 'system', '', '2006-07-13 21:35:46');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2068, 'madb_file_transfer_quota_reached', 'You reached the limits of your account regarding file attachments.', 'en', 'system', '', '2006-07-13 21:35:46');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2070, 'madb_replace_file', 'Remplacer le fichier', 'fr', 'system', '', '2006-07-13 21:36:12');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2071, 'madb_replace_file', 'Replace file', 'en', 'system', '', '2006-07-13 21:36:13');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2073, 'madb_go_back_do_no_replace_current_file', 'Faire marche arrière et ne pas remplacer le fichier.', 'fr', 'system', '', '2006-07-13 21:36:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2074, 'madb_go_back_do_no_replace_current_file', 'Go back and keep current file.', 'en', 'system', '', '2006-07-13 21:36:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2076, 'madb_this_will_erase_the_current_file', 'Cette opération effacera définitivement le fichier, êtes-vous sûr de vouloir continuer?', 'fr', 'system', '', '2006-07-13 21:37:52');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2077, 'madb_this_will_erase_the_current_file', 'This operation will definitively erase the file, are you sure you want to continue?', 'en', 'system', '', '2006-07-13 21:37:52');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2079, 'madb_maximum_attachment_size', 'Taille maximale de fichiers attachés', 'fr', 'system', '', '2006-07-13 21:39:03');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2080, 'madb_maximum_attachment_size', 'Maximum size of attached files', 'en', 'system', '', '2006-07-13 21:39:03');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2082, 'madb_maximum_monthly_file_transfer', 'Transfert maximum de fichier attachés:', 'fr', 'system', '', '2006-07-13 21:40:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2083, 'madb_maximum_monthly_file_transfer', 'Maximum transfer of attached files:', 'en', 'system', '', '2006-07-13 21:40:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2085, 'madb_maximum_attachment_number', 'Nombre maximum de fichiers pouvant être attachés:', 'fr', 'system', '', '2006-07-13 21:41:08');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2086, 'madb_maximum_attachment_number', 'Maximum number of files you may upload', 'en', 'system', '', '2006-07-13 21:41:08');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2088, 'madb_maximum_montly_file_transfer_explanations_tooltip', 'Une fois cette limite atteinte, il vous est impossible de sauvegarder de nouveau fichier. Une marge de 10% vous est accordée pour le download de fichier sauvegardés dans madb.net', 'fr', 'system', '', '2006-07-13 21:43:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2089, 'madb_maximum_montly_file_transfer_explanations_tooltip', 'Once this limit is reached, you cannot upload more files. A margin of 10% is left so you can still download files.', 'en', 'system', '', '2006-07-13 21:43:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2091, 'madb_subscription_type_characteristics', 'Caractéristiques de votre compte', 'fr', 'system', '', '2006-07-13 22:15:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2092, 'madb_subscription_type_characteristics', 'Characteristics of your account', 'en', 'system', '', '2006-07-13 22:15:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2094, 'madb_s3_attachment', 'Fichier attaché', 'fr', 'system', '', '2006-07-16 12:07:37');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2095, 'madb_s3_attachment', 'File attachment', 'en', 'system', '', '2006-07-16 12:07:37');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1868, 'madb_p_latest_news', '<p><i>Latest news:</i></p>
<p><b>File upload available! <a href="/demos/file_uploads.html">Watch the demo!</a></b></p>', 'en', 'system', '', '2006-07-20 22:56:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2058, 'madb_display_contextual_help', 'Show helping explanations', 'en', 'system', '', '2006-07-26 21:38:48');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2059, 'madb_subscription_type', 'Subscription type', 'en', 'system', '', '2006-07-30 15:37:53');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2057, 'madb_question', 'question', 'en', 'system', '', '2006-07-30 15:44:42');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1789, 'madb_p_main_content_demos', '<h2>Démos</h2>
Vous trouverez ci-dessous plusieurs démonstrations (en anglais, au format flash) d''utilisation de MaDB.net qui devraient vous permettre de vous familiariser rapidement avec l''application.
<ul>
<li><b>Interface de l''application</b>: une démo très courte indiquant les principaux élément de l''interface. <p class="datum"><a href="/demos/intro.html" target="madb_demo">LANCER LA DEMO</a></p></li>

<li><b>Sauvegarde de fichiers</b>: Démonstration de la sauvegarde de fichiers, <p class="datum"><a href="/demos/file_uploads.html" target="madb_demo">LANCER LA DEMO</a>(5.2Mo)</p></li>


<li><b>Fonctionalité de recherche</b>: découvrez la fonctionalité de recherche disponible dès que la structure des données est définie.<p class="datum"><a href="/demos/search.html" target="madb_demo">LANCER LA DEMO</a>(2.4Mo)</p></li>
<li><b>Définition de données simple</b>: voyez comment définir une base de données de suivi d''appels téléphoniques<p class="datum"><a href="/demos/simple_admin.html" target="madb_demo">LANCER LA DEMO</a>(4.5Mo)</p></li>
<li><b>Définition et utilisation de liens entre tables</b>: voyez comment définir des liens entre différentes tables.<p class="datum"><a href="/demos/define_links.html" target="madb_demo">LANCER LA DEMO</a>(4.9Mo)</p></li>
<li><b>Export CSV</b>: Démonstration de l''exportation des données au format CSV, utilisable dans tous tableurs.<p class="datum"><a href="/demos/csv_export.html" target="madb_demo">LANCER LA DEMO</a>(5.3Mo)</p></li>

</ul>', 'fr', 'system', '', '2006-07-20 23:01:00');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1795, 'madb_p_main_content_demos', '<h2>Demos</h2>
Below you''ll find several flash demos of MyOwnDB.com to get you rapidly familiarised with the application.
<ul>
<li><b>Application interface</b>: A short demo to show the most important elements of the interface. <p class="datum"><a href="/demos/intro.html" target="madb_demo">LAUNCH DEMO</a></p></li>

<li><b>File uploads</b>: Demonstration of the file attachment feature. <p class="datum"><a href="/demos/file_uploads.html" target="madb_demo">LAUNCH DEMO</a>(5.2Mo)</p></li>


<li><b>Search functionality</b>: Discover the search functionality that is available as soon as you''ve defined the structure of your data.<p class="datum"><a href="/demos/search.html" target="madb_demo">LAUNCH DEMO</a>(2.4Mo)</p></li>
<li><b>Simple data definition</b>: Learn how to define a simple database to track phone calls<p class="datum"><a href="/demos/simple_admin.html" target="madb_demo">LAUNCH DEMO</a>(4.5Mo)</p></li>
</li>
<li><b>Linking tables</b>: Learn how to link to tables. <p class="datum"><a href="/demos/define_links.html" target="madb_demo">LAUNCH DEMO</a>(4.9Mo)</p></li>
<li><b>CSV Export</b>: Demonstration of the export of data in the CSV format, which is usable in every spreadsheet.. <p class="datum"><a href="/demos/csv_export.html" target="madb_demo">LAUNCH DEMO</a>(4.9Mo)</p></li>
</ul>', 'en', 'system', '', '2006-07-20 23:01:03');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2102, 'madb_translation_updated_at', 'Mis à jour', 'fr', 'system', '', '2006-07-22 12:58:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2101, 'madb_translation_updated_at', 'Last update', 'en', 'system', '', '2006-07-22 12:58:19');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2103, 'madb_translation_scope', 'Champs d''application', 'fr', 'system', '', '2006-07-22 12:58:49');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2100, 'madb_translation_scope', 'Scope', 'en', 'system', '', '2006-07-22 12:58:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (982, 'madb_new_translation', 'Nouvelle traduction', 'fr', 'system', '', '2006-07-22 12:59:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1009, 'madb_new_translation', 'New translation', 'en', 'system', '', '2006-07-22 12:59:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (933, 'madb_find_translations_matching', '', 'nl', 'system', '', '2006-07-25 21:58:43');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (971, 'madb_find_translations_matching', 'Recherche', 'fr', 'system', '', '2006-07-25 21:58:43');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (998, 'madb_find_translations_matching', 'Find translations', 'en', 'system', '', '2006-07-25 21:58:46');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2104, 'madb_translation_t_id', 'terme', 'fr', 'system', '', '2006-07-25 22:00:00');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2097, 'madb_translation_t_id', 'translation id', 'en', 'system', '', '2006-07-25 22:00:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2105, 'madb_translation_value', 'Traduction', 'fr', 'system', '', '2006-07-25 22:00:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2098, 'madb_translation_value', 'Translation', 'en', 'system', '', '2006-07-25 22:00:37');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2106, 'madb_translation_lang', 'Langue', 'fr', 'system', '', '2006-07-25 22:01:11');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2099, 'madb_translation_lang', 'Language', 'en', 'system', '', '2006-07-25 22:01:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2110, 'madb_back', 'Retour', 'fr', 'system', '', '2006-07-26 21:18:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2111, 'madb_back', 'Back', 'en', 'system', '', '2006-07-26 21:18:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1222, 'updated_at', 'Mis à jour le', 'fr', 'system', '', '2006-07-30 15:13:01');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1181, 'updated_at', 'Updated at', 'en', 'system', '', '2006-07-30 15:13:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1190, 'nl', 'Néerlandais', 'fr', 'system', '', '2006-07-30 15:22:21');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1184, 'nl', 'Dutch', 'en', 'system', '', '2006-07-30 15:22:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1364, 'madb_you_need_to_provide_names_for_the_link_in_both_directions', 'Veuillez entrer un nom pour la relation dans chaque sens.', 'fr', 'system', '', '2006-07-30 15:25:11');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1381, 'madb_you_need_to_provide_names_for_the_link_in_both_directions', 'You need to provide names for the link in both directions.', 'en', 'system', '', '2006-07-30 15:25:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1169, 'madb_you_can_add_an_entry', 'Vous pouvez ajouter un entrée.', 'fr', 'system', '', '2006-07-30 15:25:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2117, 'madb_you_can_add_an_entry', 'You can add a new entry', 'en', 'system', '', '2006-07-30 15:25:58');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1603, 'madb_users_list', 'Liste des utilisateurs', 'fr', 'system', '', '2006-07-30 15:34:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1564, 'madb_users_list', 'Users list', 'en', 'system', '', '2006-07-30 15:34:54');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1039, 'madb_urls_where_translation_appears', 'URL contenant le terme', 'fr', 'system', '', '2006-07-30 15:35:47');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1118, 'madb_urls_where_translation_appears', 'URLs containing the translation', 'en', 'system', '', '2006-07-30 15:35:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2119, 'madb_translation_missing_translations', 'Traductions manquantes', 'fr', 'system', '', '2006-07-30 15:36:37');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2114, 'madb_translation_missing_translations', 'Missing Translations', 'en', 'system', '', '2006-07-30 15:36:40');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2120, 'madb_translation_existing_translations', 'Termes traduits', 'fr', 'system', '', '2006-07-30 15:37:08');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2113, 'madb_translation_existing_translations', 'Translated terms', 'en', 'system', '', '2006-07-30 15:37:11');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2121, 'madb_subscription_type', 'Type d''abonnement', 'fr', 'system', '', '2006-07-30 15:37:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2122, 'madb_translation_check_usage_in_source_code', 'Utilisé?', 'fr', 'system', '', '2006-07-30 15:38:12');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2115, 'madb_translation_check_usage_in_source_code', 'Check usage', 'en', 'system', '', '2006-07-30 15:38:15');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1318, 'madb_status', 'Status', 'fr', 'system', '', '2006-07-30 15:39:38');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1427, 'madb_status', 'Status', 'en', 'system', '', '2006-07-30 15:39:43');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1609, 'madb_settings_could_not_be_saved', 'Vos préférences n''ont pas pu être sauvées.', 'fr', 'system', '', '2006-07-30 15:41:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2123, 'madb_settings_could_not_be_saved', 'Your settings could not be saved.', 'en', 'system', '', '2006-07-30 15:41:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1041, 'madb_resize', 'Adapter la taille', 'fr', 'system', '', '2006-07-30 15:42:08');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1120, 'madb_resize', 'Resize', 'en', 'system', '', '2006-07-30 15:42:13');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1430, 'madb_really_delete_all_existing_links_question', 'Effacer toutes les relations existantes?', 'fr', 'system', '', '2006-07-30 15:43:53');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1417, 'madb_really_delete_all_existing_links_question', 'Really delete all existing links?', 'en', 'system', '', '2006-07-30 15:44:00');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2125, 'madb_question', 'question', 'fr', 'system', '', '2006-07-30 15:44:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1313, 'madb_proposition_exists', 'La proposition existe', 'fr', 'system', '', '2006-07-30 15:45:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1373, 'madb_proposition_exists', 'The proposition exists', 'en', 'system', '', '2006-07-30 15:45:38');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1043, 'madb_previous_page', 'Page précédente', 'fr', 'system', '', '2006-07-30 15:46:07');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1143, 'madb_previous_page', 'Previous page', 'en', 'system', '', '2006-07-30 15:46:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1307, 'madb_parent', 'Parent', 'fr', 'system', '', '2006-07-30 15:47:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1358, 'madb_parent', 'Parent', 'en', 'system', '', '2006-07-30 15:47:40');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1038, 'madb_notes', 'Notes', 'fr', 'system', '', '2006-07-30 15:48:11');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1117, 'madb_notes', 'Notes', 'en', 'system', '', '2006-07-30 15:48:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (980, 'madb_next_page', 'Page suivante', 'fr', 'system', '', '2006-07-30 15:52:03');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1007, 'madb_next_page', 'Next page', 'en', 'system', '', '2006-07-30 15:52:07');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (970, 'madb_listing_translations', 'Liste des traductions', 'fr', 'system', '', '2006-07-30 15:53:21');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (997, 'madb_listing_translations', 'List of translations', 'en', 'system', '', '2006-07-30 15:53:25');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1196, 'madb_help_info_translations_list_intro', 'The first list shows existing translations, the second shows missing translations', 'en', 'system', '', '2006-07-30 15:55:25');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1217, 'madb_help_info_translations_list_intro', 'La première liste affiche les traduction existantes, la seconde les traductions manquantes', 'fr', 'system', '', '2006-07-30 15:55:28');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1328, 'madb_help_info_admin_entities_edit', 'Vous pouvez modifier le nom de l''entité', 'fr', 'system', '', '2006-07-30 15:56:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2126, 'madb_help_info_admin_entities_edit', 'You can change the name of the entity', 'en', 'system', '', '2006-07-30 15:56:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1423, 'madb_help_info_admin_details_value_propositions_for_edit', 'It is currently not possible to edit the propositions list', 'en', 'system', '', '2006-07-30 16:20:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2131, 'madb_help_info_admin_edit_detail', 'Vous pouvez ici modifier le détail existant. Toutes les caractéristiques ne peuvent être modifiée (par exemple le type du detail ne peut être modifié de "Choix dans une liste" vers "Date")

', 'fr', 'system', '', '2006-07-30 16:22:42');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2130, 'madb_help_info_admin_edit_detail', 'You can edit an existing detail. Not all characteristics can be changed. For example you can''t modify a detail of type "Choice in list" to make it a "Date".', 'en', 'system', '', '2006-07-30 16:22:46');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1478, 'madb_help_info_admin_databases_edit', 'Vous pouvez modifier une base de donnée existante.', 'fr', 'system', '', '2006-07-30 16:24:05');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2132, 'madb_help_info_admin_databases_edit', 'You can modify an existing database.', 'en', 'system', '', '2006-07-30 16:24:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1244, 'madb_entity_edition', 'Modification d''une entrée', 'fr', 'system', '', '2006-07-30 16:25:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2135, 'madb_entity_edition', 'Edition of an entry', 'en', 'system', '', '2006-07-30 16:25:05');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2137, 'madb_editing_users', 'Edition d''utilisateur', 'fr', 'system', '', '2006-07-30 16:25:47');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1590, 'madb_editing_users', 'User edition', 'en', 'system', '', '2006-07-30 16:25:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1037, 'madb_editing_translations', 'Edition de traduction', 'fr', 'system', '', '2006-07-30 16:26:11');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1116, 'madb_editing_translations', 'Translation Edition', 'en', 'system', '', '2006-07-30 16:26:20');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1327, 'madb_edit_entity', 'Modification d''une entité', 'fr', 'system', '', '2006-07-30 16:26:53');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2138, 'madb_edit_entity', 'Modification of an entity', 'en', 'system', '', '2006-07-30 16:26:54');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2140, 'madb_edit_detail', 'Modification d''un détail', 'fr', 'system', '', '2006-07-30 16:27:24');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2129, 'madb_edit_detail', 'Modification of a detail', 'en', 'system', '', '2006-07-30 16:27:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2141, 'madb_edit_database', 'Edition of a database', 'en', 'system', '', '2006-07-30 16:28:00');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1471, 'madb_display_info_help', 'Display integrated help', 'en', 'system', '', '2006-07-30 16:28:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1501, 'madb_destroy_entity_link_title', 'Supprimer la table et toutes ses entrées.', 'fr', 'system', '', '2006-07-30 16:29:20');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1400, 'madb_destroy_entity_link_title', 'destroy the table and all its entries', 'en', 'system', '', '2006-07-30 16:29:25');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1499, 'madb_administrate_entity_link_title', 'Ce liens vous donne accès à la définition de cette entité, comme ses détails et liens vers d''autres entitiés.', 'fr', 'system', '', '2006-07-30 16:34:59');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1398, 'madb_administrate_entity_link_title', 'This link gives you access to the definition of this entity like its details and links to other entities.', 'en', 'system', '', '2006-07-30 16:35:05');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1544, 'madb_add_detail_to_entity', 'Ajoût d''un détail à {{entity}}', 'fr', 'system', '', '2006-07-30 16:36:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1507, 'madb_add_detail_to_entity', 'Add a detail to {{entity}}', 'en', 'system', '', '2006-07-30 16:36:14');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (981, 'madb_enter_id_of_the_translation', 'Entrez l''identifiant de la traduction', 'fr', 'system', '', '2006-07-30 16:39:46');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1008, 'madb_enter_id_of_the_translation', 'Enter id of the translation', 'en', 'system', '', '2006-07-30 16:39:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2149, 'madb_translation_ids', 'Identifiants', 'fr', 'system', '', '2006-07-30 16:46:14');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2148, 'madb_translation_ids', 'Translation ids', 'en', 'system', '', '2006-07-30 16:46:24');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2151, 'madb_no_detail_saved_enter_at_least_one_valid_value', 'Veuillez entrer au moins une valeur.', 'fr', 'system', '', '2006-08-02 20:01:43');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2152, 'madb_no_detail_saved_enter_at_least_one_valid_value', 'Enter at least one value.', 'en', 'system', '', '2006-08-02 20:01:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2155, 'it', 'it', 'en', 'system', NULL, '2006-08-02 20:25:12');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2156, 'madb_english_translation', 'madb_english_translation', 'en', 'system', NULL, '2006-08-02 20:45:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2159, 'madb_english_translation', 'English translation', 'fr', 'system', '', '2006-08-02 20:54:25');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2157, 'madb_english_translation', '', 'it', 'system', '', '2006-08-02 20:54:38');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2160, 'pt', 'pt', 'en', 'system', NULL, '2006-08-04 21:58:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2161, 'pt-br', 'pt-br', 'en', 'system', NULL, '2006-08-04 21:58:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2162, 'ru', 'ru', 'en', 'system', NULL, '2006-08-04 21:58:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2163, 'cancel', 'Cancelar', 'pt', 'system', '', '2006-08-04 22:29:37');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2165, 'entity', 'entidade', 'pt', 'system', '', '2006-08-04 22:30:22');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2167, 'cancel', 'Отменить', 'ru', 'system', '', '2006-08-07 09:32:13');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2169, 'en', 'Английский', 'ru', 'system', '', '2006-08-07 09:32:55');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2171, 'ru', 'Русский', 'ru', 'system', '', '2006-08-07 09:38:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2173, 'pt', 'Португальский', 'ru', 'system', '', '2006-08-07 09:40:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2175, 'pt-br', 'Португальский (Бразилия)', 'ru', 'system', '', '2006-08-07 09:41:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2177, 'nl', 'Голландский', 'ru', 'system', '', '2006-08-07 09:41:47');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2179, 'fr', 'Французский', 'ru', 'system', '', '2006-08-07 09:42:22');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2181, 'it', 'Итальянский', 'ru', 'system', '', '2006-08-07 09:42:49');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2183, 'madb_add_new', 'Добавить новую запись', 'ru', 'system', '', '2006-08-07 09:44:12');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2185, 'madb_related_children_objects', 'madb_related_children_objects', 'en', 'system', NULL, '2006-08-07 09:45:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2186, 'madb_all', 'Все', 'ru', 'system', '', '2006-08-07 09:47:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2188, 'madb_help', 'Подсказка', 'ru', 'system', '', '2006-08-07 09:49:12');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2190, 'madb_listing_translations', 'Список переводов', 'ru', 'system', '', '2006-08-07 09:49:54');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2192, 'madb_list_of_databases', 'Список баз данных', 'ru', 'system', '', '2006-08-07 09:50:38');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2194, 'madb_lastname', 'Фамилия', 'ru', 'system', '', '2006-08-07 09:51:12');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2196, 'madb_list', 'Список {{entity}}', 'ru', 'system', '', '2006-08-07 09:51:52');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2198, 'madb_integer', 'Целое число', 'ru', 'system', '', '2006-08-07 09:52:38');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2203, 'madb_account_type_personal', 'Personnel', 'fr', 'system', '', '2006-08-28 20:42:49');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2204, 'madb_account_type_personal', 'Personal', 'en', 'system', '', '2006-08-28 20:42:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2206, 'madb_account_type_association', 'Association', 'fr', 'system', '', '2006-08-28 20:43:43');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2207, 'madb_account_type_association', 'Association', 'en', 'system', '', '2006-08-28 20:43:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2209, 'madb_account_type_enterprise', 'Entreprise', 'fr', 'system', '', '2006-08-28 20:44:47');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2210, 'madb_account_type_enterprise', 'Enterprise', 'en', 'system', '', '2006-08-28 20:44:48');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2200, 'madb_reactivate_subscription_to', 'Choisir l''abonnement {{subscription_name}}', 'fr', 'system', '', '2006-08-28 21:03:24');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2201, 'madb_reactivate_subscription_to', 'Choose the {{subscription_name}} subscription', 'en', 'system', '', '2006-08-28 21:03:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1898, 'madb_number_of_databases', 'Number of databases', 'en', 'system', '', '2006-08-28 21:06:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1900, 'madb_number_of_users', 'Nombre d''utilisateurs', 'fr', 'system', '', '2006-08-28 21:08:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1901, 'madb_number_of_users', 'Number of users', 'en', 'system', '', '2006-08-28 21:08:20');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2212, 'madb_account_reactivate', 'Réactivation du compte', 'fr', 'system', '', '2006-08-28 21:09:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2213, 'madb_account_reactivate', 'Reactivate account', 'en', 'system', '', '2006-08-28 21:09:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2215, 'madb_account_upgrade', 'Mise à jour de l''abonnement', 'fr', 'system', '', '2006-08-28 21:11:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2216, 'madb_account_upgrade', 'Upgrade your subscription', 'en', 'system', '', '2006-08-28 21:11:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2218, 'madb_invoice_from', 'Van', 'nl', 'system', '', '2006-08-29 13:15:20');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2219, 'madb_invoice_from', 'De', 'fr', 'system', '', '2006-08-29 13:15:21');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2220, 'madb_invoice_from', 'From', 'en', 'system', '', '2006-08-29 13:15:22');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2221, 'madb_invoice_to', 'Naar', 'nl', 'system', '', '2006-08-29 13:16:05');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2222, 'madb_invoice_to', 'A', 'fr', 'system', '', '2006-08-29 13:16:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2223, 'madb_invoice_to', 'To', 'en', 'system', '', '2006-08-29 13:16:07');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2224, 'madb_amount', 'Bedrag', 'nl', 'system', '', '2006-08-29 13:16:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2225, 'madb_amount', 'Montant', 'fr', 'system', '', '2006-08-29 13:16:36');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2226, 'madb_amount', 'Amount', 'en', 'system', '', '2006-08-29 13:16:37');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2227, 'madb_invoiced_item', 'Produit facturé', 'fr', 'system', '', '2006-08-29 13:25:37');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2228, 'madb_invoiced_item', 'Product invoiced', 'en', 'system', '', '2006-08-29 13:25:38');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2229, 'madb_invoice_vat_amount', 'TVA', 'fr', 'system', '', '2006-08-29 13:26:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2230, 'madb_invoice_vat_amount', 'VAT', 'en', 'system', '', '2006-08-29 13:26:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2231, 'madb_invoice_total_amount', 'Total', 'fr', 'system', '', '2006-08-29 13:33:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2232, 'madb_invoice_total_amount', 'Total', 'en', 'system', '', '2006-08-29 13:33:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2019, 'madb_upgrade_subscription_to', 'Upgrade to {{subscription_name}} level', 'en', 'system', '', '2006-09-03 14:57:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2018, 'madb_upgrade_subscription_to', 'Passer au niveau {{subscription_name}}', 'fr', 'system', '', '2006-09-03 14:57:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2012, 'madb_payment_received_and_account_activated', 'Votre paiement de {{amount}} {{currency}} a bien été réceptionné par l''intermédiare de Paypal et vous pouvez dès à présent utiliser votre compte après vous avoir authentifié sur la <a href="/app/authentication/login">page de login</a>.', 'fr', 'system', '', '2006-09-03 18:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2013, 'madb_payment_received_and_account_activated', 'We have received your payment of {{amount}} {{currency}} through Paypal, and you can immediately use the application after authentication on the <a href="/app/authentication/login">login page</a>.', 'en', 'system', '', '2006-09-03 18:17:59');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2233, 'madb_invoices_list', 'Factures', 'fr', 'system', '', '2006-09-10 10:31:15');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2234, 'madb_invoices_list', 'Invoices', 'en', 'system', '', '2006-09-10 10:31:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2235, 'madb_link_to_invoices_list', 'Vous pouvez visualiser <a href="{{url}}">vos factures</a>.', 'fr', 'system', '', '2006-09-10 10:33:02');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2236, 'madb_link_to_invoices_list', 'You can look at <a href="{{url}}">all your invoices.</a>', 'en', 'system', '', '2006-09-10 10:33:03');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2240, 'madb_your_subscription_is_cancelled', 'Votre abonnement a été annullé, et prendra fin le {{end_date}}', 'fr', 'system', '', '2006-10-07 11:57:49');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2238, 'madb_your_subscription_is_cancelled', 'Your subscription was cancelled, and will end on {{end_date}}', 'en', 'system', '', '2006-10-07 11:57:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2242, 'madb_invoice_number', 'Numéro de facture', 'fr', 'system', '', '2006-10-07 12:10:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2243, 'madb_invoice_number', 'Invoice number', 'en', 'system', '', '2006-10-07 12:10:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2245, 'madb_invoice_date', 'Date de facturation', 'fr', 'system', '', '2006-10-07 12:11:07');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2246, 'madb_invoice_date', 'Invoicing date', 'en', 'system', '', '2006-10-07 12:11:08');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2248, 'madb_payment_not_yet_received_and_incorrect_communication_from_paypal', 'Nous n''avons pas encore reçu la confirmation du paiement de Paypal. Veuillez essayer de vous authentifier dans quelques minutes.', 'fr', 'system', '', '2006-10-08 17:14:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2249, 'madb_payment_not_yet_received_and_incorrect_communication_from_paypal', 'We have not yet received confirmation of your payment from Paypal. Please try to log in in a couple of minutes.', 'en', 'system', '', '2006-10-08 17:14:46');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2250, 'primary_user', 'primary_user', 'en', 'system', NULL, '2007-12-12 16:03:49.787195');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2251, 'normal_user', 'normal_user', 'en', 'system', NULL, '2007-12-31 16:51:26.114356');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2252, 'details', 'details', 'en', 'system', NULL, '2007-12-31 18:00:06.983078');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2253, 'Projects', 'Projects', 'en', 'system', NULL, '2007-12-31 18:48:08.541813');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2254, 'Name', 'Name', 'en', 'system', NULL, '2007-12-31 18:48:08.568936');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2255, 'Type', 'Type', 'en', 'system', NULL, '2007-12-31 18:49:06.329492');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2256, 'Test', 'Test', 'en', 'system', NULL, '2007-12-31 18:50:08.790367');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2257, 'age', 'age', 'en', 'system', NULL, '2007-12-31 18:54:47.289191');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2258, 'Managers', 'Managers', 'en', 'system', NULL, '2007-12-31 18:55:34.25067');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2259, 'madb_requested_db_not_found', 'madb_requested_db_not_found', 'en', 'system', NULL, '2008-01-01 14:39:17.145469');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2260, 'Developers', 'Developers', 'en', 'system', NULL, '2008-01-04 15:57:41.795716');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2261, 'Tasks', 'Tasks', 'en', 'system', NULL, '2008-01-30 15:56:16.121368');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2262, 'Milestones', 'Milestones', 'en', 'system', NULL, '2008-01-30 15:58:51.43755');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2263, 'Deadline', 'Deadline', 'en', 'system', NULL, '2008-01-30 15:59:07.574369');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2264, 'Artists', 'Artists', 'en', 'system', NULL, '2008-01-30 16:25:36.550452');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2265, 'Style', 'Style', 'en', 'system', NULL, '2008-01-30 16:25:36.584941');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2266, 'Songs', 'Songs', 'en', 'system', NULL, '2008-01-30 16:28:16.413753');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2267, 'Albums', 'Albums', 'en', 'system', NULL, '2008-01-30 16:29:55.349552');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2268, 'Title', 'Title', 'en', 'system', NULL, '2008-01-30 16:29:55.373958');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2269, 'Email', 'Email', 'en', 'system', NULL, '2008-02-01 17:20:43.661538');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2270, 'madb_no_available_details_maybe_you_should_create_a_new_detail', 'madb_no_available_details_maybe_you_should_create_a_new_detail', 'en', 'system', NULL, '2008-02-04 15:33:25.845257');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2271, 'madb_error_occured_when_deleting_entity', 'madb_error_occured_when_deleting_entity', 'en', 'system', NULL, '2008-02-05 12:52:47.219315');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (2272, 'Age', 'Age', 'en', 'system', NULL, '2008-02-07 14:53:24.297982');


--
-- Data for Name: translator2language; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO translator2language (id, translator_id, language_id) VALUES (10, 1, 2);
INSERT INTO translator2language (id, translator_id, language_id) VALUES (11, 2, 1);
INSERT INTO translator2language (id, translator_id, language_id) VALUES (12, 2, 2);
INSERT INTO translator2language (id, translator_id, language_id) VALUES (13, 3, 5);
INSERT INTO translator2language (id, translator_id, language_id) VALUES (14, 4, 6);
INSERT INTO translator2language (id, translator_id, language_id) VALUES (16, 6, 7);
INSERT INTO translator2language (id, translator_id, language_id) VALUES (17, 7, 5);
INSERT INTO translator2language (id, translator_id, language_id) VALUES (18, 1, 3);


--
-- Data for Name: translators; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO translators (id, "login", deletor, coder) VALUES (1, 'rb@raphinou.com', true, true);
INSERT INTO translators (id, "login", deletor, coder) VALUES (2, 'rbauduin@fosdem.org', false, false);
INSERT INTO translators (id, "login", deletor, coder) VALUES (3, 'waldir.hannemann@gmail.com', false, false);
INSERT INTO translators (id, "login", deletor, coder) VALUES (4, 'marceloinformatica@gmail.com', false, false);
INSERT INTO translators (id, "login", deletor, coder) VALUES (6, 'regul8or@gmail.com', false, false);
INSERT INTO translators (id, "login", deletor, coder) VALUES (7, 'abel@abelmagalhaes.com', false, false);
INSERT INTO translators (id, "login", deletor, coder) VALUES (8, 'mohsinhijazee@zeropoint.it', true, true);


--
-- Data for Name: translators_hints; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (284, 'madb_please_login', '', '--- 
- /authentication/login');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (286, 'madb_password', '', '--- 
- /authentication/login');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (287, 'madb_register_for_an_account', '', '--- 
- /authentication/login');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (289, 'madb_madb', '', '--- 
- /authentication/login');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (324, 'madb_listing_translations', '', '--- 
- /admin/translations
- /admin/translations/list');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (332, 'madb_enter_id_of_the_translation', '', '--- 
- /admin/translations
- /admin/translations/list');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (347, 'website', '', '--- 
- /entities/list/611
- /entities/view/51565');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (350, 'address', '', '--- 
- /entities/view/51565');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (351, 'city', '', '--- 
- /entities/view/51565');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (357, 'unlink', '', '--- 
- /entities/view/51565');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (359, 'invoice_number', '', '--- 
- /entities/view/51565');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (362, 'subject', '', '--- 
- /entities/view/51565');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (345, 'companies', '', '--- 
- /entities/list/611
- /entities/view/51565
- /admin/translations
- /admin/translations/edit/delete?scope=system
- /entities/list/608
- /admin/translations/list
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/back?scope=system
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /database
- /database/list_entities/194
- /admin/translations/show/1088');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (368, 'madb_help_info_database_list', '', '--- 
- /database');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (375, 'madb_you_can_add_an_entry', '', '--- 
- /entities/entities_list');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (376, 'madb_help_info_entities_view_intrp
', '', '--- 
- /entities/view/51378
- /entities/view/51255');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (386, 'register_for_an_account', '', '--- 
- /authentication/login');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (380, 'madb_help_info_translations_list_intro', '', '--- 
- /admin/translations/list
- /admin/translations');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (388, 'mabd_forgot_your_password_question', '', '--- 
- /authentication/login');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (394, 'madb_entity_edition', '
 With translation parameters:
entity_name, ', '--- 
- /entities/edit/59600');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (395, 'madb_help_info_entities_edition', '', '--- 
- /entities/edit/59600');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (404, 'madb_error_data_incorrect', '', '--- 
- /search/results_page?database_id=194&entity_id=611&detail_id=1614&value=al');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (408, 'madb_entity', '
 With translation parameters:
entity, ', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (409, 'madb_help_info_admin_entities_show_intro', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (411, 'madb_details_for_entity', '
 With translation parameters:
entity, ', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (412, 'madb_show_detail_spec', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (413, 'madb_show_detail_spec_link_title', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (414, 'madb_edit_entity_to_detail', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (415, 'madb_edit_entity_to_detail_link_title', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (416, 'madb_unlink_detail_from_entity', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (417, 'madb_unlink_detail_from_entity_link_title', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (418, 'madb_input_form_is_publicly_accessible', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (419, 'madb_public_form_will_be_available_at', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (423, 'madb_links', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (424, 'madb_to_children ', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (425, 'madb_help_info_admin_entities_show_links_to_other_entities', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (426, 'madb_relation_name', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (427, 'madb_child', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (428, 'madb_multiple_parents_allowed', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (429, 'madb_multiple_children_allowed', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (431, 'madb_yes_many_children_allowed', '
 With translation parameters:
parent_entity, child_entity, ', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (432, 'madb_confirm_delete_all_links', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (433, 'madb_add_link_to_child_entity', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (434, 'madb_to_parents', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (435, 'madb_parent', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (436, 'madb_yes_many_parents_allowed', '
 With translation parameters:
parent_entity, child_entity, ', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (438, 'madb_add_link_to_parent_entity', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (450, 'madb_link_existing_detail', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (451, 'madb_add_new_detail', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (452, 'madb_edit_entity', '
 With translation parameters:
entity, ', '--- 
- /admin/entities/edit/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (453, 'madb_help_info_admin_entities_edit', '', '--- 
- /admin/entities/edit/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (449, 'madb_rename', '', '--- 
- /admin/entities/show/608
- /admin/databases
- /admin/entities?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (407, 'madb_click_here_to_disply_main_window', '', '--- 
- /search/list_for_entity?popup=t&value=al&entity_id=612
- /entities/related_entities_list/51849?relation_id=402&popup=t&type=children&list_id=has+contact_child
- /entities/related_entities_list/51255?relation_id=400&popup=t&type=parents&list_id=sung+by_parent');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (469, 'madb_error_incorrect_data', '', '--- 
- /admin/entities/show/634');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (470, 'madb_databases_list', '', '--- 
- /admin/databases');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (471, 'madb_help_info_admin_databases_list', '', '--- 
- /admin/databases');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (473, 'madb_entities', '', '--- 
- /admin/databases');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (474, 'madb_details', '', '--- 
- /admin/databases');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (475, 'madb_destroy', '', '--- 
- /admin/databases
- /admin/entities?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (477, 'madb_help_info_admin_entities_list', '', '--- 
- /admin/entities?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (478, 'madb_administrate', '', '--- 
- /admin/entities?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (479, 'madb_administrate_entity_link_title', '', '--- 
- /admin/entities?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (481, 'madb_destroy_entity_link_title', '', '--- 
- /admin/entities?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (307, 'madb_really_delete_entity_question', '', '--- 
- /entities/list/608
- /entities/list/611
- /entities/list/610
- /entities/entities_list
- /entities/entities_list/608?CDs_list_order=year
- /entities/list/632
- /entities/list/612
- /entities/list/609
- /admin/entities?db=194
- /entities/list/613');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (482, 'madb_new_entity', '', '--- 
- /admin/entities?db=194
- /admin/entities/new?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (455, 'madb_define_new_link', '
 With translation parameters:
entity, ', '--- 
- /admin/entities/define_link?parent_id=608
- /admin/entities/define_link?child_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (485, 'madb_parent_entity', '', '--- 
- /admin/entities/define_link?child_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (456, 'madb_help_info_admin_entities_define_link', '', '--- 
- /admin/entities/define_link?parent_id=608
- /admin/entities/define_link?child_id=608
- /admin/entities/edit_link/418?source_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (358, 'madb_unlink', '', '--- 
- /entities/view/51565
- /entities/view/51378
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /entities/view/51262
- /entities/view/51339
- /entities/view/51567
- /entities/view/51849
- /entities/related_entities_list/51849?relation_id=402&popup=t&type=children&list_id=has+contact_child
- /entities/view/51258
- /entities/view/51552
- /entities/related_entities_list/51255?relation_id=400&popup=t&type=parents&list_id=sung+by_parent
- /entities/related_entities_list/51255?relation_id=401&type=children
- /entities/view/51276
- /entities/view/51271
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=1&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=1&contains_child_page=2
- /entities/unlink/51377?relation_id=401&parent_id=51271&type=children');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (487, 'madb_really_delete_all_existing_links_question', '', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (349, 'madb_entity_details', '', '--- 
- /entities/view/51565
- /entities/view/51378
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /entities/view/51262
- /entities/view/51339
- /entities/view/59600
- /entities/view/51567
- /entities/view/51849
- /entities/view/51258
- /entities/view/51552
- /entities/view/51276
- /entities/view/51271
- /entities/view/51320');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (385, 'madb_help_info_entities_view_intro', '', '--- 
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /entities/view/51262
- /entities/view/51339
- /entities/view/59600
- /entities/view/51567
- /entities/view/51849
- /entities/view/51258
- /entities/view/51552
- /entities/view/51276
- /entities/view/51271
- /entities/view/51320');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (377, 'madb_related_entities', '', '--- 
- /entities/view/51378
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /entities/view/51262
- /entities/view/51339
- /entities/view/59600
- /entities/view/51567
- /entities/view/51849
- /entities/view/51258
- /entities/view/51552
- /entities/view/51276
- /entities/view/51271
- /entities/view/51320');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (378, 'madb_help_info_entities_views_related_entities', '', '--- 
- /entities/view/51378
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /entities/view/51262
- /entities/view/51339
- /entities/view/59600
- /entities/view/51567
- /entities/view/51849
- /entities/view/51258
- /entities/view/51552
- /entities/view/51276
- /entities/view/51271
- /entities/view/51320');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (381, 'madb_link_to_existing_entity', '
 With translation parameters:
entity, ', '--- 
- /entities/view/51255
- /entities/view/51262
- /entities/view/51339
- /entities/view/51567
- /entities/view/51849
- /entities/view/51258
- /entities/view/51552
- /entities/view/51276
- /entities/view/51377
- /entities/view/51271
- /entities/view/51320');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (382, 'madb_add_new_related_entity', '
 With translation parameters:
entity, ', '--- 
- /entities/view/51255
- /entities/view/51262
- /entities/view/51339
- /entities/view/51567
- /entities/view/51849
- /entities/view/51258
- /entities/view/51552
- /entities/view/51276
- /entities/view/51377
- /entities/view/51271
- /entities/view/51320');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (457, 'madb_you_need_to_provide_names_for_the_link_in_both_directions', '', '--- 
- /admin/entities/define_link?parent_id=608
- /admin/entities/define_link?child_id=608
- /admin/entities/edit_link/418?source_id=608
- /admin/entities/edit_link/419?source_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (492, 'madb_help_info_admin_entities_edit_link', '', '--- 
- /admin/entities/edit_link/418?source_id=608
- /admin/entities/define_link?parent_id=608
- /admin/entities/edit_link/419?source_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (493, 'madb_create_new', '
 With translation parameters:
entity, ', '--- 
- /entities/public_form/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (494, 'madb_insertion_was_successful', '', '--- 
- /entities/public_form/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (372, 'madb_help_info_database_list_entities', '', '--- 
- /database/list_entities/194
- /database/list_entities/195
- /database/list_entities/200');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (290, 'madb_list', '', '--- 
- /entities/list/608
- /entities/list/611
- /entities/list/610
- /entities/list/632
- /entities/list/612
- /entities/list/609
- /entities/list/613');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (373, 'madb_help_info_entities_list_intro', '', '--- 
- /entities/list/610
- /entities/list/608
- /entities/list/632
- /entities/list/612
- /entities/list/609
- /entities/list/613');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (292, 'madb_create_new_entity', '
 With translation parameters:
entity_name, ', '--- 
- /entities/list/608
- /entities/list/611
- /entities/list/610
- /entities/list/632
- /entities/list/612
- /entities/list/609
- /entities/list/613');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (366, 'madb_filter_on', '', '--- 
- /entities/list/608
- /entities/list/610
- /entities/entities_list
- /entities/view/51378
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /entities/entities_list/608?CDs_list_order=year
- /entities/view/51262
- /entities/view/51339
- /entities/list/632
- /entities/list/612
- /entities/view/51567
- /entities/view/51849
- /entities/related_entities_list/51849?relation_id=402&popup=t&type=children&list_id=has+contact_child
- /entities/list/609
- /entities/view/51258
- /entities/view/51552
- /entities/related_entities_list/51255?relation_id=400&popup=t&type=parents&list_id=sung+by_parent
- /entities/related_entities_list/51255?relation_id=401&type=children
- /entities/view/51276
- /entities/view/51271
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=1&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=1&contains_child_page=2
- /entities/unlink/51377?relation_id=401&parent_id=51271&type=children
- /entities/view/51320
- /entities/list/613');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (367, 'madb_with_value', '', '--- 
- /entities/list/608
- /entities/list/610
- /entities/entities_list
- /entities/entities_list/608?CDs_list_order=year
- /entities/view/51262
- /entities/view/51255
- /entities/list/632
- /entities/list/612
- /entities/view/51567
- /entities/view/51849
- /entities/related_entities_list/51849?relation_id=402&popup=t&type=children&list_id=has+contact_child
- /entities/list/609
- /entities/view/51258
- /entities/view/51552
- /entities/related_entities_list/51255?relation_id=400&popup=t&type=parents&list_id=sung+by_parent
- /entities/related_entities_list/51255?relation_id=401&type=children
- /entities/view/51276
- /entities/view/51377
- /entities/view/51271
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=1&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=1&contains_child_page=2
- /entities/unlink/51377?relation_id=401&parent_id=51271&type=children
- /entities/view/51320
- /entities/list/613');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (497, 'madb_help_info_settings_show_intro', '', '--- 
- /settings/show');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (498, 'madb_display_info_help', '', '--- 
- /settings/show');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (499, 'madb_change_password', '', '--- 
- /settings/show');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (500, 'madb_enter_your_new_password_below', '', '--- 
- /settings/show');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (501, 'madb_choose_password', '', '--- 
- /settings/show');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (502, 'madb_confirm_password', '', '--- 
- /settings/show');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (503, 'madb_create_database', '', '--- 
- /admin/databases');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (504, 'madb_really_delete_database_question', '
 With translation parameters:
database, ', '--- 
- /admin/databases');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (505, 'madb_edit_database', '', '--- 
- /admin/databases/edit/194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (506, 'madb_help_info_admin_databases_edit', '', '--- 
- /admin/databases/edit/194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (508, 'madb_details_list', '', '--- 
- /admin/details?db=200
- /admin/details?db=194
- /admin/details/list?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (490, 'madb_help_info_admin_details_value_propositions_for_edit', '', '--- 
- /admin/details/edit/1606
- /admin/details/edit/1684');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (513, 'madb_entities_list', '
 With translation parameters:
db, ', '--- 
- /admin/entities?db=194
- /database/list_entities/194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (515, 'madb_add_detail_to_entity', '
 With translation parameters:
entity, ', '--- 
- /admin/entities/add_existing_choose/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (516, 'madb_help_info_admin_entities_add_existing_choose', '', '--- 
- /admin/entities/add_existing_choose/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (517, 'madb_choose', '', '--- 
- /admin/entities/add_existing_choose/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (331, 'madb_next_page', '', '--- 
- /admin/translations
- /admin/translations/translations_list
- /admin/translations/list
- /admin/translations/translations_list?page=2
- /admin/translations/translations_list?page=3
- /admin/translations/translations_list?page=4
- /admin/translations/translations_list?page=1
- /admin/translations/translations_list?page=5
- /admin/translations/translations_list?page=6
- /admin/translations/translations_list?page=7
- /admin/translations/translations_list?page=8
- /admin/translations/translations_list?page=9
- /admin/translations/translations_list?page=10
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=2');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (325, 'madb_find_translations_matching', '', '--- 
- /admin/translations
- /admin/translations/translations_list
- /admin/translations/list
- /admin/translations/translations_list?page=2
- /admin/translations/translations_list?page=3
- /admin/translations/translations_list?page=4
- /admin/translations/translations_list?page=1
- /admin/translations/translations_list?page=5
- /admin/translations/translations_list?page=6
- /admin/translations/translations_list?page=7
- /admin/translations/translations_list?page=8
- /admin/translations/translations_list?page=9
- /admin/translations/translations_list?page=10
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=help_info_admin&page=2
- /admin/translations/translations_list?normal_filter=%2BEnvoyer%2B&value_filter=title&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=title&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=3');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (296, 'madb_reset', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/translations_list
- /admin/translations/list
- /admin/translations/translations_list?page=2
- /admin/translations/translations_list?page=3
- /admin/translations/translations_list?page=4
- /admin/translations/translations_list?page=1
- /admin/translations/translations_list?page=5
- /admin/translations/translations_list?page=6
- /admin/translations/translations_list?page=7
- /entities/list/611
- /admin/translations/translations_list?page=8
- /admin/translations/translations_list?page=9
- /admin/translations/translations_list?page=10
- /entities/list/610
- /entities/entities_list
- /entities/view/51378
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /entities/entities_list/608?CDs_list_order=year
- /entities/view/51262
- /entities/view/51339
- /entities/list/632
- /entities/list/612
- /entities/view/51567
- /entities/view/51849
- /entities/related_entities_list/51849?relation_id=402&popup=t&type=children&list_id=has+contact_child
- /entities/list/609
- /entities/view/51258
- /entities/view/51552
- /entities/related_entities_list/51255?relation_id=400&popup=t&type=parents&list_id=sung+by_parent
- /entities/related_entities_list/51255?relation_id=401&type=children
- /entities/view/51276
- /entities/view/51271
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=1&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=1&contains_child_page=2
- /entities/unlink/51377?relation_id=401&parent_id=51271&type=children
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=help_info_admin&page=2
- /entities/view/51320
- /admin/translations/translations_list?normal_filter=%2BEnvoyer%2B&value_filter=title&page=2
- /entities/list/613
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=title&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=3');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (330, 'updated_at', '', '--- 
- /admin/translations
- /admin/translations/translations_list
- /admin/translations/list
- /admin/translations/translations_list?page=2
- /admin/translations/translations_list?page=3
- /admin/translations/translations_list?page=4
- /admin/translations/translations_list?page=1
- /admin/translations/translations_list?page=5
- /admin/translations/translations_list?page=6
- /admin/translations/translations_list?page=7
- /admin/translations/translations_list?page=8
- /admin/translations/translations_list?page=9
- /admin/translations/translations_list?page=10
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=help_info_admin&page=2
- /admin/translations/translations_list?normal_filter=%2BEnvoyer%2B&value_filter=title&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=title&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=3');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (343, 'madb_previous_page', '', '--- 
- /admin/translations/translations_list?page=2
- /admin/translations/translations_list?page=3
- /admin/translations/translations_list?page=4
- /admin/translations/translations_list?page=5
- /admin/translations/translations_list?page=6
- /admin/translations/translations_list?page=7
- /admin/translations/translations_list?page=8
- /admin/translations/translations_list?page=9
- /admin/translations/translations_list?page=10
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=help_info_admin&page=2
- /admin/translations/translations_list?normal_filter=%2BEnvoyer%2B&value_filter=title&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=title&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=3');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (525, 'madb_really_unlink_detail_question', '
 With translation parameters:
detail, ', '--- 
- /admin/entities/show/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (491, 'madb_define_link', '
 With translation parameters:
child, parent, ', '--- 
- /admin/entities/edit_link/418?source_id=608
- /admin/entities/edit_link/419?source_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (458, 'madb_child_entity', '', '--- 
- /admin/entities/define_link?parent_id=608
- /admin/entities/edit_link/418?source_id=608
- /admin/entities/edit_link/419?source_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (483, 'madb_from_parent_to_child_relation_name', '
 With translation parameters:
parent_entity, child_entity, ', '--- 
- /admin/entities/define_link?parent_id=608
- /admin/entities/define_link?child_id=608
- /admin/entities/edit_link/418?source_id=608
- /admin/entities/edit_link/419?source_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (484, 'madb_from_child_to_parent_relation_name', '
 With translation parameters:
parent_entity, child_entity, ', '--- 
- /admin/entities/define_link?parent_id=608
- /admin/entities/define_link?child_id=608
- /admin/entities/edit_link/418?source_id=608
- /admin/entities/edit_link/419?source_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (461, 'madb_can_one_child_entity_have_several_parents_question', '', '--- 
- /admin/entities/define_link?parent_id=608
- /admin/entities/define_link?child_id=608
- /admin/entities/edit_link/418?source_id=608
- /admin/entities/edit_link/419?source_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (462, 'madb_can_one_parent_entity_have_several_children_question', '', '--- 
- /admin/entities/define_link?parent_id=608
- /admin/entities/define_link?child_id=608
- /admin/entities/edit_link/418?source_id=608
- /admin/entities/edit_link/419?source_id=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (463, 'madb_new_detail_title', '', '--- 
- /admin/details/new?for_entity=608
- /admin/details/new?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (464, 'madb_help_info_admin_details_new', '', '--- 
- /admin/details/new?for_entity=608
- /admin/details/new?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (465, 'madb_help_info_admin_details_value_propositions_for_new', '', '--- 
- /admin/details/new?for_entity=608
- /admin/details/new?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (466, 'madb_remove_propositions', '', '--- 
- /admin/details/new?for_entity=608
- /admin/details/new?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (467, 'madb_add_proposition', '', '--- 
- /admin/details/new?for_entity=608
- /admin/details/new?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (468, 'madb_quick_submit', '', '--- 
- /admin/details/new?for_entity=608
- /admin/details/new?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (509, 'madb_help_info_admin_details_list', '', '--- 
- /admin/details?db=200
- /admin/details?db=194
- /admin/details/list?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (510, 'madb_define_new_detail', '', '--- 
- /admin/details?db=200
- /admin/details?db=194
- /admin/details/list?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (306, 'madb_delete', '', '--- 
- /entities/list/608
- /entities/list/611
- /entities/list/610
- /entities/entities_list
- /entities/entities_list/608?CDs_list_order=year
- /entities/list/632
- /entities/list/612
- /entities/list/609
- /admin/entities/show/608
- /entities/list/613
- /admin/details?db=200
- /admin/details?db=194
- /admin/details/list?db=194
- /admin/users
- /admin/users/list');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (527, 'madb_help_info_admin_details_new_quick_commit', '', '--- 
- /admin/details/new?for_entity=608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (443, 'madb_help_info_spec_of_detail_for_entity', '', '--- 
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (444, 'madb_status', '', '--- 
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (445, 'madb_displayed_in_list_view', '', '--- 
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (447, 'madb_no', '', '--- 
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/entities?db=194
- /settings/show
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (448, 'madb_maximum_number_of_values', '', '--- 
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (396, 'madb_help_info_search_index', '', '--- 
- /search?entity_id=611&database_id=195
- /search?entity_id=608&database_id=194
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (397, 'madb_choose_database', '', '--- 
- /search?entity_id=611&database_id=195
- /search?entity_id=608&database_id=194
- /search/simple_search_form
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (398, 'madb_all', '', '--- 
- /search?entity_id=611&database_id=195
- /search?entity_id=608&database_id=194
- /search/simple_search_form
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (399, 'madb_enter_value_to_search_for', '', '--- 
- /search?entity_id=611&database_id=195
- /search?entity_id=608&database_id=194
- /search/simple_search_form
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (400, 'madb_searched_database', '', '--- 
- /search?entity_id=611&database_id=195
- /search?entity_id=608&database_id=194
- /search/simple_search_form
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (401, 'madb_searched_entity', '', '--- 
- /search?entity_id=611&database_id=195
- /search?entity_id=608&database_id=194
- /search/simple_search_form
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (403, 'madb_searched_value', '', '--- 
- /search?entity_id=608&database_id=194
- /search?entity_id=611&database_id=195
- /search/simple_search_form
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (405, 'madb_refresh', '', '--- 
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/list_for_entity?popup=t&value=al&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=2&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=3&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=4&entity_id=612
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/list_for_entity?value=a&detail_id=0&CDs_search_result_page=2&entity_id=608
- /search/list_for_entity?value=a&detail_id=0&CDs_search_result_page=1&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (297, 'madb_open_in_new_window', '', '--- 
- /entities/list/608
- /entities/list/611
- /entities/view/51565
- /entities/list/610
- /entities/entities_list
- /entities/view/51378
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /entities/entities_list/608?CDs_list_order=year
- /entities/view/51262
- /entities/view/51339
- /entities/list/632
- /entities/list/612
- /entities/view/51567
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/list_for_entity?popup=t&value=al&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=2&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=3&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=4&entity_id=612
- /entities/view/51849
- /entities/list/609
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /entities/related_entities_list/51255?relation_id=401&type=children
- /entities/view/51276
- /entities/view/51271
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=1&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=1&contains_child_page=2
- /entities/unlink/51377?relation_id=401&parent_id=51271&type=children
- /entities/view/51320
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/list_for_entity?value=a&detail_id=0&CDs_search_result_page=2&entity_id=608
- /search/list_for_entity?value=a&detail_id=0&CDs_search_result_page=1&entity_id=608
- /entities/list/613
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (304, 'madb_view', '', '--- 
- /entities/list/608
- /database/list_entities/194
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /entities/list/610
- /entities/entities_list
- /entities/view/51378
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /entities/entities_list/608?CDs_list_order=year
- /entities/view/51262
- /entities/view/51339
- /entities/list/632
- /entities/list/612
- /entities/view/51567
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/list_for_entity?popup=t&value=al&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=2&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=3&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=4&entity_id=612
- /entities/view/51849
- /entities/related_entities_list/51849?relation_id=402&popup=t&type=children&list_id=has+contact_child
- /entities/list/609
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /entities/related_entities_list/51255?relation_id=400&popup=t&type=parents&list_id=sung+by_parent
- /entities/related_entities_list/51255?relation_id=401&type=children
- /entities/view/51276
- /entities/view/51271
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=1&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=1&contains_child_page=2
- /entities/unlink/51377?relation_id=401&parent_id=51271&type=children
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/list_for_entity?value=a&detail_id=0&CDs_search_result_page=2&entity_id=608
- /search/list_for_entity?value=a&detail_id=0&CDs_search_result_page=1&entity_id=608
- /entities/list/613
- /database/list_entities/200
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (531, 'madb_delete_detail_question', '
 With translation parameters:
detail, ', '--- 
- /admin/details?db=194');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (342, 'madb_use', '', '--- 
- /database
- /entities/link_to_existing?relation_id=400&parent_id=51276&update=singer+on_child_div&link_to_many=t&embedded=link_existing_child_singer+on_div
- /entities/link_to_existing?link_to_many=f&relation_id=419&embedded=link_existing_parent_sur+la+face+b+de_div&update=sur+la+face+b+de_parent_div&child_id=51377
- /entities/link_to_existing?link_to_many=f&relation_id=419&embedded=link_existing_child_face+b_div&parent_id=51255&update=face+b_child_div
- /entities/list_available_for_link?link_to_many=f&relation_id=419&embedded=link_existing_child_face+b_div&parent_id=51255&face+b_linkable_list_page=2&update=face+b_child_div');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (374, 'madb_no_data_found', '', '--- 
- /entities/entities_list
- /entities/link_to_existing?relation_id=401&parent_id=51255&update=contains_child_div&embedded=link_existing_child_contains_div&link_to_many=t
- /entities/view/51320
- /entities/view/51255
- /entities/view/51377
- /entities/list_available_for_link');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (389, 'madb_help', '', '--- 
- /admin/translations/list
- /admin/translations
- /entities/list/608
- /entities/view/51262
- /entities/view/51339
- /entities/view/51255
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /search?entity_id=608&database_id=194
- /database
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /entities/view/51849
- /entities/list/609
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/entities/define_link?parent_id=608
- /entities/view/51276
- /entities/list/610
- /entities/view/51377
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/databases
- /admin/entities?db=194
- /admin/entities/define_link?child_id=608
- /database/list_entities/194
- /admin/details/edit/1606
- /entities/view/51320
- /admin/entities/edit_link/418?source_id=608
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /database/list_entities/195
- /entities/list/613
- /database/list_entities/200
- /settings/show
- /admin/databases/edit/194
- /admin/details?db=200
- /admin/details/show/1684
- /admin/details/edit/1684
- /admin/entities/add_existing_choose/608
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/details/show/1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (439, 'madb_help_info_admin_details_show', '', '--- 
- /admin/details/show/1606
- /admin/details/show/1612
- /admin/details/show/1684
- /admin/details/show/1607
- /admin/details/show/1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (369, 'madb_help_info_you_can_disable_help_in_your_settings', '', '--- 
- /database
- /database/list_entities/194
- /entities/list/610
- /entities/list/608
- /entities/view/51378
- /admin/translations/list
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /admin/translations
- /entities/view/51262
- /entities/view/51339
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /search?entity_id=608&database_id=194
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /entities/view/51849
- /entities/list/609
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/entities/define_link?parent_id=608
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/databases
- /admin/entities?db=194
- /admin/entities/define_link?child_id=608
- /admin/details/edit/1606
- /entities/view/51320
- /admin/entities/edit_link/418?source_id=608
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /database/list_entities/195
- /entities/list/613
- /database/list_entities/200
- /settings/show
- /admin/databases/edit/194
- /admin/details?db=200
- /admin/details/show/1684
- /admin/details/edit/1684
- /admin/entities/add_existing_choose/608
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/details/show/1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (440, 'madb_proposition_exists', '', '--- 
- /admin/details/show/1606
- /admin/details/show/1612
- /admin/details/new?for_entity=608
- /admin/details/edit/1606
- /admin/details/show/1684
- /admin/details/edit/1684
- /admin/details/show/1607
- /admin/details/new?db=194
- /admin/details/show/1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (341, 'madb_name', '', '--- 
- /database
- /database/list_entities/194
- /database/list_entities/195
- /admin/details/show/1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/details/new?for_entity=608
- /admin/details/edit/1606
- /database/list_entities/200
- /admin/databases/edit/194
- /admin/details/show/1684
- /admin/details/edit/1684
- /admin/entities/new?db=194
- /admin/entities/add_existing_choose/608
- /admin/details/show/1607
- /admin/details/new?db=194
- /admin/details/show/1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (441, 'madb_data_type', '', '--- 
- /admin/details/show/1606
- /admin/details/show/1612
- /admin/details/new?for_entity=608
- /admin/details/edit/1606
- /admin/details/show/1684
- /admin/details/edit/1684
- /admin/entities/add_existing_choose/608
- /admin/details/show/1607
- /admin/details/new?db=194
- /admin/details/show/1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (442, 'madb_help_info_admin_details_value_propositions_for_show', '', '--- 
- /admin/details/show/1606
- /admin/details/show/1612
- /admin/details/show/1684
- /admin/details/show/1607
- /admin/details/show/1689');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (533, 'madb_users_list', '', '--- 
- /admin/users
- /admin/users/list');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (540, 'madb_new_users', '', '--- 
- /admin/users/new');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (541, 'madb_email_confirmation', '', '--- 
- /admin/users/new');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (542, 'madb_signup', '', '--- 
- /admin/users/new');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (543, 'madb_email', '', '--- 
- /admin/users/new');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (538, 'madb_reset_password', '', '--- 
- /admin/users
- /admin/users/list');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (295, 'madb_submit', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/translations_list
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /admin/translations/edit/back?scope=system
- /admin/translations/translations_list?page=2
- /admin/translations/translations_list?page=3
- /admin/translations/translations_list?page=4
- /admin/translations/translations_list?page=1
- /admin/translations/translations_list?page=5
- /admin/translations/translations_list?page=6
- /admin/translations/translations_list?page=7
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/translations_list?page=8
- /admin/translations/translations_list?page=9
- /admin/translations/translations_list?page=10
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/entities_list
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/entities_list/608?CDs_list_order=year
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /entities/link_to_existing?relation_id=401&parent_id=51262&update=contains_child_div&embedded=link_existing_child_contains_div&link_to_many=t%20%20
- /entities/link_to_new/610?relation_id=401&parent_id=51262&update=contains_child_div&embedded=add_new_child_contains_div%20%20
- /entities/link_to_new/610?relation_id=401&parent_id=51255&update=contains_child_div&embedded=add_new_child_contains_div
- /entities/link_to_existing?relation_id=401&parent_id=51255&update=contains_child_div&embedded=link_existing_child_contains_div&link_to_many=t
- /entities/link_to_existing?relation_id=400&update=sung+by_parent_div&embedded=link_existing_parent_sung+by_div&child_id=51262&link_to_many=t%20%20
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/list/612
- /entities/view/51567
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/link_to_existing?relation_id=402&parent_id=51849&update=has+contact_child_div&embedded=link_existing_child_has+contact_div&link_to_many=t
- /entities/list_available_for_link?relation_id=402&parent_id=51849&embedded=link_existing_child_has+contact_div&update=has+contact_child_div&link_to_many=t&has+contact_linkable_list_page=8
- /entities/list_available_for_link?relation_id=402&parent_id=51849&embedded=link_existing_child_has+contact_div&update=has+contact_child_div&has+contact_linkable_list_page=8&link_to_many=t&has+contact_linkable_list_page=15
- /entities/related_entities_list/51849?relation_id=402&popup=t&type=children&list_id=has+contact_child
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /entities/view/51258
- /entities/view/51552
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/related_entities_list/51255?relation_id=400&popup=t&type=parents&list_id=sung+by_parent
- /entities/related_entities_list/51255?relation_id=401&type=children
- /entities/link_to_existing?relation_id=400&update=sung+by_parent_div&embedded=link_existing_parent_sung+by_div&link_to_many=t&child_id=51255
- /entities/view/51276
- /entities/view/51271
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=1&contains_child_page=2
- /entities/link_to_existing?relation_id=400&update=sung+by_parent_div&embedded=link_existing_parent_sung+by_div&link_to_many=t&child_id=51271
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=1&contains_child_page=2
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /entities/unlink/51377?relation_id=401&parent_id=51271&type=children
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=help_info_admin&page=2
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /admin/translations/translations_list?normal_filter=%2BEnvoyer%2B&value_filter=title&page=2
- /entities/link_to_existing?relation_id=419&parent_id=51255&update=face+b_child_div&link_to_many=f&embedded=link_existing_child_face+b_div
- /entities/link_to_new/610?relation_id=419&parent_id=51255&update=face+b_child_div&embedded=add_new_child_face+b_div
- /entities/list/613
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=title&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=3
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/entities/edit_link/419?source_id=608
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /entities/list_available_for_link?relation_id=419&parent_id=51255&update=face+b_child_div&face+b_linkable_list_page=2&link_to_many=f&embedded=link_existing_child_face+b_div
- /entities/list_available_for_link?relation_id=419&parent_id=51255&update=face+b_child_div&face+b_linkable_list_page=3&link_to_many=f&embedded=link_existing_child_face+b_div
- /entities/list_available_for_link?relation_id=419&parent_id=51255&update=face+b_child_div&face+b_linkable_list_page=4&link_to_many=f&embedded=link_existing_child_face+b_div
- /entities/link_to_existing?relation_id=418&parent_id=51255&update=contains_child_div&link_to_many=t&embedded=link_existing_child_contains_div
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /entities/link_to_existing?relation_id=419&child_id=51377&update=sur+la+face+b+de_parent_div&link_to_many=f&embedded=link_existing_parent_sur+la+face+b+de_div
- /entities/link_to_existing?relation_id=400&parent_id=51276&update=singer+on_child_div&link_to_many=t&embedded=link_existing_child_singer+on_div
- /entities/link_to_existing?link_to_many=f&relation_id=419&embedded=link_existing_parent_sur+la+face+b+de_div&update=sur+la+face+b+de_parent_div&child_id=51377
- /entities/link_to_new/608?relation_id=419&embedded=add_new_parent_sur+la+face+b+de_div&update=sur+la+face+b+de_parent_div&child_id=51377
- /entities/link_to_existing?link_to_many=f&relation_id=419&embedded=link_existing_child_face+b_div&parent_id=51255&update=face+b_child_div
- /entities/list_available_for_link?link_to_many=f&relation_id=419&embedded=link_existing_child_face+b_div&parent_id=51255&face+b_linkable_list_page=2&update=face+b_child_div
- /entities/list_available_for_link
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/users/new
- /admin/translations/edit/madb_email?scope=system
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (544, 'madb_delete_user_question', '
 With translation parameters:
login, ', '--- 
- /admin/users/list
- /admin/users');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (536, 'madb_user_type', '', '--- 
- /admin/users
- /admin/users/new
- /admin/users/list
- /admin/users/show/1000001
- /admin/users/show/1000002');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (446, 'madb_yes', '', '--- 
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/entities?db=194
- /settings/show
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /admin/users/show/1000002');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (550, 'madb_user_verified', '', '--- 
- /admin/users/show/1000002');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (535, 'madb_lastname', '', '--- 
- /admin/users
- /admin/users/new
- /admin/users/list
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/users/edit/1000002
- /admin/users/edit/1000155');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (507, 'madb_show', '', '--- 
- /admin/databases/edit/194
- /admin/details?db=200
- /admin/details?db=194
- /admin/details/list?db=194
- /admin/users
- /admin/users/list
- /admin/users/edit/1000001
- /admin/users/edit/1000002');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (549, 'madb_editing_users', '', '--- 
- /admin/users/edit/1000001
- /admin/users/edit/1000002
- /admin/users/edit/1000155');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (534, 'madb_firstname', '', '--- 
- /admin/users
- /admin/users/new
- /admin/users/list
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/users/edit/1000002
- /admin/users/edit/1000155');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (285, 'madb_login', '', '--- 
- /authentication/login
- /admin/users
- /admin/users/list
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/users/edit/1000002
- /admin/users/edit/1000155');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (551, 'madb_create_user', '', '--- 
- /admin/users/list
- /admin/users');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (305, 'madb_edit', '', '--- 
- /entities/list/608
- /entities/list/611
- /entities/view/51565
- /admin/translations/show/1088
- /entities/list/610
- /entities/entities_list
- /entities/view/51378
- /entities/view/51255
- /entities/view/59562
- /entities/view/51377
- /entities/entities_list/608?CDs_list_order=year
- /entities/view/51262
- /entities/view/51339
- /entities/list/632
- /entities/view/59600
- /entities/list/612
- /entities/view/51567
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /search/list_for_entity?popup=t&value=al&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=2&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=3&entity_id=612
- /search/list_for_entity?value=al&contacts_search_result_page=4&entity_id=612
- /entities/view/51849
- /entities/related_entities_list/51849?relation_id=402&popup=t&type=children&list_id=has+contact_child
- /entities/list/609
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/details/show/1606
- /admin/details/show/1612
- /entities/related_entities_list/51255?relation_id=400&popup=t&type=parents&list_id=sung+by_parent
- /entities/related_entities_list/51255?relation_id=401&type=children
- /entities/view/51276
- /entities/view/51271
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&type=children&contains_child_page=1&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=2
- /entities/related_entities_list/51271?relation_id=401&contains_child_order=title&type=children&contains_child_page=1&contains_child_page=2
- /entities/unlink/51377?relation_id=401&parent_id=51271&type=children
- /entities/view/51320
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /search/list_for_entity?value=a&detail_id=0&CDs_search_result_page=2&entity_id=608
- /search/list_for_entity?value=a&detail_id=0&CDs_search_result_page=1&entity_id=608
- /entities/list/613
- /admin/databases/edit/194
- /admin/details?db=200
- /admin/details/show/1684
- /admin/details/show/1607
- /admin/details?db=194
- /admin/details/list?db=194
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/details/show/1689
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/users/edit/1000002
- /admin/users/edit/1000155');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (294, 'madb_cancel', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/translations_list
- /admin/translations/list
- /admin/translations/translations_list?page=2
- /admin/translations/translations_list?page=3
- /admin/translations/translations_list?page=4
- /admin/translations/translations_list?page=1
- /admin/translations/translations_list?page=5
- /admin/translations/translations_list?page=6
- /admin/translations/translations_list?page=7
- /entities/list/611
- /admin/translations/translations_list?page=8
- /admin/translations/translations_list?page=9
- /admin/translations/translations_list?page=10
- /entities/list/610
- /entities/link_to_new/610?relation_id=401&parent_id=51262&update=contains_child_div&embedded=add_new_child_contains_div%20%20
- /entities/link_to_new/610?relation_id=401&parent_id=51255&update=contains_child_div&embedded=add_new_child_contains_div
- /entities/link_to_existing?relation_id=400&update=sung+by_parent_div&embedded=link_existing_parent_sung+by_div&child_id=51262&link_to_many=t%20%20
- /entities/list/632
- /entities/edit/59600
- /entities/list/612
- /entities/link_to_existing?relation_id=402&parent_id=51849&update=has+contact_child_div&embedded=link_existing_child_has+contact_div&link_to_many=t
- /entities/list_available_for_link?relation_id=402&parent_id=51849&embedded=link_existing_child_has+contact_div&update=has+contact_child_div&link_to_many=t&has+contact_linkable_list_page=8
- /entities/list_available_for_link?relation_id=402&parent_id=51849&embedded=link_existing_child_has+contact_div&update=has+contact_child_div&has+contact_linkable_list_page=8&link_to_many=t&has+contact_linkable_list_page=15
- /entities/list/609
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/entities/edit/608
- /entities/link_to_existing?relation_id=401&parent_id=51255&update=contains_child_div&embedded=link_existing_child_contains_div&link_to_many=t
- /entities/link_to_existing?relation_id=400&update=sung+by_parent_div&embedded=link_existing_parent_sung+by_div&link_to_many=t&child_id=51255
- /entities/link_to_existing?relation_id=400&update=sung+by_parent_div&embedded=link_existing_parent_sung+by_div&link_to_many=t&child_id=51271
- /admin/details/new?for_entity=608
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=help_info_admin&page=2
- /entities/public_form/608
- /admin/translations/translations_list?normal_filter=%2BEnvoyer%2B&value_filter=title&page=2
- /entities/link_to_existing?relation_id=419&parent_id=51255&update=face+b_child_div&link_to_many=f&embedded=link_existing_child_face+b_div
- /entities/link_to_new/610?relation_id=419&parent_id=51255&update=face+b_child_div&embedded=add_new_child_face+b_div
- /entities/list/613
- /settings/show
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=title&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=2
- /admin/translations/translations_list?normal_filter=%2BSubmit%2B&value_filter=name&page=3
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/details/new?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /entities/list_available_for_link?relation_id=419&parent_id=51255&update=face+b_child_div&face+b_linkable_list_page=2&link_to_many=f&embedded=link_existing_child_face+b_div
- /entities/list_available_for_link?relation_id=419&parent_id=51255&update=face+b_child_div&face+b_linkable_list_page=3&link_to_many=f&embedded=link_existing_child_face+b_div
- /entities/list_available_for_link?relation_id=419&parent_id=51255&update=face+b_child_div&face+b_linkable_list_page=4&link_to_many=f&embedded=link_existing_child_face+b_div
- /entities/link_to_existing?relation_id=418&parent_id=51255&update=contains_child_div&link_to_many=t&embedded=link_existing_child_contains_div
- /entities/link_to_existing?relation_id=419&child_id=51377&update=sur+la+face+b+de_parent_div&link_to_many=f&embedded=link_existing_parent_sur+la+face+b+de_div
- /entities/link_to_existing?relation_id=400&parent_id=51276&update=singer+on_child_div&link_to_many=t&embedded=link_existing_child_singer+on_div
- /entities/link_to_existing?link_to_many=f&relation_id=419&embedded=link_existing_parent_sur+la+face+b+de_div&update=sur+la+face+b+de_parent_div&child_id=51377
- /entities/link_to_new/608?relation_id=419&embedded=add_new_parent_sur+la+face+b+de_div&update=sur+la+face+b+de_parent_div&child_id=51377
- /entities/link_to_existing?link_to_many=f&relation_id=419&embedded=link_existing_child_face+b_div&parent_id=51255&update=face+b_child_div
- /entities/list_available_for_link?link_to_many=f&relation_id=419&embedded=link_existing_child_face+b_div&parent_id=51255&face+b_linkable_list_page=2&update=face+b_child_div
- /entities/list_available_for_link
- /admin/users/new
- /admin/users/edit/1000001
- /admin/users/edit/1000155');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (552, 'madb_password_reset_mail_sent', '', '--- 
- /admin/users/reset_password/1000155');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (553, 'madb_notice_password_updated', '', '--- 
- /authentication/change_password');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (554, 'madb_settings_could_not_be_saved', '', '--- 
- /settings/apply');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (555, 'madb_you_dont_have_sufficient_credentials_for_action', '', '--- 
- /admin/users/reset_password/1000155
- /admin/users/new');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (333, 'madb_editing_translations', '', '--- 
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/edit/back?scope=system
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /admin/translations/edit/madb_refresh?scope=system
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (334, 'madb_notes', '', '--- 
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/edit/back?scope=system
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /admin/translations/edit/madb_refresh?scope=system
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (335, 'madb_urls_where_translation_appears', '', '--- 
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/edit/back?scope=system
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /admin/translations/edit/madb_refresh?scope=system
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (336, 'madb_submit_all', '', '--- 
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/edit/back?scope=system
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /admin/translations/edit/madb_refresh?scope=system
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (309, 'fr', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (337, 'madb_resize', '', '--- 
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/edit/back?scope=system
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /admin/translations/edit/madb_refresh?scope=system
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (310, 'nl', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (308, 'en', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (312, 'madb_manage_translations', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (314, 'madb_new_translation', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (315, 'madb_admin_databases', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (316, 'madb_admin_users', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (317, 'madb_settings', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (318, 'madb_logout', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (353, 'madb_busy', '', '--- 
- /entities/view/51565
- /database
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/list
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/list/608
- /entities/view/51378
- /admin/translations
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /database/list_entities/195
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (319, 'madb_my_databases', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (320, 'madb_admin_database', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (370, 'madb_database_menu_link_title', '', '--- 
- /database
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/list
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/list/608
- /entities/view/51378
- /admin/translations
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /database/list_entities/195
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (322, 'madb_search', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /search/simple_search_form
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (371, 'madb_entity_menu_link_title', '
 With translation parameters:
entity, ', '--- 
- /database
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/list
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/list/608
- /entities/view/51378
- /admin/translations
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /database/list_entities/195
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (321, 'madb_add_new', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_notice_password_updated?scope=system
- /admin/translations/edit/madb_you_dont_have_sufficient_credentials_for_action?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (323, 'madb_modify_entity', '', '--- 
- /entities/list/608
- /admin/translations
- /admin/translations/edit/madb_manage_translations?scope=system
- /admin/translations/list
- /database
- /admin/translations/edit/back?scope=system
- /database/list_entities/194
- /admin/translations/edit/madb_create_new_entity?scope=system
- /admin/translations/edit/madb_view?scope=system
- /database/list_entities/195
- /entities/list/611
- /entities/view/51565
- /admin/translations/edit/delete?scope=system
- /admin/translations/edit/madb_add_new?scope=system
- /admin/translations/edit/madb_login?scope=system
- /admin/translations/edit/date?scope=system
- /admin/translations/edit/address?scope=system
- /admin/translations/edit/city?scope=system
- /admin/translations/edit/CDs?scope=system
- /admin/translations/edit/companies?scope=system
- /admin/translations/show/1088
- /admin/translations/edit/madb_password?scope=system
- /admin/translations/edit/madb_use?scope=system
- /admin/translations/edit/madb_my_databases?scope=system
- /admin/translations/edit/madb_help_info_you_can_disable_help_in_your_settings?scope=system
- /admin/translations/edit/madb_help_info_database_list?scope=system
- /admin/translations/edit/madb_help_info_database_list_entities?scope=system
- /entities/list/610
- /admin/translations/edit/madb_edit?scope=system
- /admin/translations/edit/madb_filter_on?scope=system
- /admin/translations/edit/madb_with_value?scope=system
- /entities/view/51378
- /admin/translations/edit/madb_help_info_entities_list_intro?scope=system
- /admin/translations/edit/madb_really_delete_entity_question?scope=system
- /entities/view/51255
- /admin/translations/edit/madb_help_info_entities_view_intro?scope=system
- /admin/translations/edit/madb_help_info_entities_views_related_entities?scope=system
- /entities/view/59562
- /entities/view/51377
- /admin/translations/edit/madb_register_for_an_account?scope=system
- /admin/translations/edit/mabd_forgot_your_password_question?scope=system
- /admin/translations/edit/madb_help?scope=system
- /entities/view/51262
- /entities/view/51339
- /admin/translations/edit/madb_add_new_related_entity?scope=system
- /admin/translations/edit/madb_no_data_found?scope=system
- /entities/list/632
- /entities/view/59600
- /entities/edit/59600
- /entities/list/612
- /entities/view/51567
- /search?entity_id=611&database_id=195
- /admin/translations/edit/madb_searched_database?scope=system
- /admin/translations/edit/madb_searched_entity?scope=system
- /admin/translations/new/madb_searched_detail/
- /search?entity_id=608&database_id=194
- /admin/translations/edit/madb_searched_value?scope=system
- /admin/translations/edit/madb_choose_database?scope=system
- /admin/translations/edit/madb_all?scope=system
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=a
- /search/results_page?database_id=195&entity_id=611&detail_id=1614&value=al
- /search/results_page?database_id=195&entity_id=0&value=al
- /admin/translations/edit/madb_refresh?scope=system
- /entities/view/51849
- /entities/list/609
- /admin/translations/edit/madb_help_info_search_index?scope=system
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=al
- /entities/view/51258
- /entities/view/51552
- /admin/entities/show/608
- /admin/translations/edit/madb_help_info_admin_entities_show_intro?scope=system
- /admin/details/show/1606
- /admin/entities/edit_existing_precisions/608?detail_id=1606
- /admin/details/show/1612
- /admin/entities/edit/608
- /admin/translations/edit/madb_help_info_admin_entities_show_links_to_other_entities?scope=system
- /admin/entities/define_link?parent_id=608
- /admin/translations/edit/madb_multiple_parents_allowed?scope=system
- /admin/translations/edit/madb_no_only_one_parent_allowed?scope=system
- /admin/translations/edit/madb_yes_many_children_allowed?scope=system
- /entities/view/51276
- /entities/view/51271
- /admin/details/new?for_entity=608
- /admin/translations/edit/madb_from_parent_to_child_relation_name?scope=system
- /admin/databases
- /admin/entities?db=194
- /admin/translations/edit/madb_from_child_to_parent_relation_name?scope=system
- /admin/entities/define_link?child_id=608
- /admin/translations/edit/madb_can_one_child_entity_have_several_parents_question?scope=system
- /admin/translations/edit/madb_can_one_parent_entity_have_several_children_question?scope=system
- /admin/translations/edit/madb_really_delete_all_existing_links_question?scope=system
- /admin/details/edit/1606
- /entities/view/51320
- /admin/translations/edit/madb_details_for_entity?scope=system
- /admin/translations/edit/madb_entity?scope=system
- /admin/entities/edit_link/418?source_id=608
- /admin/translations/edit/madb_define_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_edit_link?scope=system
- /admin/translations/edit/madb_help_info_admin_entities_define_link?scope=system
- /search?database_id=194&entity_id=608
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=night
- /search/results_page?database_id=194&entity_id=608&detail_id=1606&value=bor
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=a
- /entities/list/613
- /database/list_entities/200
- /admin/translations/edit/madb_help_info_entities_edition?scope=system
- /settings/show
- /admin/translations/edit/madb_help_info_settings_show_intro?scope=system
- /admin/translations/edit/madb_enter_your_new_password_below?scope=system
- /admin/translations/edit/madb_choose_password?scope=system
- /admin/translations/edit/madb_confirm_password?scope=system
- /admin/translations/edit/madb_really_delete_database_question?scope=system
- /admin/databases/edit/194
- /admin/translations/edit/madb_help_info_admin_databases_list?scope=system
- /admin/translations/edit/madb_create_database?scope=system
- /admin/details?db=200
- /admin/translations/edit/madb_help_info_admin_details_list?scope=system
- /admin/translations/edit/madb_define_new_detail?scope=system
- /admin/translations/edit/madb_show?scope=system
- /admin/details/show/1684
- /admin/translations/edit/madb_help_info_admin_details_show?scope=system
- /admin/details/edit/1684
- /admin/translations/edit/madb_administrate?scope=system
- /admin/translations/edit/madb_new_entity?scope=system
- /admin/translations/edit/madb_entities_list?scope=system
- /admin/entities/new?db=194
- /admin/translations/edit/madb_help_info_admin_entities_list?scope=system
- /admin/entities/add_existing_choose/608
- /admin/translations/edit/madb_help_info_admin_entities_add_existing_choose?scope=system
- /admin/entities/add_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_help_info_spec_of_detail_for_entity?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1607
- /admin/translations/edit/madb_really_unlink_detail_question?scope=system
- /admin/details/show/1607
- /admin/entities/edit_link/419?source_id=608
- /admin/details?db=194
- /admin/details/new?db=194
- /admin/translations/edit/madb_help_info_admin_details_new?scope=system
- /admin/translations/edit/madb_help_info_admin_details_value_propositions_for_new?scope=system
- /admin/translations/edit/madb_quick_submit?scope=system
- /admin/translations/edit/madb_remove_propositions?scope=system
- /admin/translations/edit/madb_add_proposition?scope=system
- /admin/details/list?db=194
- /admin/entities/add_existing_precisions/608?detail_id=1608
- /admin/translations/edit/madb_help_info_admin_details_new_quick_commit?scope=system
- /admin/entities/edit_existing_precisions/608?detail_id=1687
- /admin/entities/edit_existing_precisions/608?detail_id=1688
- /admin/entities/edit_existing_precisions/608?detail_id=1689
- /search/results_page?database_id=194&entity_id=608&detail_id=0&value=bo
- /admin/translations/edit/madb_delete_detail_question?scope=system
- /admin/details/show/1689
- /admin/users
- /admin/users/new
- /admin/translations/edit/madb_lastname?scope=system
- /admin/translations/edit/madb_firstname?scope=system
- /admin/translations/edit/madb_email_confirmation?scope=system
- /admin/translations/edit/madb_user_type?scope=system
- /admin/translations/edit/madb_email?scope=system
- /admin/users/list
- /admin/translations/edit/madb_new_users?scope=system
- /admin/translations/edit/madb_delete_user_question?scope=system
- /admin/users/show/1000001
- /admin/users/edit/1000001
- /admin/users/show/1000002
- /admin/translations/edit/madb_user_verified?scope=system
- /admin/users/edit/1000002
- /admin/translations/edit/madb_reset_password?scope=system
- /admin/translations/edit/madb_create_user?scope=system
- /admin/translations/new/madb_users_was_successfully_created/
- /admin/users/edit/1000155
- /admin/translations/edit/madb_password_reset_mail_sent?scope=system
- /admin/translations/edit/madb_mail_password_change_intro?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (556, 'madb_new_database_title', '', '--- 
- /admin/databases/new');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (557, 'madb_forgotten_password', '', '--- 
- /authentication/forgot_password');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (558, 'madb_enter_your_email_address_to_have_a_new_password_sent_to_you', '', '--- 
- /authentication/forgot_password');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (559, 'madb_reset_password_title', '', '--- 
- /authentication/forgot_password');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (560, 'madb_new_password_sent', '
 With translation parameters:
mail, ', '--- 
- /authentication/forgot_password');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (561, 'madb_could_not_find_account_with_email', '
 With translation parameters:
mail, ', '--- 
- /authentication/forgot_password');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (562, 'madb_account_signup', '', '--- 
- /authentication/signup');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (563, 'madb_company', '', '--- 
- /authentication/signup');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (564, 'madb_company_name', '', '--- 
- /authentication/signup');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (565, 'madb_company_street', '', '--- 
- /authentication/signup');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (566, 'madb_company_zip_code', '', '--- 
- /authentication/signup');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (567, 'madb_company_city', '', '--- 
- /authentication/signup');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (568, 'madb_company_country', '', '--- 
- /authentication/signup');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (570, 'madb_administrator_user', '', '--- 
- /authentication/signup');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (575, 'madb_this_entity_has_no_detail_displayed_in_list_view_and_this_will_show_theses_lists_as_empty', '', '--- 
- /admin/entities/show/633');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (576, 'madb_has_public_form', '', '--- 
- /admin/entities/list?db=205');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (577, 'madb_no_instance_found', '', '--- 
- /entities/list/633');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (578, 'madb_password_must_be_five_chars_and_equal_to_confirmation', '', '--- 
- /settings/show');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (579, 'madb_short_text', '', '--- 
- /admin/entities/add_existing_choose/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (580, 'madb_date', '', '--- 
- /admin/entities/add_existing_choose/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (581, 'madb_long_text', '', '--- 
- /admin/entities/add_existing_choose/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (582, 'madb_normal_user', '', '--- 
- /admin/users');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (583, 'madb_primary_user', '', '--- 
- /admin/users');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (584, 'madb_error_data_not_found', '', '--- 
- /entities/view/65757');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (586, 'madb_no_only_one_parent_allowed', '
 With translation parameters:
parent_entity, child_entity, ', '--- 
- /admin/entities/show/611');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (587, 'madb_add_and_instance', '
 With translation parameters:
entity, ', '--- 
- /entities/add/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (588, 'madb_search_results', '', '--- 
- /search/results_page?database_id=200&entity_id=632&detail_id=1684&value=2005&commit=%2BRecherche%2B');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (589, 'madb_list_of_databases', '', '--- 
- /database');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (590, 'madb_admin_entity', '
 With translation parameters:
entity, ', '--- 
- /admin/entities/show/611');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (592, 'madb_monthly_fee', '', '--- 
- /app/authentication/account_type_explanations/1');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (593, 'madb_question', '', '--- 
- /app/authentication/account_type_explanations/1');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (594, 'madb_display_contextual_help', '', '--- 
- /app/settings/show');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (595, 'madb_subscription_type', '', '--- 
- /app/settings/show');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (596, 'madb_translation_t_id', '', '--- 
- /app/admin/translations');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (597, 'madb_translation_value', '', '--- 
- /app/admin/translations');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (598, 'madb_translation_lang', '', '--- 
- /app/admin/translations');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (599, 'madb_translation_scope', '', '--- 
- /app/admin/translations');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (600, 'madb_translation_updated_at', '', '--- 
- /app/admin/translations');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (601, 'madb_translation_existing_translations', '', '--- 
- /app/admin/translations');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (602, 'madb_translation_missing_translations', '', '--- 
- /app/admin/translations');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (603, 'madb_translation_check_usage_in_source_code', '', '--- 
- /app/admin/translations');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (606, 'madb_edit_detail', '
 With translation parameters:
detail, ', '--- 
- /admin/details/edit/1606');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (607, 'madb_help_info_admin_edit_detail', '', '--- 
- /admin/details/edit/1606');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (614, 'madb_translation_ids', '', '--- 
- /app/admin/translations/list');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (617, 'it', '', '--- 
- /app/admin/translations/list');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (618, 'madb_english_translation', '', '--- 
- /app/admin/translations/edit/madb_users_list?scope=system');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (619, 'pt', '', '--- 
- /app/admin/users');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (620, 'pt-br', '', '--- 
- /app/admin/users');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (621, 'ru', '', '--- 
- /app/admin/users');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (622, 'madb_related_children_objects', '', '--- 
- /entities/view/51276');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (623, 'primary_user', '', '--- 
- /app/admin/users
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (624, 'normal_user', '', '--- 
- /app/admin/users/new
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (625, 'details', '', '--- 
- /app/admin/entities/show/1
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (626, 'Projects', '', '--- 
- /app/admin/entities/edit_existing_precisions/5?detail_id=1
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (627, 'Name', '', '--- 
- /app/admin/entities/edit_existing_precisions/5?detail_id=1
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (628, 'Type', '', '--- 
- /app/admin/entities/add_existing_precisions/5?detail_id=2
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (629, 'Test', '', '--- 
- /app/admin/entities/add_existing_precisions/5?detail_id=3
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (630, 'age', '', '--- 
- /app/admin/entities/add_existing_precisions/5?detail_id=4
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (631, 'Managers', '', '--- 
- /app/admin/entities/add_existing_precisions/6?detail_id=1
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (632, 'madb_requested_db_not_found', '', '--- 
- /app/admin/entities/list?db=2
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (633, 'Developers', '', '--- 
- /app/entities/edit/2
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (634, 'Tasks', '', '--- 
- /app/admin/entities/add_existing_precisions/10?detail_id=6
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (635, 'Milestones', '', '--- 
- /app/admin/entities/add_existing_precisions/11?detail_id=6
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (636, 'Deadline', '', '--- 
- /app/admin/entities/add_existing_precisions/11?detail_id=8
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (637, 'Artists', '', '--- 
- /app/admin/entities/add_existing_precisions/13?detail_id=10
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (638, 'Style', '', '--- 
- /app/admin/entities/add_existing_precisions/13?detail_id=10
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (639, 'Songs', '', '--- 
- /app/admin/entities/add_existing_precisions/14?detail_id=10
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (640, 'Albums', '', '--- 
- /app/admin/entities/add_existing_precisions/15?detail_id=11
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (641, 'Title', '', '--- 
- /app/admin/entities/add_existing_precisions/15?detail_id=11
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (642, 'Email', '', '--- 
- /app/admin/entities/add_existing_precisions/56?detail_id=102
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (643, 'madb_no_available_details_maybe_you_should_create_a_new_detail', '', '--- 
- /app/admin/entities/add_existing_choose/56
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (644, 'madb_error_occured_when_deleting_entity', '', '--- 
- /app/entities/delete/6?Developers_list_page=1
');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (645, 'Age', '', '--- 
- /app/admin/entities/edit_existing_precisions/56?detail_id=105
');


--
-- Name: languages_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_id_key UNIQUE (id);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (lang);


--
-- Name: translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: translator2language_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translator2language
    ADD CONSTRAINT translator2language_pkey PRIMARY KEY (id);


--
-- Name: translators_hints_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translators_hints
    ADD CONSTRAINT translators_hints_pkey PRIMARY KEY (id);


--
-- Name: translators_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translators
    ADD CONSTRAINT translators_pkey PRIMARY KEY (id);


--
-- Name: uniq_translations__lang_t_id_scope; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT uniq_translations__lang_t_id_scope UNIQUE (lang, scope, t_id);


--
-- Name: translations__t_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX translations__t_id ON translations USING btree (t_id);


--
-- Name: fk_translations__lang; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY translations
    ADD CONSTRAINT fk_translations__lang FOREIGN KEY (lang) REFERENCES languages(lang) ON DELETE CASCADE;


--
-- Name: translator2language_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY translator2language
    ADD CONSTRAINT translator2language_language_id_fkey FOREIGN KEY (language_id) REFERENCES languages(id);


--
-- Name: translator2language_translator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY translator2language
    ADD CONSTRAINT translator2language_translator_id_fkey FOREIGN KEY (translator_id) REFERENCES translators(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

