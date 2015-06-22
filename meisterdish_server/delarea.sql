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
-- Name: meisterdish_server_deliveryarea; Type: TABLE; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE TABLE meisterdish_server_deliveryarea (
    id integer NOT NULL,
    zip character varying(10) NOT NULL
);


ALTER TABLE public.meisterdish_server_deliveryarea OWNER TO umeisterdish;

--
-- Name: meisterdish_server_deliveryarea_id_seq; Type: SEQUENCE; Schema: public; Owner: umeisterdish
--

CREATE SEQUENCE meisterdish_server_deliveryarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meisterdish_server_deliveryarea_id_seq OWNER TO umeisterdish;

--
-- Name: meisterdish_server_deliveryarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: umeisterdish
--

ALTER SEQUENCE meisterdish_server_deliveryarea_id_seq OWNED BY meisterdish_server_deliveryarea.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_deliveryarea ALTER COLUMN id SET DEFAULT nextval('meisterdish_server_deliveryarea_id_seq'::regclass);


--
-- Data for Name: meisterdish_server_deliveryarea; Type: TABLE DATA; Schema: public; Owner: umeisterdish
--

COPY meisterdish_server_deliveryarea (id, zip) FROM stdin;
47	10022
50	10029
49	10028
48	10021
46	10065
44	10075
45	10128
\.


--
-- Name: meisterdish_server_deliveryarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: umeisterdish
--

SELECT pg_catalog.setval('meisterdish_server_deliveryarea_id_seq', 50, true);


--
-- Name: meisterdish_server_deliveryarea_pkey; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--

ALTER TABLE ONLY meisterdish_server_deliveryarea
    ADD CONSTRAINT meisterdish_server_deliveryarea_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

