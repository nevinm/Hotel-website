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
-- Name: meisterdish_server_meal; Type: TABLE; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE TABLE meisterdish_server_meal (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    preparation_time character varying(30),
    pre_requisites text,
    price double precision NOT NULL,
    tax double precision NOT NULL,
    available boolean NOT NULL,
    category_id integer,
    is_deleted boolean NOT NULL,
    finished_preparation text,
    saved_time character varying(30),
    tips_and_tricks text,
    user_to_do text,
    main_image_id integer,
    ingredients text,
    chef_id integer,
    chef_comments text,
    tips_id integer,
    ingredients_image_id integer,
    pre_requisites_image_id integer,
    allergy_notice text,
    nutrients text,
    sub character varying(50) NOT NULL
);


ALTER TABLE public.meisterdish_server_meal OWNER TO umeisterdish;

--
-- Name: meisterdish_server_meal_id_seq; Type: SEQUENCE; Schema: public; Owner: umeisterdish
--

CREATE SEQUENCE meisterdish_server_meal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meisterdish_server_meal_id_seq OWNER TO umeisterdish;

--
-- Name: meisterdish_server_meal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: umeisterdish
--

ALTER SEQUENCE meisterdish_server_meal_id_seq OWNED BY meisterdish_server_meal.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_meal ALTER COLUMN id SET DEFAULT nextval('meisterdish_server_meal_id_seq'::regclass);


--
-- Data for Name: meisterdish_server_meal; Type: TABLE DATA; Schema: public; Owner: umeisterdish
--

COPY meisterdish_server_meal (id, name, description, preparation_time, pre_requisites, price, tax, available, category_id, is_deleted, finished_preparation, saved_time, tips_and_tricks, user_to_do, main_image_id, ingredients, chef_id, chef_comments, tips_id, ingredients_image_id, pre_requisites_image_id, allergy_notice, nutrients, sub) FROM stdin;
49	Soya Beans	SOya beans curry	23	["Utensils", "more Utensils"]	23	4	t	5	t	["Fork it"]	4	\N	["Fire em up"]	\N	["BUn", "Tomato"]	\N	\N	\N	\N	\N	\N	[{"dailyValue": "5", "perServing": "4", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "6", "servingValue": "54", "nutrientsName": "Subat"}]}, {"dailyValue": "54", "perServing": "13", "mainNutrient": "Fat44", "subNutrients": []}]	
54	Chicken Chukka	Chicken pieces are marinated in a sweet chilli sauce mixture, deep fried and then cooked in medium flame until done			200	2	t	5	t			\N		149		\N	spicy	\N	\N	\N			
47	Burger	Burger is good	4	["Knife", "Utensils."]	3	4	t	5	t	["Utensils are ready."]	4	\N	["Cook well", "Rinse well"]	154	["Totamto", "Potato"]	\N	\N	\N	\N	\N	\N	[{"dailyValue": "6", "perServing": "5", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "undefined", "servingValue": "5", "nutrientsName": "Subfat"}]}, {"dailyValue": "6", "perServing": "5", "mainNutrient": "Fat", "subNutrients": []}]	Farm Burger, Cutlet, Tomato.
52	Cheese Burger	Cheese Burgerdescirption	4	["Utensiles", "More Utensiles"]	4	5	t	5	t	["Kinives", "Dagger"]	5	\N	["Cut ", "Cut some more"]	153	["Tomato", "Tomato", "Potato"]	\N	\N	\N	\N	\N	\N	[{"dailyValue": "6", "perServing": "5", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "5", "servingValue": "24", "nutrientsName": "Subfat"}]}, {"dailyValue": "5", "perServing": "14", "mainNutrient": "Subtfat", "subNutrients": []}]	Chicken, Breast, Herbs
51	Dry Chicken	Dry chicken curry	23	["Utensils", "more Utensils"]	23	4	t	5	t	["Fork it"]	4	\N	["Fire em up"]	155	["BUn", "Tomato"]	\N	\N	\N	\N	\N	\N	[{"dailyValue": "5", "perServing": "4", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "6", "servingValue": "54", "nutrientsName": "Subat"}]}, {"dailyValue": "54", "perServing": "13", "mainNutrient": "Fat44", "subNutrients": []}, {"dailyValue": "4", "perServing": "3", "mainNutrient": "Fat66", "subNutrients": []}]	Chop, Pan Seared, Pork
48	Shrimp	Burger is good	4	["Knife", "Utensils."]	3	4	t	5	f	["Utensils are ready."]	4	\N	["Cook well", "Rinse well"]	168	["Totamto", "Potato"]	21	David is awesome.	\N	147	148	\N	[{"dailyValue": "6", "perServing": "5", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "6", "servingValue": "5", "nutrientsName": "SubFat"}]}, {"dailyValue": "6", "perServing": "5", "mainNutrient": "Fat", "subNutrients": []}]	Shrimp Moist, Shelled, Masala.
35	Spice Mushroom Rice	Mushrooms and Chinese 5 spice powder together make this rice very traditional fare.\n<> This dish is a delicate blend of flavours and textures that may not appeal to all, but it's a "must" for those who like to experiment beyond the conventional Chinese fried rice.			5	2	t	5	f			\N		169		\N		\N	\N	\N			Mushroom Peppered And Rice
25	Chicken Breast	Chicken Breast is a yummy meal.	10 mins		20	5	t	5	f		20 mins	\N		170		23	This is a comment fdrom chef	\N	172	22	Notice :!!!		Chicken Breast, Boiled.
37	Soya Beans	SOya beans curry	23	["Utensils", "more Utensils"]	23	4	t	5	f	["Fork it"]	4	\N	["Fire em up"]	174	["BUn", "Tomato"]	\N		\N	115	79		[{"dailyValue": "5", "perServing": "4", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "6", "servingValue": "54", "nutrientsName": "Subat"}]}, {"dailyValue": "54", "perServing": "13", "mainNutrient": "Fat44", "subNutrients": []}]	Soya Chunk, Cocnut Milk
26	Pan Seared Pork Chop	Burger Desc2	5	["Knife", "Dagger", "Dagger", "Dagger"]	14	52	t	5	f	["Cutting knife", "Strecthing"]	4	\N	["Cut", "Chop"]	164	["Tomato", "Potato"]	\N		\N	71	70		[{"dailyValue": "6", "perServing": "5", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "6", "servingValue": "5", "nutrientsName": "subfat"}]}, {"dailyValue": "8", "perServing": "8", "mainNutrient": "subfat", "subNutrients": []}]	Salad, Green.
38	Tomato Chicko	Steak description	4	["Utensiles"]	4	5	t	5	f	["Fork it"]	3	\N	["Chop it"]	160	["Tomatos", "Capochina"]	\N		\N	85	84		[{"dailyValue": "35", "perServing": "3", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "43", "servingValue": "23", "nutrientsName": "Subfat"}]}]	Tomato Chicko, Ginger, Brinjal, Soup , Oil
55	Alpharm	sample meal	20	["kitchen"]	100	2	t	68	t	["nothing"]	12	\N	["nothing"]	\N	["pepper"]	\N	Good vetu	\N	\N	\N		[{"dailyValue": "20", "perServing": "100g", "mainNutrient": "Vitamin A", "subNutrients": []}]	Sample Meal
36	Gnochi	Mav descritpon	42	["Knife", "Dagger"]	34	55	t	68	f	["Utensiles", "More utensils"]	12	\N	["Fun", "More fun"]	161	["Tomato", "Potato"]	\N		\N	75	74		[{"dailyValue": "5", "perServing": "32", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "3", "servingValue": "2", "nutrientsName": "Subfat"}]}, {"dailyValue": "13", "perServing": "4", "mainNutrient": "Calories", "subNutrients": []}]	Gnochi Ingredients
44	Herb Crusted Chicken Breast	Burger is good	4	["Knife", "Utensils."]	30	4	t	5	f	["Utensils are ready."]	4	\N	["Cook well", "Rinse well"]	162	["Totamto", "Potato"]	\N	David aweosme	\N	92	91	\N	[{"dailyValue": "6", "perServing": "5", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "2", "servingValue": "5", "nutrientsName": "Subfat"}]}, {"dailyValue": "6", "perServing": "5", "mainNutrient": "Fat", "subNutrients": []}]	Herb Crusted, Chicken, Masala.
39	Salmon Farfalle	Yummy beaf steak	4	["Utensiles"]	4	5	t	5	f	["Fork it"]	3	\N	["Chop it"]	167	["Tomatos", "Capochina"]	\N	Halo ppl	\N	85	84		[{"dailyValue": "35", "perServing": "3", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "43", "servingValue": "23", "nutrientsName": "Subfat"}]}]	Salman, Rice, Fish
19	Lancaster Farm Beef Burger	Burger description	45		4	5	t	5	f	["KNife", "dagger"]	4	\N	["Cutting the onions", "Cutting the onions2"]	163		\N	Almuni	\N	\N	\N			Beef Burger, Buns
43	Pomegranate And Red Cabbage	Steak description	4	["Utensiles"]	4	5	t	68	f	["Fork it"]	3	\N	["Chop it"]	165	["Tomatos", "Capochina"]	25	Nasar	\N	85	117	\N	[{"dailyValue": "35", "perServing": "3", "mainNutrient": "Fat", "subNutrients": []}, {"dailyValue": "asd", "perServing": "asd", "mainNutrient": "asd", "subNutrients": []}, {"dailyValue": "asdd", "perServing": "asdd", "mainNutrient": "asdd", "subNutrients": []}, {"dailyValue": "asdd", "perServing": "asdd", "mainNutrient": "asdd", "subNutrients": []}]	Pomegrante, Cabbbage Green
50	Salad	Dry chicken curry	23	["Utensils", "more Utensils"]	23	4	t	5	f	["Fork it"]	4	\N	["Fire em up"]	166	["BUn", "Tomato"]	24	my comments	\N	\N	\N	\N	[{"dailyValue": "5", "perServing": "4", "mainNutrient": "Fat", "subNutrients": [{"dailyValue": "6", "servingValue": "54", "nutrientsName": "Subat"}]}, {"dailyValue": "54", "perServing": "13", "mainNutrient": "Fat44", "subNutrients": []}, {"dailyValue": "2", "perServing": "5", "mainNutrient": "Fat44Sub", "subNutrients": []}]	Pomegrenate And Dry Cabbage Plus Salad
\.


--
-- Name: meisterdish_server_meal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: umeisterdish
--

SELECT pg_catalog.setval('meisterdish_server_meal_id_seq', 55, true);


--
-- Name: meisterdish_server_meal_pkey; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--

ALTER TABLE ONLY meisterdish_server_meal
    ADD CONSTRAINT meisterdish_server_meal_pkey PRIMARY KEY (id);


--
-- Name: meisterdish_server_meal_36b62cbe; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_36b62cbe ON meisterdish_server_meal USING btree (main_image_id);


--
-- Name: meisterdish_server_meal_69967cec; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_69967cec ON meisterdish_server_meal USING btree (tips_id);


--
-- Name: meisterdish_server_meal_8a68dc3e; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_8a68dc3e ON meisterdish_server_meal USING btree (sub);


--
-- Name: meisterdish_server_meal_911697a0; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_911697a0 ON meisterdish_server_meal USING btree (pre_requisites_image_id);


--
-- Name: meisterdish_server_meal_available_7ffec5a3d6391f0b_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_available_7ffec5a3d6391f0b_uniq ON meisterdish_server_meal USING btree (available);


--
-- Name: meisterdish_server_meal_b583a629; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_b583a629 ON meisterdish_server_meal USING btree (category_id);


--
-- Name: meisterdish_server_meal_description_41c9bc7d9ed6c0fa_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_description_41c9bc7d9ed6c0fa_uniq ON meisterdish_server_meal USING btree (description);


--
-- Name: meisterdish_server_meal_e994f182; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_e994f182 ON meisterdish_server_meal USING btree (ingredients_image_id);


--
-- Name: meisterdish_server_meal_f30d12e7; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_f30d12e7 ON meisterdish_server_meal USING btree (chef_id);


--
-- Name: meisterdish_server_meal_is_deleted_590f1707251e2c77_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_is_deleted_590f1707251e2c77_uniq ON meisterdish_server_meal USING btree (is_deleted);


--
-- Name: meisterdish_server_meal_name_4675fa8b1d437326_uniq; Type: INDEX; Schema: public; Owner: umeisterdish; Tablespace: 
--

CREATE INDEX meisterdish_server_meal_name_4675fa8b1d437326_uniq ON meisterdish_server_meal USING btree (name);


--
-- Name: meisterdish_server_me_pre_requisites_image_id_3e80aaf49205de1e_; Type: FK CONSTRAINT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_meal
    ADD CONSTRAINT meisterdish_server_me_pre_requisites_image_id_3e80aaf49205de1e_ FOREIGN KEY (pre_requisites_image_id) REFERENCES meisterdish_server_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meisterdish_server_meal_category_id_19f288fe4bfc29b0_fk_meister; Type: FK CONSTRAINT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_meal
    ADD CONSTRAINT meisterdish_server_meal_category_id_19f288fe4bfc29b0_fk_meister FOREIGN KEY (category_id) REFERENCES meisterdish_server_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meisterdish_server_meal_chef_id_21e254c323a1d788_fk_meisterdish; Type: FK CONSTRAINT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_meal
    ADD CONSTRAINT meisterdish_server_meal_chef_id_21e254c323a1d788_fk_meisterdish FOREIGN KEY (chef_id) REFERENCES meisterdish_server_chef(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meisterdish_server_meal_ingredients_image_id_54daab5576b43b9f_f; Type: FK CONSTRAINT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_meal
    ADD CONSTRAINT meisterdish_server_meal_ingredients_image_id_54daab5576b43b9f_f FOREIGN KEY (ingredients_image_id) REFERENCES meisterdish_server_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meisterdish_server_meal_main_image_id_5302a08e26ce4ff1_fk_meist; Type: FK CONSTRAINT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_meal
    ADD CONSTRAINT meisterdish_server_meal_main_image_id_5302a08e26ce4ff1_fk_meist FOREIGN KEY (main_image_id) REFERENCES meisterdish_server_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: meisterdish_server_meal_tips_id_336b4acb1fbbfa7e_fk_meisterdish; Type: FK CONSTRAINT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_meal
    ADD CONSTRAINT meisterdish_server_meal_tips_id_336b4acb1fbbfa7e_fk_meisterdish FOREIGN KEY (tips_id) REFERENCES meisterdish_server_tips(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

