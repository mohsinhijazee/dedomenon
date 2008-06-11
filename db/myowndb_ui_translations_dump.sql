--
-- PostgreSQL database dump
--

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.translator2language DROP CONSTRAINT translator2language_translator_id_fkey;
ALTER TABLE ONLY public.translator2language DROP CONSTRAINT translator2language_language_id_fkey;
ALTER TABLE ONLY public.translations DROP CONSTRAINT fk_translations__lang;
DROP INDEX public.translations__t_id;
ALTER TABLE ONLY public.translations DROP CONSTRAINT uniq_translations__lang_t_id_scope;
ALTER TABLE ONLY public.translators DROP CONSTRAINT translators_pkey;
ALTER TABLE ONLY public.translators_hints DROP CONSTRAINT translators_hints_pkey;
ALTER TABLE ONLY public.translator2language DROP CONSTRAINT translator2language_pkey;
ALTER TABLE ONLY public.translations DROP CONSTRAINT translations_pkey;
ALTER TABLE ONLY public.languages DROP CONSTRAINT languages_pkey;
ALTER TABLE ONLY public.languages DROP CONSTRAINT languages_id_key;
DROP TABLE public.translators_hints;
DROP SEQUENCE public.translators_hints_id_seq;
DROP TABLE public.translators;
DROP SEQUENCE public.translators_id_seq;
DROP TABLE public.translator2language;
DROP SEQUENCE public.translator2language_id_seq;
DROP TABLE public.translations;
DROP SEQUENCE public.translations_id_seq;
DROP TABLE public.languages;
DROP SEQUENCE public.languages_id_seq;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'Standard public schema';


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

SELECT pg_catalog.setval('translations_id_seq', 965, true);


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
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: translator2language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('translator2language_id_seq', 1, false);


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
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: translators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('translators_id_seq', 1, false);


--
-- Name: translators; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE translators (
    id integer DEFAULT nextval('translators_id_seq'::regclass) NOT NULL,
    "login" text,
    deletor boolean DEFAULT false
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

SELECT pg_catalog.setval('translators_hints_id_seq', 38, true);


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

INSERT INTO languages (lang, active, id) VALUES ('nl', false, 1);
INSERT INTO languages (lang, active, id) VALUES ('fr', true, 2);
INSERT INTO languages (lang, active, id) VALUES ('en', true, 3);
INSERT INTO languages (lang, active, id) VALUES ('it', false, 4);
INSERT INTO languages (lang, active, id) VALUES ('pt-br', false, 5);
INSERT INTO languages (lang, active, id) VALUES ('pt', false, 6);
INSERT INTO languages (lang, active, id) VALUES ('ru', false, 7);


--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (5, 'lastname', 'Nom de famille', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (6, 'lastname', 'Familie naam', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (1, 'test_traduction', 'ca a Ã©tÃ© traduit', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (16, 't_id', 'identificatie', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (15, 't_id', 'identifiant', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (28, 'my_databases', 'Mijn databanken', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (29, 'my_databases', 'My databases', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (30, 'value', 'Valeur', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (31, 'value', 'Waarde', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (32, 'value', 'Value', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (34, 'nl', 'Nederlands', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (35, 'nl', 'Nederlands', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (36, 'nl', 'Nederlands', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (27, 'my_databases', 'Mes bases de données', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (38, 'next_page', 'Page suivante', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (39, 'next_page', 'Volgende pagina', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (40, 'next_page', 'Next page', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (42, 'previous_page', 'Pag eprécédente', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (43, 'previous_page', 'Vorige pagina', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (44, 'previous_page', 'Previous page', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (46, 'entity', 'Entiteit', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (48, 'ids', 'Identifiants', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (49, 'ids', 'Identificaties', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (50, 'ids', 'Identificators', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (52, 'new_translation', 'Nouvelle traduction', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (53, 'new_translation', 'Vertaling invoeren', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (54, 'new_translation', 'New translation', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (57, 'reset', 'Herzetten', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (56, 'reset', 'Réinitialiser', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (58, 'reset', 'Reset', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (61, 'submit', 'Versturen', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (62, 'submit', 'Submit', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (60, 'submit', 'Appliquer', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (64, 'submit_all', 'Tout appliquer', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (65, 'submit_all', 'Alles versturen', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (66, 'submit_all', 'Submit all', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (68, 'lang', 'Langue', 'fr', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (69, 'lang', 'Taal', 'nl', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (70, 'lang', 'Language', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (74, 'find_translations_matching', 'Filter translations on', 'en', 'system', '', NULL);
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (116, 'view', 'view', 'en', 'system', NULL, '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (19, 'en', 'English', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (405, 'madb_entities', 'Tables', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (406, 'madb_details', 'Details', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (407, 'madb_details', 'Details', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (408, 'madb_destroy', 'Supprimer', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (411, 'madb_really_delete_database_question', 'Etes-vous sur de vouloir effacer la base de données {{database}}?', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (646, 'madb_entries_found_but_no_details_to_be_displayed_in_list', 'Des entrées existent, mais aucun champs n''est configuré pour être affiché dans les listes. Contactez votre administrateur pour modifier la configuration.', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (647, 'madb_entries_found_but_no_details_to_be_displayed_in_list', 'Records were found, but no fields is configured to be displayed in lists. Please contact your administrator.', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (648, 'madb_link_to_existing_entity', 'Link an existing {{entity}}', 'en', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (649, 'madb_link_to_existing_entity', 'Associer une entrée {{entity}} existante', 'fr', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (650, 'madb_entity_menu_link_title', 'Affiche la liste des {{entity}}', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (651, 'madb_entity_menu_link_title', 'Display list of {{entity}}', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (652, 'madb_add', 'madb_add', 'fr', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (653, 'madb_database_menu_link_title', 'Afficher la liste des tables', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (654, 'madb_database_menu_link_title', 'Display table list', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (128, 'madb_listing_translations', 'madb_listing_translations', 'nl', 'system', NULL, '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (187, 'madb_help_info_you_can_disable_help_in_your_settings', 'U kan dit help uitschakellen in uw instellingen', 'nl', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (188, 'madb_help_info_you_can_disable_help_in_your_settings', 'You can disable this help in your settings', 'en', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (333, 'madb_related_parents_objects', 'madb_related_parents_objects', 'en', 'system', NULL, '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (342, 'madb_apply', 'madb_apply', 'en', 'system', NULL, '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (710, 'madb_p_submenu_content_products', '<p><b>Pour plus d''informations</b></p>
<p><a href="contact">Contactez-nous</a>, nous sommes également disponible pour le développement d''applications spécifiques!</p>', 'fr', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (711, 'madb_p_submenu_content_products', '<p><b>For more informations</b></p>
<p><a href="contact">Contact us</a>, we are also available for development of specific applications!</p>', 'en', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (712, 'madb_p_contact', 'Contact', 'fr', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (713, 'madb_p_contact', 'Contact', 'en', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (7, 'entity', 'Entité {{entity}}', 'fr', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (72, 'find_translations_matching', 'Afficher uniquement les traductions correspondat à', 'fr', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (73, 'find_translations_matching', 'Vertaling filtreren op', 'nl', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (11, 'create_new', 'Enter a new {{entity}}', 'en', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (13, 'create_new', 'Nieuw {{entity}} aanmaken', 'nl', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (12, 'create_new', 'Ajout de {{entity}}', 'fr', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (10, 'entity', 'Entity', 'en', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (18, 'en', 'English', 'nl', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (76, 'cancel', 'Annuler', 'fr', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (77, 'cancel', 'Annuleren', 'nl', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (78, 'cancel', 'Cancel', 'en', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (21, 'fr', 'Français', 'nl', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (80, 'admin_databases', 'Géstion des DBs', 'fr', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (82, 'admin_databases', 'Manage DBs', 'en', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (81, 'admin_databases', 'Beheer van Dbs', 'nl', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (85, 'yes_many_parents_allowed', 'ja, een {{child_entity}} mag meerdere {{parent_entity}} hebben', 'nl', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (86, 'yes_many_parents_allowed', 'yes, one {{child_entity}} may have multiple {{parent_entity}} ', 'en', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (84, 'yes_many_parents_allowed', 'oui, chaque {{child_entity}} peut avoir plusieurs {{parent_entity}}', 'fr', 'system', '', '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (117, 'edit', 'edit', 'en', 'system', NULL, '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (118, 'delete', 'delete', 'en', 'system', NULL, '2006-03-26 16:30:29');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (123, 'artists', 'artists', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (124, 'name', 'name', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (125, 'birthday', 'birthday', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (126, 'tracks', 'tracks', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (130, 'madb_reset', 'madb_reset', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (131, 'madb_enter_id_of_the_translation', 'madb_enter_id_of_the_translation', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (133, 'madb_add_new', 'madb_add_new', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (134, 'madb_modify_entity', 'madb_modify_entity', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (135, 'madb_next_page', 'madb_next_page', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (136, 'madb_editing_translations', 'madb_editing_translations', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (137, 'madb_notes', 'madb_notes', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (138, 'madb_urls_where_translation_appears', 'madb_urls_where_translation_appears', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (139, 'madb_resize', 'madb_resize', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (140, 'madb_manage_translations', 'Gérer les traductions', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (141, 'madb_manage_translations', 'Vertalingen beheren', 'nl', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (142, 'madb_manage_translations', 'Manage translations', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (92, 'madb_did_you_forget_your_password', 'madb_did_you_forget_your_password', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (94, 'madb_creation_of_databases_happens_in_the_admin_part', 'madb_creation_of_databases_happens_in_the_admin_part', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (153, 'madb_creation_of_databases_happens_in_the_admin_part', 'madb_creation_of_databases_happens_in_the_admin_part', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (159, 'madb_related_children_objects', 'madb_related_children_objects', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (160, 'madb_related_parent_objects', 'madb_related_parent_objects', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (161, 'madb_did_you_forget_your_password', 'madb_did_you_forget_your_password', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (167, 'madb_related_parent_objects', 'madb_related_parent_objects', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (168, 'madb_untranslated_strings_only', 'madb_untranslated_strings_only', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (170, 'madb_login', 'Login', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (171, 'madb_login', 'Login', 'nl', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (89, 'madb_login', 'Login', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (172, 'madb_password', 'Mot de passe', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (173, 'madb_password', 'Paswoord', 'nl', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (90, 'madb_password', 'Password', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (95, 'madb_name', 'Name', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (174, 'madb_name', 'Nom', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (175, 'madb_name', 'Naam', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (176, 'madb_use', 'Utiliser', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (177, 'madb_use', 'Gebruiken', 'nl', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (96, 'madb_use', 'Use', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (178, 'madb_my_databases', 'Mes bases de données', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (179, 'madb_my_databases', 'Mijn databanken', 'nl', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (101, 'madb_my_databases', 'My databases', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (97, 'madb_admin_databases', 'Manage databases', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (180, 'madb_admin_databases', 'Gérer mes DBs', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (181, 'madb_admin_databases', 'Databanken beheren', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (98, 'madb_admin_users', 'Manage users', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (182, 'madb_admin_users', 'Gérer les utilisateurs', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (183, 'madb_admin_users', 'Gebruikers beheren', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (99, 'madb_settings', 'Settings', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (184, 'madb_settings', 'Préférences', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (185, 'madb_settings', 'Instellingen', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (186, 'madb_help_info_you_can_disable_help_in_your_settings', 'Vous pouvez désactiver cette aide dans vos  préférences.', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (192, 'madb_creation_of_databases_happens_in_the_admin_part', 'madb_creation_of_databases_happens_in_the_admin_part', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (100, 'madb_logout', 'Logout', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (193, 'madb_logout', 'Terminer', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (194, 'madb_logout', 'Uitloggen', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (195, 'madb_help_info_database_list_entities', 'Cette page liste les objets définis dans la base de données que vous utilisez actuellement.', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (196, 'madb_help_info_database_list_entities', 'Die pagina geeft een lijst terug van gedefinieerde objecten in de databank die u gebruikt.', 'nl', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (197, 'madb_help_info_database_list_entities', 'This page gives a list of entities (tables) defined in the current database.', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (198, 'madb_edit', 'Editer', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (199, 'madb_edit', 'Aanpassen', 'nl', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (120, 'madb_edit', 'Edit', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (200, 'madb_filter_on', 'Filtrer sur le champs', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (201, 'madb_filter_on', 'Filter on field', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (202, 'madb_with_value', 'dont la valeur correspond à', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (203, 'madb_with_value', 'with value corresponding to', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (110, 'madb_submit', 'Submit', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (204, 'madb_submit', 'Envoyer', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (205, 'madb_submit', 'Versturen', 'nl', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (111, 'madb_reset', 'Reset', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (206, 'madb_reset', 'Remise à zéro', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (112, 'madb_open_in_new_window', 'In new window', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (207, 'madb_open_in_new_window', 'Dans une nouvelle fenêtre', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (121, 'madb_delete', 'Delete', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (208, 'madb_delete', 'Effacer', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (210, 'madb_help_info_entities_view_intrp
', 'madb_help_info_entities_view_intrp
', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (211, 'madb_with value', 'madb_with value', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (212, 't_id', 't_id', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (213, 'scope', 'scope', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (215, 'enter id of the translation', 'enter id of the translation', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (216, 'enter id of the translation', 'enter id of the translation', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (217, 'show', 'show', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (218, 'madb_create_new_entity', 'Ajouter une nouvelle entrée {{entity_name}}', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (108, 'madb_create_new_entity', 'Add a new {{entity_name}}', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (109, 'madb_cancel', 'Cancel', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (219, 'madb_view', 'Afficher', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (119, 'madb_view', 'View', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (221, 'madb_help_info_entities_view_intrp
', 'madb_help_info_entities_view_intrp
', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (222, 'madb_with value', 'madb_with value', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (223, 'madb_help_info_entities_view_intro', 'Voici les détails de l''entrée sélectionnée. Notez qu''il n''y a que les champs ayant une valeur qui sont affichés! Les champs vide ne sont pas affiché. En suivant le lien d''édition, il vous sera possible d''éditer tous les champs de cette entrée.', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (224, 'madb_help_info_entities_view_intro', 'Here are the details of the record you selected. Note only fields with a value are displayed, empty fields are not displayed! Editing the entry will let you enter values for all fields of the record.', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (225, 'madb_related_entities', 'Related records', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (226, 'madb_submit_all', 'Submit all', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (190, 'madb_help_info_database_list', 'U vind op die pagina de lijst van bestaande databanken om te kiezen welke u wilt gebruiken.', 'nl', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (214, 'updated_at', 'Updated at', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (209, 'madb_you_can_add_an_entry', 'Vous pouvez ajouter un entrée.', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (227, 'madb_help_info_entities_views_related_entities', 'Below are displayed the entries related to the current entry.
<br>
Each list display the entries related with one relation
<br>
If the definition of the relation accepts that you link more entries, two links will be displayed that will let you link an existing entry or link a newly created entry.
<br>
Each list can be filtered and opened in a new window. It is also possible to display the details of a related entity thanks to the links displayed in the last columns of the lists.', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (228, 'madb_help_info_entities_views_related_entities', 'Ci-dessous se trouvent les entrées reliée a l''entrée sélectionnée.
<br>
Chacune des listes correspond à une relation vers d''autres entrées.<br>
Si la définition de la relation vous permet de lier d''autres entités, deux liens seront affichés qui vous permettront de relier une entrée existante ou une nouvelle entrée respectivement.
<br>
Chaque liste peut être filtrée et ouverte dans une nouvelle fenêtre. Il vous est également possible de directement afficher les détails d''une entrée liée à l''entrée actuelle grâce aux liens affichés dans les dernière colonne de la liste.', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (229, 'madb_help_info_entities_list_intro', '<p>Cette page liste les données actuellement présente dans table sélectionnée et vous donne un accès rapide à l''insertion d''une nouvelle entrée.</p>
<p>
La liste peut être limitée aux entrées correspondant au critère de recherche entré. Il vous suffit de choisir le champs et la valeur recherchée. Il est également possible d''ouvrir la liste dans une nouvelle fenêtre.
</p>
<p>
Les liens dans les dernières colonnes de la liste vous permettent de facilement visualiser ou éditer les détails d''une entrée,
</p>
', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (230, 'madb_help_info_entities_list_intro', '<p>This page lists the entries in the current table and lets you directly enter a new record</p>
<p>Records displayed can be filtered by choosing the field to filter on and entering the value you''re looking for. You can also open the list in a new window</p>
<p>
The links in the last columns give you easy access to view an record''s details, to edit an entry or to delete it.
</p>
</p>', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (231, 'madb_related_entities', 'Entrées liées', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (233, 'scope', 'scope', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (235, 'forget_your_password', 'forget_your_password', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (88, 'madb_please_login', 'Please log in', 'en', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (236, 'madb_please_login', 'Veuillez vous identifier', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (237, 'show', 'show', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (238, 'madb_register_for_an_account', 'S''enregister', 'fr', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (91, 'madb_register_for_an_account', 'Sign up', 'en', 'system', '', '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (239, 'madb_submit_all', 'Tout envoyer', 'fr', 'system', NULL, '2006-03-26 16:30:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (240, 'madb_submit_all', 'Alles versturen', 'nl', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (241, 'mabd_forgot_your_password_question', 'Mot de passe perdu?', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (242, 'mabd_forgot_your_password_question', 'Passwoord vergeten?', 'nl', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (243, 'mabd_forgot_your_password_question', 'Forgot your password?', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (93, 'madb_madb', 'MyownDB', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (244, 'madb_madb', 'MaDB', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (245, 'madb_help', 'Aide', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (246, 'madb_help', 'Hulp', 'nl', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (247, 'madb_help', 'Help', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (103, 'madb_add_new', 'Enter new record', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (248, 'madb_add_new', 'Saisie d''une entrée', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (104, 'madb_search', 'Search', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (249, 'madb_search', 'Recherche', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (250, 'madb_search', 'Zoeken', 'nl', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (105, 'madb_modify_entity', 'Modifiy structure', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (251, 'madb_modify_entity', 'Modifier la structure', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (102, 'madb_admin_database', 'Administrate database', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (252, 'madb_admin_database', 'Administrer la DB', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (253, 'madb_admin_database', 'Databank beheren', 'nl', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (254, 'madb_unlink', 'Unlink', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (255, 'madb_unlink', 'Désassocier', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (256, 'no_madb_data_found', 'no_madb_data_found', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (257, 'madb_cancel', 'Annuler', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (258, 'madb_cancel', 'Annuleren', 'nl', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (259, 'use_it', 'use_it', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (260, 'madb_use_it', 'madb_use_it', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (261, 'madb_no_data_found', 'Aucune donnée à afficher', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (262, 'madb_no_data_found', 'No data to display', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (264, 'madb_value', 'madb_value', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (265, 'madb_searched_database', 'Base de données à utiliser', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (266, 'madb_searched_database', 'Database to search in', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (267, 'madb_searched_entity', 'Display records in ', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (268, 'madb_searched_entity', 'Rechercher les entrées de type', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (269, 'madb_searched_value', 'Valeur recherchée', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (270, 'madb_searched_value', 'Value searched', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (271, 'madb_choose_database', 'Sélectionnez la DB', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (272, 'madb_choose_database', 'Choose database', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (273, 'madb_all', 'Tous', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (274, 'madb_all', 'All', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (275, 'madb_searched_detail', 'Champs à examiner', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (276, 'madb_searched_detail', 'Field to search', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (277, 'this_is_a_popup_window_warning', 'this_is_a_popup_window_warning', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (278, 'madb_refresh', 'Rafraîchir', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (279, 'madb_refresh', 'Refresh', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (280, 'phone', 'phone', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (281, 'surname', 'surname', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (22, 'fr', 'Français', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (20, 'fr', 'Français', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (17, 'en', 'English', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (282, 'madb_help_info_search_index', '<p>The search functionality lets you find records from one database corresponding to the value you enter.</p>
<p>
The search can be done on one or all tables defined in the database. When you search only on table, you can also decide which field to examine during the search.
</p>
<p></p>', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (283, 'madb_help_info_search_index', 'La fonctionalité de recherche vous permet de retrouver les entrées d''une base de données correspondant à la valeur entrée.
<p>La recherche peut s''effectuer sur une seule ou toutes les tables définies  dans la base de données. Lorsque la recherche ne concerne qu''une table, il est possible de n''examiner qu''un champs lors de la recherche.</p>
', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (284, 'madb_enter_value_to_search_for', 'Enter a value to look for', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (285, 'madb_enter_value_to_search_for', 'Entrez la valeur à rechercher', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (286, 'rename', 'rename', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (287, 'link_existing_detail', 'link_existing_detail', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (289, 'madb_links', 'Associations', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (295, 'madb_apply', 'madb_apply', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (296, 'madb_link_existing_detail', 'Ajouter un champs basé sur un détail existant', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (297, 'madb_add_new_detail', 'Ajouter un champs basé sur un nouveau détail', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (298, 'madb_rename', 'Renommer', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (299, 'madb_data_type', 'Type', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (301, 'madb_links', 'Relations', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (304, 'madb_to_parents', 'Relations to parents', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (305, 'madb_to_parents', 'Associations vers les parents', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (306, 'madb_to_children ', 'Relations to children', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (307, 'madb_to_children ', 'Associations vers les enfants', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (308, 'madb_relation_name', 'Nom de l''association', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (309, 'madb_relation_name', 'Relation name', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (310, 'madb_child', 'Child', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (311, 'madb_child', 'Enfant', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (312, 'madb_multiple_children_allowed', 'May one parent have multiple children', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (313, 'madb_multiple_children_allowed', 'Un parent peut-il avoir plusieurs enfants', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (314, 'madb_yes_many_children_allowed', 'oui, une entrée {{parent_entity}} peut être associée a plusieurs entrées {{child_entity}}', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (315, 'madb_yes_many_children_allowed', 'yes, a {{parent_entity}} can be linked to multiple {{child_entity}}', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (316, 'madb_multiple_parents_allowed', 'Un enfant peut-il avoir plusieurs parents', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (317, 'madb_multiple_parents_allowed', 'May a child have multiple parents', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (323, 'new_database', 'new_database', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (325, 'madb_rename_entity_link_title', 'madb_rename_entity_link_title', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (327, 'madb_from_child_to_parent_relation_name', 'Nom de l''association de <span class="no_css_child_name">{{child_entity}}</span> à <span class="no_css_parent_name">{{parent_entity}}</span>
', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (328, 'madb_from_child_to_parent_relation_name', 'Name of relation from <span class="no_css_child_name">{{child_entity}}</span> to <span class="no_css_parent_name">{{parent_entity}}</span>', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (329, 'madb_can_one_child_entity_have_several_parents_question', 'Une entrée <span class="no_css_child_name">{{child_entity}}</span> peut-elle être associée à plusieurs <span class="no_css_parent_name">{{parent_entity}}</span>', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (330, 'madb_can_one_child_entity_have_several_parents_question', 'Can one <span class="no_css_child_name">{{child_entity}}</span>  be linked to several <span class="no_css_parent_name">{{parent_entity}}</span>', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (320, 'madb_define_new_link', 'Define the new link', 'en', 'system', NULL, '2006-04-01 21:02:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (331, 'madb_can_one_parent_entity_have_several_children_question', 'Can one <span class="no_css_parent_name">{{parent_entity}}</span>  be linked to several <span class="no_css_child_name">{{child_entity}}</span>', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (332, 'madb_can_one_parent_entity_have_several_children_question', 'Une entrée <span class="no_css_parent_name">{{parent_entity}}</span> peut-elle être associée à plusieurs <span class="no_css_child_name">{{child_entity}}</span>', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (334, 'madb_add_new_related_entity', 'Associer une nouvelle entrée {{entity}}', 'fr', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (335, 'madb_add_new_related_entity', 'Link a new {{entity}}', 'en', 'system', '', '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (336, 'madb_really_delete_entity_question', 'Effacer l''entrée {{entity}} avec {{title}} {{value}}?', 'fr', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (339, 'madb_help_info_edit_detail', 'madb_help_info_edit_detail', 'en', 'system', NULL, '2006-03-26 16:30:31');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (340, 'madb_admin_details_edit', 'madb_admin_details_edit', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (344, 'madb_show_detail_spec', 'Detail specs', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (345, 'madb_show_detail_spec', 'Spécifications du détails', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (346, 'madb_show_detail_spec_link_title', 'Show the specifications of the detail used to define this field.', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (347, 'madb_show_detail_spec_link_title', 'Affiche les spécification du détail utilisé pour définir ce champs', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (348, 'madb_edit_entity_to_detail', 'Change field specs', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (349, 'madb_edit_entity_to_detail', 'Modifier le champs', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (350, 'madb_edit_entity_to_detail_link_title', 'Toggle field''s display in list', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (351, 'madb_edit_entity_to_detail_link_title', 'Décidez de l''affichage du champs dans les listes', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (352, 'madb_unlink_detail_from_entity', 'Remove', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (353, 'madb_unlink_detail_from_entity', 'Effacer le champs', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (354, 'madb_unlink_detail_from_entity_link_title', 'Remove filed and all its values', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (356, 'madb_no_only_one_child_allowed', 'Non, une entrée {{parent_entity}} ne peut être associée qu''à une entrée {{child_entity}}
', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (357, 'madb_no_only_one_child_allowed', 'No, a {{parent_entity}} can be linked to only one {{child_entity}}', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (358, 'madb_add_link_to_child_entity', 'Définir une nouvelle association vers une entité enfant', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (359, 'madb_add_link_to_child_entity', 'Define a new relation to a child entity', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (360, 'madb_add_link_to_parent_entity', 'Define a new relation to a parent entity', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (361, 'madb_add_link_to_parent_entity', 'Définir une nouvelle association vers une entité parente', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (362, 'madb_parent_entity', 'Parent', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (363, 'madb_parent_entity', 'Parent', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (364, 'madb_child_entity', 'Child', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (365, 'madb_child_entity', 'Enfant', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (366, 'madb_link_existing_detail', 'Add field based on existing detail', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (367, 'madb_add_new_detail', 'Add field based on new detail', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (368, 'madb_rename', 'Rename', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (369, 'madb_details_for_entity', 'Champs de la table {{entity}}', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (370, 'madb_details_for_entity', 'Fields for table {{entity}}', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (371, 'madb_input_form_is_publicly_accessible', 'Make input form public', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (372, 'madb_input_form_is_publicly_accessible', 'Publier le formulaire de saisie', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (373, 'madb_public_form_will_be_available_at', 'The form will be available at ', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (374, 'madb_public_form_will_be_available_at', 'Le formulaire sera accessible à ', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (375, 'madb_entity', '{{entity}}', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (376, 'madb_entity', '{{entity}}', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (377, 'madb_confirm_delete_all_links', 'Deleting this relation will delete all links of this type between records. Do you want to continue?', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (378, 'madb_confirm_delete_all_links', 'Effacer cette association supprimera tous les liens correspondant entres les entrées dans les tables. Voulez-vous continuer?', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (379, 'madb_define_link', 'Modification de la relation entre {{parent}} et {{child}}', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (380, 'madb_define_link', 'Modify the relation between {{parent}} and {{child}}', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (381, 'madb_help_info_admin_entities_edit_link', 'You can modify existing relations, with certain restrictions though:
<ul>
<li>you can''t change the table it relates to</li>
<li>the sides of the relation that accept many records can''t be changed to only accept one record ("to many" relations can''t be changed in "to one" relations)</li>
</ul>', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (382, 'madb_help_info_admin_entities_edit_link', 'Vous pouvez modifier une association existante, avec certaines limitations:
<ul>
<li>vous ne pouvez pas changer la table associée</li>
<li>vous ne pouvez modifier une association acceptant plusieurs entrées en une associations n''accdeptant qu''une entrée (pour le plus techniciens: une  association "to many" ne peut être modifiée en une association "to one")</li>
</ul>', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (338, 'madb_help_info_admin_details_value_propositions_for_show', 'Here are the value propositions for this detail', 'en', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (383, 'madb_help_info_admin_entities_define_link', 'Vous pouvez spécifier toutes les caractéristiques d''une nouvelle association:
<ul>
<li>la table associée</li>
<li>le nom de l''association, dans chaque sens</li>
<li>le type de l''association, dans chaque sens</li>
</ul>', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (384, 'madb_help_info_admin_entities_define_link', 'You can enter all specifications of a new relation:
<ul>
<li>the associated table</li>
<li>the name of the association,in each direction</li>
<li>the type of the relation, in each direction</li>
</ul>', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (386, 'madb_related_parents_objects', 'madb_related_parents_objects', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (387, 'length', 'length', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (388, 'madb_help_info_entities_edition', 'You can here edit a record and specify a value for each field.', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (389, 'new_database', 'new_database', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (390, 'madd_settings', 'madd_settings', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (392, 'madb_help_info_settings_show_intro', 'Vous pouvez modifier vos préférences, et par exemple désactiver l''affichage de cette aide.', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (393, 'madb_help_info_settings_show_intro', 'You can modify your settings, for example deactivating this help.', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (394, 'madb_enter_your_new_password_below', 'Entrez votre nouveau mot de passe ci-dessous', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (395, 'madb_enter_your_new_password_below', 'Enter your new password  below', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (396, 'madb_choose_password', 'Votre nouveau mot de passe', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (397, 'madb_choose_password', 'Your new password', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (398, 'madb_confirm_password', 'Confirmez votre nouveau mot de passe', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (399, 'madb_confirm_password', 'Confirm your new password', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (400, 'madd_settings', 'madd_settings', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (402, 'madb_change_password', 'Change password', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (403, 'madb_change_password', 'Changez votre mot de passe', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (404, 'madb_entities', 'Tables', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (412, 'madb_really_delete_database_question', 'Are you sure you want to delete the database {{database}}?', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (413, 'madb_create_database', 'Créer une nouvelle base de données.', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (414, 'madb_create_database', 'Create a new database.', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (415, 'madb_help_info_admin_details_list', 'Voici la liste des détails définis pour la base de données active. Un detail est utilisé pour définir les champs des tables de la base de données. <br>
Le type du détail (texte court, texte long, choix dans une liste, email, etc) influencera son affichage dans le formulaire de saisie (les textes longs sont affichés dans un cadre de texte) et dans la liste.(les email sont affiché sous forme de lien).<br>', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (416, 'madb_help_info_admin_details_list', 'Here is the list of details defined for the active database. A detail is used to define the fields of the tables in that database.<br>
The type of the detail (short text, long text, choice in list, email, etc) influences the display in the form (long text in text areas) and in the lists (emails are displayed as links)<br>', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (417, 'madb_define_new_detail', 'Entrer un nouveau détail', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (418, 'madb_define_new_detail', 'Define a new detail', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (419, 'madb_show', 'Afficher', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (420, 'madb_show', 'Show', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (423, 'madb_data_type', 'Type', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (424, 'madb_help_info_admin_details_show', 'Voici les spécifications du détail: son nom et le type de donnée.<br> Les possibilités d''éditions d''un détail existant sont limitées.', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (425, 'madb_help_info_admin_details_show', 'Here are the specs of the detail: its name and data type. The scope of changes possible to an existing detail is limited.', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (426, 'madb_help_info_edit_detail', 'madb_help_info_edit_detail', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (427, 'madb_admin_details_edit', 'madb_admin_details_edit', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (429, 'madb_yes', 'Yes', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (430, 'madb_yes', 'Oui', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (431, 'madb_administrate', 'Administrer', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (432, 'madb_administrate', 'Administrate', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (433, 'madb_no', 'No', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (434, 'madb_no', 'Non', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (435, 'madb_new_entity', 'Créer une table', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (436, 'madb_new_entity', 'Create table', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (438, 'madb_rename_entity_link_title', 'madb_rename_entity_link_title', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (440, 'madb_entities_list', '{{db}}: list des tables', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (441, 'madb_entities_list', '{{db}}: list of tables', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (442, 'madb_create', 'madb_create', 'fr', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (385, 'madb_insertion_was_successful', 'Vos données ont été enregistrées.', 'fr', 'system', '', '2006-04-09 18:15:22');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (391, 'madb_display_info_help', 'Afficher l''aide intégrée', 'fr', 'system', '', '2006-07-30 21:30:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (422, 'madb_back', 'Retour', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (443, 'madb_help_info_admin_entities_list', 'Cette page liste les tables définies dans la base de données active. Chaque table peut être:
<ul>
<li>administrée, c''est-à-dire ajouter des champs à la table, la renommer, modifier ses association  avec d''autres tables , etc..</li>
<li>effacée. Attention, cela efface toutes les données contenues dans la table! </li>
</ul>', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (444, 'madb_help_info_admin_entities_list', 'This page lists all tables for the currently active database. Each table can be 
<ul>
<li>admistrated, this means you can add fields to the table, rename it, modify it links with other tables, etc</li>
<li>deleted. Note that deleting a table deletes all the data it contains!</li>
</ul>', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (445, 'madb_destroy', 'Delete', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (446, 'madb_help_info_admin_entities_show_intro', '<p>You can here define the fields of the tables in your databases by reusing a detail already defined in the database, or by defining a new detail (that you''ll be able to reuse to define fields of other tables).</p>
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
</p>', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (447, 'madb_help_info_admin_entities_show_intro', '<p>Vous pouvez définir les champs  des tables de votre base de données en réutilisant un détail déja défini dans la base de données, ou en définissant un nouveau détail (que vous pourrez alors réutiliser pour définir les champs d''autres tables).
</p>
<p>L''ordre d''affichage des details peut-être modifié par glisser-déposer, et sera appliqué dans tous les affichages (liste et  boîtes de sélections)</p>
<p>Pour chaque champs de la table, trois liens vous permettens de 
<ul>
<li>visualiser les caractéristiques du détail utilisé pour définir le champs(par exemple son type: date, texte, choix dans une liste, ...),</li>
<li>préciser les caractéristique du champs de cette tables (affichage dans les listes, multiples valeurs autorisée</li> 
<li>retirer le champs de la table. Cette opération n''efface pas le détail, de sorte que vous pouvez le réutiliser pour définir d''autres champs.</li>
</ul>
</p>
<p>Il est également possible de spécifier que le formulaire d''entrée de cette table peut-être accéder à l''extérieur de cette application</p>', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (448, 'madb_help_info_admin_entities_show_links_to_other_entities', '<p>A record in a table can be associated with other records in the same or a different table. In the example of a customers database, a contact is associated with a company.
</p>
<p>
Below you can define the relations in which the current table is used.  A relation, by definition, has a parent side and a child side. This distinction is necessary to be able to define the type of the relation in both directions: from parent to child and from child to parent.
<ul>
<li>
Can a parent record be linked to multiple children record, and vice-versa? For example, a customer can be linked to multiple invoices, but an invoice can only be link to one customer. The choice to label one table as the parent side and the other as a child side is up to the database administrator.
</li>
</ul>
', 'en', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (449, 'madb_help_info_admin_entities_show_links_to_other_entities', '<p>Une entrée dans une table peut être associée à une ou plusieurs entrées dans la même table ou dans une table différente. Dans l''exemple d''une base de donnée client, un contact est associé à une société.
</p>
<p>
Vous pouvez définir ce-dessous les associations impliquant la table actuelle. Une association lie, par définition, une entité parent à une entité enfant. Cette distincion est nécéssaire pour pouvoir préciser le type d''association dans les deux sens: de parent à enfant et d''enfant à parent.
<ul>
<li> Une entrée parent peut-elle être associée à différentes entrées enfant, et vice-versa? Un client peut être associé à différentes factures, mais une facture ne peut être associée qu''à un client. Notez que le choix incombe à l''administrateur de la base de donnée quant au choix de l''entité parent et enfant dans une association.
</li>
</ul>
Ci-dessous sont listées les associations impliquant la table actuelle. vous pouvez ajouter, effacer et modifier des associations. ', 'fr', 'system', '', '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (451, 'short_text', 'short_text', 'en', 'system', NULL, '2006-03-26 16:30:32');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (452, 'date', 'date', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (453, 'back', 'back', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (454, 'madb_help_info_admin_entities_add_existing_choose', 'Choisissez le détail à utiliser pour définir le nouveau champs.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (455, 'madb_help_info_admin_entities_add_existing_choose', 'Choose the detail to use to define the new field.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (107, 'CDs', 'CDs', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (456, 'Length', 'Length', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (457, 'madb_help_info_spec_of_detail_for_entity', 'Préciser si le champs doit apparaître dans les listes. Acutellement, une seule valeur peut-être entrée pour un champs.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (458, 'madb_help_info_spec_of_detail_for_entity', 'Please configure if the field shold be displayed in lists. Currently only one value can be entered for a field.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (459, 'madb_displayed_in_list_view', 'Shoudl the field be displayed in lists?', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (460, 'madb_displayed_in_list_view', 'Le champs doit-il être affiché dans les listes?', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (461, 'madb_maximum_number_of_values', 'Nombre de valeur acceptée par ce champs:', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (462, 'madb_maximum_number_of_values', 'Number of values that can be entered for this field:', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (464, 'details', 'details', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (465, 'CDs', 'CDs', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (466, 'Length', 'Length', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (467, 'back', 'back', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (468, 'madb_really_unlink_detail_question', 'Voulez-vous vraiment effacer le champs {{detail}}?', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (469, 'madb_really_unlink_detail_question', 'Really remove field {{detail}}?', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (463, 'details', 'details', 'en', 'system', NULL, '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (470, 'madb_help_info_admin_databases_list', 'Voici la liste des bases de données existantes. Pour chaque base de données, vous pouvez accéder aux tables et détails définis. Un détails est utilisé pour définir les champs des tables, et peut-être utilisé plusieurs fois. Vous pouvez aussi renommer ou effacer chaque base de données.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (471, 'madb_help_info_admin_databases_list', 'Here is the list of existing databases.
For each database you can access the tables and details defined. Details are used to define the fields of the tables, and each detail can be used several times in several tables. You can also rename and delete each database.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (472, 'madb_help_info_admin_details_value_propositions_for_new', 'Ce type de détail n''acceptera que les valeurs que vous précisez ci-dessous. Ce détail sera affiché comme une liste déroulante dans le formulaire de saisie.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (473, 'madb_help_info_admin_details_value_propositions_for_new', 'This type of detail only accepts the value that you define below. The detail will be displayed as a drop down list in the entry form.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (474, 'madb_quick_submit', 'Ajout rapide', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (475, 'madb_quick_submit', 'Quick submit', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (476, 'madb_remove_propositions', 'Effacer la proposition', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (477, 'madb_remove_propositions', 'Remove proposition', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (478, 'madb_add_proposition', 'Ajouter la proposition', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (479, 'madb_add_proposition', 'Add proposition', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (480, 'madb_help_info_admin_details_new', 'When creating a detail, you can give it a name, and specify a data type.
The type of the detail has implications on the values accepted and the display of the value in the application (a detail of type email only accepts valid email addresses as value, and is displayed as a link).
', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (481, 'madb_help_info_admin_details_new', 'Lors de la création d''un détail, vous pouvez lui donner un nom et spécifier le type de donnée lui étant associé.
Le type du détail  a une implication sur les valeurs acceptées et la représentation du détail dans l''application (un détail de type email n''accepte que des valeurs correspondan à une adresse email valide, et est représenté comme lien).
', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (484, 'short_text', 'short_text', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (485, 'date', 'date', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (486, 'name', 'name', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (487, 'madb_help_info_admin_details_new_quick_commit', 'Le bouton "Ajout rapide" vous permet d''immédiatement ajouter un champs basé sur ce nouveau détail. Ce champs sera affiché dans les listes et n''acceptera qu''une valeur. Si ces paramètres par défaut ne vous conviennent pas, vous pouvez utiliser le bouton standard, qui vous permettra de préciser vos propres paramètres.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (488, 'madb_help_info_admin_details_new_quick_commit', 'The quick commit button lets you immediately add a field based on this new detail. The field will be displayed in lists and accept only one values. If you don''t want to use these defaults, you can use the standard submit button. ', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (489, 'test', 'test', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (490, 'retest', 'retest', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (491, 'title', 'title', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (492, 'madb_delete_detail_question', 'Etes-vous sûr de vouloir effacer le detail {{detail}}?', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (493, 'madb_delete_detail_question', 'Are you sure you want to delete the detail {{detail}}?', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (113, 'title', 'title', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (114, 'number_of_disks', 'number_of_disks', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (115, 'year', 'year', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (494, 'madb_use_it', 'madb_use_it', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (495, 'number_of_disks', 'number_of_disks', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (496, 'year', 'year', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (127, 'length', 'length', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (497, 'madb_databases_list', 'Existing databases', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (498, 'madb_databases_list', 'Bases de données existantes', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (500, 'normal_user', 'normal_user', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (501, 'primary_user', 'primary_user', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (502, 'madb_lastname', 'Nom de famille', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (503, 'madb_lastname', 'Lastname', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (504, 'madb_firstname', 'Prénom', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (505, 'madb_firstname', 'Firstname', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (506, 'madb_email_confirmation', 'Confirmez l''adresse email', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (507, 'madb_email_confirmation', 'Confirm the email address', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (508, 'madb_user_type', 'Profil utilisateur', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (509, 'madb_user_type', 'User profile', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (510, 'madb_email', 'Email', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (511, 'madb_email', 'Email', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (512, 'madb_new_users', 'Ajouter de nouveaux comptes', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (513, 'madb_new_users', 'Add new accounts', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (514, 'madb_delete_user_question', 'Supprimmer le login {{login}}?', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (515, 'madb_delete_user_question', 'Really delete login {{login}}?', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (516, 'madb_first_name', 'madb_first_name', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (517, 'madb_last_name', 'madb_last_name', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (518, 'madb_verified', 'madb_verified', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (519, 't', 't', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (521, 'madb_user_verified', 'Compte validé?', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (522, 'madb_user_verified', 'Accoun validated?', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (523, 'madb_reset_password', 'Réinitialiser le mot de passe', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (524, 'madb_reset_password', 'Reset password', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (525, 'madb_create_user', 'Créer un compte', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (526, 'madb_create_user', 'Create an account', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (527, 'madb_users_was_successfully_created', 'Le compte a été créé.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (528, 'madb_users_was_successfully_created', 'Account has been created.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (530, 'normal_user', 'normal_user', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (531, 'primary_user', 'primary_user', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (532, 'madb_notice_password_updated', 'Mot de passe mis a jour', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (533, 'madb_notice_password_updated', 'Password updated', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (535, 'madb_password_reset_mail_sent', 'Un mail a été envoyé avec le nouveau mot de passe.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (536, 'madb_you_dont_have_sufficient_credentials_for_action', 'Vous n''avez pas les droits nécessaire pour effectuer cette opération!', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (537, 'madb_you_dont_have_sufficient_credentials_for_action', 'You don''t have the rights necessary to perform this operation!', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (538, 'password', 'password', 'fr', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (539, 'madb_page', 'Page', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (540, 'madb_page', 'Page', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (542, 'madb_create', 'madb_create', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (543, 'madb_password_reset_mail_sent', 'A mail has been sent with the new password.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (544, 'madb_mail_password_change_intro', 'Suite à votre demande ou à l''administrateur de votre compte, voici un nouveau mot de passe pour votre compte MaDB.net. Nous vous conseillons de modifier ce mot de passe lors de votre première connection.

Veuillez vous authentifier grâce à ces données:', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (545, 'madb_mail_password_change_intro', 'At your request or your administrator''s request, here is your new password for your account on MyOwnDB.net.We advise you to change your password at your first login.

Your new login credentials are:', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (546, 'madb_enter_your_email_address_to_have_a_new_password_sent_to_you', 'Entrez votre adresse électronique pour recevoir un courriel avec les informations nécessaire pour obtenir un nouveau mot de passe.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (547, 'madb_enter_your_email_address_to_have_a_new_password_sent_to_you', 'Enter your email address and we''ll send you a mail with instructions to get a new password.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (548, 'madb_forgotten_password', 'Mot de passe oublié', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (549, 'madb_forgotten_password', 'Lost password', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (550, 'madb_reset_password_title', 'J''ai oublié mon mot de passe et voudrais en changer!', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (551, 'madb_reset_password_title', 'I forgot my password, and I want to change it.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (552, 'madb_dear', 'madb_dear', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (553, 'madb_forgotten_password_mail_end', 'madb_forgotten_password_mail_end', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (554, 'forgotten_password_mail_intro', 'Siute à votre demande ou celle de votre administrateur, votre mot de passe a été réinitialisé. Veuillez vous authentifier avec les données suivantes:', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (555, 'forgotten_password_mail_intro', 'At your request, or at your administrator''s request, your password has been reset. If it was not at your request, then you should be aware that someone has entered your email address as theirs in the forgotten password section of MyOwnDB.net.

Your new credentials are:



', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (556, 'madb_forgotten_password_mail_outro', 'Nous vous conseillons de changer immédiatement de mot de passe en cliquant sur "Préférences" dans le menu.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (557, 'madb_forgotten_password_mail_outro', 'It''s advisable for you to change your password as soon as you login. It''s as simple as navigating to ''Settings''.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (558, 'madb_mail_outro', 'Nous vous remercions pour votre confiance, et nous tenons à votre disposition.

L''équipe de MaDB.net', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (560, 'madb_new_password_could_not_be_mailed', 'Le courriel n''a pas pu être envoyé à {{email}}', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (561, 'madb_new_password_could_not_be_mailed', 'The mail could not be sent to {{email}}', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (562, 'madb_new_password_sent', 'Un nouveau mot de passe a été envoyé à {{mail}}', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (563, 'madb_new_password_sent', 'The new password was sent to {{mail}}', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (564, 'madb_could_not_find_account_with_email', 'Nous n''avons pas pu retrouver un compte avec l''adress électronique {{mail}}.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (565, 'madb_could_not_find_account_with_email', 'We could not find an account with email {{mail}}.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (566, 'madb_account_verified', 'Votre accompte est maintenant confirmé. Vous pouvez désormais vous authentifier.', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (567, 'madb_account_verified', 'Your account is now verified, and you can log in the application.', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (568, 'choose', 'choose', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (569, 'madb_email_address_confirmation', 'madb_email_address_confirmation', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (570, 'madb_mail', 'madb_mail', 'en', 'system', NULL, '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (571, 'madb_choose_password_creation', 'Mot de passe', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (572, 'madb_choose_password_creation', 'Password', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (573, 'madb_confirm_password_creation', 'Confirmation du mot de passe', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (574, 'madb_confirm_password_creation', 'Password confirmation', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (575, 'madb_company_name', 'Société', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (576, 'madb_company_name', 'Company', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (577, 'madb_company_street', 'Adresse', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (578, 'madb_company_street', 'Address', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (579, 'madb_company_zip_code', 'Code postal', 'fr', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (580, 'madb_company_zip_code', 'Zip code', 'en', 'system', '', '2006-03-26 16:30:33');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (581, 'madb_company_city', 'Ville', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (582, 'madb_company_city', 'City', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (583, 'madb_company_country', 'Country', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (584, 'madb_company_country', 'Pays (liste en anglais)', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (585, 'madb_choose', 'Choisissez', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (586, 'madb_choose', 'Choose', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (587, 'madb_account_signup', 'Créez votre compte', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (588, 'madb_account_signup', 'Signup', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (589, 'madb_company', 'Société', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (590, 'madb_company', 'Company', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (591, 'madb_administrator_user', 'Compte administrateur', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (592, 'madb_administrator_user', 'Administrator user', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (593, 'madb_signup', 'Créer mon compte', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (594, 'madb_signup', 'Signup', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (595, 'madb_your_login_information_is:', 'madb_your_login_information_is:', 'en', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (598, 'madb_your_login_information_is', 'Pour rappel, voici votre login. Le mot de passe est celui que vous avez entré lors de la création de votre compte.', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (599, 'madb_your_login_information_is', 'Here is your login, and the password is the one you entered at the creation of your account.', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (600, 'madb_please_confirm_your_registration_by_clicking_on_this_link', 'Suivez ce lien pour confirmer votre inscription. ', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (601, 'madb_please_confirm_your_registration_by_clicking_on_this_link', 'Follow this link to confirm your account:', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (602, 'madb_this_entity_has_no_detail_displayed_in_list_view_and_this_will_show_theses_lists_as_empty', 'Cette table n''a aucun champs affiché dans les listes, et ces listes apparaitront vide, même si des entrées existent!', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (603, 'madb_this_entity_has_no_detail_displayed_in_list_view_and_this_will_show_theses_lists_as_empty', 'This table has no detail displayed in lists, and those list will appear as empty, though records may exist in the database.', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (604, 'madb_has_public_form', 'Public entry form?', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (605, 'madb_has_public_form', 'Formulaire de saisie public?', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (122, 'madb_really_delete_entity_question', 'Really delete {{entity}} with {{title}} {{value}}?', 'en', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (606, 'madb_really_delete_entity_table_question', 'Effacer la table {{name}}?', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (607, 'madb_really_delete_entity_table_question', 'Drop table {{name}}?', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (608, 'madb_details_list', '{{database}}: liste de détails définis', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (609, 'madb_details_list', '{{database}}: list of existing details', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (610, 'madb_no_instance_found', 'Aucune donnée à afficher.', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (611, 'madb_no_instance_found', 'No data to display.', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (612, 'madb_password_must_be_five_chars_and_equal_to_confirmation', 'Votre passe doit comprendre au moins 5 caractères, et sa valeur doit être confirmée.', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (613, 'madb_password_must_be_five_chars_and_equal_to_confirmation', 'Your password must be at least 5 characters long, and you must confirm its value.', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (614, 'madb_this_is_a_popup_window_warning', 'This is a popup window!', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (615, 'madb_this_is_a_popup_window_warning', 'Attention, ceci n''est pas la fenêtre principale de l''application!', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (616, 'madb_click_here_to_disply_main_window', 'Afficher la fenêtre principal', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (617, 'madb_click_here_to_disply_main_window', 'Focus main window', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (618, 'madb_an_error_occured', 'Une erreur a eu lieu au cours de l''opération.', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (619, 'madb_an_error_occured', 'An error occured during the requested operation.', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (620, 'madb_error_record_already_linked', 'Les deux entrées que vous essayez d''associer le sont déja.', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (621, 'madb_error_record_already_linked', 'The records you want to link are already linked.', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (622, 'madb_no_only_one_parent', 'Non', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (623, 'madb_no_only_one_parent', 'No', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (624, 'madb_yes_multiple_child', 'Yes', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (625, 'madb_yes_multiple_child', 'Oui', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (626, 'madb_no_only_one_child', 'No', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (627, 'madb_no_only_one_child', 'Non', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (628, 'madb_yes_many_parents_allowed', 'oui, une entrée {{child_entity}} peut être associée a plusieurs entrées {{parent_entity}}', 'fr', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (629, 'madb_yes_many_parents_allowed', 'yes, a {{child_entity}} can be linked to multiple {{parent_entity}}', 'en', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (630, 'madb_yes_multiple_parent', 'Oui', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (631, 'madb_yes_multiple_parent', 'Yes', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (632, 'madb_short_text', 'Texte court', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (633, 'madb_short_text', 'Short text', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (634, 'madb_date', 'Date', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (635, 'madb_date', 'Date', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (636, 'madb_long_text', 'Texte long', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (637, 'madb_long_text', 'Long text', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (638, 'madb_integer', 'Nombre entier', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (639, 'madb_integer', 'Integer number', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (640, 'madb_choose_in_list', 'Choix dans une liste de proposition', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (641, 'madb_choose_in_list', 'Choice in proposition list', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (642, 'madb_normal_user', 'Accès en lecture et écriture', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (643, 'madb_normal_user', 'Read/write access', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (644, 'madb_primary_user', 'Accès administrateur', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (645, 'madb_primary_user', 'Administrator', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (655, 'madb_help_info_entities_edition', 'Vous pouvez ici éditer une entrée, et spécifier une valeur pour chaque champs.', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (656, 'madb_unlink_detail_from_entity_link_title', 'Effacer le champs et les valeurs associées', 'fr', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (657, 'madb_create_new', 'Insérez une entrée {{entity}}', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (658, 'madb_create_new', 'Enter a new {{entity}}', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (659, 'madb_from_parent_to_child_relation_name', 'Name of relation from <span class="no_css_parent_name">{{parent_entity}}</span> to <span class="no_css_child_name">{{child_entity}}</span>', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (660, 'madb_from_parent_to_child_relation_name', 'Nom de l''association de <span class="no_css_parent_name">{{parent_entity}}</span> à <span class="no_css_child_name">{{child_entity}}</span>', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (661, 'madb_no_only_one_parent_allowed', 'Non, une entrée {{child_entity}} ne peut être associée qu''à une entrée {{parent_entity}}
', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (662, 'madb_no_only_one_parent_allowed', 'No, a {{child_entity}} can be linked to only one {{parent_entity}}', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (663, 'madb_busy', 'Busy', 'en', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (664, 'madb_busy', 'Occupé', 'fr', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (665, 'madb_error_data_not_found', 'Les données demandée n''ont pu être trouvées.', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (666, 'madb_error_data_not_found', 'Requested data could not be found.', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (667, 'madb_error_data_incorrect', 'La requête effectuée est invalide (paramètres invalides).', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (668, 'madb_error_data_incorrect', 'The request was invalid (invalid parameters).', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (106, 'madb_list', 'List of {{entity}}', 'en', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (669, 'madb_list', 'Liste des {{entity}}', 'fr', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (670, 'madb_entity_details', 'Details of the {{entity}}', 'en', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (671, 'madb_entity_details', 'Détails de l''entrée {{entity}}', 'fr', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (672, 'madb_add_and_instance', 'Ajoutez une nouvelle entrée {{entity}}', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (673, 'madb_add_and_instance', 'Enter a new {{entity}}', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (674, 'madb_search_results', 'Search results', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (675, 'madb_search_results', 'Résultats de la recherche', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (676, 'madb_list_of_databases', 'Liste des bases de données', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (677, 'madb_list_of_databases', 'List of databases', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (678, 'madb_admin_entity', 'Définition de la table {{entity}}', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (679, 'madb_admin_entity', 'Definition of table {{entity}}', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (680, 'invoices', 'invoices', 'en', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (681, 'madb_web_url', 'Adresse d''un site web', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (682, 'madb_web_url', 'Website address', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (318, 'madb_new_detail_title', 'New detail', 'en', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (482, 'madb_new_detail_title', 'Nouveau détail', 'fr', 'system', NULL, '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (683, 'madb_p_blog', 'Blog', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (684, 'madb_p_blog', 'Blog', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (686, 'madb_p_demos', 'Captures d''écrans et Démos', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (687, 'madb_p_demos', 'Screenshots and Demos', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (689, 'madb_p_home', 'Accueil', 'fr', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (690, 'madb_p_home', 'Home', 'en', 'system', '', '2006-03-26 16:30:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (695, 'madb_p_products_services', 'Produits et Services', 'fr', 'system', '', '2006-03-26 16:30:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (696, 'madb_p_products_services', 'Products and Services', 'en', 'system', '', '2006-03-26 16:30:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (705, 'madb_p_homepage_title', 'MyOwnDB, the web database', 'en', 'system', '', '2006-03-26 16:30:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (707, 'madb_p_homepage_title', 'MaDB.net: la base de données web', 'fr', 'system', '', '2006-03-26 16:30:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (709, 'madb_p_main_content_products', '<h2>Products</h2>
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

<a href="contact">Contact us</a> for more information!', 'en', 'system', '', '2006-03-26 16:30:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (708, 'madb_p_main_content_products', '<h2>Produits</h2>
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

', 'fr', 'system', '', '2006-03-26 16:30:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (717, 'madb_p_submenu_content_demos', '<p><b>About the demos</b></p>
<p>Demos will be updated with new releases of the application if the feature shown in the demo has changed. Cosmetic changes will not trigger the update of the demo.</p>', 'en', 'system', '', '2006-03-26 16:30:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (716, 'madb_p_submenu_content_demos', '<p><b>A propos des démos</b></p>
<p>Les démos seront adaptées lors de mises à jours de l''application si la fonctionalité illustrée est modifiée. Des modification "cosmétiques" de l''application ne provoqueront pas la mise a jour de la démo.</p>', 'fr', 'system', '', '2006-03-26 16:30:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (720, 'madb_p_submenu_content_contact', '<p><b>Contactez-nous!</b></p>
<p>Que ce soit pour une demande d''information ou une remarque, nous nous ferons un devoir de traiter votre communication avec la plus grande attention.</p>', 'fr', 'system', '', '2006-03-26 18:08:21');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (721, 'madb_p_submenu_content_contact', '<p><b>Contact us!</b></p>
<p>When you send us a mail, be it a request for information or a remark, you can be sure it will be treated with due attention.</p>', 'en', 'system', '', '2006-03-26 18:08:21');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (722, 'madb_browser_demo_login_message_ie', 'MaDB.net est optimisé pour Firefox. Faites-vous une faveur et utilisez ce navigateur supportant les derniers standards!', 'fr', 'system', '', '2006-03-27 22:54:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (723, 'madb_browser_demo_login_message_ie', 'MyOwnDB.com is optimised for Firefox. Do yourself a favour and use a browser supporting modern standards!', 'en', 'system', '', '2006-03-27 22:54:50');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (596, 'madb_welcome_to_myowndb', 'Bienvenue sur MaDB.net!
Dès que vous aurez confirmé votre compte en suivant le lien ci-dessous, vous aurez accès aux outils MaDB.net vous permettant de gérer vos données en lignes.', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (597, 'madb_welcome_to_myowndb', 'Welcome to MyOwnDB.com!
Once you have verified your account by following the link below, you''ll have access to the tools made available on MyOwnDB.com to let you manage your data online.', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (191, 'madb_help_info_database_list', 'You find on this page the list of existing databases and you can choose which one you want to use. If this is the first time you use the application, you have to create a database through the entry "Manage databases" at the top of the screen. ', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (559, 'madb_mail_outro', 'We thank you for using our services, and stay at your service.

The MyOwnDB.com team.', 'en', 'system', '', '2006-04-04 10:28:00');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (189, 'madb_help_info_database_list', 'Vous retouvez sur cette page la liste des bases de données définies et choisir laquelle vous voulez utiliser. S''il s''agit de votre première utilisation de l''application, vous devez d''abord créer votre première base de données en cliquant sur l''entrée "Gérer mes DBs" dans la barre au sommet de l''écran.', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (724, 'madb_login_unsuccessful_account_not_yet_verified', 'Votre compte n''a pas encore été confirmé. Lors de votre inscription, vous avez reçu un mail vous demandant de confirmer votre inscription en suivant simplement un lien. Une fois votre compte confirmé, vous pourrez vous authentifier.', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (725, 'madb_login_unsuccessful_account_not_yet_verified', 'Your account hasn''t been verified yet. Please be sure to follow the instructions in the mail sent when you signed up. You should first confirm your account, and you''ll then be able to log in successfully.', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (726, 'madb_login_unsuccessful', 'Login ou mot de passe incorrect.', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (727, 'madb_login_unsuccessful', 'Login failed. Check you entered your login and password correctly.', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (728, 'madb_login_successful', 'Authentification réussie!', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (729, 'madb_login_successful', 'Login successful!', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (730, 'madb_an_error_prevented_the_creation_of_your_account', 'Une erreur a empeché la création de votre compte. Les administrateurs du services ont été prévenus.', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (731, 'madb_an_error_prevented_the_creation_of_your_account', 'An error prevented the creation of your account. The administrators of the service have been notified.', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (732, 'madb_account_type_free', 'Gratuit', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (733, 'madb_account_type_free', 'Free', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (738, 'madb_account_type_signup', 'Type d''abonnement', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (739, 'madb_account_type_signup', 'Subscription level', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (740, 'madb_error_saving_database', 'La base de données n''a pu être créée', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (741, 'madb_error_saving_database', 'The database could not be created', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (742, 'madb_limit_of_account_reached', 'Vous avez atteint les limites de votre abonnement. Il est peut-être temps de passer à un niveau d''abonnement supérieur. Vous trouverez toutes les informations sous la rubrique "Préférences" dans le coin supérieur droit de l''écran.  Merci pour votre intense utilisation de MaDB.net!', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (743, 'madb_limit_of_account_reached', 'You have reached the limits of your subscription level. Please evaluate upgrading to a higher level. You''ll find all necessary information in your settings. Thanks for your intensive use of MyOwnDB.com!', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (744, 'madb_error_saving_user', 'Erreur dans la création de l''utilisateur', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (745, 'madb_error_saving_user', 'Error creating the user', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (746, 'madb_password_too_short', 'Mot de passe trop court (minimum 5 caractères)', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (747, 'madb_password_too_short', 'Password too short (minimum 5 characters)', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (748, 'madb_login_too_short', 'Login trop court (êtes-vous sûr qu''il s''agit d"une adresse émail valide?)', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (749, 'madb_login_too_short', 'Login too short (are you sure this is a valid email address?)', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (750, 'madb_login_not_a_valid_email', 'Votre login doit être une adresse email valide!', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (751, 'madb_login_not_a_valid_email', 'Your login has to be a valid email address!', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (752, 'madb_login_already_taken', 'Ce login existe déja. Si vous avez oublié votre mot de passe vous pouvez le récupérer depuis la page de login.', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (753, 'madb_login_already_taken', 'This login is already taken. If you forgot your password, you can reinitialise it from the login page.', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (754, 'madb_login_cannot_be_blank', 'Le mot de passe ne peut pas être vide!', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (755, 'madb_login_cannot_be_blank', 'The password cannot be blank!', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (756, 'madb_login_not_confirmed', 'La confirmation du login ne correspond pas.', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (757, 'madb_password_and_confirmation_needed', 'Veillez à bien entrer votre mot de passe et sa confirmation', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (758, 'madb_password_and_confirmation_needed', 'Please check you typed your password and its confirmation', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (759, 'madb_password_not_confirmed', 'Veuillez entrer la confirmation de votre mot de passe.', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (760, 'madb_password_not_confirmed', 'Please confirm your password.', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (761, 'madb_error_in_account', 'Erreur dans la création de la société (voir ci-dessus)', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (762, 'madb_error_in_account', 'Error in the creation of the company (see above)', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (763, 'madb_enter_account_name', 'Entrez un nom de société ou d''organisation(entrez vos nom/prénom si vous êtes un particulier)', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (764, 'madb_choose_country', 'Indiquez votre pays', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (765, 'madb_choose_country', 'Indicate your country', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (766, 'madb_unlimited_number_of_users', 'Illimité', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (767, 'madb_unlimited_number_of_users', 'Unlimited', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (768, 'madb_error_saving_account', 'Erreur dans l''insertion de votre société', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (769, 'madb_error_saving_account', 'Error creating your company', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (770, 'madb_select_account_type', 'Votre choix:', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (771, 'madb_select_account_type', 'your choice:', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (772, 'madb_login_not_confirmed', 'Login confirmation isn''t correct.', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (773, 'madb_enter_account_name', 'Enter your company or organisation name (if this is a personal account, enter your fist and last name)', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (774, 'madb_login_email', 'Email (Will be your login):', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (775, 'madb_login_email', 'Email (Sera votre login):', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (776, 'madb_welcom_to_madb_signup_subject', '[MaDB] - Bienvenue sur MaDB.net', 'fr', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (777, 'madb_welcom_to_madb_signup_subject', '[MyOwnDB] - Welcome to MyOwnDB.com', 'en', 'system', '', '2006-03-31 12:49:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (778, 'tos_acceptance_needed', 'Vous devez  indiquer que vous avez lu et compris et que vous acceptez les conditions d''utilisation (Terms of Service) rédigées en Anglais.', 'fr', 'system', '', '2006-03-31 15:36:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (779, 'tos_acceptance_needed', 'You must agree to the Terms of Service', 'en', 'system', '', '2006-03-31 15:36:04');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (781, 'madb_tos_accepted', 'I have read and accept the <a class="link" href="/TOS.html">Terms of Service</a>', 'en', 'system', '', '2006-04-01 12:04:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (780, 'madb_tos_accepted', 'J''ai lu et compris et j''accepte les <a class="link" href="/TOS.html">conditions d''utilisation</a> rédigées en Anglais ', 'fr', 'system', '', '2006-04-01 12:04:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (782, 'madb_host', 'www.madb.net', 'fr', 'system', '', '2006-04-01 12:04:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (783, 'madb_host', 'www.myowndb.com', 'en', 'system', '', '2006-04-01 12:04:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (302, 'madb_define_new_link', 'Définition d''une association', 'fr', 'system', NULL, '2006-04-01 21:02:34');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (784, 'madb_change_password_subject', '[MaDB] Changement de mot de passe', 'fr', 'system', '', '2006-04-03 21:34:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (785, 'madb_change_password_subject', '[MyOwnDB] New password', 'en', 'system', '', '2006-04-03 21:34:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (786, 'madb_forgot_password_subject', '[MaDB]: oubli de votre mot de passe', 'fr', 'system', '', '2006-04-03 21:34:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (787, 'madb_forgot_password_subject', '[MyOwnDB]: forgotten password', 'en', 'system', '', '2006-04-03 21:34:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (702, 'madb_p_submenu_content_home', '<p><b>A propos</b><p>
<p>MaDB.net est une application web exploitant les dernières technoligies pour proposer une application dynamique.</p><p><b><a href="/app/authentication/demo_login">Essayez la démo</a>!</b></p>', 'fr', 'system', '', '2006-04-04 10:33:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (703, 'madb_p_submenu_content_home', '<p><b>About</b>:<p>
<p>MyOwnDB.com is a web application using the latest development techniques to provide a dynamic interface.</p><p><b><a href="/app/authentication/demo_login">Test the demo</a>!</b></p>', 'en', 'system', '', '2006-04-04 10:33:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (788, 'madb_new_database_title', 'Création d''une nouvelle Base de Donnée', 'fr', 'system', '', '2006-04-04 10:36:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (541, 'madb_new_database_title', 'Creation of a new Database', 'en', 'system', '', '2006-04-04 10:36:06');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (789, 'madb_error_incorrect_data', 'Requête incorrecte.', 'fr', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (322, 'madb_error_incorrect_data', 'Incorrect request.', 'en', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (790, 'madb_detail_name_cannot_be_id', 'Le nom du détail ne peut actuellement être "id".', 'fr', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (791, 'madb_detail_name_cannot_be_id', 'The name of the detail may currently not be "id".', 'en', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (792, 'madb_error_saving_detail', 'Problème de sauvegarde du détail.', 'fr', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (793, 'madb_error_saving_detail', 'Problem saving the detail.', 'en', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (794, 'madb_duplicate_detail_name_in_db', 'Un détail du même nom existe déja dans cette base de données.', 'fr', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (795, 'madb_duplicate_detail_name_in_db', 'A detail with the same name already exists in this database.', 'en', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (796, 'madb_detail_name_cannot_be_empty', 'Le nom du détail ne peut être laissé blanc.', 'fr', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (797, 'madb_detail_name_cannot_be_empty', 'The detail name cannot be blank.', 'en', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (291, 'madb_help_info_admin_details_value_propositions_for_show', 'Voici les propositions pour ce détail', 'fr', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (798, 'madb_account_activation_impossible_because_not_found', 'Votre compte n''a pu être vérifié. Vérifiez-que le lien qui vous a été envoyé est bien affiché sur une ligne. Vous pouvez essayer de copier l''adresse du lien et la coller dans la bare d''adresse de votre navigateur internet. Si le problème persiste, veuillez contacter <a href="mailto:admin@madb.net">admin@madb.net</a>', 'fr', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (799, 'madb_account_activation_impossible_because_not_found', 'You account could not be verified. Check that the link sent to you is displayed on one line in you mail client. You can also try to copy the address of the link sent to you, and paste it in the address bar of your browser. If the problem persists, please contact <a href="mailto:admin@myowndb.com">admin@myowndb.com</a>.', 'en', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (800, 'madb_export', 'Exporter ces données', 'fr', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (801, 'madb_export', 'Export these data', 'en', 'system', '', '2006-04-09 10:51:39');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (802, 'madb_insertion_was_successful', 'Your data has been saved.', 'en', 'system', '', '2006-04-11 13:13:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (718, 'madb_p_main_content_contact', '<h2>Contacts</h2>

Pour tous vos commentaires, remarques, suggestions, requêtes d''information, vous pouvez  envoyer un courriel à <a href="mailto:info@madb.net">info@madb.net</a> ou le formulaire ci-dessous, généré par l''application madb.net.<br>
Nous vous répondrons dans les plus brefs délais.


<iframe src="http://www.madb.net/app/entities/public_form/838" style="height:22em;width:100%;border:0px"></iframe>', 'fr', 'system', '', '2006-04-10 21:09:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (719, 'madb_p_main_content_contact', '<h2>Contact</h2>

For all your feedback, remarks, suggestions, enquiries, please send a mail to <a href="mailto:info@madb.net">info@madb.net</a> or  use the form below, generated by the MyOwnDB application. You can expect a fast answer.

<iframe src="http://www.madb.net/app/entities/public_form/838" style="height:22em;width:100%;border:0px"></iframe>', 'en', 'system', '', '2006-04-10 21:09:27');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (803, 'madb_p_submenu_content_post_to_delicious', '<a href="http://del.icio.us/post" onclick="window.open(''http://del.icio.us/post?v=4&noui&jump=close&url=''+encodeURIComponent(location.href)+''&title=''+encodeURIComponent(document.title), ''delicious'',''toolbar=no,width=700,height=400''); return false;">Sauvez sur del.icio.us</a>', 'fr', 'system', '', '2006-04-11 13:13:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (804, 'madb_p_submenu_content_post_to_delicious', '<a href="http://del.icio.us/post" onclick="window.open(''http://del.icio.us/post?v=4&noui&jump=close&url=''+encodeURIComponent(location.href)+''&title=''+encodeURIComponent(document.title), ''delicious'',''toolbar=no,width=700,height=400''); return false;"> Save on del.icio.us</a>', 'en', 'system', '', '2006-04-11 13:13:36');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (805, 'madb_number_of_records_in_list', '{{number}} elements', 'fr', 'system', '', '2006-04-14 14:23:53');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (806, 'madb_number_of_records_in_list', '{{number}} items', 'en', 'system', '', '2006-04-14 14:23:53');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (807, 'madb_p_submenu_content_social_bookmarking', 'Bookmarkez Madb.net', 'fr', 'system', '', '2006-04-14 15:57:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (808, 'madb_p_submenu_content_social_bookmarking', 'Bookmark MyOwnDB.com', 'en', 'system', '', '2006-04-14 15:57:35');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (692, 'madb_p_main_content_home', '<img src="/images/myowndb-head.gif">
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
</ul>', 'fr', 'system', '', '2006-04-14 16:16:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (693, 'madb_p_main_content_home', '<img src="/images/myowndb-head.gif">
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
</ul>', 'en', 'system', '', '2006-04-14 16:16:30');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (809, 'madb_welcome_to_myowndb_paying_account', 'Bienvenue sur madb.net!

Vous trouverez ci-dessous les informations concernant votre compte utilisateur.', 'fr', 'system', '', '2006-06-05 11:17:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (810, 'madb_welcome_to_myowndb_paying_account', 'Welcome to MyOwnDB!

you''ll find below the information about your account.
', 'en', 'system', '', '2006-06-05 11:17:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (811, 'madb_we_have_received_your_first_payment_and_account_is_activated.', 'We have received your first payment and your account has been activated. You can login at :', 'en', 'system', '', '2006-06-05 11:17:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (812, 'madb_we_have_received_your_first_payment_and_account_is_activated.', 'Nous avons réceptionné votre premier paiement et votre compte est maintenant activé. Vous pouvez  vous authentifier en suivant ce lien:', 'fr', 'system', '', '2006-06-05 11:17:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (815, 'madb_your_current_subscription_plan', 'Vous utilisez actuellement un abonnement <span class="subscription_type">{{subscription}}</span>.', 'fr', 'system', '', '2006-06-05 11:17:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (816, 'madb_your_current_subscription_plan', 'You''re currently using a subscription <span class="subscription_type">{{subscription}}</span>', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (817, 'madb_mail_account_expired', 'Cher utilisateur,

votre compte utilisateur sur MaDB.net est arrivé à expiration. Nous regrettons de vous perdre comme utilisateur, mais espérons que de futur développpement vous ferons changer d''avis. Si vous avez des reproches ou remarques à propos de l''application nous apprécierions que vous preniez le temps de nous les transmettre à info@madb.net.

En espérant vous revoir bientôt sur http://www.madb.net

L''équipe de MaDB.net', 'fr', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (818, 'madb_mail_account_expired', 'Dear user,

You account on MyOwnDB has expired. We regret to loose you as a user, but hope that futur developments will make you change your mind. If you have remarks about the application, we would appreciate if you took the time to share them with us by sending a mail to info@myowndb.com.

Hoping to see you back soon on http://www.myowndb.com

the MyOwnDB team.', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (819, 'madb_eot_subject', 'Expiration de votre complet MaDB.net', 'fr', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (820, 'madb_eot_subject', 'MyOwnDB Account expired', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (821, 'madb_login_not_allowed_for_account_contact_admin', 'Authentification non acceptée. Veuillez contacter admin@madb.net.', 'fr', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (822, 'madb_login_not_allowed_for_account_contact_admin', 'Ahtentication not accepted, please contact admin@myowndb.com.', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (825, 'madb_excluding_vat', 'hors TVA', 'fr', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (826, 'madb_excluding_vat', 'excluding VAT', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (827, 'madb_vat_explanations', '<!--NO NEW LINES NI THIS OR IT BREAKS THE INTERFACE-->Si vous êtes localisé <string>en dehors de l''Union européenne</strong>, vous ne paierez <strong>aucune TVA</strong>.<br/>Si vous agissez au nom d''une <strong>société<strong> établie dans l''Union européenne, fournir votre numéro TVA vous permettra de ne pas payer la TVA sur le prix d''abonnement à madb.net. Pour les sociétés belges, 21% de TVA seront ajoutés, mais pourront être récupéré.<br>Si vous agissez en tant que <strong>particulier établis dans l''Union Européenne, 21% de TVA </strong>seront ajoutés au prix de l''abonnement.', 'fr', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (828, 'madb_vat_explanations', '<!--NO NEW LINES NI THIS OR IT BREAKS THE INTERFACE-->If you''re subscribing from <strong>outside the European Union</strong>, <string>no VAT</strong> will be applied.<br/>If you''re subscribing in the name of a <strong>company</strong> established in the European Union, filling in your VAT number will allow you to not pay VAT on your subscriptions. Belgian companies have to pay 21% VAT.<br>If you''re subscribing as an <strong>individual</strong> established in the European union, 21% VAT will be added to the price of the subscription.', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (829, 'madb_pay_with_paypal', 'Payer avec Paypal.', 'fr', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (830, 'madb_pay_with_paypal', 'Pay with Paypal.', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (831, 'madb_click_button_to_subscribe_through_paypal', 'Cliquez sur le bouton suivant pour vous abonnez à madb.net pour {{amount}} euros par mois. Vous pouvez annuler votre abonnement à tout moment, mais aucun remboursement ne sera effectué.', 'fr', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (832, 'madb_click_button_to_subscribe_through_paypal', 'Click the button below to subscribe to myowndb.com for {{amount}} euros paid monthly. You can cancel your subscription any time, but no refund is possible.', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (833, 'madb_company_vat', 'Numéro de TVA', 'fr', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (834, 'madb_company_vat', 'VAT registration number', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (835, 'madb_back_to_vat_change', 'Retour aux informations de TVA', 'fr', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (836, 'madb_back_to_vat_change', 'Back to VAT information', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (838, 'madb_your_registered_vat_number_confirm_or_change', 'Here is the VAT number that will be used for invoicing. Please confirm or update the data, and you''ll be taken to the upgrade page.', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (839, 'madb_account_not_active_or_cancelled', 'Compte inactif ou annullé.', 'fr', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (840, 'madb_account_not_active_or_cancelled', 'Account inactive or cancelled.', 'en', 'system', '', '2006-06-05 11:17:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (845, 'madb_monthly_fee', 'Prix mensuel', 'fr', 'system', '', '2006-06-07 22:42:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (841, 'madb_monthly_fee', 'Monthly fee', 'en', 'system', '', '2006-06-07 22:42:51');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (837, 'madb_your_registered_vat_number_confirm_or_change', 'Voici les données TVA qui seront utilisées pour la facturation. Veuillez confirmer ou adapter ces données, et vous serez ensuite redirigé vers la page des mise à jours.', 'fr', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (846, 'madb_error_creating_instance', 'Problème pour sauvegarder la nouvelle entrée', 'fr', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (847, 'madb_error_creating_instance', 'Problem creating new entry', 'en', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (848, 'madb_delete_file', 'Effacer le fichier', 'fr', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (849, 'madb_delete_file', 'Delete file', 'en', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (850, 'madb_file_transfer_quota_reached', 'Vous avez atteint les limites d''utilisation de votre compte.pour l''attachement de fichier. ', 'fr', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (851, 'madb_file_transfer_quota_reached', 'You reached the limits of your account regarding file attachments.', 'en', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (852, 'madb_replace_file', 'Remplacer le fichier', 'fr', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (853, 'madb_replace_file', 'Replace file', 'en', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (854, 'madb_go_back_do_no_replace_current_file', 'Faire marche arrière et ne pas remplacer le fichier.', 'fr', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (855, 'madb_go_back_do_no_replace_current_file', 'Go back and keep current file.', 'en', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (856, 'madb_this_will_erase_the_current_file', 'Cette opération effacera définitivement le fichier, êtes-vous sûr de vouloir continuer?', 'fr', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (857, 'madb_this_will_erase_the_current_file', 'This operation will definitively erase the file, are you sure you want to continue?', 'en', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (858, 'madb_maximum_attachment_size', 'Taille maximale de fichiers attachés', 'fr', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (859, 'madb_maximum_attachment_size', 'Maximum size of attached files', 'en', 'system', '', '2006-07-16 13:09:44');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (860, 'madb_maximum_monthly_file_transfer', 'Transfert maximum de fichier attachés:', 'fr', 'system', '', '2006-07-16 13:09:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (861, 'madb_maximum_monthly_file_transfer', 'Maximum transfer of attached files:', 'en', 'system', '', '2006-07-16 13:09:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (862, 'madb_maximum_attachment_number', 'Nombre maximum de fichiers pouvant être attachés:', 'fr', 'system', '', '2006-07-16 13:09:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (863, 'madb_maximum_attachment_number', 'Maximum number of files you may upload', 'en', 'system', '', '2006-07-16 13:09:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (864, 'madb_maximum_montly_file_transfer_explanations_tooltip', 'Une fois cette limite atteinte, il vous est impossible de sauvegarder de nouveau fichier. Une marge de 10% vous est accordée pour le download de fichier sauvegardés dans madb.net', 'fr', 'system', '', '2006-07-16 13:09:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (865, 'madb_maximum_montly_file_transfer_explanations_tooltip', 'Once this limit is reached, you cannot upload more files. A margin of 10% is left so you can still download files.', 'en', 'system', '', '2006-07-16 13:09:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (866, 'madb_subscription_type_characteristics', 'Caractéristiques de votre compte', 'fr', 'system', '', '2006-07-16 13:09:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (867, 'madb_subscription_type_characteristics', 'Characteristics of your account', 'en', 'system', '', '2006-07-16 13:09:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (868, 'madb_s3_attachment', 'Fichier attaché', 'fr', 'system', '', '2006-07-16 13:09:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (869, 'madb_s3_attachment', 'File attachment', 'en', 'system', '', '2006-07-16 13:09:45');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (698, 'madb_p_latest_news', '<p><i>Dernière mise à jour:</i></p>
<p><b>File upload available! <a href="/demos/file_uploads.html">Visualisez la démo!</a></b>', 'fr', 'system', '', '2006-07-20 23:06:47');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (700, 'madb_p_latest_news', '<p><i>Latest news:</i></p>
<p><b>File upload available! <a href="/demos/file_uploads.html">Watch the demo!</a></b></p>', 'en', 'system', '', '2006-07-20 23:06:47');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (714, 'madb_p_main_content_demos', '<h2>Démos</h2>
Vous trouverez ci-dessous plusieurs démonstrations (en anglais, au format flash) d''utilisation de MaDB.net qui devraient vous permettre de vous familiariser rapidement avec l''application.
<ul>
<li><b>Interface de l''application</b>: une démo très courte indiquant les principaux élément de l''interface. <p class="datum"><a href="/demos/intro.html" target="madb_demo">LANCER LA DEMO</a></p></li>

<li><b>Sauvegarde de fichiers</b>: Démonstration de la sauvegarde de fichiers, <p class="datum"><a href="/demos/file_uploads.html" target="madb_demo">LANCER LA DEMO</a>(5.2Mo)</p></li>


<li><b>Fonctionalité de recherche</b>: découvrez la fonctionalité de recherche disponible dès que la structure des données est définie.<p class="datum"><a href="/demos/search.html" target="madb_demo">LANCER LA DEMO</a>(2.4Mo)</p></li>
<li><b>Définition de données simple</b>: voyez comment définir une base de données de suivi d''appels téléphoniques<p class="datum"><a href="/demos/simple_admin.html" target="madb_demo">LANCER LA DEMO</a>(4.5Mo)</p></li>
<li><b>Définition et utilisation de liens entre tables</b>: voyez comment définir des liens entre différentes tables.<p class="datum"><a href="/demos/define_links.html" target="madb_demo">LANCER LA DEMO</a>(4.9Mo)</p></li>
<li><b>Export CSV</b>: Démonstration de l''exportation des données au format CSV, utilisable dans tous tableurs.<p class="datum"><a href="/demos/csv_export.html" target="madb_demo">LANCER LA DEMO</a>(5.3Mo)</p></li>

</ul>', 'fr', 'system', '', '2006-07-20 23:06:47');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (715, 'madb_p_main_content_demos', '<h2>Demos</h2>
Below you''ll find several flash demos of MyOwnDB.com to get you rapidly familiarised with the application.
<ul>
<li><b>Application interface</b>: A short demo to show the most important elements of the interface. <p class="datum"><a href="/demos/intro.html" target="madb_demo">LAUNCH DEMO</a></p></li>

<li><b>File uploads</b>: Demonstration of the file attachment feature. <p class="datum"><a href="/demos/file_uploads.html" target="madb_demo">LAUNCH DEMO</a>(5.2Mo)</p></li>


<li><b>Search functionality</b>: Discover the search functionality that is available as soon as you''ve defined the structure of your data.<p class="datum"><a href="/demos/search.html" target="madb_demo">LAUNCH DEMO</a>(2.4Mo)</p></li>
<li><b>Simple data definition</b>: Learn how to define a simple database to track phone calls<p class="datum"><a href="/demos/simple_admin.html" target="madb_demo">LAUNCH DEMO</a>(4.5Mo)</p></li>
</li>
<li><b>Linking tables</b>: Learn how to link to tables. <p class="datum"><a href="/demos/define_links.html" target="madb_demo">LAUNCH DEMO</a>(4.9Mo)</p></li>
<li><b>CSV Export</b>: Demonstration of the export of data in the CSV format, which is usable in every spreadsheet.. <p class="datum"><a href="/demos/csv_export.html" target="madb_demo">LAUNCH DEMO</a>(4.9Mo)</p></li>
</ul>', 'en', 'system', '', '2006-07-20 23:06:47');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (132, 'madb_new_translation', 'madb_new_translation', 'nl', 'system', '', '2006-07-30 21:30:15');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (844, 'madb_subscription_type', 'Subscription type', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (428, 'madb_help_info_admin_details_value_propositions_for_edit', 'Il n''est actuellement pas possible de modifier la liste de propositions.', 'fr', 'system', '', '2006-07-30 21:30:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (409, 'madb_edit_database', 'Modification d''une base de données', 'fr', 'system', '', '2006-07-30 21:30:16');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (843, 'madb_display_contextual_help', 'Show helping explanations', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (842, 'madb_question', 'question', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (870, 'madb_translation_updated_at', 'Mis à jour', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (871, 'madb_translation_updated_at', 'Last update', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (872, 'madb_translation_scope', 'Champs d''application', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (873, 'madb_translation_scope', 'Scope', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (147, 'madb_new_translation', 'Nouvelle traduction', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (152, 'madb_new_translation', 'New translation', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (129, 'madb_find_translations_matching', '', 'nl', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (144, 'madb_find_translations_matching', 'Recherche', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (149, 'madb_find_translations_matching', 'Find translations', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (874, 'madb_translation_t_id', 'terme', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (875, 'madb_translation_t_id', 'translation id', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (876, 'madb_translation_value', 'Traduction', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (877, 'madb_translation_value', 'Translation', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (878, 'madb_translation_lang', 'Langue', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (879, 'madb_translation_lang', 'Language', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (421, 'madb_back', 'Back', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (234, 'updated_at', 'Mis à jour le', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (303, 'madb_you_need_to_provide_names_for_the_link_in_both_directions', 'Veuillez entrer un nom pour la relation dans chaque sens.', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (321, 'madb_you_need_to_provide_names_for_the_link_in_both_directions', 'You need to provide names for the link in both directions.', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (880, 'madb_you_can_add_an_entry', 'You can add a new entry', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (529, 'madb_users_list', 'Liste des utilisateurs', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (499, 'madb_users_list', 'Users list', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (156, 'madb_urls_where_translation_appears', 'URL contenant le terme', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (164, 'madb_urls_where_translation_appears', 'URLs containing the translation', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (881, 'madb_translation_missing_translations', 'Traductions manquantes', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (882, 'madb_translation_missing_translations', 'Missing Translations', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (883, 'madb_translation_existing_translations', 'Termes traduits', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (884, 'madb_translation_existing_translations', 'Translated terms', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (885, 'madb_subscription_type', 'Type d''abonnement', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (886, 'madb_translation_check_usage_in_source_code', 'Utilisé?', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (887, 'madb_translation_check_usage_in_source_code', 'Check usage', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (292, 'madb_status', 'Status', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (343, 'madb_status', 'Status', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (534, 'madb_settings_could_not_be_saved', 'Vos préférences n''ont pas pu être sauvées.', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (888, 'madb_settings_could_not_be_saved', 'Your settings could not be saved.', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (157, 'madb_resize', 'Adapter la taille', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (165, 'madb_resize', 'Resize', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (355, 'madb_really_delete_all_existing_links_question', 'Effacer toutes les relations existantes?', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (337, 'madb_really_delete_all_existing_links_question', 'Really delete all existing links?', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (889, 'madb_question', 'question', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (290, 'madb_proposition_exists', 'La proposition existe', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (319, 'madb_proposition_exists', 'The proposition exists', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (158, 'madb_previous_page', 'Page précédente', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (169, 'madb_previous_page', 'Previous page', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (288, 'madb_parent', 'Parent', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (300, 'madb_parent', 'Parent', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (155, 'madb_notes', 'Notes', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (163, 'madb_notes', 'Notes', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (145, 'madb_next_page', 'Page suivante', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (150, 'madb_next_page', 'Next page', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (143, 'madb_listing_translations', 'Liste des traductions', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (148, 'madb_listing_translations', 'List of translations', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (220, 'madb_help_info_translations_list_intro', 'The first list shows existing translations, the second shows missing translations', 'en', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (232, 'madb_help_info_translations_list_intro', 'La première liste affiche les traduction existantes, la seconde les traductions manquantes', 'fr', 'system', '', '2006-07-30 21:30:17');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (294, 'madb_help_info_admin_entities_edit', 'Vous pouvez modifier le nom de l''entité', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (890, 'madb_help_info_admin_entities_edit', 'You can change the name of the entity', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (341, 'madb_help_info_admin_details_value_propositions_for_edit', 'It is currently not possible to edit the propositions list', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (891, 'madb_help_info_admin_edit_detail', 'Vous pouvez ici modifier le détail existant. Toutes les caractéristiques ne peuvent être modifiée (par exemple le type du detail ne peut être modifié de "Choix dans une liste" vers "Date")

', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (892, 'madb_help_info_admin_edit_detail', 'You can edit an existing detail. Not all characteristics can be changed. For example you can''t modify a detail of type "Choice in list" to make it a "Date".', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (410, 'madb_help_info_admin_databases_edit', 'Vous pouvez modifier une base de donnée existante.', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (893, 'madb_help_info_admin_databases_edit', 'You can modify an existing database.', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (263, 'madb_entity_edition', 'Modification d''une entrée', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (894, 'madb_entity_edition', 'Edition of an entry', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (895, 'madb_editing_users', 'Edition d''utilisateur', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (520, 'madb_editing_users', 'User edition', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (154, 'madb_editing_translations', 'Edition de traduction', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (162, 'madb_editing_translations', 'Translation Edition', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (293, 'madb_edit_entity', 'Modification d''une entité', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (896, 'madb_edit_entity', 'Modification of an entity', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (897, 'madb_edit_detail', 'Modification d''un détail', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (898, 'madb_edit_detail', 'Modification of a detail', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (899, 'madb_edit_database', 'Edition of a database', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (401, 'madb_display_info_help', 'Display integrated help', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (439, 'madb_destroy_entity_link_title', 'Supprimer la table et toutes ses entrées.', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (326, 'madb_destroy_entity_link_title', 'destroy the table and all its entries', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (437, 'madb_administrate_entity_link_title', 'Ce liens vous donne accès à la définition de cette entité, comme ses détails et liens vers d''autres entitiés.', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (324, 'madb_administrate_entity_link_title', 'This link gives you access to the definition of this entity like its details and links to other entities.', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (483, 'madb_add_detail_to_entity', 'Ajoût d''un détail à {{entity}}', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (450, 'madb_add_detail_to_entity', 'Add a detail to {{entity}}', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (146, 'madb_enter_id_of_the_translation', 'Entrez l''identifiant de la traduction', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (151, 'madb_enter_id_of_the_translation', 'Enter id of the translation', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (900, 'madb_translation_ids', 'Identifiants', 'fr', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (901, 'madb_translation_ids', 'Translation ids', 'en', 'system', '', '2006-07-30 21:30:18');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (734, 'madb_number_of_databases', 'Nombre de bases de données', 'fr', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (902, 'madb_no_detail_saved_enter_at_least_one_valid_value', 'Veuillez entrer au moins une valeur.', 'fr', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (903, 'madb_no_detail_saved_enter_at_least_one_valid_value', 'Enter at least one value.', 'en', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (904, 'it', 'it', 'en', 'system', NULL, '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (905, 'madb_english_translation', 'madb_english_translation', 'en', 'system', NULL, '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (906, 'madb_english_translation', 'English translation', 'fr', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (907, 'madb_english_translation', '', 'it', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (908, 'pt', 'pt', 'en', 'system', NULL, '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (909, 'pt-br', 'pt-br', 'en', 'system', NULL, '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (910, 'ru', 'ru', 'en', 'system', NULL, '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (911, 'cancel', 'Cancelar', 'pt', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (912, 'entity', 'entidade', 'pt', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (913, 'cancel', 'Отменить', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (914, 'en', 'Английский', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (915, 'ru', 'Русский', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (916, 'pt', 'Португальский', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (917, 'pt-br', 'Португальский (Бразилия)', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (918, 'nl', 'Голландский', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (919, 'fr', 'Французский', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (920, 'it', 'Итальянский', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (921, 'madb_add_new', 'Добавить новую запись', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (166, 'madb_related_children_objects', 'madb_related_children_objects', 'en', 'system', NULL, '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (922, 'madb_all', 'Все', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (923, 'madb_help', 'Подсказка', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (924, 'madb_listing_translations', 'Список переводов', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (925, 'madb_list_of_databases', 'Список баз данных', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (926, 'madb_lastname', 'Фамилия', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (927, 'madb_list', 'Список {{entity}}', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (928, 'madb_integer', 'Целое число', 'ru', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (929, 'madb_account_type_personal', 'Personnel', 'fr', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (930, 'madb_account_type_personal', 'Personal', 'en', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (931, 'madb_account_type_association', 'Association', 'fr', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (932, 'madb_account_type_association', 'Association', 'en', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (933, 'madb_account_type_enterprise', 'Entreprise', 'fr', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (934, 'madb_account_type_enterprise', 'Enterprise', 'en', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (935, 'madb_reactivate_subscription_to', 'Choisir l''abonnement {{subscription_name}}', 'fr', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (936, 'madb_reactivate_subscription_to', 'Choose the {{subscription_name}} subscription', 'en', 'system', '', '2006-10-08 15:58:56');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (735, 'madb_number_of_databases', 'Number of databases', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (736, 'madb_number_of_users', 'Nombre d''utilisateurs', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (737, 'madb_number_of_users', 'Number of users', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (937, 'madb_account_reactivate', 'Réactivation du compte', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (938, 'madb_account_reactivate', 'Reactivate account', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (939, 'madb_account_upgrade', 'Mise à jour de l''abonnement', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (940, 'madb_account_upgrade', 'Upgrade your subscription', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (941, 'madb_invoice_from', 'Van', 'nl', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (942, 'madb_invoice_from', 'De', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (943, 'madb_invoice_from', 'From', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (944, 'madb_invoice_to', 'Naar', 'nl', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (945, 'madb_invoice_to', 'A', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (946, 'madb_invoice_to', 'To', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (947, 'madb_amount', 'Bedrag', 'nl', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (948, 'madb_amount', 'Montant', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (949, 'madb_amount', 'Amount', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (950, 'madb_invoiced_item', 'Produit facturé', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (951, 'madb_invoiced_item', 'Product invoiced', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (952, 'madb_invoice_vat_amount', 'TVA', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (953, 'madb_invoice_vat_amount', 'VAT', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (954, 'madb_invoice_total_amount', 'Total', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (955, 'madb_invoice_total_amount', 'Total', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (824, 'madb_upgrade_subscription_to', 'Upgrade to {{subscription_name}} level', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (823, 'madb_upgrade_subscription_to', 'Passer au niveau {{subscription_name}}', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (813, 'madb_payment_received_and_account_activated', 'Votre paiement de {{amount}} {{currency}} a bien été réceptionné par l''intermédiare de Paypal et vous pouvez dès à présent utiliser votre compte après vous avoir authentifié sur la <a href="/app/authentication/login">page de login</a>.', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (814, 'madb_payment_received_and_account_activated', 'We have received your payment of {{amount}} {{currency}} through Paypal, and you can immediately use the application after authentication on the <a href="/app/authentication/login">login page</a>.', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (956, 'madb_invoices_list', 'Factures', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (957, 'madb_invoices_list', 'Invoices', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (958, 'madb_link_to_invoices_list', 'Vous pouvez visualiser <a href="{{url}}">vos factures</a>.', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (959, 'madb_link_to_invoices_list', 'You can look at <a href="{{url}}">all your invoices.</a>', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (960, 'madb_your_subscription_is_cancelled', 'Votre abonnement a été annullé, et prendra fin le {{end_date}}', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (961, 'madb_your_subscription_is_cancelled', 'Your subscription was cancelled, and will end on {{end_date}}', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (962, 'madb_invoice_number', 'Numéro de facture', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (963, 'madb_invoice_number', 'Invoice number', 'en', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (964, 'madb_invoice_date', 'Date de facturation', 'fr', 'system', '', '2006-10-08 15:58:57');
INSERT INTO translations (id, t_id, value, lang, scope, id_filter, updated_at) VALUES (965, 'madb_invoice_date', 'Invoicing date', 'en', 'system', '', '2006-10-08 15:58:57');


--
-- Data for Name: translator2language; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: translators; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: translators_hints; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (2, 'madb_register_for_an_account', '', '--- 
- /authentication/login');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (3, 'madb_did_you_forget_your_password', '', '--- 
- /authentication/login');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (4, 'madb_madb', '', '--- 
- /authentication/login');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (5, 'madb_creation_of_databases_happens_in_the_admin_part', '', '--- 
- /database');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (6, 'madb_name', '', '--- 
- /database');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (7, 'madb_use', '', '--- 
- /database');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (25, 'number_of_disks', '', '--- 
- /entities/list/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (26, 'year', '', '--- 
- /entities/list/608');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (35, 'name', '', '--- 
- /entities/list/609');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (36, 'birthday', '', '--- 
- /entities/list/609');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (17, 'madb_list', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (37, 'tracks', '', '--- 
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (19, 'madb_create_new_entity', '
 With translation parameters:
entity_name, ', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (20, 'madb_cancel', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (21, 'madb_submit', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (22, 'madb_reset', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (23, 'madb_open_in_new_window', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (24, 'title', '', '--- 
- /entities/list/608
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (38, 'length', '', '--- 
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (27, 'view', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (28, 'edit', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (29, 'delete', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (30, 'madb_view', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (31, 'madb_edit', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (32, 'madb_delete', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (33, 'madb_really_delete_entity_question', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (8, 'madb_admin_databases', '', '--- 
- /database
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (9, 'madb_admin_users', '', '--- 
- /database
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (10, 'madb_settings', '', '--- 
- /database
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (11, 'madb_logout', '', '--- 
- /database
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (12, 'madb_my_databases', '', '--- 
- /database
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (13, 'madb_admin_database', '', '--- 
- /database
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (18, 'CDs', '', '--- 
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (14, 'madb_add_new', '', '--- 
- /database
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (15, 'madb_search', '', '--- 
- /database
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (16, 'madb_modify_entity', '', '--- 
- /database
- /entities/list/608
- /entities/list/609
- /entities/list/610');
INSERT INTO translators_hints (id, t_id, notes, urls) VALUES (34, 'artists', '', '--- 
- /entities/list/609
- /entities/list/610');


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
-- PostgreSQL database dump complete
--

