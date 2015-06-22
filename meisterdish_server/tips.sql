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
-- Name: meisterdish_server_tips; Type: TABLE; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE TABLE meisterdish_server_tips (
    id integer NOT NULL,
    title character varying(1024),
    description text NOT NULL,
    video_url character varying(1024),
    image_id integer
);


ALTER TABLE public.meisterdish_server_tips OWNER TO umeisterdish;

--
-- Name: meisterdish_server_tips_id_seq; Type: SEQUENCE; Schema: public; Owner: umeisterdish
--

CREATE SEQUENCE meisterdish_server_tips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meisterdish_server_tips_id_seq OWNER TO umeisterdish;

--
-- Name: meisterdish_server_tips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: umeisterdish
--

ALTER SEQUENCE meisterdish_server_tips_id_seq OWNED BY meisterdish_server_tips.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_tips ALTER COLUMN id SET DEFAULT nextval('meisterdish_server_tips_id_seq'::regclass);


--
-- Data for Name: meisterdish_server_tips; Type: TABLE DATA; Schema: public; Owner: umeisterdish
--

COPY meisterdish_server_tips (id, title, description, video_url, image_id) FROM stdin;
1	Tips - Link1	[]	Link	\N
3	Tips - Link1	[]	Link	\N
4	Tips - Link2	[]	2Link	\N
5	Tips - Link1	[]	Link	\N
6	Tips - Link2	[]	2Link	\N
7	Tips - Link1	[]	Link	\N
8	Tips - Link2	[]	2Link	\N
9	Tips - Link1	[]	Link	\N
10	Tips - Link2	[]	2Link	\N
11	Tips - Link1	[]	Link	\N
12	Tips - Link2	[]	2Link	\N
13	Tips - Link1	[]	Link	\N
14	Tips - Link2	[]	2Link	\N
15	Tips - Link1	[]	Link	\N
16	Tips - Link2	[]	2Link	\N
17	Tips - Link1	[]	Link	\N
18	Tips - Link2	[]	2Link	\N
19	Tips - Link1	[]	Link	\N
20	Tips - Link2	[]	2Link	\N
2	Tips - Link2	[]	2Link	\N
88	Avacado Cutting	[]	Link	\N
126	Dasdasd	[]	sadas	\N
128	Dasdasd	[]	sadas	\N
31	Tips - Link1	[]	Link	\N
32	Tips - Link2	[]	2Link	\N
90	Link1 Tips	[]	Link2	\N
91	Link12 Tips	[]	Link1	\N
33	Tips - Link1	[]	Link	\N
34	Tips - Link2	[]	2Link	\N
35	Tips - Link1	[]	Link	\N
36	Tips - Link2	[]	2Link	\N
37	Tips - Link1	[]	Link	\N
38	Tips - Link2	[]	2Link	\N
39	Tips - Link1	[]	Link	\N
40	Tips - Link2	[]	2Link	\N
41	Tips - Link1	[]	Link	\N
42	Tips - Link2	[]	2Link	\N
43	Tips - Link1	[]	Link	\N
44	Tips - Link2	[]	2Link	\N
45	Tips - Link1	[]	Link	\N
46	Tips - Link2	[]	2Link	\N
47	Tips - Link1	[]	Link	\N
48	Tips - Link2	[]	2Link	\N
49	Tips - Link1	[]	Link	\N
50	Tips - Link2	[]	2Link	\N
51	Tips - Link1	[]	Link	\N
52	Tips - Link2	[]	2Link	\N
53	Tips - Link1	[]	Link	\N
54	Tips - Link2	[]	2Link	\N
55	Tips - Link1	[]	Link	\N
56	Tips - Link2	[]	2Link	\N
57	Tips - Link1	[]	Link	\N
58	Tips - Link2	[]	2Link	\N
59	Tips - Link1	[]	Link	\N
60	Tips - Link2	[]	2Link	\N
61	Tips - Link1	[]	Link	\N
62	Tips - Link2	[]	2Link	\N
63	Tips - Link1	[]	Link	\N
64	Tips - Link2	[]	2Link	\N
65	Tips - Link1	[]	Link	\N
66	Tips - Link2	[]	2Link	\N
67	Tips - Link1	[]	Link	\N
68	Tips - Link2	[]	2Link	\N
69	Tips - Link1	[]	Link	\N
70	Tips - Link2	[]	2Link	\N
71	Tips - Link1	[]	Link	\N
72	Tips - Link2	[]	2Link	\N
73	Tips - Link1	[]	Link	\N
74	Tips - Link2	[]	2Link	\N
75	Tips - Link1	[]	Link	\N
76	Tips - Link2	[]	2Link	\N
77	Tips - Link1	[]	Link	\N
78	Tips - Link2	[]	2Link	\N
79	Tips - Link1	[]	Link	\N
80	Tips - Link2	[]	2Link	\N
81	Avacado 1	[]	Link1	\N
82	Avacado 1	[]	Link1	\N
103	Tes Test	[]	test.test.com	\N
107	Avacado Cutting	["LinkDEscriptio"]	Link	\N
108	Avacado Cutting3	["Link3DEscriptio"]	Lin3	\N
104	444444	[]	Link	\N
129	444444	[]	Link	\N
111	Avacado Cutting	["Link description"]	Link	\N
112	Avacado Cutting3	["Link 3description"]	Lin3	\N
185	How To Safely De-Stone An Avocado	["Brioche Bun(2)", "Lancaster farm beef,ground", "Mustad Crest, picked", "Avocado", "Tomato", "Gruyere cheese , sliced"]	https://www.youtube.com/embed/GETRVzxihhM?list=PLLALQuK1NDrgp7mRDuUT3NI70hoX2WIhS	\N
186	How To Maintain You Knife	["Avocado", "Tomato", "Lemon , Halved", "Gralic, sliced", "Red onion , sliced"]	https://www.youtube.com/embed/7WAZBGcwdn8	\N
183	Qweqweqwe	[]	Link1	\N
184	Qweqweqwe	["asd", "asdasd"]	Link1	\N
83	Avacado 1	[]	Link1	\N
84	Avacado 1	[]	Link1	\N
85	Avacado 1	[]	Link1	\N
86	Avacado 1	[]	Link1	\N
87	Avacado 1	[]	Link1	\N
136	Asdasd	[]	asdsa	\N
187	Egg Scramble	["PRetty cool"]	https://www.youtube.com/watch?v=CXycnnBnAr8	\N
109	Avacado Cutting	["Link description"]	Link	\N
114	Avacado Cutting3	[]	Lin3	\N
92	Link1 Tips	[]	Link2	\N
93	Link12 Tips	[]	Link1	\N
94	Link1 Tips	[]	Link2	\N
95	Link12 Tips	[]	Link1	\N
135	Link12 Tips	[]	Link1	\N
\.


--
-- Name: meisterdish_server_tips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: umeisterdish
--

SELECT pg_catalog.setval('meisterdish_server_tips_id_seq', 187, true);


--
-- Name: meisterdish_server_tips_pkey; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--

ALTER TABLE ONLY meisterdish_server_tips
    ADD CONSTRAINT meisterdish_server_tips_pkey PRIMARY KEY (id);


--
-- Name: meisterdish_server_tips_f33175e6; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_tips_f33175e6 ON meisterdish_server_tips USING btree (image_id);


--
-- Name: meisterdish_server_tips_image_id_93c7238a85b669b_fk_meisterdish; Type: FK CONSTRAINT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_tips
    ADD CONSTRAINT meisterdish_server_tips_image_id_93c7238a85b669b_fk_meisterdish FOREIGN KEY (image_id) REFERENCES meisterdish_server_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

