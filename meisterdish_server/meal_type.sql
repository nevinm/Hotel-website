--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: meisterdish_server_mealtype; Type: TABLE; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE TABLE meisterdish_server_mealtype (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    is_deleted boolean NOT NULL,
    is_hidden boolean NOT NULL
);


ALTER TABLE public.meisterdish_server_mealtype OWNER TO umeisterdish;

--
-- Name: meisterdish_server_mealtype_id_seq; Type: SEQUENCE; Schema: public; Owner: umeisterdish
--

CREATE SEQUENCE meisterdish_server_mealtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meisterdish_server_mealtype_id_seq OWNER TO umeisterdish;

--
-- Name: meisterdish_server_mealtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: umeisterdish
--

ALTER SEQUENCE meisterdish_server_mealtype_id_seq OWNED BY meisterdish_server_mealtype.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_mealtype ALTER COLUMN id SET DEFAULT nextval('meisterdish_server_mealtype_id_seq'::regclass);


--
-- Data for Name: meisterdish_server_mealtype; Type: TABLE DATA; Schema: public; Owner: umeisterdish
--

COPY meisterdish_server_mealtype (id, name, is_deleted, is_hidden) FROM stdin;
1	Vegan	f	f
2	Vegetarian	f	f
3	Pescatarian	f	f
4	Gluten-Free	f	f
5	Nut-Free	f	f
6	Dairy-Free	f	f
\.


--
-- Name: meisterdish_server_mealtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: umeisterdish
--

SELECT pg_catalog.setval('meisterdish_server_mealtype_id_seq', 6, true);


--
-- Name: meisterdish_server_mealtype_pkey; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--

ALTER TABLE ONLY meisterdish_server_mealtype
    ADD CONSTRAINT meisterdish_server_mealtype_pkey PRIMARY KEY (id);


--
-- Name: meisterdish_server_mealtype_is_deleted_1a93f1fcda566395_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_mealtype_is_deleted_1a93f1fcda566395_uniq ON meisterdish_server_mealtype USING btree (is_deleted);


--
-- Name: meisterdish_server_mealtype_is_hidden_6d9eb274aed8df59_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_mealtype_is_hidden_6d9eb274aed8df59_uniq ON meisterdish_server_mealtype USING btree (is_hidden);


--
-- Name: meisterdish_server_mealtype_name_38a5e8b591451b32_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_mealtype_name_38a5e8b591451b32_uniq ON meisterdish_server_mealtype USING btree (name);


--
-- PostgreSQL database dump complete
--

