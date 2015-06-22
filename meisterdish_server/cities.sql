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
-- Name: meisterdish_server_city; Type: TABLE; Schema: public; Owner: umeisterdish; Tablespace: 
--




ALTER SEQUENCE meisterdish_server_city_id_seq OWNED BY meisterdish_server_city.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: umeisterdish
--

ALTER TABLE ONLY meisterdish_server_city ALTER COLUMN id SET DEFAULT nextval('meisterdish_server_city_id_seq'::regclass);


--
-- Data for Name: meisterdish_server_city; Type: TABLE DATA; Schema: public; Owner: umeisterdish
--

COPY meisterdish_server_city (id, name, state_id) FROM stdin;
1	Aaronsburg	PA
2	Abbeville	AL
3	Abbeville	GA
4	Abbeville	LA
5	Abbeville	MS
6	Abbeville	SC
7	Abbot	ME
8	Abbotsford	WI
9	Abbott	TX
10	Abbottstown	PA
11	Abbyville	KS
12	Abell	MD
13	Abercrombie	ND
14	Aberdeen	ID
15	Aberdeen	KY
16	Aberdeen	MD
17	Aberdeen	MS
18	Aberdeen	NC
19	Aberdeen	OH
20	Aberdeen	SD
21	Aberdeen	WA
22	Aberdeen Proving Ground	MD
23	Abernant	AL
24	Abernathy	TX
25	Abie	NE
26	Abilene	KS
27	Abilene	TX
28	Abingdon	IL
29	Abingdon	MD
30	Abingdon	VA
31	Abington	CT
32	Abington	MA
33	Abington	PA
34	Abiquiu	NM
35	Abita Springs	LA
36	Abrams	WI
37	Absaraka	ND
38	Absarokee	MT
39	Absecon	NJ
40	Acampo	CA
41	Accident	MD
42	Accokeek	MD
43	Accomac	VA
44	Accord	MA
45	Accord	NY
46	Accoville	WV
47	Ace	TX
48	Achille	OK
49	Achilles	VA
50	Ackerly	TX
51	Ackerman	MS
52	Ackermanville	PA
53	Ackley	IA
54	Ackworth	IA
55	Acme	LA
56	Acme	MI
57	Acme	PA
58	Acme	WA
59	Acosta	PA
60	Acra	NY
61	Acton	CA
62	Acton	MA
63	Acton	ME
64	Acton	MT
65	Acushnet	MA
66	Acworth	GA
67	Acworth	NH
68	Ada	MI
69	Ada	MN
70	Ada	OH
71	Ada	OK
72	Adah	PA
73	Adair	IA
74	Adair	IL
75	Adair	OK
76	Adairsville	GA
77	Adairville	KY
78	Adak	AK
79	Adamant	VT
80	Adams	KY
81	Adams	MA
82	Adams	MN
83	Adams	ND
84	Adams	NE
85	Adams	NY
86	Adams	OK
87	Adams	OR
88	Adams	TN
89	Adams	WI
90	Adams Basin	NY
91	Adams Center	NY
92	Adams Run	SC
93	Adamsburg	PA
94	Adamstown	MD
95	Adamstown	PA
96	Adamsville	AL
97	Adamsville	OH
98	Adamsville	PA
99	Adamsville	RI
100	Adamsville	TN
101	Addieville	IL
102	Addington	OK
103	Addis	LA
104	Addison	AL
105	Addison	IL
106	Addison	ME
107	Addison	MI
108	Addison	NY
109	Addison	PA
110	Addison	TX
111	Addy	WA
112	Addyston	OH
113	Adel	GA
114	Adel	IA
115	Adel	OR
116	Adelanto	CA
117	Adell	WI
118	Adelphi	OH
119	Adelphia	NJ
120	Adena	OH
121	Adger	AL
122	Adin	CA
123	Adirondack	NY
125	Adkins	TX
126	Admire	KS
127	Adna	WA
128	Adolph	MN
129	Adolphus	KY
130	Adona	AR
131	Adrian	GA
132	Adrian	MI
133	Adrian	MN
134	Adrian	MO
135	Adrian	OR
136	Adrian	PA
137	Adrian	TX
138	Adrian	WV
139	Advance	IN
140	Advance	MO
141	Advance	NC
142	Advent	WV
143	Afton	IA
144	Afton	MI
145	Afton	MN
146	Afton	NY
147	Afton	OK
148	Afton	TN
149	Afton	TX
150	Afton	VA
151	Afton	WI
152	Afton	WY
153	Agar	SD
154	Agate	CO
155	Agate	ND
156	Agawam	MA
157	Agency	IA
158	Agency	MO
159	Agenda	KS
160	Ages Brookside	KY
161	Agness	OR
162	Agoura Hills	CA
163	Agra	KS
164	Agra	OK
165	Agua Dulce	TX
168	Aguanga	CA
170	Aguila	AZ
171	Aguilar	CO
173	Ah Gwah Ching	MN
174	Ahmeek	MI
175	Ahoskie	NC
176	Ahsahka	ID
177	Ahwahnee	CA
179	Aiea	HI
180	Aiken	SC
181	Aiken	TX
182	Ailey	GA
183	Aimwell	LA
184	Ainsworth	IA
185	Ainsworth	NE
186	Airville	PA
187	Airway Heights	WA
188	Aitkin	MN
189	Ajo	AZ
190	Akaska	SD
191	Akeley	MN
192	Akers	LA
193	Akiachak	AK
194	Akiak	AK
195	Akin	IL
196	Akron	AL
197	Akron	CO
198	Akron	IA
199	Akron	IN
200	Akron	MI
201	Akron	NY
202	Akron	OH
203	Akron	PA
204	Akutan	AK
205	Alabaster	AL
206	Alachua	FL
207	Aladdin	WY
208	Alakanuk	AK
209	Alamance	NC
210	Alameda	CA
211	Alamo	CA
212	Alamo	GA
213	Alamo	IN
214	Alamo	ND
215	Alamo	NV
216	Alamo	TN
217	Alamo	TX
218	Alamogordo	NM
219	Alamosa	CO
220	Alanreed	TX
221	Alanson	MI
222	Alapaha	GA
223	Alba	MI
224	Alba	MO
225	Alba	PA
226	Alba	TX
227	Albany	CA
228	Albany	GA
229	Albany	IL
230	Albany	IN
231	Albany	KY
232	Albany	LA
233	Albany	MN
234	Albany	MO
235	Albany	NY
236	Albany	OH
237	Albany	OK
238	Albany	OR
239	Albany	TX
240	Albany	VT
241	Albany	WI
242	Albemarle	NC
243	Albers	IL
244	Albert	KS
245	Albert	OK
246	Albert City	IA
247	Albert Lea	MN
248	Alberta	AL
249	Alberta	MN
250	Alberta	VA
251	Alberton	MT
252	Albertson	NC
253	Albertson	NY
254	Albertville	AL
255	Albertville	MN
256	Albia	IA
257	Albin	WY
258	Albion	CA
259	Albion	IA
260	Albion	ID
261	Albion	IL
262	Albion	IN
263	Albion	ME
264	Albion	MI
265	Albion	NE
266	Albion	NY
267	Albion	OK
268	Albion	PA
269	Albion	RI
270	Albion	WA
271	Alborn	MN
272	Albright	WV
273	Albrightsville	PA
274	Albuquerque	NM
275	Alburgh	VT
276	Alburnett	IA
277	Alburtis	PA
278	Alcalde	NM
279	Alcester	SD
280	Alcoa	TN
281	Alcolu	SC
282	Alcova	WY
283	Alcove	NY
284	Alda	NE
285	Alden	IA
286	Alden	IL
287	Alden	KS
288	Alden	MI
289	Alden	MN
290	Alden	NY
291	Alder	MT
292	Alder Creek	NY
293	Alderpoint	CA
294	Alderson	OK
295	Alderson	WV
296	Aldie	VA
297	Aldrich	MN
298	Aldrich	MO
299	Aledo	IL
300	Aledo	TX
301	Aleknagik	AK
302	Aleppo	PA
303	Alex	OK
304	Alexander	AR
305	Alexander	IA
306	Alexander	IL
307	Alexander	KS
308	Alexander	NC
309	Alexander	ND
310	Alexander	NY
311	Alexander City	AL
312	Alexandria	AL
313	Alexandria	IN
314	Alexandria	KY
315	Alexandria	LA
316	Alexandria	MN
317	Alexandria	MO
318	Alexandria	NE
319	Alexandria	OH
320	Alexandria	PA
321	Alexandria	SD
322	Alexandria	TN
323	Alexandria	VA
324	Alexandria Bay	NY
325	Alexis	IL
326	Alexis	NC
327	Alford	FL
328	Alfred	ME
329	Alfred	NY
330	Alfred Station	NY
331	Alger	MI
332	Alger	OH
333	Algodones	NM
334	Algoma	MS
335	Algoma	WI
336	Algona	IA
337	Algonac	MI
338	Algonquin	IL
339	Alhambra	CA
340	Alhambra	IL
341	Alice	TX
342	Aliceville	AL
343	Alicia	AR
344	Alief	TX
345	Aline	OK
346	Aliquippa	PA
347	Aliso Viejo	CA
348	Alix	AR
349	Alkol	WV
350	Allakaket	AK
351	Allamuchy	NJ
352	Allardt	TN
353	Alledonia	OH
354	Alleene	AR
355	Allegan	MI
356	Allegany	NY
357	Allegany	OR
358	Alleghany	CA
359	Alleman	IA
360	Allen	KS
361	Allen	KY
362	Allen	MD
363	Allen	MI
364	Allen	NE
365	Allen	OK
366	Allen	SD
367	Allen	TX
368	Allen Junction	WV
369	Allen Park	MI
370	Allendale	IL
371	Allendale	MI
372	Allendale	MO
373	Allendale	NJ
374	Allendale	SC
375	Allenhurst	GA
376	Allenhurst	NJ
377	Allenport	PA
378	Allenspark	CO
379	Allensville	KY
380	Allensville	PA
381	Allenton	MI
382	Allenton	MO
383	Allenton	WI
384	Allentown	GA
385	Allentown	NJ
386	Allentown	NY
387	Allentown	PA
388	Allenwood	NJ
389	Allenwood	PA
390	Allerton	IA
391	Allerton	IL
392	Alleyton	TX
393	Allgood	AL
394	Alliance	NC
395	Alliance	NE
396	Alliance	OH
397	Alligator	MS
398	Allison	IA
399	Allison	PA
400	Allison	TX
401	Allison Park	PA
402	Allons	TN
403	Allouez	MI
404	Alloway	NJ
405	Alloy	WV
406	Allport	PA
407	Allred	TN
408	Allston	MA
409	Allyn	WA
410	Alma	AL
411	Alma	AR
412	Alma	CO
413	Alma	GA
414	Alma	IL
415	Alma	KS
416	Alma	MI
417	Alma	MO
418	Alma	NE
419	Alma	NY
420	Alma	WI
421	Alma	WV
422	Alma Center	WI
423	Almelund	MN
424	Almena	KS
425	Almena	WI
426	Almira	WA
427	Almo	ID
428	Almo	KY
429	Almond	NC
430	Almond	NY
431	Almond	WI
432	Almont	CO
433	Almont	MI
434	Almont	ND
435	Almyra	AR
436	Alna	ME
437	Alpaugh	CA
438	Alpena	AR
439	Alpena	MI
440	Alpena	SD
441	Alpha	IL
442	Alpha	KY
443	Alpha	MI
444	Alpha	MN
445	Alpha	OH
446	Alpharetta	GA
447	Alpine	AL
448	Alpine	AR
449	Alpine	AZ
450	Alpine	CA
451	Alpine	NJ
452	Alpine	NY
453	Alpine	TN
454	Alpine	TX
455	Alpine	UT
456	Alpine	WY
457	Alplaus	NY
458	Alsea	OR
459	Alsen	ND
460	Alsey	IL
461	Alsip	IL
462	Alstead	NH
463	Alston	GA
464	Alta	CA
465	Alta	IA
466	Alta	WY
467	Alta Vista	IA
468	Alta Vista	KS
469	Altadena	CA
470	Altair	TX
471	Altamahaw	NC
472	Altamont	IL
473	Altamont	KS
474	Altamont	MO
475	Altamont	NY
476	Altamont	TN
477	Altamont	UT
478	Altamonte Springs	FL
479	Altaville	CA
480	Altavista	VA
481	Altenburg	MO
482	Altha	FL
483	Altheimer	AR
484	Altmar	NY
485	Alto	GA
486	Alto	MI
487	Alto	NM
488	Alto	TX
489	Alto Pass	IL
490	Alton	AL
491	Alton	IA
492	Alton	IL
493	Alton	KS
494	Alton	MO
495	Alton	NH
496	Alton	NY
497	Alton	UT
498	Alton	VA
499	Alton Bay	NH
500	Altona	IL
501	Altona	NY
502	Altonah	UT
503	Altoona	AL
504	Altoona	FL
505	Altoona	IA
506	Altoona	KS
507	Altoona	PA
508	Altoona	WI
509	Altura	MN
510	Alturas	CA
511	Alturas	FL
512	Altus	AR
513	Altus	OK
514	Altus Afb	OK
515	Alum Bank	PA
516	Alum Bridge	WV
517	Alum Creek	WV
518	Alva	FL
519	Alva	OK
520	Alva	WY
521	Alvada	OH
522	Alvadore	OR
523	Alvarado	MN
524	Alvarado	TX
525	Alvaton	KY
526	Alverda	PA
527	Alverton	PA
528	Alvin	IL
529	Alvin	TX
530	Alviso	CA
531	Alvo	NE
532	Alvord	IA
533	Alvord	TX
534	Alvordton	OH
535	Alzada	MT
536	Ama	LA
537	Amado	AZ
538	Amador City	CA
539	Amagansett	NY
540	Amagon	AR
541	Amalia	NM
542	Amana	IA
543	Amanda	OH
544	Amanda Park	WA
545	Amargosa Valley	NV
546	Amarillo	TX
547	Amasa	MI
548	Amawalk	NY
549	Amazonia	MO
550	Amber	OK
551	Amberg	WI
552	Amberson	PA
553	Ambia	IN
554	Ambler	AK
555	Ambler	PA
556	Amboy	CA
557	Amboy	IL
558	Amboy	IN
559	Amboy	MN
560	Amboy	WA
561	Ambridge	PA
562	Ambrose	GA
563	Ambrose	ND
564	Amelia	LA
565	Amelia	NE
566	Amelia	OH
567	Amelia Court House	VA
568	Amenia	ND
569	Amenia	NY
570	American Canyon	CA
571	American Falls	ID
572	American Fork	UT
573	Americus	GA
574	Americus	KS
575	Amery	WI
576	Ames	IA
577	Ames	NE
578	Ames	OK
579	Amesbury	MA
580	Amesville	OH
581	Amherst	CO
582	Amherst	MA
583	Amherst	NE
584	Amherst	NH
585	Amherst	OH
586	Amherst	SD
587	Amherst	TX
588	Amherst	VA
589	Amherst	WI
590	Amherst Junction	WI
591	Amherstdale	WV
592	Amidon	ND
593	Amigo	WV
594	Amissville	VA
595	Amistad	NM
596	Amite	LA
597	Amity	AR
598	Amity	MO
599	Amity	OR
600	Amity	PA
601	Amityville	NY
602	Amlin	OH
603	Amma	WV
604	Ammon	VA
605	Amo	IN
606	Amonate	VA
607	Amoret	MO
608	Amorita	OK
609	Amory	MS
610	Amsterdam	MO
611	Amsterdam	NY
612	Amsterdam	OH
613	Amston	CT
614	Anabel	MO
615	Anacoco	LA
616	Anaconda	MT
617	Anacortes	WA
618	Anadarko	OK
619	Anaheim	CA
620	Anahola	HI
621	Anahuac	TX
622	Anaktuvuk Pass	AK
623	Analomink	PA
624	Anamoose	ND
625	Anamosa	IA
626	Anatone	WA
627	Anawalt	WV
628	Anchor	IL
629	Anchor Point	AK
630	Anchorage	AK
631	Anchorville	MI
632	Ancona	IL
633	Ancram	NY
634	Ancramdale	NY
635	Andale	KS
636	Andalusia	AL
637	Andalusia	IL
638	Anderson	AK
639	Anderson	AL
640	Anderson	CA
641	Anderson	IN
642	Anderson	MO
643	Anderson	SC
644	Anderson	TX
645	Anderson Island	WA
646	Andersonville	GA
647	Andersonville	TN
648	Andes	NY
649	Andover	CT
650	Andover	IA
651	Andover	IL
652	Andover	KS
653	Andover	MA
654	Andover	ME
655	Andover	MN
656	Andover	NH
657	Andover	NJ
658	Andover	NY
659	Andover	OH
660	Andover	SD
661	Andover	VA
662	Andreas	PA
663	Andrew	IA
664	Andrews	IN
665	Andrews	NC
666	Andrews	SC
667	Andrews	TX
668	Andrews Air Force Base	MD
669	Aneta	ND
670	Aneth	UT
671	Angel Fire	NM
672	Angela	MT
673	Angelica	NY
674	Angels Camp	CA
675	Angelus Oaks	CA
676	Angie	LA
677	Angier	NC
678	Angle Inlet	MN
679	Angleton	TX
680	Angola	IN
681	Angola	LA
682	Angola	NY
683	Angoon	AK
684	Angora	MN
685	Angora	NE
686	Anguilla	MS
687	Angwin	CA
688	Aniak	AK
689	Animas	NM
690	Anita	IA
691	Anita	PA
692	Aniwa	WI
693	Ankeny	IA
694	Anmoore	WV
695	Ann Arbor	MI
696	Anna	IL
697	Anna	OH
698	Anna	TX
699	Anna Maria	FL
700	Annabella	UT
701	Annada	MO
702	Annandale	MN
703	Annandale	NJ
704	Annandale	VA
705	Annandale On Hudson	NY
706	Annapolis	CA
707	Annapolis	IL
708	Annapolis	MD
709	Annapolis	MO
710	Annapolis Junction	MD
711	Annawan	IL
712	Annemanie	AL
713	Anniston	AL
714	Anniston	MO
715	Annona	TX
716	Annville	KY
717	Annville	PA
718	Anoka	MN
719	Anselmo	NE
720	Ansley	NE
721	Anson	ME
722	Anson	TX
723	Ansonia	CT
724	Ansonia	OH
725	Ansonville	NC
726	Ansted	WV
727	Antelope	CA
728	Antelope	MT
729	Antelope	OR
730	Antes Fort	PA
731	Anthon	IA
732	Anthony	FL
733	Anthony	KS
734	Anthony	NM
735	Anthony	TX
736	Antigo	WI
737	Antimony	UT
738	Antioch	CA
739	Antioch	IL
740	Antioch	TN
741	Antler	ND
742	Antlers	OK
743	Antoine	AR
744	Anton	CO
745	Anton	TX
746	Anton Chico	NM
747	Antonito	CO
748	Antrim	NH
749	Antwerp	NY
750	Antwerp	OH
751	Anvik	AK
752	Anza	CA
753	Apache	OK
754	Apache Junction	AZ
755	Apalachicola	FL
756	Apalachin	NY
757	Apex	NC
758	Apison	TN
759	Aplington	IA
760	Apollo	PA
761	Apollo Beach	FL
762	Apopka	FL
763	Appalachia	VA
764	Apple Creek	OH
765	Apple Grove	WV
766	Apple River	IL
767	Apple Springs	TX
768	Apple Valley	CA
769	Applegate	CA
770	Applegate	MI
771	Appleton	MN
772	Appleton	NY
773	Appleton	WA
774	Appleton	WI
775	Appleton City	MO
776	Appling	GA
777	Appomattox	VA
778	Aptos	CA
779	Apulia Station	NY
780	Aquasco	MD
781	Aquashicola	PA
782	Aquebogue	NY
783	Aquilla	TX
784	Arab	AL
785	Arabi	GA
786	Arabi	LA
787	Aragon	GA
788	Aragon	NM
789	Aransas Pass	TX
790	Arapaho	OK
791	Arapahoe	CO
792	Arapahoe	NC
793	Arapahoe	NE
794	Arapahoe	WY
795	Ararat	NC
796	Ararat	VA
797	Arbela	MO
798	Arboles	CO
799	Arbon	ID
800	Arbovale	WV
801	Arbuckle	CA
802	Arbyrd	MO
803	Arcade	NY
804	Arcadia	CA
805	Arcadia	FL
806	Arcadia	IA
807	Arcadia	IN
808	Arcadia	KS
809	Arcadia	LA
810	Arcadia	MI
811	Arcadia	MO
812	Arcadia	NE
813	Arcadia	OH
814	Arcadia	OK
815	Arcadia	PA
816	Arcadia	SC
817	Arcadia	WI
818	Arcanum	OH
819	Arcata	CA
820	Arch Cape	OR
821	Archbald	PA
822	Archbold	OH
823	Archer	FL
824	Archer	IA
825	Archer	NE
826	Archer City	TX
827	Archibald	LA
828	Archie	MO
829	Arco	ID
830	Arco	MN
831	Arcola	IL
832	Arcola	IN
833	Arcola	MO
834	Arcola	MS
835	Arcola	PA
836	Arcola	VA
837	Arctic Village	AK
838	Ardara	PA
839	Arden	NC
840	Arden	NY
841	Ardenvoir	WA
842	Ardmore	AL
843	Ardmore	OK
844	Ardmore	PA
845	Ardmore	TN
846	Ardsley	NY
847	Ardsley On Hudson	NY
848	Aredale	IA
849	Arena	WI
850	Arenas Valley	NM
851	Arendtsville	PA
852	Arenzville	IL
853	Argenta	IL
854	Argillite	KY
855	Argonia	KS
856	Argonne	WI
857	Argos	IN
858	Argusville	ND
859	Argyle	FL
860	Argyle	GA
861	Argyle	IA
862	Argyle	MI
863	Argyle	MN
864	Argyle	MO
865	Argyle	NY
866	Argyle	TX
867	Argyle	WI
868	Ariel	WA
869	Arimo	ID
870	Arion	IA
871	Aripeka	FL
872	Arispe	IA
873	Aristes	PA
874	Ariton	AL
875	Arivaca	AZ
876	Arizona City	AZ
877	Arjay	KY
878	Ark	VA
879	Arkabutla	MS
880	Arkadelphia	AR
881	Arkansas City	AR
882	Arkansas City	KS
883	Arkansaw	WI
884	Arkdale	WI
885	Arkoma	OK
886	Arkport	NY
887	Arkville	NY
888	Arlee	MT
889	Arley	AL
890	Arlington	AL
891	Arlington	AZ
892	Arlington	CO
893	Arlington	GA
894	Arlington	IA
895	Arlington	IL
896	Arlington	IN
897	Arlington	KS
898	Arlington	KY
899	Arlington	MA
900	Arlington	MN
901	Arlington	NE
902	Arlington	OH
903	Arlington	OR
904	Arlington	SD
905	Arlington	TN
906	Arlington	TX
907	Arlington	VA
908	Arlington	VT
909	Arlington	WA
910	Arlington	WI
911	Arlington Heights	IL
912	Arlington Heights	MA
913	Arma	KS
914	Armada	MI
915	Armagh	PA
916	Armbrust	PA
917	Armington	IL
918	Arminto	WY
919	Armona	CA
920	Armonk	NY
921	Armorel	AR
922	Armour	SD
923	Armstrong	IA
924	Armstrong	IL
925	Armstrong	MO
926	Armstrong	TX
927	Armstrong Creek	WI
928	Armuchee	GA
929	Arnaudville	LA
930	Arnegard	ND
931	Arnett	OK
932	Arnett	WV
933	Arnold	CA
934	Arnold	KS
935	Arnold	MD
936	Arnold	MI
937	Arnold	MO
938	Arnold	NE
939	Arnold A F B	TN
940	Arnolds Park	IA
941	Arnoldsburg	WV
942	Arnoldsville	GA
943	Arnot	PA
944	Arock	OR
945	Aroda	VA
946	Aroma Park	IL
947	Aromas	CA
948	Arona	PA
949	Arp	TX
950	Arpin	WI
951	Arrey	NM
952	Arriba	CO
953	Arrington	TN
954	Arrington	VA
955	Arrow Rock	MO
956	Arrowsmith	IL
957	Arroyo Grande	CA
958	Arroyo Hondo	NM
959	Arroyo Seco	NM
960	Art	TX
961	Artemas	PA
962	Artemus	KY
963	Artesia	CA
964	Artesia	MS
965	Artesia	NM
966	Artesia Wells	TX
967	Artesian	SD
968	Arthur	IA
969	Arthur	IL
970	Arthur	ND
971	Arthur	NE
972	Arthur	TN
973	Arthur City	TX
974	Arthurdale	WV
975	Artie	WV
976	Artois	CA
977	Arvada	CO
978	Arvada	WY
979	Arverne	NY
980	Arvilla	ND
981	Arvin	CA
982	Arvonia	VA
983	Ary	KY
984	Asbury	MO
985	Asbury	NJ
986	Asbury	WV
987	Asbury Park	NJ
988	Ascutney	VT
989	Ash	NC
990	Ash Flat	AR
991	Ash Fork	AZ
992	Ash Grove	MO
993	Ashaway	RI
994	Ashburn	GA
995	Ashburn	MO
996	Ashburn	VA
997	Ashburnham	MA
998	Ashby	MA
999	Ashby	MN
1000	Ashby	NE
1001	Ashcamp	KY
1002	Ashdown	AR
1003	Asheboro	NC
1004	Asher	KY
1005	Asher	OK
1006	Asherton	TX
1007	Asheville	NC
1008	Ashfield	MA
1009	Ashfield	PA
1010	Ashford	AL
1011	Ashford	CT
1012	Ashford	WA
1013	Ashford	WV
1014	Ashippun	WI
1015	Ashkum	IL
1016	Ashland	AL
1017	Ashland	IL
1018	Ashland	KS
1019	Ashland	KY
1020	Ashland	LA
1021	Ashland	MA
1022	Ashland	ME
1023	Ashland	MO
1024	Ashland	MS
1025	Ashland	MT
1026	Ashland	NE
1027	Ashland	NH
1028	Ashland	NY
1029	Ashland	OH
1030	Ashland	OR
1031	Ashland	PA
1032	Ashland	VA
1033	Ashland	WI
1034	Ashland City	TN
1035	Ashley	IL
1036	Ashley	IN
1037	Ashley	MI
1038	Ashley	ND
1039	Ashley	OH
1040	Ashley Falls	MA
1041	Ashmore	IL
1042	Ashtabula	OH
1043	Ashton	IA
1044	Ashton	ID
1045	Ashton	IL
1046	Ashton	MD
1047	Ashton	NE
1048	Ashton	SD
1049	Ashton	WV
1050	Ashuelot	NH
1051	Ashville	AL
1052	Ashville	NY
1053	Ashville	OH
1054	Ashville	PA
1055	Ashwood	OR
1056	Askov	MN
1057	Asotin	WA
1058	Aspen	CO
1059	Aspermont	TX
1060	Aspers	PA
1061	Aspinwall	IA
1062	Assaria	KS
1063	Assawoman	VA
1064	Assonet	MA
1065	Assumption	IL
1066	Astatula	FL
1067	Aston	PA
1068	Astor	FL
1069	Astoria	IL
1070	Astoria	NY
1071	Astoria	OR
1072	Astoria	SD
1073	Atalissa	IA
1074	Atascadero	CA
1075	Atascosa	TX
1076	Atchison	KS
1077	Atco	NJ
1078	Atglen	PA
1079	Athelstane	WI
1080	Athena	OR
1081	Athens	AL
1082	Athens	GA
1083	Athens	IL
1084	Athens	IN
1085	Athens	LA
1086	Athens	ME
1087	Athens	MI
1088	Athens	NY
1089	Athens	OH
1090	Athens	PA
1091	Athens	TN
1092	Athens	TX
1093	Athens	WI
1094	Athens	WV
1095	Atherton	CA
1096	Athol	ID
1097	Athol	KS
1098	Athol	KY
1099	Athol	MA
1100	Athol	NY
1101	Athol Springs	NY
1102	Atka	AK
1103	Atkins	AR
1104	Atkins	IA
1105	Atkins	VA
1106	Atkinson	IL
1107	Atkinson	NC
1108	Atkinson	NE
1109	Atkinson	NH
1110	Atlanta	GA
1111	Atlanta	ID
1112	Atlanta	IL
1113	Atlanta	IN
1114	Atlanta	KS
1115	Atlanta	LA
1116	Atlanta	MI
1117	Atlanta	MO
1118	Atlanta	NE
1119	Atlanta	NY
1120	Atlanta	TX
1121	Atlantic	IA
1122	Atlantic	NC
1123	Atlantic	PA
1124	Atlantic	VA
1125	Atlantic Beach	FL
1126	Atlantic Beach	NC
1127	Atlantic Beach	NY
1128	Atlantic City	NJ
1129	Atlantic Highlands	NJ
1130	Atlantic Mine	MI
1131	Atlas	MI
1132	Atlasburg	PA
1133	Atmore	AL
1134	Atoka	OK
1135	Atoka	TN
1136	Atomic City	ID
1137	Atqasuk	AK
1138	Attalla	AL
1139	Attapulgus	GA
1140	Attica	IN
1141	Attica	KS
1142	Attica	MI
1143	Attica	NY
1144	Attica	OH
1145	Attleboro	MA
1146	Attleboro Falls	MA
1147	Atwater	CA
1148	Atwater	MN
1149	Atwater	OH
1150	Atwood	CA
1151	Atwood	CO
1152	Atwood	IL
1153	Atwood	IN
1154	Atwood	KS
1155	Atwood	OK
1156	Atwood	TN
1157	Au Gres	MI
1158	Au Sable Forks	NY
1159	Au Train	MI
1160	Auberry	CA
1161	Aubrey	AR
1162	Aubrey	TX
1163	Auburn	AL
1164	Auburn	CA
1165	Auburn	GA
1166	Auburn	IA
1167	Auburn	IL
1168	Auburn	IN
1169	Auburn	KS
1170	Auburn	KY
1171	Auburn	MA
1172	Auburn	ME
1173	Auburn	MI
1174	Auburn	NE
1175	Auburn	NH
1176	Auburn	NY
1177	Auburn	PA
1178	Auburn	WA
1179	Auburn	WV
1180	Auburn	WY
1181	Auburn Hills	MI
1182	Auburn University	AL
1183	Auburndale	FL
1184	Auburndale	MA
1185	Auburndale	WI
1186	Auburntown	TN
1187	Audubon	IA
1188	Audubon	MN
1189	Audubon	NJ
1190	Audubon	PA
1191	Augusta	AR
1192	Augusta	GA
1193	Augusta	IL
1194	Augusta	KS
1195	Augusta	KY
1196	Augusta	ME
1197	Augusta	MI
1198	Augusta	MO
1199	Augusta	MT
1200	Augusta	NJ
1201	Augusta	OH
1202	Augusta	WI
1203	Augusta	WV
1204	Augusta Springs	VA
1205	Auke Bay	AK
1206	Aulander	NC
1207	Ault	CO
1208	Aultman	PA
1209	Aumsville	OR
1210	Aurelia	IA
1211	Auriesville	NY
1212	Aurora	CO
1213	Aurora	IA
1214	Aurora	IL
1215	Aurora	IN
1216	Aurora	KS
1217	Aurora	ME
1218	Aurora	MN
1219	Aurora	MO
1220	Aurora	NC
1221	Aurora	NE
1222	Aurora	NY
1223	Aurora	OH
1224	Aurora	OR
1225	Aurora	SD
1226	Aurora	UT
1227	Aurora	WV
1228	Austell	GA
1229	Austerlitz	NY
1230	Austin	AR
1231	Austin	CO
1232	Austin	IN
1233	Austin	KY
1234	Austin	MN
1235	Austin	NV
1236	Austin	PA
1237	Austin	TX
1238	Austinburg	OH
1239	Austinville	IA
1240	Austinville	VA
1241	Austwell	TX
1242	Autaugaville	AL
1243	Autryville	NC
1244	Auxier	KY
1245	Auxvasse	MO
1246	Ava	IL
1247	Ava	MO
1248	Ava	NY
1249	Ava	OH
1250	Avalon	CA
1251	Avalon	NJ
1252	Avalon	TX
1253	Avalon	WI
1254	Avant	OK
1255	Avawam	KY
1256	Avella	PA
1257	Avenal	CA
1258	Avenel	NJ
1259	Avenue	MD
1260	Avera	GA
1261	Averill	VT
1262	Averill Park	NY
1263	Avery	CA
1264	Avery	ID
1265	Avery	TX
1266	Avery Island	LA
1267	Avila Beach	CA
1268	Avilla	IN
1269	Avilla	MO
1270	Avinger	TX
1271	Avis	PA
1272	Aviston	IL
1273	Avoca	AR
1274	Avoca	IA
1275	Avoca	IN
1276	Avoca	MI
1277	Avoca	MN
1278	Avoca	NE
1279	Avoca	NY
1280	Avoca	TX
1281	Avoca	WI
1282	Avon	CO
1283	Avon	CT
1284	Avon	IL
1285	Avon	IN
1286	Avon	MA
1287	Avon	MN
1288	Avon	MS
1289	Avon	MT
1290	Avon	NC
1291	Avon	NY
1292	Avon	OH
1293	Avon	SD
1294	Avon By The Sea	NJ
1295	Avon Lake	OH
1296	Avon Park	FL
1297	Avondale	AZ
1298	Avondale	CO
1299	Avondale	PA
1300	Avondale	WV
1301	Avondale Estates	GA
1302	Avonmore	PA
1303	Awendaw	SC
1304	Axis	AL
1305	Axson	GA
1306	Axtell	KS
1307	Axtell	NE
1308	Axtell	TX
1309	Axtell	UT
1310	Axton	VA
1311	Ayden	NC
1312	Aydlett	NC
1313	Ayer	MA
1314	Aylett	VA
1315	Aynor	SC
1316	Ayr	ND
1317	Ayr	NE
1318	Ayrshire	IA
1319	Azalea	OR
1320	Azalia	MI
1321	Azle	TX
1322	Aztec	NM
1323	Azusa	CA
1324	Babb	MT
1325	Babbitt	MN
1326	Babcock	WI
1327	Babson Park	FL
1328	Babson Park	MA
1329	Babylon	NY
1330	Backus	MN
1331	Bacliff	TX
1332	Baconton	GA
1333	Bacova	VA
1334	Bad Axe	MI
1335	Baden	PA
1336	Badger	CA
1337	Badger	IA
1338	Badger	MN
1339	Badger	SD
1340	Badin	NC
1341	Bagdad	AZ
1342	Bagdad	FL
1343	Bagdad	KY
1344	Baggs	WY
1345	Bagley	IA
1346	Bagley	MN
1347	Bagley	WI
1348	Bagwell	TX
1349	Bahama	NC
1350	Bailey	CO
1351	Bailey	MI
1352	Bailey	MS
1353	Bailey	NC
1354	Bailey	TX
1355	Bailey Island	ME
1356	Baileys Harbor	WI
1357	Baileyton	AL
1358	Baileyville	IL
1359	Baileyville	KS
1360	Baileyville	ME
1361	Bainbridge	GA
1362	Bainbridge	IN
1363	Bainbridge	NY
1364	Bainbridge	OH
1365	Bainbridge	PA
1366	Bainbridge Island	WA
1367	Bainville	MT
1368	Baird	TX
1369	Bairdford	PA
1370	Bairoil	WY
1371	Baisden	WV
1372	Baker	CA
1373	Baker	FL
1374	Baker	LA
1375	Baker	MT
1376	Baker	NV
1377	Baker	WV
1378	Baker City	OR
1379	Bakers Mills	NY
1380	Bakersfield	CA
1381	Bakersfield	MO
1382	Bakersfield	VT
1383	Bakerstown	PA
1384	Bakersville	NC
1385	Bakersville	OH
1386	Bakerton	WV
1387	Bakewell	TN
1388	Bala Cynwyd	PA
1389	Balaton	MN
1390	Bald Knob	AR
1391	Baldwin	GA
1392	Baldwin	IA
1393	Baldwin	IL
1394	Baldwin	LA
1395	Baldwin	MD
1396	Baldwin	MI
1397	Baldwin	ND
1398	Baldwin	NY
1399	Baldwin	WI
1400	Baldwin City	KS
1401	Baldwin Park	CA
1402	Baldwin Place	NY
1403	Baldwinsville	NY
1404	Baldwinville	MA
1405	Baldwyn	MS
1406	Balfour	ND
1407	Balko	OK
1408	Ball	LA
1409	Ball Ground	GA
1410	Ballantine	MT
1411	Ballard	WV
1412	Ballentine	SC
1413	Ballico	CA
1414	Ballinger	TX
1415	Ballouville	CT
1416	Ballston Lake	NY
1417	Ballston Spa	NY
1418	Ballwin	MO
1419	Bally	PA
1420	Balm	FL
1421	Balmorhea	TX
1422	Balsam	NC
1423	Balsam Grove	NC
1424	Balsam Lake	WI
1425	Balta	ND
1426	Baltic	CT
1427	Baltic	OH
1428	Baltic	SD
1429	Baltimore	MD
1430	Baltimore	OH
1431	Bamberg	SC
1432	Banco	VA
1433	Bancroft	IA
1434	Bancroft	ID
1435	Bancroft	MI
1436	Bancroft	NE
1437	Bancroft	WI
1438	Bancroft	WV
1439	Bandana	KY
1440	Bandera	TX
1441	Bandon	OR
1442	Bandy	VA
1443	Bangall	NY
1444	Bangor	CA
1445	Bangor	ME
1446	Bangor	MI
1447	Bangor	PA
1448	Bangor	WI
1449	Bangs	TX
1450	Banks	AL
1451	Banks	AR
1452	Banks	ID
1453	Banks	OR
1454	Bankston	AL
1455	Banner	KY
1456	Banner	MS
1457	Banner	WY
1458	Banner Elk	NC
1459	Banning	CA
1460	Bannister	MI
1461	Bannock	OH
1462	Banquete	TX
1463	Bantam	CT
1464	Bantry	ND
1465	Bapchule	AZ
1466	Baptistown	NJ
1467	Bar Harbor	ME
1468	Bar Mills	ME
1469	Baraboo	WI
1470	Baraga	MI
1471	Barataria	LA
1472	Barbeau	MI
1473	Barberton	OH
1474	Barberville	FL
1475	Barboursville	VA
1476	Barboursville	WV
1477	Barbourville	KY
1478	Barclay	MD
1479	Barco	NC
1480	Bard	CA
1481	Bard	NM
1482	Bardolph	IL
1483	Bardstown	KY
1484	Bardwell	KY
1485	Bardwell	TX
1486	Bargersville	IN
1487	Barhamsville	VA
1488	Baring	MO
1489	Baring	WA
1490	Barium Springs	NC
1491	Bark River	MI
1492	Barker	NY
1493	Barker	TX
1494	Barkhamsted	CT
1495	Barksdale	TX
1496	Barksdale Afb	LA
1497	Barling	AR
1498	Barlow	KY
1499	Barlow	OH
1500	Barnard	KS
1501	Barnard	MO
1502	Barnard	SD
1503	Barnard	VT
1504	Barnardsville	NC
1505	Barnegat	NJ
1506	Barnegat Light	NJ
1507	Barnes	KS
1508	Barnes City	IA
1509	Barneston	NE
1510	Barnesville	GA
1511	Barnesville	MD
1512	Barnesville	MN
1513	Barnesville	NC
1514	Barnesville	OH
1515	Barnesville	PA
1516	Barnet	VT
1517	Barnett	MO
1518	Barneveld	NY
1519	Barneveld	WI
1520	Barney	GA
1521	Barney	ND
1522	Barnhart	MO
1523	Barnhart	TX
1524	Barnhill	IL
1525	Barnsdall	OK
1526	Barnstable	MA
1527	Barnstead	NH
1528	Barnum	IA
1529	Barnum	MN
1530	Barnwell	SC
1531	Baroda	MI
1532	Barrackville	WV
1533	Barre	MA
1534	Barre	VT
1535	Barren Springs	VA
1536	Barrett	MN
1537	Barrington	IL
1538	Barrington	NH
1539	Barrington	NJ
1540	Barrington	RI
1541	Barron	WI
1542	Barronett	WI
1543	Barrow	AK
1544	Barry	IL
1545	Barry	MN
1546	Barry	TX
1547	Barryton	MI
1548	Barrytown	NY
1549	Barryville	NY
1550	Barstow	CA
1551	Barstow	IL
1552	Barstow	MD
1553	Barstow	TX
1554	Bart	PA
1555	Bartelso	IL
1556	Bartlesville	OK
1557	Bartlett	IL
1558	Bartlett	KS
1559	Bartlett	NE
1560	Bartlett	NH
1561	Bartlett	OH
1562	Bartlett	TX
1563	Bartley	NE
1564	Bartley	WV
1565	Barto	PA
1566	Barton	AR
1567	Barton	MD
1568	Barton	NY
1569	Barton	OH
1570	Barton	VT
1571	Barton City	MI
1572	Bartonsville	PA
1573	Bartow	FL
1574	Bartow	GA
1575	Bartow	WV
1576	Barwick	GA
1577	Basalt	CO
1578	Basalt	ID
1579	Basco	IL
1580	Bascom	FL
1581	Bascom	OH
1582	Basehor	KS
1583	Basile	LA
1584	Basin	MT
1585	Basin	WY
1586	Baskerville	VA
1587	Baskett	KY
1588	Baskin	LA
1589	Basking Ridge	NJ
1590	Basom	NY
1591	Bass Harbor	ME
1592	Bass Lake	CA
1593	Bassett	AR
1594	Bassett	NE
1595	Bassett	VA
1596	Bassett	WI
1597	Bassfield	MS
1598	Bastian	VA
1599	Bastrop	LA
1600	Bastrop	TX
1601	Basye	VA
1602	Bat Cave	NC
1603	Batavia	IA
1604	Batavia	IL
1605	Batavia	NY
1606	Batavia	OH
1607	Batchelor	LA
1608	Batchtown	IL
1609	Bates	OR
1610	Bates City	MO
1611	Batesburg	SC
1612	Batesland	SD
1613	Batesville	AR
1614	Batesville	IN
1615	Batesville	MS
1616	Batesville	TX
1617	Batesville	VA
1618	Bath	IL
1619	Bath	IN
1620	Bath	ME
1621	Bath	MI
1622	Bath	NC
1623	Bath	NH
1624	Bath	NY
1625	Bath	OH
1626	Bath	PA
1627	Bath	SC
1628	Bath	SD
1629	Bath Springs	TN
1630	Bathgate	ND
1631	Baton Rouge	LA
1632	Batson	TX
1633	Battery Park	VA
1634	Battiest	OK
1635	Battle Creek	IA
1636	Battle Creek	MI
1637	Battle Creek	NE
1638	Battle Ground	IN
1639	Battle Ground	WA
1640	Battle Lake	MN
1641	Battle Mountain	NV
1642	Battleboro	NC
1643	Battlement Mesa	CO
1644	Battletown	KY
1645	Baudette	MN
1646	Bausman	PA
1647	Bauxite	AR
1648	Baxley	GA
1649	Baxter	IA
1650	Baxter	KY
1651	Baxter	MN
1652	Baxter	TN
1653	Baxter	WV
1654	Baxter Springs	KS
1655	Bay	AR
1656	Bay Center	WA
1657	Bay City	MI
1658	Bay City	OR
1659	Bay City	TX
1660	Bay City	WI
1661	Bay Minette	AL
1662	Bay Pines	FL
1663	Bay Port	MI
1664	Bay Saint Louis	MS
1665	Bay Shore	MI
1666	Bay Shore	NY
1667	Bay Springs	MS
1668	Bay Village	OH
1669	Bayard	IA
1670	Bayard	NE
1671	Bayard	NM
1672	Bayard	WV
1673	Bayboro	NC
1674	Bayfield	CO
1675	Bayfield	WI
1676	Baylis	IL
1677	Bayonne	NJ
1678	Bayou La Batre	AL
1679	Bayport	MN
1680	Bayport	NY
1681	Bays	KY
1682	Bayside	CA
1683	Bayside	NY
1684	Bayside	TX
1685	Baytown	TX
1686	Bayview	ID
1687	Bayville	NJ
1688	Bayville	NY
1689	Bazine	KS
1690	Beach	ND
1691	Beach City	OH
1692	Beach Haven	NJ
1693	Beach Haven	PA
1694	Beach Lake	PA
1695	Beachwood	NJ
1696	Beachwood	OH
1697	Beacon	IA
1698	Beacon	NY
1699	Beacon Falls	CT
1700	Beale Afb	CA
1701	Bealeton	VA
1702	Beallsville	MD
1703	Beallsville	OH
1704	Beallsville	PA
1705	Beals	ME
1706	Beaman	IA
1707	Bean Station	TN
1708	Bear	DE
1709	Bear Branch	KY
1710	Bear Creek	AL
1711	Bear Creek	NC
1712	Bear Creek	PA
1713	Bear Creek	WI
1714	Bear Lake	MI
1715	Bear Lake	PA
1716	Bear Mountain	NY
1717	Bear River City	UT
1718	Bearcreek	MT
1719	Bearden	AR
1720	Beardsley	MN
1721	Beardstown	IL
1722	Bearsville	NY
1723	Beasley	TX
1724	Beason	IL
1725	Beatrice	AL
1726	Beatrice	NE
1727	Beattie	KS
1728	Beatty	NV
1729	Beatty	OR
1730	Beattyville	KY
1731	Beaufort	MO
1732	Beaufort	NC
1733	Beaufort	SC
1734	Beaumont	CA
1735	Beaumont	KS
1736	Beaumont	KY
1737	Beaumont	MS
1738	Beaumont	TX
1739	Beaumont	VA
1740	Beauty	KY
1741	Beaver	AK
1742	Beaver	AR
1743	Beaver	IA
1744	Beaver	KY
1745	Beaver	OH
1746	Beaver	OK
1747	Beaver	OR
1748	Beaver	PA
1749	Beaver	UT
1750	Beaver	WA
1751	Beaver	WV
1752	Beaver Bay	MN
1753	Beaver City	NE
1754	Beaver Creek	MN
1755	Beaver Crossing	NE
1756	Beaver Dam	KY
1757	Beaver Dam	WI
1758	Beaver Dams	NY
1759	Beaver Falls	NY
1760	Beaver Falls	PA
1761	Beaver Island	MI
1762	Beaver Meadows	PA
1763	Beaver Springs	PA
1764	Beavercreek	OR
1765	Beaverdale	PA
1766	Beaverdam	OH
1767	Beaverdam	VA
1768	Beaverton	AL
1769	Beaverton	MI
1770	Beaverton	OR
1771	Beavertown	PA
1772	Beaverville	IL
1773	Beccaria	PA
1774	Bechtelsville	PA
1775	Beckemeyer	IL
1776	Becker	MN
1777	Becker	MS
1778	Becket	MA
1779	Beckley	WV
1780	Beckville	TX
1781	Beckwourth	CA
1782	Bedford	IA
1783	Bedford	IN
1784	Bedford	KY
1785	Bedford	MA
1786	Bedford	MI
1787	Bedford	NH
1788	Bedford	NY
1789	Bedford	OH
1790	Bedford	PA
1791	Bedford	TX
1792	Bedford	VA
1793	Bedford	WY
1794	Bedford Hills	NY
1795	Bedford Park	IL
1796	Bedias	TX
1797	Bedminster	NJ
1798	Bedminster	PA
1799	Bedrock	CO
1800	Bee	NE
1801	Bee	VA
1802	Bee Branch	AR
1803	Bee Spring	KY
1804	Beebe	AR
1805	Beebe Plain	VT
1806	Beech Bluff	TN
1807	Beech Bottom	WV
1808	Beech Creek	KY
1809	Beech Creek	PA
1810	Beech Grove	AR
1811	Beech Grove	IN
1812	Beech Grove	KY
1813	Beech Island	SC
1814	Beecher	IL
1815	Beecher City	IL
1816	Beecher Falls	VT
1817	Beechgrove	TN
1818	Beechmont	KY
1819	Beedeville	AR
1820	Beeler	KS
1821	Beemer	NE
1822	Beersheba Springs	TN
1823	Beeson	WV
1824	Beetown	WI
1825	Beeville	TX
1826	Beggs	OK
1827	Beirne	AR
1828	Bejou	MN
1829	Bel Air	MD
1830	Bel Alton	MD
1831	Belcamp	MD
1832	Belcher	KY
1833	Belcher	LA
1834	Belchertown	MA
1835	Belcourt	ND
1836	Belden	CA
1837	Belden	MS
1838	Belden	NE
1839	Beldenville	WI
1840	Belding	MI
1841	Belen	MS
1842	Belen	NM
1843	Belews Creek	NC
1844	Belfair	WA
1845	Belfast	ME
1846	Belfast	NY
1847	Belfast	TN
1848	Belfield	ND
1849	Belford	NJ
1850	Belfry	KY
1851	Belfry	MT
1852	Belgium	WI
1853	Belgrade	ME
1854	Belgrade	MN
1855	Belgrade	MO
1856	Belgrade	MT
1857	Belgrade	NE
1858	Belgrade Lakes	ME
1859	Belhaven	NC
1860	Belington	WV
1861	Belk	AL
1862	Belknap	IL
1863	Bell	CA
1864	Bell	FL
1865	Bell Buckle	TN
1866	Bell City	LA
1867	Bell City	MO
1868	Bell Gardens	CA
1869	Bella Vista	AR
1870	Bella Vista	CA
1871	Bellaire	MI
1872	Bellaire	OH
1873	Bellaire	TX
1874	Bellamy	AL
1875	Bellarthur	NC
1876	Bellbrook	OH
1877	Belle	MO
1878	Belle	WV
1879	Belle Center	OH
1880	Belle Chasse	LA
1881	Belle Fourche	SD
1882	Belle Glade	FL
1883	Belle Haven	VA
1884	Belle Mead	NJ
1885	Belle Mina	AL
1886	Belle Plaine	IA
1887	Belle Plaine	KS
1888	Belle Plaine	MN
1889	Belle Rive	IL
1890	Belle Rose	LA
1891	Belle Valley	OH
1892	Belle Vernon	PA
1893	Belleair Beach	FL
1894	Bellefontaine	MS
1895	Bellefontaine	OH
1896	Bellefonte	PA
1897	Bellemont	AZ
1898	Bellerose	NY
1899	Belleview	FL
1900	Belleview	MO
1901	Belleville	AR
1902	Belleville	IL
1903	Belleville	KS
1904	Belleville	MI
1905	Belleville	NJ
1906	Belleville	NY
1907	Belleville	PA
1908	Belleville	WI
1909	Belleville	WV
1910	Bellevue	IA
1911	Bellevue	ID
1912	Bellevue	KY
1913	Bellevue	MI
1914	Bellevue	NE
1915	Bellevue	OH
1916	Bellevue	TX
1917	Bellevue	WA
1918	Bellflower	CA
1919	Bellflower	IL
1920	Bellflower	MO
1921	Bellingham	MA
1922	Bellingham	MN
1923	Bellingham	WA
1924	Bellmawr	NJ
1925	Bellmont	IL
1926	Bellmore	IN
1927	Bellmore	NY
1928	Bellona	NY
1929	Bellows Falls	VT
1930	Bellport	NY
1931	Bells	TN
1932	Bells	TX
1933	Bellvale	NY
1934	Bellville	GA
1935	Bellville	OH
1936	Bellville	TX
1937	Bellvue	CO
1938	Bellwood	AL
1939	Bellwood	IL
1940	Bellwood	NE
1941	Bellwood	PA
1942	Belmar	NJ
1943	Belmond	IA
1944	Belmont	CA
1945	Belmont	LA
1946	Belmont	MA
1947	Belmont	MI
1948	Belmont	MS
1949	Belmont	NC
1950	Belmont	NH
1951	Belmont	NY
1952	Belmont	OH
1953	Belmont	TX
1954	Belmont	VT
1955	Belmont	WA
1956	Belmont	WI
1957	Belmont	WV
1958	Belmore	OH
1959	Beloit	KS
1960	Beloit	OH
1961	Beloit	WI
1962	Belpre	KS
1963	Belpre	OH
1964	Belsano	PA
1965	Belspring	VA
1966	Belt	MT
1967	Belton	KY
1968	Belton	MO
1969	Belton	SC
1970	Belton	TX
1971	Beltrami	MN
1972	Beltsville	MD
1973	Belva	WV
1974	Belvedere Tiburon	CA
1975	Belvidere	IL
1976	Belvidere	NC
1977	Belvidere	NE
1978	Belvidere	NJ
1979	Belvidere	SD
1980	Belvidere	TN
1981	Belvidere Center	VT
1982	Belview	MN
1983	Belvue	KS
1984	Belzoni	MS
1985	Bement	IL
1986	Bemidji	MN
1987	Bemus Point	NY
1988	Ben Bolt	TX
1989	Ben Franklin	TX
1990	Ben Hur	VA
1991	Ben Lomond	AR
1992	Ben Lomond	CA
1993	Ben Wheeler	TX
1994	Bena	MN
1995	Bena	VA
1996	Benavides	TX
1997	Bend	OR
1998	Bend	TX
1999	Bendena	KS
2000	Bendersville	PA
2001	Benedict	KS
2002	Benedict	MD
2003	Benedict	MN
2004	Benedict	ND
2005	Benedict	NE
2006	Benedicta	ME
2007	Benet Lake	WI
2008	Benezett	PA
2009	Benge	WA
2010	Benham	KY
2011	Benicia	CA
2012	Benjamin	TX
2013	Benkelman	NE
2014	Benld	IL
2015	Bennet	NE
2016	Bennett	CO
2017	Bennett	IA
2018	Bennett	NC
2019	Bennettsville	SC
2020	Bennington	IN
2021	Bennington	KS
2022	Bennington	NE
2023	Bennington	NH
2024	Bennington	OK
2025	Bennington	VT
2026	Benoit	MS
2027	Benoit	WI
2028	Bensalem	PA
2029	Bensenville	IL
2030	Benson	AZ
2031	Benson	IL
2032	Benson	MD
2033	Benson	MN
2034	Benson	NC
2035	Benson	VT
2036	Bent	NM
2037	Bent Mountain	VA
2038	Bentley	KS
2039	Bentley	LA
2040	Bentley	MI
2041	Bentleyville	PA
2042	Benton	AR
2043	Benton	CA
2044	Benton	IA
2045	Benton	IL
2046	Benton	KS
2047	Benton	KY
2048	Benton	LA
2049	Benton	MO
2050	Benton	MS
2051	Benton	PA
2052	Benton	TN
2053	Benton	WI
2054	Benton City	MO
2055	Benton City	WA
2056	Benton Harbor	MI
2057	Benton Ridge	OH
2058	Bentonia	MS
2059	Bentonville	AR
2060	Bentonville	IN
2061	Bentonville	OH
2062	Bentonville	VA
2063	Benwood	WV
2064	Benzonia	MI
2065	Berclair	TX
2066	Berea	KY
2067	Berea	OH
2068	Berea	WV
2069	Beresford	SD
2070	Bergen	NY
2071	Bergenfield	NJ
2072	Berger	MO
2073	Bergheim	TX
2074	Bergholz	OH
2075	Bergland	MI
2076	Bergman	AR
2077	Bergoo	WV
2078	Bergton	VA
2079	Berino	NM
2080	Berkeley	CA
2081	Berkeley	IL
2082	Berkeley Heights	NJ
2083	Berkeley Springs	WV
2084	Berkey	OH
2085	Berkley	MA
2086	Berkley	MI
2087	Berkshire	MA
2088	Berkshire	NY
2089	Berlin	CT
2090	Berlin	GA
2091	Berlin	MA
2092	Berlin	MD
2093	Berlin	ND
2094	Berlin	NH
2095	Berlin	NJ
2096	Berlin	NY
2097	Berlin	OH
2098	Berlin	PA
2099	Berlin	WI
2100	Berlin Center	OH
2101	Berlin Heights	OH
2102	Bern	ID
2103	Bern	KS
2104	Bernalillo	NM
2105	Bernard	IA
2106	Bernard	ME
2107	Bernardston	MA
2108	Bernardsville	NJ
2109	Berne	IN
2110	Berne	NY
2111	Bernhards Bay	NY
2112	Bernice	LA
2113	Bernie	MO
2114	Bernville	PA
2115	Berrien Center	MI
2116	Berrien Springs	MI
2117	Berry	AL
2118	Berry	KY
2119	Berry Creek	CA
2120	Berrysburg	PA
2121	Berryton	KS
2122	Berryville	AR
2123	Berryville	VA
2124	Bertha	MN
2125	Berthold	ND
2126	Berthoud	CO
2127	Bertram	TX
2128	Bertrand	MO
2129	Bertrand	NE
2130	Berwick	IA
2131	Berwick	IL
2132	Berwick	LA
2133	Berwick	ME
2134	Berwick	PA
2135	Berwind	WV
2136	Berwyn	IL
2137	Berwyn	PA
2138	Beryl	UT
2139	Bessemer	AL
2140	Bessemer	MI
2141	Bessemer	PA
2142	Bessemer City	NC
2143	Bessie	OK
2144	Bethalto	IL
2145	Bethania	NC
2146	Bethany	CT
2147	Bethany	IL
2148	Bethany	KY
2149	Bethany	LA
2150	Bethany	MO
2151	Bethany	OK
2152	Bethany	WV
2153	Bethany Beach	DE
2154	Bethel	AK
2155	Bethel	CT
2156	Bethel	DE
2157	Bethel	ME
2158	Bethel	MN
2159	Bethel	MO
2160	Bethel	NC
2161	Bethel	NY
2162	Bethel	OH
2163	Bethel	OK
2164	Bethel	PA
2165	Bethel	VT
2166	Bethel Island	CA
2167	Bethel Park	PA
2168	Bethel Springs	TN
2169	Bethelridge	KY
2170	Bethera	SC
2171	Bethesda	MD
2172	Bethesda	OH
2173	Bethlehem	CT
2174	Bethlehem	GA
2175	Bethlehem	IN
2176	Bethlehem	KY
2177	Bethlehem	MD
2178	Bethlehem	NH
2179	Bethlehem	PA
2180	Bethpage	NY
2181	Bethpage	TN
2182	Bethune	CO
2183	Bethune	SC
2184	Betsy Layne	KY
2185	Bettendorf	IA
2186	Betterton	MD
2187	Bettles Field	AK
2188	Bettsville	OH
2189	Beulah	CO
2190	Beulah	MI
2191	Beulah	MO
2192	Beulah	MS
2193	Beulah	ND
2194	Beulah	WY
2195	Beulaville	NC
2196	Beverly	KS
2197	Beverly	KY
2198	Beverly	MA
2199	Beverly	NJ
2200	Beverly	OH
2201	Beverly	WA
2202	Beverly	WV
2203	Beverly Hills	CA
2204	Beverly Hills	FL
2205	Beverly Shores	IN
2206	Bevier	MO
2207	Bevington	IA
2208	Bevinsville	KY
2209	Bexar	AR
2210	Beyer	PA
2211	Bible School Park	NY
2212	Bickleton	WA
2213	Bickmore	WV
2214	Bicknell	IN
2215	Bicknell	UT
2216	Biddeford	ME
2217	Biddeford Pool	ME
2218	Biddle	MT
2219	Bidwell	OH
2220	Bieber	CA
2221	Bienville	LA
2222	Big Arm	MT
2223	Big Bar	CA
2224	Big Bay	MI
2225	Big Bear City	CA
2226	Big Bear Lake	CA
2227	Big Bend	CA
2228	Big Bend	WI
2229	Big Bend	WV
2230	Big Bend National Park	TX
2231	Big Cabin	OK
2232	Big Clifty	KY
2233	Big Cove Tannery	PA
2234	Big Creek	CA
2235	Big Creek	KY
2236	Big Creek	MS
2237	Big Creek	WV
2238	Big Falls	MN
2239	Big Falls	WI
2240	Big Flat	AR
2241	Big Flats	NY
2242	Big Horn	WY
2243	Big Indian	NY
2244	Big Island	VA
2245	Big Lake	AK
2246	Big Lake	MN
2247	Big Lake	TX
2248	Big Laurel	KY
2249	Big Oak Flat	CA
2250	Big Pine	CA
2251	Big Pine Key	FL
2252	Big Piney	WY
2253	Big Pool	MD
2254	Big Prairie	OH
2255	Big Rmeisterdish_serverds	MI
2256	Big Rock	IL
2257	Big Rock	TN
2258	Big Rock	VA
2259	Big Run	PA
2260	Big Run	WV
2261	Big Sandy	MT
2262	Big Sandy	TN
2263	Big Sandy	TX
2264	Big Sandy	WV
2265	Big Sky	MT
2266	Big Spring	TX
2267	Big Springs	NE
2268	Big Springs	WV
2269	Big Stone City	SD
2270	Big Stone Gap	VA
2271	Big Sur	CA
2272	Big Timber	MT
2273	Big Wells	TX
2274	Bigelow	AR
2275	Bigelow	MN
2276	Bigfoot	TX
2277	Bigfork	MN
2278	Bigfork	MT
2279	Biggers	AR
2280	Biggs	CA
2281	Biggsville	IL
2282	Bighill	KY
2283	Bighorn	MT
2284	Bigler	PA
2285	Biglerville	PA
2286	Billerica	MA
2287	Billings	MO
2288	Billings	MT
2289	Billings	NY
2290	Billings	OK
2291	Billingsley	AL
2292	Biloxi	MS
2293	Bim	WV
2294	Bimble	KY
2295	Binford	ND
2296	Bingen	WA
2297	Binger	OK
2298	Bingham	IL
2299	Bingham	ME
2300	Bingham	NE
2301	Bingham Canyon	UT
2302	Bingham Lake	MN
2303	Binghamton	NY
2304	Biola	CA
2305	Bippus	IN
2306	Birch Harbor	ME
2307	Birch River	WV
2308	Birch Run	MI
2309	Birch Tree	MO
2310	Birchdale	MN
2311	Birchleaf	VA
2312	Birchrunville	PA
2313	Birchwood	TN
2314	Birchwood	WI
2315	Bird City	KS
2316	Bird In Hand	PA
2317	Bird Island	MN
2318	Birds Landing	CA
2319	Birdsboro	PA
2320	Birdseye	IN
2321	Birdsnest	VA
2322	Birmingham	AL
2323	Birmingham	IA
2324	Birmingham	MI
2325	Birmingham	NJ
2326	Birmingham	OH
2327	Birnamwood	WI
2328	Birney	MT
2329	Bisbee	AZ
2330	Bisbee	ND
2331	Biscoe	AR
2332	Biscoe	NC
2333	Bishop	CA
2334	Bishop	GA
2335	Bishop	TX
2336	Bishop	VA
2337	Bishop Hill	IL
2338	Bishopville	MD
2339	Bishopville	SC
2340	Bismarck	AR
2341	Bismarck	IL
2342	Bismarck	MO
2343	Bismarck	ND
2344	Bison	KS
2345	Bison	OK
2346	Bison	SD
2347	Bitely	MI
2348	Bittinger	MD
2349	Bivalve	MD
2350	Bivins	TX
2351	Biwabik	MN
2352	Bixby	MO
2353	Bixby	OK
2354	Blachly	OR
2355	Black	AL
2356	Black	MO
2357	Black Canyon City	AZ
2358	Black Creek	NC
2359	Black Creek	NY
2360	Black Creek	WI
2361	Black Diamond	WA
2362	Black Eagle	MT
2363	Black Earth	WI
2364	Black Hawk	CO
2365	Black Hawk	SD
2366	Black Lick	PA
2367	Black Mountain	NC
2368	Black Oak	AR
2369	Black River	MI
2370	Black River	NY
2371	Black River Falls	WI
2372	Black Rock	AR
2373	Blackburn	MO
2374	Blackduck	MN
2375	Blackey	KY
2376	Blackfoot	ID
2377	Blackford	KY
2378	Blacklick	OH
2379	Blacksburg	SC
2380	Blacksburg	VA
2381	Blackshear	GA
2382	Blackstock	SC
2383	Blackstone	IL
2384	Blackstone	MA
2385	Blackstone	VA
2386	Blacksville	WV
2387	Blackville	SC
2388	Blackwater	MO
2389	Blackwater	VA
2390	Blackwell	MO
2391	Blackwell	OK
2392	Blackwell	TX
2393	Blackwood	NJ
2394	Bladen	NE
2395	Bladenboro	NC
2396	Bladensburg	MD
2397	Bladensburg	OH
2398	Blain	PA
2399	Blaine	KY
2400	Blaine	ME
2401	Blaine	OH
2402	Blaine	TN
2403	Blaine	WA
2404	Blair	NE
2405	Blair	OK
2406	Blair	SC
2407	Blair	WI
2408	Blair	WV
2409	Blairs	VA
2410	Blairs Mills	PA
2411	Blairsburg	IA
2412	Blairsden-graeagle	CA
2413	Blairstown	IA
2414	Blairstown	MO
2415	Blairstown	NJ
2416	Blairsville	GA
2417	Blairsville	PA
2418	Blakely	GA
2419	Blakely Island	WA
2420	Blakesburg	IA
2421	Blakeslee	OH
2422	Blakeslee	PA
2423	Blanca	CO
2424	Blanch	NC
2425	Blanchard	IA
2426	Blanchard	ID
2427	Blanchard	LA
2428	Blanchard	MI
2429	Blanchard	ND
2430	Blanchard	OK
2431	Blanchard	PA
2432	Blanchardville	WI
2433	Blanchester	OH
2434	Blanco	NM
2435	Blanco	OK
2436	Blanco	TX
2437	Bland	MO
2438	Bland	VA
2439	Blandburg	PA
2440	Blandford	MA
2441	Blanding	UT
2442	Blandinsville	IL
2443	Blandon	PA
2444	Blanford	IN
2445	Blanket	TX
2446	Blauvelt	NY
2447	Blawenburg	NJ
2448	Bledsoe	KY
2449	Bledsoe	TX
2450	Bleiblerville	TX
2451	Blencoe	IA
2452	Blenheim	SC
2453	Blenker	WI
2454	Blessing	TX
2455	Blevins	AR
2456	Bliss	ID
2457	Bliss	NY
2458	Blissfield	MI
2459	Blissfield	OH
2460	Block Island	RI
2461	Blocker	OK
2462	Blocksburg	CA
2463	Blockton	IA
2464	Blodgett	MO
2465	Blodgett	OR
2466	Blodgett Mills	NY
2467	Blomkest	MN
2468	Bloomburg	TX
2469	Bloomdale	OH
2470	Bloomer	WI
2471	Bloomery	WV
2472	Bloomfield	CT
2473	Bloomfield	IA
2474	Bloomfield	IN
2475	Bloomfield	KY
2476	Bloomfield	MO
2477	Bloomfield	MT
2478	Bloomfield	NE
2479	Bloomfield	NJ
2480	Bloomfield	NM
2481	Bloomfield	NY
2482	Bloomfield Hills	MI
2483	Blooming Glen	PA
2484	Blooming Grove	NY
2485	Blooming Grove	TX
2486	Blooming Prairie	MN
2487	Bloomingburg	NY
2488	Bloomingburg	OH
2489	Bloomingdale	GA
2490	Bloomingdale	IL
2491	Bloomingdale	IN
2492	Bloomingdale	MI
2493	Bloomingdale	NJ
2494	Bloomingdale	NY
2495	Bloomingdale	OH
2496	Bloomingrose	WV
2497	Bloomington	CA
2498	Bloomington	ID
2499	Bloomington	IL
2500	Bloomington	IN
2501	Bloomington	MD
2502	Bloomington	NE
2503	Bloomington	NY
2504	Bloomington	TX
2505	Bloomington	WI
2506	Bloomington Springs	TN
2507	Bloomsburg	PA
2508	Bloomsbury	NJ
2509	Bloomsdale	MO
2510	Bloomville	NY
2511	Bloomville	OH
2512	Blossburg	PA
2513	Blossom	TX
2514	Blossvale	NY
2515	Blount	WV
2516	Blounts Creek	NC
2517	Blountstown	FL
2518	Blountsville	AL
2519	Blountville	TN
2520	Blowing Rock	NC
2521	Bloxom	VA
2522	Blue	AZ
2523	Blue Ball	PA
2524	Blue Bell	PA
2525	Blue Creek	OH
2526	Blue Creek	WV
2527	Blue Diamond	NV
2528	Blue Earth	MN
2529	Blue Eye	MO
2530	Blue Gap	AZ
2531	Blue Grass	IA
2532	Blue Grass	VA
2533	Blue Hill	ME
2534	Blue Hill	NE
2535	Blue Island	IL
2536	Blue Jay	CA
2537	Blue Jay	WV
2538	Blue Lake	CA
2539	Blue Mound	IL
2540	Blue Mound	KS
2541	Blue Mounds	WI
2542	Blue Mountain	AR
2543	Blue Mountain	MS
2544	Blue Mountain Lake	NY
2545	Blue Point	NY
2546	Blue Rmeisterdish_serverds	KS
2547	Blue Ridge	GA
2548	Blue Ridge	TX
2549	Blue Ridge	VA
2550	Blue Ridge Summit	PA
2551	Blue River	KY
2552	Blue River	OR
2553	Blue River	WI
2554	Blue Rock	OH
2555	Blue Springs	MO
2556	Blue Springs	MS
2557	Blue Springs	NE
2558	Bluebell	UT
2559	Bluefield	VA
2560	Bluefield	WV
2561	Bluegrove	TX
2562	Bluejacket	OK
2563	Bluemont	VA
2564	Bluewater	NM
2565	Bluff	UT
2566	Bluff City	AR
2567	Bluff City	KS
2568	Bluff City	TN
2569	Bluff Dale	TX
2570	Bluff Springs	IL
2571	Bluffs	IL
2572	Bluffton	AR
2573	Bluffton	GA
2574	Bluffton	IN
2575	Bluffton	MN
2576	Bluffton	OH
2577	Bluffton	SC
2578	Bluffton	TX
2579	Bluford	IL
2580	Blum	TX
2581	Blunt	SD
2582	Bly	OR
2583	Blythe	CA
2584	Blythe	GA
2585	Blythedale	MO
2586	Blytheville	AR
2587	Blythewood	SC
2588	Boalsburg	PA
2589	Board Camp	AR
2590	Boardman	OR
2591	Boaz	AL
2592	Boaz	KY
2593	Bob White	WV
2594	Bobtown	PA
2595	Boca Grande	FL
2596	Boca Raton	FL
2597	Bock	MN
2598	Bode	IA
2599	Bodega	CA
2600	Bodega Bay	CA
2601	Bodfish	CA
2602	Boelus	NE
2603	Boerne	TX
2604	Bogalusa	LA
2605	Bogard	MO
2606	Bogart	GA
2607	Bogata	TX
2608	Boggstown	IN
2609	Bogota	NJ
2610	Bogota	TN
2611	Bogue	KS
2612	Bogue Chitto	MS
2613	Bohannon	VA
2614	Bohemia	NY
2615	Boiceville	NY
2616	Boiling Springs	NC
2617	Boiling Springs	PA
2618	Boiling Springs	SC
2619	Bois D Arc	MO
2620	Boise	ID
2621	Boise City	OK
2622	Boissevain	VA
2623	Bokchito	OK
2624	Bokeelia	FL
2625	Bokoshe	OK
2626	Bolckow	MO
2627	Boles	AR
2628	Boles	IL
2629	Boley	OK
2630	Boligee	AL
2631	Bolinas	CA
2632	Boling	TX
2633	Bolingbroke	GA
2634	Bolingbrook	IL
2635	Bolivar	MO
2636	Bolivar	NY
2637	Bolivar	OH
2638	Bolivar	PA
2639	Bolivar	TN
2640	Bolivia	NC
2641	Bolt	WV
2642	Bolton	CT
2643	Bolton	MA
2644	Bolton	MS
2645	Bolton	NC
2646	Bolton Landing	NY
2647	Bombay	NY
2648	Bomont	WV
2649	Bomoseen	VT
2650	Bon Air	AL
2651	Bon Aqua	TN
2652	Bon Secour	AL
2653	Bon Wier	TX
2654	Bonaire	GA
2655	Bonanza	OR
2656	Bonanza	UT
2657	Bonaparte	IA
2658	Boncarbo	CO
2659	Bond	CO
2660	Bondsville	MA
2661	Bonduel	WI
2662	Bondurant	IA
2663	Bondurant	WY
2664	Bondville	IL
2665	Bondville	VT
2666	Bone Gap	IL
2667	Bonesteel	SD
2668	Boneville	GA
2669	Bonfield	IL
2670	Bonham	TX
2671	Bonifay	FL
2672	Bonita	CA
2673	Bonita	LA
2674	Bonita Springs	FL
2675	Bonlee	NC
2676	Bonne Terre	MO
2677	Bonneau	SC
2678	Bonner	MT
2679	Bonner Springs	KS
2680	Bonnerdale	AR
2681	Bonners Ferry	ID
2682	Bonney Lake	WA
2683	Bonnie	IL
2684	Bonnieville	KY
2685	Bonnots Mill	MO
2686	Bonnyman	KY
2687	Bono	AR
2688	Bonsall	CA
2689	Boody	IL
2690	Booker	TX
2691	Boomer	NC
2692	Boomer	WV
2693	Boon	MI
2694	Boone	CO
2695	Boone	IA
2696	Boone	NC
2697	Boone Grove	IN
2698	Boones Mill	VA
2699	Booneville	AR
2700	Booneville	IA
2701	Booneville	KY
2702	Booneville	MS
2703	Boons Camp	KY
2704	Boonsboro	MD
2705	Boonton	NJ
2706	Boonville	CA
2707	Boonville	IN
2708	Boonville	MO
2709	Boonville	NC
2710	Boonville	NY
2711	Booth	AL
2712	Boothbay	ME
2713	Boothbay Harbor	ME
2714	Boothville	LA
2715	Bordelonville	LA
2716	Borden	IN
2717	Bordentown	NJ
2718	Borderland	WV
2719	Borger	TX
2720	Boring	MD
2721	Boring	OR
2722	Boron	CA
2723	Borrego Springs	CA
2724	Borup	MN
2725	Boscobel	WI
2726	Bosler	WY
2727	Bosque	NM
2728	Bosque Farms	NM
2729	Boss	MO
2730	Bossier City	LA
2731	Bostic	NC
2732	Boston	GA
2733	Boston	IN
2734	Boston	KY
2735	Boston	MA
2736	Boston	NY
2737	Boston	VA
2738	Bostwick	FL
2739	Bostwick	GA
2740	Boswell	IN
2741	Boswell	OK
2742	Boswell	PA
2743	Bosworth	MO
2744	Bothell	WA
2745	Botkins	OH
2746	Botsford	CT
2747	Bottineau	ND
2748	Bouckville	NY
2749	Boulder	CO
2750	Boulder	MT
2751	Boulder	UT
2752	Boulder	WY
2753	Boulder City	NV
2754	Boulder Creek	CA
2755	Boulder Junction	WI
2756	Boulevard	CA
2757	Bound Brook	NJ
2758	Bountiful	UT
2759	Bourbon	IN
2760	Bourbon	MO
2761	Bourbonnais	IL
2762	Bourg	LA
2763	Bourneville	OH
2764	Bouse	AZ
2765	Bouton	IA
2766	Boutte	LA
2767	Bovard	PA
2768	Bovey	MN
2769	Bovill	ID
2770	Bovina	TX
2771	Bovina Center	NY
2772	Bow	NH
2773	Bow	WA
2774	Bowbells	ND
2775	Bowden	WV
2776	Bowdle	SD
2777	Bowdoin	ME
2778	Bowdoinham	ME
2779	Bowdon	GA
2780	Bowdon	ND
2781	Bowdon Junction	GA
2782	Bowen	IL
2783	Bowers	PA
2784	Bowerston	OH
2785	Bowersville	GA
2786	Bowersville	OH
2787	Bowie	AZ
2788	Bowie	MD
2789	Bowie	TX
2790	Bowlegs	OK
2791	Bowler	WI
2792	Bowling Green	FL
2793	Bowling Green	IN
2794	Bowling Green	KY
2795	Bowling Green	MO
2796	Bowling Green	OH
2797	Bowling Green	SC
2798	Bowling Green	VA
2799	Bowlus	MN
2800	Bowman	GA
2801	Bowman	ND
2802	Bowman	SC
2803	Bowmansdale	PA
2804	Bowmanstown	PA
2805	Bowmansville	NY
2806	Bowmansville	PA
2807	Bowstring	MN
2808	Box Elder	MT
2809	Box Elder	SD
2810	Box Springs	GA
2811	Boxborough	MA
2812	Boxford	MA
2813	Boxholm	IA
2814	Boyce	LA
2815	Boyce	VA
2816	Boyceville	WI
2817	Boyd	MN
2818	Boyd	MT
2819	Boyd	TX
2820	Boyd	WI
2821	Boyden	IA
2822	Boyds	MD
2823	Boyds	WA
2824	Boydton	VA
2825	Boyers	PA
2826	Boyertown	PA
2827	Boyes	MT
2828	Boyes Hot Springs	CA
2829	Boykin	AL
2830	Boykins	VA
2831	Boyle	MS
2832	Boylston	MA
2833	Boyne City	MI
2834	Boyne Falls	MI
2835	Boynton	OK
2836	Boynton	PA
2837	Boynton Beach	FL
2838	Boys Ranch	TX
2839	Boys Town	NE
2840	Bozeman	MT
2841	Bozman	MD
2842	Bozrah	CT
2843	Braceville	IL
2844	Bracey	VA
2845	Brackenridge	PA
2846	Brackettville	TX
2847	Brackney	PA
2848	Braddock	ND
2849	Braddock	PA
2850	Braddock Heights	MD
2851	Braddyville	IA
2852	Braden	TN
2853	Bradenton	FL
2854	Bradenton Beach	FL
2855	Bradenville	PA
2856	Bradford	AR
2857	Bradford	IA
2858	Bradford	IL
2859	Bradford	IN
2860	Bradford	ME
2861	Bradford	NH
2862	Bradford	NY
2863	Bradford	OH
2864	Bradford	PA
2865	Bradford	RI
2866	Bradford	TN
2867	Bradford	VT
2868	Bradfordsville	KY
2869	Bradfordwoods	PA
2870	Bradgate	IA
2871	Bradley	AR
2872	Bradley	CA
2873	Bradley	FL
2874	Bradley	IL
2875	Bradley	ME
2876	Bradley	MI
2877	Bradley	OK
2878	Bradley	SC
2879	Bradley	SD
2880	Bradley	WV
2881	Bradley Beach	NJ
2882	Bradleyville	MO
2883	Bradner	OH
2884	Bradshaw	NE
2885	Bradshaw	WV
2886	Brady	MT
2887	Brady	NE
2888	Brady	TX
2889	Brady Lake	OH
2890	Bradyville	TN
2891	Bragg City	MO
2892	Braggadocio	MO
2893	Braggs	OK
2894	Braham	MN
2895	Braidwood	IL
2896	Brainard	NE
2897	Brainard	NY
2898	Brainardsville	NY
2899	Brainerd	MN
2900	Braintree	MA
2901	Braithwaite	LA
2902	Braman	OK
2903	Bramwell	WV
2904	Branch	AR
2905	Branch	LA
2906	Branch	MI
2907	Branchdale	PA
2908	Branchland	WV
2909	Branchport	NY
2910	Branchton	PA
2911	Branchville	IN
2912	Branchville	NJ
2913	Branchville	SC
2914	Branchville	VA
2915	Brandamore	PA
2916	Brandeis	CA
2917	Brandenburg	KY
2918	Brandon	FL
2919	Brandon	IA
2920	Brandon	MN
2921	Brandon	MS
2922	Brandon	SD
2923	Brandon	TX
2924	Brandon	VT
2925	Brandon	WI
2926	Brandsville	MO
2927	Brandt	SD
2928	Brandy Camp	PA
2929	Brandy Station	VA
2930	Brandywine	MD
2931	Brandywine	WV
2932	Branford	CT
2933	Branford	FL
2934	Branscomb	CA
2935	Branson	CO
2936	Branson	MO
2937	Brant	MI
2938	Brant	NY
2939	Brant Lake	NY
2940	Brant Rock	MA
2941	Brantingham	NY
2942	Brantley	AL
2943	Brantwood	WI
2944	Braselton	GA
2945	Brashear	MO
2946	Brashear	TX
2947	Brasher Falls	NY
2948	Brasstown	NC
2949	Brattleboro	VT
2950	Brave	PA
2951	Brawley	CA
2952	Braxton	MS
2953	Braymer	MO
2954	Brayton	IA
2955	Brazeau	MO
2956	Brazil	IN
2957	Brazoria	TX
2958	Brea	CA
2959	Breaks	VA
2960	Breaux Bridge	LA
2961	Breckenridge	CO
2962	Breckenridge	MI
2963	Breckenridge	MN
2964	Breckenridge	MO
2965	Breckenridge	TX
2966	Brecksville	OH
2967	Breda	IA
2968	Breeden	WV
2969	Breeding	KY
2970	Breedsville	MI
2971	Breese	IL
2972	Breesport	NY
2973	Breezewood	PA
2974	Breezy Point	NY
2975	Breinigsville	PA
2976	Bremen	AL
2977	Bremen	GA
2978	Bremen	IN
2979	Bremen	KS
2980	Bremen	KY
2981	Bremen	ME
2982	Bremen	ND
2983	Bremerton	WA
2984	Bremo Bluff	VA
2985	Bremond	TX
2986	Brenham	TX
2987	Brent	AL
2988	Brentford	SD
2989	Brenton	WV
2990	Brentwood	CA
2991	Brentwood	MD
2992	Brentwood	NY
2993	Brentwood	TN
2994	Brethren	MI
2995	Bretton Woods	NH
2996	Bretz	WV
2997	Brevard	NC
2998	Brevig Mission	AK
2999	Brewer	ME
3000	Brewerton	NY
3001	Brewster	KS
3002	Brewster	MA
3003	Brewster	MN
3004	Brewster	NE
3005	Brewster	NY
3006	Brewster	OH
3007	Brewster	WA
3008	Brewton	AL
3009	Brian Head	UT
3010	Briar	MO
3011	Briarcliff Manor	NY
3012	Brice	OH
3013	Bricelyn	MN
3014	Briceville	TN
3015	Brick	NJ
3016	Brickeys	AR
3017	Bridal Veil	OR
3018	Bridge City	TX
3019	Bridgehampton	NY
3020	Bridgeport	AL
3021	Bridgeport	CA
3022	Bridgeport	CT
3023	Bridgeport	IL
3024	Bridgeport	MI
3025	Bridgeport	NE
3026	Bridgeport	NJ
3027	Bridgeport	NY
3028	Bridgeport	OH
3029	Bridgeport	OR
3030	Bridgeport	PA
3031	Bridgeport	TX
3032	Bridgeport	WA
3033	Bridgeport	WV
3034	Bridger	MT
3035	Bridgeton	IN
3036	Bridgeton	MO
3037	Bridgeton	NC
3038	Bridgeton	NJ
3039	Bridgeview	IL
3040	Bridgeville	CA
3041	Bridgeville	DE
3042	Bridgeville	PA
3043	Bridgewater	CT
3044	Bridgewater	IA
3045	Bridgewater	MA
3046	Bridgewater	ME
3047	Bridgewater	MI
3048	Bridgewater	NJ
3049	Bridgewater	NY
3050	Bridgewater	SD
3051	Bridgewater	VA
3052	Bridgewater	VT
3053	Bridgewater Corners	VT
3054	Bridgman	MI
3055	Bridgton	ME
3056	Bridport	VT
3057	Brielle	NJ
3058	Brier Hill	NY
3059	Brier Hill	PA
3060	Brierfield	AL
3061	Brigantine	NJ
3062	Briggs	TX
3063	Briggsdale	CO
3064	Briggsville	AR
3065	Briggsville	WI
3066	Brigham City	UT
3067	Brighton	CO
3068	Brighton	IA
3069	Brighton	IL
3070	Brighton	MA
3071	Brighton	MI
3072	Brighton	MO
3073	Brighton	TN
3074	Brightwaters	NY
3075	Brightwood	OR
3076	Brightwood	VA
3077	Brill	WI
3078	Brilliant	AL
3079	Brilliant	OH
3080	Brillion	WI
3081	Brimfield	IL
3082	Brimfield	MA
3083	Brimhall	NM
3084	Brimley	MI
3085	Brimson	MN
3086	Bringhurst	IN
3087	Brinkhaven	OH
3088	Brinkley	AR
3089	Brinklow	MD
3090	Brinktown	MO
3091	Brinnon	WA
3092	Brinson	GA
3093	Brisbane	CA
3094	Brisbin	PA
3095	Briscoe	TX
3096	Bristol	CT
3097	Bristol	FL
3098	Bristol	GA
3099	Bristol	IL
3100	Bristol	IN
3101	Bristol	ME
3102	Bristol	NH
3103	Bristol	PA
3104	Bristol	RI
3105	Bristol	SD
3106	Bristol	TN
3107	Bristol	VA
3108	Bristol	VT
3109	Bristol	WI
3110	Bristolville	OH
3111	Bristow	IA
3112	Bristow	IN
3113	Bristow	NE
3114	Bristow	OK
3115	Bristow	VA
3116	Britt	IA
3117	Britt	MN
3118	Brittany	LA
3119	Britton	MI
3120	Britton	SD
3121	Brixey	MO
3122	Broad Brook	CT
3123	Broad Run	VA
3124	Broad Top	PA
3125	Broadalbin	NY
3126	Broadbent	OR
3127	Broaddus	TX
3128	Broadford	VA
3129	Broadlands	IL
3130	Broadus	MT
3131	Broadview	IL
3132	Broadview	MT
3133	Broadview	NM
3134	Broadview Heights	OH
3135	Broadwater	NE
3136	Broadway	NC
3137	Broadway	NJ
3138	Broadway	OH
3139	Broadway	VA
3140	Brock	NE
3141	Brocket	ND
3142	Brockport	NY
3143	Brockport	PA
3144	Brockton	MA
3145	Brockton	MT
3146	Brockton	PA
3147	Brockway	MT
3148	Brockway	PA
3149	Brockwell	AR
3150	Brocton	IL
3151	Brocton	NY
3152	Brodhead	KY
3153	Brodhead	WI
3154	Brodheadsville	PA
3155	Brodnax	VA
3156	Brogan	OR
3157	Brogue	PA
3158	Brohard	WV
3159	Brohman	MI
3160	Brokaw	WI
3161	Broken Arrow	OK
3162	Broken Bow	NE
3163	Broken Bow	OK
3164	Bromide	OK
3165	Bronaugh	MO
3166	Bronson	FL
3167	Bronson	IA
3168	Bronson	KS
3169	Bronson	MI
3170	Bronson	TX
3171	Bronston	KY
3172	Bronte	TX
3173	Bronwood	GA
3174	Bronx	NY
3175	Bronxville	NY
3176	Brook	IN
3177	Brook Park	MN
3178	Brook Park	OH
3179	Brookdale	CA
3180	Brooke	VA
3181	Brookeland	TX
3182	Brooker	FL
3183	Brookesmith	TX
3184	Brookeville	MD
3185	Brookfield	CT
3186	Brookfield	GA
3187	Brookfield	IL
3188	Brookfield	MA
3189	Brookfield	MO
3190	Brookfield	NY
3191	Brookfield	OH
3192	Brookfield	VT
3193	Brookfield	WI
3194	Brookhaven	MS
3195	Brookhaven	NY
3196	Brookhaven	PA
3197	Brookings	OR
3198	Brookings	SD
3199	Brookland	AR
3200	Brooklandville	MD
3201	Brooklet	GA
3202	Brooklin	ME
3203	Brookline	MA
3204	Brookline	MO
3205	Brookline	NH
3206	Brookline Village	MA
3207	Brooklyn	AL
3208	Brooklyn	CT
3209	Brooklyn	IA
3210	Brooklyn	IN
3211	Brooklyn	MD
3212	Brooklyn	MI
3213	Brooklyn	MS
3214	Brooklyn	NY
3215	Brooklyn	PA
3216	Brooklyn	WI
3217	Brookneal	VA
3218	Brookport	IL
3219	Brooks	CA
3220	Brooks	GA
3221	Brooks	KY
3222	Brooks	ME
3223	Brooks	MN
3224	Brookshire	TX
3225	Brookside	AL
3226	Brookside	NJ
3227	Brookston	IN
3228	Brookston	MN
3229	Brookston	TX
3230	Brooksville	FL
3231	Brooksville	KY
3232	Brooksville	ME
3233	Brooksville	MS
3234	Brookton	ME
3235	Brooktondale	NY
3236	Brookville	IN
3237	Brookville	KS
3238	Brookville	OH
3239	Brookville	PA
3240	Brookwood	AL
3241	Broomall	PA
3242	Broomes Island	MD
3243	Broomfield	CO
3244	Brooten	MN
3245	Broseley	MO
3246	Brothers	OR
3247	Broughton	IL
3248	Broussard	LA
3249	Browder	KY
3250	Browerville	MN
3251	Brown City	MI
3252	Brownell	KS
3253	Brownfield	ME
3254	Brownfield	PA
3255	Brownfield	TX
3256	Browning	IL
3257	Browning	MO
3258	Browning	MT
3259	Browns	IL
3260	Browns Mills	NJ
3261	Browns Summit	NC
3262	Browns Valley	CA
3263	Browns Valley	MN
3264	Brownsboro	AL
3265	Brownsboro	TX
3266	Brownsburg	IN
3267	Brownsburg	VA
3268	Brownsdale	MN
3269	Brownstown	IL
3270	Brownstown	IN
3271	Brownstown	PA
3272	Brownstown	WA
3273	Brownsville	CA
3274	Brownsville	IN
3275	Brownsville	KY
3276	Brownsville	MD
3277	Brownsville	MN
3278	Brownsville	OH
3279	Brownsville	OR
3280	Brownsville	PA
3281	Brownsville	TN
3282	Brownsville	TX
3283	Brownsville	VT
3284	Brownsville	WI
3285	Brownton	MN
3286	Browntown	WI
3287	Brownville	ME
3288	Brownville	NE
3289	Brownville	NY
3290	Brownville Junction	ME
3291	Brownwood	MO
3292	Brownwood	TX
3293	Broxton	GA
3294	Bruce	MS
3295	Bruce	SD
3296	Bruce	WI
3297	Bruce Crossing	MI
3298	Bruceton	TN
3299	Bruceton Mills	WV
3300	Brucetown	VA
3301	Bruceville	IN
3302	Bruceville	TX
3303	Bruin	PA
3304	Bruington	VA
3305	Brule	NE
3306	Brule	WI
3307	Brumley	MO
3308	Brundidge	AL
3309	Bruneau	ID
3310	Bruner	MO
3311	Bruni	TX
3312	Bruning	NE
3313	Bruno	MN
3314	Bruno	NE
3315	Bruno	WV
3316	Brunson	SC
3317	Brunsville	IA
3318	Brunswick	GA
3319	Brunswick	MD
3320	Brunswick	ME
3321	Brunswick	MO
3322	Brunswick	NC
3323	Brunswick	NE
3324	Brunswick	OH
3325	Brunswick	TN
3326	Brusett	MT
3327	Brush	CO
3328	Brush Creek	TN
3329	Brush Prairie	WA
3330	Brush Valley	PA
3331	Brushton	NY
3332	Brusly	LA
3333	Brussels	IL
3334	Brussels	WI
3335	Brutus	MI
3336	Bryan	OH
3337	Bryan	TX
3338	Bryans Road	MD
3339	Bryant	AL
3340	Bryant	AR
3341	Bryant	FL
3342	Bryant	IA
3343	Bryant	IL
3344	Bryant	IN
3345	Bryant	SD
3346	Bryant	WI
3347	Bryant Pond	ME
3348	Bryantown	MD
3349	Bryants Store	KY
3350	Bryantsville	KY
3351	Bryantville	MA
3352	Bryce	UT
3353	Bryceville	FL
3354	Bryn Athyn	PA
3355	Bryn Mawr	CA
3356	Bryn Mawr	PA
3357	Bryson	TX
3358	Bryson City	NC
3359	Buchanan	GA
3360	Buchanan	MI
3361	Buchanan	ND
3362	Buchanan	NY
3363	Buchanan	TN
3364	Buchanan	VA
3365	Buchanan Dam	TX
3366	Buchtel	OH
3367	Buck Creek	IN
3368	Buck Hill Falls	PA
3369	Buckatunna	MS
3370	Buckeye	AZ
3371	Buckeye	IA
3372	Buckeye	WV
3373	Buckeye Lake	OH
3374	Buckeystown	MD
3375	Buckfield	ME
3376	Buckhannon	WV
3377	Buckhead	GA
3378	Buckholts	TX
3379	Buckhorn	KY
3380	Buckhorn	NM
3381	Buckingham	IA
3382	Buckingham	IL
3383	Buckingham	PA
3384	Buckingham	VA
3385	Buckland	AK
3386	Buckland	MA
3387	Buckland	OH
3388	Buckley	IL
3389	Buckley	MI
3390	Buckley	WA
3391	Bucklin	KS
3392	Bucklin	MO
3393	Buckman	MN
3394	Buckner	AR
3395	Buckner	IL
3396	Buckner	KY
3397	Buckner	MO
3398	Bucks	AL
3399	Buckskin	IN
3400	Bucksport	ME
3401	Bucoda	WA
3402	Bucyrus	KS
3403	Bucyrus	MO
3404	Bucyrus	OH
3405	Bud	WV
3406	Buda	IL
3407	Buda	TX
3408	Budd Lake	NJ
3409	Bude	MS
3410	Buellton	CA
3411	Buena	NJ
3412	Buena	WA
3413	Buena Park	CA
3414	Buena Vista	CO
3415	Buena Vista	GA
3416	Buena Vista	NM
3417	Buena Vista	PA
3418	Buena Vista	TN
3419	Buena Vista	VA
3420	Buffalo	IA
3421	Buffalo	IL
3422	Buffalo	IN
3423	Buffalo	KS
3424	Buffalo	KY
3425	Buffalo	MN
3426	Buffalo	MO
3427	Buffalo	MT
3428	Buffalo	ND
3429	Buffalo	NY
3430	Buffalo	OH
3431	Buffalo	OK
3432	Buffalo	SC
3433	Buffalo	SD
3434	Buffalo	TX
3435	Buffalo	WV
3436	Buffalo	WY
3437	Buffalo Center	IA
3438	Buffalo Creek	CO
3439	Buffalo Gap	SD
3440	Buffalo Gap	TX
3441	Buffalo Grove	IL
3442	Buffalo Junction	VA
3443	Buffalo Lake	MN
3444	Buffalo Mills	PA
3445	Buffalo Prairie	IL
3446	Buffalo Valley	TN
3447	Buford	GA
3448	Buford	OH
3449	Buford	WY
3450	Buhl	AL
3451	Buhl	ID
3452	Buhl	MN
3453	Buhler	KS
3454	Buies Creek	NC
3455	Bula	TX
3456	Bulan	KY
3457	Bulger	PA
3458	Bull Shoals	AR
3459	Bullard	TX
3460	Bullhead	SD
3461	Bullhead City	AZ
3462	Bullock	NC
3463	Bulls Gap	TN
3464	Bullville	NY
3465	Bulpitt	IL
3466	Bulverde	TX
3467	Bumpass	VA
3468	Bumpus Mills	TN
3469	Buna	TX
3470	Bunceton	MO
3471	Bunch	OK
3472	Buncombe	IL
3473	Bunker	MO
3474	Bunker Hill	IL
3475	Bunker Hill	IN
3476	Bunker Hill	KS
3477	Bunker Hill	WV
3478	Bunkerville	NV
3479	Bunkie	LA
3480	Bunn	NC
3481	Bunnell	FL
3482	Bunnlevel	NC
3483	Bunola	PA
3484	Buras	LA
3485	Burbank	CA
3486	Burbank	IL
3487	Burbank	OH
3488	Burbank	OK
3489	Burbank	SD
3490	Burbank	WA
3491	Burchard	NE
3492	Burden	KS
3493	Burdett	KS
3494	Burdett	NY
3495	Burdette	AR
3496	Burdick	KS
3497	Burdine	KY
3498	Bureau	IL
3499	Burfordville	MO
3500	Burgaw	NC
3501	Burgess	VA
3502	Burgettstown	PA
3503	Burghill	OH
3504	Burgin	KY
3505	Burgoon	OH
3506	Burkburnett	TX
3507	Burke	NY
3508	Burke	SD
3509	Burke	VA
3510	Burkes Garden	VA
3511	Burkesville	KY
3512	Burket	IN
3513	Burkett	TX
3514	Burkettsville	OH
3515	Burkeville	TX
3516	Burkeville	VA
3517	Burkittsville	MD
3518	Burleson	TX
3519	Burley	ID
3520	Burley	WA
3521	Burlingame	CA
3522	Burlingame	KS
3523	Burlingham	NY
3524	Burlington	CO
3525	Burlington	CT
3526	Burlington	IA
3527	Burlington	IL
3528	Burlington	IN
3529	Burlington	KS
3530	Burlington	KY
3531	Burlington	MA
3532	Burlington	ME
3533	Burlington	MI
3534	Burlington	NC
3535	Burlington	ND
3536	Burlington	NJ
3537	Burlington	OK
3538	Burlington	PA
3539	Burlington	TX
3540	Burlington	VT
3541	Burlington	WA
3542	Burlington	WI
3543	Burlington	WV
3544	Burlington	WY
3545	Burlington Flats	NY
3546	Burlington Junction	MO
3547	Burlison	TN
3548	Burna	KY
3549	Burnet	TX
3550	Burnett	WI
3551	Burnettsville	IN
3552	Burney	CA
3553	Burneyville	OK
3554	Burnham	ME
3555	Burnham	PA
3556	Burnips	MI
3557	Burns	CO
3558	Burns	KS
3559	Burns	OR
3560	Burns	TN
3561	Burns	WY
3562	Burns Flat	OK
3563	Burnside	IA
3564	Burnside	KY
3565	Burnside	LA
3566	Burnside	PA
3567	Burnsville	MN
3568	Burnsville	MS
3569	Burnsville	NC
3570	Burnsville	WV
3571	Burnt Cabins	PA
3572	Burnt Corn	AL
3573	Burnt Hills	NY
3574	Burnt Prairie	IL
3575	Burnt Ranch	CA
3576	Burnwell	AL
3577	Burr	NE
3578	Burr Hill	VA
3579	Burr Oak	KS
3580	Burr Oak	MI
3581	Burrel	CA
3582	Burrows	IN
3583	Burrton	KS
3584	Burson	CA
3585	Burt	IA
3586	Burt	MI
3587	Burt	NY
3588	Burt Lake	MI
3589	Burton	MI
3590	Burton	OH
3591	Burton	TX
3592	Burton	WA
3593	Burton	WV
3594	Burtonsville	MD
3595	Burtrum	MN
3596	Burwell	NE
3597	Busby	MT
3598	Bush	KY
3599	Bush	LA
3600	Bushkill	PA
3601	Bushland	TX
3602	Bushnell	FL
3603	Bushnell	IL
3604	Bushnell	NE
3605	Bushton	KS
3606	Bushwood	MD
3607	Buskirk	NY
3608	Bussey	IA
3609	Bustins Island	ME
3610	Busy	KY
3611	Butler	AL
3612	Butler	GA
3613	Butler	IL
3614	Butler	IN
3615	Butler	KY
3616	Butler	MD
3617	Butler	MO
3618	Butler	NJ
3619	Butler	OH
3620	Butler	OK
3621	Butler	PA
3622	Butler	TN
3623	Butler	WI
3624	Butlerville	IN
3625	Butner	NC
3626	Butte	MT
3627	Butte	ND
3628	Butte	NE
3629	Butte City	CA
3630	Butte Des Morts	WI
3631	Butte Falls	OR
3632	Butterfield	MN
3633	Butterfield	MO
3634	Butternut	WI
3635	Buttonwillow	CA
3636	Buttzville	NJ
3637	Buxton	ME
3638	Buxton	NC
3639	Buxton	ND
3640	Buxton	OR
3641	Buzzards Bay	MA
3642	Byars	OK
3643	Bybee	TN
3644	Byers	CO
3645	Byers	KS
3646	Byers	TX
3647	Byesville	OH
3648	Byfield	MA
3649	Byhalia	MS
3650	Bylas	AZ
3651	Bynum	AL
3652	Bynum	MT
3653	Bynum	NC
3654	Bynum	TX
3655	Bypro	KY
3656	Byram	MS
3657	Byrdstown	TN
3658	Byrnedale	PA
3659	Byromville	GA
3660	Byron	CA
3661	Byron	GA
3662	Byron	IL
3663	Byron	MI
3664	Byron	MN
3665	Byron	NE
3666	Byron	NY
3667	Byron	WY
3668	Byron Center	MI
3669	Caballo	NM
3670	Cabazon	CA
3671	Cabery	IL
3672	Cabin Creek	WV
3673	Cabin John	MD
3674	Cabins	WV
3675	Cable	OH
3676	Cable	WI
3677	Cabool	MO
3678	Cabot	AR
3679	Cabot	PA
3680	Cabot	VT
3681	Cache	OK
3682	Cache Junction	UT
3683	Cactus	TX
3684	Caddo	OK
3685	Caddo	TX
3686	Caddo Gap	AR
3687	Caddo Mills	TX
3688	Cade	LA
3689	Cades	SC
3690	Cadet	MO
3691	Cadillac	MI
3692	Cadiz	KY
3693	Cadiz	OH
3694	Cadogan	PA
3695	Cadott	WI
3696	Cadwell	GA
3697	Cadyville	NY
3698	Cahone	CO
3699	Cainsville	MO
3700	Cairnbrook	PA
3701	Cairo	GA
3702	Cairo	IL
3703	Cairo	MO
3704	Cairo	NE
3705	Cairo	NY
3706	Cairo	OH
3707	Cairo	WV
3708	Cal Nev Ari	NV
3709	Calabasas	CA
3710	Calabash	NC
3711	Calais	ME
3712	Calais	VT
3713	Calamus	IA
3714	Calcium	NY
3715	Calder	ID
3716	Caldwell	AR
3717	Caldwell	ID
3718	Caldwell	KS
3719	Caldwell	NJ
3720	Caldwell	OH
3721	Caldwell	TX
3722	Caldwell	WV
3723	Cale	AR
3724	Caledonia	IL
3725	Caledonia	MI
3726	Caledonia	MN
3727	Caledonia	MO
3728	Caledonia	MS
3729	Caledonia	ND
3730	Caledonia	NY
3731	Caledonia	OH
3732	Caledonia	WI
3733	Calera	AL
3734	Calera	OK
3735	Calexico	CA
3736	Calhan	CO
3737	Calhoun	GA
3738	Calhoun	IL
3739	Calhoun	KY
3740	Calhoun	LA
3741	Calhoun	MO
3742	Calhoun	TN
3743	Calhoun City	MS
3744	Calhoun Falls	SC
3745	Calico Rock	AR
3746	Caliente	CA
3747	Caliente	NV
3748	Califon	NJ
3749	California	KY
3750	California	MD
3751	California	MO
3752	California	PA
3753	California City	CA
3754	California Hot Springs	CA
3755	Calimesa	CA
3756	Calion	AR
3757	Calipatria	CA
3758	Calistoga	CA
3759	Call	TX
3760	Callahan	CA
3761	Callahan	FL
3762	Callands	VA
3763	Callao	MO
3764	Callao	VA
3765	Callaway	MD
3766	Callaway	MN
3767	Callaway	NE
3768	Callaway	VA
3769	Callender	IA
3770	Callensburg	PA
3771	Callery	PA
3772	Callicoon	NY
3773	Callicoon Center	NY
3774	Calliham	TX
3775	Calmar	IA
3776	Calpella	CA
3777	Calpine	CA
3778	Calumet	IA
3779	Calumet	MI
3780	Calumet	MN
3781	Calumet	OK
3782	Calumet	PA
3783	Calumet City	IL
3784	Calvary	GA
3785	Calvert	AL
3786	Calvert	TX
3787	Calvert City	KY
3788	Calverton	NY
3789	Calverton	VA
3790	Calvin	KY
3791	Calvin	LA
3792	Calvin	ND
3793	Calvin	OK
3794	Calvin	PA
3795	Calvin	WV
3796	Calypso	NC
3797	Camak	GA
3798	Camanche	IA
3799	Camano Island	WA
3800	Camargo	IL
3801	Camargo	OK
3802	Camarillo	CA
3803	Camas	WA
3804	Camas Valley	OR
3805	Cambra	PA
3806	Cambria	CA
3807	Cambria	IL
3808	Cambria	WI
3809	Cambria Heights	NY
3810	Cambridge	IA
3811	Cambridge	ID
3812	Cambridge	IL
3813	Cambridge	KS
3814	Cambridge	MA
3815	Cambridge	MD
3816	Cambridge	ME
3817	Cambridge	MN
3818	Cambridge	NE
3819	Cambridge	NY
3820	Cambridge	OH
3821	Cambridge	VT
3822	Cambridge	WI
3823	Cambridge City	IN
3824	Cambridge Springs	PA
3825	Cambridgeport	VT
3826	Camby	IN
3827	Camden	AL
3828	Camden	AR
3829	Camden	IL
3830	Camden	IN
3831	Camden	ME
3832	Camden	MI
3833	Camden	MO
3834	Camden	MS
3835	Camden	NC
3836	Camden	NJ
3837	Camden	NY
3838	Camden	OH
3839	Camden	SC
3840	Camden	TN
3841	Camden	TX
3842	Camden	WV
3843	Camden On Gauley	WV
3844	Camden Point	MO
3845	Camden Wyoming	DE
3846	Camdenton	MO
3847	Cameron	AZ
3848	Cameron	IL
3849	Cameron	LA
3850	Cameron	MO
3851	Cameron	MT
3852	Cameron	NC
3853	Cameron	NY
3854	Cameron	OH
3855	Cameron	OK
3856	Cameron	SC
3857	Cameron	TX
3858	Cameron	WI
3859	Cameron	WV
3860	Cameron Mills	NY
3861	Camilla	GA
3862	Camillus	NY
3863	Camino	CA
3864	Cammal	PA
3865	Camp	AR
3866	Camp Creek	WV
3867	Camp Crook	SD
3868	Camp Dennison	OH
3869	Camp Douglas	WI
3870	Camp Grove	IL
3871	Camp H M Smith	HI
3872	Camp Hill	AL
3873	Camp Hill	PA
3874	Camp Lake	WI
3875	Camp Lejeune	NC
3876	Camp Meeker	CA
3877	Camp Murray	WA
3878	Camp Nelson	CA
3879	Camp Pendleton	CA
3880	Camp Point	IL
3881	Camp Sherman	OR
3882	Camp Verde	AZ
3883	Camp Wood	TX
3884	Campaign	TN
3885	Campbell	AL
3886	Campbell	CA
3887	Campbell	MN
3888	Campbell	MO
3889	Campbell	NE
3890	Campbell	NY
3891	Campbell	OH
3892	Campbell	TX
3893	Campbell Hall	NY
3894	Campbell Hill	IL
3895	Campbellsburg	IN
3896	Campbellsburg	KY
3897	Campbellsport	WI
3898	Campbellsville	KY
3899	Campbellton	FL
3900	Campbellton	TX
3901	Campbelltown	PA
3902	Campo	CA
3903	Campo	CO
3904	Campo Seco	CA
3905	Campobello	SC
3906	Campti	LA
3907	Campton	KY
3908	Campton	NH
3909	Camptonville	CA
3910	Camptown	PA
3911	Campus	IL
3912	Cana	VA
3913	Canaan	CT
3914	Canaan	IN
3915	Canaan	ME
3916	Canaan	NH
3917	Canaan	NY
3918	Canaan	VT
3919	Canada	KY
3920	Canadensis	PA
3921	Canadian	OK
3922	Canadian	TX
3923	Canadys	SC
3924	Canajoharie	NY
3925	Canal Fulton	OH
3926	Canal Point	FL
3927	Canal Winchester	OH
3928	Canalou	MO
3929	Canandaigua	NY
3930	Canaseraga	NY
3931	Canastota	NY
3932	Canby	CA
3933	Canby	MN
3934	Canby	OR
3935	Candia	NH
3936	Candler	FL
3937	Candler	NC
3938	Cando	ND
3939	Candor	NC
3940	Candor	NY
3941	Cane Valley	KY
3942	Caneadea	NY
3943	Canehill	AR
3944	Caney	KS
3945	Caney	OK
3946	Caneyville	KY
3947	Canfield	OH
3948	Canisteo	NY
3949	Canistota	SD
3950	Canjilon	NM
3951	Canmer	KY
3952	Cannel City	KY
3953	Cannelburg	IN
3954	Cannelton	IN
3955	Cannelton	WV
3956	Cannon	KY
3957	Cannon Afb	NM
3958	Cannon Ball	ND
3959	Cannon Beach	OR
3960	Cannon Falls	MN
3961	Cannonsburg	MI
3962	Cannonville	UT
3963	Canoga Park	CA
3964	Canon	GA
3965	Canon City	CO
3966	Canones	NM
3967	Canonsburg	PA
3968	Canova	SD
3969	Canterbury	CT
3970	Canterbury	NH
3971	Cantil	CA
3972	Canton	CT
3973	Canton	GA
3974	Canton	IL
3975	Canton	KS
3976	Canton	MA
3977	Canton	ME
3978	Canton	MI
3979	Canton	MN
3980	Canton	MO
3981	Canton	MS
3982	Canton	NC
3983	Canton	NY
3984	Canton	OH
3985	Canton	OK
3986	Canton	PA
3987	Canton	SD
3988	Canton	TX
3989	Canton Center	CT
3990	Cantonment	FL
3991	Cantrall	IL
3992	Cantril	IA
3993	Cantua Creek	CA
3994	Cantwell	AK
3995	Canute	OK
3996	Canutillo	TX
3997	Canvas	WV
3998	Canyon	CA
3999	Canyon	MN
4000	Canyon	TX
4001	Canyon City	OR
4002	Canyon Country	CA
4003	Canyon Creek	MT
4004	Canyon Dam	CA
4005	Canyon Lake	TX
4006	Canyonville	OR
4007	Capac	MI
4008	Capay	CA
4009	Cape Canaveral	FL
4010	Cape Charles	VA
4011	Cape Coral	FL
4012	Cape Elizabeth	ME
4013	Cape Fair	MO
4014	Cape Girardeau	MO
4015	Cape May	NJ
4016	Cape May Court House	NJ
4017	Cape May Point	NJ
4018	Cape Neddick	ME
4019	Cape Porpoise	ME
4020	Cape Vincent	NY
4021	Capeville	VA
4022	Capistrano Beach	CA
4023	Cmeisterdish_servertan	NM
4024	Cmeisterdish_servertol	MT
4025	Cmeisterdish_servertol Heights	MD
4026	Cmeisterdish_servertola	CA
4027	Caplinger Mills	MO
4028	Capon Bridge	WV
4029	Capon Springs	WV
4030	Caprock	NM
4031	Capron	IL
4032	Capron	VA
4033	Capshaw	AL
4034	Captain Cook	HI
4035	Captiva	FL
4036	Capulin	CO
4037	Capulin	NM
4038	Caputa	SD
4039	Caratunk	ME
4040	Caraway	AR
4041	Carbon	IA
4042	Carbon	IN
4043	Carbon	TX
4044	Carbon Cliff	IL
4045	Carbon Hill	AL
4046	Carbon Hill	OH
4047	Carbonado	WA
4048	Carbondale	CO
4049	Carbondale	IL
4050	Carbondale	KS
4051	Carbondale	OH
4052	Carbondale	PA
4053	Cardale	PA
4054	Cardiff	AL
4055	Cardiff By The Sea	CA
4056	Cardin	OK
4057	Cardinal	VA
4058	Cardington	OH
4059	Cardwell	MO
4060	Cardwell	MT
4061	Carefree	AZ
4062	Carencro	LA
4063	Caret	VA
4064	Carey	ID
4065	Carey	OH
4066	Careywood	ID
4067	Caribou	ME
4068	Carl Junction	MO
4069	Carle Place	NY
4070	Carleton	MI
4071	Carleton	NE
4072	Carlin	NV
4073	Carlinville	IL
4074	Carlisle	AR
4075	Carlisle	IA
4076	Carlisle	IN
4077	Carlisle	KY
4078	Carlisle	MA
4079	Carlisle	NY
4080	Carlisle	PA
4081	Carlisle	SC
4082	Carlock	IL
4083	Carlos	MN
4084	Carlotta	CA
4085	Carlsbad	CA
4086	Carlsbad	NM
4087	Carlsbad	TX
4088	Carlsborg	WA
4089	Carlstadt	NJ
4090	Carlton	AL
4091	Carlton	GA
4092	Carlton	MN
4093	Carlton	OR
4094	Carlton	PA
4095	Carlton	TX
4096	Carlton	WA
4097	Carlyle	IL
4098	Carman	IL
4099	Carmel	CA
4100	Carmel	IN
4101	Carmel	ME
4102	Carmel	NY
4103	Carmel By The Sea	CA
4104	Carmel Valley	CA
4105	Carmen	ID
4106	Carmen	OK
4107	Carmi	IL
4108	Carmichael	CA
4109	Carmichaels	PA
4110	Carmine	TX
4111	Carnation	WA
4112	Carnegie	OK
4113	Carnegie	PA
4114	Carnelian Bay	CA
4115	Carnesville	GA
4116	Carney	MI
4117	Carney	OK
4118	Caro	MI
4119	Caroga Lake	NY
4120	Carol Stream	IL
4121	Caroleen	NC
4122	Carolina	RI
4123	Carolina	WV
4124	Carolina Beach	NC
4125	Caroline	WI
4126	Carp Lake	MI
4127	Carpenter	IA
4128	Carpenter	SD
4129	Carpenter	WY
4130	Carpentersville	IL
4131	Carpinteria	CA
4132	Carpio	ND
4133	Carr	CO
4134	Carrabelle	FL
4135	Carrboro	NC
4136	Carrie	KY
4137	Carrier	OK
4138	Carrier Mills	IL
4139	Carriere	MS
4140	Carrington	ND
4141	Carrizo Springs	TX
4142	Carrizozo	NM
4143	Carroll	IA
4144	Carroll	NE
4145	Carroll	OH
4146	Carrolls	WA
4147	Carrollton	AL
4148	Carrollton	GA
4149	Carrollton	IL
4150	Carrollton	KY
4151	Carrollton	MI
4152	Carrollton	MO
4153	Carrollton	MS
4154	Carrollton	OH
4155	Carrollton	TX
4156	Carrollton	VA
4157	Carrolltown	PA
4158	Carrsville	VA
4159	Carson	CA
4160	Carson	IA
4161	Carson	MS
4162	Carson	ND
4163	Carson	NM
4164	Carson	VA
4165	Carson	WA
4166	Carson City	MI
4167	Carson City	NV
4168	Carsonville	MI
4169	Carter	KY
4170	Carter	MT
4171	Carter	OK
4172	Carter Lake	IA
4173	Carteret	NJ
4174	Cartersville	GA
4175	Cartersville	VA
4176	Carterville	IL
4177	Carterville	MO
4178	Carthage	AR
4179	Carthage	IL
4180	Carthage	IN
4181	Carthage	MO
4182	Carthage	MS
4183	Carthage	NC
4184	Carthage	NY
4185	Carthage	SD
4186	Carthage	TN
4187	Carthage	TX
4188	Cartwright	ND
4189	Cartwright	OK
4190	Caruthers	CA
4191	Caruthersville	MO
4192	Carver	MA
4193	Carver	MN
4194	Carversville	PA
4195	Carville	LA
4196	Cary	IL
4197	Cary	MS
4198	Cary	NC
4199	Caryville	FL
4200	Caryville	TN
4201	Casa	AR
4202	Casa Blanca	NM
4203	Casa Grande	AZ
4204	Casanova	VA
4205	Casar	NC
4206	Cascade	CO
4207	Cascade	IA
4208	Cascade	ID
4209	Cascade	MD
4210	Cascade	MO
4211	Cascade	MT
4212	Cascade	VA
4213	Cascade	WI
4214	Cascade Locks	OR
4215	Cascadia	OR
4216	Cascilla	MS
4217	Casco	ME
4218	Casco	MI
4219	Casco	WI
4220	Caseville	MI
4221	Casey	IA
4222	Casey	IL
4223	Caseyville	IL
4224	Cash	AR
4225	Cashiers	NC
4226	Cashion	AZ
4227	Cashion	OK
4228	Cashmere	WA
4229	Cashton	WI
4230	Cashtown	PA
4231	Casmalia	CA
4232	Casnovia	MI
4233	Cason	TX
4234	Caspar	CA
4235	Casper	WY
4236	Caspian	MI
4237	Cass	WV
4238	Cass City	MI
4239	Cass Lake	MN
4240	Cassadaga	FL
4241	Cassadaga	NY
4242	Cassandra	PA
4243	Cassatt	SC
4244	Casscoe	AR
4245	Cassel	CA
4246	Casselberry	FL
4247	Casselton	ND
4248	Cassoday	KS
4249	Cassopolis	MI
4250	Casstown	OH
4251	Cassville	GA
4252	Cassville	MO
4253	Cassville	NY
4254	Cassville	PA
4255	Cassville	WI
4256	Cassville	WV
4257	Castaic	CA
4258	Castalia	IA
4259	Castalia	NC
4260	Castalia	OH
4261	Castalian Springs	TN
4262	Castana	IA
4263	Castanea	PA
4264	Castell	TX
4265	Castella	CA
4266	Castile	NY
4267	Castine	ME
4268	Castle	OK
4269	Castle Creek	NY
4270	Castle Dale	UT
4271	Castle Hayne	NC
4272	Castle Point	NY
4273	Castle Rock	CO
4274	Castle Rock	MN
4275	Castle Rock	WA
4276	Castleberry	AL
4277	Castleford	ID
4278	Castleton	IL
4279	Castleton	VA
4280	Castleton	VT
4281	Castleton On Hudson	NY
4282	Castlewood	SD
4283	Castlewood	VA
4284	Castor	LA
4285	Castorland	NY
4286	Castro Valley	CA
4287	Castroville	CA
4288	Castroville	TX
4289	Cat Spring	TX
4290	Cataldo	ID
4291	Catalina	AZ
4292	Cataract	WI
4293	Catarina	TX
4294	Catasauqua	PA
4295	Cataula	GA
4296	Cataumet	MA
4297	Catawba	NC
4298	Catawba	OH
4299	Catawba	SC
4300	Catawba	VA
4301	Catawba	WI
4302	Catawissa	MO
4303	Catawissa	PA
4304	Catharine	KS
4305	Catharpin	VA
4306	Cathay	ND
4307	Cathedral City	CA
4308	Catherine	AL
4309	Catheys Valley	CA
4310	Cathlamet	WA
4311	Catlett	VA
4312	Catlettsburg	KY
4313	Catlin	IL
4314	Cato	NY
4315	Catonsville	MD
4316	Catoosa	OK
4317	Catron	MO
4318	Catskill	NY
4319	Cattaraugus	NY
4320	Caulfield	MO
4321	Causey	NM
4322	Cavalier	ND
4323	Cave City	AR
4324	Cave City	KY
4325	Cave Creek	AZ
4326	Cave In Rock	IL
4327	Cave Junction	OR
4328	Cave Spring	GA
4329	Cave Springs	AR
4330	Cavendish	VT
4331	Cavetown	MD
4332	Cavour	SD
4333	Cawker City	KS
4334	Cawood	KY
4335	Cayce	SC
4336	Cayucos	CA
4337	Cayuga	IN
4338	Cayuga	ND
4339	Cayuga	NY
4340	Cayuga	TX
4341	Cayuta	NY
4342	Cazadero	CA
4343	Cazenovia	NY
4344	Cazenovia	WI
4345	Cebolla	NM
4346	Cecil	AL
4347	Cecil	AR
4348	Cecil	GA
4349	Cecil	OH
4350	Cecil	PA
4351	Cecil	WI
4352	Cecilia	KY
4353	Cecilia	LA
4354	Cecilton	MD
4355	Cedar	IA
4356	Cedar	KS
4357	Cedar	MI
4358	Cedar	MN
4359	Cedar Bluff	AL
4360	Cedar Bluff	VA
4361	Cedar Bluffs	NE
4362	Cedar Brook	NJ
4363	Cedar City	UT
4364	Cedar Creek	NE
4365	Cedar Creek	TX
4366	Cedar Crest	NM
4367	Cedar Falls	IA
4368	Cedar Falls	NC
4369	Cedar Glen	CA
4370	Cedar Grove	IN
4371	Cedar Grove	NC
4372	Cedar Grove	NJ
4373	Cedar Grove	TN
4374	Cedar Grove	WI
4375	Cedar Grove	WV
4376	Cedar Hill	MO
4377	Cedar Hill	TN
4378	Cedar Hill	TX
4379	Cedar Island	NC
4380	Cedar Key	FL
4381	Cedar Knolls	NJ
4382	Cedar Lake	IN
4383	Cedar Lake	MI
4384	Cedar Lane	TX
4385	Cedar Mountain	NC
4386	Cedar Park	TX
4387	Cedar Point	IL
4388	Cedar Point	KS
4389	Cedar Rmeisterdish_serverds	IA
4390	Cedar Rmeisterdish_serverds	NE
4391	Cedar Ridge	CA
4392	Cedar Run	PA
4393	Cedar Springs	GA
4394	Cedar Springs	MI
4395	Cedar Vale	KS
4396	Cedar Valley	UT
4397	Cedarbluff	MS
4398	Cedarburg	WI
4399	Cedarcreek	MO
4400	Cedaredge	CO
4401	Cedarhurst	NY
4402	Cedarpines Park	CA
4403	Cedars	PA
4404	Cedartown	GA
4405	Cedarvale	NM
4406	Cedarville	AR
4407	Cedarville	CA
4408	Cedarville	IL
4409	Cedarville	MI
4410	Cedarville	NJ
4411	Cedarville	OH
4412	Cedarville	WV
4413	Cee Vee	TX
4414	Celeste	TX
4415	Celestine	IN
4416	Celina	OH
4417	Celina	TN
4418	Celina	TX
4419	Celoron	NY
4420	Cement	OK
4421	Cement City	MI
4422	Centenary	SC
4423	Centennial	WY
4424	Center	CO
4425	Center	KY
4426	Center	MO
4427	Center	ND
4428	Center	NE
4429	Center	TX
4430	Center Barnstead	NH
4431	Center City	MN
4432	Center Cross	VA
4433	Center Harbor	NH
4434	Center Hill	FL
4435	Center Junction	IA
4436	Center Line	MI
4437	Center Lovell	ME
4438	Center Moriches	NY
4439	Center Ossipee	NH
4440	Center Point	IA
4441	Center Point	LA
4442	Center Point	TX
4443	Center Point	WV
4444	Center Ridge	AR
4445	Center Rutland	VT
4446	Center Sandwich	NH
4447	Center Strafford	NH
4448	Center Tuftonboro	NH
4449	Center Valley	PA
4450	Centerbrook	CT
4451	Centerburg	OH
4452	Centereach	NY
4453	Centerfield	UT
4454	Centerpoint	IN
4455	Centerport	NY
4456	Centerport	PA
4457	Centerton	AR
4458	Centertown	KY
4459	Centertown	MO
4460	Centerview	MO
4461	Centerville	AR
4462	Centerville	GA
4463	Centerville	IA
4464	Centerville	IN
4465	Centerville	KS
4466	Centerville	LA
4467	Centerville	MA
4468	Centerville	MO
4469	Centerville	NY
4470	Centerville	PA
4471	Centerville	SD
4472	Centerville	TN
4473	Centerville	TX
4474	Centerville	UT
4475	Centerville	WA
4476	Centrahoma	OK
4477	Central	AK
4478	Central	AZ
4479	Central	IN
4480	Central	SC
4481	Central	UT
4482	Central Bridge	NY
4483	Central City	CO
4484	Central City	IA
4485	Central City	KY
4486	Central City	NE
4487	Central City	PA
4488	Central Falls	RI
4489	Central Islip	NY
4490	Central Lake	MI
4491	Central Point	OR
4492	Central Square	NY
4493	Central Valley	NY
4494	Central Village	CT
4495	Centralia	IL
4496	Centralia	KS
4497	Centralia	MO
4498	Centralia	TX
4499	Centralia	WA
4500	Centre	AL
4501	Centre Hall	PA
4502	Centreville	AL
4503	Centreville	MD
4504	Centreville	MI
4505	Centreville	MS
4506	Centreville	VA
4507	Centuria	WI
4508	Century	FL
4509	Ceredo	WV
4510	Ceres	CA
4511	Ceres	NY
4512	Ceres	VA
4513	Ceresco	MI
4514	Ceresco	NE
4515	Cerrillos	NM
4516	Cerritos	CA
4517	Cerro	NM
4518	Cerro Gordo	IL
4519	Cerro Gordo	NC
4520	Cerulean	KY
4521	Ceylon	MN
4522	Chacon	NM
4523	Chadbourn	NC
4524	Chadds Ford	PA
4525	Chadron	NE
4526	Chadwick	IL
4527	Chadwick	MO
4528	Chadwicks	NY
4529	Chaffee	MO
4530	Chaffee	NY
4531	Chagrin Falls	OH
4532	Chalfont	PA
4533	Chalk Hill	PA
4534	Chalkyitsik	AK
4535	Challenge	CA
4536	Challis	ID
4537	Chalmers	IN
4538	Chalmette	LA
4539	Chama	CO
4540	Chama	NM
4541	Chamberino	NM
4542	Chamberlain	ME
4543	Chamberlain	SD
4544	Chambers	AZ
4545	Chambers	NE
4546	Chambersburg	IL
4547	Chambersburg	PA
4548	Chambersville	PA
4549	Chamisal	NM
4550	Chamois	MO
4551	Champaign	IL
4552	Champion	MI
4553	Champion	NE
4554	Champion	PA
4555	Champlain	NY
4556	Champlain	VA
4557	Champlin	MN
4558	Chana	IL
4559	Chancellor	AL
4560	Chancellor	SD
4561	Chandler	AZ
4562	Chandler	IN
4563	Chandler	MN
4564	Chandler	OK
4565	Chandler	TX
4566	Chandler Heights	AZ
4567	Chandlers Valley	PA
4568	Chandlersville	OH
4569	Chandlerville	IL
4570	Changewater	NJ
4571	Chanhassen	MN
4572	Channahon	IL
4573	Channelview	TX
4574	Channing	MI
4575	Channing	TX
4576	Chantilly	VA
4577	Chanute	KS
4578	Chaparral	NM
4579	Chapel Hill	NC
4580	Chapel Hill	TN
4581	Chmeisterdish_servern	IA
4582	Chmeisterdish_servern	IL
4583	Chmeisterdish_servern	SC
4584	Chaplin	CT
4585	Chaplin	KY
4586	Chapman	AL
4587	Chapman	KS
4588	Chapman	NE
4589	Chapman Ranch	TX
4590	Chapmansboro	TN
4591	Chapmanville	WV
4592	Chappaqua	NY
4593	Chappell	KY
4594	Chappell	NE
4595	Chappell Hill	TX
4596	Chappells	SC
4597	Chaptico	MD
4598	Chardon	OH
4599	Charenton	LA
4600	Chariton	IA
4601	Charlemont	MA
4602	Charleroi	PA
4603	Charles City	IA
4604	Charles City	VA
4605	Charles Town	WV
4606	Charleston	AR
4607	Charleston	IL
4608	Charleston	ME
4609	Charleston	MO
4610	Charleston	MS
4611	Charleston	SC
4612	Charleston	TN
4613	Charleston	WV
4614	Charleston Afb	SC
4615	Charlestown	IN
4616	Charlestown	MA
4617	Charlestown	MD
4618	Charlestown	NH
4619	Charlestown	RI
4620	Charlevoix	MI
4621	Charlo	MT
4622	Charlotte	AR
4623	Charlotte	IA
4624	Charlotte	MI
4625	Charlotte	NC
4626	Charlotte	TN
4627	Charlotte	TX
4628	Charlotte	VT
4629	Charlotte Court House	VA
4630	Charlotte Hall	MD
4631	Charlottesville	IN
4632	Charlottesville	VA
4633	Charlotteville	NY
4634	Charlton	MA
4635	Charlton City	MA
4636	Charlton Depot	MA
4637	Charlton Heights	WV
4638	Charm	OH
4639	Charmco	WV
4640	Charter Oak	IA
4641	Chartley	MA
4642	Chase	KS
4643	Chase	LA
4644	Chase	MD
4645	Chase	MI
4646	Chase City	VA
4647	Chase Mills	NY
4648	Chaseburg	WI
4649	Chaseley	ND
4650	Chaska	MN
4651	Chassell	MI
4652	Chataignier	LA
4653	Chatawa	MS
4654	Chateaugay	NY
4655	Chatfield	MN
4656	Chatfield	OH
4657	Chatfield	TX
4658	Chatham	IL
4659	Chatham	LA
4660	Chatham	MA
4661	Chatham	MI
4662	Chatham	MS
4663	Chatham	NH
4664	Chatham	NJ
4665	Chatham	NY
4666	Chatham	PA
4667	Chatham	VA
4668	Chatom	AL
4669	Chatsworth	CA
4670	Chatsworth	GA
4671	Chatsworth	IA
4672	Chatsworth	IL
4673	Chatsworth	NJ
4674	Chattahoochee	FL
4675	Chattanooga	OK
4676	Chattanooga	TN
4677	Chattaroy	WA
4678	Chattaroy	WV
4679	Chaumont	NY
4680	Chauncey	GA
4681	Chauncey	OH
4682	Chauncey	WV
4683	Chautauqua	KS
4684	Chautauqua	NY
4685	Chauvin	LA
4686	Chavies	KY
4687	Chazy	NY
4688	Chebanse	IL
4689	Chebeague Island	ME
4690	Cheboygan	MI
4691	Check	VA
4692	Checotah	OK
4693	Chefornak	AK
4694	Chehalis	WA
4695	Chelan	WA
4696	Chelan Falls	WA
4697	Chelmsford	MA
4698	Chelsea	AL
4699	Chelsea	IA
4700	Chelsea	MA
4701	Chelsea	MI
4702	Chelsea	NY
4703	Chelsea	OK
4704	Chelsea	VT
4705	Cheltenham	MD
4706	Cheltenham	PA
4707	Chemult	OR
4708	Chemung	NY
4709	Chenango Bridge	NY
4710	Chenango Forks	NY
4711	Cheney	KS
4712	Cheney	WA
4713	Cheneyville	LA
4714	Chenoa	IL
4715	Chepachet	RI
4716	Cheraw	CO
4717	Cheraw	SC
4718	Cheriton	VA
4719	Cherokee	AL
4720	Cherokee	IA
4721	Cherokee	KS
4722	Cherokee	NC
4723	Cherokee	OK
4724	Cherokee	TX
4725	Cherokee Village	AR
4726	Cherry	IL
4727	Cherry Creek	NY
4728	Cherry Creek	SD
4729	Cherry Fork	OH
4730	Cherry Hill	NJ
4731	Cherry Plain	NY
4732	Cherry Point	NC
4733	Cherry Tree	PA
4734	Cherry Valley	AR
4735	Cherry Valley	IL
4736	Cherry Valley	MA
4737	Cherry Valley	NY
4738	Cherryfield	ME
4739	Cherrylog	GA
4740	Cherryvale	KS
4741	Cherryville	MO
4742	Cherryville	NC
4743	Cherryville	PA
4744	Chesaning	MI
4745	Chesapeake	OH
4746	Chesapeake	VA
4747	Chesapeake Beach	MD
4748	Chesapeake City	MD
4749	Cheshire	CT
4750	Cheshire	MA
4751	Cheshire	OH
4752	Cheshire	OR
4753	Chesnee	SC
4754	Chest Springs	PA
4755	Chester	AR
4756	Chester	CA
4757	Chester	CT
4758	Chester	GA
4759	Chester	IA
4760	Chester	ID
4761	Chester	IL
4762	Chester	MA
4763	Chester	MD
4764	Chester	MT
4765	Chester	NE
4766	Chester	NH
4767	Chester	NJ
4768	Chester	NY
4769	Chester	OH
4770	Chester	OK
4771	Chester	PA
4772	Chester	SC
4773	Chester	SD
4774	Chester	TX
4775	Chester	UT
4776	Chester	VA
4777	Chester	VT
4778	Chester	WV
4779	Chester Depot	VT
4780	Chester Gap	VA
4781	Chester Heights	PA
4782	Chester Springs	PA
4783	Chesterfield	IL
4784	Chesterfield	MA
4785	Chesterfield	MO
4786	Chesterfield	NH
4787	Chesterfield	NJ
4788	Chesterfield	SC
4789	Chesterfield	VA
4790	Chesterhill	OH
4791	Chesterland	OH
4792	Chesterton	IN
4793	Chestertown	MD
4794	Chestertown	NY
4795	Chesterville	OH
4796	Chestnut	IL
4797	Chestnut Hill	MA
4798	Chestnut Mound	TN
4799	Chestnut Mountain	GA
4800	Chestnut Ridge	PA
4801	Chestnutridge	MO
4802	Cheswick	PA
4803	Cheswold	DE
4804	Chetek	WI
4805	Chetopa	KS
4806	Chevak	AK
4807	Chevy Chase	MD
4808	Chewalla	TN
4809	Chewelah	WA
4810	Chewsville	MD
4811	Cheyenne	OK
4812	Cheyenne	WY
4813	Cheyenne Wells	CO
4814	Cheyney	PA
4815	Chicago	IL
4816	Chicago Heights	IL
4817	Chicago Park	CA
4818	Chicago Ridge	IL
4819	Chichester	NH
4820	Chichester	NY
4821	Chickamauga	GA
4822	Chickasaw	OH
4823	Chickasha	OK
4824	Chicken	AK
4825	Chico	CA
4826	Chico	TX
4827	Chicopee	MA
4828	Chicora	PA
4829	Chicota	TX
4830	Chidester	AR
4831	Chiefland	FL
4832	Chignik	AK
4833	Chignik Lagoon	AK
4834	Chignik Lake	AK
4835	Chilcoot	CA
4836	Childersburg	AL
4837	Childress	TX
4838	Childs	MD
4839	Childwold	NY
4840	Chilhowee	MO
4841	Chilhowie	VA
4842	Chili	WI
4843	Chillicothe	IA
4844	Chillicothe	IL
4845	Chillicothe	MO
4846	Chillicothe	OH
4847	Chillicothe	TX
4848	Chilmark	MA
4849	Chilo	OH
4850	Chiloquin	OR
4851	Chilton	TX
4852	Chilton	WI
4853	Chimacum	WA
4854	Chimayo	NM
4855	Chimney Rock	CO
4856	Chimney Rock	NC
4857	China	TX
4858	China Grove	NC
4859	China Spring	TX
4860	China Village	ME
4861	Chinchilla	PA
4862	Chincoteague Island	VA
4863	Chinese Camp	CA
4864	Chinle	AZ
4865	Chino	CA
4866	Chino Hills	CA
4867	Chino Valley	AZ
4868	Chinook	MT
4869	Chinook	WA
4870	Chinqumeisterdish_servern	NC
4871	Chipley	FL
4872	Chippewa Bay	NY
4873	Chippewa Falls	WI
4874	Chippewa Lake	MI
4875	Chippewa Lake	OH
4876	Chireno	TX
4877	Chisago City	MN
4878	Chisholm	MN
4879	Chitina	AK
4880	Chittenango	NY
4881	Chittenden	VT
4882	Chloe	WV
4883	Chloride	AZ
4884	Choccolocco	AL
4885	Chocorua	NH
4886	Chocowinity	NC
4887	Choctaw	AR
4888	Choctaw	OK
4889	Chokio	MN
4890	Chokoloskee	FL
4891	Choteau	MT
4892	Choudrant	LA
4893	Chouteau	OK
4894	Chowchilla	CA
4895	Chriesman	TX
4896	Chrisman	IL
4897	Chrisney	IN
4898	Christchurch	VA
4899	Christiana	PA
4900	Christiana	TN
4901	Christiansburg	OH
4902	Christiansburg	VA
4903	Christine	ND
4904	Christine	TX
4905	Christmas	FL
4906	Christmas Valley	OR
4907	Christopher	IL
4908	Christoval	TX
4909	Chromo	CO
4910	Chualar	CA
4911	Chuckey	TN
4912	Chugiak	AK
4913	Chugwater	WY
4914	Chula	GA
4915	Chula	MO
4916	Chula Vista	CA
4917	Chunchula	AL
4918	Chunky	MS
4919	Church Creek	MD
4920	Church Hill	MD
4921	Church Hill	TN
4922	Church Point	LA
4923	Church Road	VA
4924	Church Rock	NM
4925	Church View	VA
4926	Churchs Ferry	ND
4927	Churchton	MD
4928	Churchville	MD
4929	Churchville	NY
4930	Churchville	VA
4931	Churdan	IA
4932	Churubusco	IN
4933	Churubusco	NY
4934	Cibecue	AZ
4935	Cibola	AZ
4936	Cibolo	TX
4937	Cicero	IL
4938	Cicero	IN
4939	Cicero	NY
4940	Cima	CA
4941	Cimarron	CO
4942	Cimarron	KS
4943	Cimarron	NM
4944	Cincinnati	IA
4945	Cincinnati	OH
4946	Cincinnatus	NY
4947	Cinebar	WA
4948	Circle	AK
4949	Circle	MT
4950	Circle Pines	MN
4951	Circleville	KS
4952	Circleville	NY
4953	Circleville	OH
4954	Circleville	UT
4955	Circleville	WV
4956	Cisco	GA
4957	Cisco	IL
4958	Cisco	TX
4959	Cisco	UT
4960	Cisne	IL
4961	Cissna Park	IL
4962	Citra	FL
4963	Citronelle	AL
4964	Citrus Heights	CA
4965	City Of Industry	CA
4966	Clackamas	OR
4967	Claflin	KS
4968	Claiborne	MD
4969	Claire City	SD
4970	Clairfield	TN
4971	Clairton	PA
4972	Clallam Bay	WA
4973	Clam Gulch	AK
4974	Clam Lake	WI
4975	Clancy	MT
4976	Clanton	AL
4977	Clara	MS
4978	Clara City	MN
4979	Clarcona	FL
4980	Clare	IA
4981	Clare	IL
4982	Clare	MI
4983	Claremont	CA
4984	Claremont	IL
4985	Claremont	MN
4986	Claremont	NC
4987	Claremont	NH
4988	Claremont	SD
4989	Claremont	VA
4990	Claremore	OK
4991	Clarence	IA
4992	Clarence	LA
4993	Clarence	MO
4994	Clarence	NY
4995	Clarence	PA
4996	Clarence Center	NY
4997	Clarendon	AR
4998	Clarendon	NC
4999	Clarendon	NY
5000	Clarendon	PA
5001	Clarendon	TX
5002	Clarendon Hills	IL
5003	Claridge	PA
5004	Clarinda	IA
5005	Clarington	OH
5006	Clarington	PA
5007	Clarion	IA
5008	Clarion	PA
5009	Clarissa	MN
5010	Clarita	OK
5011	Clark	CO
5012	Clark	MO
5013	Clark	NJ
5014	Clark	PA
5015	Clark	SD
5016	Clark Fork	ID
5017	Clark Mills	NY
5018	Clarkdale	AZ
5019	Clarkdale	GA
5020	Clarkedale	AR
5021	Clarkesville	GA
5022	Clarkfield	MN
5023	Clarkia	ID
5024	Clarklake	MI
5025	Clarkrange	TN
5026	Clarkridge	AR
5027	Clarks	LA
5028	Clarks	NE
5029	Clarks Grove	MN
5030	Clarks Hill	IN
5031	Clarks Hill	SC
5032	Clarks Mills	PA
5033	Clarks Point	AK
5034	Clarks Summit	PA
5035	Clarksboro	NJ
5036	Clarksburg	CA
5037	Clarksburg	IN
5038	Clarksburg	MD
5039	Clarksburg	MO
5040	Clarksburg	OH
5041	Clarksburg	PA
5042	Clarksburg	TN
5043	Clarksburg	WV
5044	Clarksdale	MO
5045	Clarksdale	MS
5046	Clarkson	KY
5047	Clarkson	NE
5048	Clarkson	NY
5049	Clarkston	GA
5050	Clarkston	MI
5051	Clarkston	UT
5052	Clarkston	WA
5053	Clarksville	AR
5054	Clarksville	FL
5055	Clarksville	IA
5056	Clarksville	IN
5057	Clarksville	MD
5058	Clarksville	MI
5059	Clarksville	MO
5060	Clarksville	NY
5061	Clarksville	OH
5062	Clarksville	PA
5063	Clarksville	TN
5064	Clarksville	TX
5065	Clarksville	VA
5066	Clarkton	MO
5067	Clarkton	NC
5068	Claryville	NY
5069	Clatonia	NE
5070	Clatskanie	OR
5071	Claude	TX
5072	Claudville	VA
5073	Claunch	NM
5074	Claverack	NY
5075	Clawson	MI
5076	Clawson	UT
5077	Claxton	GA
5078	Clay	AL
5079	Clay	KY
5080	Clay	NY
5081	Clay	WV
5082	Clay Center	KS
5083	Clay Center	NE
5084	Clay Center	OH
5085	Clay City	IL
5086	Clay City	IN
5087	Clay City	KY
5088	Clay Springs	AZ
5089	Clayhole	KY
5090	Claymont	DE
5091	Claypool	AZ
5092	Claypool	IN
5093	Claysburg	PA
5094	Claysville	PA
5095	Clayton	AL
5096	Clayton	CA
5097	Clayton	DE
5098	Clayton	GA
5099	Clayton	ID
5100	Clayton	IL
5101	Clayton	IN
5102	Clayton	KS
5103	Clayton	LA
5104	Clayton	MI
5105	Clayton	NC
5106	Clayton	NJ
5107	Clayton	NM
5108	Clayton	NY
5109	Clayton	OH
5110	Clayton	OK
5111	Clayton	TX
5112	Clayton	WA
5113	Clayton	WI
5114	Clayton Lake	ME
5115	Claytonville	IL
5116	Clayville	NY
5117	Clayville	RI
5118	Cle Elum	WA
5119	Clear	AK
5120	Clear Brook	VA
5121	Clear Creek	IN
5122	Clear Creek	WV
5123	Clear Fork	WV
5124	Clear Lake	IA
5125	Clear Lake	MN
5126	Clear Lake	SD
5127	Clear Lake	WI
5128	Clear Spring	MD
5129	Clearbrook	MN
5130	Clearfield	IA
5131	Clearfield	KY
5132	Clearfield	PA
5133	Clearfield	UT
5134	Clearlake	CA
5135	Clearlake	WA
5136	Clearlake Oaks	CA
5137	Clearlake Park	CA
5138	Clearmont	MO
5139	Clearmont	WY
5140	Clearview City	KS
5141	Clearville	PA
5142	Clearwater	FL
5143	Clearwater	KS
5144	Clearwater	MN
5145	Clearwater	NE
5146	Clearwater	SC
5147	Clearwater Beach	FL
5148	Cleaton	KY
5149	Cleburne	TX
5150	Cleghorn	IA
5151	Clementon	NJ
5152	Clements	CA
5153	Clements	MD
5154	Clements	MN
5155	Clemmons	NC
5156	Clemons	IA
5157	Clemons	NY
5158	Clemson	SC
5159	Clendenin	WV
5160	Cleo Springs	OK
5161	Clermont	FL
5162	Clermont	GA
5163	Clermont	IA
5164	Clermont	KY
5165	Cleveland	AL
5166	Cleveland	AR
5167	Cleveland	GA
5168	Cleveland	MN
5169	Cleveland	MO
5170	Cleveland	MS
5171	Cleveland	NC
5172	Cleveland	ND
5173	Cleveland	NM
5174	Cleveland	NY
5175	Cleveland	OH
5176	Cleveland	OK
5177	Cleveland	SC
5178	Cleveland	TN
5179	Cleveland	TX
5180	Cleveland	UT
5181	Cleveland	VA
5182	Cleveland	WI
5183	Cleveland	WV
5184	Clever	MO
5185	Cleverdale	NY
5186	Cleves	OH
5187	Clewiston	FL
5188	Cliff	NM
5189	Cliff Island	ME
5190	Clifford	IN
5191	Clifford	MI
5192	Clifford	ND
5193	Clifford	PA
5194	Clifford	VA
5195	Cliffside	NC
5196	Cliffside Park	NJ
5197	Cliffwood	NJ
5198	Clifton	AZ
5199	Clifton	CO
5200	Clifton	ID
5201	Clifton	IL
5202	Clifton	KS
5203	Clifton	NJ
5204	Clifton	OH
5205	Clifton	SC
5206	Clifton	TN
5207	Clifton	TX
5208	Clifton	VA
5209	Clifton Forge	VA
5210	Clifton Heights	PA
5211	Clifton Hill	MO
5212	Clifton Park	NY
5213	Clifton Springs	NY
5214	Clifty	KY
5215	Climax	CO
5216	Climax	GA
5217	Climax	MI
5218	Climax	MN
5219	Climax	NC
5220	Climax	NY
5221	Climax Springs	MO
5222	Climbing Hill	IA
5223	Clinchco	VA
5224	Clinchfield	GA
5225	Clines Corners	NM
5226	Clint	TX
5227	Clinton	AL
5228	Clinton	AR
5229	Clinton	CT
5230	Clinton	IA
5231	Clinton	IL
5232	Clinton	IN
5233	Clinton	KY
5234	Clinton	LA
5235	Clinton	MA
5236	Clinton	MD
5237	Clinton	ME
5238	Clinton	MI
5239	Clinton	MN
5240	Clinton	MO
5241	Clinton	MS
5242	Clinton	MT
5243	Clinton	NC
5244	Clinton	NJ
5245	Clinton	NY
5246	Clinton	OH
5247	Clinton	OK
5248	Clinton	PA
5249	Clinton	SC
5250	Clinton	TN
5251	Clinton	WA
5252	Clinton	WI
5253	Clinton Corners	NY
5254	Clinton Township	MI
5255	Clintondale	NY
5256	Clintonville	PA
5257	Clintonville	WI
5258	Clintwood	VA
5259	Clio	AL
5260	Clio	CA
5261	Clio	IA
5262	Clio	MI
5263	Clio	SC
5264	Clipper Mills	CA
5265	Clitherall	MN
5266	Clive	IA
5267	Clockville	NY
5268	Clontarf	MN
5269	Clopton	AL
5270	Cloquet	MN
5271	Closplint	KY
5272	Closter	NJ
5273	Clothier	WV
5274	Cloudcroft	NM
5275	Cloutierville	LA
5276	Clover	SC
5277	Clover	VA
5278	Cloverdale	AL
5279	Cloverdale	CA
5280	Cloverdale	IN
5281	Cloverdale	MI
5282	Cloverdale	OH
5283	Cloverdale	OR
5284	Cloverdale	VA
5285	Cloverport	KY
5286	Clovis	CA
5287	Clovis	NM
5288	Clubb	MO
5289	Clune	PA
5290	Cluster Springs	VA
5291	Clute	TX
5292	Clutier	IA
5293	Clyde	KS
5294	Clyde	MO
5295	Clyde	NC
5296	Clyde	NY
5297	Clyde	OH
5298	Clyde	TX
5299	Clyde Park	MT
5300	Clyman	WI
5301	Clymer	NY
5302	Clymer	PA
5303	Clyo	GA
5304	Coachella	CA
5305	Coahoma	MS
5306	Coahoma	TX
5307	Coal Center	PA
5308	Coal City	IL
5309	Coal City	IN
5310	Coal City	WV
5311	Coal Creek	CO
5312	Coal Hill	AR
5313	Coal Mountain	WV
5314	Coal Run	OH
5315	Coal Township	PA
5316	Coal Valley	IL
5317	Coaldale	CO
5318	Coaldale	PA
5319	Coalfield	TN
5320	Coalgate	OK
5321	Coalgood	KY
5322	Coaling	AL
5323	Coalinga	CA
5324	Coalmont	CO
5325	Coalmont	IN
5326	Coalmont	TN
5327	Coalport	PA
5328	Coalton	OH
5329	Coalton	WV
5330	Coalville	UT
5331	Coalwood	WV
5332	Coarsegold	CA
5333	Coatesville	IN
5334	Coatesville	PA
5335	Coats	KS
5336	Coats	NC
5337	Coatsburg	IL
5338	Coatsville	MO
5339	Cobalt	CT
5340	Cobalt	ID
5341	Cobb	CA
5342	Cobb	GA
5343	Cobb	WI
5344	Cobb Island	MD
5345	Cobbs Creek	VA
5346	Cobbtown	GA
5347	Cobden	IL
5348	Cobleskill	NY
5349	Coburn	PA
5350	Cochecton	NY
5351	Cochecton Center	NY
5352	Cochise	AZ
5353	Cochiti Lake	NM
5354	Cochiti Pueblo	NM
5355	Cochran	GA
5356	Cochrane	WI
5357	Cochranton	PA
5358	Cochranville	PA
5359	Cockeysville	MD
5360	Cocoa	FL
5361	Cocoa Beach	FL
5362	Cocolalla	ID
5363	Cocolamus	PA
5364	Coconut Creek	FL
5365	Coden	AL
5366	Codorus	PA
5367	Cody	NE
5368	Cody	WY
5369	Coeburn	VA
5370	Coello	IL
5371	Coeur D Alene	ID
5372	Coeymans	NY
5373	Coeymans Hollow	NY
5374	Coffee Creek	MT
5375	Coffee Springs	AL
5376	Coffeen	IL
5377	Coffeeville	AL
5378	Coffeeville	MS
5379	Coffey	MO
5380	Coffeyville	KS
5381	Coffman Cove	AK
5382	Cofield	NC
5383	Cogan Station	PA
5384	Coggon	IA
5385	Cogswell	ND
5386	Cohagen	MT
5387	Cohasset	MA
5388	Cohasset	MN
5389	Cohoctah	MI
5390	Cohocton	NY
5391	Cohoes	NY
5392	Cohutta	GA
5393	Coila	MS
5394	Coin	IA
5395	Coinjock	NC
5396	Cokato	MN
5397	Cokeburg	PA
5398	Coker	AL
5399	Cokercreek	TN
5400	Cokeville	WY
5401	Colbert	GA
5402	Colbert	OK
5403	Colbert	WA
5404	Colburn	ID
5405	Colby	KS
5406	Colby	WI
5407	Colchester	CT
5408	Colchester	IL
5409	Colchester	VT
5410	Colcord	OK
5411	Colcord	WV
5412	Cold Bay	AK
5413	Cold Brook	NY
5414	Cold Spring	MN
5415	Cold Spring	NY
5416	Cold Spring Harbor	NY
5417	Colden	NY
5418	Coldiron	KY
5419	Coldspring	TX
5420	Coldwater	KS
5421	Coldwater	MI
5422	Coldwater	MS
5423	Coldwater	OH
5424	Cole Camp	MO
5425	Colebrook	CT
5426	Colebrook	NH
5427	Coleharbor	ND
5428	Coleman	FL
5429	Coleman	GA
5430	Coleman	MI
5431	Coleman	OK
5432	Coleman	TX
5433	Coleman	WI
5434	Coleman Falls	VA
5435	Colerain	NC
5436	Colerain	OH
5437	Coleraine	MN
5438	Coleridge	NE
5439	Coles Point	VA
5440	Colesburg	IA
5441	Coleville	CA
5442	Colfax	CA
5443	Colfax	IA
5444	Colfax	IL
5445	Colfax	IN
5446	Colfax	LA
5447	Colfax	NC
5448	Colfax	ND
5449	Colfax	WA
5450	Colfax	WI
5451	Colfax	WV
5452	Colgate	WI
5453	Collbran	CO
5454	College Corner	OH
5455	College Grove	TN
5456	College Park	MD
5457	College Place	WA
5458	College Point	NY
5459	College Springs	IA
5460	College Station	AR
5461	College Station	TX
5462	Collegedale	TN
5463	Collegeport	TX
5464	Collegeville	MN
5465	Collegeville	PA
5466	Collettsville	NC
5467	Colleyville	TX
5468	Colliers	WV
5469	Colliersville	NY
5470	Collierville	TN
5471	Collins	GA
5472	Collins	IA
5473	Collins	MO
5474	Collins	MS
5475	Collins	NY
5476	Collins	OH
5477	Collins	WI
5478	Collins Center	NY
5479	Collinston	LA
5480	Collinston	UT
5481	Collinsville	AL
5482	Collinsville	CT
5483	Collinsville	IL
5484	Collinsville	MS
5485	Collinsville	OH
5486	Collinsville	OK
5487	Collinsville	TX
5488	Collinsville	VA
5489	Collinwood	TN
5490	Collison	IL
5491	Collyer	KS
5492	Colman	SD
5493	Colmar	PA
5494	Colmesneil	TX
5495	Colo	IA
5496	Cologne	MN
5497	Cologne	NJ
5498	Coloma	CA
5499	Coloma	MI
5500	Coloma	WI
5501	Colome	SD
5502	Colon	MI
5503	Colon	NE
5504	Colona	IL
5505	Colonia	NJ
5506	Colonial Beach	VA
5507	Colonial Heights	VA
5508	Colony	KS
5509	Colony	OK
5510	Colora	MD
5511	Colorado City	AZ
5512	Colorado City	CO
5513	Colorado City	TX
5514	Colorado Springs	CO
5515	Colp	IL
5516	Colquitt	GA
5517	Colrain	MA
5518	Colstrip	MT
5519	Colt	AR
5520	Colton	CA
5521	Colton	NY
5522	Colton	OH
5523	Colton	OR
5524	Colton	SD
5525	Colton	WA
5526	Coltons Point	MD
5527	Colts Neck	NJ
5528	Columbia	AL
5529	Columbia	CA
5530	Columbia	CT
5531	Columbia	IA
5532	Columbia	IL
5533	Columbia	KY
5534	Columbia	LA
5535	Columbia	MD
5536	Columbia	MO
5537	Columbia	MS
5538	Columbia	NC
5539	Columbia	NJ
5540	Columbia	PA
5541	Columbia	SC
5542	Columbia	SD
5543	Columbia	TN
5544	Columbia	VA
5545	Columbia City	IN
5546	Columbia City	OR
5547	Columbia Cross Roads	PA
5548	Columbia Falls	ME
5549	Columbia Falls	MT
5550	Columbia Station	OH
5551	Columbiana	AL
5552	Columbiana	OH
5553	Columbiaville	MI
5554	Columbiaville	NY
5555	Columbus	AR
5556	Columbus	GA
5557	Columbus	IN
5558	Columbus	KS
5559	Columbus	KY
5560	Columbus	MI
5561	Columbus	MS
5562	Columbus	MT
5563	Columbus	NC
5564	Columbus	ND
5565	Columbus	NE
5566	Columbus	NJ
5567	Columbus	NM
5568	Columbus	OH
5569	Columbus	PA
5570	Columbus	TX
5571	Columbus	WI
5572	Columbus City	IA
5573	Columbus Grove	OH
5574	Columbus Junction	IA
5575	Colusa	CA
5576	Colusa	IL
5577	Colver	PA
5578	Colville	WA
5579	Colwell	IA
5580	Colwich	KS
5581	Comanche	OK
5582	Comanche	TX
5583	Combes	TX
5584	Combined Locks	WI
5585	Combs	AR
5586	Combs	KY
5587	Comer	GA
5588	Comfort	NC
5589	Comfort	TX
5590	Comfort	WV
5591	Comfrey	MN
5592	Comins	MI
5593	Commack	NY
5594	Commerce	GA
5595	Commerce	MO
5596	Commerce	OK
5597	Commerce	TX
5598	Commerce City	CO
5599	Commerce Township	MI
5600	Commercial Point	OH
5601	Commiskey	IN
5602	Commodore	PA
5603	Como	CO
5604	Como	MS
5605	Como	NC
5606	Como	TN
5607	Como	TX
5608	Comptche	CA
5609	Compton	AR
5610	Compton	CA
5611	Compton	IL
5612	Compton	MD
5613	Comstock	MI
5614	Comstock	MN
5615	Comstock	NE
5616	Comstock	NY
5617	Comstock	TX
5618	Comstock	WI
5619	Comstock Park	MI
5620	Conasauga	TN
5621	Concan	TX
5622	Concepcion	TX
5623	Conception	MO
5624	Conception Junction	MO
5625	Conchas Dam	NM
5626	Concho	AZ
5627	Concho	OK
5628	Conconully	WA
5629	Concord	AR
5630	Concord	CA
5631	Concord	GA
5632	Concord	IL
5633	Concord	MA
5634	Concord	MI
5635	Concord	NC
5636	Concord	NE
5637	Concord	NH
5638	Concord	PA
5639	Concord	TX
5640	Concord	VA
5641	Concord	VT
5642	Concordia	KS
5643	Concordia	MO
5644	Concordville	PA
5645	Concrete	WA
5646	Conda	ID
5647	Conde	SD
5648	Condon	MT
5649	Condon	OR
5650	Conehatta	MS
5651	Conejos	CO
5652	Conestee	SC
5653	Conestoga	PA
5654	Conesus	NY
5655	Conesville	IA
5656	Conesville	OH
5657	Conetoe	NC
5658	Conewango Valley	NY
5659	Confluence	PA
5660	Conger	MN
5661	Congers	NY
5662	Congerville	IL
5663	Congress	AZ
5664	Conifer	CO
5665	Conklin	MI
5666	Conklin	NY
5667	Conley	GA
5668	Conneaut	OH
5669	Conneaut Lake	PA
5670	Conneautville	PA
5671	Connell	WA
5672	Connellsville	PA
5673	Connelly	NY
5674	Connellys Springs	NC
5675	Conner	MT
5676	Connersville	IN
5677	Connerville	OK
5678	Connoquenessing	PA
5679	Conover	NC
5680	Conover	OH
5681	Conover	WI
5682	Conowingo	MD
5683	Conrad	IA
5684	Conrad	MT
5685	Conrath	WI
5686	Conroe	TX
5687	Conroy	IA
5688	Conshohocken	PA
5689	Constable	NY
5690	Constableville	NY
5691	Constantia	NY
5692	Constantine	MI
5693	Continental	OH
5694	Continental Divide	NM
5695	Contoocook	NH
5696	Convent	LA
5697	Converse	IN
5698	Converse	LA
5699	Converse	SC
5700	Converse	TX
5701	Convoy	OH
5702	Conway	AR
5703	Conway	MA
5704	Conway	MI
5705	Conway	MO
5706	Conway	NC
5707	Conway	NH
5708	Conway	PA
5709	Conway	SC
5710	Conway	WA
5711	Conway Springs	KS
5712	Conyers	GA
5713	Conyngham	PA
5714	Cook	MN
5715	Cook	MO
5716	Cook	NE
5717	Cook Springs	AL
5718	Cooke City	MT
5719	Cookeville	TN
5720	Cooks	MI
5721	Cooksburg	PA
5722	Cookson	OK
5723	Cookstown	NJ
5724	Cooksville	IL
5725	Cooksville	MD
5726	Cookville	TX
5727	Cool	CA
5728	Cool Ridge	WV
5729	Cooleemee	NC
5730	Coolidge	AZ
5731	Coolidge	GA
5732	Coolidge	KS
5733	Coolidge	TX
5734	Coolin	ID
5735	Coolspring	PA
5736	Coolville	OH
5737	Coon Rmeisterdish_serverds	IA
5738	Coon Valley	WI
5739	Cooper	IA
5740	Cooper	TX
5741	Cooper Landing	AK
5742	Coopers Mills	ME
5743	Coopers Plains	NY
5744	Coopersburg	PA
5745	Cooperstown	ND
5746	Cooperstown	NY
5747	Cooperstown	PA
5748	Coopersville	MI
5749	Coos Bay	OR
5750	Coosa	GA
5751	Coosada	AL
5752	Coosawhatchie	SC
5753	Cooter	MO
5754	Copake	NY
5755	Copake Falls	NY
5756	Copalis Beach	WA
5757	Copalis Crossing	WA
5758	Copan	OK
5759	Cope	CO
5760	Cope	SC
5761	Copeland	FL
5762	Copeland	KS
5763	Copemish	MI
5764	Copen	WV
5765	Copenhagen	NY
5766	Copeville	TX
5767	Copiague	NY
5768	Coplay	PA
5769	Coppell	TX
5770	Copper Center	AK
5771	Copper City	MI
5772	Copper Harbor	MI
5773	Copper Hill	VA
5774	Copperas Cove	TX
5775	Copperhill	TN
5776	Copperopolis	CA
5777	Coquille	OR
5778	Cora	WV
5779	Cora	WY
5780	Coral	MI
5781	Coral	PA
5782	Coralville	IA
5783	Coram	MT
5784	Coram	NY
5785	Coraopolis	PA
5786	Corapeake	NC
5787	Corbett	OR
5788	Corbettsville	NY
5789	Corbin	KY
5790	Corbin	VA
5791	Corcoran	CA
5792	Cord	AR
5793	Cordele	GA
5794	Cordell	OK
5795	Corder	MO
5796	Cordesville	SC
5797	Cordova	AK
5798	Cordova	AL
5799	Cordova	IL
5800	Cordova	MD
5801	Cordova	NC
5802	Cordova	NE
5803	Cordova	NM
5804	Cordova	SC
5805	Cordova	TN
5806	Corea	ME
5807	Corfu	NY
5808	Corinna	ME
5809	Corinne	UT
5810	Corinne	WV
5811	Corinth	KY
5812	Corinth	ME
5813	Corinth	MS
5814	Corinth	NY
5815	Corinth	VT
5816	Corn	OK
5817	Cornelia	GA
5818	Cornelius	NC
5819	Cornelius	OR
5820	Cornell	IL
5821	Cornell	MI
5822	Cornell	WI
5823	Cornersville	TN
5824	Cornettsville	KY
5825	Corning	AR
5826	Corning	CA
5827	Corning	IA
5828	Corning	KS
5829	Corning	NY
5830	Corning	OH
5831	Cornish	ME
5832	Cornish	NH
5833	Cornish	UT
5834	Cornish Flat	NH
5835	Cornland	IL
5836	Cornucopia	WI
5837	Cornville	AZ
5838	Cornwall	CT
5839	Cornwall	NY
5840	Cornwall	PA
5841	Cornwall Bridge	CT
5842	Cornwall On Hudson	NY
5843	Cornwallville	NY
5844	Corolla	NC
5845	Corona	CA
5846	Corona	NM
5847	Corona	NY
5848	Corona	SD
5849	Corona Del Mar	CA
5850	Coronado	CA
5851	Corpus Christi	TX
5852	Corral	ID
5853	Corrales	NM
5854	Correctionville	IA
5855	Correll	MN
5856	Corrigan	TX
5857	Corriganville	MD
5858	Corry	PA
5859	Corryton	TN
5860	Corsica	PA
5861	Corsica	SD
5862	Corsicana	TX
5863	Cortaro	AZ
5864	Corte Madera	CA
5865	Cortez	CO
5866	Cortez	FL
5867	Cortland	IL
5868	Cortland	IN
5869	Cortland	NE
5870	Cortland	NY
5871	Cortland	OH
5872	Cortlandt Manor	NY
5873	Corunna	IN
5874	Corunna	MI
5875	Corvallis	MT
5876	Corvallis	OR
5877	Corwith	IA
5878	Cory	CO
5879	Cory	IN
5880	Corydon	IA
5881	Corydon	IN
5882	Corydon	KY
5883	Cos Cob	CT
5884	Cosby	MO
5885	Cosby	TN
5886	Coshocton	OH
5887	Cosmopolis	WA
5888	Cosmos	MN
5889	Cossayuna	NY
5890	Cost	TX
5891	Costa	WV
5892	Costa Mesa	CA
5893	Costilla	NM
5894	Cotati	CA
5895	Cotopaxi	CO
5896	Cottage Grove	MN
5897	Cottage Grove	OR
5898	Cottage Grove	TN
5899	Cottage Grove	WI
5900	Cottage Hills	IL
5901	Cottageville	SC
5902	Cottageville	WV
5903	Cottekill	NY
5904	Cotter	AR
5905	Cottleville	MO
5906	Cotton	GA
5907	Cotton	MN
5908	Cotton Center	TX
5909	Cotton Plant	AR
5910	Cotton Valley	LA
5911	Cottondale	AL
5912	Cottondale	FL
5913	Cottonport	LA
5914	Cottonton	AL
5915	Cottontown	TN
5916	Cottonwood	AL
5917	Cottonwood	AZ
5918	Cottonwood	CA
5919	Cottonwood	ID
5920	Cottonwood	MN
5921	Cottonwood Falls	KS
5922	Cotuit	MA
5923	Cotulla	TX
5924	Couch	MO
5925	Couderay	WI
5926	Coudersport	PA
5927	Cougar	WA
5928	Coulee City	WA
5929	Coulee Dam	WA
5930	Coulter	IA
5931	Coulters	PA
5932	Coulterville	CA
5933	Coulterville	IL
5934	Counce	TN
5935	Council	ID
5936	Council	NC
5937	Council Bluffs	IA
5938	Council Grove	KS
5939	Council Hill	OK
5940	Counselor	NM
5941	Country Club Hills	IL
5942	Countyline	OK
5943	Coupeville	WA
5944	Coupland	TX
5945	Coupon	PA
5946	Courtenay	ND
5947	Courtland	AL
5948	Courtland	CA
5949	Courtland	KS
5950	Courtland	MN
5951	Courtland	MS
5952	Courtland	VA
5953	Coushatta	LA
5954	Cove	AR
5955	Cove	OR
5956	Cove City	NC
5957	Covel	WV
5958	Covelo	CA
5959	Coventry	CT
5960	Coventry	RI
5961	Coventry	VT
5962	Covert	MI
5963	Covesville	VA
5964	Covina	CA
5965	Covington	GA
5966	Covington	IN
5967	Covington	KY
5968	Covington	LA
5969	Covington	MI
5970	Covington	OH
5971	Covington	OK
5972	Covington	PA
5973	Covington	TN
5974	Covington	TX
5975	Covington	VA
5976	Cowan	TN
5977	Cowanesque	PA
5978	Cowansville	PA
5979	Coward	SC
5980	Cowarts	AL
5981	Cowden	IL
5982	Cowdrey	CO
5983	Cowen	WV
5984	Coweta	OK
5985	Cowgill	MO
5986	Cowiche	WA
5987	Cowlesville	NY
5988	Cowley	WY
5989	Cowpens	SC
5990	Coxs Creek	KY
5991	Coxs Mills	WV
5992	Coxsackie	NY
5993	Coy	AL
5994	Coy	AR
5995	Coyanosa	TX
5996	Coyle	OK
5997	Coyote	CA
5998	Coyote	NM
5999	Cozad	NE
6000	Crab Orchard	KY
6001	Crab Orchard	NE
6002	Crab Orchard	TN
6003	Crab Orchard	WV
6004	Crabtree	OR
6005	Crabtree	PA
6006	Craddockville	VA
6007	Craftsbury	VT
6008	Craftsbury Common	VT
6009	Cragford	AL
6010	Cragsmoor	NY
6011	Craig	AK
6012	Craig	CO
6013	Craig	MO
6014	Craig	NE
6015	Craigmont	ID
6016	Craigsville	VA
6017	Craigsville	WV
6018	Craigville	IN
6019	Craley	PA
6020	Cramerton	NC
6021	Cranberry	PA
6022	Cranberry Isles	ME
6023	Cranberry Lake	NY
6024	Cranberry Twp	PA
6025	Cranbury	NJ
6026	Crandall	GA
6027	Crandall	IN
6028	Crandall	TX
6029	Crandon	WI
6030	Crane	IN
6031	Crane	MO
6032	Crane	MT
6033	Crane	OR
6034	Crane	TX
6035	Crane Hill	AL
6036	Crane Lake	MN
6037	Cranesville	PA
6038	Cranfills Gap	TX
6039	Cranford	NJ
6040	Cranks	KY
6041	Cranston	RI
6042	Crapo	MD
6043	Crary	ND
6044	Craryville	NY
6045	Crater Lake	OR
6046	Crawford	CO
6047	Crawford	GA
6048	Crawford	MS
6049	Crawford	NE
6050	Crawford	OK
6051	Crawford	TN
6052	Crawford	TX
6053	Crawford	WV
6054	Crawfordsville	AR
6055	Crawfordsville	IA
6056	Crawfordsville	IN
6057	Crawfordsville	OR
6058	Crawfordville	FL
6059	Crawfordville	GA
6060	Crawley	WV
6061	Crayne	KY
6062	Creal Springs	IL
6063	Cream Ridge	NJ
6064	Creamery	PA
6065	Creede	CO
6066	Creedmoor	NC
6067	Creekside	PA
6068	Creighton	MO
6069	Creighton	NE
6070	Creighton	PA
6071	Crenshaw	MS
6072	Creola	AL
6073	Creola	OH
6074	Creole	LA
6075	Cresbard	SD
6076	Crescent	GA
6077	Crescent	IA
6078	Crescent	OK
6079	Crescent	OR
6080	Crescent	PA
6081	Crescent City	CA
6082	Crescent City	FL
6083	Crescent City	IL
6084	Crescent Lake	OR
6085	Crescent Mills	CA
6086	Crescent Valley	NV
6087	Cresco	IA
6088	Cresco	PA
6089	Cressey	CA
6090	Cresskill	NJ
6091	Cresson	PA
6092	Cresson	TX
6093	Cressona	PA
6094	Crest Hill	IL
6095	Crest Park	CA
6096	Crested Butte	CO
6097	Crestline	CA
6098	Crestline	KS
6099	Crestline	OH
6100	Creston	CA
6101	Creston	IA
6102	Creston	IL
6103	Creston	NC
6104	Creston	NE
6105	Creston	OH
6106	Creston	WA
6107	Creston	WV
6108	Crestone	CO
6109	Crestview	FL
6110	Crestwood	KY
6111	Creswell	NC
6112	Creswell	OR
6113	Crete	IL
6114	Crete	NE
6115	Creve Coeur	IL
6116	Crewe	VA
6117	Criders	VA
6118	Crimora	VA
6119	Cripple Creek	CO
6120	Cripple Creek	VA
6121	Crisfield	MD
6122	Crittenden	KY
6123	Crittenden	NY
6124	Critz	VA
6125	Crivitz	WI
6126	Crocheron	MD
6127	Crocker	MO
6128	Crockett	CA
6129	Crockett	KY
6130	Crockett	TX
6131	Crockett	VA
6132	Crockett Mills	TN
6133	Crocketts Bluff	AR
6134	Crocketville	SC
6135	Crofton	KY
6136	Crofton	MD
6137	Crofton	NE
6138	Croghan	NY
6139	Cromona	KY
6140	Crompond	NY
6141	Cromwell	CT
6142	Cromwell	IA
6143	Cromwell	IN
6144	Cromwell	KY
6145	Cromwell	MN
6146	Cromwell	OK
6147	Crook	CO
6148	Crooked Creek	AK
6149	Crooks	SD
6150	Crookston	MN
6151	Crookston	NE
6152	Crooksville	OH
6153	Cropsey	IL
6154	Cropseyville	NY
6155	Cropwell	AL
6156	Crosby	MN
6157	Crosby	MS
6158	Crosby	ND
6159	Crosby	PA
6160	Crosby	TX
6161	Crosbyton	TX
6162	Cross	SC
6163	Cross Anchor	SC
6164	Cross City	FL
6165	Cross Fork	PA
6166	Cross Hill	SC
6167	Cross Junction	VA
6168	Cross Plains	IN
6169	Cross Plains	TN
6170	Cross Plains	TX
6171	Cross Plains	WI
6172	Cross River	NY
6173	Cross Timbers	MO
6174	Cross Village	MI
6175	Crossett	AR
6176	Crosslake	MN
6177	Crossnore	NC
6178	Crossroads	NM
6179	Crossville	AL
6180	Crossville	IL
6181	Crossville	TN
6182	Croswell	MI
6183	Crothersville	IN
6184	Croton	OH
6185	Croton Falls	NY
6186	Croton On Hudson	NY
6187	Crouse	NC
6188	Crouseville	ME
6189	Crow Agency	MT
6190	Crowder	MS
6191	Crowder	OK
6192	Crowell	TX
6193	Crowheart	WY
6194	Crowley	CO
6195	Crowley	LA
6196	Crowley	TX
6197	Crown	PA
6198	Crown City	OH
6199	Crown King	AZ
6200	Crown Point	IN
6201	Crown Point	NY
6202	Crownpoint	NM
6203	Crownsville	MD
6204	Crows Landing	CA
6205	Crowville	LA
6206	Croydon	PA
6207	Croydon	UT
6208	Crozet	VA
6209	Crozier	VA
6210	Crp Christi	TX
6211	Crucible	PA
6212	Cruger	MS
6213	Crum	WV
6214	Crum Lynne	PA
6215	Crump	TN
6216	Crumpler	NC
6217	Crumpton	MD
6218	Crumrod	AR
6219	Crystal	MI
6220	Crystal	ND
6221	Crystal Bay	MN
6222	Crystal Bay	NV
6223	Crystal Beach	FL
6224	Crystal City	MO
6225	Crystal City	TX
6226	Crystal Falls	MI
6227	Crystal Hill	VA
6228	Crystal Lake	IA
6229	Crystal Lake	IL
6230	Crystal River	FL
6231	Crystal Spring	PA
6232	Crystal Springs	FL
6233	Crystal Springs	MS
6234	Cub Run	KY
6235	Cuba	AL
6236	Cuba	IL
6237	Cuba	KS
6238	Cuba	MO
6239	Cuba	NM
6240	Cuba	NY
6241	Cuba	OH
6242	Cuba City	WI
6243	Cubero	NM
6244	Cucumber	WV
6245	Cudahy	WI
6246	Cuddebackville	NY
6247	Cuddy	PA
6248	Cuero	TX
6249	Cuervo	NM
6250	Culberson	NC
6251	Culbertson	MT
6252	Culbertson	NE
6253	Culdesac	ID
6254	Cullen	LA
6255	Cullen	VA
6256	Culleoka	TN
6257	Cullman	AL
6258	Culloden	GA
6259	Culloden	WV
6260	Cullom	IL
6261	Cullowhee	NC
6262	Culp Creek	OR
6263	Culpeper	VA
6264	Culver	IN
6265	Culver	OR
6266	Culver City	CA
6267	Cumberland	IA
6268	Cumberland	KY
6269	Cumberland	MD
6270	Cumberland	NC
6271	Cumberland	OH
6272	Cumberland	RI
6273	Cumberland	VA
6274	Cumberland	WI
6275	Cumberland Center	ME
6276	Cumberland City	TN
6277	Cumberland Foreside	ME
6278	Cumberland Furnace	TN
6279	Cumberland Gap	TN
6280	Cumbola	PA
6281	Cumby	TX
6282	Cummaquid	MA
6283	Cumming	GA
6284	Cumming	IA
6285	Cummings	KS
6286	Cummings	ND
6287	Cummington	MA
6288	Cumnock	NC
6289	Cuney	TX
6290	Cunningham	KS
6291	Cunningham	KY
6292	Cunningham	TN
6293	Cunningham	TX
6294	Cupertino	CA
6295	Curdsville	KY
6296	Curlew	IA
6297	Curlew	WA
6298	Curllsville	PA
6299	Curran	MI
6300	Currie	MN
6301	Currie	NC
6302	Currituck	NC
6303	Curryville	MO
6304	Curryville	PA
6305	Curtice	OH
6306	Curtin	OR
6307	Curtis	AR
6308	Curtis	MI
6309	Curtis	NE
6310	Curtis	WA
6311	Curtis Bay	MD
6312	Curtiss	WI
6313	Curtisville	PA
6314	Curwensville	PA
6315	Cushing	IA
6316	Cushing	ME
6317	Cushing	MN
6318	Cushing	OK
6319	Cushing	TX
6320	Cushing	WI
6321	Cushman	AR
6322	Cusick	WA
6323	Cusseta	AL
6324	Cusseta	GA
6325	Custar	OH
6326	Custer	KY
6327	Custer	MI
6328	Custer	MT
6329	Custer	SD
6330	Custer	WA
6331	Custer	WI
6332	Custer City	OK
6333	Custer City	PA
6334	Cut Bank	MT
6335	Cut Off	LA
6336	Cutchogue	NY
6337	Cuthbert	GA
6338	Cutler	CA
6339	Cutler	IL
6340	Cutler	IN
6341	Cutler	ME
6342	Cutler	OH
6343	Cutten	CA
6344	Cuttingsville	VT
6345	Cuttyhunk	MA
6346	Cuyahoga Falls	OH
6347	Cyclone	PA
6348	Cyclone	WV
6349	Cygnet	OH
6350	Cylinder	IA
6351	Cynthiana	IN
6352	Cynthiana	KY
6353	Cynthiana	OH
6354	Cypress	CA
6355	Cypress	FL
6356	Cypress	IL
6357	Cypress	TX
6358	Cypress Inn	TN
6359	Cyril	OK
6360	Cyrus	MN
6361	D Hanis	TX
6362	D Lo	MS
6363	Dacoma	OK
6364	Dacono	CO
6365	Dacula	GA
6366	Dade City	FL
6367	Dadeville	AL
6368	Dadeville	MO
6369	Dafter	MI
6370	Daggett	CA
6371	Daggett	MI
6372	Dagmar	MT
6373	Dagsboro	DE
6374	Dagus Mines	PA
6375	Dahinda	IL
6376	Dahlen	ND
6377	Dahlgren	IL
6378	Dahlgren	VA
6379	Dahlonega	GA
6380	Dailey	WV
6381	Daingerfield	TX
6382	Dairy	OR
6383	Daisetta	TX
6384	Daisy	GA
6385	Daisy	MO
6386	Daisy	OK
6387	Daisytown	PA
6388	Dakota	IL
6389	Dakota	MN
6390	Dakota City	IA
6391	Dakota City	NE
6392	Dalbo	MN
6393	Dale	IL
6394	Dale	IN
6395	Dale	NY
6396	Dale	SC
6397	Dale	TX
6398	Dale	WI
6399	Daleville	AL
6400	Daleville	IN
6401	Daleville	MS
6402	Daleville	VA
6403	Dalhart	TX
6404	Dallardsville	TX
6405	Dallas	GA
6406	Dallas	IA
6407	Dallas	NC
6408	Dallas	OR
6409	Dallas	PA
6410	Dallas	SD
6411	Dallas	TX
6412	Dallas	WI
6413	Dallas	WV
6414	Dallas Center	IA
6415	Dallas City	IL
6416	Dallastown	PA
6417	Dallesport	WA
6418	Dalmatia	PA
6419	Dalton	GA
6420	Dalton	MA
6421	Dalton	MN
6422	Dalton	MO
6423	Dalton	NE
6424	Dalton	NY
6425	Dalton	OH
6426	Dalton	PA
6427	Dalton	WI
6428	Dalton City	IL
6429	Daly City	CA
6430	Dalzell	IL
6431	Dalzell	SC
6432	Damar	KS
6433	Damariscotta	ME
6434	Damascus	AR
6435	Damascus	GA
6436	Damascus	MD
6437	Damascus	OH
6438	Damascus	OR
6439	Damascus	PA
6440	Damascus	VA
6441	Dameron	MD
6442	Dammeron Valley	UT
6443	Damon	TX
6444	Dana	IA
6445	Dana	IL
6446	Dana	IN
6447	Dana	KY
6448	Dana	NC
6449	Dana Point	CA
6450	Danboro	PA
6451	Danbury	CT
6452	Danbury	IA
6453	Danbury	NC
6454	Danbury	NE
6455	Danbury	NH
6456	Danbury	TX
6457	Danbury	WI
6458	Danby	VT
6459	Danciger	TX
6460	Dandridge	TN
6461	Dane	WI
6462	Danese	WV
6463	Danevang	TX
6464	Danforth	IL
6465	Danforth	ME
6466	Dania	FL
6467	Daniel	WY
6468	Daniels	WV
6469	Danielson	CT
6470	Danielsville	GA
6471	Danielsville	PA
6472	Dannebrog	NE
6473	Dannemora	NY
6474	Dansville	MI
6475	Dansville	NY
6476	Dante	SD
6477	Dante	VA
6478	Danube	MN
6479	Danvers	IL
6480	Danvers	MA
6481	Danvers	MN
6482	Danville	AL
6483	Danville	AR
6484	Danville	CA
6485	Danville	GA
6486	Danville	IA
6487	Danville	IL
6488	Danville	IN
6489	Danville	KS
6490	Danville	KY
6491	Danville	ME
6492	Danville	NH
6493	Danville	OH
6494	Danville	PA
6495	Danville	VA
6496	Danville	VT
6497	Danville	WA
6498	Danville	WV
6499	Daphne	AL
6500	Darby	MT
6501	Darby	PA
6502	Dardanelle	AR
6503	Dardanelle	CA
6504	Darden	TN
6505	Darfur	MN
6506	Darien	CT
6507	Darien	GA
6508	Darien	IL
6509	Darien	WI
6510	Darien Center	NY
6511	Darling	MS
6512	Darlington	IN
6513	Darlington	MD
6514	Darlington	MO
6515	Darlington	PA
6516	Darlington	SC
6517	Darlington	WI
6518	Darragh	PA
6519	Darrington	WA
6520	Darrouzett	TX
6521	Darrow	LA
6522	Dartmouth	MA
6523	Darwin	CA
6524	Darwin	MN
6525	Dassel	MN
6526	Dateland	AZ
6527	Datil	NM
6528	Datto	AR
6529	Daufuskie Island	SC
6530	Dauphin	PA
6531	Dauphin Island	AL
6532	Davenport	CA
6533	Davenport	FL
6534	Davenport	IA
6535	Davenport	ND
6536	Davenport	NE
6537	Davenport	NY
6538	Davenport	OK
6539	Davenport	VA
6540	Davenport	WA
6541	Davenport Center	NY
6542	Davey	NE
6543	David	KY
6544	David City	NE
6545	Davidson	NC
6546	Davidson	OK
6547	Davidsonville	MD
6548	Davidsville	PA
6549	Davilla	TX
6550	Davin	WV
6551	Davis	CA
6552	Davis	IL
6553	Davis	NC
6554	Davis	OK
6555	Davis	SD
6556	Davis	WV
6557	Davis City	IA
6558	Davis Creek	CA
6559	Davis Junction	IL
6560	Davis Station	SC
6561	Davis Wharf	VA
6562	Davisboro	GA
6563	Davisburg	MI
6564	Davison	MI
6565	Daviston	AL
6566	Davisville	MO
6567	Davisville	WV
6568	Davy	WV
6569	Dawes	WV
6570	Dawn	MO
6571	Dawn	TX
6572	Dawson	AL
6573	Dawson	GA
6574	Dawson	IA
6575	Dawson	IL
6576	Dawson	MN
6577	Dawson	ND
6578	Dawson	NE
6579	Dawson	PA
6580	Dawson	TX
6581	Dawson Springs	KY
6582	Dawsonville	GA
6583	Day	FL
6584	Dayhoit	KY
6585	Daykin	NE
6586	Days Creek	OR
6587	Dayton	IA
6588	Dayton	ID
6589	Dayton	IN
6590	Dayton	KY
6591	Dayton	MD
6592	Dayton	MN
6593	Dayton	MT
6594	Dayton	NJ
6595	Dayton	NV
6596	Dayton	NY
6597	Dayton	OH
6598	Dayton	OR
6599	Dayton	PA
6600	Dayton	TN
6601	Dayton	TX
6602	Dayton	VA
6603	Dayton	WA
6604	Dayton	WY
6605	Daytona Beach	FL
6606	Dayville	CT
6607	Dayville	OR
6608	Dazey	ND
6609	De Armanville	AL
6610	De Beque	CO
6611	De Berry	TX
6612	De Borgia	MT
6613	De Forest	WI
6614	De Graff	OH
6615	De Kalb	MO
6616	De Kalb	MS
6617	De Kalb	TX
6618	De Kalb Junction	NY
6619	De Lancey	PA
6620	De Land	IL
6621	De Leon	TX
6622	De Leon Springs	FL
6623	De Mossville	KY
6624	De Pere	WI
6625	De Peyster	NY
6626	De Queen	AR
6627	De Ruyter	NY
6628	De Smet	SD
6629	De Soto	GA
6630	De Soto	IA
6631	De Soto	IL
6632	De Soto	KS
6633	De Soto	MO
6634	De Soto	WI
6635	De Tour Village	MI
6636	De Valls Bluff	AR
6637	De Witt	AR
6638	De Witt	IA
6639	De Witt	MO
6640	De Witt	NE
6641	De Young	PA
6642	Deadwood	OR
6643	Deadwood	SD
6644	Deal	NJ
6645	Deal Island	MD
6646	Deale	MD
6647	Deane	KY
6648	Deansboro	NY
6649	Deanville	TX
6650	Dearborn	MI
6651	Dearborn	MO
6652	Dearborn Heights	MI
6653	Dearing	GA
6654	Dearing	KS
6655	Deary	ID
6656	Death Valley	CA
6657	Deatsville	AL
6658	Deaver	WY
6659	Debary	FL
6660	Debord	KY
6661	Decatur	AL
6662	Decatur	AR
6663	Decatur	GA
6664	Decatur	IA
6665	Decatur	IL
6666	Decatur	IN
6667	Decatur	MI
6668	Decatur	MS
6669	Decatur	NE
6670	Decatur	OH
6671	Decatur	TN
6672	Decatur	TX
6673	Decaturville	TN
6674	Decherd	TN
6675	Decker	IN
6676	Decker	MI
6677	Decker	MT
6678	Deckerville	MI
6679	Declo	ID
6680	Decorah	IA
6681	Dedham	IA
6682	Dedham	MA
6683	Deedsville	IN
6684	Deep Gap	NC
6685	Deep River	CT
6686	Deep River	IA
6687	Deep Run	NC
6688	Deep Water	WV
6689	Deepwater	MO
6690	Deepwater	NJ
6691	Deer	AR
6692	Deer Creek	IL
6693	Deer Creek	MN
6694	Deer Creek	OK
6695	Deer Grove	IL
6696	Deer Harbor	WA
6697	Deer Island	OR
6698	Deer Isle	ME
6699	Deer Lodge	MT
6700	Deer Lodge	TN
6701	Deer Park	AL
6702	Deer Park	CA
6703	Deer Park	NY
6704	Deer Park	TX
6705	Deer Park	WA
6706	Deer Park	WI
6707	Deer River	MN
6708	Deer River	NY
6709	Deer Trail	CO
6710	Deerbrook	WI
6711	Deerfield	IL
6712	Deerfield	KS
6713	Deerfield	MA
6714	Deerfield	MI
6715	Deerfield	MO
6716	Deerfield	NH
6717	Deerfield	OH
6718	Deerfield	VA
6719	Deerfield	WI
6720	Deerfield Beach	FL
6721	Deerfield Street	NJ
6722	Deering	AK
6723	Deering	MO
6724	Deering	ND
6725	Deersville	OH
6726	Deerton	MI
6727	Deerwood	MN
6728	Deeth	NV
6729	Deferiet	NY
6730	Defiance	IA
6731	Defiance	MO
6732	Defiance	OH
6733	Defiance	PA
6734	Deford	MI
6735	Defuniak Springs	FL
6736	Dekalb	IL
6737	Del Mar	CA
6738	Del Norte	CO
6739	Del Rey	CA
6740	Del Rio	TN
6741	Del Rio	TX
6742	Del Valle	TX
6743	Delafield	WI
6744	Delancey	NY
6745	Deland	FL
6746	Delano	CA
6747	Delano	MN
6748	Delano	PA
6749	Delano	TN
6750	Delanson	NY
6751	Delaplaine	AR
6752	Delaplane	VA
6753	Delavan	IL
6754	Delavan	MN
6755	Delavan	WI
6756	Delaware	AR
6757	Delaware	IA
6758	Delaware	NJ
6759	Delaware	OH
6760	Delaware	OK
6761	Delaware City	DE
6762	Delaware Water Gap	PA
6763	Delbarton	WV
6764	Delcambre	LA
6765	Delco	NC
6766	Delevan	NY
6767	Delhi	CA
6768	Delhi	IA
6769	Delhi	LA
6770	Delhi	NY
6771	Delia	KS
6772	Delight	AR
6773	Dell	AR
6774	Dell	MT
6775	Dell City	TX
6776	Dell Rmeisterdish_serverds	SD
6777	Dellrose	TN
6778	Dellroy	OH
6779	Dellslow	WV
6780	Dellwood	WI
6781	Delmar	AL
6782	Delmar	DE
6783	Delmar	IA
6784	Delmar	MD
6785	Delmar	NY
6786	Delmita	TX
6787	Delmont	NJ
6788	Delmont	PA
6789	Delmont	SD
6790	Deloit	IA
6791	Delong	IN
6792	Delphi	IN
6793	Delphi Falls	NY
6794	Delphia	KY
6795	Delphos	KS
6796	Delphos	OH
6797	Delran	NJ
6798	Delray	WV
6799	Delray Beach	FL
6800	Delta	AL
6801	Delta	CO
6802	Delta	IA
6803	Delta	LA
6804	Delta	MO
6805	Delta	OH
6806	Delta	PA
6807	Delta	UT
6808	Delta City	MS
6809	Delta Junction	AK
6810	Deltaville	VA
6811	Delton	MI
6812	Deltona	FL
6813	Dema	KY
6814	Demarest	NJ
6815	Deming	NM
6816	Deming	WA
6817	Demopolis	AL
6818	Demorest	GA
6819	Demotte	IN
6820	Denair	CA
6821	Denali National Park	AK
6822	Denbo	PA
6823	Dendron	VA
6824	Denham Springs	LA
6825	Denhoff	ND
6826	Denio	NV
6827	Denison	IA
6828	Denison	KS
6829	Denison	TX
6830	Denmark	IA
6831	Denmark	ME
6832	Denmark	NY
6833	Denmark	SC
6834	Denmark	TN
6835	Denmark	WI
6836	Dennard	AR
6837	Dennehotso	AZ
6838	Dennis	KS
6839	Dennis	MA
6840	Dennis	MS
6841	Dennis	TX
6842	Dennis Port	MA
6843	Dennison	IL
6844	Dennison	MN
6845	Dennison	OH
6846	Denniston	KY
6847	Dennisville	NJ
6848	Dennysville	ME
6849	Dent	MN
6850	Denton	GA
6851	Denton	KS
6852	Denton	KY
6853	Denton	MD
6854	Denton	MT
6855	Denton	NC
6856	Denton	NE
6857	Denton	TX
6858	Denver	CO
6859	Denver	IA
6860	Denver	IN
6861	Denver	MO
6862	Denver	NC
6863	Denver	NY
6864	Denver	PA
6865	Denver City	TX
6866	Denville	NJ
6867	Depauville	NY
6868	Depauw	IN
6869	Depew	NY
6870	Depew	OK
6871	Depoe Bay	OR
6872	Deport	TX
6873	Deposit	NY
6874	Depue	IL
6875	Deputy	IN
6876	Dequincy	LA
6877	Derby	CT
6878	Derby	IA
6879	Derby	IN
6880	Derby	KS
6881	Derby	NY
6882	Derby	OH
6883	Derby	VT
6884	Derby Line	VT
6885	Deridder	LA
6886	Derma	MS
6887	Dermott	AR
6888	Derrick City	PA
6889	Derry	NH
6890	Derry	NM
6891	Derry	PA
6892	Derwent	OH
6893	Derwood	MD
6894	Des Allemands	LA
6895	Des Arc	AR
6896	Des Arc	MO
6897	Des Lacs	ND
6898	Des Moines	IA
6899	Des Moines	NM
6900	Des Plaines	IL
6901	Descanso	CA
6902	Desdemona	TX
6903	Desert Center	CA
6904	Desert Hot Springs	CA
6905	Desha	AR
6906	Deshler	NE
6907	Deshler	OH
6908	Desmet	ID
6909	Desoto	TX
6910	Destin	FL
6911	Destrehan	LA
6912	Detroit	AL
6913	Detroit	ME
6914	Detroit	MI
6915	Detroit	OR
6916	Detroit	TX
6917	Detroit Lakes	MN
6918	Devault	PA
6919	Devens	MA
6920	Devers	TX
6921	Deville	LA
6922	Devils Elbow	MO
6923	Devils Lake	ND
6924	Devils Tower	WY
6925	Devine	TX
6926	Devol	OK
6927	Devon	PA
6928	Dewar	IA
6929	Dewar	OK
6930	Dewart	PA
6931	Deweese	NE
6932	Dewey	AZ
6933	Dewey	IL
6934	Dewey	OK
6935	Deweyville	TX
6936	Deweyville	UT
6937	Dewitt	IL
6938	Dewitt	KY
6939	Dewitt	MI
6940	Dewitt	VA
6941	Dewittville	NY
6942	Dewy Rose	GA
6943	Dexter	GA
6944	Dexter	IA
6945	Dexter	KS
6946	Dexter	KY
6947	Dexter	ME
6948	Dexter	MI
6949	Dexter	MN
6950	Dexter	MO
6951	Dexter	NM
6952	Dexter	NY
6953	Dexter	OR
6954	Dexter City	OH
6955	Diablo	CA
6956	Diagonal	IA
6957	Diamond	MO
6958	Diamond	OH
6959	Diamond	OR
6960	Diamond Bar	CA
6961	Diamond City	AR
6962	Diamond Point	NY
6963	Diamond Springs	CA
6964	Diamondhead	MS
6965	Diamondville	WY
6966	Diana	TX
6967	Diana	WV
6968	Diaz	AR
6969	Dibble	OK
6970	Diberville	MS
6971	Diboll	TX
6972	Dice	KY
6973	Dickens	IA
6974	Dickens	NE
6975	Dickens	TX
6976	Dickerson	MD
6977	Dickerson Run	PA
6978	Dickey	ND
6979	Dickeyville	WI
6980	Dickinson	AL
6981	Dickinson	ND
6982	Dickinson	TX
6983	Dickinson Center	NY
6984	Dickson	TN
6985	Dickson City	PA
6986	Dierks	AR
6987	Dieterich	IL
6988	Dietrich	ID
6989	Diggins	MO
6990	Diggs	VA
6991	Dighton	KS
6992	Dighton	MA
6993	Dike	IA
6994	Dike	TX
6995	Dill City	OK
6996	Dillard	GA
6997	Dillard	OR
6998	Dille	WV
6999	Diller	NE
7000	Dilley	TX
7001	Dilliner	PA
7002	Dillingham	AK
7003	Dillon	CO
7004	Dillon	MT
7005	Dillon	SC
7006	Dillon Beach	CA
7007	Dillonvale	OH
7008	Dillsboro	IN
7009	Dillsboro	NC
7010	Dillsburg	PA
7011	Dilltown	PA
7012	Dillwyn	VA
7013	Dilworth	MN
7014	Dime Box	TX
7015	Dimmitt	TX
7016	Dimock	PA
7017	Dimock	SD
7018	Dimondale	MI
7019	Dinero	TX
7020	Dingess	WV
7021	Dingle	ID
7022	Dingmans Ferry	PA
7023	Dinosaur	CO
7024	Dinuba	CA
7025	Dinwiddie	VA
7026	Discovery Bay	CA
7027	Disney	OK
7028	Disputanta	VA
7029	Distant	PA
7030	District Heights	MD
7031	Dittmer	MO
7032	Divernon	IL
7033	Divide	CO
7034	Divide	MT
7035	Dividing Creek	NJ
7036	Dix	IL
7037	Dix	NE
7038	Dixfield	ME
7039	Dixie	GA
7040	Dixie	WA
7041	Dixie	WV
7042	Dixmont	ME
7043	Dixon	CA
7044	Dixon	IA
7045	Dixon	IL
7046	Dixon	KY
7047	Dixon	MO
7048	Dixon	MT
7049	Dixon	NE
7050	Dixon	NM
7051	Dixon	WY
7052	Dixon Springs	TN
7053	Dixons Mills	AL
7054	Dixonville	PA
7055	Dobbin	TX
7056	Dobbins	CA
7057	Dobbs Ferry	NY
7058	Dobson	NC
7059	Docena	AL
7060	Doctors Inlet	FL
7061	Dodd City	TX
7062	Doddridge	AR
7063	Doddsville	MS
7064	Dodge	ND
7065	Dodge	NE
7066	Dodge	TX
7067	Dodge	WI
7068	Dodge Center	MN
7069	Dodge City	KS
7070	Dodgeville	MI
7071	Dodgeville	WI
7072	Dodson	LA
7073	Dodson	MT
7074	Dodson	TX
7075	Doe Hill	VA
7076	Doe Run	MO
7077	Doerun	GA
7078	Dogue	VA
7079	Dola	OH
7080	Dolan Springs	AZ
7081	Doland	SD
7082	Dolgeville	NY
7083	Dollar Bay	MI
7084	Dolliver	IA
7085	Dolomite	AL
7086	Dolores	CO
7087	Dolph	AR
7088	Dolphin	VA
7089	Dolton	IL
7090	Dona Ana	NM
7091	Donahue	IA
7092	Donald	OR
7093	Donalds	SC
7094	Donaldson	AR
7095	Donaldson	IN
7096	Donaldson	MN
7097	Donaldsonville	LA
7098	Donalsonville	GA
7099	Donegal	PA
7100	Dongola	IL
7101	Donie	TX
7102	Doniphan	MO
7103	Doniphan	NE
7104	Donna	TX
7105	Donnellson	IA
7106	Donnellson	IL
7107	Donnelly	ID
7108	Donnelly	MN
7109	Donnelsville	OH
7110	Donner	LA
7111	Donnybrook	ND
7112	Donora	PA
7113	Donovan	IL
7114	Doole	TX
7115	Doon	IA
7116	Dora	AL
7117	Dora	MO
7118	Dora	NM
7119	Doran	VA
7120	Dorchester	IA
7121	Dorchester	NE
7122	Dorchester	NJ
7123	Dorchester	SC
7124	Dorchester	WI
7125	Dorena	OR
7126	Dormansville	NY
7127	Dornsife	PA
7128	Dorothy	NJ
7129	Dorothy	WV
7130	Dorr	MI
7131	Dorrance	KS
7132	Dorris	CA
7133	Dorset	OH
7134	Dorset	VT
7135	Dorsey	IL
7136	Dorton	KY
7137	Dos Palos	CA
7138	Dos Rios	CA
7139	Doss	TX
7140	Doswell	VA
7141	Dothan	AL
7142	Dothan	WV
7143	Doty	WA
7144	Double Springs	AL
7145	Doucette	TX
7146	Douds	IA
7147	Dougherty	IA
7148	Dougherty	OK
7149	Dougherty	TX
7150	Douglas	AK
7151	Douglas	AL
7152	Douglas	AZ
7153	Douglas	GA
7154	Douglas	MA
7155	Douglas	MI
7156	Douglas	ND
7157	Douglas	NE
7158	Douglas	OK
7159	Douglas	WY
7160	Douglas City	CA
7161	Douglas Flat	CA
7162	Douglass	KS
7163	Douglass	TX
7164	Douglassville	PA
7165	Douglassville	TX
7166	Douglasville	GA
7167	Dousman	WI
7168	Dove Creek	CO
7169	Dover	AR
7170	Dover	DE
7171	Dover	FL
7172	Dover	GA
7173	Dover	ID
7174	Dover	IL
7175	Dover	KS
7176	Dover	KY
7177	Dover	MA
7178	Dover	MN
7179	Dover	MO
7180	Dover	NC
7181	Dover	NH
7182	Dover	NJ
7183	Dover	OH
7184	Dover	OK
7185	Dover	PA
7186	Dover	TN
7187	Dover Afb	DE
7188	Dover Foxcroft	ME
7189	Dover Plains	NY
7190	Dovray	MN
7191	Dow	IL
7192	Dow City	IA
7193	Dowagiac	MI
7194	Dowell	IL
7195	Dowell	MD
7196	Dowelltown	TN
7197	Dowling	MI
7198	Downers Grove	IL
7199	Downey	CA
7200	Downey	ID
7201	Downieville	CA
7202	Downing	MO
7203	Downing	WI
7204	Downingtown	PA
7205	Downs	IL
7206	Downs	KS
7207	Downsville	LA
7208	Downsville	NY
7209	Downsville	WI
7210	Dows	IA
7211	Doyle	CA
7212	Doyle	TN
7213	Doylesburg	PA
7214	Doylestown	OH
7215	Doylestown	PA
7216	Doylestown	WI
7217	Doyline	LA
7218	Dozier	AL
7219	Dracut	MA
7220	Dragoon	AZ
7221	Drain	OR
7222	Drake	CO
7223	Drake	KY
7224	Drake	ND
7225	Drakes Branch	VA
7226	Drakesboro	KY
7227	Drakesville	IA
7228	Draper	SD
7229	Draper	UT
7230	Draper	VA
7231	Drasco	AR
7232	Dravosburg	PA
7233	Drayden	MD
7234	Drayton	ND
7235	Drayton	SC
7236	Drayton Plains	MI
7237	Drennen	WV
7238	Dresden	KS
7239	Dresden	ME
7240	Dresden	NY
7241	Dresden	OH
7242	Dresden	TN
7243	Dresher	PA
7244	Dresser	WI
7245	Drew	MS
7246	Drewryville	VA
7247	Drewsey	OR
7248	Drewsville	NH
7249	Drexel	MO
7250	Drexel	NC
7251	Drexel Hill	PA
7252	Drift	KY
7253	Drifting	PA
7254	Drifton	PA
7255	Driftwood	PA
7256	Driftwood	TX
7257	Driggs	ID
7258	Dripping Springs	TX
7259	Driscoll	ND
7260	Driscoll	TX
7261	Driver	AR
7262	Drummond	MT
7263	Drummond	OK
7264	Drummond	WI
7265	Drummond Island	MI
7266	Drummonds	TN
7267	Drumore	PA
7268	Drumright	OK
7269	Drums	PA
7270	Drury	MA
7271	Drury	MO
7272	Dry Branch	GA
7273	Dry Creek	LA
7274	Dry Creek	WV
7275	Dry Fork	VA
7276	Dry Prong	LA
7277	Dry Ridge	KY
7278	Dry Run	PA
7279	Drybranch	WV
7280	Dryden	ME
7281	Dryden	MI
7282	Dryden	NY
7283	Dryden	TX
7284	Dryden	VA
7285	Dryden	WA
7286	Dryfork	WV
7287	Drytown	CA
7288	Du Bois	IL
7289	Du Bois	NE
7290	Du Bois	PA
7291	Du Pont	GA
7292	Du Quoin	IL
7293	Duanesburg	NY
7294	Duarte	CA
7295	Dubach	LA
7296	Dubberly	LA
7297	Dublin	CA
7298	Dublin	GA
7299	Dublin	IN
7300	Dublin	MS
7301	Dublin	NC
7302	Dublin	NH
7303	Dublin	OH
7304	Dublin	PA
7305	Dublin	TX
7306	Dublin	VA
7307	Dubois	ID
7308	Dubois	IN
7309	Dubois	WY
7310	Dubre	KY
7311	Dubuque	IA
7312	Duchesne	UT
7313	Duck	WV
7314	Duck Creek Village	UT
7315	Duck Hill	MS
7316	Duck River	TN
7317	Ducktown	TN
7318	Duckwater	NV
7319	Ducor	CA
7320	Dudley	GA
7321	Dudley	MA
7322	Dudley	MO
7323	Dudley	NC
7324	Dudley	PA
7325	Due West	SC
7326	Duenweg	MO
7327	Duff	TN
7328	Duffield	VA
7329	Dufur	OR
7330	Dugger	IN
7331	Dugspur	VA
7332	Dugway	UT
7333	Duke	MO
7334	Duke	OK
7335	Duke Center	PA
7336	Dukedom	TN
7337	Dulac	LA
7338	Dulce	NM
7339	Dulles	VA
7340	Duluth	GA
7341	Duluth	MN
7342	Dulzura	CA
7343	Dumas	AR
7344	Dumas	MS
7345	Dumas	TX
7346	Dumfries	VA
7347	Dumont	CO
7348	Dumont	IA
7349	Dumont	MN
7350	Dumont	NJ
7351	Dunbar	KY
7352	Dunbar	NE
7353	Dunbar	PA
7354	Dunbar	WI
7355	Dunbar	WV
7356	Dunbarton	NH
7357	Dunbridge	OH
7358	Duncan	AZ
7359	Duncan	MS
7360	Duncan	NE
7361	Duncan	OK
7362	Duncan	SC
7363	Duncan Falls	OH
7364	Duncannon	PA
7365	Duncans Mills	CA
7366	Duncansville	PA
7367	Duncanville	AL
7368	Duncanville	TX
7369	Duncombe	IA
7370	Dundalk	MD
7371	Dundas	IL
7372	Dundas	MN
7373	Dundas	VA
7374	Dundee	FL
7375	Dundee	IA
7376	Dundee	IL
7377	Dundee	KY
7378	Dundee	MI
7379	Dundee	MS
7380	Dundee	NY
7381	Dundee	OH
7382	Dundee	OR
7383	Dunedin	FL
7384	Dunellen	NJ
7385	Dunfermline	IL
7386	Dungannon	VA
7387	Dunkerton	IA
7388	Dunkirk	IN
7389	Dunkirk	MD
7390	Dunkirk	NY
7391	Dunkirk	OH
7392	Dunlap	CA
7393	Dunlap	IA
7394	Dunlap	IL
7395	Dunlap	TN
7396	Dunlevy	PA
7397	Dunlo	PA
7398	Dunlow	WV
7399	Dunmor	KY
7400	Dunmore	WV
7401	Dunn	NC
7402	Dunn	TX
7403	Dunn Center	ND
7404	Dunn Loring	VA
7405	Dunnegan	MO
7406	Dunnell	MN
7407	Dunnellon	FL
7408	Dunnigan	CA
7409	Dunning	NE
7410	Dunnsville	VA
7411	Dunnville	KY
7412	Dunreith	IN
7413	Dunseith	ND
7414	Dunsmuir	CA
7415	Dunstable	MA
7416	Duplessis	LA
7417	Dupo	IL
7418	Dupont	CO
7419	Dupont	IN
7420	Dupont	LA
7421	Dupont	OH
7422	Dupont	WA
7423	Dupree	SD
7424	Dupuyer	MT
7425	Duquesne	PA
7426	Durand	IL
7427	Durand	MI
7428	Durand	WI
7429	Durango	CO
7430	Durango	IA
7431	Durant	FL
7432	Durant	IA
7433	Durant	MS
7434	Durant	OK
7435	Durants Neck	NC
7436	Durbin	WV
7437	Durham	CA
7438	Durham	CT
7439	Durham	KS
7440	Durham	ME
7441	Durham	MO
7442	Durham	NC
7443	Durham	NH
7444	Durham	NY
7445	Durham	OK
7446	Durham	PA
7447	Durhamville	NY
7448	Durkee	OR
7449	Duryea	PA
7450	Dushore	PA
7451	Duson	LA
7452	Dustin	OK
7453	Dutch Flat	CA
7454	Dutch Harbor	AK
7455	Dutch John	UT
7456	Dutchtown	MO
7457	Dutton	AL
7458	Dutton	MT
7459	Dutton	VA
7460	Dutzow	MO
7461	Duvall	WA
7462	Duxbury	MA
7463	Dwale	KY
7464	Dwarf	KY
7465	Dwight	IL
7466	Dwight	KS
7467	Dwight	NE
7468	Dycusburg	KY
7469	Dyer	AR
7470	Dyer	IN
7471	Dyer	NV
7472	Dyer	TN
7473	Dyersburg	TN
7474	Dyersville	IA
7475	Dyess	AR
7476	Dyess Afb	TX
7477	Dyke	VA
7478	Dysart	IA
7479	Dysart	PA
7480	Eads	CO
7481	Eads	TN
7482	Eagan	TN
7483	Eagar	AZ
7484	Eagarville	IL
7485	Eagle	AK
7486	Eagle	CO
7487	Eagle	ID
7488	Eagle	MI
7489	Eagle	NE
7490	Eagle	WI
7491	Eagle Bay	NY
7492	Eagle Bend	MN
7493	Eagle Bridge	NY
7494	Eagle Butte	SD
7495	Eagle Creek	OR
7496	Eagle Grove	IA
7497	Eagle Lake	FL
7498	Eagle Lake	ME
7499	Eagle Lake	MN
7500	Eagle Lake	TX
7501	Eagle Mountain	UT
7502	Eagle Nest	NM
7503	Eagle Pass	TX
7504	Eagle Point	OR
7505	Eagle River	AK
7506	Eagle River	WI
7507	Eagle Rock	MO
7508	Eagle Rock	VA
7509	Eagle Springs	NC
7510	Eagles Mere	PA
7511	Eagletown	OK
7512	Eagleville	CA
7513	Eagleville	MO
7514	Eagleville	PA
7515	Eagleville	TN
7516	Eakly	OK
7517	Earl	NC
7518	Earl Park	IN
7519	Earle	AR
7520	Earleton	FL
7521	Earleville	MD
7522	Earlham	IA
7523	Earlimart	CA
7524	Earling	IA
7525	Earlington	KY
7526	Earlington	PA
7527	Earlsboro	OK
7528	Earlton	NY
7529	Earlville	IA
7530	Earlville	IL
7531	Earlville	NY
7532	Earlville	PA
7533	Early	IA
7534	Early	TX
7535	Early Branch	SC
7536	Earlysville	VA
7537	Earp	CA
7538	Earth	TX
7539	Earth City	MO
7540	Easley	SC
7541	East Alton	IL
7542	East Amherst	NY
7543	East Andover	ME
7544	East Andover	NH
7545	East Arlington	VT
7546	East Aurora	NY
7547	East Baldwin	ME
7548	East Bank	WV
7549	East Barre	VT
7550	East Bend	NC
7551	East Berkshire	VT
7552	East Berlin	CT
7553	East Berlin	PA
7554	East Bernard	TX
7555	East Berne	NY
7556	East Bernstadt	KY
7557	East Bethany	NY
7558	East Bloomfield	NY
7559	East Blue Hill	ME
7560	East Boothbay	ME
7561	East Boston	MA
7562	East Brady	PA
7563	East Branch	NY
7564	East Bridgewater	MA
7565	East Brookfield	MA
7566	East Brunswick	NJ
7567	East Burke	VT
7568	East Butler	PA
7569	East Calais	VT
7570	East Canaan	CT
7571	East Candia	NH
7572	East Canton	OH
7573	East Carbon	UT
7574	East Carondelet	IL
7575	East Charleston	VT
7576	East Chatham	NY
7577	East Chicago	IN
7578	East China	MI
7579	East Claridon	OH
7580	East Concord	NY
7581	East Corinth	VT
7582	East Dennis	MA
7583	East Derry	NH
7584	East Dixfield	ME
7585	East Dorset	VT
7586	East Dover	VT
7587	East Dublin	GA
7588	East Dubuque	IL
7589	East Durham	NY
7590	East Earl	PA
7591	East Ellijay	GA
7592	East Ellsworth	WI
7593	East Elmhurst	NY
7594	East Enterprise	IN
7595	East Fairfield	VT
7596	East Falmouth	MA
7597	East Flat Rock	NC
7598	East Freedom	PA
7599	East Freetown	MA
7600	East Fultonham	OH
7601	East Galesburg	IL
7602	East Glacier Park	MT
7603	East Glastonbury	CT
7604	East Granby	CT
7605	East Grand Forks	MN
7606	East Greenbush	NY
7607	East Greenville	PA
7608	East Greenwich	RI
7609	East Haddam	CT
7610	East Hampstead	NH
7611	East Hampton	CT
7612	East Hampton	NY
7613	East Hanover	NJ
7614	East Hardwick	VT
7615	East Hartford	CT
7616	East Hartland	CT
7617	East Haven	CT
7618	East Haven	VT
7619	East Helena	MT
7620	East Hickory	PA
7621	East Homer	NY
7622	East Irvine	CA
7623	East Islip	NY
7624	East Jewett	NY
7625	East Jordan	MI
7626	East Killingly	CT
7627	East Lansing	MI
7628	East Leroy	MI
7629	East Liberty	OH
7630	East Livermore	ME
7631	East Liverpool	OH
7632	East Longmeadow	MA
7633	East Lyme	CT
7634	East Lynn	IL
7635	East Lynn	WV
7636	East Lynne	MO
7637	East Machias	ME
7638	East Mansfield	MA
7639	East Marion	NY
7640	East Mc Keesport	PA
7641	East Meadow	NY
7642	East Meredith	NY
7643	East Middlebury	VT
7644	East Millinocket	ME
7645	East Millsboro	PA
7646	East Moline	IL
7647	East Montpelier	VT
7648	East Moriches	NY
7649	East Nassau	NY
7650	East New Market	MD
7651	East Newport	ME
7652	East Northport	NY
7653	East Norwich	NY
7654	East Olympia	WA
7655	East Orange	NJ
7656	East Orland	ME
7657	East Orleans	MA
7658	East Otis	MA
7659	East Otto	NY
7660	East Palatka	FL
7661	East Palestine	OH
7662	East Parsonsfield	ME
7663	East Pembroke	NY
7664	East Peoria	IL
7665	East Petersburg	PA
7666	East Pharsalia	NY
7667	East Pittsburgh	PA
7668	East Point	KY
7669	East Poland	ME
7670	East Poultney	VT
7671	East Prairie	MO
7672	East Princeton	MA
7673	East Prospect	PA
7674	East Providence	RI
7675	East Quogue	NY
7676	East Randolph	NY
7677	East Randolph	VT
7678	East Rochester	NY
7679	East Rochester	OH
7680	East Rockaway	NY
7681	East Rutherford	NJ
7682	East Ryegate	VT
7683	East Saint Johnsbury	VT
7684	East Saint Louis	IL
7685	East Sandwich	MA
7686	East Schodack	NY
7687	East Setauket	NY
7688	East Smethport	PA
7689	East Smithfield	PA
7690	East Sparta	OH
7691	East Spencer	NC
7692	East Springfield	NY
7693	East Springfield	OH
7694	East Springfield	PA
7695	East Stone Gap	VA
7696	East Stroudsburg	PA
7697	East Syracuse	NY
7698	East Tallassee	AL
7699	East Taunton	MA
7700	East Tawas	MI
7701	East Templeton	MA
7702	East Texas	PA
7703	East Thetford	VT
7704	East Troy	WI
7705	East Vandergrift	PA
7706	East Vassalboro	ME
7707	East Wakefield	NH
7708	East Wallingford	VT
7709	East Walpole	MA
7710	East Wareham	MA
7711	East Waterboro	ME
7712	East Waterford	PA
7713	East Wenatchee	WA
7714	East Weymouth	MA
7715	East Williamson	NY
7716	East Wilton	ME
7717	East Windsor	CT
7718	East Windsor Hill	CT
7719	East Winthrop	ME
7720	East Woodstock	CT
7721	East Worcester	NY
7722	Eastaboga	AL
7723	Eastabuchie	MS
7724	Eastanollee	GA
7725	Eastchester	NY
7726	Eastern	KY
7727	Eastford	CT
7728	Eastham	MA
7729	Easthampton	MA
7730	Eastlake	CO
7731	Eastlake	MI
7732	Eastlake	OH
7733	Eastlake Weir	FL
7734	Eastland	TX
7735	Eastman	GA
7736	Eastman	WI
7737	Easton	CT
7738	Easton	IL
7739	Easton	KS
7740	Easton	MA
7741	Easton	MD
7742	Easton	ME
7743	Easton	MN
7744	Easton	MO
7745	Easton	PA
7746	Easton	TX
7747	Easton	WA
7748	Eastover	SC
7749	Eastpoint	FL
7750	Eastpointe	MI
7751	Eastport	ID
7752	Eastport	ME
7753	Eastport	MI
7754	Eastport	NY
7755	Eastsound	WA
7756	Eastview	KY
7757	Eastville	VA
7758	Eastwood	KY
7759	Eaton	CO
7760	Eaton	IN
7761	Eaton	NY
7762	Eaton	OH
7763	Eaton	TN
7764	Eaton Center	NH
7765	Eaton Park	FL
7766	Eaton Rmeisterdish_serverds	MI
7767	Eatonton	GA
7768	Eatontown	NJ
7769	Eatonville	WA
7770	Eau Claire	MI
7771	Eau Claire	PA
7772	Eau Claire	WI
7773	Eau Galle	WI
7774	Eben Junction	MI
7775	Ebensburg	PA
7776	Ebervale	PA
7777	Ebony	VA
7778	Ebro	FL
7779	Eccles	WV
7780	Echo	LA
7781	Echo	MN
7782	Echo	OR
7783	Echo	UT
7784	Echo Lake	CA
7785	Echola	AL
7786	Eckerman	MI
7787	Eckert	CO
7788	Eckerty	IN
7789	Eckhart Mines	MD
7790	Eckley	CO
7791	Eckman	WV
7792	Eclectic	AL
7793	Ecleto	TX
7794	Economy	IN
7795	Ecorse	MI
7796	Ecru	MS
7797	Ector	TX
7798	Edcouch	TX
7799	Eddington	ME
7800	Eddy	TX
7801	Eddyville	IA
7802	Eddyville	IL
7803	Eddyville	KY
7804	Eddyville	NE
7805	Eddyville	OR
7806	Edelstein	IL
7807	Eden	AZ
7808	Eden	GA
7809	Eden	ID
7810	Eden	MD
7811	Eden	NC
7812	Eden	NY
7813	Eden	SD
7814	Eden	TX
7815	Eden	UT
7816	Eden	VT
7817	Eden	WI
7818	Eden Mills	VT
7819	Eden Prairie	MN
7820	Eden Valley	MN
7821	Edenton	NC
7822	Edenville	MI
7823	Edgar	FL
7824	Edgar	MT
7825	Edgar	NE
7826	Edgar	WI
7827	Edgar Springs	MO
7828	Edgard	LA
7829	Edgarton	WV
7830	Edgartown	MA
7831	Edgecomb	ME
7832	Edgefield	SC
7833	Edgeley	ND
7834	Edgemont	AR
7835	Edgemont	PA
7836	Edgemont	SD
7837	Edgemoor	SC
7838	Edgerton	KS
7839	Edgerton	MN
7840	Edgerton	MO
7841	Edgerton	OH
7842	Edgerton	WI
7843	Edgerton	WY
7844	Edgewater	FL
7845	Edgewater	MD
7846	Edgewater	NJ
7847	Edgewater	WI
7848	Edgewood	IA
7849	Edgewood	IL
7850	Edgewood	MD
7851	Edgewood	NM
7852	Edgewood	TX
7853	Edina	MO
7854	Edinboro	PA
7855	Edinburg	IL
7856	Edinburg	ND
7857	Edinburg	PA
7858	Edinburg	TX
7859	Edinburg	VA
7860	Edinburgh	IN
7861	Edison	CA
7862	Edison	GA
7863	Edison	NE
7864	Edison	NJ
7865	Edison	OH
7866	Edisto Island	SC
7867	Edmeston	NY
7868	Edmond	OK
7869	Edmond	WV
7870	Edmonds	WA
7871	Edmondson	AR
7872	Edmonson	TX
7873	Edmonton	KY
7874	Edmore	MI
7875	Edmore	ND
7876	Edmund	WI
7877	Edna	KS
7878	Edna	TX
7879	Edneyville	NC
7880	Edon	OH
7881	Edroy	TX
7882	Edson	KS
7883	Edwall	WA
7884	Edward	NC
7885	Edwards	CA
7886	Edwards	CO
7887	Edwards	IL
7888	Edwards	MO
7889	Edwards	MS
7890	Edwards	NY
7891	Edwardsburg	MI
7892	Edwardsport	IN
7893	Edwardsville	AL
7894	Edwardsville	IL
7895	Edwardsville	KS
7896	Edwardsville	VA
7897	Eek	AK
7898	Effie	LA
7899	Effie	MN
7900	Effingham	IL
7901	Effingham	KS
7902	Effingham	NH
7903	Effingham	SC
7904	Effort	PA
7905	Efland	NC
7906	Egan	LA
7907	Egan	SD
7908	Egegik	AK
7909	Egeland	ND
7910	Egg Harbor	WI
7911	Egg Harbor City	NJ
7912	Egg Harbor Township	NJ
7913	Eggleston	VA
7914	Eglin Afb	FL
7915	Eglon	WV
7916	Egnar	CO
7917	Egypt	AR
7918	Egypt	TX
7919	Ehrenberg	AZ
7920	Ehrhardt	SC
7921	Eidson	TN
7922	Eielson Afb	AK
7923	Eight Mile	AL
7924	Eighty Eight	KY
7925	Eighty Four	PA
7926	Eitzen	MN
7927	Ekalaka	MT
7928	Ekron	KY
7929	Ekwok	AK
7930	El Cajon	CA
7931	El Campo	TX
7932	El Centro	CA
7933	El Cerrito	CA
7934	El Dorado	AR
7935	El Dorado	CA
7936	El Dorado	KS
7937	El Dorado Hills	CA
7938	El Dorado Springs	MO
7939	El Granada	CA
7940	El Indio	TX
7941	El Jobean	FL
7942	El Mirage	AZ
7943	El Monte	CA
7944	El Nido	CA
7945	El Paso	AR
7946	El Paso	IL
7947	El Paso	TX
7948	El Portal	CA
7949	El Prado	NM
7950	El Reno	OK
7951	El Rito	NM
7952	El Segundo	CA
7953	El Sobrante	CA
7954	El Toro	CA
7955	El Verano	CA
7956	Elaine	AR
7957	Eland	WI
7958	Elba	AL
7959	Elba	NE
7960	Elba	NY
7961	Elbe	WA
7962	Elberfeld	IN
7963	Elberon	IA
7964	Elberon	VA
7965	Elbert	CO
7966	Elbert	WV
7967	Elberta	AL
7968	Elberta	MI
7969	Elberta	UT
7970	Elberton	GA
7971	Elbing	KS
7972	Elbow Lake	MN
7973	Elbridge	NY
7974	Elburn	IL
7975	Elcho	WI
7976	Elco	PA
7977	Eldena	IL
7978	Elderon	WI
7979	Elderton	PA
7980	Eldon	IA
7981	Eldon	MO
7982	Eldora	IA
7983	Eldorado	IL
7984	Eldorado	OH
7985	Eldorado	OK
7986	Eldorado	TX
7987	Eldorado	WI
7988	Eldorado Springs	CO
7989	Eldred	IL
7990	Eldred	NY
7991	Eldred	PA
7992	Eldridge	AL
7993	Eldridge	CA
7994	Eldridge	IA
7995	Eldridge	MO
7996	Eleanor	WV
7997	Electra	TX
7998	Electric City	WA
7999	Eleele	HI
8000	Elephant Butte	NM
8001	Eleroy	IL
8002	Eleva	WI
8003	Elfers	FL
8004	Elfin Cove	AK
8005	Elfrida	AZ
8006	Elgin	AZ
8007	Elgin	IA
8008	Elgin	IL
8009	Elgin	MN
8010	Elgin	ND
8011	Elgin	NE
8012	Elgin	OH
8013	Elgin	OK
8014	Elgin	OR
8015	Elgin	PA
8016	Elgin	SC
8017	Elgin	TN
8018	Elgin	TX
8019	Elida	NM
8020	Elim	AK
8021	Eliot	ME
8022	Elizabeth	AR
8023	Elizabeth	CO
8024	Elizabeth	IL
8025	Elizabeth	IN
8026	Elizabeth	LA
8027	Elizabeth	MN
8028	Elizabeth	NJ
8029	Elizabeth	PA
8030	Elizabeth	WV
8031	Elizabeth City	NC
8032	Elizabethton	TN
8033	Elizabethtown	IL
8034	Elizabethtown	IN
8035	Elizabethtown	KY
8036	Elizabethtown	NC
8037	Elizabethtown	NY
8038	Elizabethtown	PA
8039	Elizabethville	PA
8040	Elizaville	KY
8041	Elizaville	NY
8042	Elk	CA
8043	Elk	WA
8044	Elk City	ID
8045	Elk City	KS
8046	Elk City	OK
8047	Elk Creek	CA
8048	Elk Creek	MO
8049	Elk Creek	NE
8050	Elk Creek	VA
8051	Elk Falls	KS
8052	Elk Garden	WV
8053	Elk Grove	CA
8054	Elk Grove Village	IL
8055	Elk Horn	IA
8056	Elk Horn	KY
8057	Elk Mills	MD
8058	Elk Mound	WI
8059	Elk Mountain	WY
8060	Elk Park	NC
8061	Elk Point	SD
8062	Elk Rmeisterdish_serverds	MI
8063	Elk River	ID
8064	Elk River	MN
8065	Elka Park	NY
8066	Elkader	IA
8067	Elkfork	KY
8068	Elkhart	IA
8069	Elkhart	IL
8070	Elkhart	IN
8071	Elkhart	KS
8072	Elkhart	TX
8073	Elkhart Lake	WI
8074	Elkhorn	NE
8075	Elkhorn	WI
8076	Elkhorn	WV
8077	Elkhorn City	KY
8078	Elkin	NC
8079	Elkins	AR
8080	Elkins	NH
8081	Elkins	WV
8082	Elkins Park	PA
8083	Elkland	MO
8084	Elkland	PA
8085	Elkmont	AL
8086	Elko	GA
8087	Elko	MN
8088	Elko	NV
8089	Elko	SC
8090	Elkport	IA
8091	Elkridge	MD
8092	Elkton	FL
8093	Elkton	KY
8094	Elkton	MD
8095	Elkton	MI
8096	Elkton	MN
8097	Elkton	OH
8098	Elkton	OR
8099	Elkton	SD
8100	Elkton	TN
8101	Elkton	VA
8102	Elkview	WV
8103	Elkville	IL
8104	Elkwood	VA
8105	Ellabell	GA
8106	Ellamore	WV
8107	Ellaville	GA
8108	Ellenboro	NC
8109	Ellenboro	WV
8110	Ellenburg	NY
8111	Ellenburg Center	NY
8112	Ellenburg Depot	NY
8113	Ellendale	DE
8114	Ellendale	MN
8115	Ellendale	ND
8116	Ellendale	TN
8117	Ellensburg	WA
8118	Ellenton	FL
8119	Ellenton	GA
8120	Ellenville	NY
8121	Ellenwood	GA
8122	Ellerbe	NC
8123	Ellerslie	GA
8124	Ellerslie	MD
8125	Ellery	IL
8126	Ellettsville	IN
8127	Ellicott City	MD
8128	Ellicottville	NY
8129	Ellijay	GA
8130	Ellinger	TX
8131	Ellington	CT
8132	Ellington	MO
8133	Ellington	NY
8134	Ellinwood	KS
8135	Elliott	IA
8136	Elliott	IL
8137	Elliott	MS
8138	Elliott	SC
8139	Elliottsburg	PA
8140	Elliottville	KY
8141	Ellis	ID
8142	Ellis	KS
8143	Ellis Grove	IL
8144	Ellisburg	NY
8145	Ellison Bay	WI
8146	Elliston	MT
8147	Elliston	VA
8148	Ellisville	IL
8149	Ellisville	MS
8150	Elloree	SC
8151	Ellsinore	MO
8152	Ellston	IA
8153	Ellsworth	IA
8154	Ellsworth	IL
8155	Ellsworth	KS
8156	Ellsworth	ME
8157	Ellsworth	MI
8158	Ellsworth	MN
8159	Ellsworth	NE
8160	Ellsworth	OH
8161	Ellsworth	PA
8162	Ellsworth	WI
8163	Ellsworth Afb	SD
8164	Ellwood City	PA
8165	Elm	PA
8166	Elm City	NC
8167	Elm Creek	NE
8168	Elm Grove	LA
8169	Elm Grove	WI
8170	Elm Hall	MI
8171	Elm Mott	TX
8172	Elm Springs	AR
8173	Elma	IA
8174	Elma	NY
8175	Elma	WA
8176	Elmaton	TX
8177	Elmdale	KS
8178	Elmendorf	TX
8179	Elmendorf Afb	AK
8180	Elmer	LA
8181	Elmer	MO
8182	Elmer	NJ
8183	Elmer	OK
8184	Elmer City	WA
8185	Elmhurst	IL
8186	Elmhurst	NY
8187	Elmhurst	PA
8188	Elmira	CA
8189	Elmira	MI
8190	Elmira	NY
8191	Elmira	OR
8192	Elmo	MO
8193	Elmo	MT
8194	Elmo	TX
8195	Elmo	UT
8196	Elmont	NY
8197	Elmora	PA
8198	Elmore	AL
8199	Elmore	MN
8200	Elmore	OH
8201	Elmore City	OK
8202	Elmsford	NY
8203	Elmwood	IL
8204	Elmwood	MA
8205	Elmwood	NE
8206	Elmwood	TN
8207	Elmwood	WI
8208	Elmwood Park	IL
8209	Elmwood Park	NJ
8210	Elnora	IN
8211	Elon	NC
8212	Elora	TN
8213	Eloy	AZ
8214	Elrama	PA
8215	Elrod	AL
8216	Elrosa	MN
8217	Elroy	WI
8218	Elsa	TX
8219	Elsah	IL
8220	Elsberry	MO
8221	Elsie	MI
8222	Elsie	NE
8223	Elsinore	UT
8224	Elsmere	NE
8225	Elsmore	KS
8226	Elton	LA
8227	Elton	PA
8228	Elton	WI
8229	Elton	WV
8230	Eltopia	WA
8231	Elvaston	IL
8232	Elverson	PA
8233	Elverta	CA
8234	Elwell	MI
8235	Elwin	IL
8236	Elwood	IL
8237	Elwood	IN
8238	Elwood	KS
8239	Elwood	NE
8240	Elwood	NJ
8241	Ely	IA
8242	Ely	MN
8243	Ely	NV
8244	Elyria	NE
8245	Elyria	OH
8246	Elysburg	PA
8247	Elysian	MN
8248	Elysian Fields	TX
8249	Embarrass	MN
8250	Embarrass	WI
8251	Emblem	WY
8252	Embudo	NM
8253	Emden	IL
8254	Emden	MO
8255	Emeigh	PA
8256	Emelle	AL
8257	Emerado	ND
8258	Emerald Isle	NC
8259	Emerson	AR
8260	Emerson	GA
8261	Emerson	IA
8262	Emerson	KY
8263	Emerson	NE
8264	Emerson	NJ
8265	Emery	SD
8266	Emery	UT
8267	Emeryville	CA
8268	Emigrant	MT
8269	Emigrant Gap	CA
8270	Emigsville	PA
8271	Emily	MN
8272	Eminence	IN
8273	Eminence	KY
8274	Eminence	MO
8275	Emington	IL
8276	Emlenton	PA
8277	Emlyn	KY
8278	Emma	IL
8279	Emma	MO
8280	Emmalena	KY
8281	Emmaus	PA
8282	Emmet	AR
8283	Emmet	NE
8284	Emmetsburg	IA
8285	Emmett	ID
8286	Emmett	KS
8287	Emmett	MI
8288	Emmitsburg	MD
8289	Emmonak	AK
8290	Emmons	MN
8291	Emory	TX
8292	Emory	VA
8293	Empire	AL
8294	Empire	CA
8295	Empire	CO
8296	Empire	LA
8297	Empire	MI
8298	Empire	NV
8299	Empire	OH
8300	Emporia	KS
8301	Emporia	VA
8302	Emporium	PA
8303	Encampment	WY
8304	Encinal	TX
8305	Encinitas	CA
8306	Encino	CA
8307	Encino	NM
8308	Encino	TX
8309	Endeavor	PA
8310	Endeavor	WI
8311	Enderlin	ND
8312	Enders	NE
8313	Endicott	NE
8314	Endicott	NY
8315	Endicott	WA
8316	Endwell	NY
8317	Energy	IL
8318	Energy	TX
8319	Enfield	CT
8320	Enfield	IL
8321	Enfield	NC
8322	Enfield	NH
8323	Enfield Center	NH
8324	Engadine	MI
8325	Engelhard	NC
8326	England	AR
8327	Englewood	CO
8328	Englewood	FL
8329	Englewood	KS
8330	Englewood	NJ
8331	Englewood	OH
8332	Englewood	TN
8333	Englewood Cliffs	NJ
8334	English	IN
8335	Englishtown	NJ
8336	Enid	MS
8337	Enid	OK
8338	Enigma	GA
8339	Enka	NC
8340	Enloe	TX
8341	Ennice	NC
8342	Enning	SD
8343	Ennis	MT
8344	Ennis	TX
8345	Enochs	TX
8346	Enola	AR
8347	Enola	PA
8348	Enon	OH
8349	Enon Valley	PA
8350	Enoree	SC
8351	Enosburg Falls	VT
8352	Ensign	KS
8353	Enterprise	AL
8354	Enterprise	KS
8355	Enterprise	LA
8356	Enterprise	MS
8357	Enterprise	OR
8358	Enterprise	UT
8359	Enterprise	WV
8360	Entiat	WA
8361	Entriken	PA
8362	Enumclaw	WA
8363	Enville	TN
8364	Eola	IL
8365	Eola	TX
8366	Eolia	KY
8367	Eolia	MO
8368	Epes	AL
8369	Ephraim	UT
8370	Ephraim	WI
8371	Ephrata	PA
8372	Ephrata	WA
8373	Epping	ND
8374	Epping	NH
8375	Epps	LA
8376	Epsom	NH
8377	Epworth	GA
8378	Epworth	IA
8379	Equality	AL
8380	Equality	IL
8381	Equinunk	PA
8382	Era	TX
8383	Erath	LA
8384	Erbacon	WV
8385	Erhard	MN
8386	Erick	OK
8387	Ericson	NE
8388	Erie	CO
8389	Erie	IL
8390	Erie	KS
8391	Erie	MI
8392	Erie	ND
8393	Erie	PA
8394	Erieville	NY
8395	Eriline	KY
8396	Erin	NY
8397	Erin	TN
8398	Erlanger	KY
8399	Ermine	KY
8400	Ernest	PA
8401	Ernul	NC
8402	Eros	LA
8403	Errol	NH
8404	Erskine	MN
8405	Erving	MA
8406	Erwin	NC
8407	Erwin	SD
8408	Erwin	TN
8409	Erwinna	PA
8410	Erwinville	LA
8411	Esbon	KS
8412	Escalante	UT
8413	Escalon	CA
8414	Escanaba	MI
8415	Escatawpa	MS
8416	Escondido	CA
8417	Eskdale	WV
8418	Esko	MN
8419	Eskridge	KS
8420	Esmond	IL
8421	Esmond	ND
8422	Esmont	VA
8423	Esom Hill	GA
8424	Esopus	NY
8425	Espanola	NM
8426	Esparto	CA
8427	Esperance	NY
8428	Essex	CA
8429	Essex	CT
8430	Essex	IA
8431	Essex	IL
8432	Essex	MA
8433	Essex	MD
8434	Essex	MO
8435	Essex	MT
8436	Essex	NY
8437	Essex	VT
8438	Essex Fells	NJ
8439	Essex Junction	VT
8440	Essexville	MI
8441	Essie	KY
8442	Essig	MN
8443	Essington	PA
8444	Estacada	OR
8445	Estancia	NM
8446	Estcourt Station	ME
8447	Estell Manor	NJ
8448	Estelline	SD
8449	Estelline	TX
8450	Ester	AK
8451	Estero	FL
8452	Estes Park	CO
8453	Estherville	IA
8454	Estherwood	LA
8455	Estill	SC
8456	Estill Springs	TN
8457	Estillfork	AL
8458	Ethan	SD
8459	Ethel	AR
8460	Ethel	LA
8461	Ethel	MO
8462	Ethel	MS
8463	Ethel	WA
8464	Ethel	WV
8465	Ethelsville	AL
8466	Ether	NC
8467	Ethridge	MT
8468	Ethridge	TN
8469	Etlan	VA
8470	Etna	CA
8471	Etna	ME
8472	Etna	NH
8473	Etna	NY
8474	Etna	OH
8475	Etna	WY
8476	Etna Green	IN
8477	Etoile	KY
8478	Etoile	TX
8479	Eton	GA
8480	Etowah	AR
8481	Etowah	NC
8482	Etowah	TN
8483	Etta	MS
8484	Etters	PA
8485	Ettrick	WI
8486	Eubank	KY
8487	Eucha	OK
8488	Euclid	MN
8489	Euclid	OH
8490	Eudora	AR
8491	Eudora	KS
8492	Eudora	MO
8493	Eufaula	AL
8494	Eufaula	OK
8495	Eugene	MO
8496	Eugene	OR
8497	Euless	TX
8498	Eunice	LA
8499	Eunice	MO
8500	Eunice	NM
8501	Eupora	MS
8502	Eure	NC
8503	Eureka	CA
8504	Eureka	IL
8505	Eureka	KS
8506	Eureka	MI
8507	Eureka	MO
8508	Eureka	MT
8509	Eureka	NV
8510	Eureka	SD
8511	Eureka	UT
8512	Eureka	WI
8513	Eureka Springs	AR
8514	Eustace	TX
8515	Eustis	FL
8516	Eustis	ME
8517	Eustis	NE
8518	Eutaw	AL
8519	Eutawville	SC
8520	Eva	AL
8521	Eva	TN
8522	Evadale	TX
8523	Evangeline	LA
8524	Evans	CO
8525	Evans	GA
8526	Evans	LA
8527	Evans	WA
8528	Evans	WV
8529	Evans City	PA
8530	Evans Mills	NY
8531	Evansdale	IA
8532	Evansport	OH
8533	Evanston	IL
8534	Evanston	IN
8535	Evanston	WY
8536	Evansville	AR
8537	Evansville	IL
8538	Evansville	IN
8539	Evansville	MN
8540	Evansville	WI
8541	Evansville	WY
8542	Evant	TX
8543	Evart	MI
8544	Evarts	KY
8545	Eveleth	MN
8546	Evening Shade	AR
8547	Evensville	TN
8548	Everest	KS
8549	Everett	MA
8550	Everett	PA
8551	Everett	WA
8552	Everetts	NC
8553	Everglades City	FL
8554	Evergreen	CO
8555	Evergreen	LA
8556	Evergreen	NC
8557	Evergreen	VA
8558	Evergreen Park	IL
8559	Everly	IA
8560	Everson	PA
8561	Everson	WA
8562	Everton	AR
8563	Everton	MO
8564	Evington	VA
8565	Evinston	FL
8566	Ewa Beach	HI
8567	Ewan	NJ
8568	Ewell	MD
8569	Ewen	MI
8570	Ewing	IL
8571	Ewing	KY
8572	Ewing	MO
8573	Ewing	NE
8574	Ewing	NJ
8575	Ewing	VA
8576	Excel	AL
8577	Excello	MO
8578	Excelsior	MN
8579	Excelsior Springs	MO
8580	Exchange	WV
8581	Exeland	WI
8582	Exeter	CA
8583	Exeter	ME
8584	Exeter	MO
8585	Exeter	NE
8586	Exeter	NH
8587	Exeter	RI
8588	Exira	IA
8589	Exline	IA
8590	Exmore	VA
8591	Experiment	GA
8592	Export	PA
8593	Exton	PA
8594	Eyota	MN
8595	Ezel	KY
8596	Fabens	TX
8597	Faber	VA
8598	Fabius	NY
8599	Fabyan	CT
8600	Fackler	AL
8601	Factoryville	PA
8602	Fagus	MO
8603	Fair Bluff	NC
8604	Fair Grove	MO
8605	Fair Haven	MI
8606	Fair Haven	NJ
8607	Fair Haven	NY
8608	Fair Haven	VT
8609	Fair Lawn	NJ
8610	Fair Oaks	CA
8611	Fair Oaks	IN
8612	Fair Play	MO
8613	Fair Play	SC
8614	Fairacres	NM
8615	Fairbank	IA
8616	Fairbank	PA
8617	Fairbanks	AK
8618	Fairbanks	IN
8619	Fairbanks	LA
8620	Fairborn	OH
8621	Fairburn	GA
8622	Fairburn	SD
8623	Fairbury	IL
8624	Fairbury	NE
8625	Fairchance	PA
8626	Fairchild	WI
8627	Fairchild Air Force Base	WA
8628	Fairdale	KY
8629	Fairdale	ND
8630	Fairdale	WV
8631	Fairdealing	MO
8632	Fairfax	CA
8633	Fairfax	IA
8634	Fairfax	MN
8635	Fairfax	MO
8636	Fairfax	OK
8637	Fairfax	SC
8638	Fairfax	SD
8639	Fairfax	VA
8640	Fairfax	VT
8641	Fairfax Station	VA
8642	Fairfield	AL
8643	Fairfield	CA
8644	Fairfield	CT
8645	Fairfield	FL
8646	Fairfield	IA
8647	Fairfield	ID
8648	Fairfield	IL
8649	Fairfield	KY
8650	Fairfield	ME
8651	Fairfield	MT
8652	Fairfield	NC
8653	Fairfield	ND
8654	Fairfield	NE
8655	Fairfield	NJ
8656	Fairfield	OH
8657	Fairfield	PA
8658	Fairfield	TX
8659	Fairfield	VA
8660	Fairfield	VT
8661	Fairfield	WA
8662	Fairfield Bay	AR
8663	Fairforest	SC
8664	Fairgrove	MI
8665	Fairhaven	MA
8666	Fairhope	AL
8667	Fairhope	PA
8668	Fairland	IN
8669	Fairland	OK
8670	Fairlawn	OH
8671	Fairlea	WV
8672	Fairlee	VT
8673	Fairless Hills	PA
8674	Fairmont	MN
8675	Fairmont	NC
8676	Fairmont	NE
8677	Fairmont	OK
8678	Fairmont	WV
8679	Fairmount	GA
8680	Fairmount	IL
8681	Fairmount	IN
8682	Fairmount	ND
8683	Fairmount City	PA
8684	Fairplay	CO
8685	Fairplay	MD
8686	Fairpoint	OH
8687	Fairport	MO
8688	Fairport	NY
8689	Fairton	NJ
8690	Fairview	IL
8691	Fairview	KS
8692	Fairview	KY
8693	Fairview	MI
8694	Fairview	MO
8695	Fairview	MT
8696	Fairview	NC
8697	Fairview	NJ
8698	Fairview	OH
8699	Fairview	OK
8700	Fairview	OR
8701	Fairview	PA
8702	Fairview	SD
8703	Fairview	TN
8704	Fairview	UT
8705	Fairview	WV
8706	Fairview	WY
8707	Fairview Heights	IL
8708	Fairview Village	PA
8709	Fairwater	WI
8710	Faison	NC
8711	Faith	NC
8712	Faith	SD
8713	Falcon	KY
8714	Falcon	MO
8715	Falcon	MS
8716	Falcon	NC
8717	Falcon Heights	TX
8718	Falconer	NY
8719	Falfurrias	TX
8720	Falkland	NC
8721	Falkner	MS
8722	Falkville	AL
8723	Fall Branch	TN
8724	Fall City	WA
8725	Fall Creek	OR
8726	Fall Creek	WI
8727	Fall River	KS
8728	Fall River	MA
8729	Fall River	WI
8730	Fall River Mills	CA
8731	Fall Rock	KY
8732	Fallbrook	CA
8733	Fallentimber	PA
8734	Falling Rock	WV
8735	Falling Waters	WV
8736	Fallon	MT
8737	Fallon	NV
8738	Falls	PA
8739	Falls Church	VA
8740	Falls City	NE
8741	Falls City	OR
8742	Falls City	TX
8743	Falls Creek	PA
8744	Falls Mills	VA
8745	Falls Of Rough	KY
8746	Falls Village	CT
8747	Fallsburg	NY
8748	Fallston	MD
8749	Fallston	NC
8750	Falmouth	IN
8751	Falmouth	KY
8752	Falmouth	MA
8753	Falmouth	ME
8754	Falmouth	MI
8755	False Pass	AK
8756	Falun	KS
8757	Fancher	NY
8758	Fancy Farm	KY
8759	Fancy Gap	VA
8760	Fannettsburg	PA
8761	Fannin	TX
8762	Fanrock	WV
8763	Fanshawe	OK
8764	Fanwood	NJ
8765	Far Hills	NJ
8766	Far Rockaway	NY
8767	Farber	MO
8768	Fargo	GA
8769	Fargo	ND
8770	Fargo	OK
8771	Faribault	MN
8772	Farina	IL
8773	Farley	IA
8774	Farley	MO
8775	Farlington	KS
8776	Farmdale	OH
8777	Farmer	OH
8778	Farmer City	IL
8779	Farmers	KY
8780	Farmersburg	IA
8781	Farmersburg	IN
8782	Farmersville	CA
8783	Farmersville	IL
8784	Farmersville	OH
8785	Farmersville	TX
8786	Farmersville Station	NY
8787	Farmerville	LA
8788	Farmingdale	ME
8789	Farmingdale	NJ
8790	Farmingdale	NY
8791	Farmington	AR
8792	Farmington	CA
8793	Farmington	CT
8794	Farmington	GA
8795	Farmington	IA
8796	Farmington	IL
8797	Farmington	KY
8798	Farmington	ME
8799	Farmington	MI
8800	Farmington	MN
8801	Farmington	MO
8802	Farmington	NH
8803	Farmington	NM
8804	Farmington	NY
8805	Farmington	PA
8806	Farmington	UT
8807	Farmington	WA
8808	Farmington	WV
8809	Farmington Falls	ME
8810	Farmingville	NY
8811	Farmland	IN
8812	Farmville	NC
8813	Farmville	VA
8814	Farnam	NE
8815	Farner	TN
8816	Farnham	NY
8817	Farnham	VA
8818	Farnhamville	IA
8819	Farnsworth	TX
8820	Farragut	IA
8821	Farrar	MO
8822	Farrell	MS
8823	Farrell	PA
8824	Farris	OK
8825	Farson	WY
8826	Farwell	MI
8827	Farwell	MN
8828	Farwell	NE
8829	Farwell	TX
8830	Fate	TX
8831	Faucett	MO
8832	Faulkner	MD
8833	Faulkton	SD
8834	Faunsdale	AL
8835	Fawn Grove	PA
8836	Fawnskin	CA
8837	Faxon	OK
8838	Fay	OK
8839	Fayette	AL
8840	Fayette	IA
8841	Fayette	MO
8842	Fayette	MS
8843	Fayette	NY
8844	Fayette	OH
8845	Fayette	UT
8846	Fayette City	PA
8847	Fayetteville	AR
8848	Fayetteville	GA
8849	Fayetteville	NC
8850	Fayetteville	NY
8851	Fayetteville	OH
8852	Fayetteville	PA
8853	Fayetteville	TN
8854	Fayetteville	TX
8855	Fayetteville	WV
8856	Fayville	MA
8857	Faywood	NM
8858	Feasterville Trevose	PA
8859	Feather Falls	CA
8860	Federal Dam	MN
8861	Federal Way	WA
8862	Federalsburg	MD
8863	Fedhaven	FL
8864	Fedora	SD
8865	Fedscreek	KY
8866	Feeding Hills	MA
8867	Feesburg	OH
8868	Felch	MI
8869	Felda	FL
8870	Felicity	OH
8871	Fellows	CA
8872	Fellsmere	FL
8873	Felt	ID
8874	Felt	OK
8875	Felton	CA
8876	Felton	DE
8877	Felton	GA
8878	Felton	MN
8879	Felton	PA
8880	Felts Mills	NY
8881	Fence	WI
8882	Fence Lake	NM
8883	Fenelton	PA
8884	Fenn	ID
8885	Fennimore	WI
8886	Fennville	MI
8887	Fenton	IA
8888	Fenton	IL
8889	Fenton	LA
8890	Fenton	MI
8891	Fenton	MO
8892	Fentress	TX
8893	Fenwick	MI
8894	Fenwick	WV
8895	Fenwick Island	DE
8896	Ferdinand	ID
8897	Ferdinand	IN
8898	Fergus Falls	MN
8899	Ferguson	IA
8900	Ferguson	KY
8901	Ferguson	NC
8902	Fernandina Beach	FL
8903	Ferndale	CA
8904	Ferndale	FL
8905	Ferndale	MI
8906	Ferndale	NY
8907	Ferndale	PA
8908	Ferndale	WA
8909	Ferney	SD
8910	Fernley	NV
8911	Fernwood	ID
8912	Fernwood	MS
8913	Ferriday	LA
8914	Ferris	IL
8915	Ferris	TX
8916	Ferrisburgh	VT
8917	Ferron	UT
8918	Ferrum	VA
8919	Ferrysburg	MI
8920	Ferryville	WI
8921	Fertile	IA
8922	Fertile	MN
8923	Fessenden	ND
8924	Festus	MO
8925	Feura Bush	NY
8926	Fiatt	IL
8927	Fiddletown	CA
8928	Fidelity	IL
8929	Fieldale	VA
8930	Fielding	UT
8931	Fieldon	IL
8932	Fields	OR
8933	Fields Landing	CA
8934	Fieldton	TX
8935	Fife Lake	MI
8936	Fifield	WI
8937	Fifty Lakes	MN
8938	Fifty Six	AR
8939	Filer	ID
8940	Filer City	MI
8941	Filion	MI
8942	Filley	NE
8943	Fillmore	CA
8944	Fillmore	IL
8945	Fillmore	IN
8946	Fillmore	MO
8947	Fillmore	NY
8948	Fillmore	UT
8949	Fincastle	VA
8950	Finchville	KY
8951	Findlay	IL
8952	Findlay	OH
8953	Findley Lake	NY
8954	Fine	NY
8955	Fingal	ND
8956	Finger	TN
8957	Fingerville	SC
8958	Finksburg	MD
8959	Finland	MN
8960	Finlayson	MN
8961	Finley	CA
8962	Finley	ND
8963	Finley	OK
8964	Finley	TN
8965	Finleyville	PA
8966	Finly	IN
8967	Firebaugh	CA
8968	Firestone	CO
8969	Firth	ID
8970	Firth	NE
8971	Fischer	TX
8972	Fish Camp	CA
8973	Fish Creek	WI
8974	Fish Haven	ID
8975	Fisher	AR
8976	Fisher	IL
8977	Fisher	LA
8978	Fisher	MN
8979	Fisher	PA
8980	Fisher	WV
8981	Fishers	IN
8982	Fishers	NY
8983	Fishers Hill	VA
8984	Fishers Island	NY
8985	Fishers Landing	NY
8986	Fishersville	VA
8987	Fishertown	PA
8988	Fisherville	KY
8989	Fishing Creek	MD
8990	Fishkill	NY
8991	Fishs Eddy	NY
8992	Fishtail	MT
8993	Fisk	MO
8994	Fiskdale	MA
8995	Fiskeville	RI
8996	Fisty	KY
8997	Fitchburg	MA
8998	Fithian	IL
8999	Fittstown	OK
9000	Fitzgerald	GA
9001	Fitzhugh	OK
9002	Fitzpatrick	AL
9003	Fitzwilliam	NH
9004	Five Points	AL
9005	Five Points	CA
9006	Five Points	TN
9007	Flag Pond	TN
9008	Flagler	CO
9009	Flagler Beach	FL
9010	Flagstaff	AZ
9011	Flagtown	NJ
9012	Flanagan	IL
9013	Flanders	NJ
9014	Flandreau	SD
9015	Flasher	ND
9016	Flat	TX
9017	Flat Lick	KY
9018	Flat Rock	AL
9019	Flat Rock	IL
9020	Flat Rock	IN
9021	Flat Rock	MI
9022	Flat Rock	NC
9023	Flat Rock	OH
9024	Flat Top	WV
9025	Flatgap	KY
9026	Flatonia	TX
9027	Flatwoods	KY
9028	Flatwoods	LA
9029	Flatwoods	WV
9030	Flaxton	ND
9031	Flaxville	MT
9032	Fleetville	PA
9033	Fleetwood	NC
9034	Fleetwood	PA
9035	Fleischmanns	NY
9036	Fleming	CO
9037	Fleming	GA
9038	Fleming	OH
9039	Fleming	PA
9040	Fleming Island	FL
9041	Flemingsburg	KY
9042	Flemington	MO
9043	Flemington	NJ
9044	Flemington	WV
9045	Flensburg	MN
9046	Fletcher	MO
9047	Fletcher	NC
9048	Fletcher	OH
9049	Fletcher	OK
9050	Flicksville	PA
9051	Flint	MI
9052	Flint	TX
9053	Flint Hill	VA
9054	Flinthill	MO
9055	Flinton	PA
9056	Flintstone	GA
9057	Flintstone	MD
9058	Flintville	TN
9059	Flippin	AR
9060	Flom	MN
9061	Flomaton	AL
9062	Flomot	TX
9063	Floodwood	MN
9064	Flora	IL
9065	Flora	IN
9066	Flora	LA
9067	Flora	MS
9068	Flora Vista	NM
9069	Florahome	FL
9070	Floral	AR
9071	Floral City	FL
9072	Floral Park	NY
9073	Florala	AL
9074	Florence	AL
9075	Florence	AZ
9076	Florence	CO
9077	Florence	IN
9078	Florence	KS
9079	Florence	KY
9080	Florence	MO
9081	Florence	MS
9082	Florence	MT
9083	Florence	NJ
9084	Florence	OR
9085	Florence	SC
9086	Florence	SD
9087	Florence	TX
9088	Florence	VT
9089	Florence	WI
9090	Floresville	TX
9091	Florham Park	NJ
9092	Florida	NY
9093	Florien	LA
9094	Floris	IA
9095	Florissant	CO
9096	Florissant	MO
9097	Floriston	CA
9098	Flossmoor	IL
9099	Flournoy	CA
9100	Flourtown	PA
9101	Flovilla	GA
9102	Flower Mound	TX
9103	Floweree	MT
9104	Flowery Branch	GA
9105	Flowood	MS
9106	Floyd	IA
9107	Floyd	NM
9108	Floyd	VA
9109	Floydada	TX
9110	Floyds Knobs	IN
9111	Fluker	LA
9112	Flushing	MI
9113	Flushing	NY
9114	Flushing	OH
9115	Fluvanna	TX
9116	Fly Creek	NY
9117	Flynn	TX
9118	Fogelsville	PA
9119	Folcroft	PA
9120	Foley	AL
9121	Foley	MN
9122	Foley	MO
9123	Folkston	GA
9124	Follansbee	WV
9125	Follett	TX
9126	Folly Beach	SC
9127	Folsom	CA
9128	Folsom	LA
9129	Folsom	NM
9130	Folsom	PA
9131	Folsom	WV
9132	Folsomville	IN
9133	Fombell	PA
9134	Fond Du Lac	WI
9135	Fonda	IA
9136	Fonda	NY
9137	Fontana	CA
9138	Fontana	KS
9139	Fontana	WI
9140	Fontana Dam	NC
9141	Fontanelle	IA
9142	Fontanet	IN
9143	Foosland	IL
9144	Foothill Ranch	CA
9145	Footville	WI
9146	Forbes	MN
9147	Forbes	ND
9148	Forbes Road	PA
9149	Forbestown	CA
9150	Force	PA
9151	Ford	KS
9152	Ford	VA
9153	Ford	WA
9154	Ford City	PA
9155	Ford Cliff	PA
9156	Fordland	MO
9157	Fordoche	LA
9158	Fords	NJ
9159	Fords Branch	KY
9160	Fordsville	KY
9161	Fordville	ND
9162	Fordyce	AR
9163	Fordyce	NE
9164	Foreman	AR
9165	Forest	IN
9166	Forest	LA
9167	Forest	MS
9168	Forest	OH
9169	Forest	VA
9170	Forest City	IA
9171	Forest City	IL
9172	Forest City	MO
9173	Forest City	NC
9174	Forest City	PA
9175	Forest Dale	VT
9176	Forest Falls	CA
9177	Forest Grove	MT
9178	Forest Grove	OR
9179	Forest Grove	PA
9180	Forest Hill	LA
9181	Forest Hill	MD
9182	Forest Hill	WV
9183	Forest Hills	KY
9184	Forest Hills	NY
9185	Forest Home	AL
9186	Forest Junction	WI
9187	Forest Knolls	CA
9188	Forest Lake	MN
9189	Forest Lakes	AZ
9190	Forest Park	GA
9191	Forest Park	IL
9192	Forest Ranch	CA
9193	Forest River	ND
9194	Forestburg	TX
9195	Forestburgh	NY
9196	Forestdale	MA
9197	Forestdale	RI
9198	Foresthill	CA
9199	Foreston	MN
9200	Forestport	NY
9201	Forestville	CA
9202	Forestville	MI
9203	Forestville	NY
9204	Forestville	PA
9205	Forestville	WI
9206	Forgan	OK
9207	Foristell	MO
9208	Fork	MD
9209	Fork	SC
9210	Fork Union	VA
9211	Forked River	NJ
9212	Forkland	AL
9213	Forks	WA
9214	Forks Of Salmon	CA
9215	Forksville	PA
9216	Forman	ND
9217	Formoso	KS
9218	Forney	TX
9219	Forrest	IL
9220	Forrest City	AR
9221	Forreston	IL
9222	Forreston	TX
9223	Forsan	TX
9224	Forsyth	GA
9225	Forsyth	IL
9226	Forsyth	MO
9227	Forsyth	MT
9228	Fort Ann	NY
9229	Fort Apache	AZ
9230	Fort Ashby	WV
9231	Fort Atkinson	IA
9232	Fort Atkinson	WI
9233	Fort Bayard	NM
9234	Fort Belvoir	VA
9235	Fort Benning	GA
9236	Fort Benton	MT
9237	Fort Bidwell	CA
9238	Fort Blackmore	VA
9239	Fort Bliss	TX
9240	Fort Bragg	CA
9241	Fort Bragg	NC
9242	Fort Branch	IN
9243	Fort Bridger	WY
9244	Fort Calhoun	NE
9245	Fort Campbell	KY
9246	Fort Cobb	OK
9247	Fort Collins	CO
9248	Fort Covington	NY
9249	Fort Davis	AL
9250	Fort Davis	TX
9251	Fort Defiance	AZ
9252	Fort Defiance	VA
9253	Fort Deposit	AL
9254	Fort Dick	CA
9255	Fort Dix	NJ
9256	Fort Dodge	IA
9257	Fort Dodge	KS
9258	Fort Drum	NY
9259	Fort Duchesne	UT
9260	Fort Edward	NY
9261	Fort Eustis	VA
9262	Fort Fairfield	ME
9263	Fort Gaines	GA
9264	Fort Garland	CO
9265	Fort Gay	WV
9266	Fort George G Meade	MD
9267	Fort Gibson	OK
9268	Fort Gratiot	MI
9269	Fort Greely	AK
9270	Fort Hall	ID
9271	Fort Hancock	TX
9272	Fort Harrison	MT
9273	Fort Hill	PA
9274	Fort Howard	MD
9275	Fort Huachuca	AZ
9276	Fort Hunter	NY
9277	Fort Irwin	CA
9278	Fort Jennings	OH
9279	Fort Johnson	NY
9280	Fort Jones	CA
9281	Fort Kent	ME
9282	Fort Kent Mills	ME
9283	Fort Klamath	OR
9284	Fort Knox	KY
9285	Fort Laramie	WY
9286	Fort Lauderdale	FL
9287	Fort Lawn	SC
9288	Fort Leavenworth	KS
9289	Fort Lee	NJ
9290	Fort Lee	VA
9291	Fort Leonard Wood	MO
9292	Fort Littleton	PA
9293	Fort Loramie	OH
9294	Fort Loudon	PA
9295	Fort Lupton	CO
9296	Fort Lyon	CO
9297	Fort Madison	IA
9298	Fort Mc Coy	FL
9299	Fort Mc Kavett	TX
9300	Fort Mcdowell	AZ
9301	Fort Meade	FL
9302	Fort Meade	SD
9303	Fort Mill	SC
9304	Fort Mitchell	AL
9305	Fort Mitchell	VA
9306	Fort Mohave	AZ
9307	Fort Monmouth	NJ
9308	Fort Monroe	VA
9309	Fort Montgomery	NY
9310	Fort Morgan	CO
9311	Fort Myers	FL
9312	Fort Myers Beach	FL
9313	Fort Necessity	LA
9314	Fort Ogden	FL
9315	Fort Oglethorpe	GA
9316	Fort Payne	AL
9317	Fort Peck	MT
9318	Fort Pierce	FL
9319	Fort Pierre	SD
9320	Fort Plain	NY
9321	Fort Polk	LA
9322	Fort Ransom	ND
9323	Fort Recovery	OH
9324	Fort Richardson	AK
9325	Fort Riley	KS
9326	Fort Ripley	MN
9327	Fort Ritner	IN
9328	Fort Rock	OR
9329	Fort Rucker	AL
9330	Fort Scott	KS
9331	Fort Shafter	HI
9332	Fort Shaw	MT
9333	Fort Sheridan	IL
9334	Fort Sill	OK
9335	Fort Smith	AR
9336	Fort Stanton	NM
9337	Fort Stewart	GA
9338	Fort Stockton	TX
9339	Fort Sumner	NM
9340	Fort Supply	OK
9341	Fort Thomas	AZ
9342	Fort Thomas	KY
9343	Fort Thompson	SD
9344	Fort Totten	ND
9345	Fort Towson	OK
9346	Fort Valley	GA
9347	Fort Valley	VA
9348	Fort Wainwright	AK
9349	Fort Walton Beach	FL
9350	Fort Washakie	WY
9351	Fort Washington	MD
9352	Fort Washington	PA
9353	Fort Wayne	IN
9354	Fort White	FL
9355	Fort Wingate	NM
9356	Fort Worth	TX
9357	Fort Yates	ND
9358	Fort Yukon	AK
9359	Fortescue	NJ
9360	Fortine	MT
9361	Fortson	GA
9362	Fortuna	CA
9363	Fortuna	MO
9364	Fortuna	ND
9365	Fortville	IN
9366	Foss	OK
9367	Fossil	OR
9368	Fosston	MN
9369	Foster	KY
9370	Foster	MO
9371	Foster	OK
9372	Foster	OR
9373	Foster	RI
9374	Foster	VA
9375	Foster	WV
9376	Foster City	MI
9377	Fosters	AL
9378	Fosterville	TN
9379	Fostoria	IA
9380	Fostoria	KS
9381	Fostoria	MI
9382	Fostoria	OH
9383	Fouke	AR
9384	Fountain	CO
9385	Fountain	FL
9386	Fountain	MI
9387	Fountain	MN
9388	Fountain	NC
9389	Fountain City	IN
9390	Fountain City	WI
9391	Fountain Green	UT
9392	Fountain Hill	AR
9393	Fountain Hills	AZ
9394	Fountain Inn	SC
9395	Fountain Run	KY
9396	Fountain Valley	CA
9397	Fountaintown	IN
9398	Fountainville	PA
9399	Four Corners	WY
9400	Four Lakes	WA
9401	Four Oaks	NC
9402	Four States	WV
9403	Fourmile	KY
9404	Fowler	CA
9405	Fowler	CO
9406	Fowler	IL
9407	Fowler	IN
9408	Fowler	KS
9409	Fowler	MI
9410	Fowler	OH
9411	Fowlerton	IN
9412	Fowlerton	TX
9413	Fowlerville	MI
9414	Fowlstown	GA
9415	Fox	AR
9416	Fox	OK
9417	Fox Island	WA
9418	Fox Lake	IL
9419	Fox Lake	WI
9420	Fox River Grove	IL
9421	Fox Valley	IL
9422	Foxboro	MA
9423	Foxboro	WI
9424	Foxburg	PA
9425	Foxhome	MN
9426	Foxworth	MS
9427	Foyil	OK
9428	Frackville	PA
9429	Frakes	KY
9430	Frametown	WV
9431	Framingham	MA
9432	Francestown	NH
9433	Francesville	IN
9434	Francis	OK
9435	Francis Creek	WI
9436	Francisco	IN
9437	Francitas	TX
9438	Franconia	NH
9439	Franconia	PA
9440	Frankenmuth	MI
9441	Frankewing	TN
9442	Frankford	DE
9443	Frankford	MO
9444	Frankford	WV
9445	Frankfort	IL
9446	Frankfort	IN
9447	Frankfort	KS
9448	Frankfort	KY
9449	Frankfort	ME
9450	Frankfort	MI
9451	Frankfort	NY
9452	Frankfort	OH
9453	Frankfort	SD
9454	Frankfort Heights	IL
9455	Franklin	AL
9456	Franklin	AR
9457	Franklin	GA
9458	Franklin	ID
9459	Franklin	IL
9460	Franklin	IN
9461	Franklin	KS
9462	Franklin	KY
9463	Franklin	LA
9464	Franklin	MA
9465	Franklin	ME
9466	Franklin	MI
9467	Franklin	MN
9468	Franklin	MO
9469	Franklin	NC
9470	Franklin	NE
9471	Franklin	NH
9472	Franklin	NJ
9473	Franklin	NY
9474	Franklin	OH
9475	Franklin	PA
9476	Franklin	TN
9477	Franklin	TX
9478	Franklin	VA
9479	Franklin	VT
9480	Franklin	WI
9481	Franklin	WV
9482	Franklin Furnace	OH
9483	Franklin Grove	IL
9484	Franklin Lakes	NJ
9485	Franklin Park	IL
9486	Franklin Park	NJ
9487	Franklin Springs	GA
9488	Franklin Springs	NY
9489	Franklin Square	NY
9490	Franklinton	LA
9491	Franklinton	NC
9492	Franklintown	PA
9493	Franklinville	NC
9494	Franklinville	NJ
9495	Franklinville	NY
9496	Frankston	TX
9497	Franksville	WI
9498	Frankton	IN
9499	Franktown	CO
9500	Franktown	VA
9501	Frankville	AL
9502	Frannie	WY
9503	Fraser	CO
9504	Fraser	MI
9505	Frazee	MN
9506	Frazer	MT
9507	Frazeysburg	OH
9508	Frazier Park	CA
9509	Fraziers Bottom	WV
9510	Fred	TX
9511	Frederic	MI
9512	Frederic	WI
9513	Frederica	DE
9514	Frederick	CO
9515	Frederick	IL
9516	Frederick	MD
9517	Frederick	OK
9518	Frederick	PA
9519	Frederick	SD
9520	Fredericksburg	IA
9521	Fredericksburg	IN
9522	Fredericksburg	OH
9523	Fredericksburg	PA
9524	Fredericksburg	TX
9525	Fredericksburg	VA
9526	Fredericktown	MO
9527	Fredericktown	OH
9528	Fredericktown	PA
9529	Frederika	IA
9530	Fredonia	AZ
9531	Fredonia	KS
9532	Fredonia	KY
9533	Fredonia	ND
9534	Fredonia	NY
9535	Fredonia	PA
9536	Fredonia	TX
9537	Fredonia	WI
9538	Free Soil	MI
9539	Free Union	VA
9540	Freeborn	MN
9541	Freeburg	IL
9542	Freeburg	MO
9543	Freeburg	PA
9544	Freeburn	KY
9545	Freedom	CA
9546	Freedom	IN
9547	Freedom	ME
9548	Freedom	NH
9549	Freedom	NY
9550	Freedom	OK
9551	Freedom	PA
9552	Freedom	WI
9553	Freedom	WY
9554	Freehold	NJ
9555	Freehold	NY
9556	Freeland	MD
9557	Freeland	MI
9558	Freeland	PA
9559	Freeland	WA
9560	Freelandville	IN
9561	Freeman	MO
9562	Freeman	SD
9563	Freeman	VA
9564	Freeman	WV
9565	Freeman Spur	IL
9566	Freeport	FL
9567	Freeport	IL
9568	Freeport	KS
9569	Freeport	ME
9570	Freeport	MI
9571	Freeport	MN
9572	Freeport	NY
9573	Freeport	OH
9574	Freeport	PA
9575	Freeport	TX
9576	Freer	TX
9577	Freetown	IN
9578	Freeville	NY
9579	Freistatt	MO
9580	Fremont	CA
9581	Fremont	IA
9582	Fremont	IN
9583	Fremont	MI
9584	Fremont	MO
9585	Fremont	NC
9586	Fremont	NE
9587	Fremont	NH
9588	Fremont	OH
9589	Fremont	WI
9590	Fremont Center	NY
9591	French Camp	CA
9592	French Camp	MS
9593	French Creek	WV
9594	French Gulch	CA
9595	French Lick	IN
9596	French Settlement	LA
9597	French Village	MO
9598	Frenchboro	ME
9599	Frenchburg	KY
9600	Frenchglen	OR
9601	Frenchmans Bayou	AR
9602	Frenchton	WV
9603	Frenchtown	MT
9604	Frenchtown	NJ
9605	Frenchville	ME
9606	Frenchville	PA
9607	Fresh Meadows	NY
9608	Fresno	CA
9609	Fresno	OH
9610	Fresno	TX
9611	Frewsburg	NY
9612	Friant	CA
9613	Friars Point	MS
9614	Friday Harbor	WA
9615	Friedens	PA
9616	Friedensburg	PA
9617	Friedheim	MO
9618	Friend	NE
9619	Friendly	WV
9620	Friendship	AR
9621	Friendship	IN
9622	Friendship	MD
9623	Friendship	ME
9624	Friendship	NY
9625	Friendship	OH
9626	Friendship	TN
9627	Friendship	WI
9628	Friendsville	MD
9629	Friendsville	PA
9630	Friendsville	TN
9631	Friendswood	TX
9632	Frierson	LA
9633	Fries	VA
9634	Friesland	WI
9635	Friona	TX
9636	Frisco	CO
9637	Frisco	NC
9638	Frisco	TX
9639	Frisco City	AL
9640	Fritch	TX
9641	Frohna	MO
9642	Froid	MT
9643	Fromberg	MT
9644	Front Royal	VA
9645	Frontenac	KS
9646	Frontenac	MN
9647	Frontier	MI
9648	Frontier	WY
9649	Frost	MN
9650	Frost	TX
9651	Frostburg	MD
9652	Frostburg	PA
9653	Frostproof	FL
9654	Fruita	CO
9655	Fruitdale	AL
9656	Fruithurst	AL
9657	Fruitland	IA
9658	Fruitland	ID
9659	Fruitland	MD
9660	Fruitland	NM
9661	Fruitland	UT
9662	Fruitland	WA
9663	Fruitland Park	FL
9664	Fruitport	MI
9665	Fruitvale	TN
9666	Fruitvale	TX
9667	Fryburg	PA
9668	Fryeburg	ME
9669	Ft Mitchell	KY
9670	Ft Myer	VA
9671	Ft Warren Afb	WY
9672	Fulda	IN
9673	Fulda	MN
9674	Fulks Run	VA
9675	Fullerton	CA
9676	Fullerton	ND
9677	Fullerton	NE
9678	Fulshear	TX
9679	Fulton	AL
9680	Fulton	AR
9681	Fulton	CA
9682	Fulton	IL
9683	Fulton	IN
9684	Fulton	KS
9685	Fulton	KY
9686	Fulton	MD
9687	Fulton	MI
9688	Fulton	MO
9689	Fulton	MS
9690	Fulton	NY
9691	Fulton	OH
9692	Fulton	SD
9693	Fulton	TX
9694	Fultondale	AL
9695	Fultonham	NY
9696	Fultonham	OH
9697	Fultonville	NY
9698	Fults	IL
9699	Funk	NE
9700	Funkstown	MD
9701	Funston	GA
9702	Fuquay Varina	NC
9703	Furlong	PA
9704	Furman	AL
9705	Furman	SC
9706	Fyffe	AL
9707	Gaastra	MI
9708	Gabbs	NV
9709	Gable	SC
9710	Gabriels	NY
9711	Gackle	ND
9712	Gadsden	AL
9713	Gadsden	AZ
9714	Gadsden	SC
9715	Gadsden	TN
9716	Gaffney	SC
9717	Gage	OK
9718	Gagetown	MI
9719	Gail	TX
9720	Gaines	MI
9721	Gaines	PA
9722	Gainesboro	TN
9723	Gainestown	AL
9724	Gainesville	AL
9725	Gainesville	FL
9726	Gainesville	GA
9727	Gainesville	MO
9728	Gainesville	NY
9729	Gainesville	TX
9730	Gainesville	VA
9731	Gaithersburg	MD
9732	Gakona	AK
9733	Galata	MT
9734	Galatia	IL
9735	Galax	VA
9736	Galena	AK
9737	Galena	IL
9738	Galena	KS
9739	Galena	MD
9740	Galena	MO
9741	Galena	OH
9742	Galena Park	TX
9743	Gales Creek	OR
9744	Gales Ferry	CT
9745	Galesburg	IL
9746	Galesburg	KS
9747	Galesburg	MI
9748	Galesburg	ND
9749	Galesville	MD
9750	Galesville	WI
9751	Galeton	CO
9752	Galeton	PA
9753	Galien	MI
9754	Galion	OH
9755	Galivants Ferry	SC
9756	Gallagher	WV
9757	Gallant	AL
9758	Gallatin	MO
9759	Gallatin	TN
9760	Gallatin	TX
9761	Gallatin Gateway	MT
9762	Gallaway	TN
9763	Galliano	LA
9764	Gallina	NM
9765	Gallion	AL
9766	Gallipolis	OH
9767	Gallipolis Ferry	WV
9768	Gallitzin	PA
9769	Gallman	MS
9770	Galloway	OH
9771	Galloway	WI
9772	Galloway	WV
9773	Gallup	NM
9774	Gallupville	NY
9775	Galt	CA
9776	Galt	IA
9777	Galt	IL
9778	Galt	MO
9779	Galva	IA
9780	Galva	IL
9781	Galva	KS
9782	Galveston	IN
9783	Galveston	TX
9784	Galvin	WA
9785	Galway	NY
9786	Gamaliel	AR
9787	Gamaliel	KY
9788	Gambell	AK
9789	Gambier	OH
9790	Gambrills	MD
9791	Gamerco	NM
9792	Ganado	AZ
9793	Ganado	TX
9794	Gandeeville	WV
9795	Gann Valley	SD
9796	Gans	OK
9797	Gans	PA
9798	Gansevoort	NY
9799	Gantt	AL
9800	Gap	PA
9801	Gap Mills	WV
9802	Gapville	KY
9803	Garards Fort	PA
9804	Garber	IA
9805	Garber	OK
9806	Garberville	CA
9807	Garcia	CO
9808	Garciasville	TX
9809	Garden	MI
9810	Garden City	AL
9811	Garden City	IA
9812	Garden City	ID
9813	Garden City	KS
9814	Garden City	LA
9815	Garden City	MI
9816	Garden City	MN
9817	Garden City	MO
9818	Garden City	NY
9819	Garden City	SD
9820	Garden City	TX
9821	Garden City	UT
9822	Garden Grove	CA
9823	Garden Grove	IA
9824	Garden Plain	KS
9825	Garden Prairie	IL
9826	Garden Valley	CA
9827	Garden Valley	ID
9828	Gardena	CA
9829	Gardendale	AL
9830	Gardendale	TX
9831	Gardenville	PA
9832	Gardiner	ME
9833	Gardiner	MT
9834	Gardiner	NY
9835	Gardiner	OR
9836	Gardner	CO
9837	Gardner	IL
9838	Gardner	KS
9839	Gardner	LA
9840	Gardner	MA
9841	Gardner	ND
9842	Gardners	PA
9843	Gardnerville	NV
9844	Garfield	AR
9845	Garfield	GA
9846	Garfield	KS
9847	Garfield	KY
9848	Garfield	MN
9849	Garfield	NJ
9850	Garfield	NM
9851	Garfield	WA
9852	Garibaldi	OR
9853	Garita	NM
9854	Garland	KS
9855	Garland	ME
9856	Garland	NC
9857	Garland	NE
9858	Garland	PA
9859	Garland	TX
9860	Garland	UT
9861	Garland City	AR
9862	Garnavillo	IA
9863	Garner	AR
9864	Garner	IA
9865	Garner	KY
9866	Garner	NC
9867	Garnerville	NY
9868	Garnett	KS
9869	Garnett	SC
9870	Garrard	KY
9871	Garrattsville	NY
9872	Garretson	SD
9873	Garrett	IN
9874	Garrett	KY
9875	Garrett	PA
9876	Garrett	WY
9877	Garrett Park	MD
9878	Garrettsville	OH
9879	Garrison	IA
9880	Garrison	KY
9881	Garrison	MN
9882	Garrison	MO
9883	Garrison	MT
9884	Garrison	ND
9885	Garrison	NY
9886	Garrison	TX
9887	Garrison	UT
9888	Garrisonville	VA
9889	Garryowen	MT
9890	Garvin	MN
9891	Garvin	OK
9892	Garwin	IA
9893	Garwood	NJ
9894	Garwood	TX
9895	Gary	IN
9896	Gary	MN
9897	Gary	SD
9898	Gary	TX
9899	Gary	WV
9900	Garysburg	NC
9901	Garyville	LA
9902	Gas	KS
9903	Gas City	IN
9904	Gasburg	VA
9905	Gasconade	MO
9906	Gasport	NY
9907	Gasquet	CA
9908	Gassaway	WV
9909	Gassville	AR
9910	Gaston	IN
9911	Gaston	NC
9912	Gaston	OR
9913	Gaston	SC
9914	Gastonia	NC
9915	Gastonville	PA
9916	Gate	OK
9917	Gate City	VA
9918	Gates	NC
9919	Gates	OR
9920	Gates	TN
9921	Gates Mills	OH
9922	Gatesville	NC
9923	Gatesville	TX
9924	Gateway	AR
9925	Gateway	CO
9926	Gatewood	MO
9927	Gatlinburg	TN
9928	Gattman	MS
9929	Gatzke	MN
9930	Gauley Bridge	WV
9931	Gause	TX
9932	Gautier	MS
9933	Gay	GA
9934	Gay	WV
9935	Gaylesville	AL
9936	Gaylord	KS
9937	Gaylord	MI
9938	Gaylord	MN
9939	Gaylordsville	CT
9940	Gays	IL
9941	Gays Creek	KY
9942	Gays Mills	WI
9943	Gaysville	VT
9944	Gayville	SD
9945	Gazelle	CA
9946	Geary	OK
9947	Geddes	SD
9948	Geff	IL
9949	Geigertown	PA
9950	Geismar	LA
9951	Gem	KS
9952	Gene Autry	OK
9953	Genesee	ID
9954	Genesee	MI
9955	Genesee	PA
9956	Genesee Depot	WI
9957	Geneseo	IL
9958	Geneseo	KS
9959	Geneseo	NY
9960	Geneva	AL
9961	Geneva	FL
9962	Geneva	GA
9963	Geneva	IA
9964	Geneva	ID
9965	Geneva	IL
9966	Geneva	IN
9967	Geneva	MN
9968	Geneva	NE
9969	Geneva	NY
9970	Geneva	OH
9971	Genoa	AR
9972	Genoa	CO
9973	Genoa	IL
9974	Genoa	NE
9975	Genoa	NV
9976	Genoa	NY
9977	Genoa	OH
9978	Genoa	WI
9979	Genoa	WV
9980	Genoa City	WI
9981	Gentry	AR
9982	Gentry	MO
9983	Gentryville	IN
9984	George	IA
9985	George	WA
9986	George West	TX
9987	Georges Mills	NH
9988	Georgetown	CA
9989	Georgetown	CO
9990	Georgetown	CT
9991	Georgetown	DE
9992	Georgetown	FL
9993	Georgetown	GA
9994	Georgetown	ID
9995	Georgetown	IL
9996	Georgetown	IN
9997	Georgetown	KY
9998	Georgetown	LA
9999	Georgetown	MA
10000	Georgetown	MD
10001	Georgetown	ME
10002	Georgetown	MN
10003	Georgetown	MS
10004	Georgetown	NY
10005	Georgetown	OH
10006	Georgetown	PA
10007	Georgetown	SC
10008	Georgetown	TN
10009	Georgetown	TX
10010	Georgiana	AL
10011	Gepp	AR
10012	Gerald	MO
10013	Geraldine	AL
10014	Geraldine	MT
10015	Gerber	CA
10016	Gering	NE
10017	Gerlach	NV
10018	Gerlaw	IL
10019	German Valley	IL
10020	Germansville	PA
10021	Germanton	NC
10022	Germantown	IL
10023	Germantown	KY
10024	Germantown	MD
10025	Germantown	NY
10026	Germantown	OH
10027	Germantown	TN
10028	Germantown	WI
10029	Germfask	MI
10030	Geronimo	OK
10031	Geronimo	TX
10032	Gerrardstown	WV
10033	Gerry	NY
10034	Gerton	NC
10035	Gervais	OR
10036	Gettysburg	OH
10037	Gettysburg	PA
10038	Gettysburg	SD
10039	Getzville	NY
10040	Geuda Springs	KS
10041	Geyser	MT
10042	Geyserville	CA
10043	Gheens	LA
10044	Ghent	KY
10045	Ghent	MN
10046	Ghent	NY
10047	Ghent	WV
10048	Gibbon	MN
10049	Gibbon	NE
10050	Gibbon Glade	PA
10051	Gibbonsville	ID
10052	Gibbs	MO
10053	Gibbsboro	NJ
10054	Gibbstown	NJ
10055	Gibsland	LA
10056	Gibson	GA
10057	Gibson	IA
10058	Gibson	LA
10059	Gibson	MO
10060	Gibson	NC
10061	Gibson	PA
10062	Gibson	TN
10063	Gibson City	IL
10064	Gibson Island	MD
10065	Gibsonburg	OH
10066	Gibsonia	PA
10067	Gibsonton	FL
10068	Gibsonville	NC
10069	Giddings	TX
10070	Gideon	MO
10071	Gifford	IA
10072	Gifford	IL
10073	Gifford	PA
10074	Gifford	SC
10075	Gifford	WA
10076	Gig Harbor	WA
10077	Gila	NM
10078	Gila Bend	AZ
10079	Gilbert	AR
10080	Gilbert	AZ
10081	Gilbert	IA
10082	Gilbert	LA
10083	Gilbert	MN
10084	Gilbert	PA
10085	Gilbert	SC
10086	Gilbert	WV
10087	Gilberton	PA
10088	Gilbertown	AL
10089	Gilberts	IL
10090	Gilbertsville	KY
10091	Gilbertsville	NY
10092	Gilbertsville	PA
10093	Gilbertville	IA
10094	Gilbertville	MA
10095	Gilboa	NY
10096	Gilboa	WV
10097	Gilby	ND
10098	Gilchrist	OR
10099	Gilchrist	TX
10100	Gilcrest	CO
10101	Gildford	MT
10102	Gile	WI
10103	Gilead	NE
10104	Gilford	MI
10105	Gilford	NH
10106	Gill	CO
10107	Gill	MA
10108	Gillespie	IL
10109	Gillett	AR
10110	Gillett	PA
10111	Gillett	TX
10112	Gillett	WI
10113	Gillett Grove	IA
10114	Gillette	NJ
10115	Gillette	WY
10116	Gillham	AR
10117	Gilliam	LA
10118	Gilliam	MO
10119	Gillsville	GA
10120	Gilman	CT
10121	Gilman	IA
10122	Gilman	IL
10123	Gilman	MN
10124	Gilman	VT
10125	Gilman	WI
10126	Gilman City	MO
10127	Gilmanton	NH
10128	Gilmanton	WI
10129	Gilmanton Iron Works	NH
10130	Gilmer	TX
10131	Gilmore	AR
10132	Gilmore City	IA
10133	Gilroy	CA
10134	Gilson	IL
10135	Gilsum	NH
10136	Giltner	NE
10137	Gipsy	MO
10138	Gipsy	PA
10139	Girard	GA
10140	Girard	IL
10141	Girard	KS
10142	Girard	OH
10143	Girard	PA
10144	Girard	TX
10145	Girardville	PA
10146	Girdler	KY
10147	Girdletree	MD
10148	Girdwood	AK
10149	Girvin	TX
10150	Given	WV
10151	Gladbrook	IA
10152	Glade	KS
10153	Glade Hill	VA
10154	Glade Park	CO
10155	Glade Spring	VA
10156	Glade Valley	NC
10157	Gladeville	TN
10158	Gladewater	TX
10159	Gladstone	IL
10160	Gladstone	MI
10161	Gladstone	ND
10162	Gladstone	NJ
10163	Gladstone	NM
10164	Gladstone	OR
10165	Gladstone	VA
10166	Gladwin	MI
10167	Gladwyne	PA
10168	Glady	WV
10169	Gladys	VA
10170	Glandorf	OH
10171	Glasco	KS
10172	Glasco	NY
10173	Glasford	IL
10174	Glasgow	KY
10175	Glasgow	MO
10176	Glasgow	MT
10177	Glasgow	PA
10178	Glasgow	VA
10179	Glasgow	WV
10180	Glassboro	NJ
10181	Glasser	NJ
10182	Glassport	PA
10183	Glasston	ND
10184	Glastonbury	CT
10185	Gleason	TN
10186	Gleason	WI
10187	Glen	MS
10188	Glen	MT
10189	Glen	NH
10190	Glen	WV
10191	Glen Allan	MS
10192	Glen Allen	AL
10193	Glen Allen	VA
10194	Glen Alpine	NC
10195	Glen Arbor	MI
10196	Glen Arm	MD
10197	Glen Aubrey	NY
10198	Glen Burnie	MD
10199	Glen Campbell	PA
10200	Glen Carbon	IL
10201	Glen Cove	ME
10202	Glen Cove	NY
10203	Glen Dale	WV
10204	Glen Daniel	WV
10205	Glen Easton	WV
10206	Glen Echo	MD
10207	Glen Elder	KS
10208	Glen Ellen	CA
10209	Glen Ellyn	IL
10210	Glen Ferris	WV
10211	Glen Flora	TX
10212	Glen Flora	WI
10213	Glen Fork	WV
10214	Glen Gardner	NJ
10215	Glen Haven	CO
10216	Glen Haven	WI
10217	Glen Head	NY
10218	Glen Hope	PA
10219	Glen Jean	WV
10220	Glen Lyn	VA
10221	Glen Lyon	PA
10222	Glen Mills	PA
10223	Glen Oaks	NY
10224	Glen Richey	PA
10225	Glen Riddle Lima	PA
10226	Glen Ridge	NJ
10227	Glen Rock	NJ
10228	Glen Rock	PA
10229	Glen Rogers	WV
10230	Glen Rose	TX
10231	Glen Saint Mary	FL
10232	Glen Spey	NY
10233	Glen Ullin	ND
10234	Glen White	WV
10235	Glen Wild	NY
10236	Glen Wilton	VA
10237	Glenallen	MO
10238	Glenarm	IL
10239	Glenbeulah	WI
10240	Glenbrook	NV
10241	Glenburn	ND
10242	Glencliff	NH
10243	Glencoe	AR
10244	Glencoe	CA
10245	Glencoe	IL
10246	Glencoe	KY
10247	Glencoe	MN
10248	Glencoe	MO
10249	Glencoe	NM
10250	Glencoe	OH
10251	Glencoe	OK
10252	Glencross	SD
10253	Glendale	AZ
10254	Glendale	CA
10255	Glendale	KY
10256	Glendale	MA
10257	Glendale	OR
10258	Glendale	RI
10259	Glendale	SC
10260	Glendale	UT
10261	Glendale Heights	IL
10262	Glendale Luke Afb	AZ
10263	Glendale Springs	NC
10264	Glendive	MT
10265	Glendo	WY
10266	Glendora	CA
10267	Glendora	MS
10268	Glendora	NJ
10269	Gleneden Beach	OR
10270	Glenelg	MD
10271	Glenfield	ND
10272	Glenfield	NY
10273	Glenford	NY
10274	Glenford	OH
10275	Glengary	WV
10276	Glenham	NY
10277	Glenham	SD
10278	Glenhaven	CA
10279	Glenmont	NY
10280	Glenmont	OH
10281	Glenmoore	PA
10282	Glenmora	LA
10283	Glenn	CA
10284	Glenn	GA
10285	Glenn	MI
10286	Glenn Dale	MD
10287	Glennallen	AK
10288	Glennie	MI
10289	Glenns Ferry	ID
10290	Glennville	CA
10291	Glennville	GA
10292	Glenolden	PA
10293	Glenoma	WA
10294	Glenpool	OK
10295	Glenrock	WY
10296	Glens Falls	NY
10297	Glens Fork	KY
10298	Glenshaw	PA
10299	Glenside	PA
10300	Glentana	MT
10301	Glenview	IL
10302	Glenview	KY
10303	Glenvil	NE
10304	Glenville	MN
10305	Glenville	NC
10306	Glenville	PA
10307	Glenville	WV
10308	Glenwood	AL
10309	Glenwood	AR
10310	Glenwood	FL
10311	Glenwood	GA
10312	Glenwood	IA
10313	Glenwood	IL
10314	Glenwood	IN
10315	Glenwood	MD
10316	Glenwood	MN
10317	Glenwood	MO
10318	Glenwood	NC
10319	Glenwood	NJ
10320	Glenwood	NM
10321	Glenwood	NY
10322	Glenwood	UT
10323	Glenwood	WA
10324	Glenwood	WV
10325	Glenwood City	WI
10326	Glenwood Landing	NY
10327	Glenwood Springs	CO
10328	Glidden	IA
10329	Glidden	TX
10330	Glidden	WI
10331	Glide	OR
10332	Globe	AZ
10333	Glorieta	NM
10334	Gloster	LA
10335	Gloster	MS
10336	Gloucester	MA
10337	Gloucester	NC
10338	Gloucester	VA
10339	Gloucester City	NJ
10340	Gloucester Point	VA
10341	Glouster	OH
10342	Glover	VT
10343	Gloversville	NY
10344	Gloverville	SC
10345	Glyndon	MD
10346	Glyndon	MN
10347	Glynn	LA
10348	Gnadenhutten	OH
10349	Gober	TX
10350	Gobler	MO
10351	Gobles	MI
10352	Goddard	KS
10353	Godfrey	IL
10354	Godley	TX
10355	Godwin	NC
10356	Goehner	NE
10357	Goessel	KS
10358	Goetzville	MI
10359	Goff	KS
10360	Goffstown	NH
10361	Golconda	IL
10362	Golconda	NV
10363	Gold Bar	WA
10364	Gold Beach	OR
10365	Gold Creek	MT
10366	Gold Hill	NC
10367	Gold Hill	OR
10368	Gold Run	CA
10369	Golden	CO
10370	Golden	IL
10371	Golden	MO
10372	Golden	MS
10373	Golden	OK
10374	Golden	TX
10375	Golden City	MO
10376	Golden Eagle	IL
10377	Golden Gate	IL
10378	Golden Meadow	LA
10379	Golden Valley	AZ
10380	Golden Valley	ND
10381	Goldendale	WA
10382	Goldenrod	FL
10383	Goldens Bridge	NY
10384	Goldfield	IA
10385	Goldfield	NV
10386	Goldonna	LA
10387	Goldsboro	MD
10388	Goldsboro	NC
10389	Goldsboro	TX
10390	Goldsmith	IN
10391	Goldsmith	TX
10392	Goldston	NC
10393	Goldthwaite	TX
10394	Goldvein	VA
10395	Goleta	CA
10396	Golf	IL
10397	Goliad	TX
10398	Goltry	OK
10399	Golva	ND
10400	Gomer	OH
10401	Gonvick	MN
10402	Gonzales	CA
10403	Gonzales	LA
10404	Gonzales	TX
10405	Gonzalez	FL
10406	Goochland	VA
10407	Good Hart	MI
10408	Good Hope	GA
10409	Good Hope	IL
10410	Good Thunder	MN
10411	Goode	VA
10412	Goodell	IA
10413	Goodells	MI
10414	Goodfellow Afb	TX
10415	Goodfield	IL
10416	Goodhue	MN
10417	Gooding	ID
10418	Goodland	FL
10419	Goodland	IN
10420	Goodland	KS
10421	Goodland	MN
10422	Goodlettsville	TN
10423	Goodman	MO
10424	Goodman	MS
10425	Goodman	WI
10426	Goodnews Bay	AK
10427	Goodrich	MI
10428	Goodrich	ND
10429	Goodrich	TX
10430	Goodridge	MN
10431	Goodspring	TN
10432	Goodsprings	AL
10433	Goodview	VA
10434	Goodville	PA
10435	Goodwater	AL
10436	Goodway	AL
10437	Goodwell	OK
10438	Goodwin	AR
10439	Goodwin	SD
10440	Goodwine	IL
10441	Goodyear	AZ
10442	Goodyears Bar	CA
10443	Goose Creek	SC
10444	Goose Lake	IA
10445	Goose Prairie	WA
10446	Goose Rock	KY
10447	Gordo	AL
10448	Gordon	AL
10449	Gordon	GA
10450	Gordon	KY
10451	Gordon	NE
10452	Gordon	PA
10453	Gordon	TX
10454	Gordon	WI
10455	Gordon	WV
10456	Gordonsville	TN
10457	Gordonsville	VA
10458	Gordonville	MO
10459	Gordonville	PA
10460	Gordonville	TX
10461	Gore	OK
10462	Gore	VA
10463	Gore Springs	MS
10464	Goree	TX
10465	Goreville	IL
10466	Gorham	IL
10467	Gorham	KS
10468	Gorham	ME
10469	Gorham	NH
10470	Gorham	NY
10471	Gorin	MO
10472	Gorman	TX
10473	Gormania	WV
10474	Gorum	LA
10475	Goshen	AL
10476	Goshen	AR
10477	Goshen	CA
10478	Goshen	CT
10479	Goshen	IN
10480	Goshen	KY
10481	Goshen	MA
10482	Goshen	NH
10483	Goshen	NJ
10484	Goshen	NY
10485	Goshen	OH
10486	Goshen	UT
10487	Goshen	VA
10488	Gosnell	AR
10489	Gosport	IN
10490	Gotebo	OK
10491	Gotha	FL
10492	Gotham	WI
10493	Gothenburg	NE
10494	Gough	GA
10495	Gould	AR
10496	Gould	OK
10497	Gould City	MI
10498	Gouldbusk	TX
10499	Gouldsboro	ME
10500	Gouldsboro	PA
10501	Gouverneur	NY
10502	Gove	KS
10503	Government Camp	OR
10504	Gowanda	NY
10505	Gowen	MI
10506	Gowen	OK
10507	Gower	MO
10508	Gowrie	IA
10509	Grabill	IN
10510	Grace	ID
10511	Grace	MS
10512	Grace City	ND
10513	Gracemont	OK
10514	Graceville	FL
10515	Graceville	MN
10516	Gracewood	GA
10517	Gracey	KY
10518	Grady	AL
10519	Grady	AR
10520	Grady	NM
10521	Gradyville	KY
10522	Gradyville	PA
10523	Graettinger	IA
10524	Graff	MO
10525	Graford	TX
10526	Grafton	IA
10527	Grafton	IL
10528	Grafton	MA
10529	Grafton	ND
10530	Grafton	NE
10531	Grafton	NH
10532	Grafton	NY
10533	Grafton	OH
10534	Grafton	VT
10535	Grafton	WI
10536	Grafton	WV
10537	Graham	AL
10538	Graham	FL
10539	Graham	KY
10540	Graham	MO
10541	Graham	NC
10542	Graham	OK
10543	Graham	TX
10544	Graham	WA
10545	Grahamsville	NY
10546	Grahn	KY
10547	Grain Valley	MO
10548	Grainfield	KS
10549	Grambling	LA
10550	Gramercy	LA
10551	Gramling	SC
10552	Grammer	IN
10553	Grampian	PA
10554	Granada	CO
10555	Granada	MN
10556	Granada Hills	CA
10557	Granbury	TX
10558	Granby	CO
10559	Granby	CT
10560	Granby	MA
10561	Granby	MO
10562	Granby	VT
10563	Grand Bay	AL
10564	Grand Blanc	MI
10565	Grand Cane	LA
10566	Grand Canyon	AZ
10567	Grand Chain	IL
10568	Grand Chenier	LA
10569	Grand Coteau	LA
10570	Grand Coulee	WA
10571	Grand Forks	ND
10572	Grand Forks Afb	ND
10573	Grand Gorge	NY
10574	Grand Haven	MI
10575	Grand Island	FL
10576	Grand Island	NE
10577	Grand Island	NY
10578	Grand Isle	LA
10579	Grand Isle	ME
10580	Grand Isle	VT
10581	Grand Junction	CO
10582	Grand Junction	IA
10583	Grand Junction	MI
10584	Grand Junction	TN
10585	Grand Lake	CO
10586	Grand Lake Stream	ME
10587	Grand Ledge	MI
10588	Grand Marais	MI
10589	Grand Marais	MN
10590	Grand Marsh	WI
10591	Grand Meadow	MN
10592	Grand Mound	IA
10593	Grand Portage	MN
10594	Grand Prairie	TX
10595	Grand Rmeisterdish_serverds	MI
10596	Grand Rmeisterdish_serverds	MN
10597	Grand Rmeisterdish_serverds	OH
10598	Grand Ridge	FL
10599	Grand Ridge	IL
10600	Grand River	IA
10601	Grand River	OH
10602	Grand Rivers	KY
10603	Grand Ronde	OR
10604	Grand Saline	TX
10605	Grand Terrace	CA
10606	Grand Tower	IL
10607	Grand Valley	PA
10608	Grand View	ID
10609	Grand View	WI
10610	Grandfalls	TX
10611	Grandfield	OK
10612	Grandin	FL
10613	Grandin	MO
10614	Grandin	ND
10615	Grandview	IA
10616	Grandview	IN
10617	Grandview	MO
10618	Grandview	TN
10619	Grandview	TX
10620	Grandview	WA
10621	Grandville	MI
10622	Grandy	MN
10623	Grandy	NC
10624	Granger	IA
10625	Granger	IN
10626	Granger	MO
10627	Granger	TX
10628	Granger	WA
10629	Granger	WY
10630	Grangeville	ID
10631	Granite	CO
10632	Granite	OK
10633	Granite Bay	CA
10634	Granite Canon	WY
10635	Granite City	IL
10636	Granite Falls	MN
10637	Granite Falls	NC
10638	Granite Falls	WA
10639	Granite Quarry	NC
10640	Granite Springs	NY
10641	Graniteville	SC
10642	Graniteville	VT
10643	Grannis	AR
10644	Grant	AL
10645	Grant	CO
10646	Grant	FL
10647	Grant	IA
10648	Grant	LA
10649	Grant	MI
10650	Grant	NE
10651	Grant	OK
10652	Grant City	MO
10653	Grant Park	IL
10654	Grant Town	WV
10655	Grantham	NH
10656	Grantham	PA
10657	Granton	WI
10658	Grants	NM
10659	Grants Pass	OR
10660	Grantsboro	NC
10661	Grantsburg	IL
10662	Grantsburg	IN
10663	Grantsburg	WI
10664	Grantsdale	MT
10665	Grantsville	MD
10666	Grantsville	UT
10667	Grantsville	WV
10668	Grantville	GA
10669	Grantville	KS
10670	Grantville	PA
10671	Granville	IA
10672	Granville	IL
10673	Granville	MA
10674	Granville	ND
10675	Granville	NY
10676	Granville	OH
10677	Granville	PA
10678	Granville	TN
10679	Granville	VT
10680	Granville	WV
10681	Granville Summit	PA
10682	Grapeland	TX
10683	Grapeview	WA
10684	Grapeville	PA
10685	Grapevine	AR
10686	Grapevine	TX
10687	Grasonville	MD
10688	Grass Creek	IN
10689	Grass Lake	MI
10690	Grass Range	MT
10691	Grass Valley	CA
10692	Grass Valley	OR
10693	Grassflat	PA
10694	Grasston	MN
10695	Grassy Butte	ND
10696	Grassy Creek	NC
10697	Grassy Meadows	WV
10698	Gratiot	OH
10699	Gratiot	WI
10700	Gratis	OH
10701	Graton	CA
10702	Gratz	PA
10703	Gravel Switch	KY
10704	Gravelly	AR
10705	Graves Mill	VA
10706	Gravette	AR
10707	Gravity	IA
10708	Gravois Mills	MO
10709	Grawn	MI
10710	Gray	GA
10711	Gray	IA
10712	Gray	KY
10713	Gray	LA
10714	Gray	ME
10715	Gray	PA
10716	Gray Court	SC
10717	Gray Hawk	KY
10718	Gray Mountain	AZ
10719	Gray Summit	MO
10720	Grayland	WA
10721	Grayling	AK
10722	Grayling	MI
10723	Graymont	IL
10724	Grayridge	MO
10725	Grays Knob	KY
10726	Grays River	WA
10727	Grayslake	IL
10728	Grayson	GA
10729	Grayson	KY
10730	Grayson	LA
10731	Graysville	AL
10732	Graysville	GA
10733	Graysville	IN
10734	Graysville	OH
10735	Graysville	PA
10736	Graysville	TN
10737	Graytown	OH
10738	Grayville	IL
10739	Great Barrington	MA
10740	Great Bend	KS
10741	Great Bend	NY
10742	Great Bend	PA
10743	Great Cacapon	WV
10744	Great Falls	MT
10745	Great Falls	SC
10746	Great Falls	VA
10747	Great Lakes	IL
10748	Great Meadows	NJ
10749	Great Mills	MD
10750	Great Neck	NY
10751	Great River	NY
10752	Great Valley	NY
10753	Greeley	CO
10754	Greeley	IA
10755	Greeley	KS
10756	Greeley	NE
10757	Greeley	PA
10758	Greeleyville	SC
10759	Green	KS
10760	Green	OH
10761	Green Bank	WV
10762	Green Bay	VA
10763	Green Bay	WI
10764	Green Camp	OH
10765	Green Castle	MO
10766	Green City	MO
10767	Green Cove Springs	FL
10768	Green Creek	NJ
10769	Green Forest	AR
10770	Green Harbor	MA
10771	Green Isle	MN
10772	Green Lake	WI
10773	Green Lane	PA
10774	Green Mountain	NC
10775	Green Mountain Falls	CO
10776	Green Pond	AL
10777	Green Pond	SC
10778	Green Ridge	MO
10779	Green River	UT
10780	Green River	WY
10781	Green Road	KY
10782	Green Sea	SC
10783	Green Spring	WV
10784	Green Springs	OH
10785	Green Sulphur Springs	WV
10786	Green Valley	AZ
10787	Green Valley	IL
10788	Green Valley	WI
10789	Green Valley Lake	CA
10790	Green Village	NJ
10791	Greenacres	WA
10792	Greenback	TN
10793	Greenbackville	VA
10794	Greenbank	WA
10795	Greenbelt	MD
10796	Greenbrae	CA
10797	Greenbrier	AR
10798	Greenbrier	TN
10799	Greenbush	MA
10800	Greenbush	ME
10801	Greenbush	MI
10802	Greenbush	MN
10803	Greenbush	VA
10804	Greenbush	WI
10805	Greencastle	IN
10806	Greencastle	PA
10807	Greencreek	ID
10808	Greendale	WI
10809	Greendell	NJ
10810	Greene	IA
10811	Greene	ME
10812	Greene	NY
10813	Greene	RI
10814	Greeneville	TN
10815	Greenfield	CA
10816	Greenfield	IA
10817	Greenfield	IL
10818	Greenfield	IN
10819	Greenfield	MA
10820	Greenfield	MO
10821	Greenfield	NH
10822	Greenfield	OH
10823	Greenfield	OK
10824	Greenfield	TN
10825	Greenfield Center	NY
10826	Greenfield Park	NY
10827	Greenford	OH
10828	Greenhurst	NY
10829	Greenland	AR
10830	Greenland	MI
10831	Greenland	NH
10832	Greenlawn	NY
10833	Greenleaf	ID
10834	Greenleaf	KS
10835	Greenleaf	WI
10836	Greenock	PA
10837	Greenport	NY
10838	Greens Farms	CT
10839	Greens Fork	IN
10840	Greensboro	AL
10841	Greensboro	FL
10842	Greensboro	GA
10843	Greensboro	IN
10844	Greensboro	MD
10845	Greensboro	NC
10846	Greensboro	PA
10847	Greensboro	VT
10848	Greensboro Bend	VT
10849	Greensburg	IN
10850	Greensburg	KS
10851	Greensburg	KY
10852	Greensburg	LA
10853	Greensburg	PA
10854	Greentop	MO
10855	Greentown	IN
10856	Greentown	OH
10857	Greentown	PA
10858	Greenup	IL
10859	Greenup	KY
10860	Greenvale	NY
10861	Greenview	CA
10862	Greenview	IL
10863	Greenville	AL
10864	Greenville	CA
10865	Greenville	FL
10866	Greenville	GA
10867	Greenville	IA
10868	Greenville	IL
10869	Greenville	IN
10870	Greenville	KY
10871	Greenville	ME
10872	Greenville	MI
10873	Greenville	MO
10874	Greenville	MS
10875	Greenville	NC
10876	Greenville	NH
10877	Greenville	NY
10878	Greenville	OH
10879	Greenville	PA
10880	Greenville	RI
10881	Greenville	SC
10882	Greenville	TX
10883	Greenville	UT
10884	Greenville	VA
10885	Greenville	WI
10886	Greenville	WV
10887	Greenville Junction	ME
10888	Greenwald	MN
10889	Greenway	AR
10890	Greenway	VA
10891	Greenwell Springs	LA
10892	Greenwich	CT
10893	Greenwich	KS
10894	Greenwich	NJ
10895	Greenwich	NY
10896	Greenwich	OH
10897	Greenwich	UT
10898	Greenwood	AR
10899	Greenwood	CA
10900	Greenwood	DE
10901	Greenwood	FL
10902	Greenwood	IN
10903	Greenwood	LA
10904	Greenwood	ME
10905	Greenwood	MO
10906	Greenwood	MS
10907	Greenwood	NE
10908	Greenwood	NY
10909	Greenwood	SC
10910	Greenwood	TX
10911	Greenwood	VA
10912	Greenwood	WI
10913	Greenwood Lake	NY
10914	Greenwood Springs	MS
10915	Greer	AZ
10916	Greer	SC
10917	Gregory	AR
10918	Gregory	MI
10919	Gregory	SD
10920	Gregory	TX
10921	Greig	NY
10922	Grelton	OH
10923	Grenada	CA
10924	Grenada	MS
10925	Grenloch	NJ
10926	Grenola	KS
10927	Grenora	ND
10928	Grenville	NM
10929	Grenville	SD
10930	Gresham	NE
10931	Gresham	OR
10932	Gresham	SC
10933	Gresham	WI
10934	Grethel	KY
10935	Gretna	FL
10936	Gretna	LA
10937	Gretna	NE
10938	Gretna	VA
10939	Grey Eagle	MN
10940	Greybull	WY
10941	Greycliff	MT
10942	Greystone Park	NJ
10943	Gridley	CA
10944	Gridley	IL
10945	Gridley	KS
10946	Griffin	GA
10947	Griffin	IN
10948	Griffith	IN
10949	Griffithsville	WV
10950	Griffithville	AR
10951	Grifton	NC
10952	Griggsville	IL
10953	Grimes	CA
10954	Grimes	IA
10955	Grimesland	NC
10956	Grimsley	TN
10957	Grimstead	VA
10958	Grindstone	PA
10959	Grinnell	IA
10960	Grinnell	KS
10961	Grissom Arb	IN
10962	Griswold	IA
10963	Grizzly Flats	CA
10964	Groesbeck	TX
10965	Groom	TX
10966	Grosse Ile	MI
10967	Grosse Pointe	MI
10968	Grosse Tete	LA
10969	Grosvenor Dale	CT
10970	Groton	CT
10971	Groton	MA
10972	Groton	NY
10973	Groton	SD
10974	Groton	VT
10975	Grottoes	VA
10976	Grouse Creek	UT
10977	Grove	OK
10978	Grove City	MN
10979	Grove City	OH
10980	Grove City	PA
10981	Grove Hill	AL
10982	Groveland	CA
10983	Groveland	FL
10984	Groveland	IL
10985	Groveland	MA
10986	Groveland	NY
10987	Groveoak	AL
10988	Groveport	OH
10989	Grover	CO
10990	Grover	MO
10991	Grover	NC
10992	Grover	PA
10993	Grover	SC
10994	Grover	WY
10995	Grover Beach	CA
10996	Grover Hill	OH
10997	Grovertown	IN
10998	Groves	TX
10999	Grovespring	MO
11000	Groveton	TX
11001	Grovetown	GA
11002	Grubbs	AR
11003	Grubville	MO
11004	Gruetli Laager	TN
11005	Grulla	TX
11006	Grundy	VA
11007	Grundy Center	IA
11008	Gruver	IA
11009	Gruver	TX
11010	Grygla	MN
11011	Guadalupe	CA
11012	Guadalupita	NM
11013	Gualala	CA
11014	Guasti	CA
11015	Guatay	CA
11016	Guerneville	CA
11017	Guernsey	IA
11018	Guernsey	WY
11019	Guerra	TX
11020	Gueydan	LA
11021	Guffey	CO
11022	Guide Rock	NE
11023	Guild	NH
11024	Guild	TN
11025	Guilderland	NY
11026	Guilderland Center	NY
11027	Guildhall	VT
11028	Guilford	CT
11029	Guilford	IN
11030	Guilford	ME
11031	Guilford	MO
11032	Guilford	NY
11033	Guin	AL
11034	Guinda	CA
11035	Guion	AR
11036	Gulf	NC
11037	Gulf Breeze	FL
11038	Gulf Hammock	FL
11039	Gulf Shores	AL
11040	Gulfport	MS
11041	Gulliver	MI
11042	Gully	MN
11043	Gulston	KY
11044	Gum Spring	VA
11045	Gunlock	KY
11046	Gunlock	UT
11047	Gunnison	CO
11048	Gunnison	MS
11049	Gunnison	UT
11050	Gunpowder	MD
11051	Gunter	TX
11052	Guntersville	AL
11053	Guntown	MS
11054	Gurdon	AR
11055	Gurley	AL
11056	Gurley	NE
11057	Gurnee	IL
11058	Gustavus	AK
11059	Gustine	CA
11060	Gustine	TX
11061	Guston	KY
11062	Guthrie	KY
11063	Guthrie	OK
11064	Guthrie	TX
11065	Guthrie Center	IA
11066	Guttenberg	IA
11067	Guy	AR
11068	Guy	TX
11069	Guymon	OK
11070	Guys	TN
11071	Guys Mills	PA
11072	Guysville	OH
11073	Guyton	GA
11074	Gwinn	MI
11075	Gwinner	ND
11076	Gwynedd	PA
11077	Gwynedd Valley	PA
11078	Gwynn	VA
11079	Gwynn Oak	MD
11080	Gwynneville	IN
11081	Gypsum	CO
11082	Gypsum	KS
11083	Gypsum	OH
11084	Gypsy	WV
11085	Hachita	NM
11086	Hacienda Heights	CA
11087	Hackberry	AZ
11088	Hackberry	LA
11089	Hackensack	MN
11090	Hackensack	NJ
11091	Hacker Valley	WV
11092	Hackett	AR
11093	Hackettstown	NJ
11094	Hackleburg	AL
11095	Hacksneck	VA
11096	Hadar	NE
11097	Haddam	CT
11098	Haddam	KS
11099	Haddock	GA
11100	Haddon Heights	NJ
11101	Haddon Township	NJ
11102	Haddonfield	NJ
11103	Hadensville	VA
11104	Hadley	MA
11105	Hadley	MI
11106	Hadley	NY
11107	Hadley	PA
11108	Hadlyme	CT
11109	Hagaman	NY
11110	Hagan	GA
11111	Hagar Shores	MI
11112	Hagarstown	IL
11113	Hagarville	AR
11114	Hager City	WI
11115	Hagerhill	KY
11116	Hagerman	ID
11117	Hagerman	NM
11118	Hagerstown	IN
11119	Hagerstown	MD
11120	Hague	ND
11121	Hague	NY
11122	Hague	VA
11123	Hahira	GA
11124	Hahnville	LA
11125	Haigler	NE
11126	Haiku	HI
11127	Hailesboro	NY
11128	Hailey	ID
11129	Haileyville	OK
11130	Haines	AK
11131	Haines	OR
11132	Haines City	FL
11133	Haines Falls	NY
11134	Hainesport	NJ
11135	Hakalau	HI
11136	Halbur	IA
11137	Halcottsville	NY
11138	Hale	MI
11139	Hale	MO
11140	Hale Center	TX
11141	Haledon	NJ
11142	Haleiwa	HI
11143	Hales Corners	WI
11144	Halethorpe	MD
11145	Haleyville	AL
11146	Half Moon Bay	CA
11147	Half Way	MO
11148	Halfway	OR
11149	Halifax	MA
11150	Halifax	NC
11151	Halifax	PA
11152	Halifax	VA
11153	Hall	MT
11154	Hall	NY
11155	Hall Summit	LA
11156	Hallam	NE
11157	Hallandale	FL
11158	Halleck	NV
11159	Hallett	OK
11160	Hallettsville	TX
11161	Halliday	ND
11162	Hallie	KY
11163	Hallieford	VA
11164	Hallock	MN
11165	Hallowell	ME
11166	Halls	TN
11167	Hallsboro	NC
11168	Hallstead	PA
11169	Hallsville	MO
11170	Hallsville	OH
11171	Hallsville	TX
11172	Halltown	MO
11173	Halltown	WV
11174	Hallwood	VA
11175	Halma	MN
11176	Halsey	NE
11177	Halsey	OR
11178	Halstad	MN
11179	Halstead	KS
11180	Haltom City	TX
11181	Hambleton	WV
11182	Hamburg	AR
11183	Hamburg	IA
11184	Hamburg	IL
11185	Hamburg	LA
11186	Hamburg	MI
11187	Hamburg	MN
11188	Hamburg	NJ
11189	Hamburg	NY
11190	Hamburg	PA
11191	Hamden	CT
11192	Hamden	NY
11193	Hamden	OH
11194	Hamel	IL
11195	Hamel	MN
11196	Hamer	ID
11197	Hamer	SC
11198	Hamersville	OH
11199	Hamill	SD
11200	Hamilton	AL
11201	Hamilton	CO
11202	Hamilton	GA
11203	Hamilton	IA
11204	Hamilton	IL
11205	Hamilton	IN
11206	Hamilton	KS
11207	Hamilton	MA
11208	Hamilton	MI
11209	Hamilton	MO
11210	Hamilton	MS
11211	Hamilton	MT
11212	Hamilton	NC
11213	Hamilton	ND
11214	Hamilton	NY
11215	Hamilton	OH
11216	Hamilton	PA
11217	Hamilton	TX
11218	Hamilton	VA
11219	Hamilton	WA
11220	Hamilton City	CA
11221	Hamler	OH
11222	Hamlet	IN
11223	Hamlet	NC
11224	Hamlin	IA
11225	Hamlin	NY
11226	Hamlin	PA
11227	Hamlin	TX
11228	Hamlin	WV
11229	Hammett	ID
11230	Hammon	OK
11231	Hammond	IL
11232	Hammond	IN
11233	Hammond	LA
11234	Hammond	MT
11235	Hammond	NY
11236	Hammond	OR
11237	Hammond	WI
11238	Hammondsport	NY
11239	Hammondsville	OH
11240	Hammonton	NJ
11241	Hampden	MA
11242	Hampden	ME
11243	Hampden	ND
11244	Hampden Sydney	VA
11245	Hampshire	IL
11246	Hampshire	TN
11247	Hampstead	MD
11248	Hampstead	NC
11249	Hampstead	NH
11250	Hampton	AR
11251	Hampton	CT
11252	Hampton	FL
11253	Hampton	GA
11254	Hampton	IA
11255	Hampton	IL
11256	Hampton	KY
11257	Hampton	MN
11258	Hampton	NE
11259	Hampton	NH
11260	Hampton	NJ
11261	Hampton	NY
11262	Hampton	SC
11263	Hampton	TN
11264	Hampton	VA
11265	Hampton Bays	NY
11266	Hampton Falls	NH
11267	Hamptonville	NC
11268	Hamshire	TX
11269	Hamtramck	MI
11270	Hana	HI
11271	Hanalei	HI
11272	Hanamaulu	HI
11273	Hanapepe	HI
11274	Hanceville	AL
11275	Hancock	IA
11276	Hancock	MD
11277	Hancock	ME
11278	Hancock	MI
11279	Hancock	MN
11280	Hancock	NH
11281	Hancock	NY
11282	Hancock	VT
11283	Hancock	WI
11284	Hancocks Bridge	NJ
11285	Handley	WV
11286	Hanford	CA
11287	Hankamer	TX
11288	Hankins	NY
11289	Hankinson	ND
11290	Hanksville	UT
11291	Hanley Falls	MN
11292	Hanlontown	IA
11293	Hanna	IN
11294	Hanna	OK
11295	Hanna	UT
11296	Hanna	WY
11297	Hanna City	IL
11298	Hannacroix	NY
11299	Hannaford	ND
11300	Hannah	ND
11301	Hannastown	PA
11302	Hannawa Falls	NY
11303	Hannibal	MO
11304	Hannibal	NY
11305	Hannibal	OH
11306	Hannibal	WI
11307	Hanover	CT
11308	Hanover	IL
11309	Hanover	IN
11310	Hanover	KS
11311	Hanover	MA
11312	Hanover	MD
11313	Hanover	ME
11314	Hanover	MI
11315	Hanover	MN
11316	Hanover	NH
11317	Hanover	NM
11318	Hanover	PA
11319	Hanover	VA
11320	Hanover	WI
11321	Hanover	WV
11322	Hanover Park	IL
11323	Hanoverton	OH
11324	Hansboro	ND
11325	Hanscom Afb	MA
11326	Hansen	ID
11327	Hansford	WV
11328	Hanska	MN
11329	Hanson	KY
11330	Hanson	MA
11331	Hanston	KS
11332	Hansville	WA
11333	Happy	KY
11334	Happy	TX
11335	Happy Camp	CA
11336	Happy Jack	AZ
11337	Happy Valley	OR
11338	Haralson	GA
11339	Harbert	MI
11340	Harbeson	DE
11341	Harbinger	NC
11342	Harbor Beach	MI
11343	Harbor City	CA
11344	Harbor Springs	MI
11345	Harbor View	OH
11346	Harborcreek	PA
11347	Harborside	ME
11348	Harborton	VA
11349	Harcourt	IA
11350	Hardaway	AL
11351	Hardburly	KY
11352	Hardeeville	SC
11353	Hardenville	MO
11354	Hardesty	OK
11355	Hardin	IL
11356	Hardin	KY
11357	Hardin	MO
11358	Hardin	MT
11359	Hardin	TX
11360	Hardinsburg	IN
11361	Hardinsburg	KY
11362	Hardtner	KS
11363	Hardwick	GA
11364	Hardwick	MA
11365	Hardwick	MN
11366	Hardwick	VT
11367	Hardy	AR
11368	Hardy	IA
11369	Hardy	KY
11370	Hardy	NE
11371	Hardy	VA
11372	Hardyville	KY
11373	Hardyville	VA
11374	Harford	NY
11375	Harford	PA
11376	Hargill	TX
11377	Harker Heights	TX
11378	Harkers Island	NC
11379	Harlan	IA
11380	Harlan	IN
11381	Harlan	KY
11382	Harleigh	PA
11383	Harlem	GA
11384	Harlem	MT
11385	Harlem Springs	OH
11386	Harleton	TX
11387	Harleysville	PA
11388	Harleyville	SC
11389	Harlingen	TX
11390	Harlowton	MT
11391	Harman	WV
11392	Harmans	MD
11393	Harmon	IL
11394	Harmonsburg	PA
11395	Harmony	CA
11396	Harmony	IN
11397	Harmony	ME
11398	Harmony	MN
11399	Harmony	NC
11400	Harmony	PA
11401	Harmony	RI
11402	Harned	KY
11403	Harold	KY
11404	Harper	IA
11405	Harper	KS
11406	Harper	OR
11407	Harper	TX
11408	Harper	WV
11409	Harper Woods	MI
11410	Harpers Ferry	IA
11411	Harpers Ferry	WV
11412	Harpersfield	NY
11413	Harpersville	AL
11414	Harperville	MS
11415	Harpster	OH
11416	Harpswell	ME
11417	Harpursville	NY
11418	Harrah	OK
11419	Harrah	WA
11420	Harrell	AR
11421	Harrells	NC
11422	Harrellsville	NC
11423	Harriet	AR
11424	Harrietta	MI
11425	Harriman	NY
11426	Harriman	TN
11427	Harrington	DE
11428	Harrington	ME
11429	Harrington	WA
11430	Harrington Park	NJ
11431	Harris	IA
11432	Harris	MI
11433	Harris	MN
11434	Harris	MO
11435	Harris	NC
11436	Harris	NY
11437	Harrisburg	AR
11438	Harrisburg	IL
11439	Harrisburg	MO
11440	Harrisburg	NC
11441	Harrisburg	NE
11442	Harrisburg	OH
11443	Harrisburg	OR
11444	Harrisburg	PA
11445	Harrisburg	SD
11446	Harrison	AR
11447	Harrison	GA
11448	Harrison	ID
11449	Harrison	ME
11450	Harrison	MI
11451	Harrison	MT
11452	Harrison	NE
11453	Harrison	NJ
11454	Harrison	NY
11455	Harrison	OH
11456	Harrison	SD
11457	Harrison	TN
11458	Harrison City	PA
11459	Harrison Township	MI
11460	Harrison Valley	PA
11461	Harrisonburg	LA
11462	Harrisonburg	VA
11463	Harrisonville	MO
11464	Harrisonville	NJ
11465	Harrisonville	PA
11466	Harriston	MS
11467	Harristown	IL
11468	Harrisville	MI
11469	Harrisville	MS
11470	Harrisville	NH
11471	Harrisville	NY
11472	Harrisville	OH
11473	Harrisville	PA
11474	Harrisville	RI
11475	Harrisville	WV
11476	Harrod	OH
11477	Harrods Creek	KY
11478	Harrodsburg	IN
11479	Harrodsburg	KY
11480	Harrogate	TN
11481	Harrold	SD
11482	Harrold	TX
11483	Harsens Island	MI
11484	Harshaw	WI
11485	Hart	MI
11486	Hart	TX
11487	Hartfield	VA
11488	Hartford	AL
11489	Hartford	AR
11490	Hartford	CT
11491	Hartford	IA
11492	Hartford	IL
11493	Hartford	KS
11494	Hartford	KY
11495	Hartford	MI
11496	Hartford	NY
11497	Hartford	OH
11498	Hartford	SD
11499	Hartford	TN
11500	Hartford	VT
11501	Hartford	WI
11502	Hartford	WV
11503	Hartford City	IN
11504	Hartington	NE
11505	Hartland	ME
11506	Hartland	MI
11507	Hartland	MN
11508	Hartland	VT
11509	Hartland	WI
11510	Hartland Four Corners	VT
11511	Hartleton	PA
11512	Hartley	IA
11513	Hartley	TX
11514	Hartline	WA
11515	Hartly	DE
11516	Hartman	AR
11517	Hartman	CO
11518	Harts	WV
11519	Hartsburg	IL
11520	Hartsburg	MO
11521	Hartsdale	NY
11522	Hartsel	CO
11523	Hartselle	AL
11524	Hartsfield	GA
11525	Hartshorn	MO
11526	Hartshorne	OK
11527	Hartstown	PA
11528	Hartsville	IN
11529	Hartsville	SC
11530	Hartsville	TN
11531	Hartville	MO
11532	Hartville	OH
11533	Hartville	WY
11534	Hartwell	GA
11535	Hartwick	IA
11536	Hartwick	NY
11537	Hartwood	VA
11538	Harvard	ID
11539	Harvard	IL
11540	Harvard	MA
11541	Harvard	NE
11542	Harvel	IL
11543	Harvest	AL
11544	Harvey	AR
11545	Harvey	IA
11546	Harvey	IL
11547	Harvey	LA
11548	Harvey	ND
11549	Harveys Lake	PA
11550	Harveysburg	OH
11551	Harveyville	KS
11552	Harviell	MO
11553	Harwich	MA
11554	Harwich Port	MA
11555	Harwick	PA
11556	Harwinton	CT
11557	Harwood	MD
11558	Harwood	MO
11559	Harwood	ND
11560	Harwood	TX
11561	Harwood Heights	IL
11562	Hasbrouck Heights	NJ
11563	Haskell	NJ
11564	Haskell	OK
11565	Haskell	TX
11566	Haskins	OH
11567	Haslet	TX
11568	Haslett	MI
11569	Hassell	NC
11570	Hastings	FL
11571	Hastings	IA
11572	Hastings	MI
11573	Hastings	MN
11574	Hastings	NE
11575	Hastings	NY
11576	Hastings	OK
11577	Hastings	PA
11578	Hastings On Hudson	NY
11579	Hasty	AR
11580	Hasty	CO
11581	Haswell	CO
11582	Hat Creek	CA
11583	Hatboro	PA
11584	Hatch	NM
11585	Hatch	UT
11586	Hatchechubbee	AL
11587	Hatfield	AR
11588	Hatfield	IN
11589	Hatfield	MA
11590	Hatfield	MO
11591	Hatfield	PA
11592	Hathaway	MT
11593	Hathaway Pines	CA
11594	Hathorne	MA
11595	Hatley	WI
11596	Hatteras	NC
11597	Hattiesburg	MS
11598	Hattieville	AR
11599	Hatton	ND
11600	Haubstadt	IN
11601	Haugan	MT
11602	Haugen	WI
11603	Haughton	LA
11604	Hauppauge	NY
11605	Hauula	HI
11606	Havana	AR
11607	Havana	FL
11608	Havana	IL
11609	Havana	KS
11610	Havana	ND
11611	Havelock	IA
11612	Havelock	NC
11613	Haven	KS
11614	Havensville	KS
11615	Haverford	PA
11616	Haverhill	IA
11617	Haverhill	MA
11618	Haverhill	NH
11619	Haverhill	OH
11620	Haverstraw	NY
11621	Havertown	PA
11622	Haviland	KS
11623	Haviland	OH
11624	Havre	MT
11625	Havre De Grace	MD
11626	Haw River	NC
11627	Hawaii National Park	HI
11628	Hawaiian Gardens	CA
11629	Hawarden	IA
11630	Hawesville	KY
11631	Hawi	HI
11632	Hawk Point	MO
11633	Hawk Run	PA
11634	Hawk Springs	WY
11635	Hawkeye	IA
11636	Hawkins	TX
11637	Hawkins	WI
11638	Hawkinsville	GA
11639	Hawks	MI
11640	Hawley	MN
11641	Hawley	PA
11642	Hawley	TX
11643	Hawleyville	CT
11644	Haworth	NJ
11645	Haworth	OK
11646	Hawthorn	PA
11647	Hawthorne	CA
11648	Hawthorne	FL
11649	Hawthorne	NJ
11650	Hawthorne	NV
11651	Hawthorne	NY
11652	Hawthorne	WI
11653	Haxtun	CO
11654	Hay	WA
11655	Hay Springs	NE
11656	Hayden	AL
11657	Hayden	AZ
11658	Hayden	CO
11659	Hayden	ID
11660	Hayden	IN
11661	Haydenville	MA
11662	Haydenville	OH
11663	Hayes	LA
11664	Hayes	SD
11665	Hayes	VA
11666	Hayes Center	NE
11667	Hayesville	IA
11668	Hayesville	NC
11669	Hayesville	OH
11670	Hayfield	MN
11671	Hayfork	CA
11672	Haymarket	VA
11673	Haynes	AR
11674	Haynesville	LA
11675	Haynesville	VA
11676	Hayneville	AL
11677	Hays	KS
11678	Hays	MT
11679	Hays	NC
11680	Haysi	VA
11681	Haysville	KS
11682	Hayti	MO
11683	Hayti	SD
11684	Hayward	CA
11685	Hayward	MN
11686	Hayward	WI
11687	Haywood	VA
11688	Haywood	WV
11689	Hazard	KY
11690	Hazard	NE
11691	Hazel	KY
11692	Hazel	SD
11693	Hazel Crest	IL
11694	Hazel Green	AL
11695	Hazel Green	KY
11696	Hazel Green	WI
11697	Hazel Hurst	PA
11698	Hazel Park	MI
11699	Hazelhurst	WI
11700	Hazelton	ID
11701	Hazelton	KS
11702	Hazelton	ND
11703	Hazelwood	MO
11704	Hazelwood	NC
11705	Hazen	AR
11706	Hazen	ND
11707	Hazlehurst	GA
11708	Hazlehurst	MS
11709	Hazlet	NJ
11710	Hazleton	IA
11711	Hazleton	IN
11712	Hazleton	PA
11713	Head Waters	VA
11714	Headland	AL
11715	Headrick	OK
11716	Heafford Junction	WI
11717	Healdsburg	CA
11718	Healdton	OK
11719	Healy	AK
11720	Healy	KS
11721	Hearne	TX
11722	Heart Butte	MT
11723	Heartwell	NE
11724	Heaters	WV
11725	Heath	MA
11726	Heath	OH
11727	Heath Springs	SC
11728	Heathsville	VA
11729	Heavener	OK
11730	Hebbronville	TX
11731	Heber	AZ
11732	Heber	CA
11733	Heber City	UT
11734	Heber Springs	AR
11735	Hebo	OR
11736	Hebron	CT
11737	Hebron	IL
11738	Hebron	IN
11739	Hebron	KY
11740	Hebron	MD
11741	Hebron	ME
11742	Hebron	ND
11743	Hebron	NE
11744	Hebron	NH
11745	Hebron	OH
11746	Hecker	IL
11747	Hecla	SD
11748	Hector	AR
11749	Hector	MN
11750	Hector	NY
11751	Hedgesville	WV
11752	Hedley	TX
11753	Hedrick	IA
11754	Heflin	AL
11755	Heflin	LA
11756	Hegins	PA
11757	Heidelberg	KY
11758	Heidelberg	MS
11759	Heidenheimer	TX
11760	Heidrick	KY
11761	Heilwood	PA
11762	Heiskell	TN
11763	Heislerville	NJ
11764	Heisson	WA
11765	Helen	GA
11766	Helen	MD
11767	Helen	WV
11768	Helena	AL
11769	Helena	AR
11770	Helena	GA
11771	Helena	MO
11772	Helena	MT
11773	Helena	NY
11774	Helena	OH
11775	Helena	OK
11776	Helendale	CA
11777	Helenville	WI
11778	Helenwood	TN
11779	Helix	OR
11780	Hellertown	PA
11781	Hellier	KY
11782	Helm	CA
11783	Helmetta	NJ
11784	Helmsburg	IN
11785	Helmville	MT
11786	Helotes	TX
11787	Helper	UT
11788	Helton	KY
11789	Heltonville	IN
11790	Helvetia	WV
11791	Hematite	MO
11792	Hemet	CA
11793	Hemingford	NE
11794	Hemingway	SC
11795	Hemlock	IN
11796	Hemlock	MI
11797	Hemlock	NY
11798	Hemphill	TX
11799	Hemphill	WV
11800	Hempstead	NY
11801	Hempstead	TX
11802	Henagar	AL
11803	Henderson	AR
11804	Henderson	CO
11805	Henderson	IA
11806	Henderson	IL
11807	Henderson	KY
11808	Henderson	MD
11809	Henderson	MI
11810	Henderson	MN
11811	Henderson	NC
11812	Henderson	NE
11813	Henderson	NV
11814	Henderson	NY
11815	Henderson	TN
11816	Henderson	TX
11817	Henderson	WV
11818	Henderson Harbor	NY
11819	Hendersonville	NC
11820	Hendersonville	PA
11821	Hendersonville	TN
11822	Hendley	NE
11823	Hendricks	MN
11824	Hendricks	WV
11825	Hendrix	OK
11826	Hendrum	MN
11827	Henefer	UT
11828	Henlawson	WV
11829	Henley	MO
11830	Hennepin	IL
11831	Hennepin	OK
11832	Hennessey	OK
11833	Henniker	NH
11834	Henning	IL
11835	Henning	MN
11836	Henning	TN
11837	Henrico	NC
11838	Henrietta	MO
11839	Henrietta	NC
11840	Henrietta	NY
11841	Henrietta	TX
11842	Henriette	MN
11843	Henrieville	UT
11844	Henry	IL
11845	Henry	SD
11846	Henry	TN
11847	Henry	VA
11848	Henryetta	OK
11849	Henryville	IN
11850	Henryville	PA
11851	Hensel	ND
11852	Hensley	AR
11853	Hensley	WV
11854	Hensonville	NY
11855	Hephzibah	GA
11856	Hepler	KS
11857	Heppner	OR
11858	Hepzibah	WV
11859	Herald	CA
11860	Herbster	WI
11861	Herculaneum	MO
11862	Hercules	CA
11863	Hereford	AZ
11864	Hereford	CO
11865	Hereford	OR
11866	Hereford	PA
11867	Hereford	TX
11868	Herington	KS
11869	Herkimer	NY
11870	Herlong	CA
11871	Herman	MN
11872	Herman	NE
11873	Herman	PA
11874	Hermann	MO
11875	Hermansville	MI
11876	Hermanville	MS
11877	Herminie	PA
11878	Hermiston	OR
11879	Hermitage	AR
11880	Hermitage	MO
11881	Hermitage	PA
11882	Hermitage	TN
11883	Hermleigh	TX
11884	Hermon	NY
11885	Hermosa	SD
11886	Hermosa Beach	CA
11887	Hernandez	NM
11888	Hernando	FL
11889	Hernando	MS
11890	Herndon	KS
11891	Herndon	KY
11892	Herndon	PA
11893	Herndon	VA
11894	Herndon	WV
11895	Hernshaw	WV
11896	Herod	IL
11897	Heron	MT
11898	Heron Lake	MN
11899	Herreid	SD
11900	Herrick	IL
11901	Herrick	SD
11902	Herrick Center	PA
11903	Herriman	UT
11904	Herrin	IL
11905	Herron	MI
11906	Herscher	IL
11907	Hersey	MI
11908	Hershey	NE
11909	Hershey	PA
11910	Hertel	WI
11911	Hertford	NC
11912	Hesperia	CA
11913	Hesperia	MI
11914	Hesperus	CO
11915	Hessel	MI
11916	Hessmer	LA
11917	Hesston	KS
11918	Hesston	PA
11919	Hestand	KY
11920	Hester	LA
11921	Heth	AR
11922	Hettick	IL
11923	Hettinger	ND
11924	Heuvelton	NY
11925	Hewett	WV
11926	Hewitt	MN
11927	Hewitt	NJ
11928	Hewitt	TX
11929	Hewitt	WI
11930	Hewlett	NY
11931	Hext	TX
11932	Heyburn	ID
11933	Heyworth	IL
11934	Hi Hat	KY
11935	Hialeah	FL
11936	Hiawassee	GA
11937	Hiawatha	IA
11938	Hiawatha	KS
11939	Hiawatha	WV
11940	Hibbing	MN
11941	Hibbs	PA
11942	Hibernia	NJ
11943	Hickam Afb	HI
11944	Hickman	CA
11945	Hickman	KY
11946	Hickman	NE
11947	Hickman	TN
11948	Hickory	KY
11949	Hickory	MS
11950	Hickory	NC
11951	Hickory	PA
11952	Hickory Corners	MI
11953	Hickory Flat	MS
11954	Hickory Grove	SC
11955	Hickory Hills	IL
11956	Hickory Plains	AR
11957	Hickory Ridge	AR
11958	Hickory Valley	TN
11959	Hicksville	NY
11960	Hicksville	OH
11961	Hico	TX
11962	Hico	WV
11963	Hidalgo	IL
11964	Hidalgo	TX
11965	Hidden Valley	PA
11966	Hidden Valley Lake	CA
11967	Hiddenite	NC
11968	Hideaway Hls	OH
11969	Higbee	MO
11970	Higden	AR
11971	Higdon	AL
11972	Higganum	CT
11973	Higgins	TX
11974	Higgins Lake	MI
11975	Higginson	AR
11976	Higginsport	OH
11977	Higginsville	MO
11978	High Bridge	NJ
11979	High Bridge	WI
11980	High Falls	NY
11981	High Hill	MO
11982	High Island	TX
11983	High Point	MO
11984	High Point	NC
11985	High Ridge	MO
11986	High Rolls Mountain Park	NM
11987	High Shoals	GA
11988	High Shoals	NC
11989	High Springs	FL
11990	High View	WV
11991	Highfalls	NC
11992	Highgate Center	VT
11993	Highgate Springs	VT
11994	Highland	CA
11995	Highland	IL
11996	Highland	IN
11997	Highland	KS
11998	Highland	MD
11999	Highland	MI
12000	Highland	NY
12001	Highland	OH
12002	Highland	WI
12003	Highland City	FL
12004	Highland Falls	NY
12005	Highland Home	AL
12006	Highland Lake	NY
12007	Highland Lakes	NJ
12008	Highland Mills	NY
12009	Highland Park	IL
12010	Highland Park	MI
12011	Highland Park	NJ
12012	Highland Springs	VA
12013	Highlands	NC
12014	Highlands	NJ
12015	Highlands	TX
12016	Highlandville	IA
12017	Highlandville	MO
12018	Highmore	SD
12019	Highmount	NY
12020	Highspire	PA
12021	Hightstown	NJ
12022	Highwood	IL
12023	Highwood	MT
12024	Higley	AZ
12025	Hiko	NV
12026	Hiland	WY
12027	Hilbert	WI
12028	Hilda	SC
12029	Hildale	UT
12030	Hildebran	NC
12031	Hildreth	NE
12032	Hilger	MT
12033	Hilham	TN
12034	Hill	NH
12035	Hill Afb	UT
12036	Hill City	ID
12037	Hill City	KS
12038	Hill City	MN
12039	Hill City	SD
12040	Hillburn	NY
12041	Hiller	PA
12042	Hilliard	FL
12043	Hilliard	OH
12044	Hilliards	PA
12045	Hillister	TX
12046	Hillman	MI
12047	Hillman	MN
12048	Hillpoint	WI
12049	Hillrose	CO
12050	Hills	IA
12051	Hills	MN
12052	Hillsboro	AL
12053	Hillsboro	GA
12054	Hillsboro	IA
12055	Hillsboro	IL
12056	Hillsboro	IN
12057	Hillsboro	KS
12058	Hillsboro	KY
12059	Hillsboro	MD
12060	Hillsboro	MO
12061	Hillsboro	MS
12062	Hillsboro	ND
12063	Hillsboro	NM
12064	Hillsboro	OH
12065	Hillsboro	OR
12066	Hillsboro	TN
12067	Hillsboro	TX
12068	Hillsboro	WI
12069	Hillsboro	WV
12070	Hillsborough	NC
12071	Hillsborough	NH
12072	Hillsborough	NJ
12073	Hillsdale	IL
12074	Hillsdale	IN
12075	Hillsdale	KS
12076	Hillsdale	MI
12077	Hillsdale	NJ
12078	Hillsdale	NY
12079	Hillsdale	OK
12080	Hillsdale	PA
12081	Hillsdale	WY
12082	Hillsgrove	PA
12083	Hillside	CO
12084	Hillside	IL
12085	Hillside	NJ
12086	Hillsville	PA
12087	Hillsville	VA
12088	Hilltop	WV
12089	Hilltown	PA
12090	Hillview	IL
12091	Hillview	KY
12092	Hilmar	CA
12093	Hilo	HI
12094	Hilton	NY
12095	Hilton Head Island	SC
12096	Hiltons	VA
12097	Hima	KY
12098	Himrod	NY
12099	Hinckley	IL
12100	Hinckley	ME
12101	Hinckley	MN
12102	Hinckley	NY
12103	Hinckley	OH
12104	Hinckley	UT
12105	Hindman	KY
12106	Hindsboro	IL
12107	Hindsville	AR
12108	Hines	IL
12109	Hines	MN
12110	Hines	OR
12111	Hinesburg	VT
12112	Hineston	LA
12113	Hinesville	GA
12114	Hingham	MA
12115	Hingham	MT
12116	Hingham	WI
12117	Hinkle	KY
12118	Hinkley	CA
12119	Hinsdale	IL
12120	Hinsdale	MA
12121	Hinsdale	MT
12122	Hinsdale	NH
12123	Hinsdale	NY
12124	Hinton	IA
12125	Hinton	OK
12126	Hinton	VA
12127	Hinton	WV
12128	Hiram	GA
12129	Hiram	ME
12130	Hiram	OH
12131	Hiseville	KY
12132	Hitchcock	OK
12133	Hitchcock	SD
12134	Hitchcock	TX
12135	Hitchins	KY
12136	Hitchita	OK
12137	Hitterdal	MN
12138	Hiwasse	AR
12139	Hiwassee	VA
12140	Hixson	TN
12141	Hixton	WI
12142	Ho Ho Kus	NJ
12143	Hoagland	IN
12144	Hobart	IN
12145	Hobart	NY
12146	Hobart	OK
12147	Hobart	WA
12148	Hobbs	IN
12149	Hobbs	NM
12150	Hobbsville	NC
12151	Hobe Sound	FL
12152	Hobgood	NC
12153	Hoboken	GA
12154	Hoboken	NJ
12155	Hobson	MT
12156	Hobson	TX
12157	Hobucken	NC
12158	Hochheim	TX
12159	Hockessin	DE
12160	Hockingport	OH
12161	Hockley	TX
12162	Hodge	LA
12163	Hodgen	OK
12164	Hodgenville	KY
12165	Hodges	AL
12166	Hodges	SC
12167	Hoehne	CO
12168	Hoffman	IL
12169	Hoffman	MN
12170	Hoffman	NC
12171	Hoffman Estates	IL
12172	Hoffmeister	NY
12173	Hogansburg	NY
12174	Hogansville	GA
12175	Hogeland	MT
12176	Hohenwald	TN
12177	Hoisington	KS
12178	Hokah	MN
12179	Holabird	SD
12180	Holbrook	AZ
12181	Holbrook	ID
12182	Holbrook	MA
12183	Holbrook	NE
12184	Holbrook	NY
12185	Holbrook	PA
12186	Holcomb	IL
12187	Holcomb	KS
12188	Holcomb	MO
12189	Holcomb	MS
12190	Holcombe	WI
12191	Holden	LA
12192	Holden	MA
12193	Holden	ME
12194	Holden	MO
12195	Holden	UT
12196	Holden	WV
12197	Holdenville	OK
12198	Holder	FL
12199	Holderness	NH
12200	Holdingford	MN
12201	Holdrege	NE
12202	Holgate	OH
12203	Holicong	PA
12204	Holiday	FL
12205	Holladay	TN
12206	Holland	IA
12207	Holland	IN
12208	Holland	KY
12209	Holland	MA
12210	Holland	MI
12211	Holland	MN
12212	Holland	MO
12213	Holland	NY
12214	Holland	OH
12215	Holland	TX
12216	Holland Patent	NY
12217	Hollandale	MN
12218	Hollandale	MS
12219	Hollandale	WI
12220	Hollansburg	OH
12221	Hollenberg	KS
12222	Holley	NY
12223	Holliday	MO
12224	Holliday	TX
12225	Hollidaysburg	PA
12226	Hollins	AL
12227	Hollis	NH
12228	Hollis	NY
12229	Hollis	OK
12230	Hollis Center	ME
12231	Hollister	CA
12232	Hollister	FL
12233	Hollister	MO
12234	Hollister	NC
12235	Hollister	OK
12236	Holliston	MA
12237	Holloman Air Force Base	NM
12238	Hollow Rock	TN
12239	Holloway	MN
12240	Holloway	OH
12241	Hollowville	NY
12242	Hollsopple	PA
12243	Holly	CO
12244	Holly	MI
12245	Holly Bluff	MS
12246	Holly Grove	AR
12247	Holly Hill	SC
12248	Holly Pond	AL
12249	Holly Ridge	MS
12250	Holly Ridge	NC
12251	Holly Springs	GA
12252	Holly Springs	MS
12253	Holly Springs	NC
12254	Hollytree	AL
12255	Hollywood	AL
12256	Hollywood	FL
12257	Hollywood	MD
12258	Hollywood	SC
12259	Holman	NM
12260	Holmdel	NJ
12261	Holmen	WI
12262	Holmes	NY
12263	Holmes	PA
12264	Holmes Beach	FL
12265	Holmes City	MN
12266	Holmes Mill	KY
12267	Holmesville	OH
12268	Holstein	IA
12269	Holstein	NE
12270	Holt	CA
12271	Holt	FL
12272	Holt	MI
12273	Holt	MO
12274	Holton	IN
12275	Holton	KS
12276	Holton	MI
12277	Holts Summit	MO
12278	Holtsville	NY
12279	Holtville	CA
12280	Holtwood	PA
12281	Holualoa	HI
12282	Holy City	CA
12283	Holy Cross	AK
12284	Holy Cross	IA
12285	Holy Trinity	AL
12286	Holyoke	CO
12287	Holyoke	MA
12288	Holyoke	MN
12289	Holyrood	KS
12290	Home	KS
12291	Home	PA
12292	Homedale	ID
12293	Homelake	CO
12294	Homeland	CA
12295	Homeland	FL
12296	Homer	AK
12297	Homer	GA
12298	Homer	IL
12299	Homer	IN
12300	Homer	LA
12301	Homer	MI
12302	Homer	MN
12303	Homer	NE
12304	Homer	NY
12305	Homer	OH
12306	Homer City	PA
12307	Homer Glen	IL
12308	Homerville	GA
12309	Homerville	OH
12310	Homestead	FL
12311	Homestead	IA
12312	Homestead	MT
12313	Homestead	PA
12314	Hometown	IL
12315	Hometown	WV
12316	Homewood	CA
12317	Homewood	IL
12318	Homeworth	OH
12319	Hominy	OK
12320	Homosassa	FL
12321	Homosassa Springs	FL
12322	Honaker	VA
12323	Honaunau	HI
12324	Hondo	NM
12325	Hondo	TX
12326	Honea Path	SC
12327	Honeoye	NY
12328	Honeoye Falls	NY
12329	Honesdale	PA
12330	Honey Brook	PA
12331	Honey Creek	IA
12332	Honey Creek	WI
12333	Honey Grove	PA
12334	Honey Grove	TX
12335	Honeydew	CA
12336	Honeyville	UT
12337	Honokaa	HI
12338	Honolulu	HI
12339	Honomu	HI
12340	Honor	MI
12341	Honoraville	AL
12342	Hood	CA
12343	Hood	VA
12344	Hood River	OR
12345	Hoodsport	WA
12346	Hooker	OK
12347	Hookerton	NC
12348	Hooks	TX
12349	Hooksett	NH
12350	Hookstown	PA
12351	Hoolehua	HI
12352	Hoonah	AK
12353	Hoopa	CA
12354	Hooper	CO
12355	Hooper	NE
12356	Hooper	UT
12357	Hooper	WA
12358	Hooper Bay	AK
12359	Hoopeston	IL
12360	Hoople	ND
12361	Hooppole	IL
12362	Hoosick	NY
12363	Hoosick Falls	NY
12364	Hooven	OH
12365	Hooversville	PA
12366	Hop Bottom	PA
12367	Hopatcong	NJ
12368	Hope	AK
12369	Hope	AR
12370	Hope	ID
12371	Hope	IN
12372	Hope	KS
12373	Hope	KY
12374	Hope	ME
12375	Hope	MI
12376	Hope	MN
12377	Hope	ND
12378	Hope	NJ
12379	Hope	NM
12380	Hope	RI
12381	Hope Hull	AL
12382	Hope Mills	NC
12383	Hope Valley	RI
12384	Hopedale	IL
12385	Hopedale	MA
12386	Hopedale	OH
12387	Hopeland	PA
12388	Hopeton	OK
12389	Hopewell	NJ
12390	Hopewell	OH
12391	Hopewell	PA
12392	Hopewell	VA
12393	Hopewell Junction	NY
12394	Hopkins	MI
12395	Hopkins	MN
12396	Hopkins	MO
12397	Hopkins	SC
12398	Hopkins Park	IL
12399	Hopkinsville	KY
12400	Hopkinton	IA
12401	Hopkinton	MA
12402	Hopkinton	RI
12403	Hopland	CA
12404	Hopwood	PA
12405	Hoquiam	WA
12406	Horace	ND
12407	Horatio	AR
12408	Horatio	SC
12409	Hordville	NE
12410	Horicon	WI
12411	Horn Lake	MS
12412	Hornbeak	TN
12413	Hornbeck	LA
12414	Hornbrook	CA
12415	Hornell	NY
12416	Horner	WV
12417	Hornersville	MO
12418	Hornick	IA
12419	Hornitos	CA
12420	Hornsby	TN
12421	Horntown	VA
12422	Horse Branch	KY
12423	Horse Cave	KY
12424	Horse Creek	WY
12425	Horse Shoe	NC
12426	Horseheads	NY
12427	Horsepen	VA
12428	Horseshoe Bay	TX
12429	Horseshoe Beach	FL
12430	Horseshoe Bend	AR
12431	Horseshoe Bend	ID
12432	Horsham	PA
12433	Hortense	GA
12434	Horton	AL
12435	Horton	KS
12436	Horton	MI
12437	Hortonville	NY
12438	Hortonville	WI
12439	Hoschton	GA
12440	Hosford	FL
12441	Hoskins	NE
12442	Hoskinston	KY
12443	Hosmer	SD
12444	Hospers	IA
12445	Hosston	LA
12446	Hostetter	PA
12447	Hot Springs	MT
12448	Hot Springs	NC
12449	Hot Springs	SD
12450	Hot Springs	VA
12451	Hot Springs National Park	AR
12452	Hot Springs Village	AR
12453	Hot Sulphur Springs	CO
12454	Hotchkiss	CO
12455	Hotevilla	AZ
12456	Houck	AZ
12457	Houghton	IA
12458	Houghton	MI
12459	Houghton	NY
12460	Houghton	SD
12461	Houghton Lake	MI
12462	Houghton Lake Heights	MI
12463	Houlka	MS
12464	Houlton	ME
12465	Houlton	WI
12466	Houma	LA
12467	Housatonic	MA
12468	House	NM
12469	House Springs	MO
12470	Houston	AK
12471	Houston	AL
12472	Houston	AR
12473	Houston	DE
12474	Houston	MN
12475	Houston	MO
12476	Houston	MS
12477	Houston	OH
12478	Houston	PA
12479	Houston	TX
12480	Houstonia	MO
12481	Houtzdale	PA
12482	Hoven	SD
12483	Hovland	MN
12484	Howard	CO
12485	Howard	GA
12486	Howard	KS
12487	Howard	OH
12488	Howard	PA
12489	Howard	SD
12490	Howard Beach	NY
12491	Howard City	MI
12492	Howard Lake	MN
12493	Howardsville	VA
12494	Howe	ID
12495	Howe	IN
12496	Howe	OK
12497	Howe	TX
12498	Howell	MI
12499	Howell	NJ
12500	Howell	UT
12501	Howells	NE
12502	Howells	NY
12503	Howes	SD
12504	Howes Cave	NY
12505	Howey In The Hills	FL
12506	Howland	ME
12507	Hoxie	AR
12508	Hoxie	KS
12509	Hoyleton	IL
12510	Hoyt	KS
12511	Hoyt	OK
12512	Hoyt Lakes	MN
12513	Hoytville	OH
12514	Huachuca City	AZ
12515	Hualapai	AZ
12516	Hubbard	IA
12517	Hubbard	NE
12518	Hubbard	OH
12519	Hubbard	OR
12520	Hubbard	TX
12521	Hubbard Lake	MI
12522	Hubbardston	MA
12523	Hubbardston	MI
12524	Hubbardsville	NY
12525	Hubbell	MI
12526	Hubbell	NE
12527	Hubert	NC
12528	Hubertus	WI
12529	Huddleston	VA
12530	Huddy	KY
12531	Hudgins	VA
12532	Hudson	CO
12533	Hudson	FL
12534	Hudson	IA
12535	Hudson	IL
12536	Hudson	IN
12537	Hudson	KS
12538	Hudson	KY
12539	Hudson	MA
12540	Hudson	ME
12541	Hudson	MI
12542	Hudson	NC
12543	Hudson	NH
12544	Hudson	NY
12545	Hudson	OH
12546	Hudson	SD
12547	Hudson	WI
12548	Hudson	WY
12549	Hudson Falls	NY
12550	Hudsonville	MI
12551	Huey	IL
12552	Hueysville	KY
12553	Huffman	TX
12554	Hufsmith	TX
12555	Huger	SC
12556	Huggins	MO
12557	Hughes	AK
12558	Hughes	AR
12559	Hughes Springs	TX
12560	Hugheston	WV
12561	Hughesville	MD
12562	Hughesville	MO
12563	Hughesville	PA
12564	Hughson	CA
12565	Hughsonville	NY
12566	Hugo	CO
12567	Hugo	MN
12568	Hugo	OK
12569	Hugoton	KS
12570	Huguenot	NY
12571	Hulbert	MI
12572	Hulbert	OK
12573	Hulen	KY
12574	Hulett	WY
12575	Huletts Landing	NY
12576	Hull	GA
12577	Hull	IA
12578	Hull	IL
12579	Hull	MA
12580	Hull	TX
12581	Hulls Cove	ME
12582	Humansville	MO
12583	Humarock	MA
12584	Humbird	WI
12585	Humble	TX
12586	Humboldt	AZ
12587	Humboldt	IA
12588	Humboldt	IL
12589	Humboldt	KS
12590	Humboldt	MN
12591	Humboldt	NE
12592	Humboldt	SD
12593	Humboldt	TN
12594	Hume	CA
12595	Hume	IL
12596	Hume	MO
12597	Hume	NY
12598	Hume	VA
12599	Humeston	IA
12600	Hummels Wharf	PA
12601	Hummelstown	PA
12602	Humnoke	AR
12603	Humphrey	AR
12604	Humphrey	NE
12605	Humphreys	MO
12606	Humptulips	WA
12607	Hundred	WV
12608	Hungerford	TX
12609	Hungry Horse	MT
12610	Hunker	PA
12611	Hunlock Creek	PA
12612	Hunnewell	MO
12613	Hunt	NY
12614	Hunt	TX
12615	Hunt Valley	MD
12616	Hunter	AR
12617	Hunter	KS
12618	Hunter	ND
12619	Hunter	NY
12620	Hunter	OK
12621	Hunters	WA
12622	Huntersville	NC
12623	Huntertown	IN
12624	Huntingburg	IN
12625	Huntingdon	PA
12626	Huntingdon	TN
12627	Huntingdon Valley	PA
12628	Huntington	AR
12629	Huntington	IN
12630	Huntington	MA
12631	Huntington	NY
12632	Huntington	OR
12633	Huntington	TX
12634	Huntington	UT
12635	Huntington	VT
12636	Huntington	WV
12637	Huntington Beach	CA
12638	Huntington Mills	PA
12639	Huntington Park	CA
12640	Huntington Station	NY
12641	Huntington Woods	MI
12642	Huntingtown	MD
12643	Huntland	TN
12644	Huntley	IL
12645	Huntley	MN
12646	Huntley	MT
12647	Huntley	WY
12648	Huntly	VA
12649	Huntsburg	OH
12650	Huntsville	AL
12651	Huntsville	AR
12652	Huntsville	IL
12653	Huntsville	MO
12654	Huntsville	OH
12655	Huntsville	TN
12656	Huntsville	TX
12657	Huntsville	UT
12658	Hurdland	MO
12659	Hurdle Mills	NC
12660	Hurdsfield	ND
12661	Hurlburt Field	FL
12662	Hurley	MO
12663	Hurley	MS
12664	Hurley	NM
12665	Hurley	NY
12666	Hurley	SD
12667	Hurley	VA
12668	Hurley	WI
12669	Hurleyville	NY
12670	Hurlock	MD
12671	Huron	CA
12672	Huron	IN
12673	Huron	OH
12674	Huron	SD
12675	Huron	TN
12676	Hurricane	UT
12677	Hurricane	WV
12678	Hurricane Mills	TN
12679	Hurst	IL
12680	Hurst	TX
12681	Hurt	VA
12682	Hurtsboro	AL
12683	Huslia	AK
12684	Huson	MT
12685	Husser	LA
12686	Hustisford	WI
12687	Hustle	VA
12688	Hustler	WI
12689	Huston	ID
12690	Hustontown	PA
12691	Hustonville	KY
12692	Husum	WA
12693	Hutchins	TX
12694	Hutchinson	KS
12695	Hutchinson	MN
12696	Hutchinson	PA
12697	Hutsonville	IL
12698	Huttig	AR
12699	Hutto	TX
12700	Huttonsville	WV
12701	Huxford	AL
12702	Huxley	IA
12703	Hyampom	CA
12704	Hyannis	MA
12705	Hyannis	NE
12706	Hyannis Port	MA
12707	Hyattsville	MD
12708	Hyattville	WY
12709	Hydaburg	AK
12710	Hyde	PA
12711	Hyde Park	MA
12712	Hyde Park	NY
12713	Hyde Park	PA
12714	Hyde Park	UT
12715	Hyde Park	VT
12716	Hyden	KY
12717	Hyder	AK
12718	Hydes	MD
12719	Hydesville	CA
12720	Hydetown	PA
12721	Hydeville	VT
12722	Hydro	OK
12723	Hye	TX
12724	Hygiene	CO
12725	Hymera	IN
12726	Hyndman	PA
12727	Hyner	PA
12728	Hyrum	UT
12729	Hysham	MT
12730	Iaeger	WV
12731	Ibapah	UT
12732	Iberia	MO
12733	Iberia	OH
12734	Icard	NC
12735	Ickesburg	PA
12736	Ida	AR
12737	Ida	LA
12738	Ida	MI
12739	Ida Grove	IA
12740	Idabel	OK
12741	Idaho City	ID
12742	Idaho Falls	ID
12743	Idaho Springs	CO
12744	Idalia	CO
12745	Idalou	TX
12746	Idamay	WV
12747	Idanha	OR
12748	Idaville	IN
12749	Idaville	PA
12750	Ideal	GA
12751	Ideal	SD
12752	Ider	AL
12753	Idledale	CO
12754	Idlewild	MI
12755	Idlewild	TN
12756	Idleyld Park	OR
12757	Idyllwild	CA
12758	Ignacio	CO
12759	Igo	CA
12760	Ihlen	MN
12761	Ijamsville	MD
12762	Ikes Fork	WV
12763	Ila	GA
12764	Ilfeld	NM
12765	Iliamna	AK
12766	Iliff	CO
12767	Ilion	NY
12768	Illinois City	IL
12769	Illiopolis	IL
12770	Ilwaco	WA
12771	Imbler	OR
12772	Imboden	AR
12773	Imlay	NV
12774	Imlay City	MI
12775	Imlaystown	NJ
12776	Imler	PA
12777	Immaculata	PA
12778	Immokalee	FL
12779	Imnaha	OR
12780	Imogene	IA
12781	Imperial	CA
12782	Imperial	MO
12783	Imperial	NE
12784	Imperial	PA
12785	Imperial	TX
12786	Imperial Beach	CA
12787	Ina	IL
12788	Inavale	NE
12789	Inchelium	WA
12790	Incline Village	NV
12791	Independence	CA
12792	Independence	IA
12793	Independence	KS
12794	Independence	KY
12795	Independence	LA
12796	Independence	MO
12797	Independence	MS
12798	Independence	OH
12799	Independence	OR
12800	Independence	VA
12801	Independence	WI
12802	Independence	WV
12803	Index	WA
12804	Indiahoma	OK
12805	Indialantic	FL
12806	Indian	AK
12807	Indian Head	MD
12808	Indian Head	PA
12809	Indian Hills	CO
12810	Indian Lake	NY
12811	Indian Lake Estates	FL
12812	Indian Mound	TN
12813	Indian River	MI
12814	Indian Rocks Beach	FL
12815	Indian Springs	NV
12816	Indian Trail	NC
12817	Indian Valley	ID
12818	Indian Valley	VA
12819	Indian Wells	AZ
12820	Indian Wells	CA
12821	Indiana	PA
12822	Indianapolis	IN
12823	Indianola	IA
12824	Indianola	IL
12825	Indianola	MS
12826	Indianola	NE
12827	Indianola	OK
12828	Indianola	PA
12829	Indianola	WA
12830	Indiantown	FL
12831	Indio	CA
12832	Indore	WV
12833	Industry	IL
12834	Industry	PA
12835	Industry	TX
12836	Inez	KY
12837	Inez	TX
12838	Ingalls	IN
12839	Ingalls	KS
12840	Ingalls	MI
12841	Inglefield	IN
12842	Ingleside	IL
12843	Ingleside	MD
12844	Ingleside	TX
12845	Inglewood	CA
12846	Inglis	FL
12847	Ingomar	MT
12848	Ingomar	PA
12849	Ingraham	IL
12850	Ingram	KY
12851	Ingram	TX
12852	Inkom	ID
12853	Inkster	MI
12854	Inkster	ND
12855	Inland	NE
12856	Inlet	NY
12857	Inman	KS
12858	Inman	NE
12859	Inman	SC
12860	Innis	LA
12861	Inola	OK
12862	Institute	WV
12863	Intercession City	FL
12864	Intercourse	PA
12865	Interior	SD
12866	Interlachen	FL
12867	Interlaken	NY
12868	Interlochen	MI
12869	International Falls	MN
12870	Intervale	NH
12871	Inver Grove Heights	MN
12872	Inverness	CA
12873	Inverness	FL
12874	Inverness	MS
12875	Inverness	MT
12876	Inwood	IA
12877	Inwood	NY
12878	Inwood	WV
12879	Inyokern	CA
12880	Iola	KS
12881	Iola	TX
12882	Iola	WI
12883	Iona	ID
12884	Iona	MN
12885	Ione	CA
12886	Ione	OR
12887	Ione	WA
12888	Ionia	IA
12889	Ionia	MI
12890	Ionia	MO
12891	Ionia	NY
12892	Iota	LA
12893	Iowa	LA
12894	Iowa City	IA
12895	Iowa Falls	IA
12896	Iowa Park	TX
12897	Ipava	IL
12898	Ipswich	MA
12899	Ipswich	SD
12900	Ira	IA
12901	Ira	TX
12902	Iraan	TX
12903	Irasburg	VT
12904	Iredell	TX
12905	Ireland	IN
12906	Ireland	WV
12907	Irene	SD
12908	Irene	TX
12909	Ireton	IA
12910	Irma	WI
12911	Irmo	SC
12912	Iron	MN
12913	Iron Belt	WI
12914	Iron City	GA
12915	Iron City	TN
12916	Iron Gate	VA
12917	Iron Mountain	MI
12918	Iron Ridge	WI
12919	Iron River	MI
12920	Iron River	WI
12921	Iron Springs	AZ
12922	Iron Station	NC
12923	Irondale	MO
12924	Irondale	OH
12925	Ironia	NJ
12926	Irons	MI
12927	Ironside	OR
12928	Ironsides	MD
12929	Ironton	MN
12930	Ironton	MO
12931	Ironton	OH
12932	Ironwood	MI
12933	Iroquois	IL
12934	Iroquois	SD
12935	Irrigon	OR
12936	Irvine	CA
12937	Irvine	KY
12938	Irvine	PA
12939	Irving	IL
12940	Irving	NY
12941	Irving	TX
12942	Irvington	AL
12943	Irvington	IL
12944	Irvington	KY
12945	Irvington	NJ
12946	Irvington	NY
12947	Irvington	VA
12948	Irvona	PA
12949	Irwin	IA
12950	Irwin	ID
12951	Irwin	OH
12952	Irwin	PA
12953	Irwinton	GA
12954	Irwinville	GA
12955	Isaban	WV
12956	Isabel	KS
12957	Isabel	SD
12958	Isabella	MN
12959	Isabella	MO
12960	Isabella	OK
12961	Isabella	PA
12962	Isanti	MN
12963	Iselin	NJ
12964	Ishpeming	MI
12965	Islamorada	FL
12966	Island	KY
12967	Island City	KY
12968	Island Falls	ME
12969	Island Grove	FL
12970	Island Heights	NJ
12971	Island Lake	IL
12972	Island Park	ID
12973	Island Park	NY
12974	Island Pond	VT
12975	Islandia	NY
12976	Islandton	SC
12977	Isle	MN
12978	Isle Au Haut	ME
12979	Isle La Motte	VT
12980	Isle Of Palms	SC
12981	Isle Of Springs	ME
12982	Isle Of Wight	VA
12983	Isle Saint George	OH
12984	Islesboro	ME
12985	Islesford	ME
12986	Isleta	NM
12987	Isleton	CA
12988	Islip	NY
12989	Islip Terrace	NY
12990	Ismay	MT
12991	Isola	MS
12992	Isom	KY
12993	Isonville	KY
12994	Issaquah	WA
12995	Issue	MD
12996	Istachatta	FL
12997	Italy	TX
12998	Itasca	IL
12999	Itasca	TX
13000	Ithaca	MI
13001	Ithaca	NE
13002	Ithaca	NY
13003	Itmann	WV
13004	Itta Bena	MS
13005	Iuka	IL
13006	Iuka	KS
13007	Iuka	MS
13008	Iva	SC
13009	Ivan	AR
13010	Ivanhoe	CA
13011	Ivanhoe	MN
13012	Ivanhoe	NC
13013	Ivanhoe	TX
13014	Ivanhoe	VA
13015	Ivel	KY
13016	Ivesdale	IL
13017	Ivins	UT
13018	Ivor	VA
13019	Ivoryton	CT
13020	Ivy	VA
13021	Ivydale	WV
13022	Ixonia	WI
13023	Jachin	AL
13024	Jack	AL
13025	Jackhorn	KY
13026	Jackman	ME
13027	Jackpot	NV
13028	Jacks Creek	TN
13029	Jacksboro	TN
13030	Jacksboro	TX
13031	Jackson	AL
13032	Jackson	CA
13033	Jackson	GA
13034	Jackson	KY
13035	Jackson	LA
13036	Jackson	MI
13037	Jackson	MN
13038	Jackson	MO
13039	Jackson	MS
13040	Jackson	MT
13041	Jackson	NC
13042	Jackson	NE
13043	Jackson	NH
13044	Jackson	NJ
13045	Jackson	OH
13046	Jackson	PA
13047	Jackson	SC
13048	Jackson	TN
13049	Jackson	WI
13050	Jackson	WY
13051	Jackson Center	OH
13052	Jackson Center	PA
13053	Jackson Heights	NY
13054	Jackson Springs	NC
13055	Jacksonboro	SC
13056	Jacksonburg	WV
13057	Jacksonport	AR
13058	Jacksons Gap	AL
13059	Jacksontown	OH
13060	Jacksonville	AL
13061	Jacksonville	AR
13062	Jacksonville	FL
13063	Jacksonville	GA
13064	Jacksonville	IL
13065	Jacksonville	MO
13066	Jacksonville	NC
13067	Jacksonville	NY
13068	Jacksonville	OH
13069	Jacksonville	OR
13070	Jacksonville	TX
13071	Jacksonville	VT
13072	Jacksonville Beach	FL
13073	Jacob	IL
13074	Jacobs Creek	PA
13075	Jacobsburg	OH
13076	Jacobson	MN
13077	Jacumba	CA
13078	Jadwin	MO
13079	Jaffrey	NH
13080	Jakin	GA
13081	Jal	NM
13082	Jamaica	IA
13083	Jamaica	NY
13084	Jamaica	VA
13085	Jamaica	VT
13086	Jamaica Plain	MA
13087	James City	PA
13088	James Creek	PA
13089	Jameson	MO
13090	Jamesport	MO
13091	Jamesport	NY
13092	Jamestown	CA
13093	Jamestown	CO
13094	Jamestown	IN
13095	Jamestown	KS
13096	Jamestown	KY
13097	Jamestown	LA
13098	Jamestown	MI
13099	Jamestown	MO
13100	Jamestown	NC
13101	Jamestown	ND
13102	Jamestown	NM
13103	Jamestown	NY
13104	Jamestown	OH
13105	Jamestown	PA
13106	Jamestown	RI
13107	Jamestown	SC
13108	Jamestown	TN
13109	Jamestown	VA
13110	Jamesville	NC
13111	Jamesville	NY
13112	Jamesville	VA
13113	Jamieson	OR
13114	Jamison	PA
13115	Jamul	CA
13116	Jane Lew	WV
13117	Janesville	CA
13118	Janesville	IA
13119	Janesville	IL
13120	Janesville	MN
13121	Janesville	WI
13122	Jansen	NE
13123	Jarales	NM
13124	Jarbidge	NV
13125	Jaroso	CO
13126	Jarratt	VA
13127	Jarreau	LA
13128	Jarrell	TX
13129	Jarrettsville	MD
13130	Jarvisburg	NC
13131	Jasonville	IN
13132	Jasper	AL
13133	Jasper	AR
13134	Jasper	FL
13135	Jasper	GA
13136	Jasper	IN
13137	Jasper	MI
13138	Jasper	MN
13139	Jasper	MO
13140	Jasper	NY
13141	Jasper	OH
13142	Jasper	TN
13143	Jasper	TX
13144	Java	SD
13145	Java	VA
13146	Java Center	NY
13147	Java Village	NY
13148	Jay	FL
13149	Jay	ME
13150	Jay	NY
13151	Jay	OK
13152	Jay Em	WY
13153	Jayess	MS
13154	Jayton	TX
13155	Jean	NV
13156	Jeanerette	LA
13157	Jeannette	PA
13158	Jeddo	MI
13159	Jeff	KY
13160	Jeffers	MN
13161	Jefferson	AL
13162	Jefferson	AR
13163	Jefferson	CO
13164	Jefferson	GA
13165	Jefferson	IA
13166	Jefferson	MA
13167	Jefferson	MD
13168	Jefferson	ME
13169	Jefferson	NC
13170	Jefferson	NH
13171	Jefferson	NY
13172	Jefferson	OH
13173	Jefferson	OR
13174	Jefferson	PA
13175	Jefferson	SC
13176	Jefferson	SD
13177	Jefferson	TX
13178	Jefferson	WI
13179	Jefferson City	MO
13180	Jefferson City	MT
13181	Jefferson City	TN
13182	Jefferson Valley	NY
13183	Jeffersonton	VA
13184	Jeffersonville	GA
13185	Jeffersonville	IN
13186	Jeffersonville	KY
13187	Jeffersonville	NY
13188	Jeffersonville	OH
13189	Jeffersonville	VT
13190	Jeffrey	WV
13191	Jeffrey City	WY
13192	Jekyll Island	GA
13193	Jellico	TN
13194	Jelm	WY
13195	Jemez Pueblo	NM
13196	Jemez Springs	NM
13197	Jemison	AL
13198	Jena	LA
13199	Jenera	OH
13200	Jenison	MI
13201	Jenkinjones	WV
13202	Jenkins	KY
13203	Jenkins	MN
13204	Jenkins Bridge	VA
13205	Jenkinsburg	GA
13206	Jenkinsville	SC
13207	Jenkintown	PA
13208	Jenks	OK
13209	Jenner	CA
13210	Jenners	PA
13211	Jennerstown	PA
13212	Jennings	FL
13213	Jennings	KS
13214	Jennings	LA
13215	Jennings	OK
13216	Jensen	UT
13217	Jensen Beach	FL
13218	Jeremiah	KY
13219	Jericho	NY
13220	Jericho	VT
13221	Jerico Springs	MO
13222	Jermyn	PA
13223	Jermyn	TX
13224	Jerome	AZ
13225	Jerome	ID
13226	Jerome	MI
13227	Jerome	MO
13228	Jerome	PA
13229	Jeromesville	OH
13230	Jerry City	OH
13231	Jersey	AR
13232	Jersey	GA
13233	Jersey	VA
13234	Jersey City	NJ
13235	Jersey Mills	PA
13236	Jersey Shore	PA
13237	Jerseyville	IL
13238	Jerusalem	AR
13239	Jerusalem	OH
13240	Jesse	WV
13241	Jessie	ND
13242	Jessieville	AR
13243	Jessup	MD
13244	Jessup	PA
13245	Jesup	GA
13246	Jesup	IA
13247	Jet	OK
13248	Jetersville	VA
13249	Jetmore	KS
13250	Jetson	KY
13251	Jewell	GA
13252	Jewell	IA
13253	Jewell	KS
13254	Jewell	OH
13255	Jewell Ridge	VA
13256	Jewett	IL
13257	Jewett	NY
13258	Jewett	OH
13259	Jewett	TX
13260	Jewett City	CT
13261	Jigger	LA
13262	Jim Falls	WI
13263	Jim Thorpe	PA
13264	Joanna	SC
13265	Joaquin	TX
13266	Jobstown	NJ
13267	Joelton	TN
13268	Joes	CO
13269	Joffre	PA
13270	Johannesburg	CA
13271	Johannesburg	MI
13272	John Day	OR
13273	Johns Island	SC
13274	Johnsburg	NY
13275	Johnson	AR
13276	Johnson	KS
13277	Johnson	NE
13278	Johnson	NY
13279	Johnson	VT
13280	Johnson City	NY
13281	Johnson City	TN
13282	Johnson City	TX
13283	Johnson Creek	WI
13284	Johnsonburg	NJ
13285	Johnsonburg	PA
13286	Johnsonville	IL
13287	Johnsonville	NY
13288	Johnsonville	SC
13289	Johnston	IA
13290	Johnston	RI
13291	Johnston	SC
13292	Johnston City	IL
13293	Johnstown	CO
13294	Johnstown	NE
13295	Johnstown	NY
13296	Johnstown	OH
13297	Johnstown	PA
13298	Joice	IA
13299	Joiner	AR
13300	Joinerville	TX
13301	Joliet	IL
13302	Joliet	MT
13303	Jolley	IA
13304	Jolo	WV
13305	Jolon	CA
13306	Jonancy	KY
13307	Jonas Ridge	NC
13308	Jones	AL
13309	Jones	LA
13310	Jones	MI
13311	Jones	OK
13312	Jones Mill	AR
13313	Jones Mills	PA
13314	Jonesboro	AR
13315	Jonesboro	GA
13316	Jonesboro	IL
13317	Jonesboro	IN
13318	Jonesboro	LA
13319	Jonesboro	ME
13320	Jonesboro	TX
13321	Jonesborough	TN
13322	Jonesburg	MO
13323	Jonesport	ME
13324	Jonestown	MS
13325	Jonestown	PA
13326	Jonesville	IN
13327	Jonesville	KY
13328	Jonesville	LA
13329	Jonesville	MI
13330	Jonesville	NC
13331	Jonesville	SC
13332	Jonesville	TX
13333	Jonesville	VA
13334	Jonesville	VT
13335	Joplin	MO
13336	Joplin	MT
13337	Joppa	AL
13338	Joppa	IL
13339	Joppa	MD
13340	Jordan	MN
13341	Jordan	MT
13342	Jordan	NY
13343	Jordan Valley	OR
13344	Jordanville	NY
13345	Joseph	OR
13346	Joseph	UT
13347	Joseph City	AZ
13348	Josephine	PA
13349	Josephine	TX
13350	Josephine	WV
13351	Joshua	TX
13352	Joshua Tree	CA
13353	Jourdanton	TX
13354	Joy	IL
13355	Joyce	LA
13356	Joyce	WA
13357	Jud	ND
13358	Juda	WI
13359	Judith Gap	MT
13360	Judson	IN
13361	Judson	TX
13362	Judsonia	AR
13363	Julesburg	CO
13364	Juliaetta	ID
13365	Julian	CA
13366	Julian	NC
13367	Julian	NE
13368	Julian	PA
13369	Julian	WV
13370	Juliette	GA
13371	Juliustown	NJ
13372	Jump River	WI
13373	Jumping Branch	WV
13374	Junction	IL
13375	Junction	TX
13376	Junction	UT
13377	Junction City	AR
13378	Junction City	CA
13379	Junction City	GA
13380	Junction City	KS
13381	Junction City	KY
13382	Junction City	OH
13383	Junction City	OR
13384	Junction City	WI
13385	June Lake	CA
13386	Juneau	AK
13387	Juneau	WI
13388	Junedale	PA
13389	Juniata	NE
13390	Junior	WV
13391	Juntura	OR
13392	Jupiter	FL
13393	Justice	IL
13394	Justice	WV
13395	Justiceburg	TX
13396	Justin	TX
13397	Kaaawa	HI
13398	Kabetogama	MN
13399	Kadoka	SD
13400	Kahlotus	WA
13401	Kahoka	MO
13402	Kahuku	HI
13403	Kahului	HI
13404	Kaibeto	AZ
13405	Kailua	HI
13406	Kailua Kona	HI
13407	Kaiser	MO
13408	Kake	AK
13409	Kaktovik	AK
13410	Kalaheo	HI
13411	Kalama	WA
13412	Kalamazoo	MI
13413	Kalaupapa	HI
13414	Kaleva	MI
13415	Kalida	OH
13416	Kalispell	MT
13417	Kalkaska	MI
13418	Kalona	IA
13419	Kalskag	AK
13420	Kaltag	AK
13421	Kamas	UT
13422	Kamay	TX
13423	Kamiah	ID
13424	Kampsville	IL
13425	Kamrar	IA
13426	Kamuela	HI
13427	Kanab	UT
13428	Kanaranzi	MN
13429	Kanarraville	UT
13430	Kanawha	IA
13431	Kanawha Falls	WV
13432	Kanawha Head	WV
13433	Kandiyohi	MN
13434	Kane	IL
13435	Kane	PA
13436	Kaneohe	HI
13437	Kaneville	IL
13438	Kankakee	IL
13439	Kannapolis	NC
13440	Kanona	NY
13441	Kanopolis	KS
13442	Kanorado	KS
13443	Kanosh	UT
13444	Kansas	AL
13445	Kansas	IL
13446	Kansas	OH
13447	Kansas	OK
13448	Kansas City	KS
13449	Kansas City	MO
13450	Kansasville	WI
13451	Kantner	PA
13452	Kapaa	HI
13453	Kapaau	HI
13454	Kaplan	LA
13455	Kapolei	HI
13456	Kapowsin	WA
13457	Karbers Ridge	IL
13458	Karlsruhe	ND
13459	Karlstad	MN
13460	Karluk	AK
13461	Karnack	TX
13462	Karnak	IL
13463	Karnes City	TX
13464	Karns City	PA
13465	Karthaus	PA
13466	Karval	CO
13467	Kasbeer	IL
13468	Kasigluk	AK
13469	Kasilof	AK
13470	Kasota	MN
13471	Kasson	MN
13472	Kathleen	FL
13473	Kathleen	GA
13474	Kathryn	ND
13475	Katonah	NY
13476	Kattskill Bay	NY
13477	Katy	TX
13478	Kaufman	TX
13479	Kaukauna	WI
13480	Kaumakani	HI
13481	Kaunakakai	HI
13482	Kauneonga Lake	NY
13483	Kaw City	OK
13484	Kaweah	CA
13485	Kawkawlin	MI
13486	Kaycee	WY
13487	Kayenta	AZ
13488	Kaylor	SD
13489	Kaysville	UT
13490	Keaau	HI
13491	Kealakekua	HI
13492	Kealia	HI
13493	Keams Canyon	AZ
13494	Keansburg	NJ
13495	Kearney	MO
13496	Kearney	NE
13497	Kearneysville	WV
13498	Kearny	AZ
13499	Kearny	NJ
13500	Kearsarge	MI
13501	Kearsarge	NH
13502	Keasbey	NJ
13503	Keatchie	LA
13504	Keaton	KY
13505	Keauhou	HI
13506	Keavy	KY
13507	Kechi	KS
13508	Keedysville	MD
13509	Keego Harbor	MI
13510	Keeler	CA
13511	Keeling	VA
13512	Keen Mountain	VA
13513	Keene	CA
13514	Keene	KY
13515	Keene	ND
13516	Keene	NH
13517	Keene	NY
13518	Keene	OH
13519	Keene	TX
13520	Keene	VA
13521	Keene Valley	NY
13522	Keenes	IL
13523	Keenesburg	CO
13524	Keensburg	IL
13525	Keeseville	NY
13526	Keewatin	MN
13527	Keezletown	VA
13528	Kegley	WV
13529	Keiser	AR
13530	Keisterville	PA
13531	Keithsburg	IL
13532	Keithville	LA
13533	Keizer	OR
13534	Kekaha	HI
13535	Kelayres	PA
13536	Keldron	SD
13537	Kelford	NC
13538	Kell	IL
13539	Keller	TX
13540	Keller	VA
13541	Keller	WA
13542	Kellerman	AL
13543	Kellerton	IA
13544	Kelley	IA
13545	Kelleys Island	OH
13546	Kelliher	MN
13547	Kellnersville	WI
13548	Kellogg	IA
13549	Kellogg	ID
13550	Kellogg	MN
13551	Kelly	LA
13552	Kelly	NC
13553	Kelly	WY
13554	Kellysville	WV
13555	Kellyton	AL
13556	Kellyville	OK
13557	Kelseyville	CA
13558	Kelso	MO
13559	Kelso	TN
13560	Kelso	WA
13561	Kelton	PA
13562	Kemah	TX
13563	Kemblesville	PA
13564	Kemmerer	WY
13565	Kemp	OK
13566	Kemp	TX
13567	Kempner	TX
13568	Kempton	IL
13569	Kempton	IN
13570	Kempton	PA
13571	Kenai	AK
13572	Kenansville	FL
13573	Kenansville	NC
13574	Kenbridge	VA
13575	Kendalia	TX
13576	Kendall	KS
13577	Kendall	MI
13578	Kendall	NY
13579	Kendall	WI
13580	Kendall Park	NJ
13581	Kendallville	IN
13582	Kendleton	TX
13583	Kendrick	ID
13584	Kenduskeag	ME
13585	Kenedy	TX
13586	Kenefic	OK
13587	Kenesaw	NE
13588	Kenilworth	IL
13589	Kenilworth	NJ
13590	Kenilworth	UT
13591	Kenly	NC
13592	Kenmare	ND
13593	Kenmore	WA
13594	Kenna	NM
13595	Kenna	WV
13596	Kennan	WI
13597	Kennard	IN
13598	Kennard	NE
13599	Kennard	TX
13600	Kennebec	SD
13601	Kennebunk	ME
13602	Kennebunkport	ME
13603	Kennedale	TX
13604	Kennedy	AL
13605	Kennedy	MN
13606	Kennedy	NY
13607	Kennedyville	MD
13608	Kenner	LA
13609	Kennerdell	PA
13610	Kennesaw	GA
13611	Kenneth	MN
13612	Kennett	MO
13613	Kennett Square	PA
13614	Kennewick	WA
13615	Kenney	IL
13616	Kenney	TX
13617	Keno	OR
13618	Kenosha	WI
13619	Kenova	WV
13620	Kenoza Lake	NY
13621	Kensal	ND
13622	Kensett	AR
13623	Kensett	IA
13624	Kensington	KS
13625	Kensington	MD
13626	Kensington	MN
13627	Kensington	OH
13628	Kent	AL
13629	Kent	CT
13630	Kent	IL
13631	Kent	MN
13632	Kent	NY
13633	Kent	OH
13634	Kent	OR
13635	Kent	PA
13636	Kent	WA
13637	Kent City	MI
13638	Kentfield	CA
13639	Kentland	IN
13640	Kenton	DE
13641	Kenton	KY
13642	Kenton	OH
13643	Kenton	OK
13644	Kenton	TN
13645	Kents Hill	ME
13646	Kents Store	VA
13647	Kentwood	LA
13648	Kenvil	NJ
13649	Kenvir	KY
13650	Kenwood	CA
13651	Kenyon	MN
13652	Kenyon	RI
13653	Keo	AR
13654	Keokee	VA
13655	Keokuk	IA
13656	Keosauqua	IA
13657	Keota	IA
13658	Keota	OK
13659	Kerby	OR
13660	Kerens	TX
13661	Kerens	WV
13662	Kerhonkson	NY
13663	Kerkhoven	MN
13664	Kerman	CA
13665	Kermit	TX
13666	Kermit	WV
13667	Kernersville	NC
13668	Kernville	CA
13669	Kerr	OH
13670	Kerrick	MN
13671	Kerrick	TX
13672	Kerrville	TX
13673	Kersey	CO
13674	Kersey	PA
13675	Kershaw	SC
13676	Keshena	WI
13677	Keslers Cross Lanes	WV
13678	Kesley	IA
13679	Keswick	IA
13680	Keswick	VA
13681	Ketchikan	AK
13682	Ketchum	ID
13683	Ketchum	OK
13684	Kettle Falls	WA
13685	Kettle Island	KY
13686	Kettle River	MN
13687	Kettleman City	CA
13688	Kettlersville	OH
13689	Keuka Park	NY
13690	Kevil	KY
13691	Kevin	MT
13692	Kew Gardens	NY
13693	Kewadin	MI
13694	Kewanee	IL
13695	Kewanee	MO
13696	Kewanna	IN
13697	Kewaskum	WI
13698	Kewaunee	WI
13699	Key Biscayne	FL
13700	Key Colony Beach	FL
13701	Key Largo	FL
13702	Key West	FL
13703	Keyes	CA
13704	Keyes	OK
13705	Keyesport	IL
13706	Keymar	MD
13707	Keyport	NJ
13708	Keyport	WA
13709	Keyser	WV
13710	Keystone	IA
13711	Keystone	IN
13712	Keystone	NE
13713	Keystone	SD
13714	Keystone Heights	FL
13715	Keysville	GA
13716	Keysville	VA
13717	Keytesville	MO
13718	Kiahsville	WV
13719	Kiamesha Lake	NY
13720	Kiamichi Christian Mission	OK
13721	Kiana	AK
13722	Kidder	MO
13723	Kidron	OH
13724	Kiefer	OK
13725	Kiel	WI
13726	Kieler	WI
13727	Kiester	MN
13728	Kihei	HI
13729	Kila	MT
13730	Kilauea	HI
13731	Kilbourne	IL
13732	Kilbourne	LA
13733	Kilbourne	OH
13734	Kildare	TX
13735	Kilgore	NE
13736	Kilgore	TX
13737	Kilkenny	MN
13738	Kill Buck	NY
13739	Kill Devil Hills	NC
13740	Killarney	FL
13741	Killawog	NY
13742	Killbuck	OH
13743	Killdeer	ND
13744	Killduff	IA
13745	Killeen	TX
13746	Killen	AL
13747	Killington	VT
13748	Killingworth	CT
13749	Kilmarnock	VA
13750	Kilmichael	MS
13751	Kiln	MS
13752	Kim	CO
13753	Kimball	MN
13754	Kimball	NE
13755	Kimball	SD
13756	Kimball	WV
13757	Kimballton	IA
13758	Kimberling City	MO
13759	Kimberly	AL
13760	Kimberly	ID
13761	Kimberly	OR
13762	Kimberly	WI
13763	Kimberly	WV
13764	Kimberton	PA
13765	Kimbolton	OH
13766	Kimmell	IN
13767	Kimmswick	MO
13768	Kimper	KY
13769	Kinards	SC
13770	Kincaid	IL
13771	Kincaid	KS
13772	Kincaid	WV
13773	Kincheloe	MI
13774	Kinde	MI
13775	Kinder	LA
13776	Kinderhook	IL
13777	Kinderhook	NY
13778	Kindred	ND
13779	King	NC
13780	King	WI
13781	King And Queen Court House	VA
13782	King City	CA
13783	King City	MO
13784	King Cove	AK
13785	King Ferry	NY
13786	King George	VA
13787	King Hill	ID
13788	King Of Prussia	PA
13789	King Salmon	AK
13790	King William	VA
13791	Kingdom City	MO
13792	Kingfield	ME
13793	Kingfisher	OK
13794	Kingman	AZ
13795	Kingman	IN
13796	Kingman	KS
13797	Kingman	ME
13798	Kingmont	WV
13799	Kings Bay	GA
13800	Kings Beach	CA
13801	Kings Canyon National Pk	CA
13802	Kings Mills	OH
13803	Kings Mountain	KY
13804	Kings Mountain	NC
13805	Kings Park	NY
13806	Kingsburg	CA
13807	Kingsbury	IN
13808	Kingsbury	TX
13809	Kingsford	MI
13810	Kingsford Heights	IN
13811	Kingsland	AR
13812	Kingsland	GA
13813	Kingsland	TX
13814	Kingsley	IA
13815	Kingsley	MI
13816	Kingsley	PA
13817	Kingsport	TN
13818	Kingston	AR
13819	Kingston	GA
13820	Kingston	ID
13821	Kingston	IL
13822	Kingston	MA
13823	Kingston	MI
13824	Kingston	MO
13825	Kingston	NH
13826	Kingston	NJ
13827	Kingston	NY
13828	Kingston	OH
13829	Kingston	OK
13830	Kingston	PA
13831	Kingston	RI
13832	Kingston	TN
13833	Kingston	UT
13834	Kingston	WA
13835	Kingston	WI
13836	Kingston Mines	IL
13837	Kingston Springs	TN
13838	Kingstree	SC
13839	Kingsville	MD
13840	Kingsville	MO
13841	Kingsville	OH
13842	Kingsville	TX
13843	Kingwood	TX
13844	Kingwood	WV
13845	Kinmundy	IL
13846	Kinnear	WY
13847	Kinney	MN
13848	Kinross	MI
13849	Kinsale	VA
13850	Kinsey	MT
13851	Kinsley	KS
13852	Kinsman	IL
13853	Kinsman	OH
13854	Kinston	AL
13855	Kinston	NC
13856	Kinta	OK
13857	Kintnersville	PA
13858	Kintyre	ND
13859	Kinzers	PA
13860	Kiowa	CO
13861	Kiowa	KS
13862	Kiowa	OK
13863	Kipling	NC
13864	Kipling	OH
13865	Kipnuk	AK
13866	Kipton	OH
13867	Kirby	AR
13868	Kirby	OH
13869	Kirby	WY
13870	Kirbyville	MO
13871	Kirbyville	TX
13872	Kirk	CO
13873	Kirkersville	OH
13874	Kirkland	AZ
13875	Kirkland	IL
13876	Kirkland	WA
13877	Kirklin	IN
13878	Kirkman	IA
13879	Kirksey	KY
13880	Kirksville	MO
13881	Kirkville	IA
13882	Kirkville	NY
13883	Kirkwood	CA
13884	Kirkwood	DE
13885	Kirkwood	IL
13886	Kirkwood	NY
13887	Kirkwood	PA
13888	Kiron	IA
13889	Kirtland	NM
13890	Kirtland Afb	NM
13891	Kirvin	TX
13892	Kirwin	KS
13893	Kismet	KS
13894	Kissee Mills	MO
13895	Kissimmee	FL
13896	Kistler	WV
13897	Kit Carson	CA
13898	Kit Carson	CO
13899	Kite	GA
13900	Kite	KY
13901	Kittanning	PA
13902	Kittery	ME
13903	Kittery Point	ME
13904	Kittitas	WA
13905	Kittredge	CO
13906	Kittrell	NC
13907	Kitts Hill	OH
13908	Kitty Hawk	NC
13909	Kitzmiller	MD
13910	Kivalina	AK
13911	Klamath	CA
13912	Klamath Falls	OR
13913	Klamath River	CA
13914	Klawock	AK
13915	Kleinfeltersville	PA
13916	Klemme	IA
13917	Klickitat	WA
13918	Klingerstown	PA
13919	Klondike	TX
13920	Knapp	WI
13921	Kneeland	CA
13922	Knickerbocker	TX
13923	Knierim	IA
13924	Knife River	MN
13925	Knifley	KY
13926	Knightdale	NC
13927	Knights Landing	CA
13928	Knightsen	CA
13929	Knightstown	IN
13930	Knightsville	IN
13931	Knippa	TX
13932	Knob Lick	KY
13933	Knob Lick	MO
13934	Knob Noster	MO
13935	Knobel	AR
13936	Knott	TX
13937	Knotts Island	NC
13938	Knowlesville	NY
13939	Knox	IN
13940	Knox	ND
13941	Knox	NY
13942	Knox	PA
13943	Knox City	MO
13944	Knox City	TX
13945	Knox Dale	PA
13946	Knoxboro	NY
13947	Knoxville	AL
13948	Knoxville	AR
13949	Knoxville	GA
13950	Knoxville	IA
13951	Knoxville	IL
13952	Knoxville	MD
13953	Knoxville	PA
13954	Knoxville	TN
13955	Kobuk	AK
13956	Kodak	TN
13957	Kodiak	AK
13958	Koeltztown	MO
13959	Kohler	WI
13960	Kokomo	IN
13961	Kokomo	MS
13962	Koleen	IN
13963	Koloa	HI
13964	Konawa	OK
13965	Kongiganak	AK
13966	Koosharem	UT
13967	Kooskia	ID
13968	Kootenai	ID
13969	Koppel	PA
13970	Kopperl	TX
13971	Kopperston	WV
13972	Korbel	CA
13973	Kosciusko	MS
13974	Koshkonong	MO
13975	Kosse	TX
13976	Kossuth	PA
13977	Kotlik	AK
13978	Kotzebue	AK
13979	Kountze	TX
13980	Kouts	IN
13981	Koyuk	AK
13982	Koyukuk	AK
13983	Kraemer	LA
13984	Krakow	WI
13985	Kramer	ND
13986	Kranzburg	SD
13987	Kreamer	PA
13988	Krebs	OK
13989	Kremlin	MT
13990	Kremlin	OK
13991	Kremmling	CO
13992	Kresgeville	PA
13993	Kress	TX
13994	Krotz Springs	LA
13995	Krum	TX
13996	Krypton	KY
13997	Kualapuu	HI
13998	Kula	HI
13999	Kulm	ND
14000	Kulpmont	PA
14001	Kulpsville	PA
14002	Kuna	ID
14003	Kunia	HI
14004	Kunkle	OH
14005	Kunkletown	PA
14006	Kure Beach	NC
14007	Kurten	TX
14008	Kurthwood	LA
14009	Kurtistown	HI
14010	Kurtz	IN
14011	Kuttawa	KY
14012	Kutztown	PA
14013	Kwethluk	AK
14014	Kwigillingok	AK
14015	Kyburz	CA
14016	Kykotsmovi Village	AZ
14017	Kyle	SD
14018	Kyle	TX
14019	Kyle	WV
14020	Kylertown	PA
14021	Kyles Ford	TN
14022	La Barge	WY
14023	La Belle	MO
14024	La Belle	PA
14025	La Blanca	TX
14026	La Canada Flintridge	CA
14027	La Center	KY
14028	La Center	WA
14029	La Conner	WA
14030	La Coste	TX
14031	La Crescent	MN
14032	La Crescenta	CA
14033	La Crosse	FL
14034	La Crosse	IN
14035	La Crosse	KS
14036	La Crosse	VA
14037	La Crosse	WI
14038	La Farge	WI
14039	La Fargeville	NY
14040	La Fayette	GA
14041	La Fayette	IL
14042	La Fayette	KY
14043	La Fayette	NY
14044	La Feria	TX
14045	La Follette	TN
14046	La Fontaine	IN
14047	La France	SC
14048	La Grande	OR
14049	La Grande	WA
14050	La Grange	AR
14051	La Grange	CA
14052	La Grange	IL
14053	La Grange	KY
14054	La Grange	MO
14055	La Grange	NC
14056	La Grange	TN
14057	La Grange	TX
14058	La Grange Park	IL
14059	La Habra	CA
14060	La Harpe	IL
14061	La Harpe	KS
14062	La Honda	CA
14063	La Jara	CO
14064	La Jara	NM
14065	La Jolla	CA
14066	La Jose	PA
14067	La Joya	NM
14068	La Joya	TX
14069	La Junta	CO
14070	La Loma	NM
14071	La Luz	NM
14072	La Madera	NM
14073	La Marque	TX
14074	La Mesa	CA
14075	La Mesa	NM
14076	La Mirada	CA
14077	La Moille	IL
14078	La Monte	MO
14079	La Motte	IA
14080	La Palma	CA
14081	La Pine	OR
14082	La Place	IL
14083	La Place	LA
14084	La Plata	MD
14085	La Plata	MO
14086	La Plata	NM
14087	La Plume	PA
14088	La Pointe	WI
14089	La Porte	IN
14090	La Porte	TX
14091	La Porte City	IA
14092	La Prairie	IL
14093	La Pryor	TX
14094	La Puente	CA
14095	La Push	WA
14096	La Quinta	CA
14097	La Rose	IL
14098	La Rue	OH
14099	La Russell	MO
14100	La Sal	UT
14101	La Salle	CO
14102	La Salle	IL
14103	La Salle	MI
14104	La Salle	MN
14105	La Salle	TX
14106	La Valle	WI
14107	La Vergne	TN
14108	La Verkin	UT
14109	La Verne	CA
14110	La Vernia	TX
14111	La Veta	CO
14112	La Villa	TX
14113	La Vista	NE
14114	La Ward	TX
14115	Labadie	MO
14116	Labadieville	LA
14117	Labelle	FL
14118	Labolt	SD
14119	Lac Du Flambeau	WI
14120	Lacarne	OH
14121	Lacassine	LA
14122	Lacey	WA
14123	Lacey Spring	VA
14124	Laceys Spring	AL
14125	Laceyville	PA
14126	Lachine	MI
14127	Lackawaxen	PA
14128	Lackey	KY
14129	Lackey	VA
14130	Laclede	ID
14131	Laclede	MO
14132	Lacombe	LA
14133	Lacon	IL
14134	Lacona	IA
14135	Lacona	NY
14136	Laconia	IN
14137	Laconia	NH
14138	Laconia	TN
14139	Lacoochee	FL
14140	Lacota	MI
14141	Lacrosse	WA
14142	Lacygne	KS
14143	Ladd	IL
14144	Laddonia	MO
14145	Ladera Ranch	CA
14146	Ladiesburg	MD
14147	Ladoga	IN
14148	Ladonia	TX
14149	Ladora	IA
14150	Ladson	SC
14151	Lady Lake	FL
14152	Ladys Island	SC
14153	Ladysmith	VA
14154	Ladysmith	WI
14155	Lafayette	AL
14156	Lafayette	CA
14157	Lafayette	CO
14158	Lafayette	IN
14159	Lafayette	LA
14160	Lafayette	MN
14161	Lafayette	NJ
14162	Lafayette	OH
14163	Lafayette	OR
14164	Lafayette	TN
14165	Lafayette Hill	PA
14166	Lafe	AR
14167	Lafferty	OH
14168	Lafitte	LA
14169	Lafox	IL
14170	Lagrange	GA
14171	Lagrange	IN
14172	Lagrange	ME
14173	Lagrange	OH
14174	Lagrange	WY
14175	Lagrangeville	NY
14176	Lagro	IN
14177	Laguna	NM
14178	Laguna Beach	CA
14179	Laguna Hills	CA
14180	Laguna Niguel	CA
14181	Laguna Park	TX
14182	Laguna Woods	CA
14183	Lagunitas	CA
14184	Lahaina	HI
14185	Lahaska	PA
14186	Lahmansville	WV
14187	Lahoma	OK
14188	Laie	HI
14189	Laings	OH
14190	Laingsburg	MI
14191	Laird Hill	TX
14192	Lairdsville	PA
14193	Lake	MI
14194	Lake	MS
14195	Lake	WV
14196	Lake Alfred	FL
14197	Lake Andes	SD
14198	Lake Ann	MI
14199	Lake Ariel	PA
14200	Lake Arrowhead	CA
14201	Lake Arthur	LA
14202	Lake Arthur	NM
14203	Lake Benton	MN
14204	Lake Bluff	IL
14205	Lake Bronson	MN
14206	Lake Butler	FL
14207	Lake Charles	LA
14208	Lake Cicott	IN
14209	Lake City	AR
14210	Lake City	CA
14211	Lake City	CO
14212	Lake City	FL
14213	Lake City	IA
14214	Lake City	KS
14215	Lake City	MI
14216	Lake City	MN
14217	Lake City	PA
14218	Lake City	SC
14219	Lake City	SD
14220	Lake City	TN
14221	Lake Clear	NY
14222	Lake Como	FL
14223	Lake Como	PA
14224	Lake Cormorant	MS
14225	Lake Creek	TX
14226	Lake Crystal	MN
14227	Lake Dallas	TX
14228	Lake Delton	WI
14229	Lake Elmo	MN
14230	Lake Elmore	VT
14231	Lake Elsinore	CA
14232	Lake Forest	CA
14233	Lake Forest	IL
14234	Lake Fork	ID
14235	Lake Fork	IL
14236	Lake Geneva	FL
14237	Lake Geneva	WI
14238	Lake George	CO
14239	Lake George	MI
14240	Lake George	MN
14241	Lake George	NY
14242	Lake Grove	NY
14243	Lake Hamilton	FL
14244	Lake Harbor	FL
14245	Lake Harmony	PA
14246	Lake Havasu City	AZ
14247	Lake Helen	FL
14248	Lake Hiawatha	NJ
14249	Lake Hill	NY
14250	Lake Hopatcong	NJ
14251	Lake Hubert	MN
14252	Lake Hughes	CA
14253	Lake Huntington	NY
14254	Lake In The Hills	IL
14255	Lake Isabella	CA
14256	Lake Jackson	TX
14257	Lake Junaluska	NC
14258	Lake Katrine	NY
14259	Lake Leelanau	MI
14260	Lake Lillian	MN
14261	Lake Linden	MI
14262	Lake Lure	NC
14263	Lake Luzerne	NY
14264	Lake Lynn	PA
14265	Lake Mary	FL
14266	Lake Mc Donald	MT
14267	Lake Mills	IA
14268	Lake Mills	WI
14269	Lake Milton	OH
14270	Lake Minchumina	AK
14271	Lake Monroe	FL
14272	Lake Montezuma	AZ
14273	Lake Nebagamon	WI
14274	Lake Norden	SD
14275	Lake Odessa	MI
14276	Lake Orion	MI
14277	Lake Oswego	OR
14278	Lake Ozark	MO
14279	Lake Panasoffkee	FL
14280	Lake Park	GA
14281	Lake Park	IA
14282	Lake Park	MN
14283	Lake Peekskill	NY
14284	Lake Placid	FL
14285	Lake Placid	NY
14286	Lake Pleasant	MA
14287	Lake Pleasant	NY
14288	Lake Powell	UT
14289	Lake Preston	SD
14290	Lake Providence	LA
14291	Lake Saint Louis	MO
14292	Lake Spring	MO
14293	Lake Station	IN
14294	Lake Stevens	WA
14295	Lake Tomahawk	WI
14296	Lake Toxaway	NC
14297	Lake View	IA
14298	Lake View	NY
14299	Lake View	SC
14300	Lake Villa	IL
14301	Lake Village	AR
14302	Lake Village	IN
14303	Lake Waccamaw	NC
14304	Lake Wales	FL
14305	Lake Wilson	MN
14306	Lake Winola	PA
14307	Lake Worth	FL
14308	Lake Zurich	IL
14309	Lakebay	WA
14310	Lakefield	MN
14311	Lakehead	CA
14312	Lakehills	TX
14313	Lakehurst	NJ
14314	Lakeland	FL
14315	Lakeland	GA
14316	Lakeland	LA
14317	Lakeland	MI
14318	Lakeland	MN
14319	Lakemont	GA
14320	Lakemont	NY
14321	Lakemore	OH
14322	Lakeport	CA
14323	Lakeshore	CA
14324	Lakeshore	MS
14325	Lakeside	AZ
14326	Lakeside	CA
14327	Lakeside	CT
14328	Lakeside	MI
14329	Lakeside	MT
14330	Lakeside	NE
14331	Lakeside	OR
14332	Lakeside Marblehead	OH
14333	Laketon	IN
14334	Laketown	UT
14335	Lakeview	AR
14336	Lakeview	MI
14337	Lakeview	NC
14338	Lakeview	OH
14339	Lakeview	OR
14340	Lakeview	TX
14341	Lakeville	CT
14342	Lakeville	IN
14343	Lakeville	MA
14344	Lakeville	MI
14345	Lakeville	MN
14346	Lakeville	NY
14347	Lakeville	OH
14348	Lakeville	PA
14349	Lakewood	CA
14350	Lakewood	IL
14351	Lakewood	NJ
14352	Lakewood	NM
14353	Lakewood	NY
14354	Lakewood	OH
14355	Lakewood	PA
14356	Lakewood	WA
14357	Lakewood	WI
14358	Lakin	KS
14359	Lakota	IA
14360	Lakota	ND
14361	Lamar	AR
14362	Lamar	CO
14363	Lamar	IN
14364	Lamar	MO
14365	Lamar	MS
14366	Lamar	OK
14367	Lamar	PA
14368	Lamar	SC
14369	Lamartine	PA
14370	Lambert	MS
14371	Lambert	MT
14372	Lambert Lake	ME
14373	Lamberton	MN
14374	Lambertville	MI
14375	Lambertville	NJ
14376	Lambrook	AR
14377	Lambsburg	VA
14378	Lame Deer	MT
14379	Lamesa	TX
14380	Lamoille	NV
14381	Lamona	WA
14382	Lamoni	IA
14383	Lamont	CA
14384	Lamont	FL
14385	Lamont	IA
14386	Lamont	KS
14387	Lamont	MI
14388	Lamont	OK
14389	Lamont	WA
14390	Lamoure	ND
14391	Lampasas	TX
14392	Lampe	MO
14393	Lampeter	PA
14394	Lamy	NM
14395	Lanagan	MO
14396	Lanai City	HI
14397	Lanark	IL
14398	Lanark	WV
14399	Lanark Village	FL
14400	Lancaster	CA
14401	Lancaster	IL
14402	Lancaster	KS
14403	Lancaster	KY
14404	Lancaster	MA
14405	Lancaster	MN
14406	Lancaster	MO
14407	Lancaster	NH
14408	Lancaster	NY
14409	Lancaster	OH
14410	Lancaster	PA
14411	Lancaster	SC
14412	Lancaster	TN
14413	Lancaster	TX
14414	Lancaster	VA
14415	Lancaster	WI
14416	Lance Creek	WY
14417	Lancing	TN
14418	Land O Lakes	FL
14419	Land O Lakes	WI
14420	Landenberg	PA
14421	Lander	WY
14422	Landers	CA
14423	Landing	NJ
14424	Landingville	PA
14425	Landis	NC
14426	Landisburg	PA
14427	Landisville	NJ
14428	Landisville	PA
14429	Lando	SC
14430	Landrum	SC
14431	Lane	IL
14432	Lane	KS
14433	Lane	OK
14434	Lane	SC
14435	Lane	SD
14436	Lane City	TX
14437	Laneburg	AR
14438	Lanesboro	IA
14439	Lanesboro	MA
14440	Lanesboro	MN
14441	Lanesboro	PA
14442	Lanesville	IN
14443	Lanesville	NY
14444	Lanett	AL
14445	Laneview	VA
14446	Laneville	TX
14447	Lanexa	VA
14448	Langdon	ND
14449	Langeloth	PA
14450	Langford	SD
14451	Langhorne	PA
14452	Langley	AR
14453	Langley	KY
14454	Langley	OK
14455	Langley	SC
14456	Langley	WA
14457	Langlois	OR
14458	Langston	AL
14459	Langston	OK
14460	Langsville	OH
14461	Langtry	TX
14462	Langworthy	IA
14463	Lanham	MD
14464	Lankin	ND
14465	Lannon	WI
14466	Lanoka Harbor	NJ
14467	Lansdale	PA
14468	Lansdowne	PA
14469	Lanse	MI
14470	Lanse	PA
14471	Lansford	ND
14472	Lansford	PA
14473	Lansing	IA
14474	Lansing	IL
14475	Lansing	KS
14476	Lansing	MI
14477	Lansing	MN
14478	Lansing	NC
14479	Lansing	NY
14480	Lansing	OH
14481	Lansing	WV
14482	Lantry	SD
14483	Laona	WI
14484	Laotto	IN
14485	Lapaz	IN
14486	Lapeer	MI
14487	Lapel	IN
14488	Lmeisterdish_serverne	AL
14489	Lapoint	UT
14490	Laporte	CO
14491	Laporte	MN
14492	Laporte	PA
14493	Lapwai	ID
14494	Laquey	MO
14495	Laramie	WY
14496	Larchmont	NY
14497	Larchwood	IA
14498	Laredo	MO
14499	Laredo	TX
14500	Largo	FL
14501	Larimer	PA
14502	Larimore	ND
14503	Larkspur	CA
14504	Larkspur	CO
14505	Larned	KS
14506	Larose	LA
14507	Larrabee	IA
14508	Larsen	WI
14509	Larsen Bay	AK
14510	Larslan	MT
14511	Larue	TX
14512	Larwill	IN
14513	Las Animas	CO
14514	Las Cruces	NM
14515	Las Vegas	NM
14516	Las Vegas	NV
14517	Lasara	TX
14518	Lascassas	TN
14519	Lashmeet	WV
14520	Lastrup	MN
14521	Latah	WA
14522	Latexo	TX
14523	Latham	IL
14524	Latham	KS
14525	Latham	MO
14526	Latham	NY
14527	Latham	OH
14528	Lathrop	CA
14529	Lathrop	MO
14530	Latimer	IA
14531	Laton	CA
14532	Latonia	KY
14533	Latrobe	PA
14534	Latta	SC
14535	Lattimer Mines	PA
14536	Lattimore	NC
14537	Latty	OH
14538	Lauderdale	MS
14539	Laughlin	NV
14540	Laughlin A F B	TX
14541	Laughlintown	PA
14542	Laupahoehoe	HI
14543	Laura	IL
14544	Laura	OH
14545	Laurel	DE
14546	Laurel	FL
14547	Laurel	IA
14548	Laurel	IN
14549	Laurel	MD
14550	Laurel	MS
14551	Laurel	MT
14552	Laurel	NE
14553	Laurel	NY
14554	Laurel Bloomery	TN
14555	Laurel Fork	VA
14556	Laurel Hill	FL
14557	Laurel Hill	NC
14558	Laurel Springs	NC
14559	Laurelton	PA
14560	Laurelville	OH
14561	Laurens	IA
14562	Laurens	NY
14563	Laurens	SC
14564	Laurie	MO
14565	Laurier	WA
14566	Laurinburg	NC
14567	Laurys Station	PA
14568	Lava Hot Springs	ID
14569	Lavaca	AR
14570	Lavalette	WV
14571	Lavallette	NJ
14572	Laveen	AZ
14573	Lavelle	PA
14574	Laverne	OK
14575	Lavina	MT
14576	Lavinia	TN
14577	Lavon	TX
14578	Lavonia	GA
14579	Lawai	HI
14580	Lawler	IA
14581	Lawley	AL
14582	Lawn	PA
14583	Lawn	TX
14584	Lawndale	CA
14585	Lawndale	IL
14586	Lawndale	NC
14587	Lawnside	NJ
14588	Lawrence	KS
14589	Lawrence	MA
14590	Lawrence	MI
14591	Lawrence	MS
14592	Lawrence	NE
14593	Lawrence	NY
14594	Lawrence	PA
14595	Lawrenceburg	IN
14596	Lawrenceburg	KY
14597	Lawrenceburg	TN
14598	Lawrenceville	GA
14599	Lawrenceville	IL
14600	Lawrenceville	NY
14601	Lawrenceville	PA
14602	Lawrenceville	VA
14603	Lawson	AR
14604	Lawson	MO
14605	Lawsonville	NC
14606	Lawtell	LA
14607	Lawtey	FL
14608	Lawton	IA
14609	Lawton	MI
14610	Lawton	ND
14611	Lawton	OK
14612	Lawton	PA
14613	Lawtons	NY
14614	Layland	WV
14615	Layton	NJ
14616	Layton	UT
14617	Laytonville	CA
14618	Lazbuddie	TX
14619	Lazear	CO
14620	Le Center	MN
14621	Le Claire	IA
14622	Le Grand	CA
14623	Le Grand	IA
14624	Le Mars	IA
14625	Le Raysville	PA
14626	Le Roy	IL
14627	Le Roy	KS
14628	Le Roy	MN
14629	Le Roy	NY
14630	Le Roy	WV
14631	Le Sueur	MN
14632	Leachville	AR
14633	Lead	SD
14634	Lead Hill	AR
14635	Leadore	ID
14636	Leadville	CO
14637	Leadwood	MO
14638	Leaf River	IL
14639	League City	TX
14640	Leakesville	MS
14641	Leakey	TX
14642	Leamington	UT
14643	Leander	TX
14644	Leary	GA
14645	Leasburg	MO
14646	Leasburg	NC
14647	Leavenworth	IN
14648	Leavenworth	KS
14649	Leavenworth	WA
14650	Leavittsburg	OH
14651	Leawood	KS
14652	Lebam	WA
14653	Lebanon	CT
14654	Lebanon	GA
14655	Lebanon	IL
14656	Lebanon	IN
14657	Lebanon	KS
14658	Lebanon	KY
14659	Lebanon	ME
14660	Lebanon	MO
14661	Lebanon	NE
14662	Lebanon	NH
14663	Lebanon	NJ
14664	Lebanon	OH
14665	Lebanon	OK
14666	Lebanon	OR
14667	Lebanon	PA
14668	Lebanon	SD
14669	Lebanon	TN
14670	Lebanon	VA
14671	Lebanon	WI
14672	Lebanon Junction	KY
14673	Lebeau	LA
14674	Lebec	CA
14675	Leblanc	LA
14676	Lebo	KS
14677	Leburn	KY
14678	Lecanto	FL
14679	Leck Kill	PA
14680	Leckrone	PA
14681	Lecompte	LA
14682	Lecompton	KS
14683	Lecontes Mills	PA
14684	Ledbetter	KY
14685	Ledbetter	TX
14686	Lederach	PA
14687	Ledger	MT
14688	Ledgewood	NJ
14689	Ledyard	CT
14690	Ledyard	IA
14691	Lee	FL
14692	Lee	IL
14693	Lee	MA
14694	Lee	ME
14695	Lee	NH
14696	Lee Center	IL
14697	Lee Center	NY
14698	Lee Vining	CA
14699	Leechburg	PA
14700	Leedey	OK
14701	Leeds	AL
14702	Leeds	MA
14703	Leeds	ME
14704	Leeds	ND
14705	Leeds	NY
14706	Leeds	UT
14707	Leeds Point	NJ
14708	Leeper	PA
14709	Lees Creek	OH
14710	Lees Summit	MO
14711	Leesburg	AL
14712	Leesburg	FL
14713	Leesburg	GA
14714	Leesburg	IN
14715	Leesburg	NJ
14716	Leesburg	OH
14717	Leesburg	TX
14718	Leesburg	VA
14719	Leesport	PA
14720	Leesville	LA
14721	Leesville	OH
14722	Leesville	SC
14723	Leesville	TX
14724	Leeton	MO
14725	Leetonia	OH
14726	Leetsdale	PA
14727	Leflore	OK
14728	Lefor	ND
14729	Lefors	TX
14730	Left Hand	WV
14731	Leggett	CA
14732	Leggett	TX
14733	Lehi	UT
14734	Lehigh	IA
14735	Lehigh	KS
14736	Lehigh	OK
14737	Lehigh Acres	FL
14738	Lehigh Valley	PA
14739	Lehighton	PA
14740	Lehman	PA
14741	Lehr	ND
14742	Leicester	MA
14743	Leicester	NC
14744	Leicester	NY
14745	Leigh	NE
14746	Leighton	AL
14747	Leighton	IA
14748	Leipsic	OH
14749	Leisenring	PA
14750	Leitchfield	KY
14751	Leiter	WY
14752	Leiters Ford	IN
14753	Leivasy	WV
14754	Lejunior	KY
14755	Leland	IA
14756	Leland	IL
14757	Leland	MI
14758	Leland	MS
14759	Leland	NC
14760	Lelia Lake	TX
14761	Lemasters	PA
14762	Lemhi	ID
14763	Leming	TX
14764	Lemitar	NM
14765	Lemmon	SD
14766	Lemon Cove	CA
14767	Lemon Grove	CA
14768	Lemon Springs	NC
14769	Lemont	IL
14770	Lemont	PA
14771	Lemont Furnace	PA
14772	Lemoore	CA
14773	Lemoyne	NE
14774	Lemoyne	OH
14775	Lemoyne	PA
14776	Lempster	NH
14777	Lena	IL
14778	Lena	LA
14779	Lena	MS
14780	Lena	WI
14781	Lenapah	OK
14782	Lenexa	KS
14783	Lengby	MN
14784	Lenhartsville	PA
14785	Lenni	PA
14786	Lennon	MI
14787	Lennox	SD
14788	Lenoir	NC
14789	Lenoir City	TN
14790	Lenora	KS
14791	Lenorah	TX
14792	Lenore	ID
14793	Lenore	WV
14794	Lenox	AL
14795	Lenox	GA
14796	Lenox	IA
14797	Lenox	MA
14798	Lenox	MO
14799	Lenox	TN
14800	Lenox Dale	MA
14801	Lenoxville	PA
14802	Lentner	MO
14803	Lenzburg	IL
14804	Leo	IN
14805	Leola	AR
14806	Leola	PA
14807	Leola	SD
14808	Leoma	TN
14809	Leominster	MA
14810	Leon	IA
14811	Leon	KS
14812	Leon	NY
14813	Leon	OK
14814	Leon	VA
14815	Leon	WV
14816	Leona	TX
14817	Leonard	MI
14818	Leonard	MN
14819	Leonard	MO
14820	Leonard	ND
14821	Leonard	OK
14822	Leonard	TX
14823	Leonardo	NJ
14824	Leonardsville	NY
14825	Leonardtown	MD
14826	Leonardville	KS
14827	Leonia	NJ
14828	Leonidas	MI
14829	Leonore	IL
14830	Leonville	LA
14831	Leopold	IN
14832	Leopold	MO
14833	Leopolis	WI
14834	Leota	MN
14835	Leoti	KS
14836	Lepanto	AR
14837	Lequire	OK
14838	Lerna	IL
14839	Lerona	WV
14840	Leroy	AL
14841	Leroy	IN
14842	Leroy	MI
14843	Leroy	TX
14844	Lesage	WV
14845	Leslie	AR
14846	Leslie	GA
14847	Leslie	MI
14848	Leslie	MO
14849	Leslie	WV
14850	Lester	AL
14851	Lester	IA
14852	Lester	WV
14853	Lester Prairie	MN
14854	Lesterville	MO
14855	Lesterville	SD
14856	Letart	WV
14857	Letcher	KY
14858	Letcher	SD
14859	Letha	ID
14860	Letohatchee	AL
14861	Letona	AR
14862	Letts	IA
14863	Lettsworth	LA
14864	Leupp	AZ
14865	Levan	UT
14866	Levant	KS
14867	Levant	ME
14868	Levasy	MO
14869	Levelland	TX
14870	Levelock	AK
14871	Levels	WV
14872	Leverett	MA
14873	Levering	MI
14874	Levittown	NY
14875	Levittown	PA
14876	Lewellen	NE
14877	Lewes	DE
14878	Lewis	CO
14879	Lewis	IA
14880	Lewis	IN
14881	Lewis	KS
14882	Lewis	NY
14883	Lewis Center	OH
14884	Lewis Run	PA
14885	Lewisberry	PA
14886	Lewisburg	KY
14887	Lewisburg	OH
14888	Lewisburg	PA
14889	Lewisburg	TN
14890	Lewisburg	WV
14891	Lewisport	KY
14892	Lewiston	CA
14893	Lewiston	ID
14894	Lewiston	ME
14895	Lewiston	MI
14896	Lewiston	MN
14897	Lewiston	NE
14898	Lewiston	NY
14899	Lewiston	UT
14900	Lewiston Woodville	NC
14901	Lewistown	IL
14902	Lewistown	MO
14903	Lewistown	MT
14904	Lewistown	OH
14905	Lewistown	PA
14906	Lewisville	AR
14907	Lewisville	ID
14908	Lewisville	IN
14909	Lewisville	MN
14910	Lewisville	NC
14911	Lewisville	OH
14912	Lewisville	PA
14913	Lewisville	TX
14914	Lexa	AR
14915	Lexington	AL
14916	Lexington	GA
14917	Lexington	IL
14918	Lexington	IN
14919	Lexington	KY
14920	Lexington	MA
14921	Lexington	MI
14922	Lexington	MO
14923	Lexington	MS
14924	Lexington	NC
14925	Lexington	NE
14926	Lexington	NY
14927	Lexington	OK
14928	Lexington	OR
14929	Lexington	SC
14930	Lexington	TN
14931	Lexington	TX
14932	Lexington	VA
14933	Lexington Park	MD
14934	Libby	MT
14935	Liberal	KS
14936	Liberal	MO
14937	Liberty	IL
14938	Liberty	IN
14939	Liberty	KS
14940	Liberty	KY
14941	Liberty	ME
14942	Liberty	MO
14943	Liberty	MS
14944	Liberty	NC
14945	Liberty	NE
14946	Liberty	NY
14947	Liberty	PA
14948	Liberty	SC
14949	Liberty	TN
14950	Liberty	TX
14951	Liberty	WV
14952	Liberty Center	IA
14953	Liberty Center	IN
14954	Liberty Center	OH
14955	Liberty Corner	NJ
14956	Liberty Hill	SC
14957	Liberty Hill	TX
14958	Liberty Lake	WA
14959	Liberty Mills	IN
14960	Libertytown	MD
14961	Libertyville	IA
14962	Libertyville	IL
14963	Libuse	LA
14964	Lick Creek	KY
14965	Licking	MO
14966	Lickingville	PA
14967	Lidderdale	IA
14968	Lidgerwood	ND
14969	Liebenthal	KS
14970	Light	AR
14971	Lightfoot	VA
14972	Lighthouse Point	FL
14973	Lightstreet	PA
14974	Lignite	ND
14975	Lignum	VA
14976	Ligonier	IN
14977	Ligonier	PA
14978	Liguori	MO
14979	Lihue	HI
14980	Likely	CA
14981	Lilbourn	MO
14982	Lilburn	GA
14983	Lilesville	NC
14984	Lillian	AL
14985	Lillian	TX
14986	Lillie	LA
14987	Lillington	NC
14988	Lilliwaup	WA
14989	Lilly	GA
14990	Lilly	PA
14991	Lily	KY
14992	Lily Dale	NY
14993	Lima	IL
14994	Lima	MT
14995	Lima	NY
14996	Lima	OH
14997	Limaville	OH
14998	Lime Ridge	WI
14999	Lime Springs	IA
15000	Limekiln	PA
15001	Limeport	PA
15002	Limerick	ME
15003	Limerick	NY
15004	Limestone	ME
15005	Limestone	NY
15006	Limestone	PA
15007	Limestone	TN
15008	Limington	ME
15009	Limon	CO
15010	Linch	WY
15011	Lincoln	AL
15012	Lincoln	AR
15013	Lincoln	CA
15014	Lincoln	DE
15015	Lincoln	IA
15016	Lincoln	IL
15017	Lincoln	KS
15018	Lincoln	MA
15019	Lincoln	ME
15020	Lincoln	MI
15021	Lincoln	MO
15022	Lincoln	MT
15023	Lincoln	NE
15024	Lincoln	NH
15025	Lincoln	NM
15026	Lincoln	RI
15027	Lincoln	TX
15028	Lincoln	VA
15029	Lincoln	WA
15030	Lincoln Acres	CA
15031	Lincoln City	IN
15032	Lincoln City	OR
15033	Lincoln Park	MI
15034	Lincoln Park	NJ
15035	Lincoln University	PA
15036	Lincolndale	NY
15037	Lincolns New Salem	IL
15038	Lincolnshire	IL
15039	Lincolnton	GA
15040	Lincolnton	NC
15041	Lincolnville	KS
15042	Lincolnville	ME
15043	Lincolnville Center	ME
15044	Lincolnwood	IL
15045	Lincroft	NJ
15046	Lind	WA
15047	Lindale	GA
15048	Lindale	TX
15049	Linden	AL
15050	Linden	CA
15051	Linden	IA
15052	Linden	IN
15053	Linden	MI
15054	Linden	NC
15055	Linden	NJ
15056	Linden	PA
15057	Linden	TN
15058	Linden	TX
15059	Linden	VA
15060	Linden	WI
15061	Lindenhurst	NY
15062	Lindenwood	IL
15063	Lindley	NY
15064	Lindon	CO
15065	Lindon	UT
15066	Lindrith	NM
15067	Lindsay	CA
15068	Lindsay	MT
15069	Lindsay	NE
15070	Lindsay	OK
15071	Lindsay	TX
15072	Lindsborg	KS
15073	Lindsey	OH
15074	Lindside	WV
15075	Lindstrom	MN
15076	Line Lexington	PA
15077	Lineboro	MD
15078	Linefork	KY
15079	Linesville	PA
15080	Lineville	AL
15081	Lineville	IA
15082	Lingle	WY
15083	Lingleville	TX
15084	Lingo	NM
15085	Linkwood	MD
15086	Linn	KS
15087	Linn	MO
15088	Linn	TX
15089	Linn	WV
15090	Linn Creek	MO
15091	Linn Grove	IA
15092	Linneus	MO
15093	Linthicum Heights	MD
15094	Linton	IN
15095	Linton	ND
15096	Linville	NC
15097	Linville	VA
15098	Linville Falls	NC
15099	Linwood	KS
15100	Linwood	MA
15101	Linwood	MI
15102	Linwood	NC
15103	Linwood	NE
15104	Linwood	NJ
15105	Linwood	NY
15106	Lionville	PA
15107	Lipan	TX
15108	Lipscomb	TX
15109	Lisbon	IA
15110	Lisbon	LA
15111	Lisbon	MD
15112	Lisbon	ME
15113	Lisbon	ND
15114	Lisbon	NH
15115	Lisbon	NY
15116	Lisbon	OH
15117	Lisbon Falls	ME
15118	Lisco	NE
15119	Liscomb	IA
15120	Lisle	IL
15121	Lisle	NY
15122	Lisman	AL
15123	Lismore	MN
15124	Lissie	TX
15125	Listie	PA
15126	Litchfield	CA
15127	Litchfield	CT
15128	Litchfield	IL
15129	Litchfield	ME
15130	Litchfield	MI
15131	Litchfield	MN
15132	Litchfield	NE
15133	Litchfield	NH
15134	Litchfield	OH
15135	Litchfield Park	AZ
15136	Litchville	ND
15137	Literberry	IL
15138	Lithia	FL
15139	Lithia Springs	GA
15140	Lithonia	GA
15141	Lithopolis	OH
15142	Lititz	PA
15143	Littcarr	KY
15144	Little America	WY
15145	Little Birch	WV
15146	Little Cedar	IA
15147	Little Chute	WI
15148	Little Compton	RI
15149	Little Creek	DE
15150	Little Deer Isle	ME
15151	Little Eagle	SD
15152	Little Egg Harbor Twp	NJ
15153	Little Elm	TX
15154	Little Falls	MN
15155	Little Falls	NJ
15156	Little Falls	NY
15157	Little Ferry	NJ
15158	Little Genesee	NY
15159	Little Hocking	OH
15160	Little Lake	CA
15161	Little Lake	MI
15162	Little Meadows	PA
15163	Little Mountain	SC
15164	Little Neck	NY
15165	Little Orleans	MD
15166	Little Plymouth	VA
15167	Little River	AL
15168	Little River	CA
15169	Little River	KS
15170	Little River	SC
15171	Little River Academy	TX
15172	Little Rock	AR
15173	Little Rock	IA
15174	Little Rock	MS
15175	Little Rock	SC
15176	Little Rock Air Force Base	AR
15177	Little Silver	NJ
15178	Little Sioux	IA
15179	Little Suamico	WI
15180	Little Switzerland	NC
15181	Little Valley	NY
15182	Little York	IL
15183	Little York	IN
15184	Little York	NJ
15185	Little York	NY
15186	Littlefield	AZ
15187	Littlefield	TX
15188	Littlefork	MN
15189	Littlerock	CA
15190	Littlerock	WA
15191	Littlestown	PA
15192	Littleton	CO
15193	Littleton	IL
15194	Littleton	MA
15195	Littleton	NC
15196	Littleton	NH
15197	Littleton	WV
15198	Live Oak	CA
15199	Live Oak	FL
15200	Lively	VA
15201	Livermore	CA
15202	Livermore	CO
15203	Livermore	IA
15204	Livermore	KY
15205	Livermore	ME
15206	Livermore Falls	ME
15207	Liverpool	IL
15208	Liverpool	NY
15209	Liverpool	PA
15210	Liverpool	TX
15211	Livingston	AL
15212	Livingston	CA
15213	Livingston	IL
15214	Livingston	KY
15215	Livingston	LA
15216	Livingston	MT
15217	Livingston	NJ
15218	Livingston	NY
15219	Livingston	TN
15220	Livingston	TX
15221	Livingston	WI
15222	Livingston Manor	NY
15223	Livonia	LA
15224	Livonia	MI
15225	Livonia	MO
15226	Livonia	NY
15227	Livonia Center	NY
15228	Lizella	GA
15229	Lizemores	WV
15230	Lizton	IN
15231	Llano	CA
15232	Llano	NM
15233	Llano	TX
15234	Llewellyn	PA
15235	Lloyd	FL
15236	Lloyd	MT
15237	Loa	UT
15238	Loachapoka	AL
15239	Loami	IL
15240	Lobeco	SC
15241	Lobelville	TN
15242	Loch Sheldrake	NY
15243	Lochgelly	WV
15244	Lochloosa	FL
15245	Lochmere	NH
15246	Lock Haven	PA
15247	Lock Springs	MO
15248	Lockbourne	OH
15249	Locke	NY
15250	Lockeford	CA
15251	Lockesburg	AR
15252	Lockhart	AL
15253	Lockhart	SC
15254	Lockhart	TX
15255	Lockney	TX
15256	Lockport	IL
15257	Lockport	KY
15258	Lockport	LA
15259	Lockport	NY
15260	Lockridge	IA
15261	Lockwood	CA
15262	Lockwood	MO
15263	Lockwood	NY
15264	Loco	OK
15265	Loco Hills	NM
15266	Locust	NC
15267	Locust Dale	VA
15268	Locust Fork	AL
15269	Locust Gap	PA
15270	Locust Grove	AR
15271	Locust Grove	GA
15272	Locust Grove	OK
15273	Locust Grove	VA
15274	Locust Hill	VA
15275	Locust Valley	NY
15276	Locustdale	PA
15277	Locustville	VA
15278	Loda	IL
15279	Lodge	SC
15280	Lodge Grass	MT
15281	Lodgepole	NE
15282	Lodgepole	SD
15283	Lodi	CA
15284	Lodi	MO
15285	Lodi	NJ
15286	Lodi	NY
15287	Lodi	OH
15288	Lodi	TX
15289	Lodi	WI
15290	Log Lane Village	CO
15291	Logan	AL
15292	Logan	IA
15293	Logan	IL
15294	Logan	KS
15295	Logan	NM
15296	Logan	OH
15297	Logan	UT
15298	Logan	WV
15299	Logandale	NV
15300	Logansport	IN
15301	Logansport	LA
15302	Loganton	PA
15303	Loganville	GA
15304	Loganville	PA
15305	Loganville	WI
15306	Logsden	OR
15307	Lohman	MO
15308	Lohn	TX
15309	Lohrville	IA
15310	Loleta	CA
15311	Lolita	TX
15312	Lolo	MT
15313	Loma	CO
15314	Loma	MT
15315	Loma Linda	CA
15316	Loma Mar	CA
15317	Loman	MN
15318	Lomax	IL
15319	Lombard	IL
15320	Lometa	TX
15321	Lomira	WI
15322	Lomita	CA
15323	Lompoc	CA
15324	Lonaconing	MD
15325	London	AR
15326	London	KY
15327	London	OH
15328	London	TX
15329	London	WV
15330	London Mills	IL
15331	Londonderry	NH
15332	Londonderry	OH
15333	Londonderry	VT
15334	Lone	KY
15335	Lone Grove	OK
15336	Lone Jack	MO
15337	Lone Mountain	TN
15338	Lone Oak	TX
15339	Lone Pine	CA
15340	Lone Rock	IA
15341	Lone Rock	WI
15342	Lone Star	TX
15343	Lone Tree	IA
15344	Lone Wolf	OK
15345	Lonedell	MO
15346	Lonepine	MT
15347	Lonetree	WY
15348	Long Barn	CA
15349	Long Beach	CA
15350	Long Beach	MS
15351	Long Beach	NY
15352	Long Beach	WA
15353	Long Bottom	OH
15354	Long Branch	NJ
15355	Long Branch	TX
15356	Long Creek	OR
15357	Long Creek	SC
15358	Long Eddy	NY
15359	Long Green	MD
15360	Long Grove	IA
15361	Long Grove	IL
15362	Long Island	KS
15363	Long Island	ME
15364	Long Island	VA
15365	Long Island City	NY
15366	Long Key	FL
15367	Long Lake	MI
15368	Long Lake	MN
15369	Long Lake	NY
15370	Long Lake	WI
15371	Long Lane	MO
15372	Long Pine	NE
15373	Long Point	IL
15374	Long Pond	PA
15375	Long Prairie	MN
15376	Long Valley	NJ
15377	Long Valley	SD
15378	Longboat Key	FL
15379	Longbranch	WA
15380	Longdale	OK
15381	Longford	KS
15382	Longlake	SD
15383	Longleaf	LA
15384	Longmeadow	MA
15385	Longmire	WA
15386	Longmont	CO
15387	Longport	NJ
15388	Longs	SC
15389	Longstreet	LA
15390	Longton	KS
15391	Longview	IL
15392	Longview	TX
15393	Longview	WA
15394	Longville	LA
15395	Longville	MN
15396	Longwood	FL
15397	Longwood	NC
15398	Lonoke	AR
15399	Lonsdale	AR
15400	Lonsdale	MN
15401	Loogootee	IL
15402	Loogootee	IN
15403	Lookeba	OK
15404	Lookout	CA
15405	Lookout	KY
15406	Lookout	WV
15407	Lookout Mountain	GA
15408	Lookout Mountain	TN
15409	Loomis	CA
15410	Loomis	NE
15411	Loomis	WA
15412	Loon Lake	WA
15413	Looneyville	WV
15414	Loop	TX
15415	Loose Creek	MO
15416	Lopeno	TX
15417	Lopez	PA
15418	Lopez Island	WA
15419	Lorado	WV
15420	Lorain	OH
15421	Loraine	IL
15422	Loraine	TX
15423	Lorane	OR
15424	Loranger	LA
15425	Lordsburg	NM
15426	Lore City	OH
15427	Loreauville	LA
15428	Lorena	TX
15429	Lorentz	WV
15430	Lorenzo	TX
15431	Loretto	KY
15432	Loretto	MI
15433	Loretto	MN
15434	Loretto	PA
15435	Loretto	TN
15436	Loretto	VA
15437	Lorida	FL
15438	Lorimor	IA
15439	Loring	MT
15440	Loris	SC
15441	Lorman	MS
15442	Lorraine	KS
15443	Lorraine	NY
15444	Lorton	NE
15445	Lorton	VA
15446	Los Alamitos	CA
15447	Los Alamos	CA
15448	Los Alamos	NM
15449	Los Altos	CA
15450	Los Angeles	CA
15451	Los Banos	CA
15452	Los Ebanos	TX
15453	Los Fresnos	TX
15454	Los Gatos	CA
15455	Los Indios	TX
15456	Los Lunas	NM
15457	Los Molinos	CA
15458	Los Ojos	NM
15459	Los Olivos	CA
15460	Los Osos	CA
15461	Losantville	IN
15462	Lost City	WV
15463	Lost Creek	KY
15464	Lost Creek	PA
15465	Lost Creek	WV
15466	Lost Hills	CA
15467	Lost Nation	IA
15468	Lost Springs	KS
15469	Lost Springs	WY
15470	Lostant	IL
15471	Lostine	OR
15472	Lothair	MT
15473	Lothian	MD
15474	Lott	TX
15475	Lottie	LA
15476	Lottsburg	VA
15477	Lotus	CA
15478	Louann	AR
15479	Loudon	NH
15480	Loudon	TN
15481	Loudonville	OH
15482	Loughman	FL
15483	Louin	MS
15484	Louisa	KY
15485	Louisa	VA
15486	Louisburg	KS
15487	Louisburg	MO
15488	Louisburg	NC
15489	Louise	MS
15490	Louise	TX
15491	Louisiana	MO
15492	Louisville	AL
15493	Louisville	CO
15494	Louisville	GA
15495	Louisville	IL
15496	Louisville	KY
15497	Louisville	MS
15498	Louisville	NE
15499	Louisville	OH
15500	Louisville	TN
15501	Loup City	NE
15502	Louvale	GA
15503	Louviers	CO
15504	Lovejoy	GA
15505	Lovejoy	IL
15506	Lovelaceville	KY
15507	Lovelady	TX
15508	Loveland	CO
15509	Loveland	OH
15510	Loveland	OK
15511	Lovell	ME
15512	Lovell	WY
15513	Lovelock	NV
15514	Lovely	KY
15515	Loves Park	IL
15516	Lovettsville	VA
15517	Loveville	MD
15518	Lovilia	IA
15519	Loving	NM
15520	Loving	TX
15521	Lovingston	VA
15522	Lovington	IL
15523	Lovington	NM
15524	Low Moor	IA
15525	Low Moor	VA
15526	Lowake	TX
15527	Lowber	PA
15528	Lowden	IA
15529	Lowder	IL
15530	Lowell	AR
15531	Lowell	FL
15532	Lowell	IN
15533	Lowell	MA
15534	Lowell	MI
15535	Lowell	NC
15536	Lowell	OH
15537	Lowell	OR
15538	Lowell	VT
15539	Lowell	WI
15540	Lowellville	OH
15541	Lower Brule	SD
15542	Lower Kalskag	AK
15543	Lower Lake	CA
15544	Lower Peach Tree	AL
15545	Lower Salem	OH
15546	Lower Waterford	VT
15547	Lowes	KY
15548	Lowgap	NC
15549	Lowland	NC
15550	Lowland	TN
15551	Lowman	ID
15552	Lowman	NY
15553	Lowmansville	KY
15554	Lowndes	MO
15555	Lowndesboro	AL
15556	Lowndesville	SC
15557	Lowpoint	IL
15558	Lowry	MN
15559	Lowry	VA
15560	Lowry City	MO
15561	Lowville	NY
15562	Loxahatchee	FL
15563	Loxley	AL
15564	Loyal	OK
15565	Loyal	WI
15566	Loyalhanna	PA
15567	Loyall	KY
15568	Loyalton	CA
15569	Loysburg	PA
15570	Loysville	PA
15571	Lozano	TX
15572	Lu Verne	IA
15573	Luana	IA
15574	Lubbock	TX
15575	Lubec	ME
15576	Lublin	WI
15577	Lucama	NC
15578	Lucan	MN
15579	Lucas	IA
15580	Lucas	KS
15581	Lucas	KY
15582	Lucas	OH
15583	Lucasville	OH
15584	Lucedale	MS
15585	Lucerne	CA
15586	Lucerne	CO
15587	Lucerne	IN
15588	Lucerne	MO
15589	Lucerne Valley	CA
15590	Lucernemines	PA
15591	Lucien	OK
15592	Lucile	ID
15593	Lucinda	PA
15594	Luck	WI
15595	Luckey	OH
15596	Ludell	KS
15597	Ludington	MI
15598	Ludlow	CA
15599	Ludlow	IL
15600	Ludlow	MA
15601	Ludlow	MO
15602	Ludlow	MS
15603	Ludlow	PA
15604	Ludlow	SD
15605	Ludlow	VT
15606	Ludlow Falls	OH
15607	Ludowici	GA
15608	Luebbering	MO
15609	Lueders	TX
15610	Lufkin	TX
15611	Lugoff	SC
15612	Lukachukai	AZ
15613	Luke	MD
15614	Lukeville	AZ
15615	Lula	GA
15616	Lula	MS
15617	Luling	LA
15618	Luling	TX
15619	Lulu	FL
15620	Lumber Bridge	NC
15621	Lumber City	GA
15622	Lumberport	WV
15623	Lumberton	MS
15624	Lumberton	NC
15625	Lumberton	NJ
15626	Lumberton	TX
15627	Lumberville	PA
15628	Lummi Island	WA
15629	Lumpkin	GA
15630	Luna	NM
15631	Luna Pier	MI
15632	Lund	NV
15633	Lunenburg	MA
15634	Lunenburg	VA
15635	Lunenburg	VT
15636	Luning	NV
15637	Lupton	AZ
15638	Lupton	MI
15639	Lupton City	TN
15640	Luray	KS
15641	Luray	MO
15642	Luray	SC
15643	Luray	TN
15644	Luray	VA
15645	Lurgan	PA
15646	Lusby	MD
15647	Lusk	WY
15648	Lutcher	LA
15649	Luther	IA
15650	Luther	MI
15651	Luther	OK
15652	Luthersburg	PA
15653	Luthersville	GA
15654	Lutherville Timonium	MD
15655	Lutsen	MN
15656	Luttrell	TN
15657	Lutts	TN
15658	Lutz	FL
15659	Luverne	AL
15660	Luverne	MN
15661	Luverne	ND
15662	Luxemburg	IA
15663	Luxemburg	WI
15664	Luxor	PA
15665	Luxora	AR
15666	Luzerne	IA
15667	Luzerne	MI
15668	Luzerne	PA
15669	Lyburn	WV
15670	Lycoming	NY
15671	Lydia	LA
15672	Lydia	SC
15673	Lyerly	GA
15674	Lyford	TX
15675	Lykens	PA
15676	Lyle	MN
15677	Lyle	WA
15678	Lyles	TN
15679	Lyman	NE
15680	Lyman	SC
15681	Lyman	UT
15682	Lyman	WA
15683	Lyman	WY
15684	Lyme	NH
15685	Lyme Center	NH
15686	Lynbrook	NY
15687	Lynch	KY
15688	Lynch	NE
15689	Lynch Station	VA
15690	Lynchburg	MO
15691	Lynchburg	OH
15692	Lynchburg	SC
15693	Lynchburg	TN
15694	Lynchburg	VA
15695	Lynco	WV
15696	Lynd	MN
15697	Lyndeborough	NH
15698	Lyndell	PA
15699	Lynden	WA
15700	Lyndhurst	NJ
15701	Lyndhurst	VA
15702	Lyndon	IL
15703	Lyndon	KS
15704	Lyndon	VT
15705	Lyndon Center	VT
15706	Lyndon Station	WI
15707	Lyndonville	NY
15708	Lyndonville	VT
15709	Lyndora	PA
15710	Lynn	AL
15711	Lynn	AR
15712	Lynn	IN
15713	Lynn	MA
15714	Lynn	NC
15715	Lynn Center	IL
15716	Lynn Haven	FL
15717	Lynndyl	UT
15718	Lynnfield	MA
15719	Lynnville	IA
15720	Lynnville	IN
15721	Lynnville	KY
15722	Lynnville	TN
15723	Lynnwood	WA
15724	Lynwood	CA
15725	Lynx	OH
15726	Lynxville	WI
15727	Lyon	MS
15728	Lyon Mountain	NY
15729	Lyon Station	PA
15730	Lyons	CO
15731	Lyons	GA
15732	Lyons	IL
15733	Lyons	IN
15734	Lyons	KS
15735	Lyons	MI
15736	Lyons	NE
15737	Lyons	NJ
15738	Lyons	NY
15739	Lyons	OH
15740	Lyons	OR
15741	Lyons	SD
15742	Lyons	TX
15743	Lyons	WI
15744	Lyons Falls	NY
15745	Lysite	WY
15746	Lytle	TX
15747	Lytle Creek	CA
15748	Lytton	IA
15749	M C B H Kaneohe Bay	HI
15750	Mabank	TX
15751	Mabel	MN
15752	Mabelvale	AR
15753	Maben	MS
15754	Maben	WV
15755	Mabie	WV
15756	Mableton	GA
15757	Mabscott	WV
15758	Mabton	WA
15759	Mac Arthur	WV
15760	Macatawa	MI
15761	Macclenny	FL
15762	Macclesfield	NC
15763	Macdoel	CA
15764	Macdona	TX
15765	Macedon	NY
15766	Macedonia	IA
15767	Macedonia	IL
15768	Macedonia	OH
15769	Maceo	KY
15770	Macfarlan	WV
15771	Machesney Park	IL
15772	Machias	ME
15773	Machias	NY
15774	Machiasport	ME
15775	Machipongo	VA
15776	Mack	CO
15777	Mackay	ID
15778	Mackey	IN
15779	Mackeyville	PA
15780	Mackinac Island	MI
15781	Mackinaw	IL
15782	Mackinaw City	MI
15783	Macks Creek	MO
15784	Macks Inn	ID
15785	Macksburg	IA
15786	Macksburg	OH
15787	Macksville	KS
15788	Mackville	KY
15789	Macomb	IL
15790	Macomb	MI
15791	Macomb	MO
15792	Macomb	OK
15793	Macon	GA
15794	Macon	IL
15795	Macon	MO
15796	Macon	MS
15797	Macon	NC
15798	Macon	TN
15799	Macon	VA
15800	Macungie	PA
15801	Macy	IN
15802	Macy	NE
15803	Mad River	CA
15804	Madawaska	ME
15805	Madbury	NH
15806	Madden	MS
15807	Maddock	ND
15808	Madelia	MN
15809	Madeline	CA
15810	Madera	CA
15811	Madera	PA
15812	Madill	OK
15813	Madison	AL
15814	Madison	AR
15815	Madison	CA
15816	Madison	CT
15817	Madison	FL
15818	Madison	GA
15819	Madison	IL
15820	Madison	IN
15821	Madison	KS
15822	Madison	MD
15823	Madison	ME
15824	Madison	MN
15825	Madison	MO
15826	Madison	MS
15827	Madison	NC
15828	Madison	NE
15829	Madison	NH
15830	Madison	NJ
15831	Madison	NY
15832	Madison	OH
15833	Madison	PA
15834	Madison	SD
15835	Madison	TN
15836	Madison	VA
15837	Madison	WI
15838	Madison	WV
15839	Madison Heights	MI
15840	Madison Heights	VA
15841	Madison Lake	MN
15842	Madisonburg	PA
15843	Madisonville	KY
15844	Madisonville	LA
15845	Madisonville	TN
15846	Madisonville	TX
15847	Madras	OR
15848	Madrid	IA
15849	Madrid	NE
15850	Madrid	NY
15851	Maeystown	IL
15852	Magalia	CA
15853	Magazine	AR
15854	Magdalena	NM
15855	Magee	MS
15856	Maggie Valley	NC
15857	Magna	UT
15858	Magness	AR
15859	Magnet	NE
15860	Magnetic Springs	OH
15861	Magnolia	AL
15862	Magnolia	AR
15863	Magnolia	DE
15864	Magnolia	IA
15865	Magnolia	IL
15866	Magnolia	KY
15867	Magnolia	MN
15868	Magnolia	MS
15869	Magnolia	NC
15870	Magnolia	NJ
15871	Magnolia	OH
15872	Magnolia	TX
15873	Magnolia Springs	AL
15874	Mahanoy City	PA
15875	Mahanoy Plane	PA
15876	Mahaska	KS
15877	Mahnomen	MN
15878	Mahomet	IL
15879	Mahopac	NY
15880	Mahopac Falls	NY
15881	Mahwah	NJ
15882	Maida	ND
15883	Maiden	NC
15884	Maiden Rock	WI
15885	Maidens	VA
15886	Maidsville	WV
15887	Maine	NY
15888	Mainesburg	PA
15889	Maineville	OH
15890	Mainland	PA
15891	Maitland	FL
15892	Maitland	MO
15893	Maize	KS
15894	Majestic	KY
15895	Makanda	IL
15896	Makawao	HI
15897	Makaweli	HI
15898	Makinen	MN
15899	Makoti	ND
15900	Malabar	FL
15901	Malad City	ID
15902	Malaga	NJ
15903	Malaga	NM
15904	Malaga	OH
15905	Malaga	WA
15906	Malakoff	TX
15907	Malcolm	AL
15908	Malcolm	NE
15909	Malcom	IA
15910	Malden	IL
15911	Malden	MA
15912	Malden	MO
15913	Malden	WA
15914	Malden Bridge	NY
15915	Malden On Hudson	NY
15916	Malibu	CA
15917	Malin	OR
15918	Malinta	OH
15919	Maljamar	NM
15920	Mallard	IA
15921	Mallie	KY
15922	Mallory	NY
15923	Mallory	WV
15924	Malmo	NE
15925	Malmstrom A F B	MT
15926	Malo	WA
15927	Malone	FL
15928	Malone	KY
15929	Malone	NY
15930	Malone	TX
15931	Malone	WA
15932	Malone	WI
15933	Malott	WA
15934	Malta	ID
15935	Malta	IL
15936	Malta	MT
15937	Malta	OH
15938	Malta Bend	MO
15939	Malvern	AL
15940	Malvern	AR
15941	Malvern	IA
15942	Malvern	OH
15943	Malvern	PA
15944	Malverne	NY
15945	Mamaroneck	NY
15946	Mamers	NC
15947	Mammoth	AZ
15948	Mammoth	PA
15949	Mammoth	WV
15950	Mammoth Cave	KY
15951	Mammoth Lakes	CA
15952	Mammoth Spring	AR
15953	Mamou	LA
15954	Man	WV
15955	Manahawkin	NJ
15956	Manakin Sabot	VA
15957	Manasquan	NJ
15958	Manassa	CO
15959	Manassas	GA
15960	Manassas	VA
15961	Manawa	WI
15962	Mancelona	MI
15963	Manchaca	TX
15964	Manchaug	MA
15965	Manchester	CA
15966	Manchester	CT
15967	Manchester	GA
15968	Manchester	IA
15969	Manchester	IL
15970	Manchester	KY
15971	Manchester	MA
15972	Manchester	MD
15973	Manchester	ME
15974	Manchester	MI
15975	Manchester	NH
15976	Manchester	NY
15977	Manchester	OH
15978	Manchester	OK
15979	Manchester	PA
15980	Manchester	TN
15981	Manchester	VT
15982	Manchester	WA
15983	Manchester Center	VT
15984	Manchester Township	NJ
15985	Mancos	CO
15986	Mandan	ND
15987	Mandaree	ND
15988	Manderson	SD
15989	Manderson	WY
15990	Mandeville	LA
15991	Mangham	LA
15992	Mango	FL
15993	Mangum	OK
15994	Manhasset	NY
15995	Manhattan	IL
15996	Manhattan	KS
15997	Manhattan	MT
15998	Manhattan	NV
15999	Manhattan Beach	CA
16000	Manheim	PA
16001	Manila	AR
16002	Manila	UT
16003	Manilla	IA
16004	Manilla	IN
16005	Manistee	MI
16006	Manistique	MI
16007	Manito	IL
16008	Manitou	KY
16009	Manitou	OK
16010	Manitou Beach	MI
16011	Manitou Springs	CO
16012	Manitowish Waters	WI
16013	Manitowoc	WI
16014	Mankato	KS
16015	Mankato	MN
16016	Manley	NE
16017	Manley Hot Springs	AK
16018	Manlius	IL
16019	Manlius	NY
16020	Manly	IA
16021	Mannboro	VA
16022	Mannford	OK
16023	Manning	IA
16024	Manning	ND
16025	Manning	OR
16026	Manning	SC
16027	Mannington	WV
16028	Manns Choice	PA
16029	Manns Harbor	NC
16030	Mannsville	KY
16031	Mannsville	NY
16032	Mannsville	OK
16033	Manokin	MD
16034	Manokotak	AK
16035	Manomet	MA
16036	Manor	GA
16037	Manor	PA
16038	Manor	TX
16039	Manorville	NY
16040	Manorville	PA
16041	Manquin	VA
16042	Mansfield	AR
16043	Mansfield	GA
16044	Mansfield	IL
16045	Mansfield	LA
16046	Mansfield	MA
16047	Mansfield	MO
16048	Mansfield	OH
16049	Mansfield	PA
16050	Mansfield	SD
16051	Mansfield	TN
16052	Mansfield	TX
16053	Mansfield	WA
16054	Mansfield Center	CT
16055	Mansfield Depot	CT
16056	Manson	IA
16057	Manson	NC
16058	Manson	WA
16059	Mansura	LA
16060	Mantachie	MS
16061	Mantador	ND
16062	Manteca	CA
16063	Mantee	MS
16064	Manteno	IL
16065	Manteo	NC
16066	Manter	KS
16067	Manti	UT
16068	Mantoloking	NJ
16069	Manton	CA
16070	Manton	MI
16071	Mantorville	MN
16072	Mantua	NJ
16073	Mantua	OH
16074	Mantua	UT
16075	Manvel	ND
16076	Manvel	TX
16077	Manville	NJ
16078	Manville	RI
16079	Manville	WY
16080	Many	LA
16081	Many Farms	AZ
16082	Manzanita	OR
16083	Manzanola	CO
16084	Mapaville	MO
16085	Maple	NC
16086	Maple	TX
16087	Maple	WI
16088	Maple City	KS
16089	Maple City	MI
16090	Maple Falls	WA
16091	Maple Heights	OH
16092	Maple Hill	KS
16093	Maple Hill	NC
16094	Maple Lake	MN
16095	Maple Mount	KY
16096	Maple Park	IL
16097	Maple Plain	MN
16098	Maple Rmeisterdish_serverds	MI
16099	Maple Shade	NJ
16100	Maple Springs	NY
16101	Maple Valley	WA
16102	Maple View	NY
16103	Maplecrest	NY
16104	Maplesville	AL
16105	Mapleton	IA
16106	Mapleton	IL
16107	Mapleton	KS
16108	Mapleton	ME
16109	Mapleton	MN
16110	Mapleton	ND
16111	Mapleton	OR
16112	Mapleton	UT
16113	Mapleton Depot	PA
16114	Mapleville	RI
16115	Maplewood	NJ
16116	Maplewood	OH
16117	Maplewood	WI
16118	Mappsville	VA
16119	Maquoketa	IA
16120	Maquon	IL
16121	Mar Lin	PA
16122	Maramec	OK
16123	Marana	AZ
16124	Marathon	FL
16125	Marathon	IA
16126	Marathon	NY
16127	Marathon	OH
16128	Marathon	TX
16129	Marathon	WI
16130	Marathon Shores	FL
16131	Marble	MN
16132	Marble	NC
16133	Marble	PA
16134	Marble Canyon	AZ
16135	Marble City	OK
16136	Marble Falls	AR
16137	Marble Falls	TX
16138	Marble Hill	GA
16139	Marble Hill	MO
16140	Marble Rock	IA
16141	Marblehead	MA
16142	Marblemount	WA
16143	Marbury	AL
16144	Marbury	MD
16145	Marceline	MO
16146	Marcell	MN
16147	Marcella	AR
16148	Marcellus	MI
16149	Marcellus	NY
16150	March Air Reserve Base	CA
16151	Marchand	PA
16152	Marco Island	FL
16153	Marcola	OR
16154	Marcus	IA
16155	Marcus	WA
16156	Marcus Hook	PA
16157	Marcy	NY
16158	Mardela Springs	MD
16159	Marengo	IA
16160	Marengo	IL
16161	Marengo	IN
16162	Marengo	OH
16163	Marengo	WI
16164	Marenisco	MI
16165	Marfa	TX
16166	Margaret	AL
16167	Margarettsville	NC
16168	Margaretville	NY
16169	Margate City	NJ
16170	Margie	MN
16171	Maria Stein	OH
16172	Mariah Hill	IN
16173	Marianna	AR
16174	Marianna	FL
16175	Marianna	PA
16176	Marianna	WV
16177	Maribel	WI
16178	Maricopa	AZ
16179	Maricopa	CA
16180	Marienthal	KS
16181	Marienville	PA
16182	Marietta	GA
16183	Marietta	IL
16184	Marietta	MN
16185	Marietta	MS
16186	Marietta	NC
16187	Marietta	NY
16188	Marietta	OH
16189	Marietta	OK
16190	Marietta	PA
16191	Marietta	SC
16192	Marietta	TX
16193	Marilla	NY
16194	Marina	CA
16195	Marina Del Rey	CA
16196	Marine	IL
16197	Marine City	MI
16198	Marine On Saint Croix	MN
16199	Marinette	WI
16200	Maringouin	LA
16201	Marion	AL
16202	Marion	AR
16203	Marion	CT
16204	Marion	IA
16205	Marion	IL
16206	Marion	IN
16207	Marion	KS
16208	Marion	KY
16209	Marion	LA
16210	Marion	MA
16211	Marion	MI
16212	Marion	MS
16213	Marion	MT
16214	Marion	NC
16215	Marion	ND
16216	Marion	NY
16217	Marion	OH
16218	Marion	PA
16219	Marion	SC
16220	Marion	SD
16221	Marion	TX
16222	Marion	VA
16223	Marion	WI
16224	Marion Center	PA
16225	Marion Heights	PA
16226	Marion Junction	AL
16227	Marion Station	MD
16228	Marionville	MO
16229	Marionville	VA
16230	Mariposa	CA
16231	Marissa	IL
16232	Mark	IL
16233	Mark Center	OH
16234	Marked Tree	AR
16235	Markesan	WI
16236	Markham	IL
16237	Markham	TX
16238	Markham	VA
16239	Markle	IN
16240	Markleeville	CA
16241	Markleton	PA
16242	Markleville	IN
16243	Markleysburg	PA
16244	Marks	MS
16245	Marksville	LA
16246	Marland	OK
16247	Marlboro	NJ
16248	Marlboro	NY
16249	Marlboro	VT
16250	Marlborough	CT
16251	Marlborough	MA
16252	Marlborough	NH
16253	Marlette	MI
16254	Marlin	TX
16255	Marlin	WA
16256	Marlinton	WV
16257	Marlow	NH
16258	Marlow	OK
16259	Marlton	NJ
16260	Marmaduke	AR
16261	Marmarth	ND
16262	Marmora	NJ
16263	Marne	IA
16264	Marne	MI
16265	Maroa	IL
16266	Marquand	MO
16267	Marquette	IA
16268	Marquette	KS
16269	Marquette	MI
16270	Marquette	NE
16271	Marquette	WI
16272	Marquez	TX
16273	Marrero	LA
16274	Marriottsville	MD
16275	Marrowbone	KY
16276	Mars	PA
16277	Mars Hill	ME
16278	Mars Hill	NC
16279	Marseilles	IL
16280	Marshall	AK
16281	Marshall	AR
16282	Marshall	CA
16283	Marshall	IL
16284	Marshall	IN
16285	Marshall	MI
16286	Marshall	MN
16287	Marshall	MO
16288	Marshall	NC
16289	Marshall	ND
16290	Marshall	OK
16291	Marshall	TX
16292	Marshall	VA
16293	Marshall	WA
16294	Marshall	WI
16295	Marshallberg	NC
16296	Marshalls Creek	PA
16297	Marshalltown	IA
16298	Marshallville	GA
16299	Marshallville	OH
16300	Marshes Siding	KY
16301	Marshfield	MA
16302	Marshfield	MO
16303	Marshfield	VT
16304	Marshfield	WI
16305	Marshfield Hills	MA
16306	Marshville	NC
16307	Marsing	ID
16308	Marsland	NE
16309	Marsteller	PA
16310	Marston	MO
16311	Marston	NC
16312	Marstons Mills	MA
16313	Mart	TX
16314	Martel	OH
16315	Martell	CA
16316	Martell	NE
16317	Martelle	IA
16318	Martensdale	IA
16319	Martha	KY
16320	Martha	OK
16321	Marthasville	MO
16322	Marthaville	LA
16323	Martin	GA
16324	Martin	KY
16325	Martin	MI
16326	Martin	ND
16327	Martin	OH
16328	Martin	PA
16329	Martin	SC
16330	Martin	SD
16331	Martin	TN
16332	Martin City	MT
16333	Martindale	PA
16334	Martindale	TX
16335	Martinez	CA
16336	Martins Creek	PA
16337	Martins Ferry	OH
16338	Martinsburg	IA
16339	Martinsburg	MO
16340	Martinsburg	NY
16341	Martinsburg	OH
16342	Martinsburg	PA
16343	Martinsburg	WV
16344	Martinsdale	MT
16345	Martinsville	IL
16346	Martinsville	IN
16347	Martinsville	MO
16348	Martinsville	NJ
16349	Martinsville	OH
16350	Martinsville	TX
16351	Martinsville	VA
16352	Martinton	IL
16353	Martville	NY
16354	Marty	SD
16355	Marvel	CO
16356	Marvell	AR
16357	Marvin	SD
16358	Mary Alice	KY
16359	Mary D	PA
16360	Mary Esther	FL
16361	Marydel	DE
16362	Marydel	MD
16363	Maryknoll	NY
16364	Maryland	NY
16365	Maryland Heights	MO
16366	Maryland Line	MD
16367	Marylhurst	OR
16368	Maryneal	TX
16369	Marysvale	UT
16370	Marysville	CA
16371	Marysville	IN
16372	Marysville	KS
16373	Marysville	MI
16374	Marysville	MT
16375	Marysville	OH
16376	Marysville	PA
16377	Marysville	WA
16378	Maryus	VA
16379	Maryville	IL
16380	Maryville	MO
16381	Maryville	TN
16382	Mascot	TN
16383	Mascot	VA
16384	Mascotte	FL
16385	Mascoutah	IL
16386	Mashantucket	CT
16387	Mashpee	MA
16388	Maskell	NE
16389	Mason	IL
16390	Mason	KY
16391	Mason	MI
16392	Mason	OH
16393	Mason	TN
16394	Mason	TX
16395	Mason	WI
16396	Mason	WV
16397	Mason City	IA
16398	Mason City	IL
16399	Mason City	NE
16400	Masonic Home	KY
16401	Masontown	PA
16402	Masontown	WV
16403	Masonville	CO
16404	Masonville	IA
16405	Masonville	NY
16406	Maspeth	NY
16407	Mass City	MI
16408	Massapequa	NY
16409	Massapequa Park	NY
16410	Massena	IA
16411	Massena	NY
16412	Massey	MD
16413	Massillon	OH
16414	Masterson	TX
16415	Mastic	NY
16416	Mastic Beach	NY
16417	Masury	OH
16418	Matador	TX
16419	Matagorda	TX
16420	Matamoras	PA
16421	Matawan	NJ
16422	Matewan	WV
16423	Matfield Green	KS
16424	Matheny	WV
16425	Mather	CA
16426	Mather	PA
16427	Mather	WI
16428	Matherville	IL
16429	Matheson	CO
16430	Mathews	AL
16431	Mathews	LA
16432	Mathews	VA
16433	Mathias	WV
16434	Mathis	TX
16435	Mathiston	MS
16436	Matinicus	ME
16437	Matlock	IA
16438	Matlock	WA
16439	Matoaka	WV
16440	Mattapan	MA
16441	Mattapoisett	MA
16442	Mattaponi	VA
16443	Mattawa	WA
16444	Mattawamkeag	ME
16445	Mattawan	MI
16446	Mattawana	PA
16447	Matteson	IL
16448	Matthews	GA
16449	Matthews	IN
16450	Matthews	MO
16451	Matthews	NC
16452	Mattituck	NY
16453	Mattoon	IL
16454	Mattoon	WI
16455	Mauckport	IN
16456	Maud	OK
16457	Maud	TX
16458	Maugansville	MD
16459	Mauk	GA
16460	Mauldin	SC
16461	Maumee	OH
16462	Maumelle	AR
16463	Maunaloa	HI
16464	Maunie	IL
16465	Maupin	OR
16466	Maurepas	LA
16467	Maurertown	VA
16468	Maurice	IA
16469	Maurice	LA
16470	Mauricetown	NJ
16471	Mauriceville	TX
16472	Maury	NC
16473	Maury City	TN
16474	Mauston	WI
16475	Mavisdale	VA
16476	Max	MN
16477	Max	ND
16478	Max	NE
16479	Max Meadows	VA
16480	Maxatawny	PA
16481	Maxbass	ND
16482	Maxeys	GA
16483	Maxie	VA
16484	Maximo	OH
16485	Maxton	NC
16486	Maxwell	CA
16487	Maxwell	IA
16488	Maxwell	IN
16489	Maxwell	NE
16490	Maxwell	NM
16491	Maxwell	TX
16492	Maxwelton	WV
16493	May	ID
16494	May	OK
16495	May	TX
16496	Maybee	MI
16497	Maybell	CO
16498	Maybeury	WV
16499	Maybrook	NY
16500	Maydelle	TX
16501	Mayer	AZ
16502	Mayer	MN
16503	Mayersville	MS
16504	Mayesville	SC
16505	Mayetta	KS
16506	Mayfield	KS
16507	Mayfield	KY
16508	Mayfield	MI
16509	Mayfield	NY
16510	Mayfield	UT
16511	Mayflower	AR
16512	Mayhew	MS
16513	Mayhill	NM
16514	Mayking	KY
16515	Maylene	AL
16516	Maynard	AR
16517	Maynard	IA
16518	Maynard	MA
16519	Maynard	MN
16520	Maynard	OH
16521	Maynardville	TN
16522	Mayo	FL
16523	Mayo	MD
16524	Mayo	SC
16525	Mayodan	NC
16526	Maypearl	TX
16527	Mayport	PA
16528	Mays	IN
16529	Mays Landing	NJ
16530	Maysel	WV
16531	Mayslick	KY
16532	Maysville	AR
16533	Maysville	GA
16534	Maysville	KY
16535	Maysville	MO
16536	Maysville	NC
16537	Maysville	OK
16538	Maysville	WV
16539	Maytown	PA
16540	Mayview	MO
16541	Mayville	MI
16542	Mayville	ND
16543	Mayville	NY
16544	Mayville	WI
16545	Maywood	CA
16546	Maywood	IL
16547	Maywood	MO
16548	Maywood	NE
16549	Maywood	NJ
16550	Mazama	WA
16551	Mazeppa	MN
16552	Mazie	KY
16553	Mazomanie	WI
16554	Mazon	IL
16555	Mc Adams	MS
16556	Mc Adenville	NC
16557	Mc Afee	NJ
16558	Mc Alister	NM
16559	Mc Alisterville	PA
16560	Mc Allister	MT
16561	Mc Alpin	FL
16562	Mc Andrews	KY
16563	Mc Arthur	OH
16564	Mc Bain	MI
16565	Mc Bee	SC
16566	Mc Bride	MO
16567	Mc Call Creek	MS
16568	Mc Calla	AL
16569	Mc Callsburg	IA
16570	Mc Camey	TX
16571	Mc Carley	MS
16572	Mc Carr	KY
16573	Mc Caskill	AR
16574	Mc Caulley	TX
16575	Mc Causland	IA
16576	Mc Caysville	GA
16577	Mc Clave	CO
16578	Mc Clelland	IA
16579	Mc Clellandtown	PA
16580	Mc Clellanville	SC
16581	Mc Clure	IL
16582	Mc Clure	OH
16583	Mc Clure	PA
16584	Mc Clure	VA
16585	Mc Clurg	MO
16586	Mc Coll	SC
16587	Mc Comb	OH
16588	Mc Connell	IL
16589	Mc Connells	SC
16590	Mc Connellsburg	PA
16591	Mc Connellstown	PA
16592	Mc Connellsville	NY
16593	Mc Cook	NE
16594	Mc Cool	MS
16595	Mc Cool Junction	NE
16596	Mc Cordsville	IN
16597	Mc Cormick	SC
16598	Mc Coy	CO
16599	Mc Coy	VA
16600	Mc Cracken	KS
16601	Mc Crory	AR
16602	Mc Cune	KS
16603	Mc Cutchenville	OH
16604	Mc Dade	TX
16605	Mc Daniels	KY
16606	Mc David	FL
16607	Mc Dermitt	NV
16608	Mc Dermott	OH
16609	Mc Donald	KS
16610	Mc Donald	NM
16611	Mc Donald	OH
16612	Mc Donald	PA
16613	Mc Donald	TN
16614	Mc Donough	NY
16615	Mc Dougal	AR
16616	Mc Dowell	KY
16617	Mc Dowell	VA
16618	Mc Elhattan	PA
16619	Mc Ewen	TN
16620	Mc Ewensville	PA
16621	Mc Fall	MO
16622	Mc Farlan	NC
16623	Mc Farland	CA
16624	Mc Farland	KS
16625	Mc Farland	WI
16626	Mc Gaheysville	VA
16627	Mc Gee	MO
16628	Mc Gehee	AR
16629	Mc Gill	NV
16630	Mc Girk	MO
16631	Mc Grady	NC
16632	Mc Grann	PA
16633	Mc Grath	AK
16634	Mc Grath	MN
16635	Mc Graw	NY
16636	Mc Graws	WV
16637	Mc Gregor	IA
16638	Mc Gregor	TX
16639	Mc Guffey	OH
16640	Mc Henry	KY
16641	Mc Henry	MD
16642	Mc Henry	MS
16643	Mc Indoe Falls	VT
16644	Mc Intire	IA
16645	Mc Intosh	AL
16646	Mc Intosh	FL
16647	Mc Intosh	NM
16648	Mc Intosh	SD
16649	Mc Intyre	GA
16650	Mc Intyre	PA
16651	Mc Kean	PA
16652	Mc Kee	KY
16653	Mc Kees Rocks	PA
16654	Mc Kenney	VA
16655	Mc Kenzie	AL
16656	Mc Kenzie	TN
16657	Mc Kinney	KY
16658	Mc Kinnon	WY
16659	Mc Kittrick	CA
16660	Mc Knightstown	PA
16661	Mc Lain	MS
16662	Mc Laughlin	SD
16663	Mc Lean	IL
16664	Mc Lean	NY
16665	Mc Lean	VA
16666	Mc Leansboro	IL
16667	Mc Leansville	NC
16668	Mc Lemoresville	TN
16669	Mc Leod	MT
16670	Mc Leod	TX
16671	Mc Louth	KS
16672	Mc Millan	MI
16673	Mc Minnville	TN
16674	Mc Nabb	IL
16675	Mc Naughton	WI
16676	Mc Neal	AZ
16677	Mc Neil	AR
16678	Mc Neil	TX
16679	Mc Neill	MS
16680	Mc Quady	KY
16681	Mc Queeney	TX
16682	Mc Rae	AR
16683	Mc Rae	GA
16684	Mc Roberts	KY
16685	Mc Shan	AL
16686	Mc Sherrystown	PA
16687	Mc Veytown	PA
16688	Mc Williams	AL
16689	Mcadoo	PA
16690	Mcadoo	TX
16691	Mcalester	OK
16692	Mcallen	TX
16693	Mcarthur	CA
16694	Mcbrides	MI
16695	Mccall	ID
16696	Mccammon	ID
16697	Mcchord Afb	WA
16698	Mccleary	WA
16699	Mcclellan	CA
16700	Mccloud	CA
16701	Mcclusky	ND
16702	Mccomb	MS
16703	Mcconnell Afb	KS
16704	Mcconnelsville	OH
16705	Mccurtain	OK
16706	Mccutcheon Field	NC
16707	Mcdaniel	MD
16708	Mcdonough	GA
16709	Mcfaddin	TX
16710	Mcgees Mills	PA
16711	Mcgregor	MN
16712	Mcgregor	ND
16713	Mcgrew	NE
16714	Mchenry	IL
16715	Mchenry	ND
16716	Mcintosh	MN
16717	Mckeesport	PA
16718	Mckenna	WA
16719	Mckinleyville	CA
16720	Mckinney	TX
16721	Mclean	NE
16722	Mclean	TX
16723	Mcleod	ND
16724	Mcloud	OK
16725	Mcmechen	WV
16726	Mcminnville	OR
16727	Mcnary	AZ
16728	Mcpherson	KS
16729	Mcville	ND
16730	Meacham	OR
16731	Mead	CO
16732	Mead	NE
16733	Mead	OK
16734	Mead	WA
16735	Meade	KS
16736	Meadow	SD
16737	Meadow	TX
16738	Meadow	UT
16739	Meadow Bridge	WV
16740	Meadow Creek	WV
16741	Meadow Grove	NE
16742	Meadow Lands	PA
16743	Meadow Valley	CA
16744	Meadow Vista	CA
16745	Meadowbrook	WV
16746	Meadowlands	MN
16747	Meadows Of Dan	VA
16748	Meadowview	VA
16749	Meadview	AZ
16750	Meadville	MO
16751	Meadville	MS
16752	Meadville	PA
16753	Meally	KY
16754	Means	KY
16755	Meansville	GA
16756	Mears	MI
16757	Mears	VA
16758	Mebane	NC
16759	Mecca	CA
16760	Mecca	IN
16761	Mechanic Falls	ME
16762	Mechanicsburg	IL
16763	Mechanicsburg	OH
16764	Mechanicsburg	PA
16765	Mechanicstown	OH
16766	Mechanicsville	IA
16767	Mechanicsville	MD
16768	Mechanicsville	PA
16769	Mechanicsville	VA
16770	Mechanicville	NY
16771	Mecklenburg	NY
16772	Mecosta	MI
16773	Medanales	NM
16774	Medaryville	IN
16775	Meddybemps	ME
16776	Medfield	MA
16777	Medford	MA
16778	Medford	MN
16779	Medford	NJ
16780	Medford	NY
16781	Medford	OK
16782	Medford	OR
16783	Medford	WI
16784	Media	IL
16785	Media	PA
16786	Mediapolis	IA
16787	Medical Lake	WA
16788	Medicine Bow	WY
16789	Medicine Lake	MT
16790	Medicine Lodge	KS
16791	Medicine Park	OK
16792	Medimont	ID
16793	Medina	ND
16794	Medina	NY
16795	Medina	OH
16796	Medina	TN
16797	Medina	TX
16798	Medina	WA
16799	Medinah	IL
16800	Medon	TN
16801	Medora	IL
16802	Medora	IN
16803	Medora	ND
16804	Medusa	NY
16805	Medway	MA
16806	Medway	ME
16807	Medway	OH
16808	Meeker	CO
16809	Meeker	OK
16810	Meers	OK
16811	Meeteetse	WY
16812	Megargel	AL
16813	Megargel	TX
16814	Mehama	OR
16815	Meherrin	VA
16816	Mehoopany	PA
16817	Meigs	GA
16818	Mekinock	ND
16819	Mekoryuk	AK
16820	Melba	ID
16821	Melber	KY
16822	Melbeta	NE
16823	Melbourne	AR
16824	Melbourne	FL
16825	Melbourne	IA
16826	Melbourne	KY
16827	Melbourne Beach	FL
16828	Melcher	IA
16829	Melcroft	PA
16830	Meldrim	GA
16831	Melfa	VA
16832	Melissa	TX
16833	Mellen	WI
16834	Mellenville	NY
16835	Mellette	SD
16836	Mellott	IN
16837	Mellwood	AR
16838	Melmore	OH
16839	Melrose	FL
16840	Melrose	IA
16841	Melrose	LA
16842	Melrose	MA
16843	Melrose	MN
16844	Melrose	MT
16845	Melrose	NM
16846	Melrose	NY
16847	Melrose	OH
16848	Melrose	WI
16849	Melrose Park	IL
16850	Melrude	MN
16851	Melstone	MT
16852	Melvern	KS
16853	Melville	LA
16854	Melville	MT
16855	Melville	NY
16856	Melvin	AL
16857	Melvin	IA
16858	Melvin	IL
16859	Melvin	KY
16860	Melvin	MI
16861	Melvin	TX
16862	Melvin Village	NH
16863	Melvindale	MI
16864	Memphis	IN
16865	Memphis	MI
16866	Memphis	MO
16867	Memphis	NE
16868	Memphis	NY
16869	Memphis	TN
16870	Memphis	TX
16871	Mena	AR
16872	Menahga	MN
16873	Menan	ID
16874	Menard	IL
16875	Menard	TX
16876	Menasha	WI
16877	Mendenhall	MS
16878	Mendenhall	PA
16879	Mendham	NJ
16880	Mendocino	CA
16881	Mendon	IL
16882	Mendon	MA
16883	Mendon	MI
16884	Mendon	MO
16885	Mendon	NY
16886	Mendon	OH
16887	Mendon	UT
16888	Mendota	CA
16889	Mendota	IL
16890	Mendota	MN
16891	Mendota	VA
16892	Menemsha	MA
16893	Menifee	AR
16894	Menifee	CA
16895	Menlo	GA
16896	Menlo	IA
16897	Menlo	WA
16898	Menlo Park	CA
16899	Menno	SD
16900	Meno	OK
16901	Menoken	ND
16902	Menominee	MI
16903	Menomonee Falls	WI
16904	Menomonie	WI
16905	Mentcle	PA
16906	Mentmore	NM
16907	Mentone	AL
16908	Mentone	CA
16909	Mentone	IN
16910	Mentone	TX
16911	Mentor	MN
16912	Mentor	OH
16913	Mequon	WI
16914	Mer Rouge	LA
16915	Meraux	LA
16916	Merced	CA
16917	Mercedes	TX
16918	Mercer	MO
16919	Mercer	ND
16920	Mercer	PA
16921	Mercer	TN
16922	Mercer	WI
16923	Mercer Island	WA
16924	Mercersburg	PA
16925	Merchantville	NJ
16926	Mercury	NV
16927	Meredith	CO
16928	Meredith	NH
16929	Meredithville	VA
16930	Meredosia	IL
16931	Mereta	TX
16932	Meridale	NY
16933	Meriden	CT
16934	Meriden	IA
16935	Meriden	KS
16936	Meriden	NH
16937	Meriden	WY
16938	Meridian	CA
16939	Meridian	GA
16940	Meridian	ID
16941	Meridian	MS
16942	Meridian	NY
16943	Meridian	OK
16944	Meridian	TX
16945	Meridianville	AL
16946	Merigold	MS
16947	Merino	CO
16948	Merion Station	PA
16949	Merit	TX
16950	Merkel	TX
16951	Merlin	OR
16952	Mermentau	LA
16953	Merna	IL
16954	Merna	NE
16955	Merom	IN
16956	Merrick	NY
16957	Merrifield	MN
16958	Merrifield	VA
16959	Merrill	IA
16960	Merrill	MI
16961	Merrill	OR
16962	Merrill	WI
16963	Merrillan	WI
16964	Merrillville	IN
16965	Merrimac	MA
16966	Merrimac	WI
16967	Merrimack	NH
16968	Merriman	NE
16969	Merritt	MI
16970	Merritt	NC
16971	Merritt Island	FL
16972	Merrittstown	PA
16973	Merry Hill	NC
16974	Merry Point	VA
16975	Merryville	LA
16976	Mershon	GA
16977	Mertens	TX
16978	Merton	WI
16979	Mertzon	TX
16980	Mertztown	PA
16981	Mesa	AZ
16982	Mesa	CO
16983	Mesa	ID
16984	Mesa	WA
16985	Mesa Verde National Park	CO
16986	Mescalero	NM
16987	Mesena	GA
16988	Meservey	IA
16989	Meshoppen	PA
16990	Mesick	MI
16991	Mesilla	NM
16992	Mesilla Park	NM
16993	Mesopotamia	OH
16994	Mesquite	NM
16995	Mesquite	NV
16996	Mesquite	TX
16997	Meta	MO
16998	Metairie	LA
16999	Metaline	WA
17000	Metaline Falls	WA
17001	Metamora	IL
17002	Metamora	IN
17003	Metamora	MI
17004	Metamora	OH
17005	Metcalf	IL
17006	Metcalfe	MS
17007	Methow	WA
17008	Methuen	MA
17009	Metlakatla	AK
17010	Metropolis	IL
17011	Metter	GA
17012	Metuchen	NJ
17013	Metz	MO
17014	Metz	WV
17015	Mexia	AL
17016	Mexia	TX
17017	Mexican Hat	UT
17018	Mexican Springs	NM
17019	Mexico	IN
17020	Mexico	ME
17021	Mexico	MO
17022	Mexico	NY
17023	Mexico	PA
17024	Mexico Beach	FL
17025	Meyers Chuck	AK
17026	Meyersdale	PA
17027	Meyersville	TX
17028	Mi Wuk Village	CA
17029	Miami	AZ
17030	Miami	FL
17031	Miami	IN
17032	Miami	MO
17033	Miami	NM
17034	Miami	OK
17035	Miami	TX
17036	Miami	WV
17037	Miami Beach	FL
17038	Miamisburg	OH
17039	Miamitown	OH
17040	Miamiville	OH
17041	Mica	WA
17042	Micanopy	FL
17043	Micaville	NC
17044	Michael	IL
17045	Michie	TN
17046	Michigamme	MI
17047	Michigan	ND
17048	Michigan Center	MI
17049	Michigan City	IN
17050	Michigan City	MS
17051	Michigantown	IN
17052	Mickleton	NJ
17053	Mico	TX
17054	Micro	NC
17055	Mid Florida	FL
17056	Middle Amana	IA
17057	Middle Bass	OH
17058	Middle Brook	MO
17059	Middle Falls	NY
17060	Middle Granville	NY
17061	Middle Grove	NY
17062	Middle Haddam	CT
17063	Middle Island	NY
17064	Middle Point	OH
17065	Middle River	MD
17066	Middle River	MN
17067	Middle Village	NY
17068	Middleboro	MA
17069	Middlebourne	WV
17070	Middlebranch	OH
17071	Middlebrook	VA
17072	Middleburg	FL
17073	Middleburg	KY
17074	Middleburg	NC
17075	Middleburg	OH
17076	Middleburg	PA
17077	Middleburg	VA
17078	Middleburgh	NY
17079	Middlebury	CT
17080	Middlebury	IN
17081	Middlebury	VT
17082	Middlebury Center	PA
17083	Middlefield	CT
17084	Middlefield	MA
17085	Middlefield	OH
17086	Middleport	NY
17087	Middleport	OH
17088	Middleport	PA
17089	Middlesboro	KY
17090	Middlesex	NC
17091	Middlesex	NJ
17092	Middlesex	NY
17093	Middleton	ID
17094	Middleton	MA
17095	Middleton	MI
17096	Middleton	TN
17097	Middleton	WI
17098	Middletown	CA
17099	Middletown	CT
17100	Middletown	DE
17101	Middletown	IA
17102	Middletown	IL
17103	Middletown	IN
17104	Middletown	MD
17105	Middletown	MO
17106	Middletown	NJ
17107	Middletown	NY
17108	Middletown	OH
17109	Middletown	PA
17110	Middletown	RI
17111	Middletown	VA
17112	Middletown Springs	VT
17113	Middleville	MI
17114	Middleville	NJ
17115	Middleville	NY
17116	Midfield	TX
17117	Midkiff	TX
17118	Midkiff	WV
17119	Midland	AR
17120	Midland	GA
17121	Midland	IN
17122	Midland	MD
17123	Midland	MI
17124	Midland	NC
17125	Midland	OH
17126	Midland	OR
17127	Midland	PA
17128	Midland	SD
17129	Midland	TX
17130	Midland	VA
17131	Midland City	AL
17132	Midland Park	NJ
17133	Midlothian	IL
17134	Midlothian	MD
17135	Midlothian	TX
17136	Midlothian	VA
17137	Midnight	MS
17138	Midpines	CA
17139	Midvale	ID
17140	Midvale	OH
17141	Midvale	UT
17142	Midville	GA
17143	Midway	AL
17144	Midway	AR
17145	Midway	FL
17146	Midway	GA
17147	Midway	KY
17148	Midway	PA
17149	Midway	TN
17150	Midway	TX
17151	Midway	UT
17152	Midway	WV
17153	Midway City	CA
17154	Midway Park	NC
17155	Midwest	WY
17156	Mifflin	PA
17157	Mifflinburg	PA
17158	Mifflintown	PA
17159	Mifflinville	PA
17160	Mikado	MI
17161	Mikana	WI
17162	Mikkalo	OR
17163	Milaca	MN
17164	Milam	TX
17165	Milam	WV
17166	Milan	GA
17167	Milan	IL
17168	Milan	IN
17169	Milan	KS
17170	Milan	MI
17171	Milan	MN
17172	Milan	MO
17173	Milan	NH
17174	Milan	NM
17175	Milan	OH
17176	Milan	PA
17177	Milan	TN
17178	Milano	TX
17179	Milanville	PA
17180	Milbank	SD
17181	Milbridge	ME
17182	Milburn	KY
17183	Milburn	OK
17184	Mildred	MT
17185	Mildred	PA
17186	Miles	IA
17187	Miles	TX
17188	Miles City	MT
17189	Milesburg	PA
17190	Milesville	SD
17191	Miley	SC
17192	Milfay	OK
17193	Milford	CA
17194	Milford	CT
17195	Milford	DE
17196	Milford	IA
17197	Milford	IL
17198	Milford	IN
17199	Milford	KS
17200	Milford	KY
17201	Milford	MA
17202	Milford	ME
17203	Milford	MI
17204	Milford	MO
17205	Milford	NE
17206	Milford	NH
17207	Milford	NJ
17208	Milford	NY
17209	Milford	OH
17210	Milford	PA
17211	Milford	TX
17212	Milford	UT
17213	Milford	VA
17214	Milford Center	OH
17215	Milford Square	PA
17216	Mililani	HI
17217	Mill City	OR
17218	Mill Creek	CA
17219	Mill Creek	IN
17220	Mill Creek	OK
17221	Mill Creek	PA
17222	Mill Creek	WA
17223	Mill Creek	WV
17224	Mill Hall	PA
17225	Mill Neck	NY
17226	Mill River	MA
17227	Mill Run	PA
17228	Mill Shoals	IL
17229	Mill Spring	MO
17230	Mill Spring	NC
17231	Mill Valley	CA
17232	Mill Village	PA
17233	Milladore	WI
17234	Millboro	VA
17235	Millbrae	CA
17236	Millbrook	AL
17237	Millbrook	IL
17238	Millbrook	NY
17239	Millburn	NJ
17240	Millbury	MA
17241	Millbury	OH
17242	Millcreek	IL
17243	Milldale	CT
17244	Milledgeville	GA
17245	Milledgeville	IL
17246	Milledgeville	OH
17247	Milledgeville	TN
17248	Millen	GA
17249	Miller	MO
17250	Miller	NE
17251	Miller	SD
17252	Miller City	IL
17253	Miller City	OH
17254	Miller Place	NY
17255	Millers Creek	NC
17256	Millers Falls	MA
17257	Millers Tavern	VA
17258	Millersburg	IA
17259	Millersburg	IN
17260	Millersburg	KY
17261	Millersburg	MI
17262	Millersburg	OH
17263	Millersburg	PA
17264	Millersport	OH
17265	Millerstown	PA
17266	Millersview	TX
17267	Millersville	MD
17268	Millersville	MO
17269	Millersville	PA
17270	Millerton	IA
17271	Millerton	NY
17272	Millerton	OK
17273	Millerton	PA
17274	Millerville	AL
17275	Millfield	OH
17276	Millheim	PA
17277	Millhousen	IN
17278	Millican	TX
17279	Milligan	FL
17280	Milligan	NE
17281	Milligan College	TN
17282	Milliken	CO
17283	Millington	IL
17284	Millington	MD
17285	Millington	MI
17286	Millington	NJ
17287	Millington	TN
17288	Millinocket	ME
17289	Millis	MA
17290	Millmont	PA
17291	Millport	AL
17292	Millport	NY
17293	Millrift	PA
17294	Millry	AL
17295	Mills	NE
17296	Mills	NM
17297	Mills	PA
17298	Mills	WY
17299	Mills River	NC
17300	Millsap	TX
17301	Millsboro	DE
17302	Millsboro	PA
17303	Millstadt	IL
17304	Millston	WI
17305	Millstone	KY
17306	Millstone	WV
17307	Millstone Township	NJ
17308	Milltown	IN
17309	Milltown	MT
17310	Milltown	NJ
17311	Milltown	WI
17312	Millville	CA
17313	Millville	DE
17314	Millville	MA
17315	Millville	MN
17316	Millville	NJ
17317	Millville	PA
17318	Millville	UT
17319	Millville	WV
17320	Millwood	GA
17321	Millwood	KY
17322	Millwood	NY
17323	Millwood	VA
17324	Millwood	WV
17325	Milmay	NJ
17326	Milmine	IL
17327	Milner	GA
17328	Milnesand	NM
17329	Milnesville	PA
17330	Milnor	ND
17331	Milo	IA
17332	Milo	ME
17333	Milo	MO
17334	Milpitas	CA
17335	Milroy	IN
17336	Milroy	MN
17337	Milroy	PA
17338	Milton	DE
17339	Milton	FL
17340	Milton	IA
17341	Milton	IL
17342	Milton	IN
17343	Milton	KS
17344	Milton	KY
17345	Milton	LA
17346	Milton	MA
17347	Milton	NC
17348	Milton	ND
17349	Milton	NH
17350	Milton	NY
17351	Milton	PA
17352	Milton	TN
17353	Milton	VT
17354	Milton	WA
17355	Milton	WI
17356	Milton	WV
17357	Milton Center	OH
17358	Milton Freewater	OR
17359	Milton Mills	NH
17360	Milton Village	MA
17361	Miltona	MN
17362	Miltonvale	KS
17363	Milwaukee	NC
17364	Milwaukee	WI
17365	Mimbres	NM
17366	Mims	FL
17367	Mina	NV
17368	Minatare	NE
17369	Minburn	IA
17370	Minco	OK
17371	Minden	IA
17372	Minden	LA
17373	Minden	NE
17374	Minden	NV
17375	Minden	TX
17376	Minden	WV
17377	Minden City	MI
17378	Mindenmines	MO
17379	Mindoro	WI
17380	Mine Hill	NJ
17381	Mineola	IA
17382	Mineola	NY
17383	Mineola	TX
17384	Mineral	CA
17385	Mineral	IL
17386	Mineral	TX
17387	Mineral	VA
17388	Mineral	WA
17389	Mineral Bluff	GA
17390	Mineral City	OH
17391	Mineral Point	MO
17392	Mineral Point	PA
17393	Mineral Point	WI
17394	Mineral Ridge	OH
17395	Mineral Springs	AR
17396	Mineral Springs	NC
17397	Mineral Springs	PA
17398	Mineral Wells	TX
17399	Mineral Wells	WV
17400	Minersville	PA
17401	Minersville	UT
17402	Minerva	KY
17403	Minerva	NY
17404	Minerva	OH
17405	Minetto	NY
17406	Mineville	NY
17407	Minford	OH
17408	Mingo	IA
17409	Mingo	OH
17410	Mingo Junction	OH
17411	Mingoville	PA
17412	Mingus	TX
17413	Minidoka	ID
17414	Minier	IL
17415	Minisink Hills	PA
17416	Minneapolis	KS
17417	Minneapolis	MN
17418	Minneapolis	NC
17419	Minneola	FL
17420	Minneola	KS
17421	Minneota	MN
17422	Minnesota City	MN
17423	Minnesota Lake	MN
17424	Minnetonka	MN
17425	Minnetonka Beach	MN
17426	Minnewaukan	ND
17427	Minnie	KY
17428	Minoa	NY
17429	Minocqua	WI
17430	Minong	WI
17431	Minonk	IL
17432	Minooka	IL
17433	Minor Hill	TN
17434	Minot	MA
17435	Minot	ME
17436	Minot	ND
17437	Minot Afb	ND
17438	Minotola	NJ
17439	Minster	OH
17440	Mint Spring	VA
17441	Minter	AL
17442	Minter City	MS
17443	Minto	AK
17444	Minto	ND
17445	Minturn	AR
17446	Minturn	CO
17447	Minturn	SC
17448	Mio	MI
17449	Mira Loma	CA
17450	Miracle	KY
17451	Miramar Beach	FL
17452	Miramonte	CA
17453	Miranda	CA
17454	Mirando City	TX
17455	Mirror Lake	NH
17456	Misenheimer	NC
17457	Mishawaka	IN
17458	Mishicot	WI
17459	Mission	KS
17460	Mission	SD
17461	Mission	TX
17462	Mission Hill	SD
17463	Mission Hills	CA
17464	Mission Viejo	CA
17465	Mississippi State	MS
17466	Missoula	MT
17467	Missouri City	MO
17468	Missouri City	TX
17469	Missouri Valley	IA
17470	Mistletoe	KY
17471	Mitchell	GA
17472	Mitchell	IN
17473	Mitchell	NE
17474	Mitchell	OR
17475	Mitchell	SD
17476	Mitchells	VA
17477	Mitchellsburg	KY
17478	Mitchellville	IA
17479	Mitchellville	TN
17480	Mittie	LA
17481	Mize	KY
17482	Mize	MS
17483	Mizpah	MN
17484	Mizpah	NJ
17485	Moab	UT
17486	Moapa	NV
17487	Moatsville	WV
17488	Mobeetie	TX
17489	Moberly	MO
17490	Mobile	AL
17491	Mobridge	SD
17492	Moccasin	CA
17493	Moccasin	MT
17494	Mocksville	NC
17495	Moclips	WA
17496	Modale	IA
17497	Mode	IL
17498	Model	CO
17499	Model City	NY
17500	Modena	NY
17501	Modena	PA
17502	Modena	UT
17503	Modest Town	VA
17504	Modesto	CA
17505	Modesto	IL
17506	Modoc	IL
17507	Modoc	IN
17508	Modoc	SC
17509	Moffat	CO
17510	Moffett	OK
17511	Moffit	ND
17512	Mogadore	OH
17513	Mohall	ND
17514	Mohave Valley	AZ
17515	Mohawk	MI
17516	Mohawk	NY
17517	Mohawk	TN
17518	Mohawk	WV
17519	Mohegan Lake	NY
17520	Mohler	WA
17521	Mohnton	PA
17522	Mohrsville	PA
17523	Moira	NY
17524	Mojave	CA
17525	Mokane	MO
17526	Mokelumne Hill	CA
17527	Mokena	IL
17528	Molalla	OR
17529	Molena	GA
17530	Molina	CO
17531	Moline	IL
17532	Moline	KS
17533	Moline	MI
17534	Molino	FL
17535	Mollusk	VA
17536	Molt	MT
17537	Momence	IL
17538	Mona	UT
17539	Monaca	PA
17540	Monahans	TX
17541	Monarch	CO
17542	Monarch	MT
17543	Moncks Corner	SC
17544	Monclova	OH
17545	Moncure	NC
17546	Mondamin	IA
17547	Mondovi	WI
17548	Monee	IL
17549	Monessen	PA
17550	Moneta	VA
17551	Monett	MO
17552	Monetta	SC
17553	Monette	AR
17554	Money	MS
17555	Mongaup Valley	NY
17556	Mongo	IN
17557	Monhegan	ME
17558	Monitor	WA
17559	Monkton	MD
17560	Monkton	VT
17561	Monmouth	IA
17562	Monmouth	IL
17563	Monmouth	ME
17564	Monmouth	OR
17565	Monmouth Beach	NJ
17566	Monmouth Junction	NJ
17567	Mono Hot Springs	CA
17568	Monocacy Station	PA
17569	Monon	IN
17570	Monona	IA
17571	Monongahela	PA
17572	Monponsett	MA
17573	Monroe	AR
17574	Monroe	CT
17575	Monroe	GA
17576	Monroe	IA
17577	Monroe	IN
17578	Monroe	LA
17579	Monroe	ME
17580	Monroe	MI
17581	Monroe	NC
17582	Monroe	NE
17583	Monroe	NH
17584	Monroe	NY
17585	Monroe	OH
17586	Monroe	OK
17587	Monroe	OR
17588	Monroe	SD
17589	Monroe	TN
17590	Monroe	UT
17591	Monroe	VA
17592	Monroe	WA
17593	Monroe	WI
17594	Monroe Bridge	MA
17595	Monroe Center	IL
17596	Monroe City	IN
17597	Monroe City	MO
17598	Monroe Township	NJ
17599	Monroeton	PA
17600	Monroeville	AL
17601	Monroeville	IN
17602	Monroeville	NJ
17603	Monroeville	OH
17604	Monroeville	PA
17605	Monrovia	CA
17606	Monrovia	IN
17607	Monrovia	MD
17608	Monsey	NY
17609	Monson	MA
17610	Monson	ME
17611	Mont Alto	PA
17612	Mont Belvieu	TX
17613	Mont Clare	PA
17614	Mont Vernon	NH
17615	Montague	CA
17616	Montague	MA
17617	Montague	MI
17618	Montague	NJ
17619	Montague	TX
17620	Montalba	TX
17621	Montana Mines	WV
17622	Montandon	PA
17623	Montara	CA
17624	Montauk	NY
17625	Montcalm	WV
17626	Montchanin	DE
17627	Montclair	CA
17628	Montclair	NJ
17629	Monte Rio	CA
17630	Monte Vista	CO
17631	Monteagle	TN
17632	Montebello	CA
17633	Montebello	VA
17634	Montegut	LA
17635	Montello	NV
17636	Montello	WI
17637	Monterey	CA
17638	Monterey	IN
17639	Monterey	LA
17640	Monterey	MA
17641	Monterey	TN
17642	Monterey	VA
17643	Monterey Park	CA
17644	Monterville	WV
17645	Montesano	WA
17646	Montevallo	AL
17647	Montevideo	MN
17648	Monteview	ID
17649	Montezuma	GA
17650	Montezuma	IA
17651	Montezuma	IN
17652	Montezuma	KS
17653	Montezuma	NC
17654	Montezuma	NM
17655	Montezuma	NY
17656	Montezuma	OH
17657	Montezuma Creek	UT
17658	Montfort	WI
17659	Montgomery	AL
17660	Montgomery	IL
17661	Montgomery	IN
17662	Montgomery	LA
17663	Montgomery	MI
17664	Montgomery	MN
17665	Montgomery	NY
17666	Montgomery	PA
17667	Montgomery	TX
17668	Montgomery	VT
17669	Montgomery	WV
17670	Montgomery Center	VT
17671	Montgomery City	MO
17672	Montgomery Creek	CA
17673	Montgomery Village	MD
17674	Montgomeryville	PA
17675	Monticello	AR
17676	Monticello	FL
17677	Monticello	GA
17678	Monticello	IA
17679	Monticello	IL
17680	Monticello	IN
17681	Monticello	KY
17682	Monticello	ME
17683	Monticello	MN
17684	Monticello	MO
17685	Monticello	MS
17686	Monticello	NM
17687	Monticello	NY
17688	Monticello	UT
17689	Monticello	WI
17690	Montier	MO
17691	Montmorenci	IN
17692	Montmorenci	SC
17693	Montour	IA
17694	Montour Falls	NY
17695	Montoursville	PA
17696	Montpelier	IA
17697	Montpelier	ID
17698	Montpelier	IN
17699	Montpelier	MS
17700	Montpelier	ND
17701	Montpelier	OH
17702	Montpelier	VA
17703	Montpelier	VT
17704	Montpelier Station	VA
17705	Montreal	MO
17706	Montreal	WI
17707	Montreat	NC
17708	Montrose	AL
17709	Montrose	AR
17710	Montrose	CA
17711	Montrose	CO
17712	Montrose	GA
17713	Montrose	IA
17714	Montrose	IL
17715	Montrose	MI
17716	Montrose	MN
17717	Montrose	MO
17718	Montrose	NY
17719	Montrose	PA
17720	Montrose	SD
17721	Montrose	WV
17722	Montross	VA
17723	Montvale	NJ
17724	Montvale	VA
17725	Montverde	FL
17726	Montville	CT
17727	Montville	NJ
17728	Montville	OH
17729	Monument	CO
17730	Monument	KS
17731	Monument	NM
17732	Monument	OR
17733	Monument Beach	MA
17734	Monument Valley	UT
17735	Moodus	CT
17736	Moody	AL
17737	Moody	ME
17738	Moody	MO
17739	Moody	TX
17740	Moody A F B	GA
17741	Moodys	OK
17742	Mooers	NY
17743	Mooers Forks	NY
17744	Moon	VA
17745	Moonachie	NJ
17746	Moorcroft	WY
17747	Moore	ID
17748	Moore	MT
17749	Moore	SC
17750	Moore	TX
17751	Moore Haven	FL
17752	Moorefield	KY
17753	Moorefield	NE
17754	Moorefield	WV
17755	Mooreland	IN
17756	Mooreland	OK
17757	Moores Hill	IN
17758	Mooresboro	NC
17759	Mooresburg	TN
17760	Moorestown	NJ
17761	Mooresville	AL
17762	Mooresville	IN
17763	Mooresville	MO
17764	Mooresville	NC
17765	Mooreton	ND
17766	Mooreville	MS
17767	Moorhead	IA
17768	Moorhead	MN
17769	Moorhead	MS
17770	Mooringsport	LA
17771	Moorland	IA
17772	Moorpark	CA
17773	Moose	WY
17774	Moose Lake	MN
17775	Moose Pass	AK
17776	Mooseheart	IL
17777	Moosic	PA
17778	Moosup	CT
17779	Mora	LA
17780	Mora	MN
17781	Mora	MO
17782	Mora	NM
17783	Moraga	CA
17784	Moran	KS
17785	Moran	MI
17786	Moran	TX
17787	Moran	WY
17788	Morann	PA
17789	Morattico	VA
17790	Moravia	IA
17791	Moravia	NY
17792	Moravian Falls	NC
17793	Moreauville	LA
17794	Morehead	KY
17795	Morehead City	NC
17796	Morehouse	MO
17797	Moreland	GA
17798	Moreland	ID
17799	Morenci	AZ
17800	Morenci	MI
17801	Moreno Valley	CA
17802	Moretown	VT
17803	Morgan	GA
17804	Morgan	MN
17805	Morgan	PA
17806	Morgan	TX
17807	Morgan	UT
17808	Morgan	VT
17809	Morgan City	LA
17810	Morgan City	MS
17811	Morgan Hill	CA
17812	Morgan Mill	TX
17813	Morganfield	KY
17814	Morganton	GA
17815	Morganton	NC
17816	Morgantown	IN
17817	Morgantown	KY
17818	Morgantown	PA
17819	Morgantown	WV
17820	Morganville	KS
17821	Morganville	NJ
17822	Morganza	LA
17823	Morganza	MD
17824	Moriah	NY
17825	Moriah Center	NY
17826	Moriarty	NM
17827	Moriches	NY
17828	Morland	KS
17829	Morley	IA
17830	Morley	MI
17831	Morley	MO
17832	Mormon Lake	AZ
17833	Morning Sun	IA
17834	Morning View	KY
17835	Moro	AR
17836	Moro	IL
17837	Moro	OR
17838	Morocco	IN
17839	Morongo Valley	CA
17840	Moroni	UT
17841	Morral	OH
17842	Morrice	MI
17843	Morrill	KS
17844	Morrill	ME
17845	Morrill	NE
17846	Morrilton	AR
17847	Morris	AL
17848	Morris	CT
17849	Morris	GA
17850	Morris	IL
17851	Morris	IN
17852	Morris	MN
17853	Morris	NY
17854	Morris	OK
17855	Morris	PA
17856	Morris Chapel	TN
17857	Morris Run	PA
17858	Morrisdale	PA
17859	Morrison	CO
17860	Morrison	IA
17861	Morrison	IL
17862	Morrison	MO
17863	Morrison	OK
17864	Morrison	TN
17865	Morrisonville	IL
17866	Morrisonville	NY
17867	Morrisonville	WI
17868	Morriston	FL
17869	Morristown	AZ
17870	Morristown	IN
17871	Morristown	MN
17872	Morristown	NJ
17873	Morristown	NY
17874	Morristown	OH
17875	Morristown	SD
17876	Morristown	TN
17877	Morrisville	MO
17878	Morrisville	NC
17879	Morrisville	NY
17880	Morrisville	PA
17881	Morrisville	VT
17882	Morro Bay	CA
17883	Morrow	AR
17884	Morrow	GA
17885	Morrow	LA
17886	Morrow	OH
17887	Morrowville	KS
17888	Morse	LA
17889	Morse	TX
17890	Morse Bluff	NE
17891	Morse Mill	MO
17892	Morton	IL
17893	Morton	MN
17894	Morton	MS
17895	Morton	NY
17896	Morton	PA
17897	Morton	TX
17898	Morton	WA
17899	Morton Grove	IL
17900	Mortons Gap	KY
17901	Morven	GA
17902	Morven	NC
17903	Morvin	AL
17904	Mosby	MO
17905	Mosby	MT
17906	Mosca	CO
17907	Moscow	AR
17908	Moscow	IA
17909	Moscow	ID
17910	Moscow	KS
17911	Moscow	MI
17912	Moscow	OH
17913	Moscow	PA
17914	Moscow	TN
17915	Moscow	TX
17916	Moscow	VT
17917	Moscow Mills	MO
17918	Moseley	VA
17919	Moselle	MS
17920	Moses Lake	WA
17921	Moshannon	PA
17922	Mosheim	TN
17923	Mosherville	MI
17924	Mosier	OR
17925	Mosinee	WI
17926	Mosquero	NM
17927	Moss	MS
17928	Moss	TN
17929	Moss Beach	CA
17930	Moss Landing	CA
17931	Moss Point	MS
17932	Mossville	IL
17933	Mossy Head	FL
17934	Mossyrock	WA
17935	Motley	MN
17936	Mott	ND
17937	Mottville	NY
17938	Moulton	AL
17939	Moulton	IA
17940	Moulton	TX
17941	Moultonborough	NH
17942	Moultrie	GA
17943	Mound	MN
17944	Mound	TX
17945	Mound Bayou	MS
17946	Mound City	IL
17947	Mound City	KS
17948	Mound City	MO
17949	Mound City	SD
17950	Mound Valley	KS
17951	Moundridge	KS
17952	Mounds	IL
17953	Mounds	OK
17954	Moundsville	WV
17955	Moundville	AL
17956	Moundville	MO
17957	Mount Aetna	PA
17958	Mount Airy	GA
17959	Mount Airy	LA
17960	Mount Airy	MD
17961	Mount Airy	NC
17962	Mount Alto	WV
17963	Mount Angel	OR
17964	Mount Arlington	NJ
17965	Mount Auburn	IA
17966	Mount Auburn	IL
17967	Mount Aukum	CA
17968	Mount Ayr	IA
17969	Mount Ayr	IN
17970	Mount Berry	GA
17971	Mount Bethel	PA
17972	Mount Blanchard	OH
17973	Mount Braddock	PA
17974	Mount Calm	TX
17975	Mount Calvary	WI
17976	Mount Carbon	WV
17977	Mount Carmel	IL
17978	Mount Carmel	PA
17979	Mount Carmel	SC
17980	Mount Carmel	TN
17981	Mount Carmel	UT
17982	Mount Carroll	IL
17983	Mount Clare	WV
17984	Mount Clemens	MI
17985	Mount Cory	OH
17986	Mount Crawford	VA
17987	Mount Croghan	SC
17988	Mount Desert	ME
17989	Mount Dora	FL
17990	Mount Eaton	OH
17991	Mount Eden	KY
17992	Mount Enterprise	TX
17993	Mount Ephraim	NJ
17994	Mount Erie	IL
17995	Mount Freedom	NJ
17996	Mount Gay	WV
17997	Mount Gilead	NC
17998	Mount Gilead	OH
17999	Mount Gretna	PA
18000	Mount Hamilton	CA
18001	Mount Hermon	CA
18002	Mount Hermon	KY
18003	Mount Hermon	LA
18004	Mount Holly	AR
18005	Mount Holly	NC
18006	Mount Holly	NJ
18007	Mount Holly	VA
18008	Mount Holly	VT
18009	Mount Holly Springs	PA
18010	Mount Hood Parkdale	OR
18011	Mount Hope	AL
18012	Mount Hope	KS
18013	Mount Hope	OH
18014	Mount Hope	WI
18015	Mount Hope	WV
18016	Mount Horeb	WI
18017	Mount Ida	AR
18018	Mount Jackson	VA
18019	Mount Jewett	PA
18020	Mount Joy	PA
18021	Mount Judea	AR
18022	Mount Juliet	TN
18023	Mount Kisco	NY
18024	Mount Laguna	CA
18025	Mount Laurel	NJ
18026	Mount Lemmon	AZ
18027	Mount Liberty	OH
18028	Mount Lookout	WV
18029	Mount Marion	NY
18030	Mount Meigs	AL
18031	Mount Morris	IL
18032	Mount Morris	MI
18033	Mount Morris	NY
18034	Mount Morris	PA
18035	Mount Mourne	NC
18036	Mount Nebo	WV
18037	Mount Olive	AL
18038	Mount Olive	IL
18039	Mount Olive	MS
18040	Mount Olive	NC
18041	Mount Olive	WV
18042	Mount Olivet	KY
18043	Mount Orab	OH
18044	Mount Perry	OH
18045	Mount Pleasant	AR
18046	Mount Pleasant	IA
18047	Mount Pleasant	MI
18048	Mount Pleasant	MS
18049	Mount Pleasant	NC
18050	Mount Pleasant	OH
18051	Mount Pleasant	PA
18052	Mount Pleasant	SC
18053	Mount Pleasant	TN
18054	Mount Pleasant	TX
18055	Mount Pleasant	UT
18056	Mount Pleasant Mills	PA
18057	Mount Pocono	PA
18058	Mount Prospect	IL
18059	Mount Pulaski	IL
18060	Mount Rainier	MD
18061	Mount Royal	NJ
18062	Mount Saint Francis	IN
18063	Mount Saint Joseph	OH
18064	Mount Savage	MD
18065	Mount Shasta	CA
18066	Mount Sherman	KY
18067	Mount Sidney	VA
18068	Mount Sinai	NY
18069	Mount Solon	VA
18070	Mount Sterling	IA
18071	Mount Sterling	IL
18072	Mount Sterling	KY
18073	Mount Sterling	MO
18074	Mount Sterling	OH
18075	Mount Sterling	WI
18076	Mount Storm	WV
18077	Mount Summit	IN
18078	Mount Tabor	NJ
18079	Mount Tremper	NY
18080	Mount Ulla	NC
18081	Mount Union	IA
18082	Mount Union	PA
18083	Mount Upton	NY
18084	Mount Vernon	AL
18085	Mount Vernon	AR
18086	Mount Vernon	GA
18087	Mount Vernon	IA
18088	Mount Vernon	IL
18089	Mount Vernon	IN
18090	Mount Vernon	KY
18091	Mount Vernon	ME
18092	Mount Vernon	MO
18093	Mount Vernon	NY
18094	Mount Vernon	OH
18095	Mount Vernon	OR
18096	Mount Vernon	SD
18097	Mount Vernon	TX
18098	Mount Vernon	VA
18099	Mount Vernon	WA
18100	Mount Victoria	MD
18101	Mount Victory	OH
18102	Mount Vision	NY
18103	Mount Washington	KY
18104	Mount Washington	NH
18105	Mount Wilson	CA
18106	Mount Wolf	PA
18107	Mount Zion	GA
18108	Mount Zion	WV
18109	Mountain	ND
18110	Mountain	WI
18111	Mountain Center	CA
18112	Mountain City	GA
18113	Mountain City	NV
18114	Mountain City	TN
18115	Mountain Dale	NY
18116	Mountain Grove	MO
18117	Mountain Home	AR
18118	Mountain Home	ID
18119	Mountain Home	NC
18120	Mountain Home	TN
18121	Mountain Home	TX
18122	Mountain Home	UT
18123	Mountain Home A F B	ID
18124	Mountain Iron	MN
18125	Mountain Lake	MN
18126	Mountain Lakes	NJ
18127	Mountain Park	OK
18128	Mountain Pass	CA
18129	Mountain Pine	AR
18130	Mountain Ranch	CA
18131	Mountain Rest	SC
18132	Mountain Top	PA
18133	Mountain View	AR
18134	Mountain View	CA
18135	Mountain View	HI
18136	Mountain View	MO
18137	Mountain View	OK
18138	Mountain View	WY
18139	Mountain Village	AK
18140	Mountainair	NM
18141	Mountainburg	AR
18142	Mountainhome	PA
18143	Mountainside	NJ
18144	Mountainville	NY
18145	Mountlake Terrace	WA
18146	Mountville	PA
18147	Mountville	SC
18148	Mousie	KY
18149	Mouth Of Wilson	VA
18150	Mouthcard	KY
18151	Moville	IA
18152	Moweaqua	IL
18153	Mowrystown	OH
18154	Moxahala	OH
18155	Moxee	WA
18156	Moyers	OK
18157	Moyie Springs	ID
18158	Moyock	NC
18159	Mozelle	KY
18160	Mozier	IL
18161	Mt Baldy	CA
18162	Mt Zion	IL
18163	Mud Butte	SD
18164	Muddy	IL
18165	Muenster	TX
18166	Muir	MI
18167	Muir	PA
18168	Mukilteo	WA
18169	Mukwonago	WI
18170	Mulberry	AR
18171	Mulberry	FL
18172	Mulberry	IN
18173	Mulberry	KS
18174	Mulberry	TN
18175	Mulberry Grove	IL
18176	Muldoon	TX
18177	Muldraugh	KY
18178	Muldrow	OK
18179	Mule Creek	NM
18180	Muleshoe	TX
18181	Mulga	AL
18182	Mulhall	OK
18183	Mulino	OR
18184	Mulkeytown	IL
18185	Mullan	ID
18186	Mullen	NE
18187	Mullens	WV
18188	Mullett Lake	MI
18189	Mullica Hill	NJ
18190	Mulliken	MI
18191	Mullin	TX
18192	Mullins	SC
18193	Mullinville	KS
18194	Mulvane	KS
18195	Mumford	NY
18196	Mumford	TX
18197	Muncie	IL
18198	Muncie	IN
18199	Muncy	PA
18200	Muncy Valley	PA
18201	Munday	TX
18202	Munday	WV
18203	Mundelein	IL
18204	Munden	KS
18205	Munds Park	AZ
18206	Munford	AL
18207	Munford	TN
18208	Munfordville	KY
18209	Munger	MI
18210	Munich	ND
18211	Munising	MI
18212	Munith	MI
18213	Munnsville	NY
18214	Munroe Falls	OH
18215	Munson	PA
18216	Munster	IN
18217	Murchison	TX
18218	Murdo	SD
18219	Murdock	FL
18220	Murdock	IL
18221	Murdock	KS
18222	Murdock	MN
18223	Murdock	NE
18224	Murfreesboro	AR
18225	Murfreesboro	NC
18226	Murfreesboro	TN
18227	Murphy	ID
18228	Murphy	NC
18229	Murphy	OR
18230	Murphys	CA
18231	Murphysboro	IL
18232	Murray	IA
18233	Murray	ID
18234	Murray	KY
18235	Murray	NE
18236	Murray City	OH
18237	Murrayville	GA
18238	Murrayville	IL
18239	Murrells Inlet	SC
18240	Murrieta	CA
18241	Murrysville	PA
18242	Murtaugh	ID
18243	Muscadine	AL
18244	Muscatine	IA
18245	Muscle Shoals	AL
18246	Muscoda	WI
18247	Muscotah	KS
18248	Muse	OK
18249	Muse	PA
18250	Musella	GA
18251	Muses Mills	KY
18252	Muskego	WI
18253	Muskegon	MI
18254	Muskogee	OK
18255	Musselshell	MT
18256	Mustang	OK
18257	Mustoe	VA
18258	Mutual	OK
18259	Myakka City	FL
18260	Myers Flat	CA
18261	Myerstown	PA
18262	Myersville	MD
18263	Mylo	ND
18264	Myra	KY
18265	Myra	TX
18266	Myra	WV
18267	Myrtle	MO
18268	Myrtle	MS
18269	Myrtle Beach	SC
18270	Myrtle Creek	OR
18271	Myrtle Point	OR
18272	Myrtlewood	AL
18273	Mystic	CT
18274	Mystic	GA
18275	Mystic	IA
18276	Myton	UT
18277	Naalehu	HI
18278	Nabb	IN
18279	Naches	WA
18280	Nachusa	IL
18281	Naco	AZ
18282	Nacogdoches	TX
18283	Nada	TX
18284	Nadeau	MI
18285	Nageezi	NM
18286	Nags Head	NC
18287	Nahant	MA
18288	Nahcotta	WA
18289	Nahma	MI
18290	Nahunta	GA
18291	Nakina	NC
18292	Naknek	AK
18293	Nalcrest	FL
18294	Nallen	WV
18295	Nampa	ID
18296	Nanafalia	AL
18297	Nancy	KY
18298	Nanjemoy	MD
18299	Nankin	OH
18300	Nanticoke	MD
18301	Nanticoke	PA
18302	Nantucket	MA
18303	Nanty Glo	PA
18304	Nanuet	NY
18305	Naoma	WV
18306	Napa	CA
18307	Napakiak	AK
18308	Napanoch	NY
18309	Napavine	WA
18310	Naper	NE
18311	Naperville	IL
18312	Nmeisterdish_serverer	WV
18313	Naples	FL
18314	Naples	ID
18315	Naples	ME
18316	Naples	NC
18317	Naples	NY
18318	Naples	TX
18319	Napoleon	IN
18320	Napoleon	MI
18321	Napoleon	MO
18322	Napoleon	ND
18323	Napoleon	OH
18324	Napoleonville	LA
18325	Naponee	NE
18326	Nappanee	IN
18327	Nara Visa	NM
18328	Narberth	PA
18329	Nardin	OK
18330	Narka	KS
18331	Narragansett	RI
18332	Narrows	VA
18333	Narrowsburg	NY
18334	Naruna	VA
18335	Narvon	PA
18336	Naselle	WA
18337	Nash	OK
18338	Nash	TX
18339	Nashoba	OK
18340	Nashotah	WI
18341	Nashport	OH
18342	Nashua	IA
18343	Nashua	MN
18344	Nashua	MT
18345	Nashua	NH
18346	Nashville	AR
18347	Nashville	GA
18348	Nashville	IL
18349	Nashville	IN
18350	Nashville	KS
18351	Nashville	MI
18352	Nashville	NC
18353	Nashville	OH
18354	Nashville	TN
18355	Nashwauk	MN
18356	Nason	IL
18357	Nassau	DE
18358	Nassau	NY
18359	Nassawadox	VA
18360	Natalbany	LA
18361	Natalia	TX
18362	Natchez	LA
18363	Natchez	MS
18364	Natchitoches	LA
18365	Nathalie	VA
18366	Nathrop	CO
18367	Natick	MA
18368	National City	CA
18369	National City	MI
18370	National Mine	MI
18371	National Park	NJ
18372	National Stock Yards	IL
18373	Natoma	KS
18374	Natrona	WY
18375	Natrona Heights	PA
18376	Natural Bridge	AL
18377	Natural Bridge	NY
18378	Natural Bridge	VA
18379	Natural Bridge Station	VA
18380	Natural Dam	AR
18381	Naturita	CO
18382	Naubinway	MI
18383	Naugatuck	CT
18384	Naugatuck	WV
18385	Nauvoo	AL
18386	Nauvoo	IL
18387	Navajo	NM
18388	Navajo Dam	NM
18389	Naval Air Station/ Jrb	TX
18390	Naval Anacost Annex	DC
18391	Navarre	FL
18392	Navarre	MN
18393	Navarre	OH
18394	Navarro	CA
18395	Navasota	TX
18396	Navesink	NJ
18397	Naylor	GA
18398	Naylor	MO
18399	Naytahwaush	MN
18400	Nazareth	KY
18401	Nazareth	MI
18402	Nazareth	PA
18403	Nazareth	TX
18404	Nazlini	AZ
18405	Neah Bay	WA
18406	Neal	KS
18407	Neapolis	OH
18408	Neavitt	MD
18409	Nebo	IL
18410	Nebo	KY
18411	Nebo	NC
18412	Nebo	WV
18413	Nebraska City	NE
18414	Necedah	WI
18415	Neche	ND
18416	Neches	TX
18417	Neck City	MO
18418	Nederland	CO
18419	Nederland	TX
18420	Nedrow	NY
18421	Needham	AL
18422	Needham	IN
18423	Needham	MA
18424	Needham Heights	MA
18425	Needles	CA
18426	Needmore	PA
18427	Needville	TX
18428	Neely	MS
18429	Neelyton	PA
18430	Neelyville	MO
18431	Neenah	WI
18432	Neeses	SC
18433	Neffs	OH
18434	Neffs	PA
18435	Negaunee	MI
18436	Negley	OH
18437	Negreet	LA
18438	Nehalem	OR
18439	Nehawka	NE
18440	Neihart	MT
18441	Neillsville	WI
18442	Neilton	WA
18443	Nekoma	KS
18444	Nekoma	ND
18445	Nekoosa	WI
18446	Neligh	NE
18447	Nellis	WV
18448	Nellis Afb	NV
18449	Nelliston	NY
18450	Nellysford	VA
18451	Nelson	CA
18452	Nelson	GA
18453	Nelson	MN
18454	Nelson	MO
18455	Nelson	NE
18456	Nelson	NH
18457	Nelson	PA
18458	Nelson	VA
18459	Nelson	WI
18460	Nelsonia	VA
18461	Nelsonville	OH
18462	Nelsonville	WI
18463	Nemacolin	PA
18464	Nemaha	IA
18465	Nemaha	NE
18466	Nemo	SD
18467	Nemo	TX
18468	Nemours	WV
18469	Nenana	AK
18470	Nenzel	NE
18471	Neodesha	KS
18472	Neoga	IL
18473	Neola	IA
18474	Neola	UT
18475	Neola	WV
18476	Neon	KY
18477	Neopit	WI
18478	Neosho	MO
18479	Neosho	WI
18480	Neosho Falls	KS
18481	Neosho Rmeisterdish_serverds	KS
18482	Neotsu	OR
18483	Nephi	UT
18484	Neponset	IL
18485	Neptune	NJ
18486	Neptune Beach	FL
18487	Nerinx	KY
18488	Nerstrand	MN
18489	Nesbit	MS
18490	Nesconset	NY
18491	Nescopeck	PA
18492	Neshanic Station	NJ
18493	Neshkoro	WI
18494	Neskowin	OR
18495	Nesmith	SC
18496	Nespelem	WA
18497	Nesquehoning	PA
18498	Ness City	KS
18499	Netarts	OR
18500	Netawaka	KS
18501	Netcong	NJ
18502	Nett Lake	MN
18503	Nettie	WV
18504	Nettleton	MS
18505	Nevada	IA
18506	Nevada	MO
18507	Nevada	OH
18508	Nevada	TX
18509	Nevada City	CA
18510	Neversink	NY
18511	Neville	OH
18512	Nevis	MN
18513	Nevisdale	KY
18514	New Albany	IN
18515	New Albany	KS
18516	New Albany	MS
18517	New Albany	OH
18518	New Albany	PA
18519	New Albin	IA
18520	New Alexandria	PA
18521	New Almaden	CA
18522	New Athens	IL
18523	New Athens	OH
18524	New Auburn	MN
18525	New Auburn	WI
18526	New Augusta	MS
18527	New Baden	IL
18528	New Baden	TX
18529	New Baltimore	MI
18530	New Baltimore	NY
18531	New Baltimore	PA
18532	New Bavaria	OH
18533	New Bedford	IL
18534	New Bedford	MA
18535	New Bedford	PA
18536	New Berlin	IL
18537	New Berlin	NY
18538	New Berlin	PA
18539	New Berlin	WI
18540	New Berlinville	PA
18541	New Bern	NC
18542	New Bethlehem	PA
18543	New Blaine	AR
18544	New Bloomfield	MO
18545	New Bloomfield	PA
18546	New Bloomington	OH
18547	New Boston	IL
18548	New Boston	MI
18549	New Boston	MO
18550	New Boston	NH
18551	New Boston	TX
18552	New Braintree	MA
18553	New Braunfels	TX
18554	New Bremen	OH
18555	New Brighton	PA
18556	New Britain	CT
18557	New Brockton	AL
18558	New Brunswick	NJ
18559	New Buffalo	MI
18560	New Buffalo	PA
18561	New Burnside	IL
18562	New Cambria	KS
18563	New Cambria	MO
18564	New Canaan	CT
18565	New Caney	TX
18566	New Canton	IL
18567	New Canton	VA
18568	New Carlisle	IN
18569	New Carlisle	OH
18570	New Castle	AL
18571	New Castle	CO
18572	New Castle	DE
18573	New Castle	IN
18574	New Castle	KY
18575	New Castle	NH
18576	New Castle	PA
18577	New Castle	VA
18578	New Century	KS
18579	New Church	VA
18580	New City	NY
18581	New Columbia	PA
18582	New Concord	KY
18583	New Concord	OH
18584	New Creek	WV
18585	New Cumberland	PA
18586	New Cumberland	WV
18587	New Cuyama	CA
18588	New Deal	TX
18589	New Derry	PA
18590	New Douglas	IL
18591	New Durham	NH
18592	New Eagle	PA
18593	New Edinburg	AR
18594	New Effington	SD
18595	New Egypt	NJ
18596	New Ellenton	SC
18597	New England	ND
18598	New Enterprise	PA
18599	New Era	MI
18600	New Fairfield	CT
18601	New Florence	MO
18602	New Florence	PA
18603	New Franken	WI
18604	New Franklin	MO
18605	New Freedom	PA
18606	New Freeport	PA
18607	New Galilee	PA
18608	New Geneva	PA
18609	New Germantown	PA
18610	New Germany	MN
18611	New Glarus	WI
18612	New Gloucester	ME
18613	New Goshen	IN
18614	New Gretna	NJ
18615	New Hampshire	OH
18616	New Hampton	IA
18617	New Hampton	MO
18618	New Hampton	NH
18619	New Hampton	NY
18620	New Harbor	ME
18621	New Harmony	IN
18622	New Harmony	UT
18623	New Hartford	CT
18624	New Hartford	IA
18625	New Hartford	NY
18626	New Haven	CT
18627	New Haven	IL
18628	New Haven	IN
18629	New Haven	KY
18630	New Haven	MI
18631	New Haven	MO
18632	New Haven	NY
18633	New Haven	OH
18634	New Haven	VT
18635	New Haven	WV
18636	New Hill	NC
18637	New Holland	IL
18638	New Holland	OH
18639	New Holland	PA
18640	New Holland	SD
18641	New Holstein	WI
18642	New Home	TX
18643	New Hope	AL
18644	New Hope	KY
18645	New Hope	PA
18646	New Hope	VA
18647	New Hudson	MI
18648	New Hyde Park	NY
18649	New Iberia	LA
18650	New Ipswich	NH
18651	New Johnsonville	TN
18652	New Kensington	PA
18653	New Kent	VA
18654	New Kingston	NY
18655	New Kingstown	PA
18656	New Knoxville	OH
18657	New Laguna	NM
18658	New Lebanon	IN
18659	New Lebanon	NY
18660	New Lebanon	OH
18661	New Leipzig	ND
18662	New Lenox	IL
18663	New Lexington	OH
18664	New Liberty	IA
18665	New Liberty	KY
18666	New Limerick	ME
18667	New Lisbon	IN
18668	New Lisbon	NJ
18669	New Lisbon	NY
18670	New Lisbon	WI
18671	New London	CT
18672	New London	IA
18673	New London	MN
18674	New London	MO
18675	New London	NC
18676	New London	NH
18677	New London	OH
18678	New London	PA
18679	New London	TX
18680	New London	WI
18681	New Lothrop	MI
18682	New Madison	OH
18683	New Madrid	MO
18684	New Manchester	WV
18685	New Market	AL
18686	New Market	IA
18687	New Market	IN
18688	New Market	MD
18689	New Market	MN
18690	New Market	TN
18691	New Market	VA
18692	New Marshfield	OH
18693	New Martinsville	WV
18694	New Matamoras	OH
18695	New Meadows	ID
18696	New Melle	MO
18697	New Memphis	IL
18698	New Middletown	IN
18699	New Middletown	OH
18700	New Midway	MD
18701	New Milford	CT
18702	New Milford	NJ
18703	New Milford	NY
18704	New Milford	PA
18705	New Millport	PA
18706	New Milton	WV
18707	New Munich	MN
18708	New Munster	WI
18709	New Orleans	LA
18710	New Oxford	PA
18711	New Palestine	IN
18712	New Paltz	NY
18713	New Paris	IN
18714	New Paris	OH
18715	New Paris	PA
18716	New Park	PA
18717	New Philadelphia	OH
18718	New Philadelphia	PA
18719	New Pine Creek	OR
18720	New Plymouth	ID
18721	New Plymouth	OH
18722	New Point	IN
18723	New Point	VA
18724	New Port Richey	FL
18725	New Portland	ME
18726	New Prague	MN
18727	New Preston Marble Dale	CT
18728	New Providence	IA
18729	New Providence	NJ
18730	New Providence	PA
18731	New Raymer	CO
18732	New Richland	MN
18733	New Richmond	IN
18734	New Richmond	OH
18735	New Richmond	WI
18736	New Richmond	WV
18737	New Riegel	OH
18738	New Ringgold	PA
18739	New River	AZ
18740	New River	VA
18741	New Roads	LA
18742	New Rochelle	NY
18743	New Rockford	ND
18744	New Ross	IN
18745	New Rumley	OH
18746	New Russia	NY
18747	New Salem	IL
18748	New Salem	MA
18749	New Salem	ND
18750	New Salem	PA
18751	New Salisbury	IN
18752	New Sarpy	LA
18753	New Sharon	IA
18754	New Sharon	ME
18755	New Site	MS
18756	New Smyrna Beach	FL
18757	New Springfield	OH
18758	New Stanton	PA
18759	New Straitsville	OH
18760	New Stuyahok	AK
18761	New Suffolk	NY
18762	New Summerfield	TX
18763	New Sweden	ME
18764	New Tazewell	TN
18765	New Town	MA
18766	New Town	ND
18767	New Trenton	IN
18768	New Tripoli	PA
18769	New Troy	MI
18770	New Ulm	MN
18771	New Ulm	TX
18772	New Underwood	SD
18773	New Vernon	NJ
18774	New Vienna	IA
18775	New Vienna	OH
18776	New Vineyard	ME
18777	New Virginia	IA
18778	New Washington	IN
18779	New Washington	OH
18780	New Waterford	OH
18781	New Waverly	IN
18782	New Waverly	TX
18783	New Weston	OH
18784	New Wilmington	PA
18785	New Windsor	IL
18786	New Windsor	MD
18787	New Windsor	NY
18788	New Woodstock	NY
18789	New York	NY
18790	New York Mills	MN
18791	New York Mills	NY
18792	New Zion	SC
18793	Newalla	OK
18794	Newark	AR
18795	Newark	CA
18796	Newark	DE
18797	Newark	IL
18798	Newark	MD
18799	Newark	MO
18800	Newark	NJ
18801	Newark	NY
18802	Newark	OH
18803	Newark	TX
18804	Newark Valley	NY
18805	Newaygo	MI
18806	Newberg	OR
18807	Newbern	AL
18808	Newbern	TN
18809	Newbern	VA
18810	Newberry	FL
18811	Newberry	IN
18812	Newberry	MI
18813	Newberry	SC
18814	Newberry Springs	CA
18815	Newborn	GA
18816	Newburg	MD
18817	Newburg	MO
18818	Newburg	ND
18819	Newburg	PA
18820	Newburg	WI
18821	Newburg	WV
18822	Newburgh	IN
18823	Newburgh	NY
18824	Newbury	MA
18825	Newbury	NH
18826	Newbury	OH
18827	Newbury	VT
18828	Newbury Park	CA
18829	Newburyport	MA
18830	Newcastle	CA
18831	Newcastle	ME
18832	Newcastle	NE
18833	Newcastle	OK
18834	Newcastle	TX
18835	Newcastle	UT
18836	Newcastle	WY
18837	Newcomb	MD
18838	Newcomb	NM
18839	Newcomb	NY
18840	Newcomb	TN
18841	Newcomerstown	OH
18842	Newdale	ID
18843	Newell	IA
18844	Newell	NC
18845	Newell	PA
18846	Newell	SD
18847	Newell	WV
18848	Newellton	LA
18849	Newfane	NY
18850	Newfane	VT
18851	Newfield	ME
18852	Newfield	NJ
18853	Newfield	NY
18854	Newfields	NH
18855	Newfolden	MN
18856	Newfoundland	NJ
18857	Newfoundland	PA
18858	Newhall	CA
18859	Newhall	IA
18860	Newhall	WV
18861	Newhebron	MS
18862	Newhope	AR
18863	Newington	CT
18864	Newington	GA
18865	Newington	NH
18866	Newington	VA
18867	Newkirk	NM
18868	Newkirk	OK
18869	Newland	NC
18870	Newllano	LA
18871	Newman	CA
18872	Newman	IL
18873	Newman Grove	NE
18874	Newman Lake	WA
18875	Newmanstown	PA
18876	Newmarket	NH
18877	Newnan	GA
18878	Newport	AR
18879	Newport	IN
18880	Newport	KY
18881	Newport	ME
18882	Newport	MI
18883	Newport	MN
18884	Newport	NC
18885	Newport	NE
18886	Newport	NH
18887	Newport	NJ
18888	Newport	NY
18889	Newport	OH
18890	Newport	OR
18891	Newport	PA
18892	Newport	RI
18893	Newport	TN
18894	Newport	VA
18895	Newport	VT
18896	Newport	WA
18897	Newport Beach	CA
18898	Newport Center	VT
18899	Newport Coast	CA
18900	Newport News	VA
18901	Newry	ME
18902	Newry	PA
18903	Newry	SC
18904	Newsoms	VA
18905	Newton	AL
18906	Newton	GA
18907	Newton	IA
18908	Newton	IL
18909	Newton	KS
18910	Newton	MA
18911	Newton	MS
18912	Newton	NC
18913	Newton	NH
18914	Newton	NJ
18915	Newton	TX
18916	Newton	UT
18917	Newton	WI
18918	Newton	WV
18919	Newton Center	MA
18920	Newton Falls	NY
18921	Newton Falls	OH
18922	Newton Grove	NC
18923	Newton Hamilton	PA
18924	Newton Highlands	MA
18925	Newton Junction	NH
18926	Newton Lower Falls	MA
18927	Newton Upper Falls	MA
18928	Newtonia	MO
18929	Newtonsville	OH
18930	Newtonville	MA
18931	Newtonville	NJ
18932	Newtonville	NY
18933	Newtown	CT
18934	Newtown	IN
18935	Newtown	MO
18936	Newtown	PA
18937	Newtown	VA
18938	Newtown	WV
18939	Newtown Square	PA
18940	Newville	AL
18941	Newville	PA
18942	Ney	OH
18943	Nezperce	ID
18944	Niagara	ND
18945	Niagara	WI
18946	Niagara Falls	NY
18947	Niagara University	NY
18948	Niangua	MO
18949	Niantic	CT
18950	Niantic	IL
18951	Nicasio	CA
18952	Nice	CA
18953	Niceville	FL
18954	Nicholasville	KY
18955	Nicholls	GA
18956	Nichols	FL
18957	Nichols	IA
18958	Nichols	NY
18959	Nichols	SC
18960	Nichols	WI
18961	Nicholson	GA
18962	Nicholson	MS
18963	Nicholson	PA
18964	Nicholville	NY
18965	Nickelsville	VA
18966	Nickerson	KS
18967	Nickerson	NE
18968	Nicktown	PA
18969	Nicolaus	CA
18970	Nicollet	MN
18971	Nicoma Park	OK
18972	Nielsville	MN
18973	Nightmute	AK
18974	Nikiski	AK
18975	Nikolai	AK
18976	Nikolski	AK
18977	Niland	CA
18978	Niles	IL
18979	Niles	MI
18980	Niles	OH
18981	Nilwood	IL
18982	Nimitz	WV
18983	Nimrod	MN
18984	Ninde	VA
18985	Nine Mile Falls	WA
18986	Ninety Six	SC
18987	Nineveh	IN
18988	Nineveh	NY
18989	Nineveh	PA
18990	Ninilchik	AK
18991	Ninnekah	OK
18992	Ninole	HI
18993	Niobe	NY
18994	Niobrara	NE
18995	Niota	IL
18996	Niota	TN
18997	Niotaze	KS
18998	Nipomo	CA
18999	Nipton	CA
19000	Nisland	SD
19001	Nisswa	MN
19002	Nisula	MI
19003	Nitro	WV
19004	Niverville	NY
19005	Niwot	CO
19006	Nixa	MO
19007	Nixon	NV
19008	Nixon	TX
19009	Noatak	AK
19010	Noble	IL
19011	Noble	LA
19012	Noble	MO
19013	Noble	OK
19014	Nobleboro	ME
19015	Noblesville	IN
19016	Nobleton	FL
19017	Nocatee	FL
19018	Nocona	TX
19019	Nodaway	IA
19020	Noel	MO
19021	Nogal	NM
19022	Nogales	AZ
19023	Nokesville	VA
19024	Nokomis	FL
19025	Nokomis	IL
19026	Nolan	TX
19027	Nolanville	TX
19028	Nolensville	TN
19029	Noma	FL
19030	Nome	AK
19031	Nome	ND
19032	Nome	TX
19033	Nonantum	MA
19034	Nondalton	AK
19035	Nooksack	WA
19036	Noonan	ND
19037	Noorvik	AK
19038	Nora	IL
19039	Nora	VA
19040	Nora Springs	IA
19041	Norborne	MO
19042	Norcatur	KS
19043	Norco	CA
19044	Norco	LA
19045	Norcross	GA
19046	Norcross	MN
19047	Norden	CA
19048	Nordheim	TX
19049	Nordland	WA
19050	Nordman	ID
19051	Norene	TN
19052	Norfolk	CT
19053	Norfolk	MA
19054	Norfolk	NE
19055	Norfolk	NY
19056	Norfolk	VA
19057	Norfork	AR
19058	Norge	VA
19059	Norlina	NC
19060	Norma	NJ
19061	Normal	AL
19062	Normal	IL
19063	Normalville	PA
19064	Norman	AR
19065	Norman	IN
19066	Norman	NC
19067	Norman	OK
19068	Norman Park	GA
19069	Normandy	TN
19070	Normandy Beach	NJ
19071	Normangee	TX
19072	Normanna	TX
19073	Normantown	WV
19074	Norphlet	AR
19075	Norridgewock	ME
19076	Norris	IL
19077	Norris	MT
19078	Norris	SC
19079	Norris	SD
19080	Norris	TN
19081	Norris City	IL
19082	Norristown	GA
19083	Norristown	PA
19084	North	SC
19085	North	VA
19086	North Adams	MA
19087	North Adams	MI
19088	North Amherst	MA
19089	North Andover	MA
19090	North Anson	ME
19091	North Apollo	PA
19092	North Arlington	NJ
19093	North Attleboro	MA
19094	North Augusta	SC
19095	North Aurora	IL
19096	North Babylon	NY
19097	North Baltimore	OH
19098	North Bangor	NY
19099	North Bay	NY
19100	North Beach	MD
19101	North Bend	NE
19102	North Bend	OH
19103	North Bend	OR
19104	North Bend	PA
19105	North Bend	WA
19106	North Bennington	VT
19107	North Benton	OH
19108	North Bergen	NJ
19109	North Berwick	ME
19110	North Billerica	MA
19111	North Blenheim	NY
19112	North Bloomfield	OH
19113	North Bonneville	WA
19114	North Boston	NY
19115	North Branch	MI
19116	North Branch	MN
19117	North Branch	NY
19118	North Branford	CT
19119	North Bridgton	ME
19120	North Brookfield	MA
19121	North Brookfield	NY
19122	North Brunswick	NJ
19123	North Buena Vista	IA
19124	North Canton	CT
19125	North Canton	OH
19126	North Carrollton	MS
19127	North Carver	MA
19128	North Charleston	SC
19129	North Chatham	MA
19130	North Chatham	NY
19131	North Chelmsford	MA
19132	North Chicago	IL
19133	North Chili	NY
19134	North Clarendon	VT
19135	North Collins	NY
19136	North Concord	VT
19137	North Conway	NH
19138	North Creek	NY
19139	North Dartmouth	MA
19140	North Dighton	MA
19141	North East	MD
19142	North East	PA
19143	North Eastham	MA
19144	North Easton	MA
19145	North Egremont	MA
19146	North English	IA
19147	North Evans	NY
19148	North Fairfield	OH
19149	North Falmouth	MA
19150	North Ferrisburgh	VT
19151	North Fork	CA
19152	North Fork	ID
19153	North Fort Myers	FL
19154	North Franklin	CT
19155	North Freedom	WI
19156	North Garden	VA
19157	North Georgetown	OH
19158	North Grafton	MA
19159	North Granby	CT
19160	North Granville	NY
19161	North Greece	NY
19162	North Grosvenordale	CT
19163	North Hampton	NH
19164	North Hampton	OH
19165	North Hartland	VT
19166	North Hatfield	MA
19167	North Haven	CT
19168	North Haven	ME
19169	North Haverhill	NH
19170	North Henderson	IL
19171	North Hero	VT
19172	North Highlands	CA
19173	North Hills	CA
19174	North Hollywood	CA
19175	North Hoosick	NY
19176	North Houston	TX
19177	North Hudson	NY
19178	North Hyde Park	VT
19179	North Jackson	OH
19180	North Java	NY
19181	North Jay	ME
19182	North Judson	IN
19183	North Kingstown	RI
19184	North Kingsville	OH
19185	North Lake	WI
19186	North Lakewood	WA
19187	North Las Vegas	NV
19188	North Lawrence	NY
19189	North Lawrence	OH
19190	North Lewisburg	OH
19191	North Liberty	IA
19192	North Liberty	IN
19193	North Lima	OH
19194	North Little Rock	AR
19195	North Loup	NE
19196	North Manchester	IN
19197	North Marshfield	MA
19198	North Matewan	WV
19199	North Metro	GA
19200	North Miami	OK
19201	North Miami Beach	FL
19202	North Middletown	KY
19203	North Monmouth	ME
19204	North Montpelier	VT
19205	North Myrtle Beach	SC
19206	North Newton	KS
19207	North Norwich	NY
19208	North Olmsted	OH
19209	North Oxford	MA
19210	North Palm Beach	FL
19211	North Palm Springs	CA
19212	North Pembroke	MA
19213	North Pitcher	NY
19214	North Plains	OR
19215	North Platte	NE
19216	North Pole	AK
19217	North Pomfret	VT
19218	North Port	FL
19219	North Powder	OR
19220	North Pownal	VT
19221	North Prairie	WI
19222	North Providence	RI
19223	North Reading	MA
19224	North Richland Hills	TX
19225	North Ridgeville	OH
19226	North Rim	AZ
19227	North River	NY
19228	North Robinson	OH
19229	North Rose	NY
19230	North Royalton	OH
19231	North Salem	IN
19232	North Salem	NH
19233	North Salem	NY
19234	North Salt Lake	UT
19235	North San Juan	CA
19236	North Sandwich	NH
19237	North Scituate	MA
19238	North Scituate	RI
19239	North Sioux City	SD
19240	North Smithfield	RI
19241	North Spring	WV
19242	North Springfield	PA
19243	North Springfield	VT
19244	North Star	MI
19245	North Star	OH
19246	North Stonington	CT
19247	North Stratford	NH
19248	North Street	MI
19249	North Sutton	NH
19250	North Tazewell	VA
19251	North Thetford	VT
19252	North Tonawanda	NY
19253	North Troy	VT
19254	North Truro	MA
19255	North Turner	ME
19256	North Uxbridge	MA
19257	North Vassalboro	ME
19258	North Vernon	IN
19259	North Versailles	PA
19260	North Wales	PA
19261	North Walpole	NH
19262	North Waltham	MA
19263	North Washington	IA
19264	North Washington	PA
19265	North Waterboro	ME
19266	North Waterford	ME
19267	North Webster	IN
19268	North Westchester	CT
19269	North Weymouth	MA
19270	North Wilkesboro	NC
19271	North Windham	CT
19272	North Woodstock	NH
19273	North Yarmouth	ME
19274	North Zulch	TX
19275	Northampton	MA
19276	Northampton	PA
19277	Northboro	IA
19278	Northborough	MA
19279	Northbridge	MA
19280	Northbrook	IL
19281	Northeast Harbor	ME
19282	Northern Cambria	PA
19283	Northfield	CT
19284	Northfield	MA
19285	Northfield	MN
19286	Northfield	NJ
19287	Northfield	OH
19288	Northfield	VT
19289	Northfield Falls	VT
19290	Northford	CT
19291	Northfork	WV
19292	Northome	MN
19293	Northpoint	PA
19294	Northport	AL
19295	Northport	MI
19296	Northport	NY
19297	Northport	WA
19298	Northridge	CA
19299	Northrop	MN
19300	Northumberland	NH
19301	Northumberland	PA
19302	Northvale	NJ
19303	Northville	MI
19304	Northville	NY
19305	Northville	SD
19306	Northway	AK
19307	Northwood	IA
19308	Northwood	ND
19309	Northwood	NH
19310	Northwood	OH
19311	Norton	KS
19312	Norton	MA
19313	Norton	TX
19314	Norton	VA
19315	Norton	VT
19316	Norton	WV
19317	Nortonville	KS
19318	Nortonville	KY
19319	Norvell	MI
19320	Norvelt	PA
19321	Norwalk	CA
19322	Norwalk	CT
19323	Norwalk	IA
19324	Norwalk	OH
19325	Norwalk	WI
19326	Norway	IA
19327	Norway	KS
19328	Norway	ME
19329	Norway	MI
19330	Norway	SC
19331	Norwell	MA
19332	Norwich	CT
19333	Norwich	KS
19334	Norwich	ND
19335	Norwich	NY
19336	Norwich	OH
19337	Norwich	VT
19338	Norwood	CO
19339	Norwood	GA
19340	Norwood	LA
19341	Norwood	MA
19342	Norwood	MN
19343	Norwood	MO
19344	Norwood	NC
19345	Norwood	NJ
19346	Norwood	NY
19347	Norwood	PA
19348	Norwood	VA
19349	Norwood Young America	MN
19350	Notasulga	AL
19351	Noti	OR
19352	Notre Dame	IN
19353	Notrees	TX
19354	Nottawa	MI
19355	Nottingham	MD
19356	Nottingham	NH
19357	Nottingham	PA
19358	Nottoway	VA
19359	Notus	ID
19360	Nova	OH
19361	Novato	CA
19362	Novelty	MO
19363	Novelty	OH
19364	Novi	MI
19365	Novice	TX
19366	Novinger	MO
19367	Nowata	OK
19368	Noxapater	MS
19369	Noxen	PA
19370	Noxon	MT
19371	Noyes	MN
19372	Nu Mine	PA
19373	Nubieber	CA
19374	Nucla	CO
19375	Nuevo	CA
19376	Nuiqsut	AK
19377	Nulato	AK
19378	Numidia	PA
19379	Nunam Iqua	AK
19380	Nunmeisterdish_servertchuk	AK
19381	Nunda	NY
19382	Nunda	SD
19383	Nunez	GA
19384	Nunica	MI
19385	Nunn	CO
19386	Nunnelly	TN
19387	Nuremberg	PA
19388	Nursery	TX
19389	Nutley	NJ
19390	Nutrioso	AZ
19391	Nutting Lake	MA
19392	Nuttsville	VA
19393	Nyack	NY
19394	Nye	MT
19395	Nyssa	OR
19396	O Brien	FL
19397	O Brien	OR
19398	O Brien	TX
19399	O Fallon	IL
19400	O Fallon	MO
19401	O Kean	AR
19402	O Neals	CA
19403	Oacoma	SD
19404	Oak	NE
19405	Oak Bluffs	MA
19406	Oak Brook	IL
19407	Oak City	NC
19408	Oak City	UT
19409	Oak Creek	CO
19410	Oak Creek	WI
19411	Oak Forest	IL
19412	Oak Grove	AR
19413	Oak Grove	KY
19414	Oak Grove	LA
19415	Oak Grove	MO
19416	Oak Hall	VA
19417	Oak Harbor	OH
19418	Oak Harbor	WA
19419	Oak Hill	AL
19420	Oak Hill	FL
19421	Oak Hill	NY
19422	Oak Hill	OH
19423	Oak Island	MN
19424	Oak Island	NC
19425	Oak Lawn	IL
19426	Oak Park	CA
19427	Oak Park	IL
19428	Oak Park	MI
19429	Oak Park	MN
19430	Oak Ridge	LA
19431	Oak Ridge	MO
19432	Oak Ridge	NC
19433	Oak Ridge	NJ
19434	Oak Ridge	PA
19435	Oak Ridge	TN
19436	Oak Run	CA
19437	Oak Vale	MS
19438	Oak View	CA
19439	Oakboro	NC
19440	Oakdale	CA
19441	Oakdale	CT
19442	Oakdale	IA
19443	Oakdale	IL
19444	Oakdale	LA
19445	Oakdale	NE
19446	Oakdale	NY
19447	Oakdale	PA
19448	Oakdale	TN
19449	Oakdale	WI
19450	Oakes	ND
19451	Oakesdale	WA
19452	Oakfield	GA
19453	Oakfield	ME
19454	Oakfield	NY
19455	Oakfield	TN
19456	Oakfield	WI
19457	Oakford	IL
19458	Oakford	IN
19459	Oakham	MA
19460	Oakhurst	CA
19461	Oakhurst	NJ
19462	Oakhurst	OK
19463	Oakhurst	TX
19464	Oakland	AR
19465	Oakland	CA
19466	Oakland	FL
19467	Oakland	IA
19468	Oakland	IL
19469	Oakland	KY
19470	Oakland	MD
19471	Oakland	ME
19472	Oakland	MI
19473	Oakland	MS
19474	Oakland	NE
19475	Oakland	NJ
19476	Oakland	OR
19477	Oakland	RI
19478	Oakland	TN
19479	Oakland	TX
19480	Oakland City	IN
19481	Oakland Gardens	NY
19482	Oakland Mills	PA
19483	Oakley	CA
19484	Oakley	ID
19485	Oakley	KS
19486	Oakley	MI
19487	Oakley	UT
19488	Oakman	AL
19489	Oakman	GA
19490	Oakmont	PA
19491	Oakpark	VA
19492	Oakridge	OR
19493	Oaks	OK
19494	Oaks	PA
19495	Oaks Corners	NY
19496	Oakton	VA
19497	Oaktown	IN
19498	Oakvale	WV
19499	Oakville	CA
19500	Oakville	CT
19501	Oakville	IA
19502	Oakville	IN
19503	Oakville	TX
19504	Oakville	WA
19505	Oakwood	GA
19506	Oakwood	IL
19507	Oakwood	OH
19508	Oakwood	OK
19509	Oakwood	TX
19510	Oakwood	VA
19511	Oark	AR
19512	Oatman	AZ
19513	Oberlin	KS
19514	Oberlin	LA
19515	Oberlin	OH
19516	Obernburg	NY
19517	Oberon	ND
19518	Obion	TN
19519	Oblong	IL
19520	Obrien	CA
19521	Ocala	FL
19522	Ocate	NM
19523	Occidental	CA
19524	Occoquan	VA
19525	Ocean Beach	NY
19526	Ocean Bluff	MA
19527	Ocean City	MD
19528	Ocean City	NJ
19529	Ocean Gate	NJ
19530	Ocean Grove	NJ
19531	Ocean Isle Beach	NC
19532	Ocean Park	ME
19533	Ocean Park	WA
19534	Ocean Shores	WA
19535	Ocean Springs	MS
19536	Ocean View	DE
19537	Ocean View	HI
19538	Ocean View	NJ
19539	Oceana	WV
19540	Oceano	CA
19541	Oceanport	NJ
19542	Oceanside	CA
19543	Oceanside	NY
19544	Oceanside	OR
19545	Oceanville	NJ
19546	Oceola	OH
19547	Ochelata	OK
19548	Ocheyedan	IA
19549	Ochlocknee	GA
19550	Ochopee	FL
19551	Ocilla	GA
19552	Ocklawaha	FL
19553	Ocoee	FL
19554	Ocoee	TN
19555	Oconee	GA
19556	Oconee	IL
19557	Oconomowoc	WI
19558	Oconto	NE
19559	Oconto	WI
19560	Oconto Falls	WI
19561	Ocotillo	CA
19562	Ocracoke	NC
19563	Odanah	WI
19564	Odd	WV
19565	Odebolt	IA
19566	Odell	IL
19567	Odell	NE
19568	Odell	OR
19569	Odell	TX
19570	Odem	TX
19571	Oden	AR
19572	Oden	MI
19573	Odenton	MD
19574	Odenville	AL
19575	Odessa	DE
19576	Odessa	FL
19577	Odessa	MN
19578	Odessa	MO
19579	Odessa	NE
19580	Odessa	NY
19581	Odessa	TX
19582	Odessa	WA
19583	Odin	IL
19584	Odin	MN
19585	Odon	IN
19586	Odonnell	TX
19587	Odum	GA
19588	Oelrichs	SD
19589	Oelwein	IA
19590	Offerle	KS
19591	Offerman	GA
19592	Offutt A F B	NE
19593	Ogallah	KS
19594	Ogallala	NE
19595	Ogden	AR
19596	Ogden	IA
19597	Ogden	IL
19598	Ogden	KS
19599	Ogden	UT
19600	Ogdensburg	NJ
19601	Ogdensburg	NY
19602	Ogdensburg	WI
19603	Ogema	MN
19604	Ogema	WI
19605	Ogilvie	MN
19606	Oglala	SD
19607	Oglesby	IL
19608	Oglesby	TX
19609	Oglethorpe	GA
19610	Ogunquit	ME
19611	Ohatchee	AL
19612	Ohio	IL
19613	Ohio City	CO
19614	Ohio City	OH
19615	Ohiopyle	PA
19616	Ohiowa	NE
19617	Ohlman	IL
19618	Oil City	LA
19619	Oil City	PA
19620	Oil Springs	KY
19621	Oil Trough	AR
19622	Oilmont	MT
19623	Oilton	OK
19624	Oilton	TX
19625	Oilville	VA
19626	Ojai	CA
19627	Ojibwa	WI
19628	Ojo Caliente	NM
19629	Ojo Feliz	NM
19630	Okabena	MN
19631	Okahumpka	FL
19632	Okanogan	WA
19633	Okarche	OK
19634	Okatie	SC
19635	Okaton	SD
19636	Okauchee	WI
19637	Okawville	IL
19638	Okay	OK
19639	Okeana	OH
19640	Okeechobee	FL
19641	Okeene	OK
19642	Okemah	OK
19643	Okemos	MI
19644	Oketo	KS
19645	Oklahoma City	OK
19646	Oklaunion	TX
19647	Oklee	MN
19648	Okmulgee	OK
19649	Okoboji	IA
19650	Okolona	AR
19651	Okolona	MS
19652	Okolona	OH
19653	Okreek	SD
19654	Oktaha	OK
19655	Ola	AR
19656	Ola	ID
19657	Olalla	WA
19658	Olamon	ME
19659	Olancha	CA
19660	Olanta	PA
19661	Olanta	SC
19662	Olar	SC
19663	Olathe	CO
19664	Olathe	KS
19665	Olaton	KY
19666	Olcott	NY
19667	Old Appleton	MO
19668	Old Bethpage	NY
19669	Old Bridge	NJ
19670	Old Chatham	NY
19671	Old Fields	WV
19672	Old Forge	NY
19673	Old Forge	PA
19674	Old Fort	NC
19675	Old Fort	OH
19676	Old Glory	TX
19677	Old Greenwich	CT
19678	Old Harbor	AK
19679	Old Hickory	TN
19680	Old Lyme	CT
19681	Old Mission	MI
19682	Old Monroe	MO
19683	Old Mystic	CT
19684	Old Ocean	TX
19685	Old Orchard Beach	ME
19686	Old Saybrook	CT
19687	Old Station	CA
19688	Old Town	FL
19689	Old Town	ME
19690	Old Washington	OH
19691	Old Westbury	NY
19692	Old Zionsville	PA
19693	Olden	TX
19694	Oldenburg	IN
19695	Oldfield	MO
19696	Oldfort	TN
19697	Oldham	SD
19698	Oldhams	VA
19699	Olds	IA
19700	Oldsmar	FL
19701	Oldtown	ID
19702	Oldtown	MD
19703	Oldwick	NJ
19704	Olean	MO
19705	Olean	NY
19706	Olema	CA
19707	Oley	PA
19708	Olga	WA
19709	Olin	IA
19710	Olin	NC
19711	Olive	MT
19712	Olive Branch	IL
19713	Olive Branch	MS
19714	Olive Hill	KY
19715	Olivebridge	NY
19716	Oliveburg	PA
19717	Olivehill	TN
19718	Olivehurst	CA
19719	Oliver	GA
19720	Oliver	PA
19721	Oliver Springs	TN
19722	Olivet	MI
19723	Olivet	SD
19724	Olivia	MN
19725	Olivia	NC
19726	Olla	LA
19727	Ollie	IA
19728	Olmito	TX
19729	Olmitz	KS
19730	Olmstead	KY
19731	Olmsted	IL
19732	Olmsted Falls	OH
19733	Olmstedville	NY
19734	Olney	IL
19735	Olney	MD
19736	Olney	MO
19737	Olney	MT
19738	Olney	TX
19739	Olney Springs	CO
19740	Olpe	KS
19741	Olsburg	KS
19742	Olton	TX
19743	Olustee	FL
19744	Olustee	OK
19745	Olympia	KY
19746	Olympia	WA
19747	Olympia Fields	IL
19748	Olympic Valley	CA
19749	Olyphant	PA
19750	Omaha	AR
19751	Omaha	GA
19752	Omaha	IL
19753	Omaha	NE
19754	Omaha	TX
19755	Omak	WA
19756	Omar	WV
19757	Omega	GA
19758	Omega	OK
19759	Omena	MI
19760	Omer	MI
19761	Omro	WI
19762	Ona	FL
19763	Ona	WV
19764	Onaga	KS
19765	Onaka	SD
19766	Onalaska	TX
19767	Onalaska	WA
19768	Onalaska	WI
19769	Onamia	MN
19770	Onancock	VA
19771	Onarga	IL
19772	Onawa	IA
19773	Onaway	MI
19774	Oneco	CT
19775	Oneco	FL
19776	Onego	WV
19777	Oneida	AR
19778	Oneida	IL
19779	Oneida	KS
19780	Oneida	KY
19781	Oneida	NY
19782	Oneida	PA
19783	Oneida	TN
19784	Oneida	WI
19785	Oneill	NE
19786	Onekama	MI
19787	Onemo	VA
19788	Oneonta	AL
19789	Oneonta	NY
19790	Ong	NE
19791	Onia	AR
19792	Onida	SD
19793	Onley	VA
19794	Only	TN
19795	Ono	PA
19796	Onondaga	MI
19797	Onset	MA
19798	Onslow	IA
19799	Onsted	MI
19800	Ontario	CA
19801	Ontario	NY
19802	Ontario	OH
19803	Ontario	OR
19804	Ontario	WI
19805	Ontario Center	NY
19806	Ontonagon	MI
19807	Onward	IN
19808	Onyx	CA
19809	Ookala	HI
19810	Oolitic	IN
19811	Oologah	OK
19812	Ooltewah	TN
19813	Oostburg	WI
19814	Opa Locka	FL
19815	Opal	WY
19816	Opdyke	IL
19817	Opelika	AL
19818	Opelousas	LA
19819	Opheim	MT
19820	Ophelia	VA
19821	Ophiem	IL
19822	Ophir	CO
19823	Ophir	KY
19824	Ophir	OR
19825	Opolis	KS
19826	Opp	AL
19827	Oquawka	IL
19828	Oquossoc	ME
19829	Ora	IN
19830	Oracle	AZ
19831	Oradell	NJ
19832	Oral	SD
19833	Oran	IA
19834	Oran	MO
19835	Orange	CA
19836	Orange	CT
19837	Orange	MA
19838	Orange	NJ
19839	Orange	TX
19840	Orange	VA
19841	Orange Beach	AL
19842	Orange City	FL
19843	Orange City	IA
19844	Orange Cove	CA
19845	Orange Grove	TX
19846	Orange Lake	FL
19847	Orange Park	FL
19848	Orange Springs	FL
19849	Orangeburg	NY
19850	Orangeburg	SC
19851	Orangefield	TX
19852	Orangevale	CA
19853	Orangeville	IL
19854	Orangeville	OH
19855	Orangeville	PA
19856	Orangeville	UT
19857	Oraville	IL
19858	Orbisonia	PA
19859	Orcas	WA
19860	Orchard	CO
19861	Orchard	IA
19862	Orchard	NE
19863	Orchard	TX
19864	Orchard Hill	GA
19865	Orchard Park	NY
19866	Ord	NE
19867	Orderville	UT
19868	Ordinary	VA
19869	Ordway	CO
19870	Ore City	TX
19871	Oreana	IL
19872	Orefield	PA
19873	Oregon	IL
19874	Oregon	MO
19875	Oregon	OH
19876	Oregon	WI
19877	Oregon City	OR
19878	Oregon House	CA
19879	Oregonia	OH
19880	Oreland	PA
19881	Orem	UT
19882	Orestes	IN
19883	Orford	NH
19884	Orfordville	WI
19885	Organ	NM
19886	Orgas	WV
19887	Orick	CA
19888	Orient	IA
19889	Orient	IL
19890	Orient	ME
19891	Orient	NY
19892	Orient	OH
19893	Orient	SD
19894	Orient	WA
19895	Oriental	NC
19896	Orinda	CA
19897	Orion	IL
19898	Oriska	ND
19899	Oriskany	NY
19900	Oriskany	VA
19901	Oriskany Falls	NY
19902	Orkney Springs	VA
19903	Orla	TX
19904	Orland	CA
19905	Orland	IN
19906	Orland	ME
19907	Orland Park	IL
19908	Orlando	FL
19909	Orlando	KY
19910	Orlando	OK
19911	Orlando	WV
19912	Orlean	VA
19913	Orleans	CA
19914	Orleans	IN
19915	Orleans	MA
19916	Orleans	MI
19917	Orleans	NE
19918	Orleans	VT
19919	Orlinda	TN
19920	Orma	WV
19921	Ormond Beach	FL
19922	Ormsby	MN
19923	Oro Grande	CA
19924	Orofino	ID
19925	Orogrande	NM
19926	Orondo	WA
19927	Orono	ME
19928	Oronoco	MN
19929	Oronogo	MO
19930	Orosi	CA
19931	Orovada	NV
19932	Oroville	CA
19933	Oroville	WA
19934	Orr	MN
19935	Orrick	MO
19936	Orrington	ME
19937	Orrs Island	ME
19938	Orrstown	PA
19939	Orrtanna	PA
19940	Orrum	NC
19941	Orrville	AL
19942	Orrville	OH
19943	Orson	PA
19944	Orting	WA
19945	Ortley	SD
19946	Ortonville	MI
19947	Ortonville	MN
19948	Orviston	PA
19949	Orwell	NY
19950	Orwell	OH
19951	Orwell	VT
19952	Orwigsburg	PA
19953	Osage	IA
19954	Osage	MN
19955	Osage	OK
19956	Osage	WV
19957	Osage	WY
19958	Osage Beach	MO
19959	Osage City	KS
19960	Osakis	MN
19961	Osawatomie	KS
19962	Osborn	MO
19963	Osborne	KS
19964	Osburn	ID
19965	Oscar	LA
19966	Oscar	OK
19967	Osceola	AR
19968	Osceola	IA
19969	Osceola	IN
19970	Osceola	MO
19971	Osceola	NE
19972	Osceola	PA
19973	Osceola	WI
19974	Osceola Mills	PA
19975	Osco	IL
19976	Oscoda	MI
19977	Osgood	IN
19978	Osgood	OH
19979	Oshkosh	NE
19980	Oshkosh	WI
19981	Oshtemo	MI
19982	Oskaloosa	IA
19983	Oskaloosa	KS
19984	Oslo	MN
19985	Osmond	NE
19986	Osnabrock	ND
19987	Osprey	FL
19988	Osseo	MI
19989	Osseo	MN
19990	Osseo	WI
19991	Ossian	IA
19992	Ossian	IN
19993	Ossineke	MI
19994	Ossining	NY
19995	Ossipee	NH
19996	Osteen	FL
19997	Osterville	MA
19998	Ostrander	MN
19999	Ostrander	OH
20000	Oswegatchie	NY
20001	Oswego	IL
20002	Oswego	KS
20003	Oswego	NY
20004	Osyka	MS
20005	Otego	NY
20006	Othello	WA
20007	Otho	IA
20008	Otis	CO
20009	Otis	KS
20010	Otis	LA
20011	Otis	MA
20012	Otis	OR
20013	Otis Orchards	WA
20014	Otisco	IN
20015	Otisville	MI
20016	Otisville	NY
20017	Otley	IA
20018	Oto	IA
20019	Otoe	NE
20020	Otsego	MI
20021	Ottawa	IL
20022	Ottawa	KS
20023	Ottawa	OH
20024	Ottawa	WV
20025	Ottawa Lake	MI
20026	Otter	MT
20027	Otter Creek	FL
20028	Otter Lake	MI
20029	Otter Rock	OR
20030	Otterbein	IN
20031	Ottertail	MN
20032	Otterville	MO
20033	Ottine	TX
20034	Otto	NC
20035	Otto	NY
20036	Otto	WY
20037	Ottosen	IA
20038	Ottoville	OH
20039	Ottsville	PA
20040	Ottumwa	IA
20041	Otway	OH
20042	Otwell	IN
20043	Ouaquaga	NY
20044	Ouray	CO
20045	Outing	MN
20046	Outlook	MT
20047	Outlook	WA
20048	Ouzinkie	AK
20049	Ovalo	TX
20050	Ovando	MT
20051	Overbrook	KS
20052	Overbrook	OK
20053	Overgaard	AZ
20054	Overland Park	KS
20055	Overpeck	OH
20056	Overton	NE
20057	Overton	NV
20058	Overton	TX
20059	Ovett	MS
20060	Ovid	CO
20061	Ovid	MI
20062	Ovid	NY
20063	Oviedo	FL
20064	Owaneco	IL
20065	Owanka	SD
20066	Owasso	OK
20067	Owatonna	MN
20068	Owego	NY
20069	Owen	WI
20070	Owendale	MI
20071	Owens Cross Roads	AL
20072	Owensboro	KY
20073	Owensburg	IN
20074	Owensville	IN
20075	Owensville	MO
20076	Owensville	OH
20077	Owenton	KY
20078	Owings	MD
20079	Owings Mills	MD
20080	Owingsville	KY
20081	Owls Head	ME
20082	Owls Head	NY
20083	Owosso	MI
20084	Owyhee	NV
20085	Oxbow	ME
20086	Oxbow	NY
20087	Oxbow	OR
20088	Oxford	AL
20089	Oxford	AR
20090	Oxford	CT
20091	Oxford	FL
20092	Oxford	GA
20093	Oxford	IA
20094	Oxford	IN
20095	Oxford	KS
20096	Oxford	MA
20097	Oxford	MD
20098	Oxford	ME
20099	Oxford	MI
20100	Oxford	MS
20101	Oxford	NC
20102	Oxford	NE
20103	Oxford	NJ
20104	Oxford	NY
20105	Oxford	OH
20106	Oxford	PA
20107	Oxford	WI
20108	Oxford Junction	IA
20109	Oxly	MO
20110	Oxnard	CA
20111	Oxon Hill	MD
20112	Oyens	IA
20113	Oyster	VA
20114	Oyster Bay	NY
20115	Oysterville	WA
20116	Ozan	AR
20117	Ozark	AL
20118	Ozark	AR
20119	Ozark	IL
20120	Ozark	MO
20121	Ozawkie	KS
20122	Ozona	FL
20123	Ozona	TX
20124	Ozone	AR
20125	Ozone Park	NY
20126	Paauilo	HI
20127	Pablo	MT
20128	Pace	MS
20129	Pachuta	MS
20130	Pacific	MO
20131	Pacific	WA
20132	Pacific Beach	WA
20133	Pacific City	OR
20134	Pacific Grove	CA
20135	Pacific Junction	IA
20136	Pacific Palisades	CA
20137	Pacifica	CA
20138	Packwaukee	WI
20139	Packwood	IA
20140	Packwood	WA
20141	Pacoima	CA
20142	Pacolet	SC
20143	Pacolet Mills	SC
20144	Paden	OK
20145	Paden City	WV
20146	Padroni	CO
20147	Paducah	KY
20148	Paducah	TX
20149	Paeonian Springs	VA
20150	Page	AZ
20151	Page	ND
20152	Page	NE
20153	Page	WV
20154	Pageland	SC
20155	Pageton	WV
20156	Pagosa Springs	CO
20157	Paguate	NM
20158	Pahala	HI
20159	Pahoa	HI
20160	Pahokee	FL
20161	Pahrump	NV
20162	Paia	HI
20163	Paicines	CA
20164	Paige	TX
20165	Paincourtville	LA
20166	Painesdale	MI
20167	Painesville	OH
20168	Paint Bank	VA
20169	Paint Lick	KY
20170	Paint Rock	AL
20171	Paint Rock	TX
20172	Painted Post	NY
20173	Painter	VA
20174	Paintsville	KY
20175	Paisley	FL
20176	Paisley	OR
20177	Pala	CA
20178	Palacios	TX
20179	Palatine	IL
20180	Palatine Bridge	NY
20181	Palatka	FL
20182	Palco	KS
20183	Palenville	NY
20184	Palermo	CA
20185	Palermo	ME
20186	Palermo	ND
20187	Palestine	AR
20188	Palestine	IL
20189	Palestine	OH
20190	Palestine	TX
20191	Palestine	WV
20192	Palisade	CO
20193	Palisade	MN
20194	Palisade	NE
20195	Palisades	NY
20196	Palisades	WA
20197	Palisades Park	NJ
20198	Pall Mall	TN
20199	Palm	PA
20200	Palm Bay	FL
20201	Palm Beach	FL
20202	Palm Beach Gardens	FL
20203	Palm City	FL
20204	Palm Coast	FL
20205	Palm Desert	CA
20206	Palm Harbor	FL
20207	Palm Springs	CA
20208	Palmdale	CA
20209	Palmdale	FL
20210	Palmer	AK
20211	Palmer	IA
20212	Palmer	IL
20213	Palmer	KS
20214	Palmer	MA
20215	Palmer	MI
20216	Palmer	NE
20217	Palmer	TN
20218	Palmer	TX
20219	Palmer Lake	CO
20220	Palmerdale	AL
20221	Palmersville	TN
20222	Palmerton	PA
20223	Palmetto	FL
20224	Palmetto	GA
20225	Palmetto	LA
20226	Palms	MI
20227	Palmyra	IL
20228	Palmyra	IN
20229	Palmyra	ME
20230	Palmyra	MI
20231	Palmyra	MO
20232	Palmyra	NE
20233	Palmyra	NJ
20234	Palmyra	NY
20235	Palmyra	PA
20236	Palmyra	TN
20237	Palmyra	VA
20238	Palmyra	WI
20239	Palo	IA
20240	Palo	MI
20241	Palo Alto	CA
20242	Palo Cedro	CA
20243	Palo Pinto	TX
20244	Palo Verde	AZ
20245	Palo Verde	CA
20246	Paloma	IL
20247	Palomar Mountain	CA
20248	Palos Heights	IL
20249	Palos Hills	IL
20250	Palos Park	IL
20251	Palos Verdes Peninsula	CA
20252	Palouse	WA
20253	Paluxy	TX
20254	Pampa	TX
20255	Pamplico	SC
20256	Pamplin	VA
20257	Pana	IL
20258	Panaca	NV
20259	Panacea	FL
20260	Panama	IA
20261	Panama	IL
20262	Panama	NE
20263	Panama	NY
20264	Panama	OK
20265	Panama City	FL
20266	Panama City Beach	FL
20267	Pandora	OH
20268	Pandora	TX
20269	Pangburn	AR
20270	Panguitch	UT
20271	Panhandle	TX
20272	Panna Maria	TX
20273	Panola	AL
20274	Panola	OK
20275	Panola	TX
20276	Panora	IA
20277	Panorama City	CA
20278	Pansey	AL
20279	Pantego	NC
20280	Panther	WV
20281	Panther Burn	MS
20282	Paola	KS
20283	Paoli	CO
20284	Paoli	IN
20285	Paoli	OK
20286	Paoli	PA
20287	Paonia	CO
20288	Papaaloa	HI
20289	Papaikou	HI
20290	Pmeisterdish_serverllion	NE
20291	Pmeisterdish_serverneau	IL
20292	Parachute	CO
20293	Paradis	LA
20294	Paradise	CA
20295	Paradise	KS
20296	Paradise	MI
20297	Paradise	MT
20298	Paradise	PA
20299	Paradise	TX
20300	Paradise	UT
20301	Paradise Inn	WA
20302	Paradise Valley	AZ
20303	Paradise Valley	NV
20304	Paradox	CO
20305	Paradox	NY
20306	Paragon	IN
20307	Paragonah	UT
20308	Paragould	AR
20309	Paramount	CA
20310	Paramus	NJ
20311	Parchman	MS
20312	Pardeeville	WI
20313	Paris	AR
20314	Paris	ID
20315	Paris	IL
20316	Paris	KY
20317	Paris	ME
20318	Paris	MI
20319	Paris	MO
20320	Paris	MS
20321	Paris	OH
20322	Paris	TN
20323	Paris	TX
20324	Paris	VA
20325	Paris Crossing	IN
20326	Parish	NY
20327	Parishville	NY
20328	Park	KS
20329	Park City	KY
20330	Park City	MT
20331	Park City	UT
20332	Park Falls	WI
20333	Park Forest	IL
20334	Park Hall	MD
20335	Park Hill	OK
20336	Park Hills	MO
20337	Park Rmeisterdish_serverds	MN
20338	Park Ridge	IL
20339	Park Ridge	NJ
20340	Park River	ND
20341	Park Valley	UT
20342	Parkdale	AR
20343	Parker	AZ
20344	Parker	CO
20345	Parker	ID
20346	Parker	KS
20347	Parker	PA
20348	Parker	SD
20349	Parker	WA
20350	Parker City	IN
20351	Parker Dam	CA
20352	Parker Ford	PA
20353	Parkers Lake	KY
20354	Parkers Prairie	MN
20355	Parkersburg	IA
20356	Parkersburg	IL
20357	Parkersburg	WV
20358	Parkesburg	PA
20359	Parkhill	PA
20360	Parkin	AR
20361	Parkman	OH
20362	Parkman	WY
20363	Parks	AR
20364	Parks	AZ
20365	Parks	NE
20366	Parksley	VA
20367	Parkston	SD
20368	Parksville	KY
20369	Parksville	NY
20370	Parksville	SC
20371	Parkton	MD
20372	Parkton	NC
20373	Parkville	MD
20374	Parlier	CA
20375	Parlin	CO
20376	Parlin	NJ
20377	Parma	ID
20378	Parma	MI
20379	Parma	MO
20380	Parmele	NC
20381	Parmelee	SD
20382	Parnell	IA
20383	Parnell	MO
20384	Paron	AR
20385	Parowan	UT
20386	Parrish	AL
20387	Parrish	FL
20388	Parrott	GA
20389	Parrott	VA
20390	Parrottsville	TN
20391	Parryville	PA
20392	Parshall	CO
20393	Parshall	ND
20394	Parsippany	NJ
20395	Parsons	KS
20396	Parsons	TN
20397	Parsons	WV
20398	Parsonsburg	MD
20399	Parsonsfield	ME
20400	Parthenon	AR
20401	Partlow	VA
20402	Partridge	KS
20403	Partridge	KY
20404	Pasadena	CA
20405	Pasadena	MD
20406	Pasadena	TX
20407	Pascagoula	MS
20408	Pasco	WA
20409	Pascoag	RI
20410	Paskenta	CA
20411	Paso Robles	CA
20412	Pass Christian	MS
20413	Passadumkeag	ME
20414	Passaic	NJ
20415	Passumpsic	VT
20416	Patagonia	AZ
20417	Pataskala	OH
20418	Patch Grove	WI
20419	Patchogue	NY
20420	Pateros	WA
20421	Paterson	NJ
20422	Paterson	WA
20423	Pathfork	KY
20424	Patoka	IL
20425	Patoka	IN
20426	Paton	IA
20427	Patrick	SC
20428	Patrick Afb	FL
20429	Patrick Springs	VA
20430	Patricksburg	IN
20431	Patriot	IN
20432	Patriot	OH
20433	Patten	ME
20434	Patterson	AR
20435	Patterson	CA
20436	Patterson	GA
20437	Patterson	IA
20438	Patterson	IL
20439	Patterson	LA
20440	Patterson	MO
20441	Patterson	NC
20442	Patterson	NY
20443	Pattersonville	NY
20444	Pattison	MS
20445	Pattison	TX
20446	Patton	CA
20447	Patton	MO
20448	Patton	PA
20449	Pattonsburg	MO
20450	Pattonville	TX
20451	Patuxent River	MD
20452	Paul	ID
20453	Paul Smiths	NY
20454	Paulden	AZ
20455	Paulding	MS
20456	Paulding	OH
20457	Paulina	LA
20458	Paulina	OR
20459	Pauline	SC
20460	Paullina	IA
20461	Pauls Valley	OK
20462	Paulsboro	NJ
20463	Pauma Valley	CA
20464	Paupack	PA
20465	Pavilion	NY
20466	Pavillion	WY
20467	Pavo	GA
20468	Paw Creek	NC
20469	Paw Paw	IL
20470	Paw Paw	MI
20471	Paw Paw	WV
20472	Pawcatuck	CT
20473	Pawhuska	OK
20474	Pawlet	VT
20475	Pawleys Island	SC
20476	Pawling	NY
20477	Pawnee	IL
20478	Pawnee	OK
20479	Pawnee	TX
20480	Pawnee City	NE
20481	Pawnee Rock	KS
20482	Pawtucket	RI
20483	Pax	WV
20484	Paxico	KS
20485	Paxinos	PA
20486	Paxton	FL
20487	Paxton	IL
20488	Paxton	IN
20489	Paxton	MA
20490	Paxton	NE
20491	Paxtonville	PA
20492	Payette	ID
20493	Payne	OH
20494	Paynes Creek	CA
20495	Paynesville	MN
20496	Paynesville	WV
20497	Payneville	KY
20498	Payson	AZ
20499	Payson	IL
20500	Payson	UT
20501	Pe Ell	WA
20502	Pea Ridge	AR
20503	Peabody	KS
20504	Peabody	MA
20505	Peace Dale	RI
20506	Peace Valley	MO
20507	Peach Bottom	PA
20508	Peach Creek	WV
20509	Peach Glen	PA
20510	Peach Orchard	AR
20511	Peach Springs	AZ
20512	Peacham	VT
20513	Peachland	NC
20514	Peachtree City	GA
20515	Peak	SC
20516	Peaks Island	ME
20517	Peapack	NJ
20518	Pearblossom	CA
20519	Pearce	AZ
20520	Pearces	MI
20521	Pearcy	AR
20522	Pearisburg	VA
20523	Pearl	IL
20524	Pearl	MS
20525	Pearl City	HI
20526	Pearl City	IL
20527	Pearl Harbor	HI
20528	Pearl River	LA
20529	Pearl River	NY
20530	Pearland	TX
20531	Pearlington	MS
20532	Pearsall	TX
20533	Pearson	GA
20534	Pearson	WI
20535	Pease	MN
20536	Peaster	TX
20537	Pebble Beach	CA
20538	Pecan Gap	TX
20539	Pecatonica	IL
20540	Peck	ID
20541	Peck	KS
20542	Peck	MI
20543	Pecks Mill	WV
20544	Peckville	PA
20545	Peconic	NY
20546	Pecos	NM
20547	Pecos	TX
20548	Peculiar	MO
20549	Pedricktown	NJ
20550	Pedro	OH
20551	Pedro Bay	AK
20552	Peebles	OH
20553	Peekskill	NY
20554	Peel	AR
20555	Peerless	MT
20556	Peetz	CO
20557	Peever	SD
20558	Peggs	OK
20559	Peggy	TX
20560	Pegram	TN
20561	Pekin	IL
20562	Pekin	IN
20563	Pekin	ND
20564	Pelahatchie	MS
20565	Pelham	AL
20566	Pelham	GA
20567	Pelham	NC
20568	Pelham	NH
20569	Pelham	NY
20570	Pelham	TN
20571	Pelican	AK
20572	Pelican	LA
20573	Pelican Lake	WI
20574	Pelican Rmeisterdish_serverds	MN
20575	Pelion	SC
20576	Pelkie	MI
20577	Pell City	AL
20578	Pell Lake	WI
20579	Pella	IA
20580	Pellston	MI
20581	Pellville	KY
20582	Pelsor	AR
20583	Pelzer	SC
20584	Pemaquid	ME
20585	Pemberton	MN
20586	Pemberton	NJ
20587	Pemberton	OH
20588	Pemberville	OH
20589	Pembina	ND
20590	Pembine	WI
20591	Pembroke	GA
20592	Pembroke	KY
20593	Pembroke	MA
20594	Pembroke	ME
20595	Pembroke	NC
20596	Pembroke	VA
20597	Pembroke Pines	FL
20598	Pen Argyl	PA
20599	Pena Blanca	NM
20600	Penasco	NM
20601	Pence Springs	WV
20602	Pencil Bluff	AR
20603	Pender	NE
20604	Pendergrass	GA
20605	Pendleton	IN
20606	Pendleton	KY
20607	Pendleton	NC
20608	Pendleton	OR
20609	Pendleton	SC
20610	Pendleton	TX
20611	Pendroy	MT
20612	Penelope	TX
20613	Penfield	IL
20614	Penfield	NY
20615	Penfield	PA
20616	Pengilly	MN
20617	Penhook	VA
20618	Peninsula	OH
20619	Penitas	TX
20620	Penland	NC
20621	Penn	ND
20622	Penn	PA
20623	Penn Laird	VA
20624	Penn Run	PA
20625	Penn Valley	CA
20626	Penn Yan	NY
20627	Pennellville	NY
20628	Penney Farms	FL
20629	Penngrove	CA
20630	Pennington	AL
20631	Pennington	MN
20632	Pennington	NJ
20633	Pennington	TX
20634	Pennington Gap	VA
20635	Pennock	MN
20636	Penns Creek	PA
20637	Penns Grove	NJ
20638	Penns Park	PA
20639	Pennsauken	NJ
20640	Pennsboro	WV
20641	Pennsburg	PA
20642	Pennsville	NJ
20643	Pennsylvania Furnace	PA
20644	Pennville	IN
20645	Penobscot	ME
20646	Penokee	KS
20647	Penrose	CO
20648	Penrose	NC
20649	Penryn	CA
20650	Penryn	PA
20651	Pensacola	FL
20652	Pentress	WV
20653	Pentwater	MI
20654	Penwell	TX
20655	Peoa	UT
20656	Peoria	AZ
20657	Peoria	IL
20658	Peoria Heights	IL
20659	Peosta	IA
20660	Peotone	IL
20661	Pep	NM
20662	Pep	TX
20663	Pepeekeo	HI
20664	Pepin	WI
20665	Pepperell	MA
20666	Pequabuck	CT
20667	Pequannock	NJ
20668	Pequea	PA
20669	Pequot Lakes	MN
20670	Peralta	NM
20671	Percival	IA
20672	Percy	IL
20673	Perdido	AL
20674	Perdue Hill	AL
20675	Perham	ME
20676	Perham	MN
20677	Peridot	AZ
20678	Perkasie	PA
20679	Perkins	GA
20680	Perkins	MI
20681	Perkins	MO
20682	Perkins	OK
20683	Perkinston	MS
20684	Perkinsville	NY
20685	Perkinsville	VT
20686	Perkiomenville	PA
20687	Perks	IL
20688	Perley	MN
20689	Perote	AL
20690	Perrin	TX
20691	Perrinton	MI
20692	Perris	CA
20693	Perronville	MI
20694	Perry	AR
20695	Perry	FL
20696	Perry	GA
20697	Perry	IA
20698	Perry	IL
20699	Perry	KS
20700	Perry	LA
20701	Perry	ME
20702	Perry	MI
20703	Perry	MO
20704	Perry	NY
20705	Perry	OH
20706	Perry	OK
20707	Perry Hall	MD
20708	Perry Park	KY
20709	Perry Point	MD
20710	Perryman	MD
20711	Perryopolis	PA
20712	Perrysburg	NY
20713	Perrysburg	OH
20714	Perrysville	IN
20715	Perrysville	OH
20716	Perryton	TX
20717	Perryville	AK
20718	Perryville	AR
20719	Perryville	KY
20720	Perryville	MD
20721	Perryville	MO
20722	Pershing	IN
20723	Persia	IA
20724	Perth	ND
20725	Perth Amboy	NJ
20726	Peru	IA
20727	Peru	IL
20728	Peru	IN
20729	Peru	KS
20730	Peru	ME
20731	Peru	NE
20732	Peru	NY
20733	Peru	VT
20734	Pescadero	CA
20735	Peshastin	WA
20736	Peshtigo	WI
20737	Pesotum	IL
20738	Petaca	NM
20739	Petal	MS
20740	Petaluma	CA
20741	Peterboro	NY
20742	Peterborough	NH
20743	Peterman	AL
20744	Petersburg	AK
20745	Petersburg	IL
20746	Petersburg	IN
20747	Petersburg	KY
20748	Petersburg	MI
20749	Petersburg	ND
20750	Petersburg	NE
20751	Petersburg	NY
20752	Petersburg	OH
20753	Petersburg	PA
20754	Petersburg	TN
20755	Petersburg	TX
20756	Petersburg	VA
20757	Petersburg	WV
20758	Petersham	MA
20759	Peterson	AL
20760	Peterson	IA
20761	Peterson	MN
20762	Peterstown	WV
20763	Petoskey	MI
20764	Petrey	AL
20765	Petrified Forest Natl Pk	AZ
20766	Petroleum	IN
20767	Petroleum	WV
20768	Petrolia	CA
20769	Petrolia	PA
20770	Petrolia	TX
20771	Petros	TN
20772	Pettibone	ND
20773	Pettigrew	AR
20774	Pettisville	OH
20775	Pettus	TX
20776	Petty	TX
20777	Pevely	MO
20778	Pewamo	MI
20779	Pewaukee	WI
20780	Pewee Valley	KY
20781	Peyton	CO
20782	Peytona	WV
20783	Pfafftown	NC
20784	Pfeifer	KS
20785	Pflugerville	TX
20786	Pharr	TX
20787	Pheba	MS
20788	Phelan	CA
20789	Phelps	KY
20790	Phelps	NY
20791	Phelps	WI
20792	Phenix	VA
20793	Phenix City	AL
20794	Phil Campbell	AL
20795	Philadelphia	MO
20796	Philadelphia	MS
20797	Philadelphia	NY
20798	Philadelphia	PA
20799	Philadelphia	TN
20800	Philip	SD
20801	Philipp	MS
20802	Philippi	WV
20803	Philipsburg	MT
20804	Philipsburg	PA
20805	Phillips	ME
20806	Phillips	NE
20807	Phillips	WI
20808	Phillipsburg	KS
20809	Phillipsburg	MO
20810	Phillipsburg	NJ
20811	Phillipsburg	OH
20812	Phillipsport	NY
20813	Phillipsville	CA
20814	Philmont	NY
20815	Philo	CA
20816	Philo	IL
20817	Philo	OH
20818	Philomath	OR
20819	Philomont	VA
20820	Philpot	KY
20821	Phippsburg	CO
20822	Phippsburg	ME
20823	Phlox	WI
20824	Phoenicia	NY
20825	Phoenix	AZ
20826	Phoenix	MD
20827	Phoenix	NY
20828	Phoenix	OR
20829	Phoenixville	PA
20830	Phyllis	KY
20831	Piasa	IL
20832	Picabo	ID
20833	Picacho	AZ
20834	Picacho	NM
20835	Picatinny Arsenal	NJ
20836	Picayune	MS
20837	Picher	OK
20838	Pickens	AR
20839	Pickens	MS
20840	Pickens	OK
20841	Pickens	SC
20842	Pickens	WV
20843	Pickerel	WI
20844	Pickering	MO
20845	Pickerington	OH
20846	Pickett	WI
20847	Pickford	MI
20848	Pickrell	NE
20849	Pickstown	SD
20850	Pickton	TX
20851	Pickwick Dam	TN
20852	Pico Rivera	CA
20853	Picture Rocks	PA
20854	Pie Town	NM
20855	Piedmont	AL
20856	Piedmont	CA
20857	Piedmont	KS
20858	Piedmont	MO
20859	Piedmont	OH
20860	Piedmont	OK
20861	Piedmont	SC
20862	Piedmont	SD
20863	Piedmont	WV
20864	Piedra	CA
20865	Pierce	CO
20866	Pierce	ID
20867	Pierce	NE
20868	Pierce	TX
20869	Pierce City	MO
20870	Piercefield	NY
20871	Pierceton	IN
20872	Pierceville	IN
20873	Pierceville	KS
20874	Piercy	CA
20875	Piermont	NH
20876	Piermont	NY
20877	Pierpont	OH
20878	Pierpont	SD
20879	Pierre	SD
20880	Pierre Part	LA
20881	Pierrepont Manor	NY
20882	Pierron	IL
20883	Pierson	FL
20884	Pierson	IA
20885	Pierson	MI
20886	Pierz	MN
20887	Piffard	NY
20888	Pigeon	MI
20889	Pigeon Falls	WI
20890	Pigeon Forge	TN
20891	Piggott	AR
20892	Pike	NH
20893	Pike	NY
20894	Pike Road	AL
20895	Pikesville	MD
20896	Piketon	OH
20897	Pikeville	KY
20898	Pikeville	NC
20899	Pikeville	TN
20900	Pilger	NE
20901	Pilgrim	KY
20902	Pilgrims Knob	VA
20903	Pillager	MN
20904	Pillow	PA
20905	Pillsbury	ND
20906	Pilot	VA
20907	Pilot Grove	IA
20908	Pilot Grove	MO
20909	Pilot Hill	CA
20910	Pilot Knob	MO
20911	Pilot Mound	IA
20912	Pilot Mountain	NC
20913	Pilot Point	AK
20914	Pilot Point	TX
20915	Pilot Rock	OR
20916	Pilot Station	AK
20917	Pilottown	LA
20918	Pima	AZ
20919	Pimento	IN
20920	Pinch	WV
20921	Pinckard	AL
20922	Pinckney	MI
20923	Pinckneyville	IL
20924	Pinconning	MI
20925	Pindall	AR
20926	Pine	AZ
20927	Pine	CO
20928	Pine Apple	AL
20929	Pine Beach	NJ
20930	Pine Bluff	AR
20931	Pine Bluffs	WY
20932	Pine Brook	NJ
20933	Pine Bush	NY
20934	Pine City	MN
20935	Pine City	NY
20936	Pine Forge	PA
20937	Pine Grove	CA
20938	Pine Grove	LA
20939	Pine Grove	PA
20940	Pine Grove	WV
20941	Pine Grove Mills	PA
20942	Pine Hall	NC
20943	Pine Hill	AL
20944	Pine Hill	NY
20945	Pine Island	MN
20946	Pine Island	NY
20947	Pine Knot	KY
20948	Pine Lake	GA
20949	Pine Level	AL
20950	Pine Level	NC
20951	Pine Meadow	CT
20952	Pine Mountain	GA
20953	Pine Mountain Valley	GA
20954	Pine Plains	NY
20955	Pine Prairie	LA
20956	Pine Ridge	KY
20957	Pine Ridge	SD
20958	Pine River	MN
20959	Pine River	WI
20960	Pine Top	KY
20961	Pine Valley	CA
20962	Pine Valley	NY
20963	Pine Valley	UT
20964	Pine Village	IN
20965	Pinebluff	NC
20966	Pinecliffe	CO
20967	Pinecrest	CA
20968	Pinedale	AZ
20969	Pinedale	WY
20970	Pinehill	NM
20971	Pinehurst	GA
20972	Pinehurst	ID
20973	Pinehurst	MA
20974	Pinehurst	NC
20975	Pinehurst	TX
20976	Pineland	FL
20977	Pineland	SC
20978	Pineland	TX
20979	Pinellas Park	FL
20980	Pineola	NC
20981	Pinesdale	MT
20982	Pinetop	AZ
20983	Pinetops	NC
20984	Pinetown	NC
20985	Pinetta	FL
20986	Pineview	GA
20987	Pineville	AR
20988	Pineville	KY
20989	Pineville	LA
20990	Pineville	MO
20991	Pineville	NC
20992	Pineville	PA
20993	Pineville	SC
20994	Pineville	WV
20995	Pinewood	SC
20996	Piney Creek	NC
20997	Piney Flats	TN
20998	Piney Fork	OH
20999	Piney Point	MD
21000	Piney River	VA
21001	Piney View	WV
21002	Piney Woods	MS
21003	Pingree	ID
21004	Pingree	ND
21005	Pink Hill	NC
21006	Pinnacle	NC
21007	Pinola	MS
21008	Pinole	CA
21009	Pinon	AZ
21010	Pinon	NM
21011	Pinon Hills	CA
21012	Pinopolis	SC
21013	Pinos Altos	NM
21014	Pinson	AL
21015	Pinson	TN
21016	Pinsonfork	KY
21017	Pinto	MD
21018	Pioche	NV
21019	Pioneer	CA
21020	Pioneer	LA
21021	Pioneer	OH
21022	Pioneer	TN
21023	Pioneertown	CA
21024	Piper City	IL
21025	Pipersville	PA
21026	Pipestem	WV
21027	Pipestone	MN
21028	Pippa Passes	KY
21029	Piqua	KS
21030	Piqua	OH
21031	Pirtleville	AZ
21032	Piru	CA
21033	Piscataway	NJ
21034	Piseco	NY
21035	Pisek	ND
21036	Pisgah	AL
21037	Pisgah	IA
21038	Pisgah Forest	NC
21039	Pismo Beach	CA
21040	Pitcairn	PA
21041	Pitcher	NY
21042	Pitkin	CO
21043	Pitkin	LA
21044	Pitman	NJ
21045	Pitman	PA
21046	Pitsburg	OH
21047	Pitts	GA
21048	Pittsboro	IN
21049	Pittsboro	MS
21050	Pittsboro	NC
21051	Pittsburg	CA
21052	Pittsburg	IL
21053	Pittsburg	KS
21054	Pittsburg	KY
21055	Pittsburg	MO
21056	Pittsburg	NH
21057	Pittsburg	OK
21058	Pittsburg	TX
21059	Pittsburgh	PA
21060	Pittsfield	IL
21061	Pittsfield	MA
21062	Pittsfield	ME
21063	Pittsfield	NH
21064	Pittsfield	PA
21065	Pittsfield	VT
21066	Pittsford	MI
21067	Pittsford	NY
21068	Pittsford	VT
21069	Pittston	PA
21070	Pittstown	NJ
21071	Pittsview	AL
21072	Pittsville	MD
21073	Pittsville	VA
21074	Pittsville	WI
21075	Pixley	CA
21076	Placedo	TX
21077	Placentia	CA
21078	Placerville	CA
21079	Placerville	CO
21080	Placerville	ID
21081	Placida	FL
21082	Placitas	NM
21083	Plain	WI
21084	Plain City	OH
21085	Plain Dealing	LA
21086	Plainfield	CT
21087	Plainfield	IA
21088	Plainfield	IL
21089	Plainfield	IN
21090	Plainfield	MA
21091	Plainfield	NH
21092	Plainfield	NJ
21093	Plainfield	OH
21094	Plainfield	PA
21095	Plainfield	VT
21096	Plainfield	WI
21097	Plains	GA
21098	Plains	KS
21099	Plains	MT
21100	Plains	TX
21101	Plainsboro	NJ
21102	Plainview	AR
21103	Plainview	MN
21104	Plainview	NE
21105	Plainview	NY
21106	Plainview	TX
21107	Plainville	CT
21108	Plainville	GA
21109	Plainville	IL
21110	Plainville	IN
21111	Plainville	KS
21112	Plainville	MA
21113	Plainville	NY
21114	Plainwell	MI
21115	Plaistow	NH
21116	Planada	CA
21117	Plankinton	SD
21118	Plano	IA
21119	Plano	IL
21120	Plano	TX
21121	Plant City	FL
21122	Plantersville	AL
21123	Plantersville	MS
21124	Plantersville	TX
21125	Plantsville	CT
21126	Plaquemine	LA
21127	Platina	CA
21128	Platinum	AK
21129	Plato	MN
21130	Plato	MO
21131	Plato Center	IL
21132	Platte	SD
21133	Platte Center	NE
21134	Platte City	MO
21135	Plattekill	NY
21136	Plattenville	LA
21137	Platter	OK
21138	Platteville	CO
21139	Platteville	WI
21140	Plattsburg	MO
21141	Plattsburgh	NY
21142	Plattsmouth	NE
21143	Plaucheville	LA
21144	Playa Del Rey	CA
21145	Playas	NM
21146	Plaza	ND
21147	Pleasant City	OH
21148	Pleasant Dale	NE
21149	Pleasant Garden	NC
21150	Pleasant Grove	AL
21151	Pleasant Grove	AR
21152	Pleasant Grove	CA
21153	Pleasant Grove	UT
21154	Pleasant Hall	PA
21155	Pleasant Hill	CA
21156	Pleasant Hill	IL
21157	Pleasant Hill	LA
21158	Pleasant Hill	MO
21159	Pleasant Hill	NC
21160	Pleasant Hill	OH
21161	Pleasant Hill	OR
21162	Pleasant Hill	TN
21163	Pleasant Hope	MO
21164	Pleasant Lake	IN
21165	Pleasant Lake	MI
21166	Pleasant Mills	IN
21167	Pleasant Mount	PA
21168	Pleasant Plain	OH
21169	Pleasant Plains	AR
21170	Pleasant Plains	IL
21171	Pleasant Prairie	WI
21172	Pleasant Ridge	MI
21173	Pleasant Shade	TN
21174	Pleasant Unity	PA
21175	Pleasant Valley	IA
21176	Pleasant Valley	NY
21177	Pleasant Valley	VA
21178	Pleasant View	CO
21179	Pleasant View	TN
21180	Pleasanton	CA
21181	Pleasanton	KS
21182	Pleasanton	NE
21183	Pleasanton	TX
21184	Pleasantville	IA
21185	Pleasantville	NJ
21186	Pleasantville	NY
21187	Pleasantville	OH
21188	Pleasantville	PA
21189	Pleasureville	KY
21190	Pledger	TX
21191	Plentywood	MT
21192	Plessis	NY
21193	Plevna	KS
21194	Plevna	MO
21195	Plevna	MT
21196	Plover	IA
21197	Plover	WI
21198	Pluckemin	NJ
21199	Plum	TX
21200	Plum Branch	SC
21201	Plum City	WI
21202	Plumerville	AR
21203	Plummer	ID
21204	Plummer	MN
21205	Plummers Landing	KY
21206	Plumsteadville	PA
21207	Plumtree	NC
21208	Plumville	PA
21209	Plush	OR
21210	Plymouth	CA
21211	Plymouth	CT
21212	Plymouth	FL
21213	Plymouth	IA
21214	Plymouth	IL
21215	Plymouth	IN
21216	Plymouth	MA
21217	Plymouth	ME
21218	Plymouth	MI
21219	Plymouth	NC
21220	Plymouth	NE
21221	Plymouth	NH
21222	Plymouth	NY
21223	Plymouth	OH
21224	Plymouth	PA
21225	Plymouth	UT
21226	Plymouth	VT
21227	Plymouth	WA
21228	Plymouth	WI
21229	Plymouth Meeting	PA
21230	Plympton	MA
21231	Poca	WV
21232	Pocahontas	AR
21233	Pocahontas	IA
21234	Pocahontas	IL
21235	Pocahontas	MO
21236	Pocahontas	MS
21237	Pocahontas	TN
21238	Pocahontas	VA
21239	Pocasset	MA
21240	Pocasset	OK
21241	Pocatello	ID
21242	Pocola	OK
21243	Pocomoke City	MD
21244	Pocono Lake	PA
21245	Pocono Lake Preserve	PA
21246	Pocono Manor	PA
21247	Pocono Pines	PA
21248	Pocono Summit	PA
21249	Pocopson	PA
21250	Poestenkill	NY
21251	Point	TX
21252	Point Arena	CA
21253	Point Baker	AK
21254	Point Clear	AL
21255	Point Comfort	TX
21256	Point Harbor	NC
21257	Point Hope	AK
21258	Point Lay	AK
21259	Point Lookout	MO
21260	Point Lookout	NY
21261	Point Marion	PA
21262	Point Mugu Nawc	CA
21263	Point Of Rocks	MD
21264	Point Of Rocks	WY
21265	Point Pleasant	PA
21266	Point Pleasant	WV
21267	Point Pleasant Beach	NJ
21268	Point Reyes Station	CA
21269	Point Roberts	WA
21270	Point Washington	FL
21271	Pointblank	TX
21272	Pointe A La Hache	LA
21273	Pointe Aux Pins	MI
21274	Points	WV
21275	Polacca	AZ
21276	Poland	IN
21277	Poland	ME
21278	Poland	NY
21279	Polaris	MT
21280	Polebridge	MT
21281	Polk	MO
21282	Polk	NE
21283	Polk	OH
21284	Polk	PA
21285	Polk City	FL
21286	Polk City	IA
21287	Polkton	NC
21288	Polkville	NC
21289	Pollard	AR
21290	Pollock	ID
21291	Pollock	LA
21292	Pollock	MO
21293	Pollock	SD
21294	Pollock Pines	CA
21295	Pollocksville	NC
21296	Pollok	TX
21297	Polo	IL
21298	Polo	MO
21299	Polson	MT
21300	Polvadera	NM
21301	Pomaria	SC
21302	Pomerene	AZ
21303	Pomeroy	IA
21304	Pomeroy	OH
21305	Pomeroy	PA
21306	Pomeroy	WA
21307	Pomfret	CT
21308	Pomfret	MD
21309	Pomfret Center	CT
21310	Pomona	CA
21311	Pomona	IL
21312	Pomona	KS
21313	Pomona	MO
21314	Pomona	NJ
21315	Pomona	NY
21316	Pomona Park	FL
21317	Pompano Beach	FL
21318	Pompeii	MI
21319	Pompey	NY
21320	Pompeys Pillar	MT
21321	Pompton Lakes	NJ
21322	Pompton Plains	NJ
21323	Ponca	AR
21324	Ponca	NE
21325	Ponca City	OK
21326	Ponce De Leon	FL
21327	Ponce De Leon	MO
21328	Poncha Springs	CO
21329	Ponchatoula	LA
21330	Pond Creek	OK
21331	Pond Eddy	NY
21332	Pond Gap	WV
21333	Ponder	TX
21334	Ponderay	ID
21335	Ponderosa	NM
21336	Ponemah	MN
21337	Poneto	IN
21338	Ponsford	MN
21339	Ponte Vedra	FL
21340	Ponte Vedra Beach	FL
21341	Pontiac	IL
21342	Pontiac	MI
21343	Pontiac	MO
21344	Pontotoc	MS
21345	Pontotoc	TX
21346	Pony	MT
21347	Pool	WV
21348	Poole	KY
21349	Pooler	GA
21350	Poolesville	MD
21351	Poolville	TX
21352	Pope	MS
21353	Pope A F B	NC
21354	Pope Valley	CA
21355	Popejoy	IA
21356	Poplar	MT
21357	Poplar	WI
21358	Poplar Bluff	MO
21359	Poplar Branch	NC
21360	Poplar Grove	AR
21361	Poplar Grove	IL
21362	Poplar Ridge	NY
21363	Poplarville	MS
21364	Poquonock	CT
21365	Poquoson	VA
21366	Porcupine	SD
21367	Port Alexander	AK
21368	Port Allegany	PA
21369	Port Allen	LA
21370	Port Alsworth	AK
21371	Port Angeles	WA
21372	Port Aransas	TX
21373	Port Arthur	TX
21374	Port Austin	MI
21375	Port Barre	LA
21376	Port Bolivar	TX
21377	Port Byron	IL
21378	Port Byron	NY
21379	Port Carbon	PA
21380	Port Charlotte	FL
21381	Port Chester	NY
21382	Port Clinton	OH
21383	Port Clinton	PA
21384	Port Clyde	ME
21385	Port Costa	CA
21386	Port Crane	NY
21387	Port Deposit	MD
21388	Port Edwards	WI
21389	Port Elizabeth	NJ
21390	Port Ewen	NY
21391	Port Gamble	WA
21392	Port Gibson	MS
21393	Port Gibson	NY
21394	Port Hadlock	WA
21395	Port Haywood	VA
21396	Port Heiden	AK
21397	Port Henry	NY
21398	Port Hope	MI
21399	Port Hueneme	CA
21400	Port Hueneme Cbc Base	CA
21401	Port Huron	MI
21402	Port Isabel	TX
21403	Port Jefferson	NY
21404	Port Jefferson	OH
21405	Port Jefferson Station	NY
21406	Port Jervis	NY
21407	Port Kent	NY
21408	Port Lavaca	TX
21409	Port Leyden	NY
21410	Port Lions	AK
21411	Port Ludlow	WA
21412	Port Mansfield	TX
21413	Port Matilda	PA
21414	Port Monmouth	NJ
21415	Port Murray	NJ
21416	Port Neches	TX
21417	Port Norris	NJ
21418	Port O Connor	TX
21419	Port Orange	FL
21420	Port Orchard	WA
21421	Port Orford	OR
21422	Port Penn	DE
21423	Port Reading	NJ
21424	Port Republic	MD
21425	Port Republic	NJ
21426	Port Republic	VA
21427	Port Richey	FL
21428	Port Royal	KY
21429	Port Royal	PA
21430	Port Royal	SC
21431	Port Royal	VA
21432	Port Saint Joe	FL
21433	Port Saint Lucie	FL
21434	Port Salerno	FL
21435	Port Sanilac	MI
21436	Port Sulphur	LA
21437	Port Tobacco	MD
21438	Port Townsend	WA
21439	Port Trevorton	PA
21440	Port Washington	NY
21441	Port Washington	OH
21442	Port Washington	WI
21443	Port William	OH
21444	Port Wing	WI
21445	Portage	IN
21446	Portage	ME
21447	Portage	MI
21448	Portage	OH
21449	Portage	PA
21450	Portage	UT
21451	Portage	WI
21452	Portage Des Sioux	MO
21453	Portageville	MO
21454	Portageville	NY
21455	Portal	GA
21456	Portal	ND
21457	Portales	NM
21458	Porter	ME
21459	Porter	MN
21460	Porter	OK
21461	Porter	TX
21462	Porter Corners	NY
21463	Porter Ranch	CA
21464	Porterdale	GA
21465	Porterfield	WI
21466	Porters Falls	WV
21467	Porters Sideling	PA
21468	Portersville	PA
21469	Porterville	CA
21470	Porterville	MS
21471	Porthill	ID
21472	Portia	AR
21473	Portis	KS
21474	Portland	AR
21475	Portland	CT
21476	Portland	IN
21477	Portland	ME
21478	Portland	MI
21479	Portland	MO
21480	Portland	ND
21481	Portland	NY
21482	Portland	OH
21483	Portland	OR
21484	Portland	PA
21485	Portland	TN
21486	Portland	TX
21487	Portlandville	NY
21488	Portola	CA
21489	Portola Vally	CA
21490	Portsmouth	IA
21491	Portsmouth	NH
21492	Portsmouth	OH
21493	Portsmouth	RI
21494	Portsmouth	VA
21495	Portville	NY
21496	Porum	OK
21497	Posen	IL
21498	Posen	MI
21499	Posey	CA
21500	Poseyville	IN
21501	Post	OR
21502	Post	TX
21503	Post Falls	ID
21504	Post Mills	VT
21505	Poston	AZ
21506	Postville	IA
21507	Poteau	OK
21508	Potecasi	NC
21509	Poteet	TX
21510	Poth	TX
21511	Potlatch	ID
21512	Potomac	IL
21513	Potomac	MD
21514	Potosi	MO
21515	Potosi	WI
21516	Potrero	CA
21517	Potsdam	NY
21518	Potsdam	OH
21519	Potter	KS
21520	Potter	NE
21521	Potter	WI
21522	Potter Valley	CA
21523	Pottersdale	PA
21524	Pottersville	MO
21525	Pottersville	NJ
21526	Pottersville	NY
21527	Potterville	MI
21528	Potts Camp	MS
21529	Potts Grove	PA
21530	Pottsboro	TX
21531	Pottstown	PA
21532	Pottsville	AR
21533	Pottsville	PA
21534	Pottsville	TX
21535	Potwin	KS
21536	Poughkeepsie	AR
21537	Poughkeepsie	NY
21538	Poughquag	NY
21539	Poulan	GA
21540	Poulsbo	WA
21541	Poultney	VT
21542	Pound	VA
21543	Pound	WI
21544	Pound Ridge	NY
21545	Pounding Mill	VA
21546	Poway	CA
21547	Powder River	WY
21548	Powder Springs	GA
21549	Powder Springs	TN
21550	Powderhorn	CO
21551	Powderly	KY
21552	Powderly	TX
21553	Powderville	MT
21554	Powell	MO
21555	Powell	OH
21556	Powell	TN
21557	Powell	TX
21558	Powell	WY
21559	Powell Butte	OR
21560	Powells Point	NC
21561	Powellsville	NC
21562	Powellton	WV
21563	Powellville	MD
21564	Power	MT
21565	Powers	MI
21566	Powers	OR
21567	Powers Lake	ND
21568	Powers Lake	WI
21569	Powersite	MO
21570	Powersville	MO
21571	Powhatan	AR
21572	Powhatan	LA
21573	Powhatan	VA
21574	Powhatan Point	OH
21575	Powhattan	KS
21576	Pownal	ME
21577	Pownal	VT
21578	Poy Sippi	WI
21579	Poyen	AR
21580	Poynette	WI
21581	Poynor	TX
21582	Poyntelle	PA
21583	Prague	NE
21584	Prague	OK
21585	Prairie	MS
21586	Prairie City	IA
21587	Prairie City	IL
21588	Prairie City	OR
21589	Prairie City	SD
21590	Prairie Creek	IN
21591	Prairie Du Chien	WI
21592	Prairie Du Rocher	IL
21593	Prairie Du Sac	WI
21594	Prairie Farm	WI
21595	Prairie Grove	AR
21596	Prairie Hill	TX
21597	Prairie Home	MO
21598	Prairie Lea	TX
21599	Prairie View	KS
21600	Prairie View	TX
21601	Prairie Village	KS
21602	Prairieburg	IA
21603	Prairieton	IN
21604	Prairieville	LA
21605	Prather	CA
21606	Pratt	KS
21607	Pratt	WV
21608	Pratts	VA
21609	Prattsburgh	NY
21610	Prattsville	AR
21611	Prattsville	NY
21612	Prattville	AL
21613	Pray	MT
21614	Preble	IN
21615	Preble	NY
21616	Preemption	IL
21617	Premier	WV
21618	Premium	KY
21619	Premont	TX
21620	Prentice	WI
21621	Prentiss	MS
21622	Prescott	AR
21623	Prescott	AZ
21624	Prescott	IA
21625	Prescott	KS
21626	Prescott	MI
21627	Prescott	WA
21628	Prescott	WI
21629	Prescott Valley	AZ
21630	Presho	SD
21631	Presidio	TX
21632	Presque Isle	ME
21633	Presque Isle	MI
21634	Presque Isle	WI
21635	Presto	PA
21636	Preston	CT
21637	Preston	GA
21638	Preston	IA
21639	Preston	ID
21640	Preston	KY
21641	Preston	MD
21642	Preston	MN
21643	Preston	MO
21644	Preston	MS
21645	Preston	OK
21646	Preston	WA
21647	Preston Hollow	NY
21648	Preston Park	PA
21649	Prestonsburg	KY
21650	Pretty Prairie	KS
21651	Prewitt	NM
21652	Price	MD
21653	Price	TX
21654	Price	UT
21655	Pricedale	PA
21656	Prichard	WV
21657	Priddy	TX
21658	Pride	LA
21659	Prides Crossing	MA
21660	Priest River	ID
21661	Prim	AR
21662	Primghar	IA
21663	Primm Springs	TN
21664	Primrose	KY
21665	Primrose	NE
21666	Prince	WV
21667	Prince Frederick	MD
21668	Prince George	VA
21669	Princess Anne	MD
21670	Princeton	AL
21671	Princeton	CA
21672	Princeton	IA
21673	Princeton	ID
21674	Princeton	IL
21675	Princeton	IN
21676	Princeton	KS
21677	Princeton	KY
21678	Princeton	LA
21679	Princeton	MA
21680	Princeton	ME
21681	Princeton	MN
21682	Princeton	MO
21683	Princeton	NC
21684	Princeton	NJ
21685	Princeton	OR
21686	Princeton	TX
21687	Princeton	WI
21688	Princeton	WV
21689	Princeville	HI
21690	Princeville	IL
21691	Princewick	WV
21692	Prineville	OR
21693	Pringle	SD
21694	Prinsburg	MN
21695	Printer	KY
21696	Prior Lake	MN
21697	Pritchett	CO
21698	Proberta	CA
21699	Procious	WV
21700	Proctor	AR
21701	Proctor	MT
21702	Proctor	OK
21703	Proctor	TX
21704	Proctor	VT
21705	Proctor	WV
21706	Proctorsville	VT
21707	Proctorville	NC
21708	Proctorville	OH
21709	Progreso	TX
21710	Prole	IA
21711	Promise City	IA
21712	Prompton	PA
21713	Prophetstown	IL
21714	Prospect	CT
21715	Prospect	KY
21716	Prospect	NY
21717	Prospect	OH
21718	Prospect	OR
21719	Prospect	PA
21720	Prospect	TN
21721	Prospect	VA
21722	Prospect Harbor	ME
21723	Prospect Heights	IL
21724	Prospect Hill	NC
21725	Prospect Park	PA
21726	Prosper	TX
21727	Prosperity	PA
21728	Prosperity	SC
21729	Prosperity	WV
21730	Prosser	WA
21731	Protection	KS
21732	Protem	MO
21733	Protivin	IA
21734	Provencal	LA
21735	Providence	KY
21736	Providence	NC
21737	Providence	RI
21738	Providence	UT
21739	Providence Forge	VA
21740	Provincetown	MA
21741	Provo	UT
21742	Pruden	TN
21743	Prudence Island	RI
21744	Prudenville	MI
21745	Prudhoe Bay	AK
21746	Prue	OK
21747	Pryor	MT
21748	Pryor	OK
21749	Puckett	MS
21750	Pueblo	CO
21751	Pueblo Of Acoma	NM
21752	Pukalani	HI
21753	Pukwana	SD
21754	Pulaski	GA
21755	Pulaski	IA
21756	Pulaski	IL
21757	Pulaski	MS
21758	Pulaski	NY
21759	Pulaski	PA
21760	Pulaski	TN
21761	Pulaski	VA
21762	Pulaski	WI
21763	Pullman	MI
21764	Pullman	WA
21765	Pullman	WV
21766	Pulteney	NY
21767	Pultneyville	NY
21768	Pungoteague	VA
21769	Punta Gorda	FL
21770	Punxsutawney	PA
21771	Puposky	MN
21772	Purcell	MO
21773	Purcell	OK
21774	Purcellville	VA
21775	Purchase	NY
21776	Purdin	MO
21777	Purdon	TX
21778	Purdum	NE
21779	Purdy	MO
21780	Purdys	NY
21781	Purgitsville	WV
21782	Purlear	NC
21783	Purling	NY
21784	Purmela	TX
21785	Pursglove	WV
21786	Purvis	MS
21787	Puryear	TN
21788	Put In Bay	OH
21789	Putnam	CT
21790	Putnam	IL
21791	Putnam	OK
21792	Putnam	TX
21793	Putnam Hall	FL
21794	Putnam Station	NY
21795	Putnam Valley	NY
21796	Putnamville	IN
21797	Putney	GA
21798	Putney	KY
21799	Putney	VT
21800	Puunene	HI
21801	Puxico	MO
21802	Puyallup	WA
21803	Pyatt	AR
21804	Pylesville	MD
21805	Pyote	TX
21806	Pyrites	NY
21807	Quail	TX
21808	Quakake	PA
21809	Quaker City	OH
21810	Quaker Hill	CT
21811	Quaker Street	NY
21812	Quakertown	NJ
21813	Quakertown	PA
21814	Quanah	TX
21815	Quantico	MD
21816	Quantico	VA
21817	Quapaw	OK
21818	Quarryville	PA
21819	Quartzsite	AZ
21820	Quasqueton	IA
21821	Quay	NM
21822	Quebeck	TN
21823	Quechee	VT
21824	Quecreek	PA
21825	Queen	PA
21826	Queen Anne	MD
21827	Queen City	MO
21828	Queen City	TX
21829	Queen Creek	AZ
21830	Queens Village	NY
21831	Queensbury	NY
21832	Queenstown	MD
21833	Quemado	NM
21834	Quemado	TX
21835	Quenemo	KS
21836	Quentin	PA
21837	Questa	NM
21838	Quicksburg	VA
21839	Quilcene	WA
21840	Quimby	IA
21841	Quinault	WA
21842	Quinby	VA
21843	Quincy	CA
21844	Quincy	FL
21845	Quincy	IL
21846	Quincy	IN
21847	Quincy	KY
21848	Quincy	MA
21849	Quincy	MI
21850	Quincy	MO
21851	Quincy	OH
21852	Quincy	PA
21853	Quincy	WA
21854	Quinebaug	CT
21855	Quinhagak	AK
21856	Quinlan	TX
21857	Quinn	SD
21858	Quinnesec	MI
21859	Quinque	VA
21860	Quinter	KS
21861	Quinton	AL
21862	Quinton	NJ
21863	Quinton	OK
21864	Quinton	VA
21865	Quinwood	WV
21866	Quitaque	TX
21867	Quitman	AR
21868	Quitman	GA
21869	Quitman	LA
21870	Quitman	MS
21871	Quitman	TX
21872	Qulin	MO
21873	Quogue	NY
21874	Rabun Gap	GA
21875	Raccoon	KY
21876	Raceland	LA
21877	Rachel	WV
21878	Racine	MN
21879	Racine	MO
21880	Racine	OH
21881	Racine	WI
21882	Racine	WV
21883	Rackerby	CA
21884	Radcliff	KY
21885	Radcliffe	IA
21886	Radersburg	MT
21887	Radford	VA
21888	Radiant	VA
21889	Radisson	WI
21890	Radium Springs	NM
21891	Radnor	OH
21892	Radom	IL
21893	Raeford	NC
21894	Ragan	NE
21895	Ragland	AL
21896	Ragland	WV
21897	Ragley	LA
21898	Ragsdale	IN
21899	Rahway	NJ
21900	Raiford	FL
21901	Rail Road Flat	CA
21902	Railroad	PA
21903	Rainbow	TX
21904	Rainbow Lake	NY
21905	Rainelle	WV
21906	Rainier	OR
21907	Rainier	WA
21908	Rains	SC
21909	Rainsville	AL
21910	Rainsville	NM
21911	Raisin City	CA
21912	Rake	IA
21913	Raleigh	IL
21914	Raleigh	MS
21915	Raleigh	NC
21916	Raleigh	ND
21917	Raleigh	WV
21918	Ralls	TX
21919	Ralph	AL
21920	Ralph	MI
21921	Ralph	SD
21922	Ralston	IA
21923	Ralston	OK
21924	Ralston	PA
21925	Ralston	WY
21926	Ramah	CO
21927	Ramah	NM
21928	Ramer	AL
21929	Ramer	TN
21930	Ramey	PA
21931	Ramona	CA
21932	Ramona	KS
21933	Ramona	OK
21934	Ramona	SD
21935	Rampart	AK
21936	Ramsay	MI
21937	Ramsay	MT
21938	Ramseur	NC
21939	Ramsey	IL
21940	Ramsey	IN
21941	Ramsey	NJ
21942	Ranburne	AL
21943	Ranchester	WY
21944	Ranchita	CA
21945	Rancho Cordova	CA
21946	Rancho Cucamonga	CA
21947	Rancho Mirage	CA
21948	Rancho Palos Verdes	CA
21949	Rancho Santa Fe	CA
21950	Rancho Santa Margarita	CA
21951	Ranchos De Taos	NM
21952	Rancocas	NJ
21953	Rand	CO
21954	Randalia	IA
21955	Randall	IA
21956	Randall	KS
21957	Randall	MN
21958	Randallstown	MD
21959	Randle	WA
21960	Randleman	NC
21961	Randlett	OK
21962	Randlett	UT
21963	Randolph	AL
21964	Randolph	IA
21965	Randolph	KS
21966	Randolph	MA
21967	Randolph	ME
21968	Randolph	MN
21969	Randolph	MS
21970	Randolph	NE
21971	Randolph	NH
21972	Randolph	NJ
21973	Randolph	NY
21974	Randolph	OH
21975	Randolph	TX
21976	Randolph	UT
21977	Randolph	VA
21978	Randolph	VT
21979	Randolph	WI
21980	Randolph Center	VT
21981	Random Lake	WI
21982	Randsburg	CA
21983	Range	AL
21984	Rangeley	ME
21985	Rangely	CO
21986	Ranger	GA
21987	Ranger	TX
21988	Ranger	WV
21989	Ranier	MN
21990	Rankin	IL
21991	Rankin	TX
21992	Ransom	IL
21993	Ransom	KS
21994	Ransom	KY
21995	Ransom	PA
21996	Ransom Canyon	TX
21997	Ransomville	NY
21998	Ranson	WV
21999	Rantoul	IL
22000	Rantoul	KS
22001	Rapelje	MT
22002	Raphine	VA
22003	Rmeisterdish_serverd City	MI
22004	Rmeisterdish_serverd City	SD
22005	Rmeisterdish_serverd River	MI
22006	Rmeisterdish_serverdan	VA
22007	Rmeisterdish_serverds City	IL
22008	Rappahannock Academy	VA
22009	Raquette Lake	NY
22010	Rarden	OH
22011	Raritan	IL
22012	Raritan	NJ
22013	Ratcliff	AR
22014	Ratcliff	TX
22015	Rathdrum	ID
22016	Ratliff City	OK
22017	Raton	NM
22018	Rattan	OK
22019	Ravalli	MT
22020	Raven	KY
22021	Raven	VA
22022	Ravena	NY
22023	Ravencliff	WV
22024	Ravendale	CA
22025	Ravenden	AR
22026	Ravenden Springs	AR
22027	Ravenel	SC
22028	Ravenna	KY
22029	Ravenna	MI
22030	Ravenna	NE
22031	Ravenna	OH
22032	Ravenna	TX
22033	Ravensdale	WA
22034	Ravenswood	WV
22035	Ravenwood	MO
22036	Ravia	OK
22037	Ravine	PA
22038	Rawl	WV
22039	Rawlings	MD
22040	Rawlings	VA
22041	Rawlins	WY
22042	Rawson	OH
22043	Ray	MI
22044	Ray	ND
22045	Ray	OH
22046	Ray Brook	NY
22047	Ray City	GA
22048	Rayland	OH
22049	Rayle	GA
22050	Raymond	CA
22051	Raymond	IA
22052	Raymond	IL
22053	Raymond	KS
22054	Raymond	ME
22055	Raymond	MN
22056	Raymond	MS
22057	Raymond	MT
22058	Raymond	NE
22059	Raymond	NH
22060	Raymond	OH
22061	Raymond	SD
22062	Raymond	WA
22063	Raymondville	MO
22064	Raymondville	NY
22065	Raymondville	TX
22066	Raymore	MO
22067	Rayne	LA
22068	Raynesford	MT
22069	Raynham	MA
22070	Raynham Center	MA
22071	Raysal	WV
22072	Rayville	LA
22073	Rayville	MO
22074	Raywick	KY
22075	Raywood	TX
22076	Rea	MO
22077	Reader	WV
22078	Readfield	ME
22079	Readfield	WI
22080	Reading	KS
22081	Reading	MA
22082	Reading	MI
22083	Reading	MN
22084	Reading	PA
22085	Reading	VT
22086	Reading Center	NY
22087	Readington	NJ
22088	Readlyn	IA
22089	Reads Landing	MN
22090	Readsboro	VT
22091	Readstown	WI
22092	Readville	MA
22093	Readyville	TN
22094	Reagan	TN
22095	Reagan	TX
22096	Realitos	TX
22097	Reamstown	PA
22098	Reardan	WA
22099	Reasnor	IA
22100	Rebecca	GA
22101	Rebersburg	PA
22102	Rebuck	PA
22103	Recluse	WY
22104	Rector	AR
22105	Rector	PA
22106	Rectortown	VA
22107	Red Ash	VA
22108	Red Bank	NJ
22109	Red Banks	MS
22110	Red Bay	AL
22111	Red Bluff	CA
22112	Red Boiling Springs	TN
22113	Red Bud	IL
22114	Red Cliff	CO
22115	Red Cloud	NE
22116	Red Creek	NY
22117	Red Creek	WV
22118	Red Devil	AK
22119	Red Feather Lakes	CO
22120	Red Hill	PA
22121	Red Hook	NY
22122	Red House	VA
22123	Red House	WV
22124	Red Jacket	WV
22125	Red Lake Falls	MN
22126	Red Level	AL
22127	Red Lion	PA
22128	Red Lodge	MT
22129	Red Mountain	CA
22130	Red Oak	GA
22131	Red Oak	IA
22132	Red Oak	NC
22133	Red Oak	OK
22134	Red Oak	TX
22135	Red Oak	VA
22136	Red River	NM
22137	Red Rock	AZ
22138	Red Rock	OK
22139	Red Rock	TX
22140	Red Springs	NC
22141	Red Valley	AZ
22142	Red Wing	MN
22143	Redan	GA
22144	Redbird	OK
22145	Redby	MN
22146	Redcrest	CA
22147	Reddell	LA
22148	Reddick	FL
22149	Reddick	IL
22150	Redding	CA
22151	Redding	CT
22152	Redding	IA
22153	Redding Center	CT
22154	Redding Ridge	CT
22155	Redfield	AR
22156	Redfield	IA
22157	Redfield	KS
22158	Redfield	NY
22159	Redfield	SD
22160	Redford	MI
22161	Redford	MO
22162	Redford	NY
22163	Redford	TX
22164	Redfox	KY
22165	Redgranite	WI
22166	Redig	SD
22167	Redkey	IN
22168	Redlake	MN
22169	Redlands	CA
22170	Redmon	IL
22171	Redmond	OR
22172	Redmond	UT
22173	Redmond	WA
22174	Redondo	WA
22175	Redondo Beach	CA
22176	Redrock	NM
22177	Redstar	WV
22178	Redstone	MT
22179	Redvale	CO
22180	Redwater	TX
22181	Redway	CA
22182	Redwood	MS
22183	Redwood	NY
22184	Redwood	VA
22185	Redwood City	CA
22186	Redwood Estates	CA
22187	Redwood Falls	MN
22188	Redwood Valley	CA
22189	Ree Heights	SD
22190	Reed	KY
22191	Reed City	MI
22192	Reed Point	MT
22193	Reeder	ND
22194	Reeders	PA
22195	Reedley	CA
22196	Reeds	MO
22197	Reeds Spring	MO
22198	Reedsburg	WI
22199	Reedsport	OR
22200	Reedsville	OH
22201	Reedsville	PA
22202	Reedsville	WI
22203	Reedsville	WV
22204	Reedville	VA
22205	Reedy	WV
22206	Reelsville	IN
22207	Reese	MI
22208	Reeseville	WI
22209	Reesville	OH
22210	Reeves	LA
22211	Reevesville	SC
22212	Reform	AL
22213	Refton	PA
22214	Refugio	TX
22215	Regan	ND
22216	Regent	ND
22217	Regina	KY
22218	Regina	NM
22219	Register	GA
22220	Rego Park	NY
22221	Rehobeth	MD
22222	Rehoboth	MA
22223	Rehoboth	NM
22224	Rehoboth Beach	DE
22225	Rehrersburg	PA
22226	Reidsville	GA
22227	Reidsville	NC
22228	Reidville	SC
22229	Reinbeck	IA
22230	Reinholds	PA
22231	Reisterstown	MD
22232	Reklaw	TX
22233	Reliance	SD
22234	Reliance	TN
22235	Reliance	WY
22236	Rembert	SC
22237	Rembrandt	IA
22238	Remer	MN
22239	Remington	IN
22240	Remington	VA
22241	Remlap	AL
22242	Remsen	IA
22243	Remsen	NY
22244	Remsenburg	NY
22245	Remus	MI
22246	Rena Lara	MS
22247	Renault	IL
22248	Renfrew	PA
22249	Renfro Valley	KY
22250	Renick	MO
22251	Renick	WV
22252	Renner	SD
22253	Reno	NV
22254	Reno	OH
22255	Reno	PA
22256	Renovo	PA
22257	Rensselaer	IN
22258	Rensselaer	NY
22259	Rensselaer Falls	NY
22260	Rensselaerville	NY
22261	Rentiesville	OK
22262	Renton	WA
22263	Rentz	GA
22264	Renville	MN
22265	Renwick	IA
22266	Represa	CA
22267	Repton	AL
22268	Republic	KS
22269	Republic	MI
22270	Republic	MO
22271	Republic	OH
22272	Republic	PA
22273	Republic	WA
22274	Republican City	NE
22275	Resaca	GA
22276	Rescue	CA
22277	Rescue	VA
22278	Research Triangle Park	NC
22279	Reseda	CA
22280	Reserve	LA
22281	Reserve	MT
22282	Reserve	NM
22283	Reston	VA
22284	Retsil	WA
22285	Retsof	NY
22286	Reubens	ID
22287	Reva	SD
22288	Reva	VA
22289	Revelo	KY
22290	Revere	MA
22291	Revere	MN
22292	Revere	MO
22293	Revere	PA
22294	Revillo	SD
22295	Revloc	PA
22296	Rew	PA
22297	Rewey	WI
22298	Rex	GA
22299	Rex	NC
22300	Rexburg	ID
22301	Rexford	KS
22302	Rexford	MT
22303	Rexford	NY
22304	Rexmont	PA
22305	Rexville	NY
22306	Reydell	AR
22307	Reydon	OK
22308	Reyno	AR
22309	Reynolds	GA
22310	Reynolds	IL
22311	Reynolds	IN
22312	Reynolds	MO
22313	Reynolds	ND
22314	Reynolds	NE
22315	Reynolds Station	KY
22316	Reynoldsburg	OH
22317	Reynoldsville	PA
22318	Reynoldsville	WV
22319	Rhame	ND
22320	Rheems	PA
22321	Rhine	GA
22322	Rhinebeck	NY
22323	Rhinecliff	NY
22324	Rhinehart	LA
22325	Rhineland	MO
22326	Rhinelander	WI
22327	Rhoadesville	VA
22328	Rhodelia	KY
22329	Rhodell	WV
22330	Rhodes	IA
22331	Rhodes	MI
22332	Rhodesdale	MD
22333	Rhodhiss	NC
22334	Rhododendron	OR
22335	Rhome	TX
22336	Rialto	CA
22337	Rib Lake	WI
22338	Ribera	NM
22339	Rice	MN
22340	Rice	TX
22341	Rice	VA
22342	Rice	WA
22343	Rice Lake	WI
22344	Riceboro	GA
22345	Rices Landing	PA
22346	Ricetown	KY
22347	Riceville	IA
22348	Riceville	PA
22349	Riceville	TN
22350	Rich Creek	VA
22351	Rich Hill	MO
22352	Rich Square	NC
22353	Richards	MO
22354	Richards	TX
22355	Richardson	TX
22356	Richardsville	VA
22357	Richardton	ND
22358	Richboro	PA
22359	Richburg	NY
22360	Richburg	SC
22361	Richey	MT
22362	Richeyville	PA
22363	Richfield	ID
22364	Richfield	KS
22365	Richfield	NC
22366	Richfield	OH
22367	Richfield	PA
22368	Richfield	UT
22369	Richfield	WI
22370	Richfield Springs	NY
22371	Richford	NY
22372	Richford	VT
22373	Richgrove	CA
22374	Richland	GA
22375	Richland	IA
22376	Richland	IN
22377	Richland	MI
22378	Richland	MO
22379	Richland	MS
22380	Richland	MT
22381	Richland	NJ
22382	Richland	NY
22383	Richland	OR
22384	Richland	PA
22385	Richland	SC
22386	Richland	TX
22387	Richland	WA
22388	Richland Center	WI
22389	Richland Springs	TX
22390	Richlands	NC
22391	Richlands	VA
22392	Richlandtown	PA
22393	Richmond	CA
22394	Richmond	IL
22395	Richmond	IN
22396	Richmond	KS
22397	Richmond	KY
22398	Richmond	MA
22399	Richmond	ME
22400	Richmond	MI
22401	Richmond	MN
22402	Richmond	MO
22403	Richmond	OH
22404	Richmond	TX
22405	Richmond	UT
22406	Richmond	VA
22407	Richmond	VT
22408	Richmond Dale	OH
22409	Richmond Hill	GA
22410	Richmond Hill	NY
22411	Richmondville	NY
22412	Richton	MS
22413	Richton Park	IL
22414	Richvale	CA
22415	Richview	IL
22416	Richville	MI
22417	Richville	MN
22418	Richville	NY
22419	Richwood	MN
22420	Richwood	NJ
22421	Richwood	OH
22422	Richwood	WV
22423	Richwoods	MO
22424	Ricketts	IA
22425	Rickman	TN
22426	Rickreall	OR
22427	Rico	CO
22428	Riddle	OR
22429	Riddlesburg	PA
22430	Riddleton	TN
22431	Riderwood	MD
22432	Ridge	MD
22433	Ridge	NY
22434	Ridge Farm	IL
22435	Ridge Spring	SC
22436	Ridgecrest	CA
22437	Ridgecrest	NC
22438	Ridgedale	MO
22439	Ridgefield	CT
22440	Ridgefield	NJ
22441	Ridgefield	WA
22442	Ridgefield Park	NJ
22443	Ridgeland	MS
22444	Ridgeland	SC
22445	Ridgeland	WI
22446	Ridgeley	WV
22447	Ridgely	MD
22448	Ridgely	TN
22449	Ridgetop	TN
22450	Ridgeview	SD
22451	Ridgeview	WV
22452	Ridgeville	IN
22453	Ridgeville	SC
22454	Ridgeville Corners	OH
22455	Ridgeway	IA
22456	Ridgeway	MO
22457	Ridgeway	NC
22458	Ridgeway	OH
22459	Ridgeway	SC
22460	Ridgeway	VA
22461	Ridgeway	WI
22462	Ridgeway	WV
22463	Ridgewood	NJ
22464	Ridgewood	NY
22465	Ridgway	CO
22466	Ridgway	IL
22467	Ridgway	PA
22468	Ridley Park	PA
22469	Ridott	IL
22470	Riegelsville	PA
22471	Riegelwood	NC
22472	Rienzi	MS
22473	Riesel	TX
22474	Rifle	CO
22475	Rifton	NY
22476	Riga	MI
22477	Rigby	ID
22478	Riggins	ID
22479	Riley	IN
22480	Riley	KS
22481	Riley	OR
22482	Rileyville	VA
22483	Rillito	AZ
22484	Rillton	PA
22485	Rimersburg	PA
22486	Rimforest	CA
22487	Rimrock	AZ
22488	Rinard	IL
22489	Rincon	GA
22490	Rincon	NM
22491	Rindge	NH
22492	Riner	VA
22493	Rineyville	KY
22494	Ringgold	GA
22495	Ringgold	LA
22496	Ringgold	PA
22497	Ringgold	TX
22498	Ringgold	VA
22499	Ringle	WI
22500	Ringling	MT
22501	Ringling	OK
22502	Ringoes	NJ
22503	Ringold	OK
22504	Ringsted	IA
22505	Ringtown	PA
22506	Ringwood	IL
22507	Ringwood	NJ
22508	Ringwood	OK
22509	Rio	IL
22510	Rio	WI
22511	Rio	WV
22512	Rio Dell	CA
22513	Rio Frio	TX
22514	Rio Grande	NJ
22515	Rio Grande	OH
22516	Rio Grande City	TX
22517	Rio Hondo	TX
22518	Rio Linda	CA
22519	Rio Medina	TX
22520	Rio Nido	CA
22521	Rio Oso	CA
22522	Rio Rancho	NM
22523	Rio Rico	AZ
22524	Rio Verde	AZ
22525	Rio Vista	CA
22526	Rio Vista	TX
22527	Rion	SC
22528	Riparius	NY
22529	Ripley	MS
22530	Ripley	NY
22531	Ripley	OH
22532	Ripley	OK
22533	Ripley	TN
22534	Ripley	WV
22535	Ripon	CA
22536	Ripon	WI
22537	Rippey	IA
22538	Ripplemead	VA
22539	Rippon	WV
22540	Ripton	VT
22541	Ririe	ID
22542	Risco	MO
22543	Rising City	NE
22544	Rising Fawn	GA
22545	Rising Star	TX
22546	Rising Sun	IN
22547	Rising Sun	MD
22548	Risingsun	OH
22549	Rison	AR
22550	Rittman	OH
22551	Ritzville	WA
22552	Riva	MD
22553	River	KY
22554	River Edge	NJ
22555	River Falls	AL
22556	River Falls	WI
22557	River Forest	IL
22558	River Grove	IL
22559	River Pines	CA
22560	River Ranch	FL
22561	River Rouge	MI
22562	Riverbank	CA
22563	Riverdale	CA
22564	Riverdale	GA
22565	Riverdale	IL
22566	Riverdale	MD
22567	Riverdale	MI
22568	Riverdale	ND
22569	Riverdale	NE
22570	Riverdale	NJ
22571	Riverhead	NY
22572	Riverside	AL
22573	Riverside	CA
22574	Riverside	CT
22575	Riverside	IA
22576	Riverside	IL
22577	Riverside	MI
22578	Riverside	MO
22579	Riverside	OR
22580	Riverside	PA
22581	Riverside	RI
22582	Riverside	TX
22583	Riverside	UT
22584	Riverside	WA
22585	Riverton	CT
22586	Riverton	IA
22587	Riverton	IL
22588	Riverton	KS
22589	Riverton	NE
22590	Riverton	NJ
22591	Riverton	UT
22592	Riverton	WV
22593	Riverton	WY
22594	Rivervale	AR
22595	Riverview	FL
22596	Riverview	MI
22597	Rives	MO
22598	Rives	TN
22599	Rives Junction	MI
22600	Rivesville	WV
22601	Riviera	TX
22602	Rixeyville	VA
22603	Rixford	PA
22604	Roach	MO
22605	Roachdale	IN
22606	Roan Mountain	TN
22607	Roann	IN
22608	Roanoke	AL
22609	Roanoke	IL
22610	Roanoke	IN
22611	Roanoke	LA
22612	Roanoke	TX
22613	Roanoke	VA
22614	Roanoke Rmeisterdish_serverds	NC
22615	Roans Prairie	TX
22616	Roaring Branch	PA
22617	Roaring Gap	NC
22618	Roaring River	NC
22619	Roaring Spring	PA
22620	Roaring Springs	TX
22621	Roark	KY
22622	Robards	KY
22623	Robbins	CA
22624	Robbins	IL
22625	Robbins	NC
22626	Robbins	TN
22627	Robbinston	ME
22628	Robbinsville	NC
22629	Robeline	LA
22630	Robersonville	NC
22631	Robert	LA
22632	Robert Lee	TX
22633	Roberta	GA
22634	Roberts	ID
22635	Roberts	IL
22636	Roberts	MT
22637	Roberts	WI
22638	Robertsdale	AL
22639	Robertsdale	PA
22640	Robertson	WY
22641	Robertsville	MO
22642	Robertsville	OH
22643	Robesonia	PA
22644	Robins	IA
22645	Robinson	IL
22646	Robinson	KS
22647	Robinson	ND
22648	Robinson	PA
22649	Robinson Creek	KY
22650	Robinsonville	MS
22651	Robson	WV
22652	Robstown	TX
22653	Roby	MO
22654	Roby	TX
22655	Roca	NE
22656	Rochdale	MA
22657	Rochelle	GA
22658	Rochelle	IL
22659	Rochelle	TX
22660	Rochelle	VA
22661	Rochelle Park	NJ
22662	Rocheport	MO
22663	Rochert	MN
22664	Rochester	IL
22665	Rochester	IN
22666	Rochester	KY
22667	Rochester	MA
22668	Rochester	MI
22669	Rochester	MN
22670	Rochester	NH
22671	Rochester	NY
22672	Rochester	PA
22673	Rochester	TX
22674	Rochester	VT
22675	Rochester	WA
22676	Rochester	WI
22677	Rochester Mills	PA
22678	Rociada	NM
22679	Rock	KS
22680	Rock	MI
22681	Rock	WV
22682	Rock Camp	OH
22683	Rock Cave	WV
22684	Rock City	IL
22685	Rock City Falls	NY
22686	Rock Creek	MN
22687	Rock Creek	OH
22688	Rock Creek	WV
22689	Rock Falls	IA
22690	Rock Falls	IL
22691	Rock Falls	WI
22692	Rock Glen	PA
22693	Rock Hall	MD
22694	Rock Hill	NY
22695	Rock Hill	SC
22696	Rock Island	IL
22697	Rock Island	TN
22698	Rock Island	TX
22699	Rock Island	WA
22700	Rock Point	AZ
22701	Rock Point	MD
22702	Rock Port	MO
22703	Rock Rmeisterdish_serverds	IA
22704	Rock River	WY
22705	Rock Spring	GA
22706	Rock Springs	WI
22707	Rock Springs	WY
22708	Rock Stream	NY
22709	Rock Tavern	NY
22710	Rock Valley	IA
22711	Rock View	WV
22712	Rockaway	NJ
22713	Rockaway Beach	MO
22714	Rockaway Beach	OR
22715	Rockaway Park	NY
22716	Rockbridge	IL
22717	Rockbridge	MO
22718	Rockbridge	OH
22719	Rockbridge Baths	VA
22720	Rockdale	TX
22721	Rockfall	CT
22722	Rockfield	IN
22723	Rockfield	KY
22724	Rockford	AL
22725	Rockford	IA
22726	Rockford	IL
22727	Rockford	MI
22728	Rockford	MN
22729	Rockford	OH
22730	Rockford	TN
22731	Rockford	WA
22732	Rockham	SD
22733	Rockhill Furnace	PA
22734	Rockholds	KY
22735	Rockhouse	KY
22736	Rockingham	NC
22737	Rocklake	ND
22738	Rockland	DE
22739	Rockland	ID
22740	Rockland	MA
22741	Rockland	ME
22742	Rockland	MI
22743	Rockland	WI
22744	Rockledge	FL
22745	Rockledge	GA
22746	Rocklin	CA
22747	Rockmart	GA
22748	Rockport	IL
22749	Rockport	IN
22750	Rockport	KY
22751	Rockport	MA
22752	Rockport	ME
22753	Rockport	TX
22754	Rockport	WA
22755	Rockport	WV
22756	Rocksprings	TX
22757	Rockton	IL
22758	Rockton	PA
22759	Rockvale	CO
22760	Rockvale	TN
22761	Rockville	IN
22762	Rockville	MD
22763	Rockville	MN
22764	Rockville	MO
22765	Rockville	NE
22766	Rockville	RI
22767	Rockville	UT
22768	Rockville	VA
22769	Rockville Centre	NY
22770	Rockwall	TX
22771	Rockwell	IA
22772	Rockwell	NC
22773	Rockwell City	IA
22774	Rockwood	IL
22775	Rockwood	ME
22776	Rockwood	MI
22777	Rockwood	PA
22778	Rockwood	TN
22779	Rockwood	TX
22780	Rocky	OK
22781	Rocky Comfort	MO
22782	Rocky Face	GA
22783	Rocky Ford	CO
22784	Rocky Ford	GA
22785	Rocky Gap	VA
22786	Rocky Hill	CT
22787	Rocky Hill	KY
22788	Rocky Hill	NJ
22789	Rocky Mount	MO
22790	Rocky Mount	NC
22791	Rocky Mount	VA
22792	Rocky Point	NC
22793	Rocky Point	NY
22794	Rocky Ridge	MD
22795	Rocky Ridge	OH
22796	Rocky River	OH
22797	Rodanthe	NC
22798	Rodeo	CA
22799	Rodeo	NM
22800	Roderfield	WV
22801	Rodessa	LA
22802	Rodman	NY
22803	Rodney	IA
22804	Rodney	MI
22805	Roduco	NC
22806	Roe	AR
22807	Roebling	NJ
22808	Roebuck	SC
22809	Roff	OK
22810	Rogers	AR
22811	Rogers	CT
22812	Rogers	KY
22813	Rogers	MN
22814	Rogers	ND
22815	Rogers	NE
22816	Rogers	NM
22817	Rogers	OH
22818	Rogers	TX
22819	Rogers City	MI
22820	Rogerson	ID
22821	Rogersville	AL
22822	Rogersville	MO
22823	Rogersville	PA
22824	Rogersville	TN
22825	Roggen	CO
22826	Rogue River	OR
22827	Rohnert Park	CA
22828	Rohrersville	MD
22829	Roland	AR
22830	Roland	IA
22831	Roland	OK
22832	Rolesville	NC
22833	Rolette	ND
22834	Rolfe	IA
22835	Roll	AZ
22836	Rolla	KS
22837	Rolla	MO
22838	Rolla	ND
22839	Rolling Fork	MS
22840	Rolling Meadows	IL
22841	Rolling Prairie	IN
22842	Rollingbay	WA
22843	Rollingstone	MN
22844	Rollins	MT
22845	Rollins Fork	VA
22846	Rollinsford	NH
22847	Rollinsville	CO
22848	Roma	TX
22849	Romance	AR
22850	Romayor	TX
22851	Rombauer	MO
22852	Rome	GA
22853	Rome	IA
22854	Rome	IL
22855	Rome	IN
22856	Rome	MS
22857	Rome	NY
22858	Rome	OH
22859	Rome	PA
22860	Rome City	IN
22861	Romeo	CO
22862	Romeo	MI
22863	Romeoville	IL
22864	Romney	IN
22865	Romney	WV
22866	Romulus	MI
22867	Romulus	NY
22868	Ronald	WA
22869	Ronan	MT
22870	Ronceverte	WV
22871	Ronco	PA
22872	Ronda	NC
22873	Ronkonkoma	NY
22874	Ronks	PA
22875	Roodhouse	IL
22876	Roopville	GA
22877	Roosevelt	AZ
22878	Roosevelt	MN
22879	Roosevelt	NJ
22880	Roosevelt	NY
22881	Roosevelt	OK
22882	Roosevelt	TX
22883	Roosevelt	UT
22884	Roosevelt	WA
22885	Rooseveltown	NY
22886	Rootstown	OH
22887	Roper	NC
22888	Ropesville	TX
22889	Rosalia	KS
22890	Rosalia	WA
22891	Rosalie	NE
22892	Rosamond	CA
22893	Rosamond	IL
22894	Rosanky	TX
22895	Rosburg	WA
22896	Roscoe	IL
22897	Roscoe	MN
22898	Roscoe	MO
22899	Roscoe	MT
22900	Roscoe	NY
22901	Roscoe	PA
22902	Roscoe	SD
22903	Roscoe	TX
22904	Roscommon	MI
22905	Rose	NY
22906	Rose	OK
22907	Rose Bud	AR
22908	Rose City	MI
22909	Rose Creek	MN
22910	Rose Hill	IA
22911	Rose Hill	KS
22912	Rose Hill	MS
22913	Rose Hill	NC
22914	Rose Hill	VA
22915	Rose Lodge	OR
22916	Roseau	MN
22917	Roseboom	NY
22918	Roseboro	NC
22919	Rosebud	MO
22920	Rosebud	MT
22921	Rosebud	SD
22922	Rosebud	TX
22923	Roseburg	OR
22924	Rosebush	MI
22925	Rosedale	IN
22926	Rosedale	LA
22927	Rosedale	MD
22928	Rosedale	MS
22929	Rosedale	NY
22930	Rosedale	VA
22931	Rosedale	WV
22932	Roseglen	ND
22933	Roseland	FL
22934	Roseland	LA
22935	Roseland	NE
22936	Roseland	NJ
22937	Roseland	VA
22938	Roselawn	IN
22939	Roselle	IL
22940	Roselle	NJ
22941	Roselle Park	NJ
22942	Rosemary Beach	FL
22943	Rosemead	CA
22944	Rosemont	NJ
22945	Rosemont	WV
22946	Rosemount	MN
22947	Rosenberg	TX
22948	Rosendale	MO
22949	Rosendale	NY
22950	Rosendale	WI
22951	Rosenhayn	NJ
22952	Rosepine	LA
22953	Roseville	CA
22954	Roseville	IL
22955	Roseville	MI
22956	Roseville	OH
22957	Rosewood	OH
22958	Rosharon	TX
22959	Rosholt	SD
22960	Rosholt	WI
22961	Rosiclare	IL
22962	Rosie	AR
22963	Rosine	KY
22964	Roslindale	MA
22965	Roslyn	NY
22966	Roslyn	SD
22967	Roslyn	WA
22968	Roslyn Heights	NY
22969	Rosman	NC
22970	Ross	CA
22971	Ross	ND
22972	Ross	OH
22973	Ross	TX
22974	Rossburg	OH
22975	Rosser	TX
22976	Rossford	OH
22977	Rossiter	PA
22978	Rosston	AR
22979	Rosston	OK
22980	Rosston	TX
22981	Rossville	GA
22982	Rossville	IL
22983	Rossville	IN
22984	Rossville	KS
22985	Rossville	PA
22986	Rossville	TN
22987	Roswell	GA
22988	Roswell	NM
22989	Rotan	TX
22990	Rothbury	MI
22991	Rothsay	MN
22992	Rothschild	WI
22993	Rothville	MO
22994	Rotonda West	FL
22995	Rotterdam Junction	NY
22996	Rougemont	NC
22997	Rough And Ready	CA
22998	Rougon	LA
22999	Roulette	PA
23000	Round Hill	VA
23001	Round Lake	IL
23002	Round Lake	MN
23003	Round Lake	NY
23004	Round Mountain	CA
23005	Round Mountain	NV
23006	Round Mountain	TX
23007	Round O	SC
23008	Round Pond	ME
23009	Round Rock	AZ
23010	Round Rock	TX
23011	Round Top	NY
23012	Round Top	TX
23013	Roundhead	OH
23014	Roundhill	KY
23015	Roundup	MT
23016	Rouses Point	NY
23017	Rouseville	PA
23018	Rousseau	KY
23019	Rouzerville	PA
23020	Rover	AR
23021	Rowan	IA
23022	Rowdy	KY
23023	Rowe	MA
23024	Rowe	NM
23025	Rowe	VA
23026	Rowena	SD
23027	Rowena	TX
23028	Rowesville	SC
23029	Rowland	NC
23030	Rowland	PA
23031	Rowland Heights	CA
23032	Rowlesburg	WV
23033	Rowlett	TX
23034	Rowley	IA
23035	Rowley	MA
23036	Roxana	IL
23037	Roxana	KY
23038	Roxboro	NC
23039	Roxbury	CT
23040	Roxbury	KS
23041	Roxbury	ME
23042	Roxbury	NY
23043	Roxbury	PA
23044	Roxbury	VT
23045	Roxie	MS
23046	Roxobel	NC
23047	Roxton	TX
23048	Roy	MT
23049	Roy	NM
23050	Roy	UT
23051	Roy	WA
23052	Royal	AR
23053	Royal	IA
23054	Royal	IL
23055	Royal	NE
23056	Royal Center	IN
23057	Royal City	WA
23058	Royal Oak	MD
23059	Royal Oak	MI
23060	Royalston	MA
23061	Royalton	IL
23062	Royalton	KY
23063	Royalton	MN
23064	Royersford	PA
23065	Royse City	TX
23066	Royston	GA
23067	Rozel	KS
23068	Rozet	WY
23069	Rubicon	WI
23070	Ruby	AK
23071	Ruby	LA
23072	Ruby	NY
23073	Ruby	SC
23074	Ruby	VA
23075	Ruby Valley	NV
23076	Ruckersville	VA
23077	Rudd	IA
23078	Rudolph	OH
23079	Rudolph	WI
23080	Rudy	AR
23081	Rudyard	MI
23082	Rudyard	MT
23083	Rueter	MO
23084	Rufe	OK
23085	Ruffin	NC
23086	Ruffin	SC
23087	Ruffs Dale	PA
23088	Rufus	OR
23089	Rugby	ND
23090	Rugby	TN
23091	Ruidoso	NM
23092	Ruidoso Downs	NM
23093	Rule	TX
23094	Ruleville	MS
23095	Rulo	NE
23096	Rumely	MI
23097	Rumford	ME
23098	Rumford	RI
23099	Rumford Center	ME
23100	Rumney	NH
23101	Rumsey	CA
23102	Rumsey	KY
23103	Rumson	NJ
23104	Runge	TX
23105	Runnells	IA
23106	Runnemede	NJ
23107	Running Springs	CA
23108	Rupert	GA
23109	Rupert	ID
23110	Rupert	VT
23111	Rupert	WV
23112	Rural Hall	NC
23113	Rural Retreat	VA
23114	Rural Ridge	PA
23115	Rural Valley	PA
23116	Rush	CO
23117	Rush	KY
23118	Rush	NY
23119	Rush Center	KS
23120	Rush City	MN
23121	Rush Hill	MO
23122	Rush Springs	OK
23123	Rush Valley	UT
23124	Rushford	MN
23125	Rushford	NY
23126	Rushland	PA
23127	Rushmore	MN
23128	Rushsylvania	OH
23129	Rushville	IL
23130	Rushville	IN
23131	Rushville	MO
23132	Rushville	NE
23133	Rushville	NY
23134	Rushville	OH
23135	Rusk	TX
23136	Ruskin	FL
23137	Ruskin	NE
23138	Ruso	ND
23139	Russell	AR
23140	Russell	IA
23141	Russell	IL
23142	Russell	KS
23143	Russell	KY
23144	Russell	MA
23145	Russell	MN
23146	Russell	NY
23147	Russell	PA
23148	Russell Springs	KY
23149	Russells Point	OH
23150	Russellton	PA
23151	Russellville	AL
23152	Russellville	AR
23153	Russellville	IN
23154	Russellville	KY
23155	Russellville	MO
23156	Russellville	OH
23157	Russellville	SC
23158	Russellville	TN
23159	Russia	OH
23160	Russian Mission	AK
23161	Russiaville	IN
23162	Rustburg	VA
23163	Ruston	LA
23164	Ruth	MI
23165	Ruth	MS
23166	Ruth	NV
23167	Ruther Glen	VA
23168	Rutherford	CA
23169	Rutherford	NJ
23170	Rutherford	TN
23171	Rutherford College	NC
23172	Rutherfordton	NC
23173	Ruthton	MN
23174	Ruthven	IA
23175	Ruthville	VA
23176	Rutland	IA
23177	Rutland	IL
23178	Rutland	MA
23179	Rutland	ND
23180	Rutland	OH
23181	Rutland	SD
23182	Rutland	VT
23183	Rutledge	AL
23184	Rutledge	GA
23185	Rutledge	MO
23186	Rutledge	TN
23187	Ryan	IA
23188	Ryan	OK
23189	Rydal	GA
23190	Ryde	CA
23191	Ryder	ND
23192	Ryderwood	WA
23193	Rye	CO
23194	Rye	NH
23195	Rye	NY
23196	Rye	TX
23197	Rye Beach	NH
23198	Ryegate	MT
23199	Ryland	AL
23200	S Coffeyville	OK
23201	Sabael	NY
23202	Sabattus	ME
23203	Sabetha	KS
23204	Sabillasville	MD
23205	Sabin	MN
23206	Sabina	OH
23207	Sabinal	TX
23208	Sabine	WV
23209	Sabine Pass	TX
23210	Sabinsville	PA
23211	Sabula	IA
23212	Sac City	IA
23213	Sacaton	AZ
23214	Sachse	TX
23215	Sackets Harbor	NY
23216	Saco	ME
23217	Saco	MT
23218	Sacramento	CA
23219	Sacramento	KY
23220	Sacramento	NM
23221	Sacramento	PA
23222	Sacred Heart	MN
23223	Sacul	TX
23224	Saddle Brook	NJ
23225	Saddle River	NJ
23226	Saddlestring	WY
23227	Sadieville	KY
23228	Sadler	TX
23229	Sadorus	IL
23230	Sadsburyville	PA
23231	Saegertown	PA
23232	Safety Harbor	FL
23233	Saffell	AR
23234	Safford	AL
23235	Safford	AZ
23236	Sag Harbor	NY
23237	Sagamore	MA
23238	Sagamore	PA
23239	Sagamore Beach	MA
23240	Sagaponack	NY
23241	Sage	AR
23242	Saginaw	AL
23243	Saginaw	MI
23244	Saginaw	MN
23245	Saginaw	MO
23246	Saginaw	OR
23247	Sagle	ID
23248	Sagola	MI
23249	Saguache	CO
23250	Sahuarita	AZ
23251	Sailor Springs	IL
23252	Saint Agatha	ME
23253	Saint Albans	ME
23254	Saint Albans	MO
23255	Saint Albans	NY
23256	Saint Albans	VT
23257	Saint Albans	WV
23258	Saint Albans Bay	VT
23259	Saint Amant	LA
23260	Saint Ann	MO
23261	Saint Anne	IL
23262	Saint Ansgar	IA
23263	Saint Anthony	IA
23264	Saint Anthony	ID
23265	Saint Anthony	IN
23266	Saint Anthony	ND
23267	Saint Augustine	FL
23268	Saint Augustine	IL
23269	Saint Benedict	LA
23270	Saint Benedict	OR
23271	Saint Benedict	PA
23272	Saint Bernard	LA
23273	Saint Bernice	IN
23274	Saint Bonaventure	NY
23275	Saint Boniface	PA
23276	Saint Bonifacius	MN
23277	Saint Catharine	KY
23278	Saint Charles	AR
23279	Saint Charles	IA
23280	Saint Charles	ID
23281	Saint Charles	IL
23282	Saint Charles	KY
23283	Saint Charles	MI
23284	Saint Charles	MN
23285	Saint Charles	MO
23286	Saint Charles	SD
23287	Saint Charles	VA
23288	Saint Clair	MI
23289	Saint Clair	MN
23290	Saint Clair	MO
23291	Saint Clair	PA
23292	Saint Clair Shores	MI
23293	Saint Clairsville	OH
23294	Saint Cloud	FL
23295	Saint Cloud	MN
23296	Saint Cloud	WI
23297	Saint Croix	IN
23298	Saint Croix Falls	WI
23299	Saint David	AZ
23300	Saint David	IL
23301	Saint David	ME
23302	Saint Donatus	IA
23303	Saint Edward	NE
23304	Saint Elizabeth	MO
23305	Saint Elmo	AL
23306	Saint Elmo	IL
23307	Saint Francis	AR
23308	Saint Francis	KS
23309	Saint Francis	KY
23310	Saint Francis	ME
23311	Saint Francis	MN
23312	Saint Francis	SD
23313	Saint Francisville	IL
23314	Saint Francisville	LA
23315	Saint Gabriel	LA
23316	Saint George	GA
23317	Saint George	KS
23318	Saint George	SC
23319	Saint George	UT
23320	Saint George Island	AK
23321	Saint Georges	DE
23322	Saint Germain	WI
23323	Saint Hedwig	TX
23324	Saint Helen	MI
23325	Saint Helena	CA
23326	Saint Helena	NE
23327	Saint Helena Island	SC
23328	Saint Helens	KY
23329	Saint Helens	OR
23330	Saint Henry	OH
23331	Saint Hilaire	MN
23332	Saint Ignace	MI
23333	Saint Ignatius	MT
23334	Saint Inigoes	MD
23335	Saint Jacob	IL
23336	Saint James	LA
23337	Saint James	MD
23338	Saint James	MN
23339	Saint James	MO
23340	Saint James	NY
23341	Saint James City	FL
23342	Saint Jo	TX
23343	Saint Joe	AR
23344	Saint Joe	IN
23345	Saint John	IN
23346	Saint John	KS
23347	Saint John	ND
23348	Saint John	WA
23349	Saint Johns	AZ
23350	Saint Johns	FL
23351	Saint Johns	MI
23352	Saint Johns	OH
23353	Saint Johns	PA
23354	Saint Johnsbury	VT
23355	Saint Johnsbury Center	VT
23356	Saint Johnsville	NY
23357	Saint Joseph	IL
23358	Saint Joseph	LA
23359	Saint Joseph	MI
23360	Saint Joseph	MN
23361	Saint Joseph	MO
23362	Saint Joseph	TN
23363	Saint Landry	LA
23364	Saint Lawrence	SD
23365	Saint Leo	FL
23366	Saint Leonard	MD
23367	Saint Libory	IL
23368	Saint Libory	NE
23369	Saint Louis	MI
23370	Saint Louis	MO
23371	Saint Louis	OK
23372	Saint Louis Park	MN
23373	Saint Louisville	OH
23374	Saint Lucas	IA
23375	Saint Marie	MT
23376	Saint Maries	ID
23377	Saint Marks	FL
23378	Saint Martin	MN
23379	Saint Martinville	LA
23380	Saint Mary	KY
23381	Saint Mary	MO
23382	Saint Mary Of The Woods	IN
23383	Saint Marys	AK
23384	Saint Marys	GA
23385	Saint Marys	IA
23386	Saint Marys	KS
23387	Saint Marys	OH
23388	Saint Marys	PA
23389	Saint Marys	WV
23390	Saint Marys City	MD
23391	Saint Matthews	SC
23392	Saint Maurice	LA
23393	Saint Meinrad	IN
23394	Saint Michael	AK
23395	Saint Michael	MN
23396	Saint Michael	ND
23397	Saint Michael	PA
23398	Saint Michaels	AZ
23399	Saint Michaels	MD
23400	Saint Nazianz	WI
23401	Saint Olaf	IA
23402	Saint Onge	SD
23403	Saint Paris	OH
23404	Saint Patrick	MO
23405	Saint Paul	AR
23406	Saint Paul	IA
23407	Saint Paul	IN
23408	Saint Paul	KS
23409	Saint Paul	MN
23410	Saint Paul	NE
23411	Saint Paul	OR
23412	Saint Paul	VA
23413	Saint Paul Island	AK
23414	Saint Paul Park	MN
23415	Saint Pauls	NC
23416	Saint Peter	IL
23417	Saint Peter	MN
23418	Saint Peters	MO
23419	Saint Peters	PA
23420	Saint Petersburg	FL
23421	Saint Petersburg	PA
23422	Saint Regis	MT
23423	Saint Regis Falls	NY
23424	Saint Robert	MO
23425	Saint Rose	LA
23426	Saint Simons Island	GA
23427	Saint Stephen	MN
23428	Saint Stephen	SC
23429	Saint Stephens	AL
23430	Saint Stephens	WY
23431	Saint Stephens Church	VA
23432	Saint Thomas	MO
23433	Saint Thomas	ND
23434	Saint Thomas	PA
23435	Saint Vincent	MN
23436	Saint Vrain	NM
23437	Saint Xavier	MT
23438	Sainte Genevieve	MO
23439	Sainte Marie	IL
23440	Salado	AR
23441	Salado	TX
23442	Salamanca	NY
23443	Salamonia	IN
23444	Salcha	AK
23445	Sale City	GA
23446	Sale Creek	TN
23447	Salem	AL
23448	Salem	AR
23449	Salem	CT
23450	Salem	FL
23451	Salem	IA
23452	Salem	IL
23453	Salem	IN
23454	Salem	KY
23455	Salem	MA
23456	Salem	MI
23457	Salem	MO
23458	Salem	NE
23459	Salem	NH
23460	Salem	NJ
23461	Salem	NM
23462	Salem	NY
23463	Salem	OH
23464	Salem	OR
23465	Salem	SC
23466	Salem	SD
23467	Salem	UT
23468	Salem	VA
23469	Salem	WI
23470	Salem	WV
23471	Salemburg	NC
23472	Salesville	OH
23473	Salford	PA
23474	Salfordville	PA
23475	Salida	CA
23476	Salida	CO
23477	Salina	KS
23478	Salina	OK
23479	Salina	PA
23480	Salina	UT
23481	Salinas	CA
23482	Saline	LA
23483	Saline	MI
23484	Salineno	TX
23485	Salineville	OH
23486	Salisbury	CT
23487	Salisbury	MA
23488	Salisbury	MD
23489	Salisbury	MO
23490	Salisbury	NC
23491	Salisbury	NH
23492	Salisbury	PA
23493	Salisbury	VT
23494	Salisbury Center	NY
23495	Salisbury Mills	NY
23496	Salix	IA
23497	Salix	PA
23498	Salkum	WA
23499	Salley	SC
23500	Sallis	MS
23501	Sallisaw	OK
23502	Salmon	ID
23503	Salol	MN
23504	Salome	AZ
23505	Salona	PA
23506	Salsbury Cove	ME
23507	Salt Flat	TX
23508	Salt Lake City	UT
23509	Salt Lick	KY
23510	Salt Point	NY
23511	Salt Rock	WV
23512	Salter Path	NC
23513	Salters	SC
23514	Saltese	MT
23515	Saltillo	MS
23516	Saltillo	PA
23517	Saltillo	TN
23518	Saltillo	TX
23519	Salton City	CA
23520	Saltsburg	PA
23521	Saltville	VA
23522	Saluda	NC
23523	Saluda	SC
23524	Saluda	VA
23525	Salvisa	KY
23526	Salvo	NC
23527	Salyer	CA
23528	Salyersville	KY
23529	Sam Norwood	TX
23530	Samantha	AL
23531	Samaria	MI
23532	Samburg	TN
23533	Sammamish	WA
23534	Samoa	CA
23535	Samson	AL
23536	San Acacia	NM
23537	San Andreas	CA
23538	San Angelo	TX
23539	San Anselmo	CA
23540	San Antonio	FL
23541	San Antonio	NM
23542	San Antonio	TX
23543	San Ardo	CA
23544	San Augustine	TX
23545	San Benito	TX
23546	San Bernardino	CA
23547	San Bruno	CA
23548	San Carlos	AZ
23549	San Carlos	CA
23550	San Clemente	CA
23551	San Cristobal	NM
23552	San Diego	CA
23553	San Diego	TX
23554	San Dimas	CA
23555	San Elizario	TX
23556	San Felipe	TX
23557	San Fernando	CA
23558	San Fidel	NM
23559	San Francisco	CA
23560	San Gabriel	CA
23561	San Geronimo	CA
23562	San Gregorio	CA
23563	San Isidro	TX
23564	San Jacinto	CA
23565	San Joaquin	CA
23566	San Jon	NM
23567	San Jose	CA
23568	San Jose	IL
23569	San Jose	NM
23570	San Juan	TX
23571	San Juan Bautista	CA
23572	San Juan Capistrano	CA
23573	San Juan Pueblo	NM
23574	San Leandro	CA
23575	San Lorenzo	CA
23576	San Lucas	CA
23577	San Luis	AZ
23578	San Luis	CO
23579	San Luis Obispo	CA
23580	San Luis Rey	CA
23581	San Manuel	AZ
23582	San Marcos	CA
23583	San Marcos	TX
23584	San Marino	CA
23585	San Martin	CA
23586	San Mateo	CA
23587	San Mateo	FL
23588	San Miguel	CA
23589	San Miguel	NM
23590	San Pablo	CA
23591	San Pablo	CO
23592	San Patricio	NM
23593	San Pedro	CA
23594	San Perlita	TX
23595	San Pierre	IN
23596	San Quentin	CA
23597	San Rafael	CA
23598	San Rafael	NM
23599	San Ramon	CA
23600	San Saba	TX
23601	San Simeon	CA
23602	San Simon	AZ
23603	San Ygnacio	TX
23604	San Ysidro	CA
23605	San Ysidro	NM
23606	Sanborn	IA
23607	Sanborn	MN
23608	Sanborn	ND
23609	Sanborn	NY
23610	Sanbornton	NH
23611	Sanbornville	NH
23612	Sand Coulee	MT
23613	Sand Creek	MI
23614	Sand Creek	WI
23615	Sand Fork	WV
23616	Sand Lake	MI
23617	Sand Lake	NY
23618	Sand Point	AK
23619	Sand Springs	MT
23620	Sand Springs	OK
23621	Sandborn	IN
23622	Sanders	AZ
23623	Sanders	KY
23624	Sanders	MT
23625	Sanderson	FL
23626	Sanderson	TX
23627	Sandersville	GA
23628	Sandersville	MS
23629	Sandgap	KY
23630	Sandhill	MS
23631	Sandia	TX
23632	Sandia Park	NM
23633	Sandisfield	MA
23634	Sandoval	IL
23635	Sandown	NH
23636	Sandpoint	ID
23637	Sandston	VA
23638	Sandstone	MN
23639	Sandstone	WV
23640	Sandusky	MI
23641	Sandusky	NY
23642	Sandusky	OH
23643	Sandwich	IL
23644	Sandwich	MA
23645	Sandy	OR
23646	Sandy	UT
23647	Sandy Creek	NY
23648	Sandy Hook	CT
23649	Sandy Hook	KY
23650	Sandy Hook	MS
23651	Sandy Hook	VA
23652	Sandy Lake	PA
23653	Sandy Level	VA
23654	Sandy Point	ME
23655	Sandy Point	VA
23656	Sandy Ridge	NC
23657	Sandy Ridge	PA
23658	Sandy Spring	MD
23659	Sandy Springs	SC
23660	Sandyville	OH
23661	Sandyville	WV
23662	Sanford	CO
23663	Sanford	FL
23664	Sanford	ME
23665	Sanford	MI
23666	Sanford	NC
23667	Sanford	TX
23668	Sanford	VA
23669	Sanger	CA
23670	Sanger	TX
23671	Sangerfield	NY
23672	Sangerville	ME
23673	Sanibel	FL
23674	Sanostee	NM
23675	Santa	ID
23676	Santa Ana	CA
23677	Santa Anna	TX
23678	Santa Barbara	CA
23679	Santa Clara	CA
23680	Santa Clara	NM
23681	Santa Clara	UT
23682	Santa Clarita	CA
23683	Santa Claus	IN
23684	Santa Cruz	CA
23685	Santa Cruz	NM
23686	Santa Elena	TX
23687	Santa Fe	MO
23688	Santa Fe	NM
23689	Santa Fe	TN
23690	Santa Fe	TX
23691	Santa Fe Springs	CA
23692	Santa Margarita	CA
23693	Santa Maria	CA
23694	Santa Maria	TX
23695	Santa Monica	CA
23696	Santa Paula	CA
23697	Santa Rita Park	CA
23698	Santa Rosa	CA
23699	Santa Rosa	NM
23700	Santa Rosa	TX
23701	Santa Rosa Beach	FL
23702	Santa Teresa	NM
23703	Santa Ynez	CA
23704	Santa Ysabel	CA
23705	Santaquin	UT
23706	Santee	CA
23707	Santee	SC
23708	Santiago	MN
23709	Santo	TX
23710	Santo Domingo Pueblo	NM
23711	Sapello	NM
23712	Sapelo Island	GA
23713	Sapphire	NC
23714	Sapulpa	OK
23715	Saragosa	TX
23716	Sarah	MS
23717	Sarah Ann	WV
23718	Sarahsville	OH
23719	Saraland	AL
23720	Saranac	MI
23721	Saranac	NY
23722	Saranac Lake	NY
23723	Sarasota	FL
23724	Saratoga	AR
23725	Saratoga	CA
23726	Saratoga	IN
23727	Saratoga	NC
23728	Saratoga	TX
23729	Saratoga	WY
23730	Saratoga Springs	NY
23731	Saratoga Springs	UT
23732	Sarcoxie	MO
23733	Sardinia	NY
23734	Sardinia	OH
23735	Sardinia	SC
23736	Sardis	AL
23737	Sardis	GA
23738	Sardis	MS
23739	Sardis	OH
23740	Sardis	TN
23741	Sarepta	LA
23742	Sargeant	MN
23743	Sargent	GA
23744	Sargent	NE
23745	Sargents	CO
23746	Sargentville	ME
23747	Sarita	TX
23748	Sarles	ND
23749	Sarona	WI
23750	Saronville	NE
23751	Sartell	MN
23752	Sarver	PA
23753	Sasabe	AZ
23754	Sasakwa	OK
23755	Sassafras	KY
23756	Sassamansville	PA
23757	Sasser	GA
23758	Satanta	KS
23759	Satartia	MS
23760	Satellite Beach	FL
23761	Satin	TX
23762	Satsop	WA
23763	Satsuma	AL
23764	Satsuma	FL
23765	Saucier	MS
23766	Saugatuck	MI
23767	Saugerties	NY
23768	Saugus	MA
23769	Sauk Centre	MN
23770	Sauk City	WI
23771	Sauk Rmeisterdish_serverds	MN
23772	Saukville	WI
23773	Saul	KY
23774	Saulsbury	TN
23775	Saulsville	WV
23776	Sault Sainte Marie	MI
23777	Saunderstown	RI
23778	Saunemin	IL
23779	Sauquoit	NY
23780	Sausalito	CA
23781	Sautee Nacoochee	GA
23782	Savage	MD
23783	Savage	MN
23784	Savage	MT
23785	Savanna	IL
23786	Savanna	OK
23787	Savannah	GA
23788	Savannah	MO
23789	Savannah	NY
23790	Savannah	OH
23791	Savannah	TN
23792	Saverton	MO
23793	Savery	WY
23794	Savona	NY
23795	Savonburg	KS
23796	Savoonga	AK
23797	Savoy	IL
23798	Savoy	MA
23799	Savoy	TX
23800	Sawyer	KS
23801	Sawyer	MI
23802	Sawyer	MN
23803	Sawyer	ND
23804	Sawyer	OK
23805	Sawyerville	AL
23806	Sawyerville	IL
23807	Saxapahaw	NC
23808	Saxe	VA
23809	Saxeville	WI
23810	Saxis	VA
23811	Saxon	WI
23812	Saxon	WV
23813	Saxonburg	PA
23814	Saxton	PA
23815	Saxtons River	VT
23816	Saybrook	IL
23817	Saylorsburg	PA
23818	Sayner	WI
23819	Sayre	AL
23820	Sayre	OK
23821	Sayre	PA
23822	Sayreville	NJ
23823	Sayville	NY
23824	Scales Mound	IL
23825	Scalf	KY
23826	Scaly Mountain	NC
23827	Scammon	KS
23828	Scammon Bay	AK
23829	Scandia	KS
23830	Scandia	MN
23831	Scandinavia	WI
23832	Scappoose	OR
23833	Scarborough	ME
23834	Scarbro	WV
23835	Scarsdale	NY
23836	Scarville	IA
23837	Scenery Hill	PA
23838	Scenic	SD
23839	Schaefferstown	PA
23840	Schaghticoke	NY
23841	Schaller	IA
23842	Schaumburg	IL
23843	Schell City	MO
23844	Scheller	IL
23845	Schellsburg	PA
23846	Schenectady	NY
23847	Schenevus	NY
23848	Schenley	PA
23849	Schererville	IN
23850	Schertz	TX
23851	Schiller Park	IL
23852	Schlater	MS
23853	Schleswig	IA
23854	Schley	VA
23855	Schnecksville	PA
23856	Schneider	IN
23857	Schnellville	IN
23858	Schodack Landing	NY
23859	Schoenchen	KS
23860	Schofield	WI
23861	Schofield Barracks	HI
23862	Schoharie	NY
23863	Schoolcraft	MI
23864	Schooleys Mountain	NJ
23865	Schriever	LA
23866	Schroeder	MN
23867	Schroon Lake	NY
23868	Schulenburg	TX
23869	Schulter	OK
23870	Schurz	NV
23871	Schuyler	NE
23872	Schuyler	VA
23873	Schuyler Falls	NY
23874	Schuyler Lake	NY
23875	Schuylerville	NY
23876	Schuylkill Haven	PA
23877	Schwenksville	PA
23878	Schwertner	TX
23879	Science Hill	KY
23880	Scio	NY
23881	Scio	OH
23882	Scio	OR
23883	Sciota	IL
23884	Sciota	PA
23885	Scioto Furnace	OH
23886	Scipio	IN
23887	Scipio	UT
23888	Scipio Center	NY
23889	Scituate	MA
23890	Scobey	MS
23891	Scobey	MT
23892	Scooba	MS
23893	Scotch Plains	NJ
23894	Scotia	CA
23895	Scotia	NE
23896	Scotia	SC
23897	Scotland	AR
23898	Scotland	CT
23899	Scotland	GA
23900	Scotland	IN
23901	Scotland	MD
23902	Scotland	PA
23903	Scotland	SD
23904	Scotland	TX
23905	Scotland Neck	NC
23906	Scotrun	PA
23907	Scott	AR
23908	Scott	LA
23909	Scott	MS
23910	Scott	OH
23911	Scott Air Force Base	IL
23912	Scott Bar	CA
23913	Scott City	KS
23914	Scott City	MO
23915	Scott Depot	WV
23916	Scottdale	GA
23917	Scottdale	PA
23918	Scottown	OH
23919	Scotts	MI
23920	Scotts	NC
23921	Scotts Hill	TN
23922	Scotts Mills	OR
23923	Scotts Valley	CA
23924	Scottsbluff	NE
23925	Scottsboro	AL
23926	Scottsburg	IN
23927	Scottsburg	NY
23928	Scottsburg	OR
23929	Scottsburg	VA
23930	Scottsdale	AZ
23931	Scottsmoor	FL
23932	Scottsville	KY
23933	Scottsville	NY
23934	Scottsville	TX
23935	Scottsville	VA
23936	Scottville	IL
23937	Scottville	MI
23938	Scottville	NC
23939	Scranton	AR
23940	Scranton	IA
23941	Scranton	KS
23942	Scranton	NC
23943	Scranton	ND
23944	Scranton	PA
23945	Scranton	SC
23946	Screven	GA
23947	Scribner	NE
23948	Scroggins	TX
23949	Scuddy	KY
23950	Scurry	TX
23951	Sea Cliff	NY
23952	Sea Girt	NJ
23953	Sea Island	GA
23954	Sea Isle City	NJ
23955	Seabeck	WA
23956	Seaboard	NC
23957	Seabrook	NH
23958	Seabrook	SC
23959	Seabrook	TX
23960	Seadrift	TX
23961	Seaford	DE
23962	Seaford	NY
23963	Seaford	VA
23964	Seaforth	MN
23965	Seagoville	TX
23966	Seagraves	TX
23967	Seagrove	NC
23968	Seahurst	WA
23969	Seal Beach	CA
23970	Seal Cove	ME
23971	Seal Harbor	ME
23972	Seal Rock	OR
23973	Seale	AL
23974	Sealevel	NC
23975	Sealston	VA
23976	Sealy	TX
23977	Seaman	OH
23978	Seanor	PA
23979	Searchlight	NV
23980	Searcy	AR
23981	Searles	MN
23982	Sears	MI
23983	Searsboro	IA
23984	Searsmont	ME
23985	Searsport	ME
23986	Seaside	CA
23987	Seaside	OR
23988	Seaside Heights	NJ
23989	Seaside Park	NJ
23990	Seaton	IL
23991	Seatonville	IL
23992	Seattle	WA
23993	Seaview	VA
23994	Seaview	WA
23995	Sebago	ME
23996	Sebago Lake	ME
23997	Sebasco Estates	ME
23998	Sebastian	FL
23999	Sebastian	TX
24000	Sebastopol	CA
24001	Sebastopol	MS
24002	Sebec	ME
24003	Sebeka	MN
24004	Sebewaing	MI
24005	Sebree	KY
24006	Sebring	FL
24007	Sebring	OH
24008	Secaucus	NJ
24009	Seco	KY
24010	Second Mesa	AZ
24011	Secondcreek	WV
24012	Secor	IL
24013	Secretary	MD
24014	Section	AL
24015	Sedalia	CO
24016	Sedalia	IN
24017	Sedalia	KY
24018	Sedalia	MO
24019	Sedalia	NC
24020	Sedalia	OH
24021	Sedan	KS
24022	Sedan	NM
24023	Sedgewickville	MO
24024	Sedgwick	AR
24025	Sedgwick	CO
24026	Sedgwick	KS
24027	Sedgwick	ME
24028	Sedley	VA
24029	Sedona	AZ
24030	Sedro Woolley	WA
24031	Seekonk	MA
24032	Seeley	CA
24033	Seeley Lake	MT
24034	Seelyville	IN
24035	Seffner	FL
24036	Seguin	TX
24037	Seiad Valley	CA
24038	Seibert	CO
24039	Seiling	OK
24040	Sekiu	WA
24041	Selah	WA
24042	Selawik	AK
24043	Selby	SD
24044	Selbyville	DE
24045	Selbyville	WV
24046	Selden	KS
24047	Selden	NY
24048	Seldovia	AK
24049	Selfridge	ND
24050	Seligman	AZ
24051	Seligman	MO
24052	Selinsgrove	PA
24053	Selkirk	NY
24054	Sellers	SC
24055	Sellersburg	IN
24056	Sellersville	PA
24057	Sells	AZ
24058	Selma	AL
24059	Selma	CA
24060	Selma	IA
24061	Selma	IN
24062	Selma	NC
24063	Selma	OR
24064	Selma	VA
24065	Selman City	TX
24066	Selmer	TN
24067	Seltzer	PA
24068	Seminary	MS
24069	Seminole	AL
24070	Seminole	FL
24071	Seminole	OK
24072	Seminole	PA
24073	Seminole	TX
24074	Semmes	AL
24075	Semora	NC
24076	Senath	MO
24077	Senatobia	MS
24078	Seneca	IL
24079	Seneca	KS
24080	Seneca	MO
24081	Seneca	NE
24082	Seneca	OR
24083	Seneca	PA
24084	Seneca	SC
24085	Seneca	SD
24086	Seneca	WI
24087	Seneca Castle	NY
24088	Seneca Falls	NY
24089	Seneca Rocks	WV
24090	Senecaville	OH
24091	Seney	MI
24092	Senoia	GA
24093	Sentinel	OK
24094	Sentinel Butte	ND
24095	Sequatchie	TN
24096	Sequim	WA
24097	Sequoia National Park	CA
24098	Serafina	NM
24099	Serena	IL
24100	Sergeant Bluff	IA
24101	Sergeantsville	NJ
24102	Servia	IN
24103	Sesser	IL
24104	Seth	WV
24105	Seven Mile	OH
24106	Seven Springs	NC
24107	Seven Valleys	PA
24108	Severance	CO
24109	Severance	NY
24110	Severn	MD
24111	Severn	NC
24112	Severn	VA
24113	Severna Park	MD
24114	Severy	KS
24115	Sevier	UT
24116	Sevierville	TN
24117	Seville	FL
24118	Seville	GA
24119	Seville	OH
24120	Sewanee	TN
24121	Seward	AK
24122	Seward	IL
24123	Seward	NE
24124	Seward	PA
24125	Sewaren	NJ
24126	Sewell	NJ
24127	Sewickley	PA
24128	Sextons Creek	KY
24129	Sextonville	WI
24130	Seymour	CT
24131	Seymour	IA
24132	Seymour	IL
24133	Seymour	IN
24134	Seymour	MO
24135	Seymour	TN
24136	Seymour	TX
24137	Seymour	WI
24138	Shabbona	IL
24139	Shacklefords	VA
24140	Shade	OH
24141	Shade Gap	PA
24142	Shady Cove	OR
24143	Shady Dale	GA
24144	Shady Grove	FL
24145	Shady Grove	PA
24146	Shady Point	OK
24147	Shady Side	MD
24148	Shady Spring	WV
24149	Shady Valley	TN
24150	Shadyside	OH
24151	Shafer	MN
24152	Shafter	CA
24153	Shaftsburg	MI
24154	Shaftsbury	VT
24155	Shageluk	AK
24156	Shakopee	MN
24157	Shaktoolik	AK
24158	Shalimar	FL
24159	Shallotte	NC
24160	Shallowater	TX
24161	Shambaugh	IA
24162	Shamokin	PA
24163	Shamokin Dam	PA
24164	Shamrock	OK
24165	Shamrock	TX
24166	Shandaken	NY
24167	Shandon	CA
24168	Shandon	OH
24169	Shaniko	OR
24170	Shanks	WV
24171	Shanksville	PA
24172	Shannock	RI
24173	Shannon	AL
24174	Shannon	GA
24175	Shannon	IL
24176	Shannon	MS
24177	Shannon	NC
24178	Shannon City	IA
24179	Shapleigh	ME
24180	Sharon	CT
24181	Sharon	GA
24182	Sharon	KS
24183	Sharon	MA
24184	Sharon	MS
24185	Sharon	ND
24186	Sharon	OK
24187	Sharon	PA
24188	Sharon	SC
24189	Sharon	TN
24190	Sharon	VT
24191	Sharon	WI
24192	Sharon Center	OH
24193	Sharon Grove	KY
24194	Sharon Hill	PA
24195	Sharon Springs	KS
24196	Sharon Springs	NY
24197	Sharpes	FL
24198	Sharples	WV
24199	Sharps	VA
24200	Sharps Chapel	TN
24201	Sharpsburg	GA
24202	Sharpsburg	IA
24203	Sharpsburg	KY
24204	Sharpsburg	MD
24205	Sharpsburg	NC
24206	Sharpsburg	OH
24207	Sharpsville	IN
24208	Sharpsville	PA
24209	Sharptown	MD
24210	Shartlesville	PA
24211	Shasta	CA
24212	Shasta Lake	CA
24213	Shattuck	OK
24214	Shauck	OH
24215	Shaver Lake	CA
24216	Shavertown	PA
24217	Shaw	MS
24218	Shaw A F B	SC
24219	Shaw Island	WA
24220	Shawanee	TN
24221	Shawanese	PA
24222	Shawano	WI
24223	Shawboro	NC
24224	Shawmut	ME
24225	Shawmut	MT
24226	Shawnee	CO
24227	Shawnee	KS
24228	Shawnee	OH
24229	Shawnee	OK
24230	Shawnee	WY
24231	Shawnee Mission	KS
24232	Shawnee On Delaware	PA
24233	Shawneetown	IL
24234	Shawsville	VA
24235	Shawville	PA
24236	Sheakleyville	PA
24237	Sheboygan	WI
24238	Sheboygan Falls	WI
24239	Shedd	OR
24240	Sheep Ranch	CA
24241	Sheep Springs	NM
24242	Sheffield	AL
24243	Sheffield	IA
24244	Sheffield	IL
24245	Sheffield	MA
24246	Sheffield	PA
24247	Sheffield	TX
24248	Sheffield	VT
24249	Sheffield Lake	OH
24250	Shelbiana	KY
24251	Shelbina	MO
24252	Shelburn	IN
24253	Shelburne	VT
24254	Shelburne Falls	MA
24255	Shelby	AL
24256	Shelby	IA
24257	Shelby	IN
24258	Shelby	MI
24259	Shelby	MS
24260	Shelby	MT
24261	Shelby	NC
24262	Shelby	NE
24263	Shelby	OH
24264	Shelby Gap	KY
24265	Shelbyville	IL
24266	Shelbyville	IN
24267	Shelbyville	KY
24268	Shelbyville	MI
24269	Shelbyville	MO
24270	Shelbyville	TN
24271	Shelbyville	TX
24272	Sheldahl	IA
24273	Sheldon	IA
24274	Sheldon	IL
24275	Sheldon	MO
24276	Sheldon	ND
24277	Sheldon	SC
24278	Sheldon	VT
24279	Sheldon	WI
24280	Sheldon Springs	VT
24281	Sheldonville	MA
24282	Shell	WY
24283	Shell Knob	MO
24284	Shell Lake	WI
24285	Shell Rock	IA
24286	Shelley	ID
24287	Shellman	GA
24288	Shellsburg	IA
24289	Shelly	MN
24290	Shelocta	PA
24291	Shelter Island	NY
24292	Shelter Island Heights	NY
24293	Shelton	CT
24294	Shelton	NE
24295	Shelton	WA
24296	Shenandoah	IA
24297	Shenandoah	PA
24298	Shenandoah	VA
24299	Shenandoah Junction	WV
24300	Shenorock	NY
24301	Shepardsville	IN
24302	Shepherd	MI
24303	Shepherd	MT
24304	Shepherd	TX
24305	Shepherdstown	WV
24306	Shepherdsville	KY
24307	Sheppard Afb	TX
24308	Sheppton	PA
24309	Sherard	MS
24310	Sherborn	MA
24311	Sherburn	MN
24312	Sherburne	NY
24313	Sheridan	AR
24314	Sheridan	CA
24315	Sheridan	IL
24316	Sheridan	IN
24317	Sheridan	ME
24318	Sheridan	MI
24319	Sheridan	MO
24320	Sheridan	MT
24321	Sheridan	NY
24322	Sheridan	OR
24323	Sheridan	TX
24324	Sheridan	WY
24325	Sheridan Lake	CO
24326	Sherman	CT
24327	Sherman	IL
24328	Sherman	ME
24329	Sherman	MS
24330	Sherman	NY
24331	Sherman	TX
24332	Sherman Oaks	CA
24333	Shermans Dale	PA
24334	Sherrard	IL
24335	Sherrill	AR
24336	Sherrill	IA
24337	Sherrill	NY
24338	Sherrills Ford	NC
24339	Sherrodsville	OH
24340	Sherwood	AR
24341	Sherwood	MD
24342	Sherwood	MI
24343	Sherwood	ND
24344	Sherwood	OH
24345	Sherwood	OR
24346	Sherwood	TN
24347	Sherwood	WI
24348	Shevlin	MN
24349	Sheyenne	ND
24350	Shickley	NE
24351	Shickshinny	PA
24352	Shidler	OK
24353	Shields	ND
24354	Shiloh	GA
24355	Shiloh	NC
24356	Shiloh	NJ
24357	Shiloh	OH
24358	Shiloh	TN
24359	Shiner	TX
24360	Shingle Springs	CA
24361	Shinglehouse	PA
24362	Shingleton	MI
24363	Shingletown	CA
24364	Shinhopple	NY
24365	Shinnston	WV
24366	Shiocton	WI
24367	Shipman	IL
24368	Shipman	VA
24369	Shippensburg	PA
24370	Shippenville	PA
24371	Shippingport	PA
24372	Shiprock	NM
24373	Shipshewana	IN
24374	Shirland	IL
24375	Shirley	AR
24376	Shirley	IL
24377	Shirley	IN
24378	Shirley	MA
24379	Shirley	NY
24380	Shirley	WV
24381	Shirley Basin	WY
24382	Shirley Mills	ME
24383	Shirleysburg	PA
24384	Shiro	TX
24385	Shishmaref	AK
24386	Shoals	IN
24387	Shoals	WV
24388	Shobonier	IL
24389	Shock	WV
24390	Shoemakersville	PA
24391	Shohola	PA
24392	Shokan	NY
24393	Shongaloo	LA
24394	Shonto	AZ
24395	Shook	MO
24396	Shoreham	NY
24397	Shoreham	VT
24398	Shorewood	IL
24399	Short Creek	WV
24400	Short Hills	NJ
24401	Shorter	AL
24402	Shorterville	AL
24403	Shortsville	NY
24404	Shortt Gap	VA
24405	Shoshone	CA
24406	Shoshone	ID
24407	Shoshoni	WY
24408	Shoup	ID
24409	Show Low	AZ
24410	Showell	MD
24411	Shreve	OH
24412	Shreveport	LA
24413	Shrewsbury	MA
24414	Shrewsbury	NJ
24415	Shrewsbury	PA
24416	Shrub Oak	NY
24417	Shubert	NE
24418	Shubuta	MS
24419	Shullsburg	WI
24420	Shumway	IL
24421	Shungnak	AK
24422	Shunk	PA
24423	Shuqualak	MS
24424	Shushan	NY
24425	Shutesbury	MA
24426	Siasconset	MA
24427	Sibley	IA
24428	Sibley	IL
24429	Sibley	LA
24430	Sibley	MO
24431	Sibley	MS
24432	Sicily Island	LA
24433	Sicklerville	NJ
24434	Side Lake	MN
24435	Sidell	IL
24436	Sidman	PA
24437	Sidnaw	MI
24438	Sidney	AR
24439	Sidney	IA
24440	Sidney	IL
24441	Sidney	KY
24442	Sidney	MI
24443	Sidney	MT
24444	Sidney	NE
24445	Sidney	NY
24446	Sidney	OH
24447	Sidney	TX
24448	Sidney Center	NY
24449	Sidon	MS
24450	Sieper	LA
24451	Sierra Blanca	TX
24452	Sierra City	CA
24453	Sierra Madre	CA
24454	Sierra Vista	AZ
24455	Sierraville	CA
24456	Sigel	IL
24457	Sigel	PA
24458	Signal Hill	CA
24459	Signal Mountain	TN
24460	Sigourney	IA
24461	Sigurd	UT
24462	Sikes	LA
24463	Sikeston	MO
24464	Silas	AL
24465	Siler	KY
24466	Siler City	NC
24467	Silerton	TN
24468	Siletz	OR
24469	Silex	MO
24470	Siloam	GA
24471	Siloam	NC
24472	Siloam Springs	AR
24473	Silsbee	TX
24474	Silt	CO
24475	Siluria	AL
24476	Silva	MO
24477	Silvana	WA
24478	Silver	TX
24479	Silver Bay	MN
24480	Silver Bay	NY
24481	Silver Beach	MA
24482	Silver City	IA
24483	Silver City	MS
24484	Silver City	NM
24485	Silver City	NV
24486	Silver Creek	GA
24487	Silver Creek	MN
24488	Silver Creek	MS
24489	Silver Creek	NE
24490	Silver Creek	NY
24491	Silver Creek	WA
24492	Silver Gate	MT
24493	Silver Grove	KY
24494	Silver Lake	IN
24495	Silver Lake	KS
24496	Silver Lake	MN
24497	Silver Lake	NH
24498	Silver Lake	NY
24499	Silver Lake	OR
24500	Silver Lake	WI
24501	Silver Plume	CO
24502	Silver Point	TN
24503	Silver Spring	MD
24504	Silver Spring	PA
24505	Silver Springs	FL
24506	Silver Springs	NV
24507	Silver Springs	NY
24508	Silver Star	MT
24509	Silverado	CA
24510	Silverdale	PA
24511	Silverdale	WA
24512	Silverhill	AL
24513	Silverlake	WA
24514	Silverpeak	NV
24515	Silverstreet	SC
24516	Silverthorne	CO
24517	Silverton	CO
24518	Silverton	ID
24519	Silverton	OR
24520	Silverton	TX
24521	Silverwood	MI
24522	Silvis	IL
24523	Simi Valley	CA
24524	Simla	CO
24525	Simmesport	LA
24526	Simms	MT
24527	Simms	TX
24528	Simon	WV
24529	Simonton	TX
24530	Simpson	IL
24531	Simpson	KS
24532	Simpson	LA
24533	Simpson	NC
24534	Simpson	WV
24535	Simpsonville	KY
24536	Simpsonville	MD
24537	Simpsonville	SC
24538	Sims	AR
24539	Sims	IL
24540	Sims	NC
24541	Simsboro	LA
24542	Simsbury	CT
24543	Sinai	SD
24544	Sinclair	ME
24545	Sinclair	WY
24546	Sinclairville	NY
24547	Singer	LA
24548	Singers Glen	VA
24549	Sinking Spring	OH
24550	Sinks Grove	WV
24551	Sinnamahoning	PA
24552	Sinsinawa	WI
24553	Sinton	TX
24554	Sioux Center	IA
24555	Sioux City	IA
24556	Sioux Falls	SD
24557	Sioux Rmeisterdish_serverds	IA
24558	Sipesville	PA
24559	Sipsey	AL
24560	Siren	WI
24561	Sisseton	SD
24562	Sister Bay	WI
24563	Sisters	OR
24564	Sistersville	WV
24565	Sitka	AK
24566	Sitka	KY
24567	Six Lakes	MI
24568	Six Mile	SC
24569	Six Mile Run	PA
24570	Sixes	OR
24571	Sizerock	KY
24572	Skagway	AK
24573	Skamokawa	WA
24574	Skandia	MI
24575	Skaneateles	NY
24576	Skaneateles Falls	NY
24577	Skanee	MI
24578	Skellytown	TX
24579	Skelton	WV
24580	Skiatook	OK
24581	Skidmore	MO
24582	Skidmore	TX
24583	Skillman	NJ
24584	Skippack	PA
24585	Skippers	VA
24586	Skipperville	AL
24587	Skipwith	VA
24588	Skokie	IL
24589	Skowhegan	ME
24590	Skull Valley	AZ
24591	Skwentna	AK
24592	Skyforest	CA
24593	Skykomish	WA
24594	Skyland	NC
24595	Skytop	PA
24596	Slab Fork	WV
24597	Slade	KY
24598	Slagle	LA
24599	Slanesville	WV
24600	Slate Hill	NY
24601	Slate Run	PA
24602	Slate Spring	MS
24603	Slatedale	PA
24604	Slater	CO
24605	Slater	IA
24606	Slater	MO
24607	Slater	SC
24608	Slatersville	RI
24609	Slaterville Springs	NY
24610	Slatington	PA
24611	Slaton	TX
24612	Slatyfork	WV
24613	Slaughter	LA
24614	Slaughters	KY
24615	Slayden	TN
24616	Slayton	MN
24617	Sledge	MS
24618	Sleepy Eye	MN
24619	Sleetmute	AK
24620	Slemp	KY
24621	Slick	OK
24622	Slickville	PA
24623	Slidell	LA
24624	Slidell	TX
24625	Sligo	PA
24626	Slinger	WI
24627	Slingerlands	NY
24628	Slippery Rock	PA
24629	Sloan	IA
24630	Sloan	NV
24631	Sloansville	NY
24632	Sloatsburg	NY
24633	Slocomb	AL
24634	Slocum	RI
24635	Sloughhouse	CA
24636	Slovan	PA
24637	Smackover	AR
24638	Smallwood	NY
24639	Smarr	GA
24640	Smartt	TN
24641	Smartville	CA
24642	Smelterville	ID
24643	Smethport	PA
24644	Smicksburg	PA
24645	Smilax	KY
24646	Smiley	TX
24647	Smith	NV
24648	Smith Center	KS
24649	Smith Lake	NM
24650	Smith Mills	KY
24651	Smith River	CA
24652	Smithboro	IL
24653	Smithboro	NY
24654	Smithburg	WV
24655	Smithdale	MS
24656	Smithers	WV
24657	Smithfield	IL
24658	Smithfield	KY
24659	Smithfield	ME
24660	Smithfield	NC
24661	Smithfield	NE
24662	Smithfield	OH
24663	Smithfield	PA
24664	Smithfield	RI
24665	Smithfield	UT
24666	Smithfield	VA
24667	Smithfield	WV
24668	Smithland	IA
24669	Smithland	KY
24670	Smithmill	PA
24671	Smiths Creek	MI
24672	Smiths Grove	KY
24673	Smiths Station	AL
24674	Smithsburg	MD
24675	Smithshire	IL
24676	Smithton	IL
24677	Smithton	MO
24678	Smithton	PA
24679	Smithtown	NY
24680	Smithville	AR
24681	Smithville	GA
24682	Smithville	IN
24683	Smithville	MO
24684	Smithville	MS
24685	Smithville	OH
24686	Smithville	OK
24687	Smithville	TN
24688	Smithville	TX
24689	Smithville	WV
24690	Smithville Flats	NY
24691	Smithwick	SD
24692	Smoaks	SC
24693	Smock	PA
24694	Smokerun	PA
24695	Smoketown	PA
24696	Smoot	WV
24697	Smoot	WY
24698	Smyer	TX
24699	Smyrna	DE
24700	Smyrna	GA
24701	Smyrna	MI
24702	Smyrna	NC
24703	Smyrna	NY
24704	Smyrna	SC
24705	Smyrna	TN
24706	Smyrna Mills	ME
24707	Sneads	FL
24708	Sneads Ferry	NC
24709	Sneedville	TN
24710	Snelling	CA
24711	Snellville	GA
24712	Snohomish	WA
24713	Snook	TX
24714	Snoqualmie	WA
24715	Snoqualmie Pass	WA
24716	Snover	MI
24717	Snow	OK
24718	Snow Camp	NC
24719	Snow Hill	MD
24720	Snow Hill	NC
24721	Snow Lake	AR
24722	Snow Shoe	PA
24723	Snowflake	AZ
24724	Snowmass	CO
24725	Snowmass Village	CO
24726	Snowshoe	WV
24727	Snowville	UT
24728	Snyder	CO
24729	Snyder	NE
24730	Snyder	OK
24731	Snyder	TX
24732	Snydersburg	PA
24733	Snydertown	PA
24734	Soap Lake	WA
24735	Sobieski	WI
24736	Social Circle	GA
24737	Society Hill	SC
24738	Socorro	NM
24739	Sod	WV
24740	Soda Springs	CA
24741	Soda Springs	ID
24742	Soddy Daisy	TN
24743	Sodus	MI
24744	Sodus	NY
24745	Sodus Point	NY
24746	Solana Beach	CA
24747	Solano	NM
24748	Soldier	IA
24749	Soldier	KS
24750	Soldier	KY
24751	Soldiers Grove	WI
24752	Soldotna	AK
24753	Solebury	PA
24754	Soledad	CA
24755	Solen	ND
24756	Solgohachia	AR
24757	Solo	MO
24758	Solomon	AZ
24759	Solomon	KS
24760	Solomons	MD
24761	Solon	IA
24762	Solon	ME
24763	Solon	OH
24764	Solon Springs	WI
24765	Solsberry	IN
24766	Solsville	NY
24767	Solvang	CA
24768	Solway	MN
24769	Somerdale	NJ
24770	Somerdale	OH
24771	Somers	CT
24772	Somers	IA
24773	Somers	MT
24774	Somers	NY
24775	Somers	WI
24776	Somers Point	NJ
24777	Somerset	CA
24778	Somerset	CO
24779	Somerset	IN
24780	Somerset	KY
24781	Somerset	MA
24782	Somerset	MI
24783	Somerset	NJ
24784	Somerset	OH
24785	Somerset	PA
24786	Somerset	TX
24787	Somerset	VA
24788	Somerset	WI
24789	Somerset Center	MI
24790	Somersville	CT
24791	Somersworth	NH
24792	Somerton	AZ
24793	Somerville	AL
24794	Somerville	IN
24795	Somerville	MA
24796	Somerville	NJ
24797	Somerville	OH
24798	Somerville	TN
24799	Somerville	TX
24800	Somerville	VA
24801	Somes Bar	CA
24802	Somis	CA
24803	Somonauk	IL
24804	Sondheimer	LA
24805	Sonoita	AZ
24806	Sonoma	CA
24807	Sonora	CA
24808	Sonora	KY
24809	Sonora	TX
24810	Sontag	MS
24811	Sonyea	NY
24812	Sopchoppy	FL
24813	Soper	OK
24814	Soperton	GA
24815	Sophia	NC
24816	Sophia	WV
24817	Soquel	CA
24818	Sorento	IL
24819	Sorrento	FL
24820	Sorrento	LA
24821	Sorrento	ME
24822	Soso	MS
24823	Soudan	MN
24824	Souderton	PA
24825	Soulsbyville	CA
24826	Sound Beach	NY
24827	Sour Lake	TX
24828	Souris	ND
24829	South Acworth	NH
24830	South Amana	IA
24831	South Amboy	NJ
24832	South Barre	MA
24833	South Barre	VT
24834	South Bay	FL
24835	South Beach	OR
24836	South Beloit	IL
24837	South Bend	IN
24838	South Bend	NE
24839	South Bend	TX
24840	South Bend	WA
24841	South Berwick	ME
24842	South Bethlehem	NY
24843	South Bloomingville	OH
24844	South Boardman	MI
24845	South Boston	VA
24846	South Bound Brook	NJ
24847	South Branch	MI
24848	South Bristol	ME
24849	South Britain	CT
24850	South Burlington	VT
24851	South Butler	NY
24852	South Byron	NY
24853	South Cairo	NY
24854	South Canaan	PA
24855	South Carrollton	KY
24856	South Carver	MA
24857	South Casco	ME
24858	South Charleston	OH
24859	South Chatham	MA
24860	South China	ME
24861	South Cle Elum	WA
24862	South Colby	WA
24863	South Colton	NY
24864	South Dartmouth	MA
24865	South Dayton	NY
24866	South Deerfield	MA
24867	South Dennis	MA
24868	South Dennis	NJ
24869	South Dos Palos	CA
24870	South Easton	MA
24871	South Egremont	MA
24872	South El Monte	CA
24873	South Elgin	IL
24874	South English	IA
24875	South Fallsburg	NY
24876	South Fork	CO
24877	South Fork	MO
24878	South Fork	PA
24879	South Freeport	ME
24880	South Fulton	TN
24881	South Gardiner	ME
24882	South Gate	CA
24883	South Gibson	PA
24884	South Glastonbury	CT
24885	South Glens Falls	NY
24886	South Grafton	MA
24887	South Greenfield	MO
24888	South Hackensack	NJ
24889	South Hadley	MA
24890	South Hamilton	MA
24891	South Hampton	NH
24892	South Harwich	MA
24893	South Haven	KS
24894	South Haven	MI
24895	South Haven	MN
24896	South Heart	ND
24897	South Heights	PA
24898	South Hero	VT
24899	South Hill	VA
24900	South Holland	IL
24901	South Houston	TX
24902	South Hutchinson	KS
24903	South International Falls	MN
24904	South Jamesport	NY
24905	South Jordan	UT
24906	South Kent	CT
24907	South Kortright	NY
24908	South Lake Tahoe	CA
24909	South Lancaster	MA
24910	South Lebanon	OH
24911	South Lee	MA
24912	South Lima	NY
24913	South Londonderry	VT
24914	South Lyme	CT
24915	South Lyon	MI
24916	South Milford	IN
24917	South Mills	NC
24918	South Milwaukee	WI
24919	South Montrose	PA
24920	South Mountain	PA
24921	South Naknek	AK
24922	South New Berlin	NY
24923	South Newbury	NH
24924	South Newfane	VT
24925	South Orange	NJ
24926	South Orleans	MA
24927	South Otselic	NY
24928	South Ozone Park	NY
24929	South Padre Island	TX
24930	South Paris	ME
24931	South Park	PA
24932	South Pasadena	CA
24933	South Pekin	IL
24934	South Pittsburg	TN
24935	South Plainfield	NJ
24936	South Plains	TX
24937	South Plymouth	NY
24938	South Point	OH
24939	South Pomfret	VT
24940	South Portland	ME
24941	South Portsmouth	KY
24942	South Prairie	WA
24943	South Range	MI
24944	South Range	WI
24945	South Richmond Hill	NY
24946	South River	NJ
24947	South Rockwood	MI
24948	South Roxana	IL
24949	South Royalton	VT
24950	South Ryegate	VT
24951	South Saint Paul	MN
24952	South Salem	NY
24953	South Salem	OH
24954	South San Francisco	CA
24955	South Seaville	NJ
24956	South Shore	KY
24957	South Shore	SD
24958	South Sioux City	NE
24959	South Solon	OH
24960	South Sterling	PA
24961	South Strafford	VT
24962	South Sutton	NH
24963	South Tamworth	NH
24964	South Thomaston	ME
24965	South Union	KY
24966	South Vienna	OH
24967	South Wales	NY
24968	South Walpole	MA
24969	South Wayne	WI
24970	South Webster	OH
24971	South Wellfleet	MA
24972	South West City	MO
24973	South Weymouth	MA
24974	South Whitley	IN
24975	South Williamson	KY
24976	South Willington	CT
24977	South Wilmington	IL
24978	South Windham	CT
24979	South Windham	ME
24980	South Windsor	CT
24981	South Woodstock	CT
24982	South Woodstock	VT
24983	South Yarmouth	MA
24984	Southampton	MA
24985	Southampton	NY
24986	Southampton	PA
24987	Southard	OK
24988	Southaven	MS
24989	Southborough	MA
24990	Southbridge	MA
24991	Southbury	CT
24992	Southeastern	PA
24993	Southern Md Facility	MD
24994	Southern Pines	NC
24995	Southfield	MA
24996	Southfield	MI
24997	Southfields	NY
24998	Southgate	MI
24999	Southington	CT
25000	Southington	OH
25001	Southlake	TX
25002	Southmayd	TX
25003	Southmont	NC
25004	Southold	NY
25005	Southport	CT
25006	Southport	ME
25007	Southport	NC
25008	Southside	TN
25009	Southside	WV
25010	Southview	PA
25011	Southwest	PA
25012	Southwest Harbor	ME
25013	Southwick	MA
25014	Southworth	WA
25015	Spade	TX
25016	Spalding	MI
25017	Spalding	NE
25018	Spanaway	WA
25019	Spangle	WA
25020	Spangler	PA
25021	Spanish Fork	UT
25022	Spanish Fort	AL
25023	Spanishburg	WV
25024	Sparkill	NY
25025	Sparkman	AR
25026	Sparks	GA
25027	Sparks	NE
25028	Sparks	NV
25029	Sparks	OK
25030	Sparks Glencoe	MD
25031	Sparland	IL
25032	Sparr	FL
25033	Sparrow Bush	NY
25034	Sparrows Point	MD
25035	Sparta	GA
25036	Sparta	IL
25037	Sparta	KY
25038	Sparta	MI
25039	Sparta	MO
25040	Sparta	NC
25041	Sparta	NJ
25042	Sparta	OH
25043	Sparta	TN
25044	Sparta	VA
25045	Sparta	WI
25046	Spartanburg	SC
25047	Spartansburg	PA
25048	Spavinaw	OK
25049	Spearfish	SD
25050	Spearman	TX
25051	Spearsville	LA
25052	Spearville	KS
25053	Speculator	NY
25054	Speed	NC
25055	Speedway	IN
25056	Speedwell	TN
25057	Speedwell	VA
25058	Speer	IL
25059	Spelter	WV
25060	Spencer	IA
25061	Spencer	ID
25062	Spencer	IN
25063	Spencer	MA
25064	Spencer	NC
25065	Spencer	NE
25066	Spencer	NY
25067	Spencer	OH
25068	Spencer	OK
25069	Spencer	SD
25070	Spencer	TN
25071	Spencer	VA
25072	Spencer	WI
25073	Spencer	WV
25074	Spencerport	NY
25075	Spencertown	NY
25076	Spencerville	IN
25077	Spencerville	MD
25078	Spencerville	OH
25079	Spencerville	OK
25080	Speonk	NY
25081	Sperry	IA
25082	Sperry	OK
25083	Sperryville	VA
25084	Spiceland	IN
25085	Spicer	MN
25086	Spicewood	TX
25087	Spickard	MO
25088	Spillville	IA
25089	Spindale	NC
25090	Spinnerstown	PA
25091	Spirit Lake	IA
25092	Spirit Lake	ID
25093	Spiritwood	ND
25094	Spiro	OK
25095	Spivey	KS
25096	Splendora	TX
25097	Spofford	NH
25098	Spokane	MO
25099	Spokane	WA
25100	Spooner	WI
25101	Spotswood	NJ
25102	Spotsylvania	VA
25103	Spottsville	KY
25104	Spout Spring	VA
25105	Spraggs	PA
25106	Sprague	NE
25107	Sprague	WA
25108	Sprague	WV
25109	Sprague River	OR
25110	Spragueville	IA
25111	Sprakers	NY
25112	Sprankle Mills	PA
25113	Spray	OR
25114	Spreckels	CA
25115	Spring	TX
25116	Spring Arbor	MI
25117	Spring Branch	TX
25118	Spring Brook	NY
25119	Spring Church	PA
25120	Spring City	PA
25121	Spring City	TN
25122	Spring City	UT
25123	Spring Creek	NV
25124	Spring Creek	PA
25125	Spring Creek	TN
25126	Spring Dale	WV
25127	Spring Gap	MD
25128	Spring Garden	AL
25129	Spring Glen	NY
25130	Spring Glen	PA
25131	Spring Green	WI
25132	Spring Grove	IL
25133	Spring Grove	MN
25134	Spring Grove	PA
25135	Spring Grove	VA
25136	Spring Hill	FL
25137	Spring Hill	KS
25138	Spring Hill	TN
25139	Spring Hope	NC
25140	Spring House	PA
25141	Spring Lake	MI
25142	Spring Lake	MN
25143	Spring Lake	NC
25144	Spring Lake	NJ
25145	Spring Mills	PA
25146	Spring Mount	PA
25147	Spring Park	MN
25148	Spring Run	PA
25149	Spring Valley	CA
25150	Spring Valley	IL
25151	Spring Valley	MN
25152	Spring Valley	NY
25153	Spring Valley	OH
25154	Spring Valley	WI
25155	Springboro	OH
25156	Springboro	PA
25157	Springbrook	IA
25158	Springbrook	WI
25159	Springdale	AR
25160	Springdale	MT
25161	Springdale	PA
25162	Springdale	UT
25163	Springdale	WA
25164	Springer	NM
25165	Springer	OK
25166	Springerton	IL
25167	Springerville	AZ
25168	Springfield	AR
25169	Springfield	CO
25170	Springfield	GA
25171	Springfield	ID
25172	Springfield	IL
25173	Springfield	KY
25174	Springfield	LA
25175	Springfield	MA
25176	Springfield	ME
25177	Springfield	MN
25178	Springfield	MO
25179	Springfield	NE
25180	Springfield	NH
25181	Springfield	NJ
25182	Springfield	OH
25183	Springfield	OR
25184	Springfield	PA
25185	Springfield	SC
25186	Springfield	SD
25187	Springfield	TN
25188	Springfield	VA
25189	Springfield	VT
25190	Springfield	WI
25191	Springfield	WV
25192	Springfield Center	NY
25193	Springfield Gardens	NY
25194	Springhill	LA
25195	Springlake	TX
25196	Springport	IN
25197	Springport	MI
25198	Springs	PA
25199	Springtown	PA
25200	Springtown	TX
25201	Springvale	ME
25202	Springview	NE
25203	Springville	AL
25204	Springville	CA
25205	Springville	IA
25206	Springville	IN
25207	Springville	NY
25208	Springville	PA
25209	Springville	TN
25210	Springville	UT
25211	Springwater	NY
25212	Sproul	PA
25213	Spruce	MI
25214	Spruce Creek	PA
25215	Spruce Head	ME
25216	Spruce Pine	AL
25217	Spruce Pine	NC
25218	Spur	TX
25219	Spurgeon	IN
25220	Spurger	TX
25221	Spurlockville	WV
25222	Squaw Lake	MN
25223	Squaw Valley	CA
25224	Squire	WV
25225	Squires	MO
25226	Squirrel Island	ME
25227	St Clairsville	PA
25228	St Columbans	NE
25229	Staatsburg	NY
25230	Stacy	MN
25231	Stacy	NC
25232	Stacyville	IA
25233	Stacyville	ME
25234	Stafford	CT
25235	Stafford	KS
25236	Stafford	NY
25237	Stafford	OH
25238	Stafford	TX
25239	Stafford	VA
25240	Stafford Springs	CT
25241	Staffordsville	KY
25242	Staffordsville	VA
25243	Staffordville	CT
25244	Stahlstown	PA
25245	Staley	NC
25246	Stambaugh	KY
25247	Stambaugh	MI
25248	Stamford	CT
25249	Stamford	NE
25250	Stamford	NY
25251	Stamford	TX
25252	Stamford	VT
25253	Stamping Ground	KY
25254	Stamps	AR
25255	Stanaford	WV
25256	Stanardsville	VA
25257	Stanberry	MO
25258	Stanchfield	MN
25259	Standard	CA
25260	Standard	IL
25261	Standish	CA
25262	Standish	ME
25263	Standish	MI
25264	Stanfield	AZ
25265	Stanfield	NC
25266	Stanfield	OR
25267	Stanford	CA
25268	Stanford	IL
25269	Stanford	IN
25270	Stanford	KY
25271	Stanford	MT
25272	Stanfordville	NY
25273	Stanhope	IA
25274	Stanhope	NJ
25275	Stanley	IA
25276	Stanley	ID
25277	Stanley	KY
25278	Stanley	NC
25279	Stanley	ND
25280	Stanley	NM
25281	Stanley	NY
25282	Stanley	VA
25283	Stanley	WI
25284	Stanleytown	VA
25285	Stanton	AL
25286	Stanton	CA
25287	Stanton	IA
25288	Stanton	KY
25289	Stanton	MI
25290	Stanton	MO
25291	Stanton	ND
25292	Stanton	NE
25293	Stanton	NJ
25294	Stanton	TN
25295	Stanton	TX
25296	Stantonsburg	NC
25297	Stantonville	TN
25298	Stanville	KY
25299	Stanwood	IA
25300	Stanwood	MI
25301	Stanwood	WA
25302	Staplehurst	NE
25303	Staples	MN
25304	Staples	TX
25305	Stapleton	AL
25306	Stapleton	GA
25307	Stapleton	NE
25308	Star	ID
25309	Star	MS
25310	Star	NC
25311	Star	TX
25312	Star City	AR
25313	Star City	IN
25314	Star Junction	PA
25315	Star Lake	NY
25316	Star Lake	WI
25317	Star Prairie	WI
25318	Star Tannery	VA
25319	Starbuck	MN
25320	Starbuck	WA
25321	Starford	PA
25322	Stark	KS
25323	Stark City	MO
25324	Starke	FL
25325	Starks	LA
25326	Starksboro	VT
25327	Starkville	MS
25328	Starkweather	ND
25329	Starlight	PA
25330	Starr	SC
25331	Starrucca	PA
25332	Start	LA
25333	Startex	SC
25334	Startup	WA
25335	State Center	IA
25336	State College	PA
25337	State Farm	VA
25338	State Line	IN
25339	State Line	MS
25340	State Line	PA
25341	State Park	SC
25342	State Road	NC
25343	State University	AR
25344	Stateline	NV
25345	Staten Island	NY
25346	Statenville	GA
25347	Statesboro	GA
25348	Statesville	NC
25349	Statham	GA
25350	Staunton	IL
25351	Staunton	IN
25352	Staunton	VA
25353	Stayton	OR
25354	Steamboat Rock	IA
25355	Steamboat Springs	CO
25356	Steamburg	NY
25357	Stearns	KY
25358	Stebbins	AK
25359	Stedman	NC
25360	Steedman	MO
25361	Steele	AL
25362	Steele	KY
25363	Steele	MO
25364	Steele	ND
25365	Steele City	NE
25366	Steeles Tavern	VA
25367	Steeleville	IL
25368	Steelville	MO
25369	Steen	MN
25370	Steens	MS
25371	Steep Falls	ME
25372	Steger	IL
25373	Stehekin	WA
25374	Steilacoom	WA
25375	Steinauer	NE
25376	Steinhatchee	FL
25377	Stella	MO
25378	Stella	NC
25379	Stella	NE
25380	Stella Niagara	NY
25381	Stem	NC
25382	Stendal	IN
25383	Stennis Space Center	MS
25384	Stephan	SD
25385	Stephen	MN
25386	Stephens	AR
25387	Stephens	GA
25388	Stephens City	VA
25389	Stephenson	MI
25390	Stephenson	VA
25391	Stephenson	WV
25392	Stephensport	KY
25393	Stephentown	NY
25394	Stephenville	TX
25395	Steptoe	WA
25396	Sterling	AK
25397	Sterling	CO
25398	Sterling	CT
25399	Sterling	IL
25400	Sterling	KS
25401	Sterling	MA
25402	Sterling	MI
25403	Sterling	ND
25404	Sterling	NE
25405	Sterling	NY
25406	Sterling	OH
25407	Sterling	OK
25408	Sterling	PA
25409	Sterling	UT
25410	Sterling	VA
25411	Sterling City	TX
25412	Sterling Forest	NY
25413	Sterling Heights	MI
25414	Sterlington	LA
25415	Sterrett	AL
25416	Stet	MO
25417	Stetson	ME
25418	Stetsonville	WI
25419	Steuben	ME
25420	Steuben	WI
25421	Steubenville	OH
25422	Stevens	PA
25423	Stevens Point	WI
25424	Stevens Village	AK
25425	Stevensburg	VA
25426	Stevenson	AL
25427	Stevenson	CT
25428	Stevenson	MD
25429	Stevenson	WA
25430	Stevenson Ranch	CA
25431	Stevensville	MD
25432	Stevensville	MI
25433	Stevensville	MT
25434	Stevensville	PA
25435	Stevensville	VA
25436	Stevinson	CA
25437	Steward	IL
25438	Stewardson	IL
25439	Stewart	MN
25440	Stewart	MS
25441	Stewart	OH
25442	Stewart	TN
25443	Stewarts Point	CA
25444	Stewartstown	PA
25445	Stewartsville	MO
25446	Stewartsville	NJ
25447	Stewartville	MN
25448	Stickney	SD
25449	Stidham	OK
25450	Stigler	OK
25451	Stilesville	IN
25452	Still Pond	MD
25453	Still River	MA
25454	Stillman Valley	IL
25455	Stillmore	GA
25456	Stillwater	ME
25457	Stillwater	MN
25458	Stillwater	NJ
25459	Stillwater	NY
25460	Stillwater	OH
25461	Stillwater	OK
25462	Stillwater	PA
25463	Stilwell	KS
25464	Stilwell	OK
25465	Stinesville	IN
25466	Stinnett	KY
25467	Stinnett	TX
25468	Stinson Beach	CA
25469	Stinson Lake	NH
25470	Stirling	NJ
25471	Stirling City	CA
25472	Stirum	ND
25473	Stites	ID
25474	Stittville	NY
25475	Stitzer	WI
25476	Stockbridge	GA
25477	Stockbridge	MA
25478	Stockbridge	MI
25479	Stockbridge	VT
25480	Stockbridge	WI
25481	Stockdale	OH
25482	Stockdale	PA
25483	Stockdale	TX
25484	Stockertown	PA
25485	Stockett	MT
25486	Stockholm	ME
25487	Stockholm	NJ
25488	Stockholm	SD
25489	Stockholm	WI
25490	Stockland	IL
25491	Stockport	IA
25492	Stockport	OH
25493	Stockton	AL
25494	Stockton	CA
25495	Stockton	GA
25496	Stockton	IA
25497	Stockton	IL
25498	Stockton	KS
25499	Stockton	MD
25500	Stockton	MN
25501	Stockton	MO
25502	Stockton	NJ
25503	Stockton	NY
25504	Stockton	UT
25505	Stockton Springs	ME
25506	Stockville	NE
25507	Stockwell	IN
25508	Stoddard	NH
25509	Stoddard	WI
25510	Stokes	NC
25511	Stokesdale	NC
25512	Stollings	WV
25513	Stone	KY
25514	Stone Creek	OH
25515	Stone Harbor	NJ
25516	Stone Lake	WI
25517	Stone Mountain	GA
25518	Stone Park	IL
25519	Stone Ridge	NY
25520	Stoneboro	PA
25521	Stonefort	IL
25522	Stoneham	CO
25523	Stoneham	MA
25524	Stoneham	ME
25525	Stoneville	MS
25526	Stoneville	NC
25527	Stonewall	LA
25528	Stonewall	MS
25529	Stonewall	NC
25530	Stonewall	OK
25531	Stonewall	TX
25532	Stoney Fork	KY
25533	Stonington	CT
25534	Stonington	IL
25535	Stonington	ME
25536	Stony Brook	NY
25537	Stony Creek	NY
25538	Stony Creek	VA
25539	Stony Point	NC
25540	Stony Point	NY
25541	Stony Ridge	OH
25542	Stonyford	CA
25543	Stopover	KY
25544	Storden	MN
25545	Storm Lake	IA
25546	Stormville	NY
25547	Storrie	CA
25548	Storrs Mansfield	CT
25549	Story	AR
25550	Story	WY
25551	Story City	IA
25552	Stotts City	MO
25553	Stottville	NY
25554	Stoughton	MA
25555	Stoughton	WI
25556	Stout	IA
25557	Stout	OH
25558	Stoutland	MO
25559	Stoutsville	MO
25560	Stoutsville	OH
25561	Stovall	NC
25562	Stover	MO
25563	Stow	MA
25564	Stow	NY
25565	Stow	OH
25566	Stowe	VT
25567	Stowell	TX
25568	Stoy	IL
25569	Stoystown	PA
25570	Strabane	PA
25571	Strafford	MO
25572	Strafford	NH
25573	Strafford	VT
25574	Strandburg	SD
25575	Strandquist	MN
25576	Strang	NE
25577	Strang	OK
25578	Strasburg	CO
25579	Strasburg	IL
25580	Strasburg	MO
25581	Strasburg	ND
25582	Strasburg	OH
25583	Strasburg	PA
25584	Strasburg	VA
25585	Stratford	CA
25586	Stratford	CT
25587	Stratford	IA
25588	Stratford	NJ
25589	Stratford	NY
25590	Stratford	OK
25591	Stratford	SD
25592	Stratford	TX
25593	Stratford	VA
25594	Stratford	WA
25595	Stratford	WI
25596	Stratham	NH
25597	Strathcona	MN
25598	Strathmere	NJ
25599	Strathmore	CA
25600	Strattanville	PA
25601	Stratton	CO
25602	Stratton	ME
25603	Stratton	NE
25604	Stratton	OH
25605	Straughn	IN
25606	Strausstown	PA
25607	Strawberry	AR
25608	Strawberry	CA
25609	Strawberry Plains	TN
25610	Strawberry Point	IA
25611	Strawberry Valley	CA
25612	Strawn	IL
25613	Strawn	TX
25614	Streamwood	IL
25615	Streator	IL
25616	Street	MD
25617	Streeter	ND
25618	Streetman	TX
25619	Streetsboro	OH
25620	Stringer	MS
25621	Stringtown	OK
25622	Stroh	IN
25623	Stromsburg	NE
25624	Strong	AR
25625	Strong	ME
25626	Strong City	KS
25627	Stronghurst	IL
25628	Strongs	MI
25629	Strongstown	PA
25630	Strongsville	OH
25631	Stroud	OK
25632	Stroudsburg	PA
25633	Strum	WI
25634	Strunk	KY
25635	Struthers	OH
25636	Stryker	MT
25637	Stryker	OH
25638	Strykersville	NY
25639	Stuart	FL
25640	Stuart	IA
25641	Stuart	NE
25642	Stuart	OK
25643	Stuart	VA
25644	Stuarts Draft	VA
25645	Studio City	CA
25646	Studley	VA
25647	Stump Creek	PA
25648	Stumpy Point	NC
25649	Sturbridge	MA
25650	Sturdivant	MO
25651	Sturgeon	MO
25652	Sturgeon	PA
25653	Sturgeon Bay	WI
25654	Sturgeon Lake	MN
25655	Sturgis	KY
25656	Sturgis	MI
25657	Sturgis	MS
25658	Sturgis	SD
25659	Sturkie	AR
25660	Sturtevant	WI
25661	Stuttgart	AR
25662	Stuyvesant	NY
25663	Stuyvesant Falls	NY
25664	Suamico	WI
25665	Subiaco	AR
25666	Sublette	IL
25667	Sublette	KS
25668	Sublime	TX
25669	Sublimity	OR
25670	Suburb Maryland Fac	MD
25671	Succasunna	NJ
25672	Success	AR
25673	Success	MO
25674	Suches	GA
25675	Sudan	TX
25676	Sudbury	MA
25677	Sudlersville	MD
25678	Suffern	NY
25679	Suffield	CT
25680	Suffolk	VA
25681	Sugar City	CO
25682	Sugar City	ID
25683	Sugar Grove	IL
25684	Sugar Grove	NC
25685	Sugar Grove	OH
25686	Sugar Grove	PA
25687	Sugar Grove	VA
25688	Sugar Grove	WV
25689	Sugar Hill	NH
25690	Sugar Land	TX
25691	Sugar Loaf	NY
25692	Sugar Run	PA
25693	Sugar Tree	TN
25694	Sugar Valley	GA
25695	Sugarcreek	OH
25696	Sugarloaf	CA
25697	Sugarloaf	PA
25698	Sugartown	LA
25699	Suisun City	CA
25700	Suitland	MD
25701	Sula	MT
25702	Sulligent	AL
25703	Sullivan	IL
25704	Sullivan	IN
25705	Sullivan	KY
25706	Sullivan	ME
25707	Sullivan	MO
25708	Sullivan	NH
25709	Sullivan	OH
25710	Sullivan	WI
25711	Sullivan City	TX
25712	Sullivans Island	SC
25713	Sully	IA
25714	Sulphur	IN
25715	Sulphur	KY
25716	Sulphur	LA
25717	Sulphur	OK
25718	Sulphur Bluff	TX
25719	Sulphur Rock	AR
25720	Sulphur Springs	AR
25721	Sulphur Springs	IN
25722	Sulphur Springs	OH
25723	Sulphur Springs	TX
25724	Sultan	WA
25725	Sultana	CA
25726	Sumas	WA
25727	Sumatra	FL
25728	Sumatra	MT
25729	Sumava Resorts	IN
25730	Sumerco	WV
25731	Sumerduck	VA
25732	Sumiton	AL
25733	Summer Lake	OR
25734	Summer Shade	KY
25735	Summerdale	AL
25736	Summerdale	PA
25737	Summerfield	FL
25738	Summerfield	IL
25739	Summerfield	KS
25740	Summerfield	LA
25741	Summerfield	NC
25742	Summerfield	OH
25743	Summerfield	TX
25744	Summerhill	PA
25745	Summerland	CA
25746	Summerland Key	FL
25747	Summers	AR
25748	Summersville	KY
25749	Summersville	MO
25750	Summersville	WV
25751	Summerton	SC
25752	Summertown	TN
25753	Summerville	GA
25754	Summerville	OR
25755	Summerville	PA
25756	Summerville	SC
25757	Summit	AR
25758	Summit	MS
25759	Summit	NJ
25760	Summit	NY
25761	Summit	SD
25762	Summit	UT
25763	Summit Argo	IL
25764	Summit Hill	PA
25765	Summit Lake	WI
25766	Summit Point	WV
25767	Summit Station	OH
25768	Summit Station	PA
25769	Summitville	IN
25770	Summitville	NY
25771	Summitville	OH
25772	Summitville	TN
25773	Sumner	GA
25774	Sumner	IA
25775	Sumner	IL
25776	Sumner	ME
25777	Sumner	MI
25778	Sumner	MO
25779	Sumner	MS
25780	Sumner	NE
25781	Sumner	TX
25782	Sumner	WA
25783	Sumneytown	PA
25784	Sumpter	OR
25785	Sumrall	MS
25786	Sumter	SC
25787	Sumterville	FL
25788	Sun	LA
25789	Sun City	AZ
25790	Sun City	CA
25791	Sun City	FL
25792	Sun City	KS
25793	Sun City Center	FL
25794	Sun City West	AZ
25795	Sun Prairie	WI
25796	Sun River	MT
25797	Sun Valley	AZ
25798	Sun Valley	CA
25799	Sun Valley	ID
25800	Sun Valley	NV
25801	Sunapee	NH
25802	Sunbright	TN
25803	Sunburg	MN
25804	Sunburst	MT
25805	Sunbury	NC
25806	Sunbury	OH
25807	Sunbury	PA
25808	Suncook	NH
25809	Sundance	WY
25810	Sunderland	MA
25811	Sunderland	MD
25812	Sundown	TX
25813	Sunfield	MI
25814	Sunflower	AL
25815	Sunflower	MS
25816	Sunland	CA
25817	Sunland Park	NM
25818	Sunman	IN
25819	Sunny Side	GA
25820	Sunnyside	NY
25821	Sunnyside	UT
25822	Sunnyside	WA
25823	Sunnyvale	CA
25824	Sunnyvale	TX
25825	Sunol	CA
25826	Sunray	TX
25827	Sunrise Beach	MO
25828	Sunset	LA
25829	Sunset	ME
25830	Sunset	SC
25831	Sunset	TX
25832	Sunset Beach	CA
25833	Sunset Beach	NC
25834	Sunshine	LA
25835	Sunspot	NM
25836	Supai	AZ
25837	Superior	AZ
25838	Superior	IA
25839	Superior	MT
25840	Superior	NE
25841	Superior	WI
25842	Superior	WY
25843	Suplee	PA
25844	Supply	NC
25845	Suquamish	WA
25846	Surfside	CA
25847	Surgoinsville	TN
25848	Suring	WI
25849	Surprise	AZ
25850	Surprise	NE
25851	Surprise	NY
25852	Surrency	GA
25853	Surrey	ND
25854	Surry	ME
25855	Surry	VA
25856	Surveyor	WV
25857	Susan	VA
25858	Susanville	CA
25859	Susquehanna	PA
25860	Sussex	NJ
25861	Sussex	VA
25862	Sussex	WI
25863	Sutersville	PA
25864	Sutherland	IA
25865	Sutherland	NE
25866	Sutherland	VA
25867	Sutherland Springs	TX
25868	Sutherlin	OR
25869	Sutherlin	VA
25870	Sutter	CA
25871	Sutter	IL
25872	Sutter Creek	CA
25873	Sutton	AK
25874	Sutton	MA
25875	Sutton	ND
25876	Sutton	NE
25877	Sutton	VT
25878	Sutton	WV
25879	Suttons Bay	MI
25880	Suwanee	GA
25881	Suwannee	FL
25882	Swain	NY
25883	Swainsboro	GA
25884	Swaledale	IA
25885	Swampscott	MA
25886	Swan	IA
25887	Swan Lake	MS
25888	Swan Lake	NY
25889	Swan River	MN
25890	Swan Valley	ID
25891	Swanlake	ID
25892	Swannanoa	NC
25893	Swanquarter	NC
25894	Swans Island	ME
25895	Swansboro	NC
25896	Swansea	MA
25897	Swansea	SC
25898	Swanton	MD
25899	Swanton	NE
25900	Swanton	OH
25901	Swanton	VT
25902	Swanville	MN
25903	Swanzey	NH
25904	Swarthmore	PA
25905	Swartswood	NJ
25906	Swartz	LA
25907	Swartz Creek	MI
25908	Swatara	MN
25909	Swayzee	IN
25910	Swea City	IA
25911	Swedesboro	NJ
25912	Swedesburg	IA
25913	Sweeden	KY
25914	Sweeny	TX
25915	Sweet	ID
25916	Sweet Briar	VA
25917	Sweet Grass	MT
25918	Sweet Home	AR
25919	Sweet Home	OR
25920	Sweet Home	TX
25921	Sweet Springs	MO
25922	Sweet Valley	PA
25923	Sweet Water	AL
25924	Sweetser	IN
25925	Sweetwater	OK
25926	Sweetwater	TN
25927	Sweetwater	TX
25928	Swengel	PA
25929	Swepsonville	NC
25930	Swift	MN
25931	Swifton	AR
25932	Swiftown	MS
25933	Swiftwater	PA
25934	Swink	CO
25935	Swink	OK
25936	Swisher	IA
25937	Swiss	WV
25938	Swisshome	OR
25939	Switchback	WV
25940	Switz City	IN
25941	Switzer	WV
25942	Swoope	VA
25943	Swords Creek	VA
25944	Sybertsville	PA
25945	Sycamore	AL
25946	Sycamore	GA
25947	Sycamore	IL
25948	Sycamore	KS
25949	Sycamore	OH
25950	Sycamore	PA
25951	Sycamore	SC
25952	Sycamore Valley	OH
25953	Sydney	FL
25954	Sykeston	ND
25955	Sykesville	MD
25956	Sykesville	PA
25957	Sylacauga	AL
25958	Sylmar	CA
25959	Sylva	NC
25960	Sylvan Beach	MI
25961	Sylvan Beach	NY
25962	Sylvan Grove	KS
25963	Sylvania	AL
25964	Sylvania	GA
25965	Sylvania	OH
25966	Sylvania	PA
25967	Sylvester	GA
25968	Sylvester	TX
25969	Sylvester	WV
25970	Sylvia	KS
25971	Symsonia	KY
25972	Syosset	NY
25973	Syracuse	IN
25974	Syracuse	KS
25975	Syracuse	MO
25976	Syracuse	NE
25977	Syracuse	NY
25978	Syracuse	OH
25979	Syracuse	UT
25980	Syria	VA
25981	Taberg	NY
25982	Tabernacle	NJ
25983	Tabernash	CO
25984	Tabiona	UT
25985	Table Grove	IL
25986	Table Rock	NE
25987	Tabor	IA
25988	Tabor	SD
25989	Tabor City	NC
25990	Tacna	AZ
25991	Tacoma	WA
25992	Taconic	CT
25993	Taconite	MN
25994	Tad	WV
25995	Taft	CA
25996	Taft	OK
25997	Taft	TN
25998	Taft	TX
25999	Tafton	PA
26000	Taftsville	VT
26001	Taftville	CT
26002	Tahlequah	OK
26003	Tahoe City	CA
26004	Tahoe Vista	CA
26005	Tahoka	TX
26006	Taholah	WA
26007	Tahoma	CA
26008	Tahuya	WA
26009	Taiban	NM
26010	Takoma Park	MD
26011	Takotna	AK
26012	Talala	OK
26013	Talbot	IN
26014	Talbott	TN
26015	Talbotton	GA
26016	Talco	TX
26017	Talcott	WV
26018	Talent	OR
26019	Talihina	OK
26020	Talisheek	LA
26021	Talkeetna	AK
26022	Talking Rock	GA
26023	Tall Timbers	MD
26024	Talladega	AL
26025	Tallahassee	FL
26026	Tallapoosa	GA
26027	Tallapoosa	MO
26028	Tallassee	AL
26029	Tallassee	TN
26030	Tallevast	FL
26031	Tallmadge	OH
26032	Tallman	NY
26033	Tallmansville	WV
26034	Tallula	IL
26035	Tallulah	LA
26036	Tallulah Falls	GA
26037	Talmage	CA
26038	Talmage	KS
26039	Talmage	NE
26040	Talmage	PA
26041	Talmage	UT
26042	Talmo	GA
26043	Talmoon	MN
26044	Taloga	OK
26045	Talpa	TX
26046	Tama	IA
26047	Tamaqua	PA
26048	Tamarack	MN
26049	Tamaroa	IL
26050	Tamassee	SC
26051	Tamiment	PA
26052	Tamms	IL
26053	Tampa	FL
26054	Tampa	KS
26055	Tampico	IL
26056	Tamworth	NH
26057	Tanacross	AK
26058	Tanana	AK
26059	Taneytown	MD
26060	Taneyville	MO
26061	Tangent	OR
26062	Tangerine	FL
26063	Tangier	VA
26064	Tangipahoa	LA
26065	Tanner	AL
26066	Tannersville	NY
26067	Tannersville	PA
26068	Tannersville	VA
26069	Taopi	MN
26070	Taos	NM
26071	Taos Ski Valley	NM
26072	Tappahannock	VA
26073	Tappan	NY
26074	Tappen	ND
26075	Tar Heel	NC
26076	Tarawa Terrace	NC
26077	Tarboro	NC
26078	Tarentum	PA
26079	Tariffville	CT
26080	Tarkio	MO
26081	Tarlton	OH
26082	Tarpley	TX
26083	Tarpon Springs	FL
26084	Tarrs	PA
26085	Tarrytown	GA
26086	Tarrytown	NY
26087	Tarzan	TX
26088	Tarzana	CA
26089	Tasley	VA
26090	Taswell	IN
26091	Tatamy	PA
26092	Tate	GA
26093	Tateville	KY
26094	Tatitlek	AK
26095	Tatum	NM
26096	Tatum	SC
26097	Tatum	TX
26098	Tatums	OK
26099	Taunton	MA
26100	Taunton	MN
26101	Tavares	FL
26102	Tavernier	FL
26103	Tawas City	MI
26104	Taylor	AR
26105	Taylor	AZ
26106	Taylor	LA
26107	Taylor	MI
26108	Taylor	MO
26109	Taylor	MS
26110	Taylor	ND
26111	Taylor	NE
26112	Taylor	PA
26113	Taylor	TX
26114	Taylor	WI
26115	Taylor Ridge	IL
26116	Taylor Springs	IL
26117	Taylors	SC
26118	Taylors Falls	MN
26119	Taylors Island	MD
26120	Taylorstown	PA
26121	Taylorsville	CA
26122	Taylorsville	GA
26123	Taylorsville	IN
26124	Taylorsville	KY
26125	Taylorsville	MS
26126	Taylorsville	NC
26127	Taylorville	IL
26128	Tazewell	TN
26129	Tazewell	VA
26130	Tchula	MS
26131	Tea	SD
26132	Teaberry	KY
26133	Teachey	NC
26134	Teague	TX
26135	Teaneck	NJ
26136	Teasdale	UT
26137	Teays	WV
26138	Tebbetts	MO
26139	Tecate	CA
26140	Techny	IL
26141	Tecopa	CA
26142	Tecumseh	KS
26143	Tecumseh	MI
26144	Tecumseh	MO
26145	Tecumseh	NE
26146	Tecumseh	OK
26147	Teec Nos Pos	AZ
26148	Teeds Grove	IA
26149	Tefft	IN
26150	Tehachmeisterdish_server	CA
26151	Tehama	CA
26152	Tehuacana	TX
26153	Teigen	MT
26154	Tekamah	NE
26155	Tekoa	WA
26156	Tekonsha	MI
26157	Telegraph	TX
26158	Telephone	TX
26159	Telferner	TX
26160	Telford	PA
26161	Telford	TN
26162	Tell	TX
26163	Tell City	IN
26164	Teller	AK
26165	Tellico Plains	TN
26166	Telluride	CO
26167	Telogia	FL
26168	Temecula	CA
26169	Tempe	AZ
26170	Temperance	MI
26171	Temperanceville	VA
26172	Temple	GA
26173	Temple	ME
26174	Temple	NH
26175	Temple	OK
26176	Temple	PA
26177	Temple	TX
26178	Temple Bar Marina	AZ
26179	Temple City	CA
26180	Temple Hills	MD
26181	Templeton	CA
26182	Templeton	IA
26183	Templeton	IN
26184	Templeton	MA
26185	Templeton	PA
26186	Templeville	MD
26187	Ten Mile	TN
26188	Ten Sleep	WY
26189	Tenafly	NJ
26190	Tenaha	TX
26191	Tenakee Springs	AK
26192	Tenants Harbor	ME
26193	Tendoy	ID
26194	Tenino	WA
26195	Tenmile	OR
26196	Tennent	NJ
26197	Tennessee	IL
26198	Tennessee Colony	TX
26199	Tennessee Ridge	TN
26200	Tennga	GA
26201	Tennille	GA
26202	Tennyson	IN
26203	Tennyson	TX
26204	Tensed	ID
26205	Tenstrike	MN
26206	Tererro	NM
26207	Terlingua	TX
26208	Terlton	OK
26209	Termo	CA
26210	Terra Alta	WV
26211	Terra Bella	CA
26212	Terra Ceia	FL
26213	Terrace Park	OH
26214	Terral	OK
26215	Terre Haute	IN
26216	Terre Hill	PA
26217	Terrebonne	OR
26218	Terrell	NC
26219	Terrell	TX
26220	Terreton	ID
26221	Terril	IA
26222	Terry	MS
26223	Terry	MT
26224	Terryville	CT
26225	Tescott	KS
26226	Tesuque	NM
26227	Teterboro	NJ
26228	Teton	ID
26229	Teton Village	WY
26230	Tetonia	ID
26231	Teutopolis	IL
26232	Tewksbury	MA
26233	Texarkana	AR
26234	Texarkana	TX
26235	Texas City	TX
26236	Texhoma	OK
26237	Texico	IL
26238	Texico	NM
26239	Texline	TX
26240	Texola	OK
26241	Thackerville	OK
26242	Thatcher	AZ
26243	Thatcher	ID
26244	Thawville	IL
26245	Thaxton	MS
26246	Thaxton	VA
26247	Thayer	IA
26248	Thayer	IL
26249	Thayer	IN
26250	Thayer	KS
26251	Thayer	MO
26252	Thayne	WY
26253	The Colony	TX
26254	The Dalles	OR
26255	The Lakes	NV
26256	The Plains	OH
26257	The Plains	VA
26258	The Rock	GA
26259	The Sea Ranch	CA
26260	The Villages	FL
26261	Thebes	IL
26262	Thedford	NE
26263	Thelma	KY
26264	Thendara	NY
26265	Theodore	AL
26266	Theodosia	MO
26267	Theresa	NY
26268	Theresa	WI
26269	Theriot	LA
26270	Thermal	CA
26271	Thermopolis	WY
26272	Thetford	VT
26273	Thetford Center	VT
26274	Thibodaux	LA
26275	Thicket	TX
26276	Thida	AR
26277	Thief River Falls	MN
26278	Thiells	NY
26279	Thiensville	WI
26280	Thomas	OK
26281	Thomas	WV
26282	Thomasboro	IL
26283	Thomaston	AL
26284	Thomaston	CT
26285	Thomaston	GA
26286	Thomaston	ME
26287	Thomaston	TX
26288	Thomastown	MS
26289	Thomasville	AL
26290	Thomasville	GA
26291	Thomasville	NC
26292	Thomasville	PA
26293	Thompson	CT
26294	Thompson	IA
26295	Thompson	MO
26296	Thompson	ND
26297	Thompson	OH
26298	Thompson	PA
26299	Thompson	UT
26300	Thompson Falls	MT
26301	Thompson Ridge	NY
26302	Thompsons	TX
26303	Thompsons Station	TN
26304	Thompsontown	PA
26305	Thompsonville	IL
26306	Thompsonville	MI
26307	Thompsonville	NY
26308	Thomson	GA
26309	Thomson	IL
26310	Thonotosassa	FL
26311	Thor	IA
26312	Thoreau	NM
26313	Thorn Hill	TN
26314	Thornburg	IA
26315	Thornburg	VA
26316	Thorndale	PA
26317	Thorndale	TX
26318	Thorndike	MA
26319	Thorndike	ME
26320	Thorne Bay	AK
26321	Thornfield	MO
26322	Thornton	AR
26323	Thornton	CA
26324	Thornton	IA
26325	Thornton	IL
26326	Thornton	KY
26327	Thornton	NH
26328	Thornton	PA
26329	Thornton	TX
26330	Thornton	WA
26331	Thornton	WV
26332	Thorntown	IN
26333	Thornville	OH
26334	Thornwood	NY
26335	Thorofare	NJ
26336	Thorp	WA
26337	Thorp	WI
26338	Thorpe	WV
26339	Thorsby	AL
26340	Thousand Island Park	NY
26341	Thousand Oaks	CA
26342	Thousand Palms	CA
26343	Thousandsticks	KY
26344	Thrall	TX
26345	Three Bridges	NJ
26346	Three Forks	MT
26347	Three Lakes	WI
26348	Three Mile Bay	NY
26349	Three Oaks	MI
26350	Three Rivers	CA
26351	Three Rivers	MA
26352	Three Rivers	MI
26353	Three Rivers	TX
26354	Three Springs	PA
26355	Throckmorton	TX
26356	Thurman	IA
26357	Thurman	OH
26358	Thurmond	NC
26359	Thurmond	WV
26360	Thurmont	MD
26361	Thurston	NE
26362	Thurston	OH
26363	Thurston	OR
26364	Tibbie	AL
26365	Tichnor	AR
26366	Tickfaw	LA
26367	Ticonderoga	NY
26368	Tidewater	OR
26369	Tidioute	PA
26370	Tie Plant	MS
26371	Tie Siding	WY
26372	Tierra Amarilla	NM
26373	Tieton	WA
26374	Tiff	MO
26375	Tiff City	MO
26376	Tiffin	IA
26377	Tiffin	OH
26378	Tifton	GA
26379	Tiger	GA
26380	Tigerton	WI
26381	Tigerville	SC
26382	Tignall	GA
26383	Tigrett	TN
26384	Tijeras	NM
26385	Tilden	IL
26386	Tilden	NE
26387	Tilden	TX
26388	Tilghman	MD
26389	Tiline	KY
26390	Tillamook	OR
26391	Tillar	AR
26392	Tillatoba	MS
26393	Tilleda	WI
26394	Tiller	OR
26395	Tillery	NC
26396	Tillman	SC
26397	Tillson	NY
26398	Tilly	AR
26399	Tilton	IL
26400	Tilton	NH
26401	Tiltonsville	OH
26402	Timber	OR
26403	Timber Lake	SD
26404	Timberlake	NC
26405	Timberon	NM
26406	Timberville	VA
26407	Timblin	PA
26408	Timbo	AR
26409	Timewell	IL
26410	Timmonsville	SC
26411	Timnath	CO
26412	Timpson	TX
26413	Tina	MO
26414	Tingley	IA
26415	Tinker Afb	OK
26416	Tinley Park	IL
26417	Tinnie	NM
26418	Tinsley	MS
26419	Tintah	MN
26420	Tioga	LA
26421	Tioga	ND
26422	Tioga	PA
26423	Tioga	TX
26424	Tioga	WV
26425	Tioga Center	NY
26426	Tiona	PA
26427	Tionesta	PA
26428	Tiplersville	MS
26429	Tipp City	OH
26430	Tippecanoe	IN
26431	Tippecanoe	OH
26432	Tippo	MS
26433	Tipton	CA
26434	Tipton	IA
26435	Tipton	IN
26436	Tipton	KS
26437	Tipton	MI
26438	Tipton	MO
26439	Tipton	OK
26440	Tipton	PA
26441	Tipton	TN
26442	Tiptonville	TN
26443	Tire Hill	PA
26444	Tiro	OH
26445	Tisch Mills	WI
26446	Tishomingo	MS
26447	Tishomingo	OK
26448	Tiskilwa	IL
26449	Titonka	IA
26450	Titus	AL
26451	Titusville	FL
26452	Titusville	NJ
26453	Titusville	PA
26454	Tiverton	RI
26455	Tivoli	NY
26456	Tivoli	TX
26457	Toano	VA
26458	Toast	NC
26459	Tobaccoville	NC
26460	Tobias	NE
26461	Tobyhanna	PA
26462	Toccoa	GA
26463	Toccoa Falls	GA
26464	Toccopola	MS
26465	Todd	NC
26466	Todd	PA
26467	Toddville	IA
26468	Toddville	MD
26469	Toeterville	IA
26470	Tofte	MN
26471	Togiak	AK
26472	Tohatchi	NM
26473	Toivola	MI
26474	Tok	AK
26475	Tokeland	WA
26476	Tokio	ND
26477	Tokio	TX
26478	Toksook Bay	AK
26479	Tolar	TX
26480	Toledo	IA
26481	Toledo	IL
26482	Toledo	OH
26483	Toledo	OR
26484	Toledo	WA
26485	Tolland	CT
26486	Tollesboro	KY
26487	Tolleson	AZ
26488	Tolley	ND
26489	Tollhouse	CA
26490	Tolna	ND
26491	Tolono	IL
26492	Tolovana Park	OR
26493	Tolstoy	SD
26494	Tolu	KY
26495	Toluca	IL
26496	Toluca Lake	CA
26497	Tom Bean	TX
26498	Tomah	WI
26499	Tomahawk	KY
26500	Tomahawk	WI
26501	Tomales	CA
26502	Tomball	TX
26503	Tombstone	AZ
26504	Tome	NM
26505	Tomkins Cove	NY
26506	Tompkinsville	KY
26507	Toms Brook	VA
26508	Toms River	NJ
26509	Tonalea	AZ
26510	Tonasket	WA
26511	Tonawanda	NY
26512	Toney	AL
26513	Tonganoxie	KS
26514	Tonica	IL
26515	Tonkawa	OK
26516	Tonopah	AZ
26517	Tonopah	NV
26518	Tontitown	AR
26519	Tonto Basin	AZ
26520	Tontogany	OH
26521	Tony	WI
26522	Tooele	UT
26523	Toomsboro	GA
26524	Toomsuba	MS
26525	Toone	TN
26526	Topanga	CA
26527	Topawa	AZ
26528	Topaz	CA
26529	Topeka	IL
26530	Topeka	IN
26531	Topeka	KS
26532	Topinabee	MI
26533	Topmost	KY
26534	Topock	AZ
26535	Toponas	CO
26536	Toppenish	WA
26537	Topping	VA
26538	Topsfield	MA
26539	Topsfield	ME
26540	Topsham	ME
26541	Topsham	VT
26542	Topton	NC
26543	Topton	PA
26544	Toquerville	UT
26545	Tornado	WV
26546	Tornillo	TX
26547	Toronto	KS
26548	Toronto	OH
26549	Toronto	SD
26550	Torrance	CA
26551	Torrance	PA
26552	Torreon	NM
26553	Torrey	UT
26554	Torrington	CT
26555	Torrington	WY
26556	Tortilla Flat	AZ
26557	Toston	MT
26558	Totowa	NJ
26559	Totz	KY
26560	Touchet	WA
26561	Tougaloo	MS
26562	Toughkenamon	PA
26563	Toulon	IL
26564	Toutle	WA
26565	Tovey	IL
26566	Tow	TX
26567	Towaco	NJ
26568	Towanda	IL
26569	Towanda	KS
26570	Towanda	PA
26571	Towaoc	CO
26572	Tower	MI
26573	Tower	MN
26574	Tower City	ND
26575	Tower City	PA
26576	Tower Hill	IL
26577	Town Creek	AL
26578	Towner	ND
26579	Townley	AL
26580	Townsend	DE
26581	Townsend	GA
26582	Townsend	MA
26583	Townsend	MT
26584	Townsend	TN
26585	Townsend	VA
26586	Townsend	WI
26587	Townshend	VT
26588	Township Of Washington	NJ
26589	Townsville	NC
26590	Townville	PA
26591	Townville	SC
26592	Towson	MD
26593	Toxey	AL
26594	Toyah	TX
26595	Toyahvale	TX
26596	Trabuco Canyon	CA
26597	Tracy	CA
26598	Tracy	IA
26599	Tracy	MN
26600	Tracy City	TN
26601	Tracys Landing	MD
26602	Tracyton	WA
26603	Trade	TN
26604	Traer	IA
26605	Trafalgar	IN
26606	Trafford	AL
26607	Trafford	PA
26608	Trail	MN
26609	Trail	OR
26610	Trail City	SD
26611	Tram	KY
26612	Trampas	NM
26613	Tranquility	NJ
26614	Tranquillity	CA
26615	Transfer	PA
26616	Transylvania	LA
26617	Traphill	NC
26618	Trappe	MD
26619	Trapper Creek	AK
26620	Traskwood	AR
26621	Travelers Rest	SC
26622	Traver	CA
26623	Traverse City	MI
26624	Travis Afb	CA
26625	Treadwell	NY
26626	Trebloc	MS
26627	Treece	KS
26628	Trego	MT
26629	Trego	WI
26630	Treichlers	PA
26631	Treloar	MO
26632	Trementina	NM
26633	Tremont	IL
26634	Tremont	MS
26635	Tremont	PA
26636	Tremont City	OH
26637	Tremonton	UT
26638	Trempealeau	WI
26639	Trenary	MI
26640	Trent	SD
26641	Trent	TX
26642	Trenton	AL
26643	Trenton	FL
26644	Trenton	GA
26645	Trenton	IL
26646	Trenton	KY
26647	Trenton	MI
26648	Trenton	MO
26649	Trenton	NC
26650	Trenton	ND
26651	Trenton	NE
26652	Trenton	NJ
26653	Trenton	OH
26654	Trenton	SC
26655	Trenton	TN
26656	Trenton	TX
26657	Trenton	UT
26658	Tres Piedras	NM
26659	Tres Pinos	CA
26660	Tresckow	PA
26661	Trevett	ME
26662	Trevilians	VA
26663	Trevor	WI
26664	Trevorton	PA
26665	Trexlertown	PA
26666	Treynor	IA
26667	Trezevant	TN
26668	Triadelphia	WV
26669	Triangle	VA
26670	Tribes Hill	NY
26671	Tribune	KS
26672	Tridell	UT
26673	Trilby	FL
26674	Trilla	IL
26675	Trimble	MO
26676	Trimble	OH
26677	Trimble	TN
26678	Trimont	MN
26679	Trinchera	CO
26680	Trinidad	CA
26681	Trinidad	CO
26682	Trinidad	TX
26683	Trinity	AL
26684	Trinity	NC
26685	Trinity	TX
26686	Trinity Center	CA
26687	Trinway	OH
26688	Trion	GA
26689	Tripler Army Medical Center	HI
26690	Triplett	MO
26691	Tripoli	IA
26692	Tripoli	WI
26693	Tripp	SD
26694	Triumph	IL
26695	Trivoli	IL
26696	Trona	CA
26697	Tropic	UT
26698	Trosky	MN
26699	Trosper	KY
26700	Troup	TX
26701	Troupsburg	NY
26702	Trout	LA
26703	Trout Creek	MI
26704	Trout Creek	MT
26705	Trout Creek	NY
26706	Trout Lake	MI
26707	Trout Lake	WA
26708	Trout Run	PA
26709	Troutdale	OR
26710	Troutdale	VA
26711	Troutman	NC
26712	Troutville	PA
26713	Troutville	VA
26714	Troxelville	PA
26715	Troy	AL
26716	Troy	ID
26717	Troy	IL
26718	Troy	IN
26719	Troy	KS
26720	Troy	ME
26721	Troy	MI
26722	Troy	MO
26723	Troy	MT
26724	Troy	NC
26725	Troy	NH
26726	Troy	NY
26727	Troy	OH
26728	Troy	PA
26729	Troy	SC
26730	Troy	TN
26731	Troy	TX
26732	Troy	VA
26733	Troy	VT
26734	Troy	WV
26735	Troy Grove	IL
26736	Troy Mills	IA
26737	Truchas	NM
26738	Truckee	CA
26739	Truesdale	IA
26740	Trufant	MI
26741	Truman	MN
26742	Trumann	AR
26743	Trumansburg	NY
26744	Trumbauersville	PA
26745	Trumbull	CT
26746	Trumbull	NE
26747	Truro	IA
26748	Truro	MA
26749	Trussville	AL
26750	Truth Or Consequences	NM
26751	Truxton	MO
26752	Truxton	NY
26753	Tryon	NC
26754	Tryon	NE
26755	Tryon	OK
26756	Tsaile	AZ
26757	Tualatin	OR
26758	Tuba City	AZ
26759	Tubac	AZ
26760	Tuckahoe	NJ
26761	Tuckahoe	NY
26762	Tuckasegee	NC
26763	Tucker	AR
26764	Tucker	GA
26765	Tuckerman	AR
26766	Tucson	AZ
26767	Tucumcari	NM
26768	Tujunga	CA
26769	Tula	MS
26770	Tulare	CA
26771	Tulare	SD
26772	Tularosa	NM
26773	Tulelake	CA
26774	Tuleta	TX
26775	Tulia	TX
26776	Tullahoma	TN
26777	Tullos	LA
26778	Tully	NY
26779	Tulsa	OK
26780	Tuluksak	AK
26781	Tumacacori	AZ
26782	Tumbling Shoals	AR
26783	Tumtum	WA
26784	Tumwater	WA
26785	Tunas	MO
26786	Tunbridge	VT
26787	Tunica	LA
26788	Tunica	MS
26789	Tunkhannock	PA
26790	Tunnel	NY
26791	Tunnel City	WI
26792	Tunnel Hill	GA
26793	Tunnelton	IN
26794	Tunnelton	WV
26795	Tuntutuliak	AK
26796	Tununak	AK
26797	Tuolumne	CA
26798	Tupelo	AR
26799	Tupelo	MS
26800	Tupelo	OK
26801	Tupman	CA
26802	Tupper Lake	NY
26803	Tuppers Plains	OH
26804	Turbeville	SC
26805	Turbotville	PA
26806	Turin	GA
26807	Turin	NY
26808	Turkey	NC
26809	Turkey	TX
26810	Turkey City	PA
26811	Turkey Creek	LA
26812	Turlock	CA
26813	Turner	AR
26814	Turner	ME
26815	Turner	MI
26816	Turner	MT
26817	Turner	OR
26818	Turners	MO
26819	Turners Falls	MA
26820	Turners Station	KY
26821	Turnersburg	NC
26822	Turnerville	GA
26823	Turney	MO
26824	Turon	KS
26825	Turpin	OK
26826	Turrell	AR
26827	Turtle Creek	PA
26828	Turtle Creek	WV
26829	Turtle Lake	ND
26830	Turtle Lake	WI
26831	Turtlepoint	PA
26832	Turtletown	TN
26833	Turton	SD
26834	Tuscaloosa	AL
26835	Tuscarawas	OH
26836	Tuscarora	MD
26837	Tuscarora	NV
26838	Tuscarora	PA
26839	Tuscola	IL
26840	Tuscola	MI
26841	Tuscola	TX
26842	Tuscumbia	AL
26843	Tuscumbia	MO
26844	Tuskahoma	OK
26845	Tuskegee	AL
26846	Tuskegee Institute	AL
26847	Tussy	OK
26848	Tustin	CA
26849	Tustin	MI
26850	Tuthill	SD
26851	Tutor Key	KY
26852	Tuttle	ND
26853	Tuttle	OK
26854	Tutwiler	MS
26855	Tuxedo	NC
26856	Tuxedo Park	NY
26857	Twain	CA
26858	Twain Harte	CA
26859	Twelve Mile	IN
26860	Twentynine Palms	CA
26861	Twig	MN
26862	Twilight	WV
26863	Twin Bridges	CA
26864	Twin Bridges	MT
26865	Twin Brooks	SD
26866	Twin City	GA
26867	Twin Falls	ID
26868	Twin Lake	MI
26869	Twin Lakes	CO
26870	Twin Lakes	MN
26871	Twin Lakes	WI
26872	Twin Mountain	NH
26873	Twin Oaks	OK
26874	Twin Peaks	CA
26875	Twin Rocks	PA
26876	Twin Valley	MN
26877	Twining	MI
26878	Twinsburg	OH
26879	Twisp	WA
26880	Two Buttes	CO
26881	Two Dot	MT
26882	Two Harbors	MN
26883	Two Rivers	AK
26884	Two Rivers	WI
26885	Ty Ty	GA
26886	Tyaskin	MD
26887	Tybee Island	GA
26888	Tye	TX
26889	Tygh Valley	OR
26890	Tyler	AL
26891	Tyler	MN
26892	Tyler	TX
26893	Tyler Hill	PA
26894	Tylersburg	PA
26895	Tylersport	PA
26896	Tylersville	PA
26897	Tylerton	MD
26898	Tylertown	MS
26899	Tynan	TX
26900	Tyndall	SD
26901	Tyner	IN
26902	Tyner	KY
26903	Tyner	NC
26904	Tyngsboro	MA
26905	Tyonek	AK
26906	Tyringham	MA
26907	Tyro	KS
26908	Tyro	VA
26909	Tyrone	GA
26910	Tyrone	NM
26911	Tyrone	NY
26912	Tyrone	OK
26913	Tyrone	PA
26914	Tyronza	AR
26915	U S A F Academy	CO
26916	Ubly	MI
26917	Ucon	ID
26918	Udall	KS
26919	Udall	MO
26920	Udell	IA
26921	Uehling	NE
26922	Uhrichsville	OH
26923	Ukiah	CA
26924	Ukiah	OR
26925	Uledi	PA
26926	Ulen	MN
26927	Ullin	IL
26928	Ulm	AR
26929	Ulm	MT
26930	Ulman	MO
26931	Ulmer	SC
26932	Ulster	PA
26933	Ulster Park	NY
26934	Ulysses	KS
26935	Ulysses	KY
26936	Ulysses	NE
26937	Ulysses	PA
26938	Umatilla	FL
26939	Umatilla	OR
26940	Umbarger	TX
26941	Umpire	AR
26942	Umpqua	OR
26943	Una	SC
26944	Unadilla	GA
26945	Unadilla	NE
26946	Unadilla	NY
26947	Unalakleet	AK
26948	Unalaska	AK
26949	Uncasville	CT
26950	Uncle Sam	LA
26951	Underhill	VT
26952	Underhill Center	VT
26953	Underwood	IA
26954	Underwood	IN
26955	Underwood	MN
26956	Underwood	ND
26957	Underwood	WA
26958	Uneeda	WV
26959	Unicoi	TN
26960	Union	IA
26961	Union	IL
26962	Union	KY
26963	Union	ME
26964	Union	MI
26965	Union	MO
26966	Union	MS
26967	Union	NE
26968	Union	NH
26969	Union	NJ
26970	Union	OR
26971	Union	SC
26972	Union	WA
26973	Union	WV
26974	Union Bridge	MD
26975	Union Center	SD
26976	Union Center	WI
26977	Union Church	MS
26978	Union City	CA
26979	Union City	GA
26980	Union City	IN
26981	Union City	MI
26982	Union City	NJ
26983	Union City	OH
26984	Union City	OK
26985	Union City	PA
26986	Union City	TN
26987	Union Dale	PA
26988	Union Furnace	OH
26989	Union Grove	AL
26990	Union Grove	NC
26991	Union Grove	WI
26992	Union Hall	VA
26993	Union Hill	IL
26994	Union Hill	NY
26995	Union Lake	MI
26996	Union Mills	IN
26997	Union Mills	NC
26998	Union Pier	MI
26999	Union Point	GA
27000	Union Springs	AL
27001	Union Springs	NY
27002	Union Star	KY
27003	Union Star	MO
27004	Uniondale	IN
27005	Uniondale	NY
27006	Uniontown	AL
27007	Uniontown	AR
27008	Uniontown	KS
27009	Uniontown	KY
27010	Uniontown	MO
27011	Uniontown	OH
27012	Uniontown	PA
27013	Uniontown	WA
27014	Unionville	CT
27015	Unionville	IA
27016	Unionville	IN
27017	Unionville	MD
27018	Unionville	MI
27019	Unionville	MO
27020	Unionville	NY
27021	Unionville	OH
27022	Unionville	PA
27023	Unionville	TN
27024	Unionville	VA
27025	Unionville Center	OH
27026	Uniopolis	OH
27027	United	PA
27028	Unity	IL
27029	Unity	ME
27030	Unity	OR
27031	Unity	WI
27032	Unity House	PA
27033	Unityville	PA
27034	Universal	IN
27035	Universal City	CA
27036	Universal City	TX
27037	University	MS
27038	University Center	MI
27039	University Of Richmond	VA
27040	University Park	IA
27041	University Park	PA
27042	University Place	WA
27043	Upatoi	GA
27044	Upham	ND
27045	Upland	CA
27046	Upland	IN
27047	Upland	NE
27048	Upper Black Eddy	PA
27049	Upper Darby	PA
27050	Upper Fairmount	MD
27051	Upper Falls	MD
27052	Upper Jay	NY
27053	Upper Lake	CA
27054	Upper Marlboro	MD
27055	Upper Sandusky	OH
27056	Upper Tract	WV
27057	Upperco	MD
27058	Upperglade	WV
27059	Upperstrasburg	PA
27060	Upperville	VA
27061	Upsala	MN
27062	Upson	WI
27063	Upton	KY
27064	Upton	MA
27065	Upton	NY
27066	Upton	WY
27067	Urania	LA
27068	Urbana	AR
27069	Urbana	IA
27070	Urbana	IL
27071	Urbana	IN
27072	Urbana	MO
27073	Urbana	OH
27074	Urbandale	IA
27075	Urbanna	VA
27076	Uriah	AL
27077	Urich	MO
27078	Ursa	IL
27079	Ursina	PA
27080	Usk	WA
27081	Ute	IA
27082	Ute Park	NM
27083	Utica	IL
27084	Utica	KS
27085	Utica	KY
27086	Utica	MI
27087	Utica	MN
27088	Utica	MO
27089	Utica	MS
27090	Utica	NE
27091	Utica	NY
27092	Utica	OH
27093	Utica	PA
27094	Utica	SD
27095	Utopia	TX
27096	Uvalda	GA
27097	Uvalde	TX
27098	Uwchland	PA
27099	Uxbridge	MA
27100	Vacaville	CA
27101	Vacherie	LA
27102	Vader	WA
27103	Vadito	NM
27104	Vado	NM
27105	Vaiden	MS
27106	Vail	AZ
27107	Vail	CO
27108	Vail	IA
27109	Vails Gate	NY
27110	Valatie	NY
27111	Valders	WI
27112	Valdese	NC
27113	Valdez	AK
27114	Valdez	NM
27115	Valdosta	GA
27116	Vale	NC
27117	Vale	OR
27118	Vale	SD
27119	Valencia	CA
27120	Valencia	PA
27121	Valentine	AZ
27122	Valentine	NE
27123	Valentine	TX
27124	Valentines	VA
27125	Valera	TX
27126	Valhalla	NY
27127	Valhermoso Springs	AL
27128	Valier	IL
27129	Valier	MT
27130	Valier	PA
27131	Valle Crucis	NC
27132	Vallecito	CA
27133	Vallecitos	NM
27134	Vallejo	CA
27135	Valles Mines	MO
27136	Valley	AL
27137	Valley	NE
27138	Valley	WA
27139	Valley Bend	WV
27140	Valley Center	CA
27141	Valley Center	KS
27142	Valley City	ND
27143	Valley City	OH
27144	Valley Cottage	NY
27145	Valley Falls	KS
27146	Valley Falls	NY
27147	Valley Farms	AZ
27148	Valley Ford	CA
27149	Valley Forge	PA
27150	Valley Grove	WV
27151	Valley Head	AL
27152	Valley Head	WV
27153	Valley Lee	MD
27154	Valley Mills	TX
27155	Valley Park	MO
27156	Valley Park	MS
27157	Valley Spring	TX
27158	Valley Springs	AR
27159	Valley Springs	CA
27160	Valley Springs	SD
27161	Valley Stream	NY
27162	Valley View	PA
27163	Valley View	TX
27164	Valley Village	CA
27165	Valleyford	WA
27166	Valliant	OK
27167	Vallonia	IN
27168	Valmeyer	IL
27169	Valmora	NM
27170	Valmy	NV
27171	Valparaiso	FL
27172	Valparaiso	IN
27173	Valparaiso	NE
27174	Valrico	FL
27175	Valyermo	CA
27176	Van	TX
27177	Van	WV
27178	Van Alstyne	TX
27179	Van Buren	AR
27180	Van Buren	IN
27181	Van Buren	ME
27182	Van Buren	MO
27183	Van Buren	OH
27184	Van Buren Point	NY
27185	Van Dyne	WI
27186	Van Etten	NY
27187	Van Horn	TX
27188	Van Horne	IA
27189	Van Hornesville	NY
27190	Van Lear	KY
27191	Van Meter	IA
27192	Van Nuys	CA
27193	Van Orin	IL
27194	Van Tassell	WY
27195	Van Vleck	TX
27196	Van Vleet	MS
27197	Van Voorhis	PA
27198	Van Wert	IA
27199	Van Wert	OH
27200	Van Wyck	SC
27201	Vance	AL
27202	Vance	MS
27203	Vance	SC
27204	Vanceboro	ME
27205	Vanceboro	NC
27206	Vanceburg	KY
27207	Vancleave	MS
27208	Vancleve	KY
27209	Vancourt	TX
27210	Vancouver	WA
27211	Vandalia	IL
27212	Vandalia	MI
27213	Vandalia	MO
27214	Vandalia	MT
27215	Vandalia	OH
27216	Vandemere	NC
27217	Vanderbilt	MI
27218	Vanderbilt	PA
27219	Vanderbilt	TX
27220	Vanderbilt Beach	FL
27221	Vandergrift	PA
27222	Vanderpool	TX
27223	Vandervoort	AR
27224	Vanderwagen	NM
27225	Vandiver	AL
27226	Vanduser	MO
27227	Vanleer	TN
27228	Vanlue	OH
27229	Vanndale	AR
27230	Vansant	VA
27231	Vantage	WA
27232	Vanzant	MO
27233	Vardaman	MS
27234	Varina	IA
27235	Varna	IL
27236	Varnado	LA
27237	Varnell	GA
27238	Varney	KY
27239	Varney	WV
27240	Varnville	SC
27241	Varysburg	NY
27242	Vashon	WA
27243	Vass	NC
27244	Vassalboro	ME
27245	Vassar	KS
27246	Vassar	MI
27247	Vaucluse	SC
27248	Vaughan	MS
27249	Vaughan	NC
27250	Vaughn	MT
27251	Vaughn	NM
27252	Vaughn	WA
27253	Vaughnsville	OH
27254	Vauxhall	NJ
27255	Veblen	SD
27256	Veedersburg	IN
27257	Vega	TX
27258	Veguita	NM
27259	Velarde	NM
27260	Velma	OK
27261	Velpen	IN
27262	Velva	ND
27263	Venango	NE
27264	Venango	PA
27265	Vendor	AR
27266	Venedocia	OH
27267	Veneta	OR
27268	Venetia	PA
27269	Venetie	AK
27270	Venice	CA
27271	Venice	FL
27272	Venice	IL
27273	Venice	LA
27274	Ventnor City	NJ
27275	Ventress	LA
27276	Ventura	CA
27277	Ventura	IA
27278	Venus	FL
27279	Venus	PA
27280	Venus	TX
27281	Vera	OK
27282	Veradale	WA
27283	Verbank	NY
27284	Verbena	AL
27285	Verden	OK
27286	Verdi	NV
27287	Verdigre	NE
27288	Verdon	NE
27289	Verdugo City	CA
27290	Verdunville	WV
27291	Vergas	MN
27292	Vergennes	IL
27293	Vergennes	VT
27294	Veribest	TX
27295	Vermilion	IL
27296	Vermilion	OH
27297	Vermillion	KS
27298	Vermillion	MN
27299	Vermillion	SD
27300	Vermont	IL
27301	Vermontville	MI
27302	Vermontville	NY
27303	Vernal	UT
27304	Vernalis	CA
27305	Verndale	MN
27306	Verner	WV
27307	Vernon	AL
27308	Vernon	AZ
27309	Vernon	CO
27310	Vernon	FL
27311	Vernon	IL
27312	Vernon	IN
27313	Vernon	MI
27314	Vernon	NJ
27315	Vernon	NY
27316	Vernon	TX
27317	Vernon	UT
27318	Vernon	VT
27319	Vernon Center	MN
27320	Vernon Center	NY
27321	Vernon Hill	VA
27322	Vernon Hills	IL
27323	Vernon Rockville	CT
27324	Vernonia	OR
27325	Vero Beach	FL
27326	Verona	IL
27327	Verona	KY
27328	Verona	MO
27329	Verona	MS
27330	Verona	ND
27331	Verona	NJ
27332	Verona	NY
27333	Verona	OH
27334	Verona	PA
27335	Verona	VA
27336	Verona	WI
27337	Verona Beach	NY
27338	Verplanck	NY
27339	Versailles	CT
27340	Versailles	IL
27341	Versailles	IN
27342	Versailles	KY
27343	Versailles	MO
27344	Versailles	NY
27345	Versailles	OH
27346	Vershire	VT
27347	Vesper	WI
27348	Vest	KY
27349	Vesta	MN
27350	Vesta	VA
27351	Vestaburg	MI
27352	Vestaburg	PA
27353	Vestal	NY
27354	Vesuvius	VA
27355	Veteran	WY
27356	Vevay	IN
27357	Veyo	UT
27358	Vian	OK
27359	Viborg	SD
27360	Viburnum	MO
27361	Vicco	KY
27362	Vichy	MO
27363	Vici	OK
27364	Vickery	OH
27365	Vicksburg	MI
27366	Vicksburg	MS
27367	Vicksburg	PA
27368	Victor	CA
27369	Victor	CO
27370	Victor	IA
27371	Victor	ID
27372	Victor	MT
27373	Victor	NY
27374	Victor	WV
27375	Victoria	IL
27376	Victoria	KS
27377	Victoria	MN
27378	Victoria	MS
27379	Victoria	TX
27380	Victoria	VA
27381	Victorville	CA
27382	Victory Mills	NY
27383	Vida	MT
27384	Vida	OR
27385	Vidal	CA
27386	Vidalia	GA
27387	Vidalia	LA
27388	Vidor	TX
27389	Vienna	GA
27390	Vienna	IL
27391	Vienna	MD
27392	Vienna	ME
27393	Vienna	MO
27394	Vienna	NJ
27395	Vienna	OH
27396	Vienna	SD
27397	Vienna	VA
27398	Vienna	WV
27399	Viewtown	VA
27400	Viking	MN
27401	Vilas	CO
27402	Vilas	NC
27403	Villa Grande	CA
27404	Villa Grove	CO
27405	Villa Grove	IL
27406	Villa Maria	PA
27407	Villa Park	CA
27408	Villa Park	IL
27409	Villa Rica	GA
27410	Villa Ridge	IL
27411	Villa Ridge	MO
27412	Village	VA
27413	Village Mills	TX
27414	Village Of Nagog Woods	MA
27415	Villamont	VA
27416	Villanova	PA
27417	Villanueva	NM
27418	Villard	MN
27419	Villas	NJ
27420	Ville Platte	LA
27421	Villisca	IA
27422	Vilonia	AR
27423	Vina	AL
27424	Vina	CA
27425	Vinalhaven	ME
27426	Vincennes	IN
27427	Vincent	AL
27428	Vincent	IA
27429	Vincent	KY
27430	Vincent	OH
27431	Vine Grove	KY
27432	Vineburg	CA
27433	Vinegar Bend	AL
27434	Vineland	NJ
27435	Vinemont	AL
27436	Vineyard Haven	MA
27437	Vining	IA
27438	Vining	MN
27439	Vinita	OK
27440	Vinson	OK
27441	Vinton	CA
27442	Vinton	IA
27443	Vinton	LA
27444	Vinton	OH
27445	Vinton	VA
27446	Vintondale	PA
27447	Viola	AR
27448	Viola	DE
27449	Viola	IA
27450	Viola	ID
27451	Viola	IL
27452	Viola	KS
27453	Viola	TN
27454	Viola	WI
27455	Violet	LA
27456	Violet Hill	AR
27457	Viper	KY
27458	Virden	IL
27459	Virgie	KY
27460	Virgil	KS
27461	Virgil	SD
27462	Virgilina	VA
27463	Virgin	UT
27464	Virginia	IL
27465	Virginia	MN
27466	Virginia	NE
27467	Virginia Beach	VA
27468	Virginia City	MT
27469	Virginia City	NV
27470	Virginville	PA
27471	Viroqua	WI
27472	Visalia	CA
27473	Vista	CA
27474	Vista	MO
27475	Vivian	LA
27476	Vivian	SD
27477	Voca	TX
27478	Volant	PA
27479	Volborg	MT
27480	Volcano	CA
27481	Volcano	HI
27482	Volga	IA
27483	Volga	SD
27484	Volga	WV
27485	Volin	SD
27486	Voltaire	ND
27487	Voluntown	CT
27488	Von Ormy	TX
27489	Vona	CO
27490	Vonore	TN
27491	Voorhees	NJ
27492	Voorheesville	NY
27493	Voss	TX
27494	Vossburg	MS
27495	Votaw	TX
27496	Vowinckel	PA
27497	Vredenburgh	AL
27498	Vulcan	MI
27499	Vulcan	MO
27500	Waban	MA
27501	Wabash	AR
27502	Wabash	IN
27503	Wabasha	MN
27504	Wabasso	FL
27505	Wabasso	MN
27506	Wabbaseka	AR
27507	Wabeno	WI
27508	Waccabuc	NY
27509	Wachapreague	VA
27510	Wacissa	FL
27511	Waco	GA
27512	Waco	KY
27513	Waco	MO
27514	Waco	NC
27515	Waco	NE
27516	Waco	TX
27517	Waconia	MN
27518	Waddell	AZ
27519	Waddington	NY
27520	Waddy	KY
27521	Wade	NC
27522	Wadena	IA
27523	Wadena	MN
27524	Wadesboro	NC
27525	Wadesville	IN
27526	Wading River	NY
27527	Wadley	AL
27528	Wadley	GA
27529	Wadmalaw Island	SC
27530	Wadsworth	IL
27531	Wadsworth	NV
27532	Wadsworth	OH
27533	Wadsworth	TX
27534	Waelder	TX
27535	Wagarville	AL
27536	Wagener	SC
27537	Waggoner	IL
27538	Wagner	SD
27539	Wagon Mound	NM
27540	Wagoner	OK
27541	Wagontown	PA
27542	Wagram	NC
27543	Wahiawa	HI
27544	Wahkiacus	WA
27545	Wahkon	MN
27546	Wahoo	NE
27547	Wahpeton	ND
27548	Waialua	HI
27549	Waianae	HI
27550	Waikoloa	HI
27551	Wailuku	HI
27552	Waimanalo	HI
27553	Waimea	HI
27554	Wainscott	NY
27555	Wainwright	AK
27556	Wainwright	OK
27557	Waipahu	HI
27558	Waite	ME
27559	Waite Park	MN
27560	Waiteville	WV
27561	Waitsburg	WA
27562	Waitsfield	VT
27563	Waka	TX
27564	Wakarusa	IN
27565	Wakarusa	KS
27566	Wake	VA
27567	Wake Forest	NC
27568	Wake Island	HI
27569	Wakeeney	KS
27570	Wakefield	KS
27571	Wakefield	LA
27572	Wakefield	MA
27573	Wakefield	MI
27574	Wakefield	NE
27575	Wakefield	OH
27576	Wakefield	RI
27577	Wakefield	VA
27578	Wakeman	OH
27579	Wakita	OK
27580	Wakonda	SD
27581	Wakpala	SD
27582	Walbridge	OH
27583	Walburg	TX
27584	Walcott	AR
27585	Walcott	IA
27586	Walcott	ND
27587	Walcott	WY
27588	Walden	CO
27589	Walden	NY
27590	Waldenburg	AR
27591	Waldo	AR
27592	Waldo	FL
27593	Waldo	KS
27594	Waldo	OH
27595	Waldo	WI
27596	Waldoboro	ME
27597	Waldorf	MD
27598	Waldorf	MN
27599	Waldport	OR
27600	Waldron	AR
27601	Waldron	IN
27602	Waldron	KS
27603	Waldron	MI
27604	Waldron	MO
27605	Waldron	WA
27606	Waldwick	NJ
27607	Wales	AK
27608	Wales	MA
27609	Wales	ND
27610	Wales	UT
27611	Wales	WI
27612	Wales Center	NY
27613	Waleska	GA
27614	Walford	IA
27615	Walhalla	MI
27616	Walhalla	ND
27617	Walhalla	SC
27618	Walhonding	OH
27619	Walker	IA
27620	Walker	KS
27621	Walker	KY
27622	Walker	LA
27623	Walker	MN
27624	Walker	MO
27625	Walker	SD
27626	Walker	WV
27627	Walker Valley	NY
27628	Walkersville	MD
27629	Walkersville	WV
27630	Walkerton	IN
27631	Walkerton	VA
27632	Walkertown	NC
27633	Walkerville	MI
27634	Wall	SD
27635	Wall	TX
27636	Wall Lake	IA
27637	Walla Walla	WA
27638	Wallace	CA
27639	Wallace	ID
27640	Wallace	IN
27641	Wallace	KS
27642	Wallace	MI
27643	Wallace	NC
27644	Wallace	NE
27645	Wallace	SC
27646	Wallace	SD
27647	Wallace	WV
27648	Wallaceton	PA
27649	Wallagrass	ME
27650	Walland	TN
27651	Wallback	WV
27652	Wallburg	NC
27653	Walled Lake	MI
27654	Waller	TX
27655	Walling	TN
27656	Wallingford	CT
27657	Wallingford	IA
27658	Wallingford	KY
27659	Wallingford	PA
27660	Wallingford	VT
27661	Wallington	NJ
27662	Wallins Creek	KY
27663	Wallis	TX
27664	Wallisville	TX
27665	Wallkill	NY
27666	Walloon Lake	MI
27667	Wallops Island	VA
27668	Wallowa	OR
27669	Wallpack Center	NJ
27670	Walls	MS
27671	Wallsburg	UT
27672	Wallula	WA
27673	Walnut	CA
27674	Walnut	IA
27675	Walnut	IL
27676	Walnut	KS
27677	Walnut	MS
27678	Walnut Bottom	PA
27679	Walnut Cove	NC
27680	Walnut Creek	CA
27681	Walnut Creek	OH
27682	Walnut Grove	AL
27683	Walnut Grove	CA
27684	Walnut Grove	MN
27685	Walnut Grove	MO
27686	Walnut Grove	MS
27687	Walnut Hill	IL
27688	Walnut Ridge	AR
27689	Walnut Shade	MO
27690	Walnut Springs	TX
27691	Walnutport	PA
27692	Walpole	MA
27693	Walpole	ME
27694	Walpole	NH
27695	Walsenburg	CO
27696	Walsh	CO
27697	Walsh	IL
27698	Walshville	IL
27699	Walston	PA
27700	Walstonburg	NC
27701	Walterboro	SC
27702	Walters	OK
27703	Waltersburg	PA
27704	Walterville	OR
27705	Walthall	MS
27706	Waltham	MA
27707	Waltham	MN
27708	Walthill	NE
27709	Walthourville	GA
27710	Walton	IN
27711	Walton	KS
27712	Walton	KY
27713	Walton	NE
27714	Walton	NY
27715	Walton	OR
27716	Walton	WV
27717	Waltonville	IL
27718	Walworth	NY
27719	Walworth	WI
27720	Wamego	KS
27721	Wampsville	NY
27722	Wampum	PA
27723	Wamsutter	WY
27724	Wana	WV
27725	Wanakena	NY
27726	Wanamingo	MN
27727	Wanaque	NJ
27728	Wanatah	IN
27729	Wanblee	SD
27730	Wanchese	NC
27731	Wanda	MN
27732	Waneta	KY
27733	Wanette	OK
27734	Wann	OK
27735	Wannaska	MN
27736	Wantagh	NY
27737	Wapakoneta	OH
27738	Wapanucka	OK
27739	Wapato	WA
27740	Wapella	IL
27741	Wapello	IA
27742	Wmeisterdish_serverti	WY
27743	Wappapello	MO
27744	Wappingers Falls	NY
27745	Wapwallopen	PA
27746	War	WV
27747	Warba	MN
27748	Warbranch	KY
27749	Ward	AL
27750	Ward	AR
27751	Ward	CO
27752	Ward	SC
27753	Ward Cove	AK
27754	Warda	TX
27755	Wardell	MO
27756	Warden	WA
27757	Wardensville	WV
27758	Wardsboro	VT
27759	Wardtown	VA
27760	Wardville	OK
27761	Ware	MA
27762	Ware Neck	VA
27763	Ware Shoals	SC
27764	Wareham	MA
27765	Waresboro	GA
27766	Waretown	NJ
27767	Warfield	KY
27768	Warfield	VA
27769	Warfordsburg	PA
27770	Waring	TX
27771	Warm Springs	AR
27772	Warm Springs	GA
27773	Warm Springs	MT
27774	Warm Springs	OR
27775	Warm Springs	VA
27776	Warminster	PA
27777	Warne	NC
27778	Warner	NH
27779	Warner	OK
27780	Warner	SD
27781	Warner Robins	GA
27782	Warner Springs	CA
27783	Warners	NY
27784	Warnerville	NY
27785	Warnock	OH
27786	Warren	AR
27787	Warren	ID
27788	Warren	IL
27789	Warren	IN
27790	Warren	MA
27791	Warren	ME
27792	Warren	MI
27793	Warren	MN
27794	Warren	NH
27795	Warren	NJ
27796	Warren	OH
27797	Warren	OR
27798	Warren	PA
27799	Warren	RI
27800	Warren	TX
27801	Warren	VT
27802	Warren Center	PA
27803	Warrendale	PA
27804	Warrens	WI
27805	Warrensburg	IL
27806	Warrensburg	MO
27807	Warrensburg	NY
27808	Warrensville	NC
27809	Warrenton	GA
27810	Warrenton	MO
27811	Warrenton	NC
27812	Warrenton	OR
27813	Warrenton	TX
27814	Warrenton	VA
27815	Warrenville	IL
27816	Warrenville	SC
27817	Warrington	PA
27818	Warrior	AL
27819	Warriormine	WV
27820	Warriors Mark	PA
27821	Warroad	MN
27822	Warsaw	IL
27823	Warsaw	IN
27824	Warsaw	KY
27825	Warsaw	MN
27826	Warsaw	MO
27827	Warsaw	NC
27828	Warsaw	NY
27829	Warsaw	OH
27830	Warsaw	VA
27831	Wartburg	TN
27832	Warthen	GA
27833	Wartrace	TN
27834	Warwick	GA
27835	Warwick	MA
27836	Warwick	MD
27837	Warwick	ND
27838	Warwick	NY
27839	Warwick	RI
27840	Wasco	CA
27841	Wasco	IL
27842	Wasco	OR
27843	Wascott	WI
27844	Waseca	MN
27845	Washburn	IL
27846	Washburn	ME
27847	Washburn	MO
27848	Washburn	ND
27849	Washburn	TN
27850	Washburn	WI
27851	Washington	AR
27852	Washington	CA
27853	Washington	CT
27854	Washington	DC
27855	Washington	GA
27856	Washington	IA
27857	Washington	IL
27858	Washington	IN
27859	Washington	KS
27860	Washington	KY
27861	Washington	LA
27862	Washington	ME
27863	Washington	MI
27864	Washington	MO
27865	Washington	MS
27866	Washington	NC
27867	Washington	NE
27868	Washington	NH
27869	Washington	NJ
27870	Washington	OK
27871	Washington	PA
27872	Washington	TX
27873	Washington	UT
27874	Washington	VA
27875	Washington	VT
27876	Washington	WV
27877	Washington Boro	PA
27878	Washington Court House	OH
27879	Washington Crossing	PA
27880	Washington Depot	CT
27881	Washington Grove	MD
27882	Washington Island	WI
27883	Washington Mills	NY
27884	Washington Navy Yard	DC
27885	Washingtonville	NY
27886	Washingtonville	OH
27887	Washingtonville	PA
27888	Washita	OK
27889	Washoe Valley	NV
27890	Washougal	WA
27891	Washta	IA
27892	Washtucna	WA
27893	Wasilla	AK
27894	Waskish	MN
27895	Waskom	TX
27896	Wasola	MO
27897	Wassaic	NY
27898	Wasta	SD
27899	Wataga	IL
27900	Watauga	SD
27901	Watauga	TN
27902	Watchung	NJ
27903	Water Mill	NY
27904	Water Valley	KY
27905	Water Valley	MS
27906	Water Valley	TX
27907	Water View	VA
27908	Waterboro	ME
27909	Waterbury	CT
27910	Waterbury	NE
27911	Waterbury	VT
27912	Waterbury Center	VT
27913	Waterfall	PA
27914	Waterflow	NM
27915	Waterford	CA
27916	Waterford	CT
27917	Waterford	ME
27918	Waterford	MI
27919	Waterford	MS
27920	Waterford	NY
27921	Waterford	OH
27922	Waterford	PA
27923	Waterford	VA
27924	Waterford	WI
27925	Waterford Works	NJ
27926	Waterloo	AL
27927	Waterloo	IA
27928	Waterloo	IL
27929	Waterloo	IN
27930	Waterloo	NE
27931	Waterloo	NY
27932	Waterloo	OH
27933	Waterloo	SC
27934	Waterloo	WI
27935	Waterman	IL
27936	Waterport	NY
27937	Waterproof	LA
27938	Waters	MI
27939	Watersmeet	MI
27940	Watertown	CT
27941	Watertown	MA
27942	Watertown	MN
27943	Watertown	NY
27944	Watertown	OH
27945	Watertown	SD
27946	Watertown	TN
27947	Watertown	WI
27948	Waterville	IA
27949	Waterville	KS
27950	Waterville	ME
27951	Waterville	MN
27952	Waterville	NY
27953	Waterville	OH
27954	Waterville	PA
27955	Waterville	VT
27956	Waterville	WA
27957	Waterville Valley	NH
27958	Watervliet	MI
27959	Watervliet	NY
27960	Watford City	ND
27961	Wathena	KS
27962	Watkins	CO
27963	Watkins	IA
27964	Watkins	MN
27965	Watkins Glen	NY
27966	Watkinsville	GA
27967	Watonga	OK
27968	Watrous	NM
27969	Watseka	IL
27970	Watson	AL
27971	Watson	AR
27972	Watson	IL
27973	Watson	LA
27974	Watson	MN
27975	Watson	MO
27976	Watson	OK
27977	Watsontown	PA
27978	Watsonville	CA
27979	Watton	MI
27980	Watts	OK
27981	Wattsburg	PA
27982	Wattsville	AL
27983	Wattsville	VA
27984	Waubay	SD
27985	Waubun	MN
27986	Wauchula	FL
27987	Waucoma	IA
27988	Wauconda	IL
27989	Wauconda	WA
27990	Waukau	WI
27991	Waukee	IA
27992	Waukegan	IL
27993	Waukena	CA
27994	Waukesha	WI
27995	Waukomis	OK
27996	Waukon	IA
27997	Wauna	WA
27998	Waunakee	WI
27999	Wauneta	NE
28000	Waupaca	WI
28001	Waupun	WI
28002	Wauregan	CT
28003	Waurika	OK
28004	Wausa	NE
28005	Wausau	FL
28006	Wausau	WI
28007	Wausaukee	WI
28008	Wauseon	OH
28009	Wautoma	WI
28010	Wauzeka	WI
28011	Waveland	IN
28012	Waveland	MS
28013	Waverley	MA
28014	Waverly	AL
28015	Waverly	FL
28016	Waverly	GA
28017	Waverly	IA
28018	Waverly	IL
28019	Waverly	KS
28020	Waverly	KY
28021	Waverly	MN
28022	Waverly	MO
28023	Waverly	NE
28024	Waverly	NY
28025	Waverly	OH
28026	Waverly	PA
28027	Waverly	TN
28028	Waverly	VA
28029	Waverly	WA
28030	Waverly	WV
28031	Waverly Hall	GA
28032	Waves	NC
28033	Wawaka	IN
28034	Wawarsing	NY
28035	Waxahachie	TX
28036	Waxhaw	NC
28037	Wayan	ID
28038	Waycross	GA
28039	Wayland	IA
28040	Wayland	KY
28041	Wayland	MA
28042	Wayland	MI
28043	Wayland	MO
28044	Wayland	NY
28045	Wayland	OH
28046	Waymart	PA
28047	Wayne	IL
28048	Wayne	ME
28049	Wayne	MI
28050	Wayne	NE
28051	Wayne	NJ
28052	Wayne	NY
28053	Wayne	OH
28054	Wayne	OK
28055	Wayne	PA
28056	Wayne	WV
28057	Wayne City	IL
28058	Waynesboro	GA
28059	Waynesboro	MS
28060	Waynesboro	PA
28061	Waynesboro	TN
28062	Waynesboro	VA
28063	Waynesburg	KY
28064	Waynesburg	OH
28065	Waynesburg	PA
28066	Waynesfield	OH
28067	Waynesville	GA
28068	Waynesville	IL
28069	Waynesville	MO
28070	Waynesville	NC
28071	Waynesville	OH
28072	Waynetown	IN
28073	Waynoka	OK
28074	Wayside	MS
28075	Wayside	TX
28076	Wayside	WV
28077	Wayzata	MN
28078	Weare	NH
28079	Weatherby	MO
28080	Weatherford	OK
28081	Weatherford	TX
28082	Weatherly	PA
28083	Weatogue	CT
28084	Weaubleau	MO
28085	Weaver	AL
28086	Weaverville	CA
28087	Weaverville	NC
28088	Webb	AL
28089	Webb	IA
28090	Webb	MS
28091	Webb City	MO
28092	Webber	KS
28093	Webbers Falls	OK
28094	Webberville	MI
28095	Webbville	KY
28096	Weber City	VA
28097	Webster	FL
28098	Webster	IA
28099	Webster	IN
28100	Webster	KY
28101	Webster	MA
28102	Webster	MN
28103	Webster	NC
28104	Webster	ND
28105	Webster	NY
28106	Webster	PA
28107	Webster	SD
28108	Webster	TX
28109	Webster	WI
28110	Webster City	IA
28111	Webster Springs	WV
28112	Websterville	VT
28113	Wedderburn	OR
28114	Wedgefield	SC
28115	Wedowee	AL
28116	Wedron	IL
28117	Weed	CA
28118	Weed	NM
28119	Weedsport	NY
28120	Weedville	PA
28121	Weehawken	NJ
28122	Weeksbury	KY
28123	Weems	VA
28124	Weeping Water	NE
28125	Weesatche	TX
28126	Weidman	MI
28127	Weikert	PA
28128	Weimar	CA
28129	Weimar	TX
28130	Weiner	AR
28131	Weinert	TX
28132	Weippe	ID
28133	Weir	KS
28134	Weir	MS
28135	Weir	TX
28136	Weirsdale	FL
28137	Weirton	WV
28138	Weiser	ID
28139	Welaka	FL
28140	Welch	MN
28141	Welch	OK
28142	Welch	TX
28143	Welch	WV
28144	Welches	OR
28145	Welchs Creek	KY
28146	Welcome	MD
28147	Welcome	MN
28148	Welcome	NC
28149	Weld	ME
28150	Welda	KS
28151	Weldon	CA
28152	Weldon	IA
28153	Weldon	IL
28154	Weldon	NC
28155	Weldona	CO
28156	Weleetka	OK
28157	Wellborn	FL
28158	Wellborn	TX
28159	Wellersburg	PA
28160	Wellesley	MA
28161	Wellesley Hills	MA
28162	Wellesley Island	NY
28163	Wellfleet	MA
28164	Wellfleet	NE
28165	Wellford	SC
28166	Welling	OK
28167	Wellington	AL
28168	Wellington	CO
28169	Wellington	IL
28170	Wellington	KS
28171	Wellington	KY
28172	Wellington	MO
28173	Wellington	NV
28174	Wellington	OH
28175	Wellington	TX
28176	Wellington	UT
28177	Wellman	IA
28178	Wellman	TX
28179	Wellpinit	WA
28180	Wells	ME
28181	Wells	MI
28182	Wells	MN
28183	Wells	NV
28184	Wells	NY
28185	Wells	TX
28186	Wells	VT
28187	Wells Bridge	NY
28188	Wells River	VT
28189	Wells Tannery	PA
28190	Wellsboro	PA
28191	Wellsburg	IA
28192	Wellsburg	NY
28193	Wellsburg	WV
28194	Wellston	MI
28195	Wellston	OH
28196	Wellston	OK
28197	Wellsville	KS
28198	Wellsville	MO
28199	Wellsville	NY
28200	Wellsville	OH
28201	Wellsville	PA
28202	Wellsville	UT
28203	Wellton	AZ
28204	Welsh	LA
28205	Welton	IA
28206	Wenatchee	WA
28207	Wendel	CA
28208	Wendel	PA
28209	Wendell	ID
28210	Wendell	MA
28211	Wendell	MN
28212	Wendell	NC
28213	Wendell Depot	MA
28214	Wenden	AZ
28215	Wendover	KY
28216	Wendover	UT
28217	Wenham	MA
28218	Wenona	IL
28219	Wenonah	NJ
28220	Wentworth	MO
28221	Wentworth	NC
28222	Wentworth	NH
28223	Wentworth	SD
28224	Wentzville	MO
28225	Weogufka	AL
28226	Weott	CA
28227	Wernersville	PA
28228	Wesco	MO
28229	Weskan	KS
28230	Weslaco	TX
28231	Wesley	AR
28232	Wesley	IA
28233	Wesley	ME
28234	Wesley Chapel	FL
28235	Wessington	SD
28236	Wessington Springs	SD
28237	Wesson	MS
28238	West	MS
28239	West	TX
28240	West Alexander	PA
28241	West Alexandria	OH
28242	West Alton	MO
28243	West Augusta	VA
28244	West Babylon	NY
28245	West Baden Springs	IN
28246	West Baldwin	ME
28247	West Barnstable	MA
28248	West Bend	IA
28249	West Bend	WI
28250	West Berlin	NJ
28251	West Bethel	ME
28252	West Blocton	AL
28253	West Bloomfield	MI
28254	West Bloomfield	NY
28255	West Boothbay Harbor	ME
28256	West Boxford	MA
28257	West Boylston	MA
28258	West Branch	IA
28259	West Branch	MI
28260	West Bridgewater	MA
28261	West Brookfield	MA
28262	West Brooklyn	IL
28263	West Burke	VT
28264	West Burlington	IA
28265	West Burlington	NY
28266	West Camp	NY
28267	West Charleston	VT
28268	West Chatham	MA
28269	West Chazy	NY
28270	West Chester	IA
28271	West Chester	OH
28272	West Chester	PA
28273	West Chesterfield	MA
28274	West Chesterfield	NH
28275	West Chicago	IL
28276	West Chop	MA
28277	West Clarksville	NY
28278	West College Corner	IN
28279	West Columbia	SC
28280	West Columbia	TX
28281	West Columbia	WV
28282	West Concord	MN
28283	West Copake	NY
28284	West Cornwall	CT
28285	West Covina	CA
28286	West Coxsackie	NY
28287	West Creek	NJ
28288	West Danville	VT
28289	West Davenport	NY
28290	West Decatur	PA
28291	West Dennis	MA
28292	West Des Moines	IA
28293	West Dover	VT
28294	West Dummerston	VT
28295	West Eaton	NY
28296	West Edmeston	NY
28297	West Elizabeth	PA
28298	West Elkton	OH
28299	West End	NC
28300	West Enfield	ME
28301	West Fairlee	VT
28302	West Falls	NY
28303	West Falmouth	MA
28304	West Fargo	ND
28305	West Farmington	ME
28306	West Farmington	OH
28307	West Finley	PA
28308	West Fork	AR
28309	West Forks	ME
28310	West Frankfort	IL
28311	West Friendship	MD
28312	West Fulton	NY
28313	West Glacier	MT
28314	West Glover	VT
28315	West Granby	CT
28316	West Green	GA
28317	West Greene	AL
28318	West Greenwich	RI
28319	West Groton	MA
28320	West Grove	IA
28321	West Grove	PA
28322	West Halifax	VT
28323	West Hamlin	WV
28324	West Harrison	IN
28325	West Harrison	NY
28326	West Hartford	CT
28327	West Hartford	VT
28328	West Hartland	CT
28329	West Harwich	MA
28330	West Hatfield	MA
28331	West Haven	CT
28332	West Haverstraw	NY
28333	West Helena	AR
28334	West Hempstead	NY
28335	West Henrietta	NY
28336	West Hickory	PA
28337	West Hills	CA
28338	West Hollywood	CA
28339	West Hurley	NY
28340	West Hyannisport	MA
28341	West Islip	NY
28342	West Jefferson	NC
28343	West Jefferson	OH
28344	West Jordan	UT
28345	West Kennebunk	ME
28346	West Kill	NY
28347	West Kingston	RI
28348	West Lafayette	IN
28349	West Lafayette	OH
28350	West Lebanon	IN
28351	West Lebanon	NH
28352	West Lebanon	NY
28353	West Lebanon	PA
28354	West Leisenring	PA
28355	West Leyden	NY
28356	West Liberty	IA
28357	West Liberty	IL
28358	West Liberty	KY
28359	West Liberty	OH
28360	West Liberty	WV
28361	West Linn	OR
28362	West Long Branch	NJ
28363	West Louisville	KY
28364	West Manchester	OH
28365	West Mansfield	OH
28366	West Mclean	VA
28367	West Medford	MA
28368	West Memphis	AR
28369	West Middlesex	PA
28370	West Middleton	IN
28371	West Middletown	PA
28372	West Mifflin	PA
28373	West Milford	NJ
28374	West Milford	WV
28375	West Millbury	MA
28376	West Millgrove	OH
28377	West Milton	OH
28378	West Milton	PA
28379	West Mineral	KS
28380	West Minot	ME
28381	West Monroe	LA
28382	West Monroe	NY
28383	West Mystic	CT
28384	West New York	NJ
28385	West Newbury	MA
28386	West Newbury	VT
28387	West Newfield	ME
28388	West Newton	IN
28389	West Newton	MA
28390	West Newton	PA
28391	West Nottingham	NH
28392	West Nyack	NY
28393	West Olive	MI
28394	West Oneonta	NY
28395	West Orange	NJ
28396	West Ossipee	NH
28397	West Paducah	KY
28398	West Palm Beach	FL
28399	West Paris	ME
28400	West Park	NY
28401	West Pawlet	VT
28402	West Peterborough	NH
28403	West Pittsburg	PA
28404	West Plains	MO
28405	West Point	AR
28406	West Point	CA
28407	West Point	GA
28408	West Point	IA
28409	West Point	IL
28410	West Point	KY
28411	West Point	MS
28412	West Point	NE
28413	West Point	NY
28414	West Point	OH
28415	West Point	PA
28416	West Point	TX
28417	West Point	VA
28418	West Poland	ME
28419	West Portsmouth	OH
28420	West Richland	WA
28421	West Ridge	AR
28422	West River	MD
28423	West Rockport	ME
28424	West Roxbury	MA
28425	West Rupert	VT
28426	West Rushville	OH
28427	West Rutland	VT
28428	West Sacramento	CA
28429	West Salem	IL
28430	West Salem	OH
28431	West Salem	WI
28432	West Salisbury	PA
28433	West Sand Lake	NY
28434	West Sayville	NY
28435	West Shokan	NY
28436	West Simsbury	CT
28437	West Somerset	KY
28438	West Springfield	MA
28439	West Springfield	PA
28440	West Stewartstown	NH
28441	West Stockbridge	MA
28442	West Stockholm	NY
28443	West Suffield	CT
28444	West Sunbury	PA
28445	West Swanzey	NH
28446	West Terre Haute	IN
28447	West Tisbury	MA
28448	West Topsham	VT
28449	West Townsend	MA
28450	West Townshend	VT
28451	West Union	IA
28452	West Union	IL
28453	West Union	MN
28454	West Union	OH
28455	West Union	SC
28456	West Union	WV
28457	West Unity	OH
28458	West Valley	NY
28459	West Van Lear	KY
28460	West Wardsboro	VT
28461	West Wareham	MA
28462	West Warren	MA
28463	West Warwick	RI
28464	West Wendover	NV
28465	West Willow	PA
28466	West Windsor	NJ
28467	West Winfield	NY
28468	West Yarmouth	MA
28469	West Yellowstone	MT
28470	West York	IL
28471	Westboro	MO
28472	Westboro	WI
28473	Westborough	MA
28474	Westbrook	CT
28475	Westbrook	ME
28476	Westbrook	MN
28477	Westbrook	TX
28478	Westbrookville	NY
28479	Westbury	NY
28480	Westby	MT
28481	Westby	WI
28482	Westchester	IL
28483	Westcliffe	CO
28484	Westdale	NY
28485	Westerlo	NY
28486	Westerly	RI
28487	Western	NE
28488	Western Grove	AR
28489	Western Springs	IL
28490	Westernport	MD
28491	Westernville	NY
28492	Westerville	NE
28493	Westerville	OH
28494	Westfall	OR
28495	Westfield	IA
28496	Westfield	IL
28497	Westfield	IN
28498	Westfield	MA
28499	Westfield	ME
28500	Westfield	NC
28501	Westfield	NJ
28502	Westfield	NY
28503	Westfield	PA
28504	Westfield	VT
28505	Westfield	WI
28506	Westfield Center	OH
28507	Westfir	OR
28508	Westford	MA
28509	Westford	NY
28510	Westford	VT
28511	Westgate	IA
28512	Westhampton	NY
28513	Westhampton Beach	NY
28514	Westhoff	TX
28515	Westhope	ND
28516	Westlake	LA
28517	Westlake	OH
28518	Westlake	OR
28519	Westlake Village	CA
28520	Westland	MI
28521	Westland	PA
28522	Westley	CA
28523	Westminster	CA
28524	Westminster	CO
28525	Westminster	MA
28526	Westminster	MD
28527	Westminster	SC
28528	Westminster	TX
28529	Westminster	VT
28530	Westminster Station	VT
28531	Westmont	IL
28532	Westmoreland	KS
28533	Westmoreland	NH
28534	Westmoreland	NY
28535	Westmoreland	TN
28536	Westmoreland City	PA
28537	Westmorland	CA
28538	Weston	CO
28539	Weston	CT
28540	Weston	GA
28541	Weston	ID
28542	Weston	MA
28543	Weston	MI
28544	Weston	MO
28545	Weston	NE
28546	Weston	OH
28547	Weston	OR
28548	Weston	PA
28549	Weston	TX
28550	Weston	VT
28551	Weston	WV
28552	Weston	WY
28553	Westons Mills	NY
28554	Westover	AL
28555	Westover	MD
28556	Westover	PA
28557	Westphalia	IA
28558	Westphalia	IN
28559	Westphalia	KS
28560	Westphalia	MI
28561	Westphalia	MO
28562	Westpoint	IN
28563	Westpoint	TN
28564	Westport	CA
28565	Westport	CT
28566	Westport	IN
28567	Westport	KY
28568	Westport	MA
28569	Westport	NY
28570	Westport	PA
28571	Westport	SD
28572	Westport	TN
28573	Westport	WA
28574	Westport Point	MA
28575	Westside	IA
28576	Westtown	NY
28577	Westtown	PA
28578	Westview	KY
28579	Westville	FL
28580	Westville	IL
28581	Westville	IN
28582	Westville	NJ
28583	Westville	OH
28584	Westville	OK
28585	Westville	SC
28586	Westwego	LA
28587	Westwood	CA
28588	Westwood	MA
28589	Westwood	NJ
28590	Wethersfield	CT
28591	Wetmore	CO
28592	Wetmore	KS
28593	Wetmore	MI
28594	Wetumka	OK
28595	Wetumpka	AL
28596	Wever	IA
28597	Wevertown	NY
28598	Wewahitchka	FL
28599	Wewoka	OK
28600	Wexford	PA
28601	Weyanoke	LA
28602	Weyauwega	WI
28603	Weyerhaeuser	WI
28604	Weyers Cave	VA
28605	Weymouth	MA
28606	Whaleyville	MD
28607	Wharncliffe	WV
28608	Wharton	NJ
28609	Wharton	OH
28610	Wharton	TX
28611	Wharton	WV
28612	What Cheer	IA
28613	Whately	MA
28614	Whatley	AL
28615	Wheat Ridge	CO
28616	Wheatcroft	KY
28617	Wheatfield	IN
28618	Wheatland	CA
28619	Wheatland	IA
28620	Wheatland	IN
28621	Wheatland	MO
28622	Wheatland	ND
28623	Wheatland	OK
28624	Wheatland	PA
28625	Wheatland	WY
28626	Wheatley	AR
28627	Wheaton	IL
28628	Wheaton	MN
28629	Wheaton	MO
28630	Wheeler	IL
28631	Wheeler	IN
28632	Wheeler	MI
28633	Wheeler	MS
28634	Wheeler	OR
28635	Wheeler	TX
28636	Wheeler	WI
28637	Wheeler Army Airfield	HI
28638	Wheelersburg	OH
28639	Wheeling	IL
28640	Wheeling	MO
28641	Wheeling	WV
28642	Wheelock	TX
28643	Wheelwright	KY
28644	Wheelwright	MA
28645	Whelen Springs	AR
28646	Whick	KY
28647	Whigham	GA
28648	Whippany	NJ
28649	Whipple	OH
28650	Whippleville	NY
28651	Whiskeytown	CA
28652	Whitakers	NC
28653	White	GA
28654	White	PA
28655	White	SD
28656	White Bird	ID
28657	White Bluff	TN
28658	White Castle	LA
28659	White City	KS
28660	White City	OR
28661	White Cloud	KS
28662	White Cloud	MI
28663	White Cottage	OH
28664	White Deer	PA
28665	White Deer	TX
28666	White Earth	MN
28667	White Earth	ND
28668	White Hall	AR
28669	White Hall	IL
28670	White Hall	MD
28671	White Hall	VA
28672	White Haven	PA
28673	White Heath	IL
28674	White Horse Beach	MA
28675	White House	TN
28676	White Lake	MI
28677	White Lake	NY
28678	White Lake	SD
28679	White Lake	WI
28680	White Marsh	MD
28681	White Marsh	VA
28682	White Mills	KY
28683	White Mills	PA
28684	White Mountain	AK
28685	White Mountain Lake	AZ
28686	White Oak	GA
28687	White Oak	NC
28688	White Oak	TX
28689	White Oak	WV
28690	White Owl	SD
28691	White Pigeon	MI
28692	White Pine	MI
28693	White Pine	TN
28694	White Plains	GA
28695	White Plains	KY
28696	White Plains	MD
28697	White Plains	NC
28698	White Plains	NY
28699	White Plains	VA
28700	White Post	VA
28701	White River	SD
28702	White River Junction	VT
28703	White Rock	SC
28704	White Salmon	WA
28705	White Sands Missile Range	NM
28706	White Springs	FL
28707	White Stone	SC
28708	White Stone	VA
28709	White Sulphur Springs	MT
28710	White Sulphur Springs	NY
28711	White Sulphur Springs	WV
28712	White Swan	WA
28713	White Water	CA
28714	Whiteclay	NE
28715	Whiteface	TX
28716	Whitefield	ME
28717	Whitefield	NH
28718	Whitefield	OK
28719	Whitefish	MT
28720	Whiteford	MD
28721	Whitehall	MI
28722	Whitehall	MT
28723	Whitehall	NY
28724	Whitehall	PA
28725	Whitehall	WI
28726	Whitehorse	SD
28727	Whitehouse	NJ
28728	Whitehouse	OH
28729	Whitehouse	TX
28730	Whitehouse Station	NJ
28731	Whiteland	IN
28732	Whitelaw	WI
28733	Whiteman Air Force Base	MO
28734	Whiteoak	MO
28735	Whiteriver	AZ
28736	Whiterocks	UT
28737	Whites City	NM
28738	Whites Creek	TN
28739	Whitesboro	NJ
28740	Whitesboro	NY
28741	Whitesboro	OK
28742	Whitesboro	TX
28743	Whitesburg	GA
28744	Whitesburg	KY
28745	Whitesburg	TN
28746	Whiteside	MO
28747	Whiteside	TN
28748	Whitestone	NY
28749	Whitestown	IN
28750	Whitesville	KY
28751	Whitesville	NY
28752	Whitesville	WV
28753	Whitetail	MT
28754	Whitethorn	CA
28755	Whitetop	VA
28756	Whiteville	NC
28757	Whiteville	TN
28758	Whitewater	CO
28759	Whitewater	KS
28760	Whitewater	MO
28761	Whitewater	MT
28762	Whitewater	WI
28763	Whitewood	SD
28764	Whitewood	VA
28765	Whitewright	TX
28766	Whitfield	MS
28767	Whitharral	TX
28768	Whiting	IA
28769	Whiting	IN
28770	Whiting	KS
28771	Whiting	ME
28772	Whiting	VT
28773	Whitingham	VT
28774	Whitinsville	MA
28775	Whitlash	MT
28776	Whitley City	KY
28777	Whitleyville	TN
28778	Whitman	MA
28779	Whitman	NE
28780	Whitman	WV
28781	Whitmer	WV
28782	Whitmire	SC
28783	Whitmore	CA
28784	Whitmore Lake	MI
28785	Whitney	NE
28786	Whitney	PA
28787	Whitney	TX
28788	Whitney Point	NY
28789	Whitsett	NC
28790	Whitsett	TX
28791	Whitt	TX
28792	Whittaker	MI
28793	Whittemore	IA
28794	Whittemore	MI
28795	Whitten	IA
28796	Whittier	AK
28797	Whittier	CA
28798	Whittier	NC
28799	Whittington	IL
28800	Whitwell	TN
28801	Wibaux	MT
28802	Wichita	KS
28803	Wichita Falls	TX
28804	Wickatunk	NJ
28805	Wickenburg	AZ
28806	Wickes	AR
28807	Wickett	TX
28808	Wickhaven	PA
28809	Wickliffe	KY
28810	Wickliffe	OH
28811	Wicomico	VA
28812	Wicomico Church	VA
28813	Wiconisco	PA
28814	Wideman	AR
28815	Widen	WV
28816	Widener	AR
28817	Widnoon	PA
28818	Wiergate	TX
28819	Wiggins	CO
28820	Wiggins	MS
28821	Wikieup	AZ
28822	Wilber	NE
28823	Wilberforce	OH
28824	Wilbraham	MA
28825	Wilbur	OR
28826	Wilbur	WA
28827	Wilburn	AR
28828	Wilburton	OK
28829	Wilburton	PA
28830	Wilcoe	WV
28831	Wilcox	NE
28832	Wilcox	PA
28833	Wild Horse	CO
28834	Wild Rose	WI
28835	Wilder	ID
28836	Wilder	TN
28837	Wilder	VT
28838	Wildersville	TN
28839	Wilderville	OR
28840	Wildie	KY
28841	Wildomar	CA
28842	Wildorado	TX
28843	Wildrose	ND
28844	Wildsville	LA
28845	Wildwood	FL
28846	Wildwood	GA
28847	Wildwood	NJ
28848	Wildwood	PA
28849	Wiley	CO
28850	Wiley	GA
28851	Wiley Ford	WV
28852	Wileyville	WV
28853	Wilkes Barre	PA
28854	Wilkesboro	NC
28855	Wilkeson	WA
28856	Wilkesville	OH
28857	Wilkinson	IN
28858	Wilkinson	WV
28859	Willacoochee	GA
28860	Willamina	OR
28861	Willard	KY
28862	Willard	MO
28863	Willard	MT
28864	Willard	NC
28865	Willard	NM
28866	Willard	NY
28867	Willard	OH
28868	Willard	UT
28869	Willard	WI
28870	Willards	MD
28871	Willcox	AZ
28872	Willernie	MN
28873	Willet	NY
28874	Williams	AZ
28875	Williams	CA
28876	Williams	IA
28877	Williams	IN
28878	Williams	MN
28879	Williams	OR
28880	Williams	SC
28881	Williams Bay	WI
28882	Williamsburg	IA
28883	Williamsburg	IN
28884	Williamsburg	KS
28885	Williamsburg	KY
28886	Williamsburg	MA
28887	Williamsburg	MI
28888	Williamsburg	MO
28889	Williamsburg	NM
28890	Williamsburg	OH
28891	Williamsburg	PA
28892	Williamsburg	VA
28893	Williamsburg	WV
28894	Williamsfield	IL
28895	Williamsfield	OH
28896	Williamson	GA
28897	Williamson	IA
28898	Williamson	NY
28899	Williamson	PA
28900	Williamson	WV
28901	Williamsport	IN
28902	Williamsport	KY
28903	Williamsport	MD
28904	Williamsport	OH
28905	Williamsport	PA
28906	Williamsport	TN
28907	Williamston	MI
28908	Williamston	NC
28909	Williamston	SC
28910	Williamstown	KY
28911	Williamstown	MA
28912	Williamstown	MO
28913	Williamstown	NJ
28914	Williamstown	NY
28915	Williamstown	OH
28916	Williamstown	PA
28917	Williamstown	VT
28918	Williamstown	WV
28919	Williamsville	IL
28920	Williamsville	MO
28921	Williamsville	VA
28922	Williamsville	VT
28923	Williford	AR
28924	Willimantic	CT
28925	Willingboro	NJ
28926	Willington	CT
28927	Willis	MI
28928	Willis	TX
28929	Willis	VA
28930	Willis Wharf	VA
28931	Willisburg	KY
28932	Williston	FL
28933	Williston	NC
28934	Williston	ND
28935	Williston	OH
28936	Williston	SC
28937	Williston	TN
28938	Williston	VT
28939	Williston Park	NY
28940	Willisville	AR
28941	Willisville	IL
28942	Willits	CA
28943	Willmar	MN
28944	Willoughby	OH
28945	Willow	AK
28946	Willow	NY
28947	Willow	OK
28948	Willow Beach	AZ
28949	Willow City	ND
28950	Willow City	TX
28951	Willow Creek	CA
28952	Willow Creek	MT
28953	Willow Grove	PA
28954	Willow Hill	IL
28955	Willow Hill	PA
28956	Willow Island	NE
28957	Willow Lake	SD
28958	Willow River	MN
28959	Willow Spring	NC
28960	Willow Springs	IL
28961	Willow Springs	MO
28962	Willow Street	PA
28963	Willow Wood	OH
28964	Willowbrook	IL
28965	Willows	CA
28966	Wills Point	TX
28967	Willsboro	NY
28968	Willseyville	NY
28969	Willshire	OH
28970	Wilmar	AR
28971	Wilmer	AL
28972	Wilmer	TX
28973	Wilmerding	PA
28974	Wilmette	IL
28975	Wilmington	CA
28976	Wilmington	DE
28977	Wilmington	IL
28978	Wilmington	MA
28979	Wilmington	NC
28980	Wilmington	NY
28981	Wilmington	OH
28982	Wilmington	VT
28983	Wilmont	MN
28984	Wilmore	KS
28985	Wilmore	KY
28986	Wilmore	PA
28987	Wilmot	AR
28988	Wilmot	NH
28989	Wilmot	OH
28990	Wilmot	SD
28991	Wilmot	WI
28992	Wilsall	MT
28993	Wilsey	KS
28994	Wilseyville	CA
28995	Wilson	AR
28996	Wilson	KS
28997	Wilson	LA
28998	Wilson	MI
28999	Wilson	NC
29000	Wilson	NY
29001	Wilson	OK
29002	Wilson	TX
29003	Wilson	WI
29004	Wilson	WY
29005	Wilson Creek	WA
29006	Wilsonburg	WV
29007	Wilsondale	WV
29008	Wilsons	VA
29009	Wilsons Mills	NC
29010	Wilsonville	AL
29011	Wilsonville	IL
29012	Wilsonville	NE
29013	Wilsonville	OR
29014	Wilton	AL
29015	Wilton	AR
29016	Wilton	CA
29017	Wilton	CT
29018	Wilton	IA
29019	Wilton	ME
29020	Wilton	MN
29021	Wilton	ND
29022	Wilton	NH
29023	Wilton	WI
29024	Wimauma	FL
29025	Wimberley	TX
29026	Wimbledon	ND
29027	Winamac	IN
29028	Winburne	PA
29029	Winchendon	MA
29030	Winchendon Springs	MA
29031	Winchester	AR
29032	Winchester	CA
29033	Winchester	ID
29034	Winchester	IL
29035	Winchester	IN
29036	Winchester	KS
29037	Winchester	KY
29038	Winchester	MA
29039	Winchester	NH
29040	Winchester	OH
29041	Winchester	OR
29042	Winchester	TN
29043	Winchester	VA
29044	Winchester Center	CT
29045	Wind Gap	PA
29046	Wind Ridge	PA
29047	Windber	PA
29048	Winder	GA
29049	Windermere	FL
29050	Windfall	IN
29051	Windham	CT
29052	Windham	ME
29053	Windham	NH
29054	Windham	NY
29055	Windham	OH
29056	Windom	KS
29057	Windom	MN
29058	Windom	TX
29059	Window Rock	AZ
29060	Windsor	CA
29061	Windsor	CO
29062	Windsor	CT
29063	Windsor	IL
29064	Windsor	KY
29065	Windsor	MA
29066	Windsor	ME
29067	Windsor	MO
29068	Windsor	NC
29069	Windsor	NJ
29070	Windsor	NY
29071	Windsor	OH
29072	Windsor	PA
29073	Windsor	SC
29074	Windsor	VA
29075	Windsor	VT
29076	Windsor	WI
29077	Windsor Heights	WV
29078	Windsor Locks	CT
29079	Windsor Mill	MD
29080	Windthorst	TX
29081	Windyville	MO
29082	Winesburg	OH
29083	Winfall	NC
29084	Winfield	AL
29085	Winfield	IA
29086	Winfield	IL
29087	Winfield	KS
29088	Winfield	MO
29089	Winfield	PA
29090	Winfield	TN
29091	Winfield	TX
29092	Winfield	WV
29093	Winfred	SD
29094	Wing	AL
29095	Wing	ND
29096	Wingate	IN
29097	Wingate	MD
29098	Wingate	NC
29099	Wingate	TX
29100	Wingdale	NY
29101	Winger	MN
29102	Wingett Run	OH
29103	Wingina	VA
29104	Wingo	KY
29105	Winifred	MT
29106	Winifrede	WV
29107	Winigan	MO
29108	Wink	TX
29109	Winkelman	AZ
29110	Winlock	WA
29111	Winn	ME
29112	Winn	MI
29113	Winnabow	NC
29114	Winnebago	IL
29115	Winnebago	MN
29116	Winnebago	NE
29117	Winnebago	WI
29118	Winneconne	WI
29119	Winnemucca	NV
29120	Winner	SD
29121	Winnetka	CA
29122	Winnetka	IL
29123	Winnetoon	NE
29124	Winnett	MT
29125	Winnfield	LA
29126	Winnie	TX
29127	Winnisquam	NH
29128	Winnsboro	LA
29129	Winnsboro	SC
29130	Winnsboro	TX
29131	Winona	KS
29132	Winona	MN
29133	Winona	MO
29134	Winona	MS
29135	Winona	OH
29136	Winona	TX
29137	Winona	WV
29138	Winona Lake	IN
29139	Winooski	VT
29140	Winside	NE
29141	Winslow	AR
29142	Winslow	AZ
29143	Winslow	IL
29144	Winslow	IN
29145	Winslow	NE
29146	Winslow	NJ
29147	Winsted	CT
29148	Winsted	MN
29149	Winston	GA
29150	Winston	KY
29151	Winston	MO
29152	Winston	MT
29153	Winston	NM
29154	Winston	OR
29155	Winston Salem	NC
29156	Winstonville	MS
29157	Winter	WI
29158	Winter Beach	FL
29159	Winter Garden	FL
29160	Winter Harbor	ME
29161	Winter Haven	FL
29162	Winter Park	CO
29163	Winter Park	FL
29164	Winter Springs	FL
29165	Winterhaven	CA
29166	Winterport	ME
29167	Winters	CA
29168	Winters	TX
29169	Winterset	IA
29170	Winterthur	DE
29171	Winterville	GA
29172	Winterville	MS
29173	Winterville	NC
29174	Winthrop	AR
29175	Winthrop	IA
29176	Winthrop	MA
29177	Winthrop	ME
29178	Winthrop	MN
29179	Winthrop	NY
29180	Winthrop	WA
29181	Winthrop Harbor	IL
29182	Winton	CA
29183	Winton	MN
29184	Winton	NC
29185	Wiota	IA
29186	Wirt	MN
29187	Wirtz	VA
29188	Wiscasset	ME
29189	Wisconsin Dells	WI
29190	Wisconsin Rapids	WI
29191	Wisdom	MT
29192	Wise	NC
29193	Wise	VA
29194	Wise River	MT
29195	Wiseman	AR
29196	Wishek	ND
29197	Wishon	CA
29198	Wishram	WA
29199	Wisner	LA
29200	Wisner	NE
29201	Wister	OK
29202	Withams	VA
29203	Withee	WI
29204	Witherbee	NY
29205	Witmer	PA
29206	Witt	IL
29207	Witten	SD
29208	Wittenberg	WI
29209	Wittensville	KY
29210	Witter	AR
29211	Witter Springs	CA
29212	Wittman	MD
29213	Wittmann	AZ
29214	Witts Springs	AR
29215	Wixom	MI
29216	Woburn	MA
29217	Woden	IA
29218	Woden	TX
29219	Wofford Heights	CA
29220	Wolbach	NE
29221	Wolcott	CO
29222	Wolcott	CT
29223	Wolcott	IN
29224	Wolcott	NY
29225	Wolcott	VT
29226	Wolcottville	IN
29227	Wolf	WY
29228	Wolf Creek	MT
29229	Wolf Creek	OR
29230	Wolf Island	MO
29231	Wolf Lake	IL
29232	Wolf Lake	MN
29233	Wolf Point	MT
29234	Wolf Run	OH
29235	Wolfcreek	WV
29236	Wolfe	WV
29237	Wolfe City	TX
29238	Wolfeboro	NH
29239	Wolfeboro Falls	NH
29240	Wolfforth	TX
29241	Wolflake	IN
29242	Wolford	ND
29243	Wolford	VA
29244	Wolftown	VA
29245	Wolsey	SD
29246	Wolverine	MI
29247	Wolverton	MN
29248	Womelsdorf	PA
29249	Wonalancet	NH
29250	Wonder Lake	IL
29251	Wonewoc	WI
29252	Wood	PA
29253	Wood	SD
29254	Wood Dale	IL
29255	Wood Lake	MN
29256	Wood Lake	NE
29257	Wood Ridge	NJ
29258	Wood River	IL
29259	Wood River	NE
29260	Wood River Junction	RI
29261	Woodacre	CA
29262	Woodberry Forest	VA
29263	Woodbine	GA
29264	Woodbine	IA
29265	Woodbine	KS
29266	Woodbine	KY
29267	Woodbine	MD
29268	Woodbine	NJ
29269	Woodbourne	NY
29270	Woodbridge	CA
29271	Woodbridge	CT
29272	Woodbridge	NJ
29273	Woodbridge	VA
29274	Woodburn	IA
29275	Woodburn	IN
29276	Woodburn	KY
29277	Woodburn	OR
29278	Woodbury	CT
29279	Woodbury	GA
29280	Woodbury	KY
29281	Woodbury	NJ
29282	Woodbury	NY
29283	Woodbury	PA
29284	Woodbury	TN
29285	Woodbury	VT
29286	Woodbury Heights	NJ
29287	Woodcliff Lake	NJ
29288	Woodford	VA
29289	Woodford	WI
29290	Woodgate	NY
29291	Woodhaven	NY
29292	Woodhull	IL
29293	Woodhull	NY
29294	Woodinville	WA
29295	Woodlake	CA
29296	Woodlake	TX
29297	Woodland	AL
29298	Woodland	CA
29299	Woodland	GA
29300	Woodland	IL
29301	Woodland	MI
29302	Woodland	MS
29303	Woodland	NC
29304	Woodland	PA
29305	Woodland	WA
29306	Woodland	WI
29307	Woodland Hills	CA
29308	Woodland Mills	TN
29309	Woodland Park	CO
29310	Woodlawn	IL
29311	Woodlawn	TN
29312	Woodlawn	TX
29313	Woodlawn	VA
29314	Woodleaf	NC
29315	Woodlyn	PA
29316	Woodman	WI
29317	Woodmere	NY
29318	Woodridge	IL
29319	Woodridge	NY
29320	Woodrow	CO
29321	Woodruff	AZ
29322	Woodruff	SC
29323	Woodruff	UT
29324	Woodruff	WI
29325	Woods Cross	UT
29326	Woods Cross Roads	VA
29327	Woods Hole	MA
29328	Woodsboro	MD
29329	Woodsboro	TX
29330	Woodsfield	OH
29331	Woodside	DE
29332	Woodside	NY
29333	Woodson	AR
29334	Woodson	IL
29335	Woodson	TX
29336	Woodstock	AL
29337	Woodstock	CT
29338	Woodstock	GA
29339	Woodstock	IL
29340	Woodstock	MD
29341	Woodstock	MN
29342	Woodstock	NH
29343	Woodstock	NY
29344	Woodstock	OH
29345	Woodstock	VA
29346	Woodstock	VT
29347	Woodstock Valley	CT
29348	Woodston	KS
29349	Woodstown	NJ
29350	Woodsville	NH
29351	Woodville	AL
29352	Woodville	FL
29353	Woodville	MA
29354	Woodville	MS
29355	Woodville	OH
29356	Woodville	TX
29357	Woodville	VA
29358	Woodville	WI
29359	Woodville	WV
29360	Woodward	IA
29361	Woodward	OK
29362	Woodward	PA
29363	Woodway	TX
29364	Woodworth	LA
29365	Woodworth	ND
29366	Woodworth	WI
29367	Woody	CA
29368	Woody Creek	CO
29369	Wooldridge	MO
29370	Woolford	MD
29371	Woollum	KY
29372	Woolrich	PA
29373	Woolstock	IA
29374	Woolwich	ME
29375	Woolwine	VA
29376	Woonsocket	RI
29377	Woonsocket	SD
29378	Wooster	AR
29379	Wooster	OH
29380	Woosung	IL
29381	Wooton	KY
29382	Worcester	MA
29383	Worcester	NY
29384	Worcester	PA
29385	Worcester	VT
29386	Worden	IL
29387	Worden	MT
29388	Worland	WY
29389	Worley	ID
29390	Woronoco	MA
29391	Worth	IL
29392	Worth	MO
29393	Wortham	TX
29394	Worthing	SD
29395	Worthington	IA
29396	Worthington	IN
29397	Worthington	KY
29398	Worthington	MA
29399	Worthington	MN
29400	Worthington	MO
29401	Worthington	PA
29402	Worthington	WV
29403	Worthington Springs	FL
29404	Worthville	KY
29405	Worthville	PA
29406	Worton	MD
29407	Wounded Knee	SD
29408	Woxall	PA
29409	Wrangell	AK
29410	Wray	CO
29411	Wray	GA
29412	Wren	OH
29413	Wrens	GA
29414	Wrenshall	MN
29415	Wrentham	MA
29416	Wright	AR
29417	Wright	KS
29418	Wright	MN
29419	Wright	WY
29420	Wright City	MO
29421	Wright City	OK
29422	Wrights	IL
29423	Wrightsboro	TX
29424	Wrightstown	NJ
29425	Wrightstown	WI
29426	Wrightsville	AR
29427	Wrightsville	GA
29428	Wrightsville	PA
29429	Wrightsville Beach	NC
29430	Wrightwood	CA
29431	Wrigley	KY
29432	Wurtsboro	NY
29433	Wyaconda	MO
29434	Wyalusing	PA
29435	Wyandanch	NY
29436	Wyandotte	MI
29437	Wyandotte	OK
29438	Wyanet	IL
29439	Wyano	PA
29440	Wyarno	WY
29441	Wyatt	IN
29442	Wyatt	MO
29443	Wyatt	WV
29444	Wyckoff	NJ
29445	Wyco	WV
29446	Wycombe	PA
29447	Wye Mills	MD
29448	Wykoff	MN
29449	Wylie	TX
29450	Wylliesburg	VA
29451	Wymore	NE
29452	Wynantskill	NY
29453	Wyncote	PA
29454	Wyndmere	ND
29455	Wynnburg	TN
29456	Wynne	AR
29457	Wynnewood	OK
29458	Wynnewood	PA
29459	Wynona	OK
29460	Wynot	NE
29461	Wyocena	WI
29462	Wyola	MT
29463	Wyoming	IA
29464	Wyoming	IL
29465	Wyoming	MI
29466	Wyoming	MN
29467	Wyoming	NY
29468	Wyoming	PA
29469	Wyoming	RI
29470	Wyoming	WV
29471	Wysox	PA
29472	Wytheville	VA
29473	Wytopitlock	ME
29474	Xenia	IL
29475	Xenia	OH
29476	Yachats	OR
29477	Yacolt	WA
29478	Yadkinville	NC
29479	Yakima	WA
29480	Yakutat	AK
29481	Yalaha	FL
29482	Yale	IA
29483	Yale	IL
29484	Yale	MI
29485	Yale	OK
29486	Yale	SD
29487	Yale	VA
29488	Yamhill	OR
29489	Yampa	CO
29490	Yancey	TX
29491	Yanceyville	NC
29492	Yankeetown	FL
29493	Yankton	SD
29494	Yantic	CT
29495	Yantis	TX
29496	Yaphank	NY
29497	Yarmouth	IA
29498	Yarmouth	ME
29499	Yarmouth Port	MA
29500	Yarnell	AZ
29501	Yatahey	NM
29502	Yates Center	KS
29503	Yates City	IL
29504	Yatesboro	PA
29505	Yatesville	GA
29506	Yawkey	WV
29507	Yazoo City	MS
29508	Yeaddiss	KY
29509	Yeagertown	PA
29510	Yellow Jacket	CO
29511	Yellow Pine	ID
29512	Yellow Spring	WV
29513	Yellow Springs	OH
29514	Yellowstone National Park	WY
29515	Yellowtail	MT
29516	Yellville	AR
29517	Yelm	WA
29518	Yemassee	SC
29519	Yeoman	IN
29520	Yerington	NV
29521	Yerkes	KY
29522	Yermo	CA
29523	Yeso	NM
29524	Yettem	CA
29525	Yoakum	TX
29526	Yoder	CO
29527	Yoder	IN
29528	Yoder	KS
29529	Yoder	WY
29530	Yolo	CA
29531	Yolyn	WV
29532	Yoncalla	OR
29533	Yonkers	NY
29534	Yorba Linda	CA
29535	York	AL
29536	York	ME
29537	York	ND
29538	York	NE
29539	York	NY
29540	York	PA
29541	York	SC
29542	York Beach	ME
29543	York Harbor	ME
29544	York Haven	PA
29545	York New Salem	PA
29546	York Springs	PA
29547	Yorklyn	DE
29548	Yorkshire	NY
29549	Yorkshire	OH
29550	Yorktown	AR
29551	Yorktown	IA
29552	Yorktown	IN
29553	Yorktown	TX
29554	Yorktown	VA
29555	Yorktown Heights	NY
29556	Yorkville	CA
29557	Yorkville	IL
29558	Yorkville	NY
29559	Yorkville	OH
29560	Yorkville	TN
29561	Yosemite	KY
29562	Yosemite National Park	CA
29563	Young	AZ
29564	Young America	IN
29565	Young America	MN
29566	Young Harris	GA
29567	Youngstown	FL
29568	Youngstown	NY
29569	Youngstown	OH
29570	Youngstown	PA
29571	Youngsville	LA
29572	Youngsville	NC
29573	Youngsville	NM
29574	Youngsville	NY
29575	Youngsville	PA
29576	Youngtown	AZ
29577	Youngwood	PA
29578	Yountville	CA
29579	Ypsilanti	MI
29580	Ypsilanti	ND
29581	Yreka	CA
29582	Yuba City	CA
29583	Yucaipa	CA
29584	Yucca	AZ
29585	Yucca Valley	CA
29586	Yukon	MO
29587	Yukon	OK
29588	Yukon	PA
29589	Yulan	NY
29590	Yulee	FL
29591	Yuma	AZ
29592	Yuma	CO
29593	Yuma	TN
29594	Yutan	NE
29595	Zacata	VA
29596	Zachary	LA
29597	Zachow	WI
29598	Zahl	ND
29599	Zaleski	OH
29600	Zalma	MO
29601	Zamora	CA
29602	Zanesfield	OH
29603	Zanesville	IN
29604	Zanesville	OH
29605	Zanoni	MO
29606	Zap	ND
29607	Zapata	TX
29608	Zarephath	NJ
29609	Zavalla	TX
29610	Zearing	IA
29611	Zebulon	GA
29612	Zebulon	NC
29613	Zeeland	MI
29614	Zeeland	ND
29615	Zeigler	IL
29616	Zelienople	PA
29617	Zellwood	FL
29618	Zenda	KS
29619	Zenda	WI
29620	Zenia	CA
29621	Zephyr	TX
29622	Zephyr Cove	NV
29623	Zephyrhills	FL
29624	Zieglerville	PA
29625	Zillah	WA
29626	Zimmerman	MN
29627	Zion	IL
29628	Zion Grove	PA
29629	Zionhill	PA
29630	Zionsville	IN
29631	Zionsville	PA
29632	Zionville	NC
29633	Zirconia	NC
29634	Zoar	OH
29635	Zoe	KY
29636	Zolfo Springs	FL
29637	Zortman	MT
29638	Zullinger	PA
29639	Zumbro Falls	MN
29640	Zumbrota	MN
29641	Zuni	NM
29642	Zuni	VA
29643	Zurich	MT
29644	Zwingle	IA
29645	Zwolle	LA
\.


--
-- Name: meisterdish_server_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: umeisterdish
--

SELECT pg_catalog.setval('meisterdish_server_city_id_seq', 29645, true);


--
-- Name: meisterdish_server_city_pkey; Type: CONSTRAINT; Schema: public; Owner: umeisterdish; Tablespace: 
--


-- Name: meisterdish_server_city_state_id_4668b5d16f82e04e_fk_meisterdish_server_state_state_code; Type: FK CONSTRAINT; Schema: public; Owner: umeisterdish
--


