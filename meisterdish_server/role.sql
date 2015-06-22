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
-- Name: meisterdish_server_role; Type: TABLE; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE TABLE meisterdish_server_role (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.meisterdish_server_role OWNER TO umeisterdish;

--
-- Name: meisterdish_server_role_id_seq; Type: SEQUENCE; Schema: public; Owner: umeisterdish
--

CREATE SEQUENCE meisterdish_server_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meisterdish_server_role_id_seq OWNER TO umeisterdish;

--
-- Name: meisterdish_server_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: umeisterdish
--

ALTER SEQUENCE meisterdish_server_role_id_seq OWNED BY meisterdish_server_role.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_role ALTER COLUMN id SET DEFAULT nextval('meisterdish_server_role_id_seq'::regclass);


--
-- Data for Name: meisterdish_server_role; Type: TABLE DATA; Schema: public; Owner: umeisterdish
--

COPY meisterdish_server_role (id, name) FROM stdin;
1	Admin
2	User
3	Guest
4	Kitchen
5	Delivery
\.


--
-- Name: meisterdish_server_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: umeisterdish
--

SELECT pg_catalog.setval('meisterdish_server_role_id_seq', 5, true);


--
-- Name: meisterdish_server_role_pkey; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--

ALTER TABLE ONLY meisterdish_server_role
    ADD CONSTRAINT meisterdish_server_role_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

