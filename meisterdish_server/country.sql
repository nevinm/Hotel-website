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
-- Name: meisterdish_server_country; Type: TABLE; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE TABLE meisterdish_server_country (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    country_code character varying(3) NOT NULL
);


ALTER TABLE public.meisterdish_server_country OWNER TO umeisterdish;

--
-- Name: meisterdish_server_country_id_seq; Type: SEQUENCE; Schema: public; Owner: umeisterdish
--

CREATE SEQUENCE meisterdish_server_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meisterdish_server_country_id_seq OWNER TO umeisterdish;

--
-- Name: meisterdish_server_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: umeisterdish
--

ALTER SEQUENCE meisterdish_server_country_id_seq OWNED BY meisterdish_server_country.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_country ALTER COLUMN id SET DEFAULT nextval('meisterdish_server_country_id_seq'::regclass);


--
-- Data for Name: meisterdish_server_country; Type: TABLE DATA; Schema: public; Owner: umeisterdish
--

COPY meisterdish_server_country (id, name, country_code) FROM stdin;
1	USA	US
\.


--
-- Name: meisterdish_server_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: umeisterdish
--

SELECT pg_catalog.setval('meisterdish_server_country_id_seq', 1, true);


--
-- Name: meisterdish_server_country_country_code_key; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--

ALTER TABLE ONLY meisterdish_server_country
    ADD CONSTRAINT meisterdish_server_country_country_code_key UNIQUE (country_code);


--
-- Name: meisterdish_server_country_pkey; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--

ALTER TABLE ONLY meisterdish_server_country
    ADD CONSTRAINT meisterdish_server_country_pkey PRIMARY KEY (id);


--
-- Name: meisterdish_server_country_country_code_47117593c6bbed9_like; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_country_country_code_47117593c6bbed9_like ON meisterdish_server_country USING btree (country_code varchar_pattern_ops);


--
-- Name: meisterdish_server_country_country_code_like; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_country_country_code_like ON meisterdish_server_country USING btree (country_code varchar_pattern_ops);


--
-- Name: meisterdish_server_country_name_59ab8d5db09fa38c_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_country_name_59ab8d5db09fa38c_uniq ON meisterdish_server_country USING btree (name);


--
-- PostgreSQL database dump complete
--

