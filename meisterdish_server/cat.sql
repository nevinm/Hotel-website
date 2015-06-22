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
-- Name: meisterdish_server_category; Type: TABLE; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE TABLE meisterdish_server_category (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    is_deleted boolean NOT NULL,
    is_hidden boolean NOT NULL
);


ALTER TABLE public.meisterdish_server_category OWNER TO umeisterdish;

--
-- Name: meisterdish_server_category_id_seq; Type: SEQUENCE; Schema: public; Owner: umeisterdish
--

CREATE SEQUENCE meisterdish_server_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meisterdish_server_category_id_seq OWNER TO umeisterdish;

--
-- Name: meisterdish_server_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: umeisterdish
--

ALTER SEQUENCE meisterdish_server_category_id_seq OWNED BY meisterdish_server_category.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_category ALTER COLUMN id SET DEFAULT nextval('meisterdish_server_category_id_seq'::regclass);


--
-- Data for Name: meisterdish_server_category; Type: TABLE DATA; Schema: public; Owner: umeisterdish
--

COPY meisterdish_server_category (id, name, is_deleted, is_hidden) FROM stdin;
68	PASTAS	f	f
7	SALADS	f	f
71	TEST TEST	t	f
72	new	t	f
73	test	t	f
5	MAINS	f	f
\.


--
-- Name: meisterdish_server_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: umeisterdish
--

SELECT pg_catalog.setval('meisterdish_server_category_id_seq', 73, true);


--
-- Name: meisterdish_server_category_pkey; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--

ALTER TABLE ONLY meisterdish_server_category
    ADD CONSTRAINT meisterdish_server_category_pkey PRIMARY KEY (id);


--
-- Name: meisterdish_server_category_is_deleted_7043434106f78088_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_category_is_deleted_7043434106f78088_uniq ON meisterdish_server_category USING btree (is_deleted);


--
-- Name: meisterdish_server_category_is_hidden_37eddc32bcdf512_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_category_is_hidden_37eddc32bcdf512_uniq ON meisterdish_server_category USING btree (is_hidden);


--
-- Name: meisterdish_server_category_name_15a339e11d6f80eb_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_category_name_15a339e11d6f80eb_uniq ON meisterdish_server_category USING btree (name);


--
-- PostgreSQL database dump complete
--

