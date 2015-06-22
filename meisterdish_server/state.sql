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
-- Name: meisterdish_server_state; Type: TABLE; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE TABLE meisterdish_server_state (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    state_code character varying(3) NOT NULL,
    country_id character varying(3) NOT NULL
);


ALTER TABLE public.meisterdish_server_state OWNER TO umeisterdish;

--
-- Name: meisterdish_server_state_id_seq; Type: SEQUENCE; Schema: public; Owner: umeisterdish
--

CREATE SEQUENCE meisterdish_server_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meisterdish_server_state_id_seq OWNER TO umeisterdish;

--
-- Name: meisterdish_server_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: umeisterdish
--

ALTER SEQUENCE meisterdish_server_state_id_seq OWNED BY meisterdish_server_state.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_state ALTER COLUMN id SET DEFAULT nextval('meisterdish_server_state_id_seq'::regclass);


--
-- Data for Name: meisterdish_server_state; Type: TABLE DATA; Schema: public; Owner: umeisterdish
--

COPY meisterdish_server_state (id, name, state_code, country_id) FROM stdin;
51	Alaska	AK	US
52	Alabama	AL	US
53	Arkansas	AR	US
54	Arizona	AZ	US
55	California	CA	US
56	Colorado	CO	US
57	Connecticut	CT	US
58	District of Columbia	DC	US
59	Delaware	DE	US
60	Florida	FL	US
61	Georgia	GA	US
62	Hawaii	HI	US
63	Iowa	IA	US
64	Idaho	ID	US
65	Illinois	IL	US
66	Indiana	IN	US
67	Kansas	KS	US
68	Kentucky	KY	US
69	Louisiana	LA	US
70	Massachusetts	MA	US
71	Maryland	MD	US
72	Maine	ME	US
73	Michigan	MI	US
74	Minnesota	MN	US
75	Missouri	MO	US
76	Mississippi	MS	US
77	Montana	MT	US
78	North Carolina	NC	US
79	North Dakota	ND	US
80	Nebraska	NE	US
81	New Hampshire	NH	US
82	New Jersey	NJ	US
83	New Mexico	NM	US
84	Nevada	NV	US
85	New York	NY	US
86	Ohio	OH	US
87	Oklahoma	OK	US
88	Oregon	OR	US
89	Pennsylvania	PA	US
90	Rhode Island	RI	US
91	South Carolina	SC	US
92	South Dakota	SD	US
93	Tennessee	TN	US
94	Texas	TX	US
95	Utah	UT	US
96	Virginia	VA	US
97	Vermont	VT	US
98	Washington	WA	US
99	Wisconsin	WI	US
100	West Virginia	WV	US
101	Wyoming	WY	US
\.


--
-- Name: meisterdish_server_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: umeisterdish
--

SELECT pg_catalog.setval('meisterdish_server_state_id_seq', 101, true);


--
-- Name: meisterdish_server_state_pkey; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--

ALTER TABLE ONLY meisterdish_server_state
    ADD CONSTRAINT meisterdish_server_state_pkey PRIMARY KEY (id);


--
-- Name: meisterdish_server_state_state_code_key; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--

ALTER TABLE ONLY meisterdish_server_state
    ADD CONSTRAINT meisterdish_server_state_state_code_key UNIQUE (state_code);


--
-- Name: meisterdish_server_state_93bfec8a; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_state_93bfec8a ON meisterdish_server_state USING btree (country_id);


--
-- Name: meisterdish_server_state_country_id; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_state_country_id ON meisterdish_server_state USING btree (country_id);


--
-- Name: meisterdish_server_state_country_id_like; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_state_country_id_like ON meisterdish_server_state USING btree (country_id varchar_pattern_ops);


--
-- Name: meisterdish_server_state_name_aaed0b40eab8a8f_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_state_name_aaed0b40eab8a8f_uniq ON meisterdish_server_state USING btree (name);


--
-- Name: meisterdish_server_state_state_code_4e4931fd370bcb13_like; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_state_state_code_4e4931fd370bcb13_like ON meisterdish_server_state USING btree (state_code varchar_pattern_ops);


--
-- Name: meisterdish_server_state_state_code_like; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_state_state_code_like ON meisterdish_server_state USING btree (state_code varchar_pattern_ops);


--
-- Name: country_id_refs_country_code_257b4750; Type: FK CONSTRAINT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_state
    ADD CONSTRAINT country_id_refs_country_code_257b4750 FOREIGN KEY (country_id) REFERENCES meisterdish_server_country(country_code) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meisterdish_server_sta_country_id_17b7df63c362dad4_fk_meisterdi; Type: FK CONSTRAINT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_state
    ADD CONSTRAINT meisterdish_server_sta_country_id_17b7df63c362dad4_fk_meisterdi FOREIGN KEY (country_id) REFERENCES meisterdish_server_country(country_code) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

