--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO telegrambot;

--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.cart_items (
    id integer NOT NULL,
    user_id integer,
    dish_id integer,
    count integer
);


ALTER TABLE public.cart_items OWNER TO telegrambot;

--
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.cart_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_items_id_seq OWNER TO telegrambot;

--
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    text character varying(100),
    user_id integer,
    username character varying(100)
);


ALTER TABLE public.comments OWNER TO telegrambot;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO telegrambot;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: dish_categories; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.dish_categories (
    id integer NOT NULL,
    name character varying(100),
    name_uz character varying(100),
    number integer,
    lft integer NOT NULL,
    rgt integer NOT NULL,
    level integer NOT NULL,
    tree_id integer,
    parent_id integer,
    image_id character varying(150),
    image_path character varying(150)
);


ALTER TABLE public.dish_categories OWNER TO telegrambot;

--
-- Name: dish_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.dish_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dish_categories_id_seq OWNER TO telegrambot;

--
-- Name: dish_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.dish_categories_id_seq OWNED BY public.dish_categories.id;


--
-- Name: dishes; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.dishes (
    id integer NOT NULL,
    name character varying(100),
    name_uz character varying(100),
    image_id character varying(150),
    image_path character varying(150),
    description character varying(500),
    description_uz character varying(500),
    is_hidden boolean,
    price double precision,
    number integer,
    category_id integer,
    show_usd boolean
);


ALTER TABLE public.dishes OWNER TO telegrambot;

--
-- Name: dishes_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.dishes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishes_id_seq OWNER TO telegrambot;

--
-- Name: dishes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.dishes_id_seq OWNED BY public.dishes.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    address character varying(100),
    order_id integer
);


ALTER TABLE public.locations OWNER TO telegrambot;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO telegrambot;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: notification_chats; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.notification_chats (
    chat_id integer NOT NULL,
    chat_title character varying(100)
);


ALTER TABLE public.notification_chats OWNER TO telegrambot;

--
-- Name: notification_chats_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.notification_chats_chat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notification_chats_chat_id_seq OWNER TO telegrambot;

--
-- Name: notification_chats_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.notification_chats_chat_id_seq OWNED BY public.notification_chats.chat_id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer,
    dish_id integer,
    count integer
);


ALTER TABLE public.order_items OWNER TO telegrambot;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO telegrambot;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    user_name character varying(100),
    shipping_method character varying(50),
    payment_method character varying(50),
    address_txt character varying(100),
    phone_number character varying(15),
    confirmed boolean,
    confirmation_date timestamp without time zone,
    delivery_price integer,
    total_amount double precision
);


ALTER TABLE public.orders OWNER TO telegrambot;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO telegrambot;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: registration_requests; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.registration_requests (
    id integer NOT NULL,
    user_id integer,
    phone_number character varying(20),
    tg_username character varying(100),
    username character varying(100),
    created_at timestamp without time zone
);


ALTER TABLE public.registration_requests OWNER TO telegrambot;

--
-- Name: registration_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.registration_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_requests_id_seq OWNER TO telegrambot;

--
-- Name: registration_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.registration_requests_id_seq OWNED BY public.registration_requests.id;


--
-- Name: user_admins; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.user_admins (
    id integer NOT NULL,
    email character varying(100),
    password_hash character varying(120)
);


ALTER TABLE public.user_admins OWNER TO telegrambot;

--
-- Name: user_admins_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.user_admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_admins_id_seq OWNER TO telegrambot;

--
-- Name: user_admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.user_admins_id_seq OWNED BY public.user_admins.id;


--
-- Name: user_dish; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.user_dish (
    user_id integer NOT NULL,
    dish_id integer
);


ALTER TABLE public.user_dish OWNER TO telegrambot;

--
-- Name: user_dish_user_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.user_dish_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_dish_user_id_seq OWNER TO telegrambot;

--
-- Name: user_dish_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.user_dish_user_id_seq OWNED BY public.user_dish.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: telegrambot
--

CREATE TABLE public.users (
    id integer NOT NULL,
    full_user_name character varying(100),
    username character varying(100),
    phone_number character varying(15),
    language character varying(5),
    token character varying(50),
    confirmed boolean,
    telegram_id integer,
    registration_date timestamp without time zone
);


ALTER TABLE public.users OWNER TO telegrambot;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: telegrambot
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO telegrambot;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: telegrambot
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: dish_categories id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dish_categories ALTER COLUMN id SET DEFAULT nextval('public.dish_categories_id_seq'::regclass);


--
-- Name: dishes id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dishes ALTER COLUMN id SET DEFAULT nextval('public.dishes_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: notification_chats chat_id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.notification_chats ALTER COLUMN chat_id SET DEFAULT nextval('public.notification_chats_chat_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: registration_requests id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.registration_requests ALTER COLUMN id SET DEFAULT nextval('public.registration_requests_id_seq'::regclass);


--
-- Name: user_admins id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.user_admins ALTER COLUMN id SET DEFAULT nextval('public.user_admins_id_seq'::regclass);


--
-- Name: user_dish user_id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.user_dish ALTER COLUMN user_id SET DEFAULT nextval('public.user_dish_user_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.alembic_version (version_num) FROM stdin;
825d5878cecb
\.


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.cart_items (id, user_id, dish_id, count) FROM stdin;
4	1021601371	1	1
5	1021601371	38	1
12	202624021	68	1
26	202624021	82	3
27	888860	1	1
29	1240123642	1	1
30	84551212	1	1
31	84551212	34	1
32	9796302	91	5
33	728862754	1	1
34	354406284	1	1
37	265550912	2	1
39	830522641	75	1
40	732088389	1	1
41	336886195	54	2
42	76462417	50	1
43	336886195	99	2
44	76462417	94	1
45	1053979100	1	1
46	615011731	1	1
47	1200923694	1	5
48	33826188	1	1
49	985422184	93	1
50	873216461	90	1
51	873216461	1	2
55	785342339	56	1
56	780706549	38	2
57	900595486	1	2
58	899853592	59	2
60	466083330	50	1
61	466083330	90	1
62	466083330	1	1
63	290155336	55	1
64	290155336	5	1
65	560404568	2	1
68	980225110	59	1
69	74438538	2	7
71	321654067	2	1
72	321654067	90	1
73	870270310	41	1
74	1170067137	32	1
75	875154984	32	9
77	900428242	38	1
78	900428242	2	1
79	468580284	82	1
80	518109259	98	1
82	1137867467	53	1
84	719801646	32	1
85	719801646	1	1
86	719801646	102	1
87	719801646	6	1
88	728577333	35	1
89	82012131	37	1
90	82012131	98	1
92	277458432	2	1
93	277458432	1	1
94	341746147	97	1
95	71291403	1	1
96	71291403	90	1
97	71291403	4	1
98	71291403	96	1
100	666192848	90	1
102	1224702788	45	1
106	824768428	78	1
107	723186466	53	1
108	612518382	6	1
110	421955254	1	1
111	326694372	1	1
112	326694372	58	1
113	668359712	1	1
115	1697416	1	1
117	1064406105	91	1
119	231448569	36	1
120	231448569	70	1
121	633288098	60	5
122	633288098	4	1
123	633288098	68	1
124	633288098	2	1
125	185170494	56	1
128	331338712	66	1
129	1106534904	1	1
131	1088270118	38	1
132	1088270118	1	1
133	842738606	50	1
134	842738606	32	1
135	842738606	2	1
136	842738606	70	1
137	674437582	95	1
144	639336999	56	1
145	639336999	97	1
146	639336999	2	1
147	639336999	102	1
149	1005127798	36	3
150	528110896	1	1
154	528110896	50	1
155	528110896	56	1
156	528110896	87	1
157	528110896	80	1
160	1208782613	72	1
161	879926986	93	1
162	1105524412	1	1
163	658055554	42	1
164	674437582	92	1
165	853545025	44	1
166	631909445	72	1
167	483404120	1	2
168	483404120	35	2
170	1325778149	1	1
171	631909445	82	1
172	65830674	59	9
173	1064406105	55	1
175	2954263	32	1
176	2954263	1	1
177	1138264	1	1
181	1067304463	35	1
182	1067304463	59	1
183	149312635	38	1
184	231463850	57	1
186	237340668	56	1
187	785342339	2	1
188	346621489	53	1
189	782748337	1	1
190	72636478	7	1
191	905595505	1	1
192	991708613	34	1
196	64925540	81	5
197	873087515	50	1
198	873087515	68	1
200	659909758	34	1
201	77578750	87	1
202	456096813	59	1
203	488987326	1	4
204	672850186	81	1
205	672850186	66	1
206	370388307	1	1
207	81730797	7	100
208	81730797	6	100
209	81730797	4	100
210	201458407	1	1
211	1192081954	1	1
212	568320617	97	1
213	700371950	1	2
214	44234689	33	1
215	44234689	81	1
216	360449283	35	1
217	1046197926	1	2
218	130601865	1	2
219	130601865	5	4
220	208659570	4	1
221	787596435	72	1
225	398161966	6	1
227	398161966	70	1
233	1240123642	96	1
234	1240123642	66	1
235	1208782613	1	1
236	723207829	1	2
238	580327136	2	1
239	580327136	1	1
240	975830453	1	4
242	650797819	84	1
243	650797819	44	1
245	518109259	34	1
247	1207426620	2	1
248	1207426620	38	1
249	955289219	1	1
250	4036197	2	1
251	623501868	32	1
252	623501868	59	1
253	1031175996	35	1
254	1031175996	81	1
255	1356858	56	2
256	1386729457	1	1
258	991985389	1	2
260	895380287	34	5
261	463621855	72	2
262	2377401	69	9
265	977716421	1	1
266	40044213	2	1
267	714275948	38	1
268	714275948	5	1
269	714275948	68	1
270	1110033868	38	2
271	1110033868	97	2
272	2301816	1	1
273	1238428198	1	5
274	1238428198	3	2
275	1238428198	4	3
276	1238428198	93	5
277	873087515	84	1
278	458600651	93	1
279	991903472	1	1
280	991903472	2	2
281	991903472	93	1
282	991903472	97	2
283	761336078	38	1
284	1138871296	59	1
285	1138871296	84	1
286	1138871296	81	1
288	77752470	1	9
289	77752470	2	2
290	384450944	32	1
292	632119349	1	1
293	748127078	53	1
294	748127078	93	1
295	591094948	56	1
296	591094948	78	1
297	985300624	2	1
299	298441765	1	2
301	1233414130	1	1
302	2582088	56	1
303	2582088	69	1
304	464358955	44	1
305	464358955	4	2
306	464358955	68	1
307	430040542	3	1
308	123026072	56	1
309	366163369	38	2
310	529907638	7	1
311	529907638	3	1
312	529907638	5	1
313	529907638	4	1
314	529907638	6	1
315	529907638	1	1
316	529907638	2	1
317	529907638	69	1
318	529907638	56	1
319	529907638	32	1
324	647323874	1	1
325	104613592	78	8
326	77988353	59	1
327	260429456	2	1
328	33417447	38	1
329	843523805	56	2
330	51855712	1	2
332	673142023	34	2
333	843523805	53	1
334	1347837938	34	2
335	67870712	34	1
336	802131373	1	1
337	1358477835	1	1
338	133733347	38	1
339	801784773	34	1
340	954632319	87	1
341	606574614	2	1
342	776576315	35	1
344	81959386	1	1
345	1106206798	1	1
346	1173450490	44	2
347	1132959724	2	6
348	1248848934	56	9
349	662808794	34	1
350	662808794	93	1
351	662808794	1	1
355	173712102	35	1
356	570637885	38	1
357	829951812	44	1
358	450672763	56	1
359	16295490	32	1
360	16295490	44	1
361	1034276791	1	2
362	2066902	33	4
363	144794149	35	1
364	606829571	38	1
367	807470310	59	1
368	807470310	93	1
369	1027023420	70	1
370	1003798147	1	2
371	217114784	78	1
372	2625355	1	2
373	989852823	35	1
377	381403	50	1
378	381403	1	1
380	27443664	1	1
381	802009348	1	1
382	802009348	4	1
383	802009348	6	1
384	802009348	70	2
385	802009348	38	6
387	780884856	56	1
388	780884856	38	1
389	780884856	87	1
390	780884856	34	1
391	707877840	56	1
392	27443664	84	2
393	709630605	6	6
395	619459485	72	1
396	619459485	1	1
399	1151885863	87	1
400	1238138747	50	2
401	1238138747	96	1
402	959457436	66	4
403	959457436	97	1
404	959457436	4	1
405	959457436	90	1
406	548868952	34	1
407	548868952	75	1
408	275298034	1	1
409	540898999	2	8
410	540898999	81	6
411	540898999	84	1
412	196221374	1	1
413	1268767625	81	1
414	380961009	34	2
416	938866883	56	2
417	1061997197	66	2
418	84738289	1	1
419	84738289	2	1
420	84738289	75	1
421	84738289	59	1
422	144637283	38	1
423	144637283	78	1
424	144637283	2	1
425	779997577	34	2
426	779997577	78	2
427	779997577	2	2
428	1088286505	3	8
429	1088286505	34	8
430	1088286505	2	7
431	55674936	97	1
433	635453650	2	1
434	735995	34	1
435	1259368838	69	2
437	365948595	4	1
442	652479438	90	1
443	742888841	59	1
444	742888841	97	1
445	742888841	70	2
446	1360196135	2	1
447	1360196135	1	1
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.comments (id, text, user_id, username) FROM stdin;
1	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	64925540	Владимир Мякота
2	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	311723796	Aliev
3	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	56008096	Маъруф Жўрабоев
4	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	659363183	Davron
5	Yaxshi ⭐️⭐️⭐️⭐️	848733647	Kasimov Dilshod
6	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	1208782613	ɪᴄᴇ&ɢᴏʟᴅ ᴇxᴄʟᴜsɪᴠᴇ
7	✍️ Оставить отзыв	1208782613	ɪᴄᴇ&ɢᴏʟᴅ ᴇxᴄʟᴜsɪᴠᴇ
8	Не плохо ⭐️⭐️⭐️	1208782613	ɪᴄᴇ&ɢᴏʟᴅ ᴇxᴄʟᴜsɪᴠᴇ
9	Очень плохо ⭐️	1208782613	ɪᴄᴇ&ɢᴏʟᴅ ᴇxᴄʟᴜsɪᴠᴇ
10	Menyu	2753522	💲Barno💲
11	🛍 Buyurtma berish	651124733	Abror Reimov
12	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	201458407	Акбар⚡
13	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	201458407	Акбар⚡
14	Хорошо ⭐️⭐️⭐️⭐️	201458407	Акбар⚡
15	Не плохо ⭐️⭐️⭐️	201458407	Акбар⚡
16	Плохо ⭐️⭐️	201458407	Акбар⚡
17	Очень плохо ⭐️	201458407	Акбар⚡
18	Плохо ⭐️⭐️	327658966	.
19	нужны фотографии	327658966	.
20	⬅️ Меню	201458407	Акбар⚡
21	asd	201458407	Акбар⚡
22	🌐 Tilni o'zgartirish	816743	Sunnat
23	Assalomu alaykum!!! Yetkazib berish qancha vaqtni o'z ichiga oladi!!!	776576315	Дилмурод
24	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	201458407	Акбар⚡
25	Yomon ⭐️⭐️	511774034	🐝 Ioana
26	Juda yomon ⭐️	631909445	مويدينوا
27	Rasmlari yoqmi?	149312635	💕💕
28	Yoqmadi ⭐️⭐️⭐️	40200066	Avazmirzo
29	/start	1192081954	❤️
30	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	1017018673	.
31	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	475877782	🇺🇿🇺🇿🇺🇿
32	Очень плохо ⭐️	195435935	👰👰👰👰👰👰
33	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	601871763	Murod Yusupov
34	Адрес где у вас	737441695	Бегзод&Шахзода
35	Хорошо ⭐️⭐️⭐️⭐️	1031175996	М🌓
36	Menu	392120312	🦈
37	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	75155463	Лора
38	Хорошо ⭐️⭐️⭐️⭐️	202624021	Ram
39	Man siladan iltimosim bor edi	1232284271	💔Muslima💔
41	Yoqmadi ⭐️⭐️⭐️	1068750372	onajonim jannatim dunyoyimsz onajon
42	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	1213046645	Sobir Azimov
43	Yaxshi ⭐️⭐️⭐️⭐️	1029442868	𝙽𝚞𝚛𝚞𝚕𝚕𝚊𝚡𝚘𝚓𝚊𝚢𝚎𝚟🖤
44	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	1238428198	thegrsmafa
45	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	895380287	Robish_keee
46	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	914533356	D 💙
47	Yoqmadi ⭐️⭐️⭐️	141704184	Javohir
48	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	865964924	Fazilatkhan
49	Очень плохо ⭐️	991903472	shoxob_ake_
50	Очень плохо ⭐️	991903472	shoxob_ake_
51	Juda yomon ⭐️	1138871296	فضلدىن بي
52	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	1138871296	فضلدىن بي
53	🛍 Buyurtma berish	933810605	UKTAMOVA .N
54	Yaxshi ⭐️⭐️⭐️⭐️	727654769	ᴹᵃᶠᵗᵘᶰᵃᵏʰᵃᶰ
55	🛍 Заказать	717212945	Елена
56	Очень плохо ⭐️	977849065	⚜️🤍
57	Yaxshi ⭐️⭐️⭐️⭐️	1298755495	Dildora
58	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	998576686	Bochit010
59	Yaxshi ⭐️⭐️⭐️⭐️	78343754	Ugilkhon Todjieva
60	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	673142023	I am kind
61	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	462699805	🍃🌺🍃
62	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	615138015	Jodugar
63	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	954632319	?
65	Andijongaham filialilani ochila	515253189	🌺АДНОНА🌺
66	🛍 Buyurtma berish	1307130589	&&&&&&&&&&
67	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	1230849186	MONALIZA♥️
68	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	5267002	Севинч
69	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	5267002	Севинч
71	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	692411174	إِسْلَم
72	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	1314456245	♬
73	Lakatsa	894322458	Jasmina
74	Qachon keladi	990771229	BMM💍
75	Juda yomon ⭐️	709630605	Akhmedova Gulnora
76	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	1243327554	❣︎🖤❣︎
77	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	1202650967	Z
78	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	1004586909	Фотима.
79	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	380961009	Диля
80	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	501223854	🌸 Nigina 🌸15362
81	Juda yomon ⭐️	1088286505	.
82	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	55674936	aziz
83	/start	635453650	Makhamadjanova
84	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	635453650	Makhamadjanova
85	Hammasi yoqdi ⭐️⭐️⭐️⭐️⭐️	812185156	🇺🇿I R🇺🇿
86	Всё понравилось ⭐️⭐️⭐️⭐️⭐️	832368004	🕊🖤
\.


--
-- Data for Name: dish_categories; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.dish_categories (id, name, name_uz, number, lft, rgt, level, tree_id, parent_id, image_id, image_path) FROM stdin;
2	🍟Снеки	🍟Gazaklar	2	1	2	1	2	\N	\N	\N
3	🍫Фондю	🍫Fondyu	3	1	2	1	3	\N	\N	\N
4	🍦Мороженое	🍦Muzqaymoq	4	1	6	1	4	\N	\N	\N
5	🥤Коктейли	🥤Kokteyllar	5	1	2	1	5	\N	\N	\N
6	🍹Напитки	🍹Ichimliklar	6	1	2	1	6	\N	\N	\N
11	Итальянское мороженое	Italiyalik muzqaymoq	1	2	3	2	4	4	\N	\N
12	Эксклюзивное мороженое	Eksklyuziv muzqaymoq	1	4	5	2	4	4	\N	\N
21	🧇Бельгийский вафли	🧇Belgiya vaflisi	1	1	34	1	7	\N	\N	\N
22	С шоколадом CALLEBAUT	CALLEBAUT shokoladi bilan	2	2	7	2	7	21	\N	\N
23	С клубникой и шоколадом CALLEBAUT	Qulupnayli va CALLEBAUT shokoladli	3	8	13	2	7	21	\N	\N
24	С бананом и шоколадом CALLEBAUT	Bananli va CALLEBAUT shokoladli	4	14	19	2	7	21	\N	\N
25	Фруктовый микс с шоколадом CALLEBAUT	Mevali miks va CALLEBAUT shokoladli	5	20	25	2	7	21	\N	\N
28	С джемом	Qiyomli	7	26	31	2	7	21	\N	\N
29	Сладкое тесто	Shirin xamir	1	3	4	3	7	22	\N	\N
30	Шоколадное тесто	Shokoladli xamir	1	5	6	3	7	22	\N	\N
31	Exclusive waffles	Exclusive waffles	1	32	33	2	7	21	\N	\N
32	Сладкое тесто	Shirin xamir	1	9	10	3	7	23	\N	\N
33	Шоколадное тесто	Shokoladli xamir	1	11	12	3	7	23	\N	\N
34	Сладкое тесто	Shirin xamir	1	15	16	3	7	24	\N	\N
37	Шоколадное тесто	Shokoladli xamir	1	17	18	3	7	24	\N	\N
38	Сладкое тесто	Shirin xamir	1	21	22	3	7	25	\N	\N
39	Шоколадное тесто	Shokoladli xamir	1	23	24	3	7	25	\N	\N
40	Сладкое тесто	Shirin xamir	1	27	28	3	7	28	\N	\N
41	Шоколадное тесто	Shokoladli xamir	1	29	30	3	7	28	\N	\N
42	🥞Гонконгский вафли	🥞Gonkong vaflisi	1	1	28	1	8	\N	\N	\N
43	С шоколадом CALLEBAUT	CALLEBAUT shokoladi bilan	1	2	7	2	8	42	\N	\N
44	Сладкое тесто	Shirin xamir	1	3	4	3	8	43	\N	\N
45	Шоколадное тесто	Shokoladli xamir	1	5	6	3	8	43	\N	\N
46	С клубникой и шоколадом CALLEBAUT	Qulupnayli va CALLEBAUT shokoladli	2	8	13	2	8	42	\N	\N
47	Сладкое тесто	Shirin xamir	1	9	10	3	8	46	\N	\N
48	Шоколадное тесто	Shokoladli xamir	1	11	12	3	8	46	\N	\N
49	С бананом и шоколадом CALLEBAUT	Bananli va CALLEBAUT shokoladli	2	14	19	2	8	42	\N	\N
50	Сладкое тесто	Shirin xamir	1	15	16	3	8	49	\N	\N
51	Шоколадное тесто	Shokoladli xamir	1	17	18	3	8	49	\N	\N
52	Фруктовый микс с шоколадом CALLEBAUT	Mevali miks va CALLEBAUT shokoladli	2	20	25	2	8	42	\N	\N
53	Сладкое тесто	Shirin xamir	1	21	22	3	8	52	\N	\N
54	Шоколадное тесто	Shokoladli xamir	1	23	24	3	8	52	\N	\N
55	Exclusive waffles	Exclusive waffles	1	26	27	2	8	42	\N	\N
1	lklkljlk	lkjlkjlkjl	1	1	2	1	9	\N	\N	\N
\.


--
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.dishes (id, name, name_uz, image_id, image_path, description, description_uz, is_hidden, price, number, category_id, show_usd) FROM stdin;
3	Мороженое Ferrero Rocher	Ferrero Rocher muzqaymoq	\N	/home/telegrambot/Ice-GoldBot/data/17.png	Мороженое Ferrero Rocher - Сливочный пломбир, Бельгийский шоколад CALLEBAUT, кусочки шоколада Ferrero Rocher.	Ferrero Rocher muzqaymoq - Qaymoqli muzqaymoq, Belgiya CALLEBAUT shokoladi, Ferrero Rocher shokolad bo'laklari.	f	31000	1	12	f
4	Мороженое Rafaello	Rafaello muzqaymoq	\N	/home/telegrambot/Ice-GoldBot/data/18.png	Мороженое Rafaello - Сливочный пломбир, Бельгийский шоколад CALLEBAUT и кусочки шоколада Rafaello.	Rafaello muzqaymoq - Qaymoqli muzqaymoq, Belgiya CALLEBAUT shokoladi, Rafaello shokolad bo'laklari.	f	31000	1	12	f
5	Мороженое Kinder	Kinder muzqaymoq	\N	/home/telegrambot/Ice-GoldBot/data/16.png	Мороженое Kinder - Сливочный пломбир, Бельгийский шоколад CALLEBAUT, кусочки шоколада Kinder.	Kinder muzqaymoq - Qaymoqli muzqaymoq, Belgiya CALLEBAUT shokoladi, Kinder shokolad bo'laklari.	f	27000	1	12	f
8	белый	oq	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 5.jpg			f	25000	1	\N	f
9	белый	oq	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 1.jpg			f	25000	1	\N	f
10	молочный	sutli	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 5.jpg			f	25000	1	\N	f
11	молочный	sutli	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 1.jpg			f	25000	1	\N	f
12	тёмный	qora	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 5.jpg			f	25000	1	\N	f
13	тёмный	qora	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 1.jpg			f	25000	1	\N	f
14	банан	banan	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 6.jpg			f	30000	1	\N	f
15	банан	banan	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 2.jpg			f	30000	1	\N	f
16	клубника	qulupnay	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 8.jpg			f	35000	1	\N	f
17	клубника	qulupnay	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 4.jpg			f	35000	1	\N	f
18	фруктовый микс	meva aralashmasi	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 7.jpg			f	38000	1	\N	f
19	фруктовый микс	meva aralashmasi	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 3.jpg			f	38000	1	\N	f
20	белый	oq	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 12.jpg			f	24000	1	\N	f
21	молочный	sutli	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 12.jpg			f	24000	1	\N	f
22	темный	qora	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 12.jpg			f	24000	1	\N	f
23	белый	oq	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 9.jpg			f	24000	1	\N	f
24	молочный	sutli	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 9.jpg			f	24000	1	\N	f
25	тёмный	qora	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 9.jpg			f	24000	1	\N	f
26	банан	banan	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 13.jpg			f	29000	1	\N	f
27	фруктовый микс	meva aralashmasi	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 14.jpg			f	37000	1	\N	f
28	банан	banan	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 10.jpg			f	29000	1	\N	f
29	фруктовый микс	meva aralashmasi	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 11.jpg			f	37000	1	\N	f
30	товар в тест	tovar v test	\N	\N	testiruem	asdasd	f	123123	1	\N	f
31	tovar vne k	tovar vne k	\N	\N	sad	asd	f	123	1	\N	f
32	Double Wafflle	Double Wafflle	\N	/home/telegrambot/Ice-GoldBot/data/2178391c-ab31-4918-a1f6-af12eb55faa3.jpg	Double Wafflle - Двойной вафли с шоколадом CALLEBAUT, пломбирным мороженым, клубникой и бананом. \\r\\n\\r\\nВ цену включён набор одноразовой посуды.	Double Wafflle - Ikki qavatli vafli CALLEBAUT shokoladli, muzqaymoq, banan va qulupnay.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	66000	1	31	f
7	Мороженое Oreo	Oreo muzqaymoq	AgACAgIAAxkDAAINwl9xx02JkCZKF691SKYlZ5c7-AuuAAKWrzEbUax5Syh_1ioeMDXNGBFIli4AAwEAAwIAA3cAA59WAgABGwQ	/home/telegrambot/Ice-GoldBot/data/1.jpg	Мороженое Oreo - Сливочный пломбир, Бельгийский шоколад CALLEBAUT, кусочки шоколада Oreo.	Oreo muzqaymoq - Qaymoqli muzqaymoq, Belgiya CALLEBAUT shokoladi, Oreo shokolad bo'laklari.	f	24000	1	12	f
2	Фондю с фруктами	Fondyu meva bilan	AgACAgIAAxkDAAIPBV9xyiupX_4YibRsEA-X52IJBJzcAAJSrzEbUax5S7VOpLbWpkOVpy5EmC4AAwEAAwIAA3gAA3MAAQEAARsE	/home/telegrambot/Ice-GoldBot/data/13b034d2-b6ed-45e1-927e-6b29c348f71c.jpg	Фондю с фруктами - Молочный шоколад CALLEBAUT, киви, клубника, банан в одноразовой посуде.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	Fondyu meva bilan - CALLEBAUT sutli shokolad, kivi, qulupnay, banan bir martalik idishda to'plami.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	46000	1	3	f
1	Фондю с вафлями	Fondyu vafli bilan	AgACAgIAAxkDAAIQHl9x87n8u1_iCSWPBjvXgIFLmR-dAAJTrzEbUax5S_B0vzJxI_tNkxNwly4AAwEAAwIAA3gAA-gRAQABGwQ	/home/telegrambot/Ice-GoldBot/data/dd9636d0-4b11-4862-8491-57df541f2fed.jpg	Фондю с вафлями - Молочный шоколад CALLEBAUT, кусочки Гонконгских вафель, клубника, банан в одноразовой посуде.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	Fondyu vafli bilan - CALLEBAUT sutli shokolad, Gonkong vaflisi bo'lakchalari, qulupnay, banan bir martalik idishda to'plami.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	52000	1	3	f
35	Exclusive waffle	Exclusive waffle	\N	/home/telegrambot/Ice-GoldBot/data/12.png	Exclusive waffle - Бельгийский вафли из шоколадного теста, молочный шоколад CALLEBAUT, банан, клубника, сливочное мороженое.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	Exclusive waffle - Shokolad xamiridan tayyorlangan Belgiya vafli, CALLEBAUT sutli shokolad, banan, qulupnay, muzqaymoq.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	46000	1	31	f
36	Белый шоколад	Oq shokolad	\N	\N	Бельгийский вафли из сладкого теста, с белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokoladli, shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	29000	1	29	f
37	Тёмный шоколад	Achchiq shokolad	\N	\N	Бельгийский вафли из сладкого теста, с тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achchiq shokoladli, shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	29000	1	29	f
39	Белый шоколад	Oq shokolad	\N	\N	Бельгийский вафли из шоколадного теста, с белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokoladli, shokolad xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	29000	1	30	f
40	Тёмный шоколад	Achchiq shokolad	\N	\N	Бельгийский вафли из шоколадного теста, с тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achchiq shokoladli, shokolad xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	29000	1	30	f
41	Молочный шоколад	Sutli shokolad	\N	\N	Бельгийский вафли из сладкого теста, с клубникой и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, qulupnay va shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	39000	1	32	f
42	Белым шоколад	Oq shokolad	\N	\N	Бельгийский вафли из сладкого теста, с клубникой и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, qulupnay va shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	39000	1	32	f
43	Тёмный шоколад	Achchiq shokolad	\N	\N	Бельгийский вафли из сладкого теста, с клубникой и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achchiq shokolad, qulupnay va shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	39000	1	32	f
45	Белый шоколад	Oq shokolad	\N	\N	Бельгийский вафли из шоколадного теста, с клубникой и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, qulupnay va shokoladli xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	39000	1	33	f
46	Тёмный шоколад	Achiq shokolad	\N	\N	Бельгийский вафли из шоколадного теста, с клубникой и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achiq shokolad, qulupnay va shokoladli xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	39000	1	33	f
48	товар 1	товар 1	\N	\N			f	123	1	\N	f
49	товар 2	товар 2	\N	\N			f	123	1	\N	f
50	Молочный шоколад	Sutli shokolad	\N	/home/telegrambot/Ice-GoldBot/data/2.png	Бельгийский вафли из сладкого теста, с бананом и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, banan va shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	34000	1	34	f
51	Белым шоколад	Oq shokolad	\N	\N	Бельгийский вафли из сладкого теста, с бананом и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, banan va shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	34000	1	34	f
52	Тёмный шоколад	Achchiq shokolad	\N	\N	Бельгийский вафли из сладкого теста, с бананом и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achchiq shokolad, banan va shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	34000	1	34	f
71	Маракуйя milkshake	Marakuyya milkshake	\N	/home/telegrambot/Ice-GoldBot/data/15.png	Маракуйя milkshake - Сливочное мороженое, натурального молоко, маракуйя в одном стакане.	Marakuyya milkshake - Bir stakan ichida qaymoqli muzqaymoq, tabiiy sut, marakuyya.	f	25000	1	5	f
38	Молочный шоколад	Sutli shokolad	AgACAgIAAxkDAAINkF9xxkfOgYetf0C3JKBubc_99hFpAAJUrzEbUax5S0d8Aj585mflckpfly4AAwEAAwIAA3kAA80KAQABGwQ	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 1.jpg	Бельгийский вафли из шоколадного теста, с молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokoladli, shokolad xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	29000	1	30	f
54	Белый шоколад	Oq shokolad	\N	\N	Бельгийский вафли из шоколадного теста, с бананом и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, banan va shokoladli xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	34000	1	37	f
55	Тёмный шоколад	Achiq shokolad	\N	\N	Бельгийский вафли из шоколадного теста, с бананом и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achiq shokolad, banan va shokoladli xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	34000	1	37	f
56	Молочный шоколад	Sutli shokolad	\N	/home/telegrambot/Ice-GoldBot/data/8.png	Бельгийский вафли из сладкого теста, с бананом, клубникой и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, banan, qulupnay va shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	42000	1	38	f
57	Белым шоколад	Oq shokolad	\N	\N	Бельгийский вафли из сладкого теста, с бананом, клубникой и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, banan, qulupnay va shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	42000	1	38	f
58	Тёмный шоколад	Achchiq shokolad	\N	\N	Бельгийский вафли из сладкого теста, с бананом, клубникой и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achchiq shokolad, banan, qulupnay va shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	42000	1	38	f
60	Белый шоколад	Oq shokolad	\N	\N	Бельгийский вафли из шоколадного теста, с бананом, клубникой и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, banan, qulupnay va shokoladli xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	42000	1	39	f
61	Тёмный шоколад	Achiq shokolad	\N	\N	Бельгийский вафли из шоколадного теста, с бананом, клубникой и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achiq shokolad, banan, qulupnay va shokoladli xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	42000	1	39	f
62	C джемом смородины	Qora qorag'at murabbosi bilan	\N	/home/telegrambot/Ice-GoldBot/data/5.png	Бельгийский вафли из сладкого теста, с джемом смородины.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	Qora qorag'at qiyomi bilan va shirin xamirdan tayyorlangan Belgiya vafli.	f	21000	1	40	f
63	С джемом лесных ягод	Reza mevalaridan qiyom	\N	/home/telegrambot/Ice-GoldBot/data/5.png	Бельгийский вафли из сладкого теста, с джемом лесных ягод.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	Reza mevalari qiyomi bilan va shirin xamirdan tayyorlangan Belgiya vafli.	f	21000	1	40	f
64	C джемом смородины	Qora qorag'at murabbosi bilan	\N	\N	Бельгийский вафли из шоколадного теста, с джемом смородины.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	Qora qorag'at qiyomi bilan va shokolad xamirdan tayyorlangan Belgiya vafli.	f	21000	1	41	f
65	С джемом лесных ягод	Reza mevalaridan qiyom	\N	\N	Бельгийский вафли из шоколадного теста, с джемом лесных ягод.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	Reza mevalari qiyomi bilan va shokolad xamirdan tayyorlangan Belgiya vafli.	f	21000	1	41	f
66	Half 50	Half 50	\N	/home/telegrambot/Ice-GoldBot/data/IMG_5475.JPG	Half 50 - Половина Бельгийский вафли из сладкого теста, с бананом, клубникой и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	Half 50 - CALLEBAUT sutli shokolad, banan, qulupnay va shirin yarim xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	24000	1	31	f
67	njdfh	njdfh	\N	\N	asd	asd	f	123	1	\N	f
68	Молочный milkshake	Sutli milkshake	\N	/home/telegrambot/Ice-GoldBot/data/14.png	Молочный milkshake - Сливочное мороженое и натурального молоко в одном стакане.	Sutli milkshake - Bir stakan ichida qaymoqli muzqaymoq va tabiiy sut.	f	20000	1	5	f
69	Клубничный milkshake	Qulupnayli milkshake	\N	/home/telegrambot/Ice-GoldBot/data/13.png	Клубничный milkshake - Сливочное мороженое, натурального молоко, клубничный  в одном стакане.	Qulupnayli milkshake - Bir stakan ichida qaymoqli muzqaymoq, tabiiy sut, qulupnay.	f	25000	1	5	f
70	Банановый milkshake	Bananli milkshake	\N	/home/telegrambot/Ice-GoldBot/data/14.png	Банановый milkshake - Сливочное мороженое, натурального молоко, банан в одном стакане.	Bananli milkshake - Bir stakan ichida qaymoqli muzqaymoq, tabiiy sut, banan.	f	25000	1	5	f
53	Молочный шоколад	Sutli shokolad	AgACAgIAAxkDAAINeV9xxjFIr4kWTdnihS1oqSD3r3fiAAJprzEbUax5SzxO08VubTxxXG_Uli4AAwEAAwIAA3kAAx2pAQABGwQ	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 2.jpg	Бельгийский вафли из шоколадного теста, с бананом и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, banan va shokoladli xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	34000	1	37	f
72	Молочный шоколад	Sutli shokolad	\N	\N	Гонконгский вафли из сладкого теста, с молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokoladli, shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	28000	1	44	f
73	Белый шоколад	Oq shokolad	\N	\N	Гонконгский вафли из сладкого теста, с белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokoladli, shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	28000	1	44	f
74	Тёмный шоколад	Achchiq shokolad	\N	\N	Гонконгский вафли из сладкого теста, с тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achchiq shokoladli, shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	28000	1	44	f
75	Молочный шоколад	Sutli shokolad	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 9.jpg	Гонконгский вафли из шоколадного теста, с молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokoladli, shokolad xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	28000	1	45	f
76	Белый шоколад	Oq shokolad	\N	\N	Гонконгский вафли из шоколадного теста, с белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokoladli, shokolad xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	28000	1	45	f
77	Тёмный шоколад	Achchiq shokolad	\N	\N	Гонконгский вафли из шоколадного теста, с тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achchiq shokoladli, shokolad xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	28000	1	45	f
78	Молочный шоколад	Sutli shokolad	\N	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 111.jpg	Гонконгский вафли из сладкого теста, с клубникой и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, qulupnay va shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	38000	1	47	f
79	Белым шоколад	Oq shokolad	\N	\N	Гонконгский вафли из сладкого теста, с клубникой и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, qulupnay va shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	38000	1	47	f
80	Тёмный шоколад	Achchiq shokolad	\N	\N	Гонконгский вафли из сладкого теста, с клубникой и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achchiq shokolad, qulupnay va shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	38000	1	47	f
82	Белый шоколад	Oq shokolad	\N	\N	Гонконгский вафли из шоколадного теста, с клубникой и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, qulupnay va shokoladli xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	38000	1	48	f
83	Тёмный шоколад	Achiq shokolad	\N	\N	Гонконгский вафли из шоколадного теста, с клубникой и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achiq shokolad, qulupnay va shokoladli xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	38000	1	48	f
84	Молочный шоколад	Sutli shokolad	\N	/home/telegrambot/Ice-GoldBot/data/4.png	Гонконгский вафли из сладкого теста, с бананом и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, banan va shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	33000	1	50	f
85	Белым шоколад	Oq shokolad	\N	\N	Гонконгский вафли из сладкого теста, с бананом и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, banan va shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	33000	1	50	f
86	Тёмный шоколад	Achchiq shokolad	\N	\N	Гонконгский вафли из сладкого теста, с бананом и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achchiq shokolad, banan va shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	33000	1	50	f
88	Белый шоколад	Oq shokolad	\N	\N	Гонконгский вафли из шоколадного теста, с бананом и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, banan va shokoladli xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	33000	1	51	f
81	Молочный шоколад	Sutli shokolad	AgACAgIAAxkDAAIQLV9x88T7kvVzvBWpgwG7IRWLkz1JAAJdrzEbtplpSxnkhSNAI4FLoReili4AAwEAAwIAA3cAA-7UAQABGwQ	/home/telegrambot/Ice-GoldBot/data/7.png	Гонконгский вафли из шоколадного теста, с клубникой и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, qulupnay va shokoladli xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	38000	1	48	f
89	Тёмный шоколад	Achiq shokolad	\N	\N	Гонконгский вафли из шоколадного теста, с бананом и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achiq shokolad, banan va shokoladli xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	33000	1	51	f
90	Молочный шоколад	Sutli shokolad	\N	/home/telegrambot/Ice-GoldBot/data/6.png	Гонконгский вафли из сладкого теста, с бананом, клубникой и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, banan, qulupnay va shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	41000	1	53	f
91	Белым шоколад	Oq shokolad	\N	\N	Гонконгский вафли из сладкого теста, с бананом, клубникой и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, banan, qulupnay va shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	41000	1	53	f
92	Тёмный шоколад	Achchiq shokolad	\N	\N	Гонконгский вафли из сладкого теста, с бананом, клубникой и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achchiq shokolad, banan, qulupnay va shirin xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	41000	1	53	f
94	Белый шоколад	Oq shokolad	\N	\N	Гонконгский вафли из шоколадного теста, с бананом, клубникой и белым шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT oq shokolad, banan, qulupnay va shokoladli xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	41000	1	54	f
95	Тёмный шоколад	Achiq shokolad	\N	\N	Гонконгский вафли из шоколадного теста, с бананом, клубникой и тёмным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT achiq shokolad, banan, qulupnay va shokoladli xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	t	41000	1	54	f
96	С фисташкой	Xandon pista bilan	\N	/home/telegrambot/Ice-GoldBot/data/11.png	Гонконгский вафли из сладкого теста, молочный бельгийский шоколад CALLEBAUT, мелкие крошки фисташки, мороженое.	Shirin xamirdan tayyorlangan Gonkong vaflisi, CALLEBAUT sutli Belgiya shokoladi, maydalangan xandon pista, muzqaymoq.	f	43000	1	55	f
98	MOJITO классический	Klassik MOJITO	\N	\N	MOJITO классический	Klassik MOJITO	t	18000	1	6	f
99	ICE TEA классический	Klassik ICE TEA	\N	\N	ICE TEA классический	Klassik ICE TEA	t	18000	1	6	f
100	MOJITO персиковый	Shaftolili MOJITO	\N	\N	MOJITO персиковый	Shaftolili MOJITO	t	20000	1	6	f
101	MOJITO манго	Mangoli MOJITO	\N	\N	MOJITO манго	Mangoli MOJITO	t	22000	1	6	f
102	MOJITO клубничный	Qulupnayli MOJITO	\N	\N	MOJITO клубничный	Qulupnayli MOJITO	t	22000	1	6	f
34	Молочный шоколад	Sutli shokolad	AgACAgIAAxkDAAIL819wUEokhKNQpKDFgcpuZ0l-yTs_AAJNszEb885pS2Ft1vxsXq-DzT9cly4AAwEAAwIAA3cAAzfqAAIbBA	/home/telegrambot/Ice-GoldBot/data/1.png	Бельгийский вафли из сладкого теста, с молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokoladli, shirin xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	29000	1	29	f
93	Молочный шоколад	Sutli shokolad	AgACAgIAAxkDAAIMG19xwK_qXOaJi-2o6lHf6_TdC9-6AAJzrzEbUax5S3XjaZQpLfTm9fLdly4AAwEAAwIAA3kAAyDYAAIbBA	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 11.jpg	Гонконгский вафли из шоколадного теста, с бананом, клубникой и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, banan, qulupnay va shokoladli xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	41000	1	54	f
59	Молочный шоколад	Sutli shokolad	AgACAgIAAxkDAAIMRF9xwopgdJg-OrJuddatzF2ZFno9AAJsrzEbUax5S5_msjk28y0yzE7zly4AAwEAAwIAA3kAA9XuAAIbBA	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 3.jpg	Бельгийский вафли из шоколадного теста, с бананом, клубникой и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, banan, qulupnay va shokoladli xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	42000	1	39	f
44	Молочный шоколад	Sutli shokolad	AgACAgIAAxkDAAIMXF9xwxwJokXdlmuKmfrOCP6RTcPQAAJUszEb885pS4kAAQWN6liSEZmAnZYuAAMBAAMCAAN5AANS0gEAARsE	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 4.jpg	Бельгийский вафли из шоколадного теста, с клубникой и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, qulupnay va shokoladli xamirdan tayyorlangan Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	39000	1	33	f
6	Мороженое KitKat	KitKat muzqaymoq	AgACAgIAAxkDAAINCl9xxUTuz83tRuNOrraaKCwBDHUHAAJQrzEbUax5S8jxgrAB2sNK3E0SlS4AAwEAAwIAA3cAA4uCBAABGwQ	/home/telegrambot/Ice-GoldBot/data/19.png	Мороженое KitKat - Сливочный пломбир, Бельгийский шоколад CALLEBAUT, кусочки шоколада KitKat.	KitKat muzqaymoq - Qaymoqli muzqaymoq, Belgiya CALLEBAUT shokoladi, KitKat shokolad bo'laklari.	f	24000	1	12	f
97	С M&M’s	M&M’s bilan	AgACAgIAAxkDAAIPZ19xzByyuf1y9mG_xKs7LPX4bAxBAALzrTEbdhlhS0EIQbTqVcqIRUDwly4AAwEAAwIAA3cAA3_cAAIbBA	/home/telegrambot/Ice-GoldBot/data/10.png	Гонконгский вафли из сладкого теста, молочный бельгийский шоколад CALLEBAUT, шоколад M&M’s, мороженое.	Shirin xamirdan tayyorlangan Gonkong vaflisi, CALLEBAUT sutli Belgiya shokoladi, M&M’s shokoladi, muzqaymoq.	f	33000	1	55	f
87	Молочный шоколад	Sutli shokolad	AgACAgIAAxkDAAINPl9xxbjteeXg35E8MUxPYXsEUNRUAAJwrzEbUax5SzR6J80dBcOTAAGsV5cuAAMBAAMCAAN5AAPaCAEAARsE	/home/telegrambot/Ice-GoldBot/data/Ice & GOLD 10.jpg	Гонконгский вафли из шоколадного теста, с бананом и молочным шоколадом CALLEBAUT.\\r\\n\\r\\nВ цену включён набор одноразовой посуды.	CALLEBAUT sutli shokolad, banan va shokoladli xamirdan tayyorlangan Gonkong vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	33000	1	51	f
33	Day & Night	Day & Night	AgACAgIAAxkDAAIPI19xyyxl0x04XrUDWgpSxtML6UdFAAJtrzEbUax5S6UtqhjC5Kk7qIvali4AAwEAAwIAA3kABKsBAAEbBA	/home/telegrambot/Ice-GoldBot/data/photo5273972827785113317.jpg	Day & Night - Бельгийский вафли из сладкого теста, покрытая белым и молочным шоколадом с добавлением ароматного кунжута и арахиса. \\r\\n\\r\\nВ цену включён набор одноразовой посуды.	Day & Night - Shirin hamirli, sutli va oq shokolad bilan qoplangan, xushbo'y sedana va yeryong'oqli Belgiya vaflisi.\\r\\n\\r\\nNarxga idish to'plami kiritilgan.	f	36000	1	31	f
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.locations (id, latitude, longitude, address, order_id) FROM stdin;
2	41.3627120000000019	69.2382860000000022	Узбекистан, Ташкент, Олмазорский район, махалля Гулсарой	2
19	41.3626110000000011	69.2382719999999949	Узбекистан, Ташкент, Олмазорский район, махалля Гулсарой	5
22	41.3626110000000011	69.2382719999999949	Узбекистан, Ташкент, Олмазорский район, махалля Гулсарой	30
23	41.302346	69.2295510000000007	Узбекистан, Ташкент, 2-й проезд Козиробод	44
25	41.3144429999999971	69.1897230000000008	Узбекистан, Ташкент, улица Марс	46
29	41.3628610000000023	69.2382110000000068	Узбекистан, Ташкент, Олмазорский район, махалля Гулсарой	56
30	41.3626110000000011	69.2382719999999949	Узбекистан, Ташкент, Олмазорский район, махалля Гулсарой	57
35	41.2787849999999992	69.2506989999999973	Узбекистан, Ташкент, Яккасарайский район, махалля Мухандислар	64
36	41.2568369999999973	69.161483000000004	Узбекистан, Ташкент, 3-й проезд Заргарлик, 71	65
37	41.3292199999999994	69.281480000000002	Узбекистан, Ташкент, Юнусабадский район, массив Минор	67
38	41.2953440000000001	69.180269999999993	Узбекистан, Ташкент, Учтепинский район, массив Чиланзар, 15-й квартал, 8	68
39	41.3534700000000015	69.3434979999999968	Узбекистан, Ташкент, Мирзо-Улугбекский район, махалля Шахриобод	69
40	41.3596199999999996	69.2144710000000032	Узбекистан, Ташкент, 1-я улица Каракамыш	70
41	41.2892569999999992	69.1393079999999998	Узбекистан, Ташкент, Учтепинский район, махалля Урикзор	73
42	41.3633930000000021	69.2743069999999932	Узбекистан, Ташкент, Юнусабадский район, махалля Кушчинор	74
44	41.3608139999999977	69.3704950000000053	Узбекистан, Ташкент, Мирзо-Улугбекский район, массив Феруза-3	76
45	41.2747460000000004	69.3098219999999969	Узбекистан, Ташкент, Фергана Йули	75
46	41.3599960000000024	69.2915629999999965	Узбекистан, Ташкент, 5-й проезд Хушнаво	77
47	41.2854489999999998	69.242596000000006	Узбекистан, Ташкент, улица Юсуфа Хамадони	78
48	41.3621180000000024	69.3939989999999938	Узбекистан, Ташкент, Мирзо-Улугбекский район, махалля Юзработ	79
51	41.332374999999999	69.3035289999999975	Узбекистан, Ташкент, улица Аккурган, 35	84
52	41.2854870000000034	69.1719250000000017	Узбекистан, Ташкент, Учтепинский район, массив Чиланзар, 23-й квартал, 47	85
53	39.7498549999999966	64.3992539999999991	Узбекистан, Бухарская область, Бухара	86
54	41.3413400000000024	69.2301099999999963	Узбекистан, Ташкент, Олмазорский район, махалля Гузарбоши	87
55	41.3565290000000019	69.3585960000000057	Узбекистан, Ташкент, улица Мирзо Улугбека	89
56	41.2661069999999981	69.2169319999999999	Узбекистан, Ташкент, Кичик Халка Йули, 45А	90
57	41.2953389999999985	69.1803369999999944	Узбекистан, Ташкент, Учтепинский район, массив Чиланзар, 15-й квартал, 8	91
58	41.269280000000002	69.2091020000000015	Узбекистан, Ташкент, улица Тупкайрагач, 21	88
59	41.3248869999999968	69.2972230000000025	Узбекистан, Ташкент, улица Осиё, 3	92
60	41.2753259999999997	69.3139160000000061	Узбекистан, Ташкент, Фергана Йули, 95А/1	94
61	41.2873340000000013	69.1422529999999966	Узбекистан, Ташкент, Учтепинский район, Зарафшанская улица	97
62	41.327294000000002	69.2544829999999934	Узбекистан, Ташкент, Шайхантахурский район, массив Джангох, 3/4	99
63	41.330525999999999	69.2464899999999943	Узбекистан, Ташкент, Олмазорский район, массив Себзар, 1	100
64	41.3236180000000033	69.3261729999999972	Узбекистан, Ташкент, улица Мухаммада Юсуфа	101
65	41.3241799999999984	69.2295699999999954	Узбекистан, Ташкент, Шайхантахурский район, массив Гульабад, улица Гулобод	102
66	41.3551179999999974	69.2534660000000031	Узбекистан, Ташкент, Олмазорский район, махалля Мискин	103
67	41.3242839999999987	69.2296790000000044	Узбекистан, Ташкент, Шайхантахурский район, массив Гульабад, улица Гулобод	104
68	41.2418649999999971	69.3345819999999975	Узбекистан, Ташкент, Яшнободский район, массив Куйлюк-Центр, 10В	105
70	41.3240959999999973	69.3314529999999962	Узбекистан, Ташкент, 2-й проезд Хирмонтепа, 14	109
71	41.3684780000000032	69.274360999999999	Узбекистан, Ташкент, Юнусабадский район, махалля Астробод	110
73	41.338515000000001	69.250953999999993	Узбекистан, Ташкент, Шайхантахурский район, махалля Юкори Себзор	112
74	41.3258190000000027	69.263623999999993	Узбекистан, Ташкент, улица Лабзак, 30	111
75	41.325363000000003	69.2630460000000028	Узбекистан, Ташкент, Шайхантахурский район, массив Ц-13	113
76	41.315964000000001	69.1910529999999966	Узбекистан, Ташкент, 1-й проезд Маннона Уйгура, 4	114
77	41.3248869999999968	69.2972230000000025	Узбекистан, Ташкент, улица Осиё, 3	115
78	41.3265189999999976	69.1810260000000028	Узбекистан, Ташкент, Учтепинский район, махалля Богичинор	116
79	41.3246559999999974	69.2971780000000024	Узбекистан, Ташкент, улица Осиё, 3	117
80	41.315018000000002	69.2931180000000069	Узбекистан, Ташкент, улица Хамида Алимджана, 5	118
81	41.2929069999999996	69.2833020000000062	Узбекистан, Ташкент, улица Хонзодабегим, 3	119
83	41.3587989999999976	69.1305799999999948	Узбекистан, Ташкентская область, Ташкентский район, городской посёлок Шамсиабад	121
84	41.3131500000000003	69.1114790000000028	Узбекистан, Ташкентская область, Зангиатинский район, населённый пункт Алимбува	124
85	41.3430820000000026	69.2088049999999981	Узбекистан, Ташкент, улица Фараби, 5А	125
86	41.296356000000003	69.3575069999999982	Узбекистан, Ташкент, Яшнободский район, массив Тузель, 1-й квартал, 10	126
87	41.2913009999999971	69.2253460000000018	Узбекистан, Ташкент, улица Мукими, 22	128
88	41.3151080000000022	69.2903610000000043	Узбекистан, Ташкент, Мирзо-Улугбекский район, улица Шастри	130
89	41.3709869999999995	69.2149299999999954	Узбекистан, Ташкент, улица Остона	129
90	41.3710280000000026	69.2153299999999945	Узбекистан, Ташкент, улица Сора Эшонтураева	131
91	41.3192870000000028	69.1991270000000043	Узбекистан, Ташкент, улица Бехзода, 16	132
92	41.2957439999999991	69.2540570000000031	Узбекистан, Ташкент, улица Юсуфа Хос Ходжиба, 64А	133
93	41.2957859999999997	69.2540359999999993	Узбекистан, Ташкент, Яккасарайский район, махалля Тепа	134
95	41.2626229999999978	69.3968670000000003	Узбекистан, Ташкентская область, Юкарычирчикский район, населённый пункт Шаназар	136
96	41.3155789999999996	69.2857020000000006	Узбекистан, Ташкент, Мирзо-Улугбекский район, массив Олой, 5	137
97	41.2418860000000009	69.3345709999999968	Узбекистан, Ташкент, Яшнободский район, массив Куйлюк-Центр, 10В	106
98	41.2044640000000015	69.2077850000000012	Узбекистан, Ташкент, 6-й проезд Ёркин Хаёт, 11	139
99	41.2044849999999983	69.2077740000000006	Узбекистан, Ташкент, 6-й проезд Ёркин Хаёт, 11	140
100	41.363114000000003	69.3214660000000009	Узбекистан, Ташкент, 5-й проезд Октепа, 4	141
101	41.371147999999998	69.3077940000000012	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 14-й квартал, 37	120
102	41.3012569999999997	69.2190920000000034	Узбекистан, Ташкент, улица Гульхани	143
103	41.3325010000000006	69.1730840000000029	Узбекистан, Ташкент, улица Сойгузар	144
104	41.3627460000000013	69.2389160000000032	Узбекистан, Ташкент, Карасарайская улица, 325Б	135
105	41.3388459999999966	69.1900380000000013	Узбекистан, Ташкент, улица Пахтачи	145
106	41.3780810000000017	69.2816100000000006	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 9-й квартал, 3А	146
107	41.2897469999999984	69.221935000000002	Узбекистан, Ташкент, Чиланзарский район, массив Чиланзар, квартал Е, 10	147
108	41.3102099999999979	69.3406200000000013	Узбекистан, Ташкент, улица Карнок, 15	148
109	41.3627460000000013	69.2389160000000032	Узбекистан, Ташкент, Карасарайская улица, 325Б	150
110	41.2171159999999972	69.2247600000000034	Узбекистан, Ташкент, Сергелийский район, махалля Софдил	151
111	41.2693760000000012	69.1932120000000026	Узбекистан, Ташкент, улица Эски-Катартал, 9	152
113	41.3536080000000013	69.3248880000000014	Узбекистан, Ташкент, Наманганская улица, 2	154
114	41.2789089999999987	69.3499709999999965	Узбекистан, Ташкент, улица Куламли, 17	155
115	41.2895389999999978	69.2707690000000014	Узбекистан, Ташкент, тупик Акбара Мирокилова	156
116	41.2568369999999973	69.161483000000004	Узбекистан, Ташкент, 3-й проезд Заргарлик, 71	157
117	41.2860489999999984	69.1440350000000024	Узбекистан, Ташкент, улица Нуравшан, 20	158
119	41.2459029999999984	69.2848960000000034	Узбекистан, Ташкент, Сергелийский район, 7-й квартал, 8	160
120	41.2418649999999971	69.3345819999999975	Узбекистан, Ташкент, Яшнободский район, массив Куйлюк-Центр, 10В	161
121	41.3189289999999971	69.3695450000000022	Узбекистан, Ташкентская область, Кибрайский район, населённый пункт Гульзар, улица Тараккиёт	164
122	41.317185000000002	69.1574499999999972	Узбекистан, Ташкент, улица Мухаббат, 75	159
123	41.361815	69.1946719999999971	Узбекистан, Ташкент, Олмазорский район, массив Олимпия, 7	165
124	41.3262750000000025	69.3052739999999972	Узбекистан, Ташкент, улица Аккурган, 18	166
125	41.3807339999999968	69.2879680000000064	Узбекистан, Ташкент, улица Хидиралиева, 14	167
126	41.389363000000003	69.3667679999999933	Узбекистан, Ташкентская область, Кибрайский район, городской посёлок Салар	168
127	41.2789009999999976	69.3499429999999961	Узбекистан, Ташкент, улица Куламли, 17	169
128	41.3442679999999996	69.2437209999999936	Узбекистан, Ташкент, Олмазорский район, массив Бобохонова, 8	170
129	41.2763429999999971	69.1780380000000008	Узбекистан, Ташкент, Учтепинский район, массив Чиланзар, 26-й квартал, 22	153
130	41.3467249999999993	69.3510179999999963	Узбекистан, Ташкент, улица Суфизода	171
131	41.3628309999999999	69.2388729999999981	Узбекистан, Ташкент, Карасарайская улица, 325Б	172
132	41.3380030000000005	69.2725329999999957	Узбекистан, Ташкент, Юнусабадский район, Кичик Халка Йули, 57	173
133	41.2873110000000025	69.2403659999999945	Узбекистан, Ташкент, улица Урикзор	176
134	41.3627460000000013	69.2389160000000032	Узбекистан, Ташкент, Карасарайская улица, 325Б	177
135	41.3627460000000013	69.2389160000000032	Узбекистан, Ташкент, Карасарайская улица, 325Б	178
136	41.3142629999999969	69.1896849999999972	Узбекистан, Ташкент, улица Марс, 48	179
137	41.3507499999999979	69.3068470000000048	Узбекистан, Ташкент, улица Отчопар, 67	180
138	41.3627749999999992	69.2389330000000029	Узбекистан, Ташкент, Карасарайская улица, 325Б	181
139	41.3027230000000003	69.1613540000000029	Узбекистан, Ташкент, 8-й проезд Атаи, 66	183
140	41.2955320000000015	69.2796570000000003	Узбекистан, Ташкент, улица Саида Барака	184
141	41.3150899999999979	69.2904680000000042	Узбекистан, Ташкент, Мирзо-Улугбекский район, улица Шастри	185
142	41.2416529999999995	69.1853890000000007	Узбекистан, Ташкент, Чиланзарский район, махалля Бешкургон	186
143	41.2418649999999971	69.3345819999999975	Узбекистан, Ташкент, Яшнободский район, массив Куйлюк-Центр, 10В	187
144	41.3145880000000005	69.2022149999999954	Узбекистан, Ташкент, Бахмальская улица, 41	188
145	41.3583070000000035	69.2165899999999965	Узбекистан, Ташкент, Олмазорский район, махалля Истикбол	189
146	41.2952000000000012	69.2793410000000023	Узбекистан, Ташкент, Мирабадский район, массив Айбек, 14	190
147	41.2952080000000024	69.2793690000000026	Узбекистан, Ташкент, Мирабадский район, массив Айбек, 14	191
148	41.2904920000000004	69.2598019999999934	Узбекистан, Ташкент, улица Шота Руставели, 35	192
149	41.2153009999999966	69.2427830000000029	Узбекистан, Ташкент, Сергелийский район, массив Сергели-IV, 20	193
150	41.362796000000003	69.2389220000000023	Узбекистан, Ташкент, Карасарайская улица, 325Б	194
151	41.362796000000003	69.2389220000000023	Узбекистан, Ташкент, Карасарайская улица, 325Б	195
152	41.3221240000000023	69.214264	Узбекистан, Ташкент, проезд Кукча-Дарвоза	196
153	41.3310900000000032	69.2461729999999989	Узбекистан, Ташкент, Олмазорский район, махалля Янги Себзор	197
154	41.2056660000000008	69.2183569999999975	Узбекистан, Ташкент, Сергелийский район, массив Сергели-I, 54	198
155	41.2644900000000021	69.3123640000000023	Узбекистан, Ташкент, 4-й проезд Окбилол, 19	199
157	41.1963170000000005	69.2068390000000022	Узбекистан, Ташкент, Сергелийский район, массив Йолак, 2	203
158	41.3212150000000022	69.3006850000000014	Узбекистан, Ташкент, проспект Мустакиллик, 77	202
159	41.348702000000003	69.372242	Узбекистан, Ташкент, улица Буюк Ипак Йули, 396А	205
160	41.2838619999999992	69.2033480000000054	Узбекистан, Ташкент, улица Катартал	206
161	41.2953359999999989	69.1802420000000069	Узбекистан, Ташкент, Учтепинский район, массив Чиланзар, 15-й квартал, 8	207
162	41.359969999999997	69.2918990000000008	Узбекистан, Ташкент, Юнусабадский район, махалля Юнусабад	208
163	41.2568369999999973	69.161483000000004	Узбекистан, Ташкент, 3-й проезд Заргарлик, 71	209
164	41.2953600000000023	69.2501519999999999	Узбекистан, Ташкент, улица Бабура, 10	210
165	41.3571809999999971	69.299508000000003	Узбекистан, Ташкент, улица Азимтепа	211
166	41.2017510000000016	69.2281579999999934	Узбекистан, Ташкент, Сергелийский район, массив Йулдош, 10-й квартал	212
167	41.3080799999999968	69.269722999999999	Узбекистан, Ташкент, улица Ислама Каримова, 17Б	213
168	41.2449760000000012	69.3237740000000002	Узбекистан, Ташкент, улица Парвона, 10	214
169	41.3262580000000028	69.180964000000003	Узбекистан, Ташкент, улица Богичинор	215
171	41.3266810000000007	69.3051669999999973	Узбекистан, Ташкент, улица Аккурган, 18	217
172	41.3283150000000035	69.2778670000000005	Узбекистан, Ташкент, улица Осиё	218
173	41.2964830000000021	69.1937709999999981	Узбекистан, Ташкент, Кичик Халка Йули	219
174	41.2418600000000026	69.3349060000000037	Узбекистан, Ташкент, Яшнободский район, массив Куйлюк-Центр	220
175	41.3494799999999998	69.3808279999999939	Узбекистан, Ташкент, улица Яшна, 16	222
176	41.3282669999999968	69.2779560000000032	Узбекистан, Ташкент, улица Осиё	223
178	41.3161410000000018	69.2552639999999968	Узбекистан, Ташкент, Шайхантахурский район, махалля Урда	225
179	41.2788790000000034	69.3499539999999968	Узбекистан, Ташкент, улица Куламли, 17	227
180	41.2961200000000019	69.2639039999999966	Узбекистан, Ташкент, улица Восита Вохидова, 106	228
181	41.3440760000000012	69.2423639999999949	Узбекистан, Ташкент, Карасарайская улица, 238	229
183	41.2285809999999984	69.2127880000000033	Узбекистан, Ташкент, Сергелийский район, массив Сергели-VIа, 6	232
184	41.2873110000000025	69.2403659999999945	Узбекистан, Ташкент, улица Урикзор	233
186	41.380937000000003	69.2239670000000018	Узбекистан, Ташкент, улица Узумбог, 34	235
187	41.3323680000000024	69.2931669999999968	Узбекистан, Ташкент, Юнусабадский район, Кичик Халка Йули	236
189	41.2527419999999978	69.3442370000000068	Узбекистан, Ташкент, улица Курувчилар	238
190	41.3263919999999985	69.3762279999999976	Узбекистан, Ташкентская область, Кибрайский район, населённый пункт Гульзар, улица Ватан	239
191	41.3263869999999969	69.3762949999999989	Узбекистан, Ташкентская область, Кибрайский район, населённый пункт Гульзар, улица Ватан	240
192	41.3961869999999976	69.236023000000003	Узбекистан, Ташкент, 4-й проезд Катта Хасанбой	241
193	41.196942	69.2031740000000042	Узбекистан, Ташкент, Сергелийский район, Кипчак, 16	242
194	41.2924039999999977	69.2071009999999944	Узбекистан, Ташкент, 1-я улица Катартал	243
195	41.3413690000000003	69.2782339999999976	Узбекистан, Ташкент, Юнусабадский район, махалля Минор	237
196	41.341389999999997	69.278222999999997	Узбекистан, Ташкент, Юнусабадский район, махалля Минор	244
197	41.2789590000000004	69.2469660000000005	Узбекистан, Ташкент, улица Шота Руставели, 65	245
198	41.3245259999999988	69.2968879999999956	Узбекистан, Ташкент, Мирзо-Улугбекский район, махалля Хамид Олимжон	247
199	41.2733720000000019	69.1489109999999982	Узбекистан, Ташкент, улица Кизил Шарк	248
200	41.3890870000000035	69.2271889999999956	Узбекистан, Ташкент, 9-й проезд Узумбог, 72	249
201	41.439118999999998	69.5537609999999944	Узбекистан, Ташкентская область, Чирчик	250
202	41.3359859999999983	69.2558800000000048	Узбекистан, Ташкент, улица Себзар, 7	251
203	41.2659620000000018	69.321392000000003	Узбекистан, Ташкент, 1-й Акдарьинский проезд, 81	253
204	41.2788929999999965	69.3499149999999958	Узбекистан, Ташкент, улица Куламли, 17	255
205	41.3216899999999967	69.2469760000000036	Узбекистан, Ташкент, улица Алишера Навои	256
206	41.2913050000000013	69.171401000000003	Узбекистан, Ташкент, Учтепинский район, массив Чиланзар, 21-й квартал, 1	257
207	41.2886439999999979	69.2741879999999952	Узбекистан, Ташкент, улица Нукус, 73А	258
208	41.2967689999999976	69.2806810000000013	Узбекистан, Ташкент, улица Тараса Шевченко, 38А	259
209	41.286520000000003	69.2656110000000069	Узбекистан, Ташкент, улица Кичик Миробод, 106	260
210	41.2785429999999991	69.2481439999999964	Узбекистан, Ташкент, улица Мукими	261
211	41.1922679999999986	69.1554110000000009	Узбекистан, Ташкентская область, Зангиатинский район, городской посёлок Уртааул	262
212	41.3278699999999972	69.3754550000000023	Узбекистан, Ташкентская область, Кибрайский район, населённый пункт Гульзар, улица Бунёдкорлик	263
213	41.2958300000000023	69.2097590000000054	Узбекистан, Ташкент, Чиланзарский район, массив Чиланзар, 7-й квартал, 18В	265
214	41.3166889999999967	69.2402309999999943	Узбекистан, Ташкент, Шайхантахурский район, массив Караташ	266
215	41.2940990000000028	69.2723119999999994	Узбекистан, Ташкент, улица Мирабад, 47	267
216	41.3815250000000034	69.2704980000000035	Узбекистан, Ташкент, 4-й проезд Исламабада	268
217	41.2568369999999973	69.161483000000004	Узбекистан, Ташкент, 3-й проезд Заргарлик, 71	269
218	40.6264460000000014	68.7437579999999997	Узбекистан, Сырдарьинская область, Гулистанский район	271
219	41.2814440000000005	69.3026820000000043	Узбекистан, Ташкент, улица Янгизамон	273
220	41.3635480000000015	69.3254799999999989	Узбекистан, Ташкент, 1-й проезд Сохибкор	274
221	41.3280659999999997	69.3046640000000025	Узбекистан, Ташкент, улица Аккурган, 25	276
222	41.3265400000000014	69.2285719999999998	Узбекистан, Ташкент, улица Беруни, 3А	277
223	41.3887679999999989	69.2270910000000015	Узбекистан, Ташкент, Олмазорский район, махалля Ахил	278
224	41.2908359999999988	69.1731549999999942	Узбекистан, Ташкент, Учтепинский район, махалля Бирлик	279
225	41.2930500000000009	69.2120029999999957	Узбекистан, Ташкент, улица Катартал, 60	280
226	41.3386509999999987	69.369694999999993	Узбекистан, Ташкент, Мирзо-Улугбекский район, массив Карасу, 1-й квартал, 1А	281
227	41.3117700000000028	69.192852000000002	Узбекистан, Ташкент, 1-й проезд Маннона Уйгура, 57	282
228	41.3331450000000018	69.344145999999995	Узбекистан, Ташкент, улица Зайтун, 5	286
229	41.3579730000000012	69.324631999999994	Узбекистан, Ташкент, 3-й проезд Богистон, 2	287
230	41.3253789999999981	69.3287100000000009	Узбекистан, Ташкент, Кибрайская улица, 7Б	288
231	41.3668869999999984	69.3147529999999961	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 18-й квартал, 31	290
232	41.3545879999999997	69.3587619999999987	Узбекистан, Ташкент, Военный городок	127
233	41.3631839999999968	69.1793940000000021	Узбекистан, Ташкент, Олмазорский район, массив Шифокорлар Шахарчаси, 7	291
234	41.2810470000000009	69.2025759999999934	Узбекистан, Ташкент, улица Катартал, 28	292
235	41.2661870000000022	69.1531329999999969	Узбекистан, Ташкент, Учтепинский район, массив Чиланзар, 31-й квартал, 52	294
236	41.300023000000003	69.2860770000000059	Узбекистан, Ташкент, Мирабадский район, махалля Мовароуннахр	295
237	41.3632429999999971	69.179428999999999	Узбекистан, Ташкент, Олмазорский район, массив Шифокорлар Шахарчаси, 7	296
238	41.3301269999999974	69.1775180000000063	Узбекистан, Ташкент, Шайхантахурский район, махалля Ипакчи	297
239	41.3388589999999994	69.215012999999999	Узбекистан, Ташкент, Шайхантахурский район, массив Бируни-3, блокГ	298
240	41.3200360000000018	69.2587249999999983	Узбекистан, Ташкент, улица Алишера Навои, 19	299
241	41.3200569999999985	69.2587139999999977	Узбекистан, Ташкент, улица Алишера Навои, 19	300
242	41.2968570000000028	69.2874769999999955	Узбекистан, Ташкент, Мирабадский район, махалля Салор	301
243	41.2521020000000007	69.3090140000000048	Узбекистан, Ташкент, Мирабадский район, массив Куйлюк, 3-й квартал, 27	302
244	41.2848499999999987	69.2051079999999956	Узбекистан, Ташкент, Чиланзарский район, массив Чиланзар, квартал Ц, 1	303
245	41.3184139999999971	69.3205569999999938	Узбекистан, Ташкент, улица Мирзо Улугбека, 27	304
246	41.2283510000000035	69.3304080000000056	Узбекистан, Ташкент, Бектемирский район, массив Олима Оширова, 19А	306
248	41.3694550000000021	69.2863459999999947	Узбекистан, Ташкент, проспект Амира Темура	308
249	41.3440829999999977	69.2501479999999958	Узбекистан, Ташкент, Олмазорский район, махалля Хончорбог, улица Мевазар, 3	309
250	41.3588799999999992	69.2137460000000004	Узбекистан, Ташкент, Олмазорский район, массив Каракамыш, квартал 2/5, 16	311
251	41.2735580000000013	69.1957120000000003	Узбекистан, Ташкент, Чиланзарский район, махалля Ботирма	313
253	41.3104069999999979	69.2394620000000032	Узбекистан, Ташкент, Шайхантахурский район, махалля Янги Камолон	316
254	41.248700999999997	69.3036960000000022	Узбекистан, Ташкент, Мирабадский район, массив Куйлюк, 4-й квартал, 48	317
256	41.248700999999997	69.3036960000000022	Узбекистан, Ташкент, Мирабадский район, массив Куйлюк, 4-й квартал, 48	319
257	41.2418249999999986	69.3344409999999982	Узбекистан, Ташкент, Яшнободский район, массив Куйлюк-Центр, 10В	320
258	41.2976639999999975	69.2861350000000016	Узбекистан, Ташкент, Мирабадский район, махалля Мовароуннахр	321
259	41.2713930000000033	69.1536909999999949	Узбекистан, Ташкент, улица Курилиш, 84	322
261	41.3102019999999968	69.3405920000000009	Узбекистан, Ташкент, улица Карнок, 15	324
262	41.3238720000000015	69.3719410000000067	Узбекистан, Ташкентская область, Кибрайский район, населённый пункт Гульзар, улица Сохибкиран	325
1	41.3344469999999973	69.2841760000000022	Узбекистан, Ташкент, проспект Амира Темура, 99	1
265	41.248700999999997	69.3036960000000022	Узбекистан, Ташкент, Мирабадский район, массив Куйлюк, 4-й квартал, 48	329
266	41.2568320000000028	69.1615500000000054	Узбекистан, Ташкент, 3-й проезд Заргарлик, 71	331
267	41.3086219999999997	69.2897200000000026	Узбекистан, Ташкент, улица Яхъё Гулямова, 69	332
268	41.3172640000000015	69.2865970000000004	Узбекистан, Ташкент, Мирзо-Улугбекский район, массив Олой, 15	333
269	41.3051650000000024	69.2580219999999969	Узбекистан, Ташкент, улица Юнуса Раджаби, 66/3	307
270	41.3045159999999996	69.2350409999999954	Узбекистан, Ташкент, проспект Бунёдкор (дублёр)	334
271	41.2931979999999967	69.201469000000003	Узбекистан, Ташкент, Чиланзарский район, массив Чиланзар, 8-й квартал, 44	335
272	41.3254019999999969	69.3334109999999981	Узбекистан, Ташкент, Кибрайская улица, 55	336
273	41.2566029999999984	69.1421119999999974	Узбекистан, Ташкентская область, Зангиатинский район, городской посёлок Эшангузар, махалля Уратепа	338
274	41.3424970000000016	69.2687169999999952	Узбекистан, Ташкент, улица Турккургон, 32	339
275	41.3246930000000035	69.3428049999999985	Узбекистан, Ташкент, улица Олчабог, 122	341
276	41.4268819999999991	69.1831930000000028	Узбекистан, Ташкентская область, Ташкентский район, населённый пункт Хиёбон	343
277	41.2715460000000007	69.1535480000000007	Узбекистан, Ташкент, улица Курилиш, 80	323
278	41.3295730000000034	69.2815279999999944	Узбекистан, Ташкент, Юнусабадский район, массив Минор, 121	344
279	41.2760450000000034	69.1690219999999982	Узбекистан, Ташкент, Учтепинский район, массив Чиланзар, 25-й квартал, 35	345
280	41.2951929999999976	69.2771819999999963	Узбекистан, Ташкент, улица Айбека	346
282	41.2839529999999968	69.2034960000000012	Узбекистан, Ташкент, Чиланзарский район, махалля Навбахор	349
283	41.3553360000000012	69.2194499999999948	Узбекистан, Ташкент, улица Шифонур	348
284	41.3605189999999965	69.3674780000000055	Узбекистан, Ташкент, улица Феруза	350
285	41.3503159999999994	69.2881349999999969	Узбекистан, Ташкент, Юнусабадский район, махалля Отчопар-1	351
286	41.2959620000000029	69.1936469999999986	Узбекистан, Ташкент, Учтепинский район, массив Чиланзар, 14-й квартал, 14	353
287	41.3196980000000025	69.2407469999999989	Узбекистан, Ташкент, Шайхантахурский район, массив Караташ, 8А	354
288	41.2568399999999968	69.1423470000000009	Узбекистан, Ташкентская область, Зангиатинский район, городской посёлок Эшангузар, махалля Уратепа	355
289	41.3633999999999986	69.2657059999999944	Узбекистан, Ташкент, Юнусабадский район, махалля Гайратий	356
290	41.2460840000000033	69.2025950000000023	Узбекистан, Ташкент, улица Терсакабад	357
291	41.2460840000000033	69.2025950000000023	Узбекистан, Ташкент, улица Терсакабад	358
292	41.3669670000000025	69.2932229999999976	Узбекистан, Ташкент, Юнусабадский район, махалля Янгибог	359
293	41.2601310000000012	69.1988850000000042	Узбекистан, Ташкент, улица Наккашлык, 90	360
294	41.2958089999999984	69.2800340000000006	Узбекистан, Ташкент, улица Саида Барака	361
295	41.2996949999999998	69.2040930000000003	Узбекистан, Ташкент, Чиланзарский район, жилой комплекс Oq-Tepa sohil bo'yi	362
296	41.2777999999999992	69.2703259999999972	Узбекистан, Ташкент, улица Кичик Бешагач, 130	363
298	41.3039429999999967	69.2577339999999992	Узбекистан, Ташкент, Яккасарайский район, махалля Юнус Раджаби	366
299	41.3669060000000002	69.2930920000000015	Узбекистан, Ташкент, Юнусабадский район, махалля Янгибог	367
300	41.2200309999999988	69.2037289999999956	Узбекистан, Ташкент, Янгихаётский район, массив Сергели-IIIа	365
301	41.2927490000000006	69.2613429999999966	Узбекистан, Ташкент, улица Богидил	368
302	41.3721239999999995	69.2930170000000061	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 11-й квартал, 56	369
303	41.2706919999999968	69.1542069999999995	Узбекистан, Ташкент, Учтепинский район, махалля Катта-Каъни	370
304	41.3053600000000003	69.2898449999999997	Узбекистан, Ташкент, улица Садыка Азимова	371
305	41.3056219999999996	69.2894869999999941	Узбекистан, Ташкент, улица Садыка Азимова, 54	372
306	41.3029480000000007	69.1203450000000004	Узбекистан, Ташкентская область, 4Р253	373
307	41.3028759999999977	69.1203490000000045	Узбекистан, Ташкентская область, 4Р253	374
308	41.339891999999999	69.1693070000000034	Узбекистан, Ташкент, улица Бельтепа	376
14	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	39
3	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	8
4	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	10
5	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	12
15	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	41
7	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	14
16	41.3629140000000035	69.2834689999999966	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 4-й квартал, 4Б	49
17	41.3629140000000035	69.2834689999999966	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 4-й квартал, 4Б	50
18	41.3629140000000035	69.2834689999999966	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 4-й квартал, 4Б	52
8	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	17
9	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	18
10	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	20
11	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	22
255	41.3930719999999965	69.1920080000000013	Узбекистан, Ташкентская область, Ташкентский район, Айрикуйлак, 8-й проезд Юкори Минг Урик	318
12	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	25
263	41.3930849999999992	69.1919690000000003	Узбекистан, Ташкентская область, Ташкентский район, Айрикуйлак, 8-й проезд Юкори Минг Урик	326
13	41.3669829999999976	69.2628639999999933	Узбекистан, Ташкент, Юнусабадский район, массив Юнусабад, 6-й квартал, 19	26
\.


--
-- Data for Name: notification_chats; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.notification_chats (chat_id, chat_title) FROM stdin;
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.order_items (id, order_id, dish_id, count) FROM stdin;
2	2	10	1
3	2	4	1
4	3	2	5
12	9	8	5
16	13	8	8
19	15	54	9
25	21	7	2
27	23	8	2
28	23	44	5
29	24	45	2
30	24	42	5
33	5	18	1
34	5	34	1
35	5	42	5
36	5	33	1
40	27	34	5
41	27	44	6
42	27	50	8
46	29	44	5
47	29	20	5
48	29	2	8
49	29	6	8
50	30	34	2
51	30	44	2
52	30	53	3
53	31	45	1
54	31	34	2
55	31	50	7
56	32	45	2
57	32	38	4
58	32	54	8
59	33	41	5
60	33	45	6
61	33	50	8
72	37	39	6
73	37	44	9
74	37	34	5
87	40	45	6
88	40	38	6
89	40	50	5
101	43	45	5
102	43	36	6
103	43	50	1
104	44	45	4
105	44	53	3
106	44	34	8
110	46	34	7
111	46	42	2
112	46	52	1
113	46	43	2
114	46	39	1
142	54	1	2
143	54	2	5
144	54	84	2
168	55	82	5
169	56	34	3
170	56	95	5
171	57	34	5
172	57	1	2
173	57	69	4
174	57	98	6
175	58	78	2
176	53	39	2
187	63	1	1
188	64	1	1
189	65	78	1
190	65	1	1
191	66	1	1
192	66	75	1
193	67	1	1
194	68	81	1
195	68	59	1
196	68	1	1
197	69	56	1
198	69	90	1
199	69	1	1
200	69	6	1
201	70	1	1
202	70	69	1
204	72	75	1
205	71	1	1
206	73	1	1
207	74	1	1
210	76	34	1
211	76	72	1
212	75	1	1
213	75	2	1
214	75	70	1
215	77	1	2
216	78	1	2
217	79	1	1
218	79	2	1
219	80	2	1
220	80	90	1
221	81	32	1
222	82	32	9
224	84	59	1
225	84	93	1
226	84	2	1
227	85	90	1
228	86	35	1
229	87	34	3
230	87	2	1
232	89	53	2
233	90	2	1
234	90	1	1
235	91	1	1
236	88	38	1
237	88	2	1
238	92	1	1
239	92	78	1
240	93	90	1
241	94	87	1
242	94	57	1
243	95	45	1
244	95	35	1
245	96	81	1
246	97	1	2
247	98	46	1
248	98	38	1
249	98	2	1
250	99	1	1
251	100	1	1
252	100	53	1
253	101	2	1
254	101	85	1
255	101	35	1
256	102	1	1
257	102	2	1
258	103	93	1
259	103	99	2
260	104	1	1
261	104	2	1
262	105	56	1
263	105	2	1
265	107	1	1
266	107	58	1
268	109	84	4
269	109	61	1
270	110	60	5
271	110	4	1
272	110	68	1
273	110	2	1
276	112	56	1
277	111	6	1
278	113	97	1
279	114	34	1
280	115	78	1
281	115	1	1
282	116	59	1
283	116	5	1
284	116	68	1
285	117	1	1
286	118	90	1
287	119	50	1
288	119	32	1
289	119	2	1
290	119	70	1
298	122	56	1
299	121	3	2
300	121	7	2
301	121	69	5
302	121	56	2
303	121	90	2
304	121	5	1
305	123	93	1
306	123	42	1
307	123	1	1
308	124	2	2
309	125	53	1
310	125	7	1
311	126	59	2
313	128	56	1
314	128	35	1
316	130	59	1
317	130	85	1
318	129	1	1
319	129	50	1
320	129	56	1
321	129	87	1
322	129	80	1
323	131	50	1
324	131	56	1
325	131	87	1
326	131	80	1
327	132	2	1
328	132	53	1
329	133	2	1
330	133	79	1
331	133	5	2
332	134	3	1
335	136	90	1
336	136	1	1
337	137	93	1
338	138	93	1
339	106	1	1
340	106	2	1
341	106	60	1
342	139	2	1
343	140	1	1
344	141	94	1
345	120	95	1
346	120	92	1
347	142	44	1
349	143	1	1
350	144	59	1
351	135	98	1
352	145	53	1
353	145	3	1
354	146	1	2
355	147	1	1
356	148	54	1
357	148	72	1
358	148	1	1
359	149	32	1
360	149	1	1
361	150	98	1
362	151	2	1
363	152	1	2
365	154	90	1
366	154	38	1
367	155	1	2
368	156	91	1
369	156	55	1
370	157	1	1
371	157	84	1
372	158	1	2
373	158	2	1
376	160	56	1
377	160	35	1
378	160	93	1
379	160	99	1
380	160	70	1
381	160	98	1
382	161	54	1
384	162	56	1
385	163	1	1
386	163	56	1
387	163	2	1
388	164	56	2
389	159	1	1
390	159	97	1
391	159	2	1
392	165	53	1
393	166	2	2
394	166	87	1
395	167	7	1
396	168	75	2
397	168	1	2
398	168	97	2
399	169	90	2
400	169	1	1
403	170	72	2
404	170	2	2
405	153	1	1
406	171	70	1
408	172	68	1
409	173	56	1
410	174	1	1
411	175	34	1
412	176	1	2
413	176	50	1
415	177	68	1
416	178	68	1
417	179	68	1
418	180	1	1
419	180	75	1
420	181	68	1
421	182	56	4
422	183	56	4
423	184	59	1
424	185	72	1
425	185	84	2
426	185	75	1
427	186	1	4
428	187	78	1
429	187	69	1
430	187	4	1
431	188	1	1
432	189	1	1
433	190	34	2
434	191	75	1
435	191	34	2
436	192	56	1
437	192	93	2
438	193	1	1
439	194	68	1
440	195	68	1
441	195	33	1
442	108	1	1
443	196	1	2
444	197	1	2
445	197	5	4
446	198	2	1
447	198	1	1
448	198	32	1
449	199	1	1
450	199	70	1
451	199	63	1
452	199	56	1
453	199	69	1
454	200	4	1
455	201	72	1
457	203	6	1
458	203	70	1
459	202	1	2
460	204	35	1
461	205	35	1
462	206	56	1
463	206	90	1
464	206	5	1
465	206	1	1
466	207	2	1
467	207	90	1
468	207	56	1
469	208	1	3
470	209	84	1
471	209	1	1
472	210	35	1
473	211	90	1
474	211	35	1
475	212	1	1
476	213	1	1
477	214	1	2
478	215	59	1
479	215	5	1
480	215	68	1
482	217	2	1
483	217	1	1
484	218	1	2
485	219	59	1
486	220	84	1
487	220	44	1
488	221	1	2
489	221	44	1
490	222	1	1
491	222	34	1
492	222	72	1
493	223	1	1
498	225	44	1
499	224	93	1
500	224	96	1
501	224	56	1
502	224	34	1
503	226	2	1
504	226	38	1
505	227	1	1
506	227	56	1
507	228	90	2
508	229	53	1
509	229	90	1
510	229	4	1
511	216	72	1
512	230	32	1
513	230	59	1
514	231	35	1
515	231	81	1
516	51	68	1
517	51	82	3
518	232	1	2
519	233	1	2
520	233	33	1
522	235	56	2
523	235	90	2
524	235	1	2
525	236	34	1
526	236	4	2
527	236	5	2
528	236	3	2
529	236	6	2
531	238	1	1
532	239	1	2
533	239	72	2
534	240	35	2
535	240	71	2
536	241	56	2
537	241	1	2
538	242	2	1
539	242	68	1
540	243	75	1
541	243	44	1
542	243	97	1
543	243	78	1
544	237	1	1
545	237	69	1
546	244	2	1
547	245	1	1
548	246	38	2
549	246	97	2
550	247	32	1
551	247	59	1
552	248	1	1
553	248	32	1
554	248	56	1
555	248	35	1
556	249	33	1
557	249	59	1
558	249	1	1
559	250	1	2
560	250	56	1
561	250	84	1
562	251	1	2
563	252	1	5
564	252	3	2
565	252	4	3
566	252	93	5
567	253	90	1
568	253	1	1
569	254	34	1
570	254	72	1
571	254	3	1
572	254	5	1
573	254	4	1
574	255	1	2
575	256	97	1
576	256	56	1
577	257	1	1
578	257	69	1
579	258	1	1
580	259	1	3
581	260	1	1
582	261	1	1
583	262	93	1
584	262	59	1
585	263	1	2
586	264	2	1
587	264	1	1
588	265	1	2
589	265	71	1
590	265	68	1
591	266	93	1
592	266	1	1
593	266	68	2
594	267	32	1
595	268	56	2
596	268	90	1
597	269	84	1
598	269	1	1
599	270	1	1
600	271	53	6
603	273	44	1
604	273	4	2
605	273	68	1
606	274	1	2
607	275	7	1
608	275	3	1
610	276	1	1
611	277	1	1
612	278	50	1
613	278	59	1
614	278	1	1
615	279	1	1
616	234	1	1
617	280	59	1
618	281	2	1
619	281	1	1
620	282	56	2
621	283	34	2
622	284	1	2
623	285	90	4
624	286	34	1
625	286	72	1
626	287	38	1
627	288	56	2
628	288	69	2
629	288	72	2
630	289	87	1
631	289	34	1
632	83	81	5
633	290	1	1
634	127	35	1
635	291	1	1
636	291	90	1
637	292	1	1
638	292	59	1
639	293	2	6
640	294	58	1
641	294	56	1
642	295	1	1
643	296	50	1
644	296	90	1
645	296	1	1
646	297	32	1
647	297	1	1
648	297	6	1
649	297	69	1
650	298	1	2
651	299	70	1
652	299	7	1
653	300	6	1
654	301	1	1
655	302	93	1
656	303	1	1
657	304	1	1
658	304	97	1
659	305	34	1
660	306	38	1
663	308	59	1
664	308	93	1
665	309	56	1
666	309	93	1
667	310	63	1
668	311	44	2
669	312	1	2
670	313	50	1
671	314	93	2
672	315	35	1
673	316	1	1
674	316	2	1
675	317	1	2
676	317	69	1
677	317	71	1
678	318	1	1
679	319	1	2
680	319	69	1
681	319	71	1
682	320	90	1
683	320	1	1
684	320	5	1
685	321	1	1
686	321	90	1
687	322	50	1
689	324	56	1
690	324	38	1
691	324	87	1
692	325	1	1
693	326	1	1
696	328	90	2
697	329	1	2
698	329	69	1
699	329	71	1
700	330	1	1
701	330	84	2
702	331	84	2
703	331	1	1
704	332	72	1
705	332	1	1
706	333	2	1
707	333	1	1
708	307	87	1
709	334	87	1
710	335	1	1
711	336	44	1
712	337	1	1
713	337	35	1
714	338	75	1
715	338	90	1
716	338	1	1
717	339	90	2
718	340	1	1
719	341	56	1
720	341	93	1
721	342	1	2
722	343	2	8
723	343	81	6
724	343	84	1
725	323	56	1
726	344	1	2
727	345	59	1
728	346	7	2
729	346	34	3
730	347	66	2
735	349	56	1
736	349	90	1
737	349	1	1
738	348	1	1
739	348	2	1
740	348	75	1
741	348	59	1
742	350	5	1
743	350	44	1
744	350	71	1
745	350	69	1
746	351	1	1
747	352	72	1
748	352	1	1
749	353	1	1
750	354	1	2
751	355	34	2
752	355	78	2
753	355	2	2
754	356	33	1
755	356	1	1
756	357	1	1
757	358	69	1
758	359	44	1
759	359	35	1
760	359	84	1
761	272	2	1
762	360	2	1
763	361	34	1
764	362	1	2
765	362	69	2
766	363	69	1
767	363	59	1
772	366	81	1
773	366	1	1
774	366	44	1
775	367	62	1
776	367	93	1
777	367	35	1
778	367	69	1
779	367	70	1
780	365	1	1
781	365	2	1
782	365	44	1
783	368	35	1
784	368	72	1
785	369	1	1
786	369	84	1
788	370	59	1
789	370	97	1
790	370	70	2
791	371	72	1
792	372	34	1
793	373	3	1
794	373	4	1
795	373	5	1
796	373	38	1
797	373	35	1
798	373	68	1
799	373	69	1
800	373	71	1
801	373	1	1
802	374	84	1
803	375	1	1
804	376	1	2
1	1	34	5
8	8	93	6
9	8	59	6
10	8	44	5
11	10	87	5
13	12	53	2
15	14	38	5
17	17	7	5
18	18	72	6
20	20	44	5
21	22	53	5
22	25	7	2
23	26	38	5
31	39	33	6
32	41	7	9
37	49	7	5
38	50	81	2
39	52	59	2
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.orders (id, user_id, user_name, shipping_method, payment_method, address_txt, phone_number, confirmed, confirmation_date, delivery_price, total_amount) FROM stdin;
2	518109259	Анвар	delivery	cash	\N	998909272673	t	2020-08-01 10:33:50.162447	\N	56000
3	64925540	Владимир	delivery	cash	Шайхонтахур	+998935856774	t	2020-08-01 10:55:56.495141	\N	240000
5	518109259	Анвар	delivery	cash	\N	998909272673	t	2020-08-02 15:29:07.877419	\N	291000
9	64925540	Владимир	delivery	cash	Шайхонтахур	+998935856774	t	2020-08-02 14:28:54.830991	\N	125000
13	64925540	Владимир	delivery	cash	шайхонтахур, казирабад, дом 4	+998935856774	t	2020-08-02 14:39:27.691258	\N	200000
15	64925540	Владимир	delivery	cash	шайхонтахур	+998935856774	t	2020-08-02 14:44:07.945698	\N	297000
21	64925540	Владимир	delivery	cash	локая	+998935856774	t	2020-08-02 15:14:19.685873	\N	48000
23	64925540	Владимир	delivery	cash	Шайхонтахур	+998935856774	t	2020-08-02 15:21:38.076066	\N	240000
24	64925540	Владимир	delivery	cash	Шайхонтахур	+998935856774	t	2020-08-02 15:23:14.42235	\N	266000
27	64925540	Владимир	delivery	cash	моя локация	+998935856774	t	2020-08-02 15:33:41.084263	\N	632000
29	64925540	Владимир	delivery	cash	Шайхонтахур	+998935856774	t	2020-08-02 15:38:29.195785	\N	886000
30	518109259	Анвар	delivery	cash	\N	998909272673	t	2020-08-02 15:39:33.376142	\N	231000
31	64925540	Владимир	delivery	cash	шайхонтахур	+998935856774	t	2020-08-02 15:48:36.374308	\N	325000
32	64925540	Владимир	delivery	cash	ш	+998935856774	t	2020-08-02 15:58:48.788172	\N	452000
33	64925540	Владимир	delivery	cash	ш	+998935856774	t	2020-08-02 16:01:39.444513	\N	682000
37	64925540	Владимир	delivery	cash	ш	+998935856774	t	2020-08-02 16:15:23.586748	\N	650000
40	64925540	Владимир	delivery	cash	ш	+998935856774	t	2020-08-02 16:41:30.406029	\N	561000
43	64925540	Владимир	delivery	cash	ш	+998935856774	t	2020-08-02 17:01:43.57509	\N	391000
44	64925540	Владимир	delivery	cash	\N	+998935856774	t	2020-08-02 17:02:30.817455	\N	475000
46	518109259	Анвар	delivery	cash	\N	998909272673	t	2020-08-02 17:05:39.654859	\N	409000
51	202624021	\N	delivery	\N	\N	\N	f	\N	\N	\N
53	816743	Dg	delivery	cash	Test	998901001616	t	2020-08-05 16:06:10.147754	\N	58000
54	64925540	Владимир	delivery	cash	Шайхонтахур	+998935856774	t	2020-08-05 14:48:00.951128	\N	400000
55	64925540	Владимир	delivery	cash	привет	+998935856774	t	2020-08-05 15:05:41.675781	\N	190000
56	102570577	Zoir	delivery	cash	\N	998977231618	t	2020-08-05 15:23:39.525617	\N	292000
57	518109259	Анвар	delivery	cash	\N	998909272673	t	2020-08-05 15:35:43.374616	\N	457000
58	64925540	Владимир	delivery	cash	\N	+998935856774	t	2020-08-05 16:04:07.578981	\N	76000
63	888860	\N	delivery	\N	\N	\N	f	\N	\N	\N
64	697481	Feruza	delivery	cash	\N	998946805333	t	2020-08-08 15:57:27.480086	\N	52000
65	495508670	Mushtariy	delivery	cash	\N	998909460087	t	2020-08-08 16:39:56.767915	\N	90000
66	1047062152	Xadicha	delivery	cash	Komolon mahalla Xabibi kocha 16 uy	998946754447	t	2020-08-09 08:23:25.613168	\N	80000
67	480558355	+998907888656	delivery	cash	\N	+998907888656	t	2020-08-09 09:10:22.463945	\N	52000
68	635083348	Feride	delivery	cash	\N	998993227544	t	2020-08-09 10:34:21.242816	\N	132000
69	434675053	Sitora Shaxobiddinova	delivery	cash	\N	998907888552	t	2020-08-09 10:46:19.663374	\N	159000
70	883393724	Komola	delivery	cash	\N	998935719955	t	2020-08-09 11:52:17.127069	\N	77000
71	1025714550	Noila	delivery	cash	Sergeli sputnik 3 46-8kv	998909282958	t	2020-08-09 12:50:48.575428	\N	52000
72	830522641	\N	delivery	\N	\N	\N	f	\N	\N	\N
73	732088389	\N	delivery	cash	\N	998998548873	f	\N	\N	\N
74	33826188	\N	delivery	payme	\N	998909556805	f	\N	\N	\N
75	631766780	Nazokat	delivery	cash	\N	998909962562	t	2020-08-09 14:09:50.326189	\N	123000
76	450791988	Mohira	delivery	cash	\N	998903516997	t	2020-08-09 13:55:13.778343	\N	57000
77	853524041	Мирсадулла	delivery	payme	\N	998998109333	t	2020-08-09 16:28:00.082551	\N	104000
78	541997393	Egamberdiyeva Mohira	delivery	payme	\N	998998390968	t	2020-08-09 16:51:51.136402	\N	104000
79	783851934	Dinara	delivery	cash	\N	998909955909	t	2020-08-09 19:33:47.72801	\N	98000
80	321654067	\N	delivery	\N	Мирзо улугбекский район Ялангач 69 кв25	\N	f	\N	\N	\N
81	1170067137	\N	delivery	cash	\N	998909352288	f	\N	\N	\N
82	875154984	\N	delivery	\N	\N	\N	f	\N	\N	\N
83	64925540	\N	delivery	\N	\N	+998935856774	f	\N	\N	\N
84	162099531	Akbar	delivery	payme	\N	998909717978	t	2020-08-10 07:36:23.784007	\N	129000
85	665298910	\N	delivery	payme	\N	998990275840	f	\N	\N	\N
86	728577333	\N	delivery	cash	\N	998937042407	f	\N	\N	\N
87	702261039	Madina	delivery	cash	\N	998977094000	t	2020-08-10 10:28:41.604708	\N	133000
88	249576911	Шахзод	delivery	payme	\N	998977350384	t	2020-08-10 11:25:10.922735	\N	75000
89	631270439	Elyor	delivery	cash	\N	998974071234	t	2020-08-10 10:40:47.056678	\N	68000
90	277458432	\N	delivery	payme	\N	998903538151	f	\N	\N	\N
91	635083348	Feride	delivery	cash	\N	998993227544	t	2020-08-10 10:48:42.451881	\N	52000
92	677139217	Yulduz	delivery	cash	\N	998930039999	t	2020-08-10 11:55:24.20858	\N	90000
93	998436613	Xusan	delivery	cash	Arintir oxun boboyev	998946145614	t	2020-08-10 13:19:36.648502	\N	41000
94	456547805	Юлия	delivery	cash	\N	998909593993	t	2020-08-10 14:26:59.770841	\N	75000
95	1342062712	Farangiz	delivery	cash	Yunusoboda 19 31 81	+998974250889	t	2020-08-10 14:34:59.078501	\N	85000
96	109299250	Шахризода	delivery	payme	Матбуотчилар, 32\\nПойтахт ТРЦ капитал банк	998909654962	t	2020-08-10 15:12:58.111983	\N	38000
97	1013688936	sher	delivery	cash	\N	998990013116	t	2020-08-10 15:17:08.612048	\N	104000
98	51854	Ibrohim	delivery	cash	Нурафшон 22 уй	998998213333	t	2020-08-10 15:46:39.588957	\N	114000
99	577092273	Лола	delivery	cash	\N	998998688869	t	2020-08-10 16:54:26.81054	\N	52000
100	2215132	Малика	delivery	payme	\N	998911912867	t	2020-08-11 06:22:34.906039	\N	86000
101	417500559	Ленара	delivery	cash	\N	+998974709403	t	2020-08-11 06:19:13.880695	\N	125000
102	1067308982	Gulnoza	delivery	payme	\N	998900112121	t	2020-08-11 06:49:13.634292	\N	98000
103	38033923	Мохира	delivery	payme	\N	998935782132	t	2020-08-11 07:11:03.658583	\N	77000
104	1067308982	Gulnoza	delivery	cash	\N	998900112121	t	2020-08-11 07:35:30.783997	\N	98000
105	967156349	Shahzoda	delivery	cash	\N	998935680214	t	2020-08-11 07:44:35.601361	\N	88000
106	967156349	Shahzoda	delivery	cash	\N	998935680214	t	2020-08-13 16:41:38.46629	\N	140000
107	326694372	\N	delivery	\N	\N	\N	f	\N	\N	\N
108	201458407	\N	delivery	\N	\N	+998909000000	f	\N	\N	\N
109	1044472599	Юлдуз	delivery	cash	\N	+998935408017	t	2020-08-11 09:58:14.595704	\N	174000
110	633288098	\N	delivery	payme	\N	998974009909	f	\N	\N	\N
111	1010290310	Zebuniso	delivery	cash	\N	998978578787	t	2020-08-11 13:53:51.744027	\N	24000
112	185170494	\N	delivery	payme	\N	998977544002	f	\N	\N	\N
113	1010290310	Zebuniso	delivery	cash	\N	998978578787	t	2020-08-11 13:56:22.463153	\N	33000
114	735995	Dilovar	delivery	cash	\N	998909995674	t	2020-08-12 06:11:52.845718	\N	29000
115	677139217	Yulduz	delivery	cash	\N	998930039999	t	2020-08-11 17:20:29.563191	\N	90000
116	1057308049	Madina	delivery	cash	\N	998973334368	t	2020-08-11 18:25:26.112801	\N	89000
117	677139217	Yulduz	delivery	cash	\N	998930039999	t	2020-08-12 06:07:57.293662	\N	52000
118	1024387462	Baron	delivery	cash	\N	998977211010	t	2020-08-12 06:14:00.326343	\N	41000
119	842738606	\N	delivery	cash	\N	998935076925	f	\N	\N	\N
120	674437582	\N	delivery	cash	\N	+998903562831	f	\N	\N	\N
121	474394698	Kamola	delivery	cash	\N	998998147727	t	2020-08-12 07:26:57.955833	\N	428000
122	639336999	\N	delivery	\N	\N	\N	f	\N	\N	\N
123	1034076869	Abduhamid	delivery	cash	Qatortol parus	998977911999	t	2020-08-12 08:05:06.146364	\N	132000
124	51854	Ibrohim	delivery	cash	\N	998998213333	t	2020-08-12 08:11:09.068265	\N	92000
125	1342062712	Farangiz	delivery	cash	\N	+998999211990	t	2020-08-12 10:14:34.334625	\N	58000
126	806862192	Бахром	delivery	cash	\N	+998935155835	t	2020-08-12 12:42:35.983742	\N	84000
127	776576315	\N	delivery	payme	\N	998911924404	f	\N	\N	\N
128	56222324	Shohruh	delivery	cash	\N	998913304004	t	2020-08-12 15:56:19.98228	\N	88000
129	528110896	\N	delivery	cash	\N	998933947788	f	\N	\N	\N
130	985851871	Madina	delivery	cash	\N	998998841402	t	2020-08-13 05:23:37.857632	\N	75000
131	1993055	Barno	delivery	cash	\N	998935021188	t	2020-08-13 06:47:01.312293	\N	147000
132	994383088	Nurilloh	delivery	cash	\N	+998974443490	t	2020-08-13 07:52:05.694778	\N	80000
133	1199303	Валерия	delivery	cash	\N	998935444346	t	2020-08-13 09:24:39.85488	\N	138000
134	1199303	Валерия	delivery	cash	\N	998935444346	t	2020-08-13 10:02:40.270749	\N	31000
135	735995	Dilovar	delivery	payme	\N	998909995674	t	2020-08-14 12:29:20.680748	\N	18000
136	1035376208	Farangiz	delivery	cash	\N	998994814095	t	2020-08-13 11:43:14.897572	\N	93000
137	805112552	Mehribon	delivery	cash	\N	998941255552	t	2020-08-13 12:00:05.110213	\N	41000
138	879926986	\N	delivery	\N	\N	\N	f	\N	\N	\N
139	44455601	Ravshanjon	delivery	cash	\N	998974111989	t	2020-08-13 16:42:41.85935	\N	46000
140	44455601	Ravshanjon	delivery	cash	\N	998974111989	t	2020-08-13 16:44:10.624372	\N	52000
141	686636762	991111779	delivery	cash	\N	998991111779	t	2020-08-14 05:56:31.521209	\N	41000
142	853545025	\N	delivery	\N	\N	\N	f	\N	\N	\N
143	892771117	+998931727544	delivery	payme	\N	998931727544	t	2020-08-14 12:09:50.941368	\N	52000
144	692829189	Nilufar	delivery	cash	\N	998909462175	t	2020-08-14 12:30:42.6612	\N	42000
145	1394764430	Islom	delivery	cash	\N	998900375155	t	2020-08-14 15:17:54.389924	\N	65000
146	311304724	Robiya	delivery	cash	\N	998909980502	t	2020-08-15 06:05:44.391002	\N	104000
147	1129346981	Сабина	delivery	cash	\N	998977318224	t	2020-08-15 06:52:13.203598	\N	52000
148	780884856	Marhabo	delivery	cash	\N	998974073128	t	2020-08-15 09:48:45.175434	\N	114000
149	2954263	\N	delivery	\N	\N	\N	f	\N	\N	\N
150	735995	Dilovar	delivery	payme	\N	998909995674	t	2020-08-15 10:50:57.453345	\N	18000
151	106604584	Hojiakbar	delivery	cash	\N	998946239699	t	2020-08-15 11:55:51.233626	\N	46000
152	1038255611	Ислом	delivery	cash	\N	998974010204	t	2020-08-15 12:31:56.796206	\N	104000
153	76777495	Дмитрий	delivery	payme	\N	998909879930	t	2020-08-18 16:22:53.114888	\N	52000
154	985851871	Madina	delivery	cash	\N	998998841402	t	2020-08-15 13:44:34.032767	\N	70000
155	222470719	Nigora	delivery	cash	\N	998977600030	t	2020-08-15 14:29:06.733734	\N	104000
156	1064406105	\N	delivery	cash	\N	\N	f	\N	\N	\N
157	495508670	Mushtariy	delivery	cash	\N	998909460087	t	2020-08-15 17:04:00.998401	\N	85000
158	51854	Ibrohim	delivery	cash	\N	998998213333	t	2020-08-15 18:33:52.127102	\N	150000
159	398191053	Xusnora	delivery	cash	\N	998911663223	t	2020-08-17 14:19:10.494616	\N	131000
160	7322737	Азиз	delivery	cash	\N	998909553519	t	2020-08-16 09:09:11.89241	\N	190000
161	807905068	Севинч	delivery	cash	\N	998935764660	t	2020-08-16 09:27:26.975553	\N	34000
162	237340668	\N	delivery	\N	\N	\N	f	\N	\N	\N
163	785342339	\N	delivery	\N	\N	\N	f	\N	\N	\N
164	508483061	Муниса	delivery	cash	\N	998935576676	t	2020-08-17 13:13:48.495619	\N	84000
165	346621489	\N	delivery	cash	\N	998935409324	f	\N	\N	\N
166	1014372002	Мадина	delivery	cash	\N	998903565412	t	2020-08-18 09:11:37.971591	\N	125000
167	72636478	\N	delivery	cash	\N	998977601103	f	\N	\N	\N
168	461824401	Iroda	delivery	cash	\N	+998935303030	t	2020-08-18 11:13:13.400652	\N	226000
169	222470719	Nigora	delivery	payme	\N	998977600030	t	2020-08-18 14:54:47.05799	\N	134000
170	1358147870	Mubina	delivery	cash	\N	998909157060	t	2020-08-18 16:21:49.580192	\N	148000
171	465632014	\N	delivery	\N	\N	\N	f	\N	\N	\N
172	735995	Dilovar	delivery	payme	\N	998909995674	t	2020-08-19 07:13:14.036249	\N	20000
173	711946568	Iqbola	delivery	cash	\N	998999912725	t	2020-08-19 07:12:58.84119	\N	42000
174	1089781112	Висола	delivery	cash	Yapon bog’i	998904048330	t	2020-08-19 07:59:50.421669	\N	52000
175	659909758	\N	delivery	\N	\N	\N	f	\N	\N	\N
176	720736753	Bahodir	delivery	cash	\N	998901856762	t	2020-08-19 11:19:09.316586	\N	138000
177	735995	Dilovar	delivery	payme	\N	998909995674	t	2020-08-19 13:07:41.388113	\N	20000
178	735995	Dilovar	delivery	payme	\N	998909995674	t	2020-08-19 13:08:53.614325	\N	20000
179	735995	Dilovar	delivery	payme	\N	998909995674	t	2020-08-19 14:36:07.313846	\N	20000
180	559484236	Nilufar	delivery	cash	\N	998977111859	t	2020-08-20 05:52:31.267635	\N	80000
181	735995	Dilovar	delivery	payme	\N	998909995674	t	2020-08-20 05:56:43.542174	\N	20000
182	508483061	Муниса	delivery	cash	Ресторан:Трюфель	998935576676	t	2020-08-20 06:10:54.335184	\N	168000
183	973984579	/start	delivery	payme	\N	998998874911	t	2020-08-20 07:09:42.758631	\N	168000
184	456096813	\N	delivery	\N	\N	\N	f	\N	\N	\N
185	985851871	Madina	delivery	payme	\N	998998841402	t	2020-08-20 10:37:10.932506	\N	122000
186	488987326	\N	delivery	payme	\N	998977111155	f	\N	\N	\N
187	807905068	Севинч	delivery	cash	\N	998935764660	t	2020-08-20 12:26:29.261362	\N	94000
188	742736529	Turg'unova Shahrizoda	delivery	cash	\N	998991012210	t	2020-08-20 15:35:27.243069	\N	52000
189	1192081954	\N	delivery	cash	\N	\N	f	\N	\N	\N
190	374539657	Камола	delivery	cash	\N	998903530018	t	2020-08-21 09:29:59.324911	\N	58000
191	374539657	Камола	delivery	cash	\N	998903530018	t	2020-08-21 09:32:19.787855	\N	86000
192	712076972	Nigina	delivery	cash	\N	998915570100	t	2020-08-21 10:03:23.975006	\N	124000
193	523948893	Õğiloy	delivery	cash	\N	998909331739	t	2020-08-21 10:41:02.55545	\N	52000
194	735995	Dilovar	delivery	payme	\N	998909995674	t	2020-08-21 10:48:03.248437	\N	20000
195	735995	Dilovar	delivery	cash	\N	998909995674	t	2020-08-21 12:44:30.999794	\N	56000
196	1046197926	\N	delivery	cash	\N	998994382299	f	\N	\N	\N
197	130601865	\N	delivery	payme	\N	+998977777716	f	\N	\N	\N
198	51855712	Виктория	delivery	cash	\N	998909512216	t	2020-08-22 13:37:30.068595	\N	164000
199	63914585	Снежана	delivery	cash	\N	998903158242	t	2020-08-22 14:40:12.811503	\N	165000
200	208659570	\N	delivery	\N	\N	\N	f	\N	\N	\N
201	787596435	\N	delivery	\N	\N	\N	f	\N	\N	\N
202	841762185	Komiljon	delivery	cash	\N	998998456911	t	2020-08-23 13:51:46.20986	\N	104000
203	398161966	\N	delivery	\N	\N	\N	f	\N	\N	\N
204	1122741162	nodira	delivery	cash	kish mish kafe	+998998684844	t	2020-08-24 07:02:30.263336	\N	46000
205	115037958	Sharofiddin	delivery	cash	\N	+998994538023	t	2020-08-24 07:03:10.341798	\N	46000
206	937159959	Rahmatillo	delivery	cash	\N	998976902177	t	2020-08-24 12:48:07.618985	\N	162000
207	635083348	Feride	delivery	cash	\N	998993227544	t	2020-08-24 12:51:27.580754	\N	129000
208	853524041	Мирсадулла	delivery	cash	\N	998998109333	t	2020-08-24 14:44:27.440889	\N	156000
209	495508670	Mushtariy	delivery	cash	\N	998909460087	t	2020-08-24 17:07:58.948913	\N	85000
210	999270777	Nilufar	delivery	cash	\N	998990550378	t	2020-08-25 05:36:28.328316	\N	46000
211	304331745	Tölqin	delivery	cash	\N	+998973303434	t	2020-08-25 06:46:10.855909	\N	87000
212	659577046	назокат	delivery	cash	\N	998993050177	t	2020-08-25 11:26:52.819807	\N	\N
213	530406280	Мафтуна	delivery	cash	\N	998971014952	t	2020-08-25 12:10:33.050836	\N	52000
214	723207829	\N	delivery	cash	\N	998946547115	f	\N	\N	\N
215	1057308049	Madina	delivery	cash	\N	998973334368	t	2020-08-25 16:21:21.473876	\N	89000
216	1294618325	\N	delivery	\N	\N	\N	f	\N	\N	\N
217	580327136	\N	delivery	cash	\N	\N	f	\N	\N	\N
218	1066852197	Sardor	delivery	cash	\N	998990008062	t	2020-08-26 08:55:08.03626	\N	104000
219	834171401	Nazosh	delivery	cash	\N	998998851317	t	2020-08-26 09:48:30.918765	\N	42000
220	650797819	\N	delivery	cash	\N	998977126779	f	\N	\N	\N
221	677139217	Yulduz	delivery	cash	улица мустакиллик 6/28	998930039999	t	2020-08-26 13:50:08.889981	\N	143000
222	1623486	Икром	delivery	payme	\N	998977484684	t	2020-08-26 15:28:16.95892	\N	109000
223	1066852197	Sardor	delivery	cash	\N	998990008062	t	2020-08-27 07:42:46.119951	\N	52000
224	332569044	998974459282	delivery	cash	Яккасарайский район братский могила хазинабог 67	998974459282	t	2020-08-27 13:48:27.055472	\N	155000
225	119309130	дадахожаева зилола	delivery	cash	\N	998997205662	t	2020-08-27 13:32:17.721929	\N	39000
226	1207426620	\N	delivery	\N	\N	\N	f	\N	\N	\N
227	222470719	Nigora	delivery	cash	\N	998977600030	t	2020-08-27 14:54:57.549722	\N	94000
228	1065747543	Komola	delivery	cash	\N	998903934474	t	2020-08-27 16:14:35.9914	\N	82000
229	575408119	Elmira	delivery	payme	\N	998998038460	t	2020-08-28 15:38:44.764555	\N	106000
230	623501868	\N	delivery	cash	\N	+998936050000	f	\N	\N	\N
231	1031175996	\N	delivery	\N	🚖 Оформить заказ	\N	f	\N	\N	\N
232	789034008	Holida	delivery	cash	\N	998974458982	t	2020-08-29 15:01:06.007494	\N	104000
233	655138385	Bahodir	delivery	cash	\N	998946902622	t	2020-08-30 08:27:34.482166	\N	140000
234	1386729457	\N	delivery	\N	\N	+998974901002	f	\N	\N	\N
235	497007594	/stop	delivery	cash	\N	998946650099	t	2020-08-30 13:52:05.209334	\N	270000
236	101667102	Шерзод	delivery	payme	\N	998977027777	t	2020-08-30 14:37:56.241532	\N	255000
237	40044213	Ёркиной	delivery	cash	\N	998909750072	t	2020-08-31 11:33:23.144186	\N	77000
238	659696908	Sara	delivery	cash	\N	998909446166	t	2020-08-30 15:59:41.026656	\N	52000
239	63961	Диля	delivery	cash	\N	998977337440	t	2020-08-30 16:37:06.864442	\N	160000
240	63961	Диля	delivery	cash	\N	998977337440	t	2020-08-30 16:38:46.075549	\N	142000
241	373712050	Хумаюн	delivery	cash	\N	998973301212	t	2020-08-30 16:58:10.80445	\N	188000
242	1028288652	shahrizoda	delivery	cash	\N	998990999616	t	2020-08-31 08:17:19.553614	\N	66000
243	1034076869	Abduhamid	delivery	cash	\N	998977911999	t	2020-08-31 10:05:35.730161	\N	138000
244	40044213	\N	delivery	payme	\N	998909750072	f	\N	\N	\N
245	1198101713	Madina	delivery	cash	\N	+998993734343	t	2020-08-31 13:41:33.836876	\N	\N
246	1110033868	\N	delivery	\N	\N	\N	f	\N	\N	\N
247	877081752	Наргиза	delivery	payme	\N	998971460077	t	2020-08-31 13:36:35.565501	\N	108000
248	295396198	Жасур	delivery	cash	\N	+998917870303	t	2020-08-31 14:00:57.752613	\N	206000
249	1028960510	Нозима	delivery	cash	\N	998998829020	t	2020-08-31 14:20:47.776102	\N	130000
250	1986767	Nodir	delivery	cash	\N	998933990220	t	2020-08-31 14:37:28.031623	\N	179000
251	517545777	Шохсанам Ибрагимова	delivery	cash	\N	+998903382818	t	2020-08-31 15:38:22.220236	\N	104000
252	1238428198	\N	delivery	\N	\N	\N	f	\N	\N	\N
253	1670606	Dono	delivery	cash	\N	998911664554	t	2020-09-01 09:15:35.100463	\N	93000
254	58208356	\N	delivery	\N	\N	\N	f	\N	\N	\N
255	222470719	Nigora	delivery	cash	\N	998977600030	t	2020-09-01 15:14:54.783034	\N	104000
256	142689547	Laziza	delivery	cash	\N	998977471324	t	2020-09-02 10:50:25.055456	\N	75000
257	795612417	/start	delivery	payme	\N	998903937177	t	2020-09-02 14:58:10.887937	\N	77000
258	68801773	rano	delivery	payme	\N	+998977446004	t	2020-09-03 11:51:55.782987	\N	52000
259	7349942	Асаль	delivery	cash	\N	998903555529	t	2020-09-04 10:28:24.406812	\N	156000
260	169735979	Шодия	delivery	cash	\N	998977690600	t	2020-09-04 10:48:06.848063	\N	52000
261	37598247	Feruza	delivery	cash	\N	998945881088	t	2020-09-04 11:12:02.116931	\N	52000
262	1358184776	Bilol	delivery	cash	\N	+998998800772	t	2020-09-04 11:14:50.990522	\N	83000
263	593664713	Мумин	delivery	cash	\N	998917700077	t	2020-09-04 16:40:16.035318	\N	104000
264	51854	Ibrohim	delivery	cash	Нурафшон 22	998998213333	t	2020-09-04 16:46:31.590875	\N	98000
265	1182499136	Gozal	delivery	cash	\N	998903461979	t	2020-09-05 11:46:57.229601	\N	149000
266	803282553	Шахзода	delivery	cash	\N	998901220303	t	2020-09-05 11:24:47.320369	\N	133000
267	384450944	\N	delivery	payme	\N	998973429119	f	\N	\N	\N
268	124823685	Saida	delivery	cash	\N	998977032411	t	2020-09-05 14:58:04.40986	\N	\N
269	495508670	Mushtariy	delivery	cash	\N	998909460087	t	2020-09-05 15:59:16.06114	\N	85000
270	632119349	\N	delivery	\N	\N	\N	f	\N	\N	\N
271	861840906	Nozima	delivery	cash	\N	998915053005	t	2020-09-06 09:43:16.633614	\N	204000
272	985300624	\N	delivery	\N	\N	\N	f	\N	\N	\N
273	464358955	\N	delivery	payme	\N	998906800305	f	\N	\N	\N
274	745458462	Саодат	delivery	cash	\N	998990717771	t	2020-09-06 14:39:39.734109	\N	104000
275	529907638	\N	delivery	\N	\N	\N	f	\N	\N	\N
276	647323874	\N	delivery	cash	\N	998900023008	f	\N	\N	\N
277	958304502	Nodira	delivery	cash	\N	998975380107	t	2020-09-07 07:26:02.630418	\N	52000
278	1028960510	Нозима	delivery	cash	\N	998998829020	t	2020-09-07 09:18:14.85185	\N	128000
279	1380652842	Mastona	delivery	cash	\N	+998900147676	t	2020-09-07 09:33:20.961199	\N	52000
280	77988353	\N	delivery	\N	\N	\N	f	\N	\N	\N
281	164925654	Мадина	delivery	cash	\N	998999787318	t	2020-09-07 14:03:25.117192	\N	98000
282	527608137	Abdumajid	delivery	cash	\N	998977753443	t	2020-09-07 14:28:12.490224	\N	84000
283	1347837938	\N	delivery	cash	Abay korzinka	998994644870	f	\N	\N	\N
284	51855712	\N	delivery	cash	Сергели 1, 54 дом, 59 квартира	998909512216	f	\N	\N	\N
285	344471826	Sora	delivery	cash	чорсу площадь 3 а	998909106087	t	2020-09-08 07:30:28.583632	\N	164000
286	1032065627	Shahzodq	delivery	cash	\N	998935441498	t	2020-09-08 08:54:10.258864	\N	57000
287	133733347	\N	delivery	\N	\N	\N	f	\N	\N	\N
288	544101535	Iskander	delivery	cash	\N	998909533333	t	2020-09-08 11:53:39.634367	\N	190000
289	954632319	\N	delivery	\N	\N	\N	f	\N	\N	\N
290	873928306	Nozima	delivery	cash	\N	998935604311	t	2020-09-08 14:55:17.355258	\N	52000
291	1203552	Kamola	delivery	cash	\N	998977684546	t	2020-09-09 12:08:27.030204	\N	93000
292	88753752	Ширин	delivery	payme	\N	998909371232	t	2020-09-09 14:03:19.605146	\N	94000
293	1132959724	\N	delivery	\N	\N	\N	f	\N	\N	\N
294	1248848934	\N	delivery	cash	\N	998990831132	f	\N	\N	\N
295	508270977	Милана	delivery	cash	\N	998990551525	t	2020-09-10 13:53:30.15149	\N	52000
296	783131593	Nuriddinov Javoxir	delivery	cash	\N	998990099009	t	2020-09-11 12:56:41.609558	\N	127000
297	1182153696	Nozima	delivery	cash	\N	998974075555	t	2020-09-11 15:27:42.538654	\N	167000
298	572612279	Usmon Olimjonov	delivery	cash	\N	998908057777	t	2020-09-11 15:31:34.22686	\N	104000
299	1077895748	Komila	delivery	cash	\N	998990803222	t	2020-09-12 09:45:27.094043	\N	49000
300	1077895748	Komila	delivery	cash	\N	998990803222	t	2020-09-12 09:55:26.940257	\N	24000
301	508270977	Милана	delivery	cash	\N	998990551525	t	2020-09-12 11:21:41.816946	\N	52000
302	685247013	Севара	delivery	cash	\N	998971560691	t	2020-09-12 15:02:30.291412	\N	41000
303	646076328	Sevara	delivery	payme	\N	998977519619	t	2020-09-12 15:18:25.112205	\N	52000
304	56176073	Малика	delivery	cash	\N	998909227236	t	2020-09-12 16:09:22.742787	\N	85000
305	1040882142	\N	delivery	\N	\N	\N	f	\N	\N	\N
306	606829571	\N	delivery	cash	\N	998998099098	f	\N	\N	\N
307	1165125080	Нигора	delivery	cash	\N	998998657077	t	2020-09-17 10:02:58.423652	\N	33000
308	807470310	\N	delivery	payme	\N	998998488470	f	\N	\N	\N
309	1212372665	Mubina	delivery	cash	\N	998909020705	t	2020-09-14 08:20:31.690586	\N	83000
310	423420660	Sanjar	delivery	cash	yunusobod tumani usta shirin kocasi 62 uy	998933869627	t	2020-09-14 08:55:58.237362	\N	21000
311	756100813	Шахноза	delivery	cash	\N	998941013003	t	2020-09-14 09:25:13.496148	\N	78000
312	87652033	Кристина	delivery	cash	Учтепинский р-н, кв-л 24, дом 32, кв-ра 10	998901866853	t	2020-09-14 10:16:30.470672	\N	104000
313	1132146866	Lobar	delivery	cash	\N	+998933786767	t	2020-09-14 10:56:11.6099	\N	34000
314	1309986751	Хасан	delivery	cash	Куеш Нури 15	+998930060105	t	2020-09-14 13:10:54.736782	\N	82000
315	989852823	\N	delivery	cash	\N	998903935601	f	\N	\N	\N
316	51854	Ibrohim	delivery	cash	\N	998998213333	t	2020-09-14 15:29:39.648056	\N	98000
317	63914585	Снежана	delivery	cash	\N	998903158242	t	2020-09-14 15:56:01.571944	\N	154000
318	1360108359	Zilola	delivery	cash	\N	998977839017	t	2020-09-14 16:18:32.512923	\N	52000
319	63914585	Снежана	delivery	cash	\N	998903158242	t	2020-09-14 17:52:50.999423	\N	154000
320	807905068	Севинч	delivery	cash	\N	998935764660	t	2020-09-15 06:32:08.577356	\N	120000
321	63132740	Оля	delivery	cash	\N	998977559155	t	2020-09-15 10:19:30.285689	\N	93000
322	990771229	Rixsiboyeva muslima	delivery	cash	\N	998977738997	t	2020-09-15 11:04:15.417649	\N	\N
323	990771229	Rixsiboyeva muslima	delivery	cash	\N	998977738997	t	2020-09-20 11:55:22.436816	\N	42000
324	780884856	\N	delivery	cash	\N	998974073128	f	\N	\N	\N
325	544917517	Ziyovuddin	delivery	payme	\N	998909722228	t	2020-09-16 05:13:04.491135	\N	52000
326	1360108359	Zilola	delivery	cash	\N	998977839017	t	2020-09-16 07:03:51.007485	\N	52000
328	344471826	Sora	delivery	cash	чорсу	998909106087	t	2020-09-16 12:24:55.861471	\N	82000
329	63914585	Снежана	delivery	cash	\N	998903158242	t	2020-09-16 12:31:19.44556	\N	154000
330	27443664	\N	delivery	\N	\N	\N	f	\N	\N	\N
331	495508670	Mushtariy	delivery	cash	\N	998909460087	t	2020-09-16 15:47:55.991119	\N	118000
332	619459485	\N	delivery	payme	\N	998996967316	f	\N	\N	\N
333	810600005	Эвелина	delivery	cash	\N	998974292992	t	2020-09-16 16:47:09.860502	\N	98000
334	1151885863	\N	delivery	cash	\N	998970071172	f	\N	\N	\N
335	192946776	Zebiniso	delivery	cash	\N	998914433933	t	2020-09-17 15:46:00.65256	\N	52000
336	1094348301	Nata	delivery	cash	\N	998900328001	t	2020-09-17 16:39:20.545689	\N	39000
337	186987807	Madina	delivery	cash	qoratosh kochasi 17 uy 22 xonadon	998909085771	t	2020-09-18 14:16:40.38949	\N	98000
338	959057583	Mohinur	delivery	cash	\N	+998946561726	t	2020-09-18 14:27:10.874066	\N	121000
339	262302725	Yulduz	delivery	cash	\N	998974437334	t	2020-09-18 15:36:06.682679	\N	82000
340	275298034	\N	delivery	\N	\N	\N	f	\N	\N	\N
341	1058203097	амина	delivery	cash	\N	998909882433	t	2020-09-19 14:24:26.577836	\N	83000
342	968650671	Ирода	delivery	cash	Яккасарайский район \\nУл Шота Руставели 43 дом	998996650555	t	2020-09-19 15:23:48.701911	\N	104000
343	540898999	\N	delivery	cash	\N	998998426863	f	\N	\N	\N
344	480558355	+998907888656	delivery	cash	\N	+998907888656	t	2020-09-20 12:59:41.034556	\N	104000
345	913817843	Muqaddas	delivery	payme	\N	+998903541775	t	2020-09-21 16:00:45.431288	\N	42000
346	496518276	Надира	delivery	cash	\N	998944157777	t	2020-09-21 14:28:06.490202	\N	135000
347	1061997197	\N	delivery	\N	\N	\N	f	\N	\N	\N
348	84738289	\N	delivery	cash	\N	998903211515	f	\N	\N	\N
349	434675053	Sitora Shaxobiddinova	delivery	cash	\N	998907888552	t	2020-09-22 10:00:09.567997	\N	135000
350	92136155	Elizabeth	delivery	cash	\N	998999043512	t	2020-09-22 12:09:53.626594	\N	116000
351	93458319	Нодира	delivery	cash	\N	998971569946	t	2020-09-22 15:54:46.751309	\N	52000
352	718764491	Бунёд	delivery	cash	Ттз Карзинка	998914333334	t	2020-09-22 16:14:32.175055	\N	80000
353	83101539	\N	delivery	cash	\N	998935821423	f	\N	\N	\N
354	438723745	Nozima	delivery	cash	\N	998977361251	t	2020-09-23 09:59:02.075121	\N	104000
355	779997577	\N	delivery	cash	\N	998901280068	f	\N	\N	\N
356	693529029	Тимур	delivery	cash	\N	+998990827170	t	2020-09-23 14:33:29.262532	\N	88000
357	577885219	Nodira	delivery	cash	\N	+998994899891	t	2020-09-23 15:49:48.832571	\N	52000
358	577885219	Nodira	delivery	cash	\N	+998994899891	t	2020-09-23 15:50:49.215105	\N	25000
359	680245424	Samiya	delivery	cash	\N	998993154475	t	2020-09-23 16:06:18.043465	\N	118000
360	635453650	\N	delivery	cash	\N	+998901850989	f	\N	\N	\N
361	735995	\N	delivery	cash	\N	998909995674	f	\N	\N	\N
362	1120834765	Nodir	delivery	cash	\N	998900086667	t	2020-09-24 16:51:09.349785	\N	154000
363	109138163	Lochin	delivery	cash	\N	998990831249	t	2020-09-24 16:56:29.863726	\N	67000
365	918556385	Dilnoza	delivery	cash	\N	998900048222	t	2020-09-25 14:33:36.946448	\N	137000
366	141204712	Малика	delivery	payme	\N	998977097785	t	2020-09-25 14:00:28.203724	\N	129000
367	680245424	Samiya	delivery	cash	\N	998993154475	t	2020-09-25 14:24:38.371359	\N	158000
368	797498546	Siroj	delivery	cash	\N	998911350500	t	2020-09-25 15:31:33.027744	\N	74000
369	455747753	Лобархон	delivery	cash	\N	+998990044049	t	2020-09-25 17:21:08.091414	\N	85000
370	742888841	\N	delivery	cash	\N	998909180208	f	\N	\N	\N
371	1181147756	Vasilaxon	delivery	cash	\N	+998909307488	t	2020-09-26 07:19:23.521193	\N	28000
372	1181147756	Vasilaxon	delivery	cash	\N	+998909307488	t	2020-09-26 07:25:20.31674	\N	29000
373	983321875	Anvar	delivery	cash	\N	+998993052162	t	2020-09-26 07:52:13.452966	\N	286000
374	983321875	Anvar	delivery	cash	\N	+998993052162	t	2020-09-26 07:53:24.343426	\N	33000
375	1112132300	Севарахон	delivery	cash	Бектемирский район Водник улица Рахат дом 12 ориентир Бектемирский райгаз	998903318088	t	2020-09-26 08:12:15.641079	\N	52000
376	299491470	Komola	delivery	cash	\N	998998002750	t	2020-09-26 09:47:47.02535	\N	104000
377	1112132300	Севарахон	delivery	cash	\N	998903318088	t	2020-09-26 11:21:23.872976	\N	145000
380	455747753	Лобархон	delivery	cash	\N	+998990044049	t	2020-09-26 15:59:56.739346	\N	98000
1	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 10:53:27.134108	\N	145000
26	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:28:54.475727	\N	145000
8	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:14:56.080321	\N	693000
10	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:16:22.125928	\N	165000
12	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:17:17.874267	\N	68000
14	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:21:03.145597	\N	145000
39	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:38:49.909343	\N	216000
17	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:22:41.043198	\N	120000
18	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:23:24.742905	\N	168000
41	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:41:52.749617	\N	216000
20	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:25:18.051016	\N	195000
22	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:26:07.123896	\N	170000
25	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 11:28:26.570032	\N	48000
49	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 14:30:09.326616	\N	120000
50	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 14:31:47.667144	\N	76000
52	583411442	Дв	delivery	cash	\N	998900000000	t	2020-09-28 14:34:11.635929	\N	84000
\.


--
-- Data for Name: registration_requests; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.registration_requests (id, user_id, phone_number, tg_username, username, created_at) FROM stdin;
\.


--
-- Data for Name: user_admins; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.user_admins (id, email, password_hash) FROM stdin;
1	admin@example.com	pbkdf2:sha256:150000$mqgOLfNO$1b9e134780b95a45d6de2e1b74c3326cfc1fe064aaa8fbec24c1aadcabedf720
\.


--
-- Data for Name: user_dish; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.user_dish (user_id, dish_id) FROM stdin;
583411442	59
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: telegrambot
--

COPY public.users (id, full_user_name, username, phone_number, language, token, confirmed, telegram_id, registration_date) FROM stdin;
2182010	Nodira	\N	998935121121	uz	\N	\N	\N	2020-09-13 14:03:31.969789
2215132	Малика	malika_ikramovna	998911912867	ru	\N	\N	\N	2020-08-11 04:31:05.509666
2230335	Olimbek	Bek878	998909855572	uz	\N	\N	\N	2020-08-10 10:53:33.075568
2277808	Акмаль	\N	998903748866	ru	\N	\N	\N	2020-08-10 12:28:21.846451
2301816	Нигора	Uzaeroports	998901855755	ru	\N	\N	\N	2020-08-31 13:21:27.362511
2318343	93/556-16-17	\N	998935561617	ru	\N	\N	\N	2020-09-06 07:09:18.822204
2377401	Хуршида	khadjimuratova	998909263790	ru	\N	\N	\N	2020-08-31 08:51:49.295602
2392834	Людмила	\N	998911626690	ru	\N	\N	\N	2020-08-10 11:34:26.39196
2428248	Sarvar	\N	998998571771	uz	\N	\N	\N	2020-08-09 13:02:29.108871
2474680	Shaxnoz	noza_kapriz	998909747184	ru	\N	\N	\N	2020-09-17 04:30:59.289409
2478155	Юля	jueldita_juli	998909389597	ru	\N	\N	\N	2020-08-09 16:03:29.218971
2548937	Shahloxon	\N	998977674533	uz	\N	\N	\N	2020-08-31 08:52:40.863522
2582088	Умида	\N	998974327500	ru	\N	\N	\N	2020-09-06 12:12:28.207083
2598580	FERUZA	Feruza787	+998977728040	uz	\N	\N	\N	2020-09-11 12:08:22.743056
2625355	yasina	asay9094	998909030075	uz	\N	\N	\N	2020-09-14 12:35:35.216873
2703474	Даяна	\N	998909228245	ru	\N	\N	\N	2020-08-30 10:50:46.113772
2753522	Barno	\N	998911180608	ru	\N	\N	\N	2020-08-10 11:37:56.476423
51854	Ibrohim	anvaroff1	998998213333	uz	\N	\N	\N	2020-08-10 15:39:13.953349
63961	Диля	Dilya0400	998977337440	ru	\N	\N	\N	2020-08-30 16:32:07.144856
84985	Javokhir	aydashev	+998998895888	ru	\N	\N	\N	2020-08-10 00:02:36.383786
223980	Наима	\N	998909590989	ru	\N	\N	\N	2020-09-08 05:58:50.887506
346244	Анастасия	\N	998901760671	ru	\N	\N	\N	2020-09-07 10:52:34.719426
378354	Zebo	\N	998909821880	uz	\N	\N	\N	2020-08-25 13:21:31.541394
381403	Sanjar	soysancho	998935384353	ru	\N	\N	\N	2020-09-14 15:05:01.887626
382857	Камила	Kaa0907	998901787815	ru	\N	\N	\N	2020-08-28 14:57:14.665375
384694	909006660	Nodir_fx	998909006660	ru	\N	\N	\N	2020-08-14 14:55:42.272456
404777	Джамиля	\N	998909028030	ru	\N	\N	\N	2020-08-29 14:31:03.31841
697481	Feruza	\N	998946805333	ru	\N	\N	\N	2020-08-08 15:55:51.13705
735995	Dilovar	by_dilovar	998909995674	ru	\N	\N	\N	2020-08-10 08:08:24.606473
736166	Сарвар	srv_dogma	998977503334	ru	\N	\N	\N	2020-08-09 08:56:55.124658
765555	Умид	Vertu8888	998901788844	ru	\N	\N	\N	2020-08-11 13:04:36.002298
776066	Дилмира	DilmiraAbdulmalek	998909997233	ru	\N	\N	\N	2020-08-09 15:15:38.707488
816743	Dg	SunEdition	998901001616	ru	\N	\N	\N	2020-08-05 12:04:30.619133
880280	Сарвар	Arikashirukashi	998998136585	ru	\N	\N	\N	2020-08-16 10:56:02.121614
888860	Сабина	Sabino4kaTashmatova	998946398414	ru	\N	\N	\N	2020-08-08 03:11:48.361159
895990	Nigora	\N	998911914622	ru	\N	\N	\N	2020-08-31 05:09:41.827901
1016047	Зики	\N	+998908078777	ru	\N	\N	\N	2020-08-11 13:06:13.93039
1120113	Malika	\N	998909211188	ru	\N	\N	\N	2020-08-09 15:07:57.963539
1138264	Ruxsora	\N	+998903580507	ru	\N	\N	\N	2020-08-15 12:38:01.328333
1140592	Sardor	Djemo	998909586933	ru	\N	\N	\N	2020-08-15 14:36:26.568122
1199303	Валерия	valeriya100992	998935444346	ru	\N	\N	\N	2020-08-13 09:15:39.25007
1203552	Kamola	\N	998977684546	uz	\N	\N	\N	2020-09-02 12:04:20.865115
1294788	Nargiza	\N	998946686855	uz	\N	\N	\N	2020-08-12 06:40:37.081144
1314395	Зиеш	Ziyodullakhon	998935664014	uz	\N	\N	\N	2020-09-18 13:03:57.470594
1316147	Саида	SaidaMuzaffarovna	998935050818	ru	\N	\N	\N	2020-09-13 18:02:34.022633
1317962	Iby	ibrohim_717	998909600300	uz	\N	\N	\N	2020-09-16 14:10:26.685244
1347216	Отабек	SeVeN70	998977160545	ru	\N	\N	\N	2020-09-06 18:54:28.544456
1356858	Ильхом	HiddenBurjuy	998977805695	ru	\N	\N	\N	2020-08-29 13:40:02.778221
1623486	Икром	i_muminov	998977484684	ru	\N	\N	\N	2020-08-26 15:16:38.686637
1670606	Dono	Donowa	998911664554	ru	\N	\N	\N	2020-09-01 09:13:13.43556
1697416	Davronbek Rustamov	Rustamov_Davronbek	998935311818	ru	\N	\N	\N	2020-08-11 09:53:48.627572
1713391	Anvar	bako_88	998909930040	ru	\N	\N	\N	2020-08-26 13:46:38.224739
1728779	Саодат	sardorandhismom	998909500050	ru	\N	\N	\N	2020-09-06 03:25:12.482395
1771807	Barno	BarnoUzb	998901050000	uz	\N	\N	\N	2020-09-16 19:00:25.514088
1800346	Наргиза	\N	998946505050	ru	\N	\N	\N	2020-08-31 00:53:07.565084
1830652	Фарход	Fpppffppp	998946628822	uz	\N	\N	\N	2020-08-17 04:11:21.5087
1870459	Абдуворис	lllllllllllllllllllllllllllllaaa	998977613131	ru	\N	\N	\N	2020-09-13 19:36:57.538422
1913349	Асаль	\N	998996119646	ru	\N	\N	\N	2020-09-07 13:51:15.508738
1957730	Абдумалик	abdulmalik006	998993933800	ru	\N	\N	\N	2020-09-07 01:17:14.760159
1986767	Nodir	\N	998933990220	ru	\N	\N	\N	2020-08-31 14:26:54.224821
1993055	Barno	\N	998935021188	ru	\N	\N	\N	2020-08-13 06:45:45.189645
2039701	Suxrob	Meliboyevs	998933770955	uz	\N	\N	\N	2020-08-09 12:39:44.148499
2066902	Nargiza	hurram	998937970000	uz	\N	\N	\N	2020-09-13 14:39:38.357924
2114545	Nozima	\N	998935656363	uz	\N	\N	\N	2020-09-02 11:55:13.935666
2120937	Sagatova Dono	\N	998903224363	ru	\N	\N	\N	2020-09-25 13:22:36.293438
2156661	Mirziyodman	\N	998935757070	uz	\N	\N	\N	2020-08-09 12:52:34.926364
625188516	Ilxom	LIVE_1XBET_2020	998993610320	uz	\N	\N	\N	2020-09-28 14:15:35.416678
1254924688	Nigora	\N	998998957011	uz	\N	\N	\N	2020-09-26 10:25:23.168066
1260984449	Maksadbek	maksad444	998905571144	uz	\N	\N	\N	2020-09-26 15:48:37.322906
2757345	Fazliddin	\N	998935544332	uz	\N	\N	\N	2020-08-10 10:59:32.723234
2822677	Amaliya	Amalitta	998933805595	ru	\N	\N	\N	2020-08-14 11:46:07.773658
2851677	Zuhra	Diva0307	998909717675	uz	\N	\N	\N	2020-09-17 16:22:32.676719
2864570	Nilufar	nelichka_757	998901674440	ru	\N	\N	\N	2020-08-30 18:37:52.718248
2954263	Zaur	aze_17	998998401115	ru	\N	\N	\N	2020-08-15 09:52:04.211791
3036621	Muhammadjon	\N	998909922723	uz	\N	\N	\N	2020-09-06 07:16:08.19999
3079010	Zarnigor	\N	998907124300	uz	\N	\N	\N	2020-08-26 14:46:11.115431
3282623	Ойбек	Aberkulov	998930002888	ru	\N	\N	\N	2020-09-08 05:08:19.995556
3611068	Севара	Karimova_F7771	998917712177	ru	\N	\N	\N	2020-09-22 14:43:33.15555
3654988	Shaxlo	\N	998946380202	uz	\N	\N	\N	2020-09-08 19:44:41.63662
3690609	Bobur	Bobur_005	998977778282	ru	\N	\N	\N	2020-08-09 13:50:46.488076
3712548	Зарина	Zarina_Djuraeva	998909118400	ru	\N	\N	\N	2020-08-10 06:05:45.626793
3760084	Маргарита	\N	998909616093	ru	\N	\N	\N	2020-08-16 10:39:34.261913
4036197	Madina	\N	998909584616	uz	\N	\N	\N	2020-08-28 08:27:08.197631
5267002	/start	\N	998913105228	uz	\N	\N	\N	2020-09-10 03:58:32.112847
5491502	Marufbek	global_ice1991	998905101991	uz	\N	\N	\N	2020-08-17 19:16:27.778899
7322737	Азиз	AzizNasimov	998909553519	ru	\N	\N	\N	2020-08-16 09:03:14.126011
7349942	Асаль	\N	998903555529	ru	\N	\N	\N	2020-09-04 10:23:31.319012
9777056	Ziyoda	\N	998909753015	uz	\N	\N	\N	2020-08-22 17:28:34.979981
9796302	Хасан	Ganikhodjaev	998909072184	ru	\N	\N	\N	2020-08-09 08:45:40.348884
9822359	Kamila	Kamila_O	998946422575	ru	\N	\N	\N	2020-08-28 12:04:15.655687
10194381	Мики	\N	998901252141	ru	\N	\N	\N	2020-08-21 05:11:29.48308
11992352	Ойхон	\N	998913248034	uz	\N	\N	\N	2020-09-07 18:35:40.567328
14758115	Sherzod	\N	998974804494	uz	\N	\N	\N	2020-08-29 02:56:43.00347
16295490	Зульфия	zulikm	998971020013	ru	\N	\N	\N	2020-09-12 15:25:24.361736
21564297	Дильфуза	\N	998933761171	uz	\N	\N	\N	2020-08-22 14:18:23.888035
22715154	Диёра	Diyora_Dusova	998973428489	uz	\N	\N	\N	2020-08-12 12:14:42.47674
23333964	Мохира	M5hira	998935825515	ru	\N	\N	\N	2020-09-23 09:37:17.643986
23369027	Азиза	Aziza0408	998935525239	ru	\N	\N	\N	2020-09-24 15:47:37.77742
25240844	(90)1754510	Alinochka8511	+998901754510	ru	\N	\N	\N	2020-08-11 07:21:16.609931
26458110	Nargiza	Stomatolog_Nargiza_Shuhratovna	998903153191	uz	\N	\N	\N	2020-09-25 15:17:05.034445
27443664	Otabek	\N	998909964884	uz	\N	\N	\N	2020-09-06 04:12:20.717384
28756001	Сурайё	umarova_s_u	998903361334	ru	\N	\N	\N	2020-09-03 04:49:08.174243
28846156	Bobur	BOB_9999	998909999880	ru	\N	\N	\N	2020-09-14 17:45:20.678468
29634718	Чарос	\N	998909811161	ru	\N	\N	\N	2020-09-25 13:20:01.716829
32250767	Moon	Moon_85	998946720073	uz	\N	\N	\N	2020-08-31 03:36:14.399969
33417447	Диера	Diorass	998974485834	ru	\N	\N	\N	2020-08-10 08:43:03.058227
33670230	Феруза	\N	998909776434	ru	\N	\N	\N	2020-09-07 08:03:19.740077
33826188	Fazilat	Snow_white_98	998909556805	uz	\N	\N	\N	2020-08-09 13:33:09.447637
34013412	Bobur	Bobur_0203	998909210203	uz	\N	\N	\N	2020-09-07 12:48:03.844244
34267295	Sirojiddin	\N	998974222141	uz	\N	\N	\N	2020-08-13 07:47:20.030546
34320884	Азизбек	\N	998977720702	ru	\N	\N	\N	2020-08-09 05:23:32.534916
36187133	Nilufar	\N	998909101065	uz	\N	\N	\N	2020-09-07 13:27:21.112372
37562454	Намуна	\N	998935833511	uz	\N	\N	\N	2020-09-09 02:57:39.816551
37598247	Feruza	FeruzaShuxratovna	998945881088	uz	\N	\N	\N	2020-09-04 11:08:29.211178
38033923	Мохира	mokhee_a	998935782132	ru	\N	\N	\N	2020-08-11 07:07:27.893859
39711277	Sayyora	\N	998946984704	ru	\N	\N	\N	2020-08-09 10:52:30.498513
39770115	Альбина	\N	+998977046810	ru	\N	\N	\N	2020-08-09 18:45:42.786549
40044213	Ёркиной	Kumush7	998909750072	uz	\N	\N	\N	2020-08-30 15:43:12.396321
40200066	Avaz	\N	+998909953222	uz	\N	\N	\N	2020-08-18 00:30:49.812867
40833853	Guli	\N	998914700393	uz	\N	\N	\N	2020-08-21 21:22:01.54948
41135941	Шерзод	\N	998998250007	uz	\N	\N	\N	2020-08-11 11:35:43.15339
41257852	Азиза	akhmedjanovaaziza	998915284634	ru	\N	\N	\N	2020-08-10 09:53:30.749113
42162733	Shavkat	\N	998909445400	uz	\N	\N	\N	2020-08-05 15:26:10.668129
42333826	Dilnoza	didiya641	998909595970	ru	\N	\N	\N	2020-09-06 20:57:57.862356
42651192	/start	Bibi2210	998908057106	ru	\N	\N	\N	2020-08-14 15:01:13.003873
43277382	Guli	\N	+998912824001	uz	\N	\N	\N	2020-09-19 14:44:33.330921
43819237	Mirkomron	\N	998996818161	ru	\N	\N	\N	2020-09-09 07:55:19.633356
44234689	Nafosat	HarvardGirl	998909994626	ru	\N	\N	\N	2020-08-21 17:45:36.362714
44455601	Ravshanjon	RonaldWIUT	998974111989	uz	\N	\N	\N	2020-08-13 16:41:46.5589
45198996	Sardor	\N	998977717388	uz	\N	\N	\N	2020-08-09 12:57:59.127305
47428827	Дилафруз	\N	998935396749	uz	\N	\N	\N	2020-09-01 12:05:44.837545
47551276	Азиза	\N	998977176942	ru	\N	\N	\N	2020-08-23 03:11:05.127152
48321946	Камилла	\N	998935028027	ru	\N	\N	\N	2020-09-13 06:11:04.811735
48331872	сайёра	\N	998903183875	uz	\N	\N	\N	2020-08-22 16:06:06.897514
50906379	Шерзод	Cl0WT	+998909049272	ru	\N	\N	\N	2020-08-14 12:54:29.873322
51855712	Виктория	\N	998909512216	ru	\N	\N	\N	2020-08-22 13:25:35.013565
53982452	Шохрух	Yuldashevich880	998998279900	ru	\N	\N	\N	2020-09-08 09:10:10.023845
55674936	Aziz	\N	998994899890	uz	\N	\N	\N	2020-09-19 11:36:08.190364
55860032	Нозима	\N	998974908486	ru	\N	\N	\N	2020-09-17 17:01:34.502281
55886690	Guli	\N	998946544553	uz	\N	\N	\N	2020-09-09 15:30:41.417404
56008096	Маъруф	yozing	998981246999	uz	\N	\N	\N	2020-08-06 06:08:50.091219
56176073	Малика	mazhanova_m	998909227236	ru	\N	\N	\N	2020-09-12 16:07:22.69851
56222324	Shohruh	Shokhrukh92	998913304004	uz	\N	\N	\N	2020-08-12 15:47:54.758435
56337815	М	Maruf_DJ	+998909333737	ru	\N	\N	\N	2020-09-17 16:36:50.656294
56369815	Zufunun	Zufunun	998935928787	ru	\N	\N	\N	2020-08-16 13:30:51.904489
56512990	Малика	dathotbabe	998901675766	ru	\N	\N	\N	2020-09-25 14:53:05.678092
57434681	Юлиана	YuIiana	+998909481085	ru	\N	\N	\N	2020-08-30 16:24:22.02695
58176694	Iskandar	\N	998909710684	uz	\N	\N	\N	2020-09-19 14:18:48.699277
58208356	Нуриддин	nuri_12	998998371112	ru	\N	\N	\N	2020-08-12 09:53:16.128494
59355039	Nazokat	Damawniy_tort	998974238089	uz	\N	\N	\N	2020-09-07 19:16:26.002583
59497789	Дилфуза	\N	998935880048	uz	\N	\N	\N	2020-09-09 03:29:25.604552
60043919	Селин	\N	998946663913	ru	\N	\N	\N	2020-09-07 20:10:31.599385
60540062	Nigina	\N	998946241411	ru	\N	\N	\N	2020-09-10 15:58:59.756772
60985641	DIDI	\N	998909854478	uz	\N	\N	\N	2020-09-08 20:26:56.191851
61922295	Валерия	Valeriya0613	998909164513	ru	\N	\N	\N	2020-09-09 19:34:27.576705
62268645	Нилуфар	nilufar_kholdarova	998909904511	ru	\N	\N	\N	2020-08-23 16:49:34.358794
63071124	Виктория	\N	998935609192	ru	\N	\N	\N	2020-08-14 18:20:56.555319
63132740	Оля	\N	998977559155	ru	\N	\N	\N	2020-09-15 09:18:06.001421
63374843	Gulhayo	\N	998901077773	uz	\N	\N	\N	2020-09-03 17:52:50.990791
63393519	Azimjon	Azim_0712	998977722551	uz	\N	\N	\N	2020-09-09 17:50:04.48716
63673586	Шахло	ShahloOminaSumayya	998935962770	uz	\N	\N	\N	2020-09-08 10:34:10.968986
63914585	Снежана	Snejka13	998903158242	ru	\N	\N	\N	2020-08-22 14:34:57.511757
64870516	Oscar	Oscar_Hosam	998909652564	ru	\N	\N	\N	2020-08-26 11:49:00.942821
64925540	Владимир	BJIaDMuP	+998935856774	ru	\N	\N	\N	2020-08-01 10:54:04.897559
65830674	Akbarxon	\N	998903722005	ru	\N	\N	\N	2020-08-15 08:06:56.067878
66073162	Saida	Saishka1	998903294653	uz	\N	\N	\N	2020-08-12 11:46:35.723207
66795761	Назиля	\N	998971555885	ru	\N	\N	\N	2020-08-10 10:41:31.270598
67870712	Дильдора	Dora_frkh	998901759130	ru	\N	\N	\N	2020-09-07 15:48:17.2008
68801773	rano	R_Erkin0va	+998977446004	uz	\N	\N	\N	2020-09-03 11:47:31.009817
69638210	Sardor	A_Sardor_A	998904070777	uz	\N	\N	\N	2020-08-12 02:17:50.399188
70836411	Хилола	salikhovakhilola	998909316068	ru	\N	\N	\N	2020-08-14 08:20:29.294386
71291403	Nigina	Nigina2770	998909542770	uz	\N	\N	\N	2020-08-10 12:56:47.729679
72636478	Diyora	\N	998977601103	ru	\N	\N	\N	2020-08-18 09:48:39.647577
72684587	Zarina	\N	998909108028	ru	\N	\N	\N	2020-08-09 12:03:10.957992
74012475	Любовь	lyubasha_saveleva	998977776940	ru	\N	\N	\N	2020-08-22 16:45:41.640651
74438538	+998946097996	\N	998946097996	ru	\N	\N	\N	2020-08-09 21:38:50.393886
74509916	Sardor	\N	998974347667	uz	\N	\N	\N	2020-08-17 07:22:45.472875
74938280	Фаррух	ZoKiRoFF96	79619602233	ru	\N	\N	\N	2020-08-31 10:40:34.190422
75155463	Лариса	tszena	998974109999	ru	\N	\N	\N	2020-08-29 04:49:58.141556
75178365	Ольга	\N	998977503728	ru	\N	\N	\N	2020-08-10 10:38:56.982579
75716067	Малика	umeemu	998909979747	ru	\N	\N	\N	2020-08-13 11:41:45.852867
75981474	Комола	\N	998909008400	ru	\N	\N	\N	2020-08-09 13:50:46.922478
76462417	Парвиз	\N	998973972272	uz	\N	\N	\N	2020-08-09 13:00:37.786857
76777495	Дмитрий	dmitriyl99	998909879930	ru	\N	\N	\N	2020-08-01 09:44:18.29835
77247081	Sevara	sevara_rus	998901672552	ru	\N	\N	\N	2020-09-03 10:01:23.509302
77578750	Dilmurod	dilmurod2606	998977515131	ru	\N	\N	\N	2020-08-19 11:53:48.511951
77752470	Masuda	Hikmatova21	998933761746	uz	\N	\N	\N	2020-08-19 00:40:47.256553
77988353	Камила	Kamila_Sultanova	998909728765	ru	\N	\N	\N	2020-09-07 10:23:41.516986
78200523	Bobur	\N	998990858599	uz	\N	\N	\N	2020-09-14 05:52:58.675499
78343754	Todjieva Ugilkhon	\N	998998372339	uz	\N	\N	\N	2020-09-07 12:46:50.107527
78493029	Zilol a	irisova_Z	+998911344210	uz	\N	\N	\N	2020-09-09 19:44:36.055994
78582735	Олим	oceans11	998977120442	ru	\N	\N	\N	2020-09-07 19:08:27.423887
78900112	Shakhnossa	shakhnossa	998977744755	ru	\N	\N	\N	2020-08-30 18:27:03.878123
79033472	Наргиза	\N	998977979500	ru	\N	\N	\N	2020-09-08 19:22:42.133082
80369550	Мирзаахмадов Хабибуллох	\N	998909499080	uz	\N	\N	\N	2020-09-13 20:24:49.455753
81334141	/start	\N	998933407077	ru	\N	\N	\N	2020-09-08 12:49:23.395454
81730797	Elyor	\N	998916813131	uz	\N	\N	\N	2020-08-20 15:51:56.564448
81927230	Iroda	\N	998974142228	ru	\N	\N	\N	2020-09-08 08:14:22.105059
81959386	Dilnoza	\N	998900372299	uz	\N	\N	\N	2020-09-09 08:51:59.472499
82012131	/	Uzgold17	+998974483135	ru	\N	\N	\N	2020-08-10 10:14:16.340654
83101539	Анастасия	Asya_belyaevaa	998935821423	ru	\N	\N	\N	2020-09-23 02:22:26.137991
83526466	Диля	usmanovad1	998909723253	ru	\N	\N	\N	2020-08-12 14:46:47.205036
84013927	Aziza	\N	998998670885	uz	\N	\N	\N	2020-09-23 03:07:18.317053
84551212	Зарнигор	\N	998931660000	ru	\N	\N	\N	2020-08-08 17:17:28.748476
84738289	Nargiza	Nargiza1515	998903211515	uz	\N	\N	\N	2020-09-22 09:44:57.427088
86645306	Fazliddin	nodirovich	998977789058	uz	\N	\N	\N	2020-08-24 12:18:05.004658
87652033	Кристина	ChriSti96	998901866853	ru	\N	\N	\N	2020-09-14 08:48:42.43829
87820098	/stop	khamidullo4	998998468363	uz	\N	\N	\N	2020-09-18 07:08:22.805855
88753752	Ширин	\N	998909371232	ru	\N	\N	\N	2020-08-09 17:30:11.128246
92136155	Elizabeth	lindbergEI	998999043512	ru	\N	\N	\N	2020-09-22 11:44:05.116912
93458319	Нодира	Nodira9946	998971569946	ru	\N	\N	\N	2020-09-22 15:29:46.450282
93657530	Мали	\N	998916007777	ru	\N	\N	\N	2020-08-16 15:47:13.374414
93691754	Азиза	Mamina_radost	998977251295	ru	\N	\N	\N	2020-08-22 15:41:22.61639
96010349	Лазиза	Mashrabjonovna	998977407448	ru	\N	\N	\N	2020-08-13 17:25:39.309453
96321455	/start	Shahnozka_I	998903259855	ru	\N	\N	\N	2020-09-06 13:35:32.4713
98035793	Soxib	JrMaksumkhanov	998977370995	uz	\N	\N	\N	2020-09-14 08:03:36.094194
98652663	Gavhar	TASNIM_707	998977080383	uz	\N	\N	\N	2020-09-10 02:16:34.376308
98892006	Паризода	Perisha_peri	+998946084532	uz	\N	\N	\N	2020-09-08 05:55:55.49864
100190602	Камрон	gaffarovk	998990028887	ru	\N	\N	\N	2020-09-09 08:19:01.797312
100517385	Kamila	kamilii2001	998933816002	ru	\N	\N	\N	2020-09-19 12:06:15.685403
101524905	Муниса	munisakas	+998990205732	ru	\N	\N	\N	2020-08-12 08:27:48.996846
101667102	Шерзод	leo702	998977027777	ru	\N	\N	\N	2020-08-30 14:33:55.61938
102570577	Zoir	\N	998977231618	ru	\N	\N	\N	2020-08-05 15:20:26.562659
103349474	Ксения	\N	998903521770	ru	\N	\N	\N	2020-08-15 04:25:18.329264
103842057	Анастасия	ana_b_8	998909215187	ru	\N	\N	\N	2020-09-10 21:52:44.202864
104613592	Эзоза	\N	998972605111	ru	\N	\N	\N	2020-09-07 09:29:47.81473
105756298	Malika	M_Fakhriddinovna	998909002263	uz	\N	\N	\N	2020-09-07 06:06:25.604038
106604584	Hojiakbar	djuraev_uae	998946239699	uz	\N	\N	\N	2020-08-14 16:20:20.386352
107921315	Надира	cosmetolog_nadira_yakubova	998977408804	ru	\N	\N	\N	2020-09-17 06:37:40.112455
109138163	Lochin	L_0808_O	998990831249	uz	\N	\N	\N	2020-09-24 16:53:22.301026
109299250	Шахризода	Shakhriii	998909654962	ru	\N	\N	\N	2020-08-10 15:01:43.3635
109499387	Карина	\N	998901869783	ru	\N	\N	\N	2020-08-22 13:17:10.603529
111404289	Бинафша	\N	998974032727	ru	\N	\N	\N	2020-09-01 16:11:31.272527
112877519	Мансур	Scarsgard	998913306866	ru	\N	\N	\N	2020-09-14 08:32:46.01425
112896492	Наргиза	\N	998977009363	ru	\N	\N	\N	2020-09-06 17:35:11.791709
113725009	Надира	BeboPom	998977773233	ru	\N	\N	\N	2020-09-07 07:55:40.741793
115037958	Sharofiddin	Hacker_No	+998994538023	uz	\N	\N	\N	2020-08-24 06:57:59.664586
117521576	Ясмин	Angel_or_69	998903242726	ru	\N	\N	\N	2020-09-06 16:16:48.876897
117728875	Munisa	VISION_UZBEKISTAN	998946616441	uz	\N	\N	\N	2020-09-12 16:11:21.474118
117985025	Диана	IN00CREDIBLE	998909533256	ru	\N	\N	\N	2020-08-30 10:57:37.226127
119068282	Iqbola	\N	998901201155	uz	\N	\N	\N	2020-09-09 15:25:41.958678
119232035	Fayoz	M_R_X	998977722238	ru	\N	\N	\N	2020-09-09 14:49:16.918605
119309130	дадахожаева зилола	zil7709	998997205662	ru	\N	\N	\N	2020-08-27 13:29:35.828853
119977567	Ирина	\N	998901860604	ru	\N	\N	\N	2020-08-09 07:03:15.133666
123026072	Мадина	dma_u	998990339546	ru	\N	\N	\N	2020-09-06 14:10:11.700521
124823685	Saida	ssaidar	998977032411	ru	\N	\N	\N	2020-09-05 14:54:12.621208
125789854	Зиёда	\N	998971552878	uz	\N	\N	\N	2020-09-09 12:08:12.169657
125881160	Adem	\N	998901858184	uz	\N	\N	\N	2020-08-09 12:48:31.712986
127689127	Ilxom	\N	998935544049	uz	\N	\N	\N	2020-09-13 20:13:07.451108
130601865	Абдулла	\N	+998977777716	ru	\N	\N	\N	2020-08-22 13:05:57.885301
132150951	Екатерина	ShabanovaY	998931626012	ru	\N	\N	\N	2020-09-07 15:28:27.61654
133637856	Феруза	XamrayevaFQ	998946430083	ru	\N	\N	\N	2020-09-15 18:46:52.19461
133733347	Karim	Muhammadkarim2001	998909408505	uz	\N	\N	\N	2020-09-08 08:47:03.702039
139967148	Mirolim	\N	998977581101	uz	\N	\N	\N	2020-09-09 14:40:23.298658
141204712	Малика	mtavakkalova	998977097785	ru	\N	\N	\N	2020-09-25 12:45:54.65555
141704184	Javohir	\N	998909003717	uz	\N	\N	\N	2020-09-01 14:28:08.093476
142689547	Laziza	\N	998977471324	uz	\N	\N	\N	2020-09-02 10:31:26.961794
144637283	Шахзода	\N	998909575609	ru	\N	\N	\N	2020-09-23 11:28:35.399488
144794149	Шерзод	Cbwwww	998946287362	ru	\N	\N	\N	2020-09-13 15:17:32.51361
145806589	Iroda	\N	998909016449	ru	\N	\N	\N	2020-09-15 15:51:21.27531
148615565	Madina	\N	998903504348	uz	\N	\N	\N	2020-08-29 08:21:23.33207
149032977	+998935408017	\N	998935408017	ru	\N	\N	\N	2020-08-11 09:47:37.92536
149312635	Madinabonu	\N	998903258228	uz	\N	\N	\N	2020-08-16 12:57:05.66405
149738839	Луиза	\N	998909158810	ru	\N	\N	\N	2020-09-08 18:06:49.477434
153322125	Suxrob	suxrob07	998900005544	ru	\N	\N	\N	2020-08-09 12:51:52.118418
154749832	Iroda	\N	+998903538960	uz	\N	\N	\N	2020-08-16 12:09:10.587478
155962879	Мурад	Seo_of_vid_uz	+998909408196	ru	\N	\N	\N	2020-08-07 10:25:17.395702
156617556	Hilola	zubaydullohilola	998903211428	uz	\N	\N	\N	2020-08-30 21:35:45.675682
159314585	Lakatsya tawberolislami	Javoh9283	998998029283	uz	\N	\N	\N	2020-09-14 10:30:32.735259
159891327	Умидахон	\N	998 99 8895272	uz	\N	\N	\N	2020-09-06 13:12:47.146097
161536814	Ванесса	Tenv_26	998974346844	ru	\N	\N	\N	2020-08-29 12:03:17.329648
162099531	Akbar	ShKhojiakbar	998909717978	ru	\N	\N	\N	2020-08-10 07:08:32.70085
162793756	Камила	kamila_grb	998909480419	ru	\N	\N	\N	2020-09-08 10:46:57.722022
164925654	Мадина	m_radiant	998999787318	ru	\N	\N	\N	2020-09-04 15:55:47.28688
165341686	Мохинур	M_Marufova	998977048218	ru	\N	\N	\N	2020-09-17 21:04:01.362871
168322157	Элина	Elinchik_Sh	998909195437	ru	\N	\N	\N	2020-09-06 15:04:42.160914
169478939	Islom	\N	998 93 5906000	uz	\N	\N	\N	2020-09-01 14:20:34.900179
169630487	Насиба	Nasibam084	998974115363	ru	\N	\N	\N	2020-08-31 02:28:43.277845
169735979	Шодия	AuraCebilon1Tashkent	998977690600	ru	\N	\N	\N	2020-08-10 07:07:18.75474
170993104	Муслима	louise_carr	998909169825	ru	\N	\N	\N	2020-08-09 10:55:40.966456
171229667	Bobur	Bobur8444	998998778444	uz	\N	\N	\N	2020-09-15 05:47:03.602073
172795327	Юрико	\N	998974014343	ru	\N	\N	\N	2020-09-12 09:52:04.852421
173712102	/start	\N	+998974402821	ru	\N	\N	\N	2020-09-10 01:48:34.238939
175774785	Ширин	Manis_sladkaya	998946857710	ru	\N	\N	\N	2020-08-22 16:26:11.770223
177674677	Abdulqodir	GospodinQobulovich	998977160301	ru	\N	\N	\N	2020-08-10 11:42:04.772316
177879536	Раьно	\N	998998772767	ru	\N	\N	\N	2020-09-04 18:39:44.22586
180954440	Мухаммад	\N	998974504221	ru	\N	\N	\N	2020-08-13 10:41:39.762265
183147043	Yana	\N	998909081531	ru	\N	\N	\N	2020-09-10 15:13:27.029598
185170494	Азиза	\N	998977544002	ru	\N	\N	\N	2020-08-09 16:25:13.975607
186987807	Madina	\N	998909085771	uz	\N	\N	\N	2020-09-18 14:13:03.190183
190643941	Otabek	Otabek0425	998909385652	uz	\N	\N	\N	2020-08-05 19:26:32.261603
191733231	Дарина	DariPolich	+998977572804	ru	\N	\N	\N	2020-08-16 09:31:06.996146
192284984	Shahnoza	\N	+998971317444	uz	\N	\N	\N	2020-08-11 09:40:23.400531
192946776	Zebiniso	\N	998914433933	uz	\N	\N	\N	2020-09-16 18:48:55.386149
195435935	Feruza	Sedaf_wedding_salon	+998998568877	ru	\N	\N	\N	2020-08-24 03:56:02.650375
196221374	Сухроб	\N	998949382722	ru	\N	\N	\N	2020-09-20 14:44:09.325544
196714221	Нигина	\N	998909544500	ru	\N	\N	\N	2020-09-09 08:18:43.513382
197188043	Zhanara	t_zhanara	77756355858	ru	\N	\N	\N	2020-08-10 09:45:40.822565
198336525	Bel	mirzobekashurov	998909357578	ru	\N	\N	\N	2020-08-09 17:29:16.311024
201384689	Нодира	Nonasulton	998977305996	ru	\N	\N	\N	2020-08-30 17:44:03.262217
201458407	Акбар	Hornet_21	+998909000000	ru	\N	\N	\N	2020-08-11 09:08:40.009409
202265412	Фарида	\N	998998501808	ru	\N	\N	\N	2020-09-19 10:40:47.556669
202624021	Рамиль	\N	998909623532	ru	\N	\N	\N	2020-08-05 09:00:07.19255
204273908	Юлиана	\N	998974404023	ru	\N	\N	\N	2020-09-07 05:33:18.548336
205090328	Dilnoza	balubabalu_biyyabiy_batuba	998998931671	uz	\N	\N	\N	2020-08-12 09:26:18.875393
206093155	Anvar	\N	998998327576	ru	\N	\N	\N	2020-08-24 11:03:32.160496
207522298	Азиз	Azimov_Aziz	998909347044	uz	\N	\N	\N	2020-08-25 12:42:49.434081
207581149	Sadulla	AKRAMOVSN	998977440222	uz	\N	\N	\N	2020-08-10 13:50:25.146418
208659570	Shahnoza	shahnozahamroyeva	998935371129	uz	\N	\N	\N	2020-08-22 14:39:23.800044
214725095	Munisa	\N	+998909223556	uz	\N	\N	\N	2020-08-24 07:35:11.358528
215853129	дилдора	\N	998998562929	uz	\N	\N	\N	2020-08-20 03:15:53.608328
216422834	Сарвар	s_madaminov	998909749977	ru	\N	\N	\N	2020-08-11 11:33:18.584198
217114784	Shahnoza	shahnoziiikk	998977030932	uz	\N	\N	\N	2020-09-14 11:56:41.512621
220461404	Madina	\N	998909442181	ru	\N	\N	\N	2020-09-06 09:20:27.972789
221034074	Бекзод	bebebet	998974472608	ru	\N	\N	\N	2020-09-03 19:10:03.392551
221631579	Vladimir	Khvangene	998974248380	ru	\N	\N	\N	2020-08-22 11:12:47.001331
221645692	Jasur	JYu29	998935922903	ru	\N	\N	\N	2020-09-20 11:43:40.741912
222177303	Ergashev Bobur	\N	+998909102756	uz	\N	\N	\N	2020-09-14 07:49:50.991849
222470719	Nigora	\N	998977600030	uz	\N	\N	\N	2020-08-15 14:23:55.691558
230268999	Ahmadjon	\N	998998999955	uz	\N	\N	\N	2020-08-11 11:41:28.206591
231448569	Otabek	\N	998909404098	uz	\N	\N	\N	2020-08-11 11:51:47.02209
231463850	Шухрат	\N	998977378804	ru	\N	\N	\N	2020-08-16 14:09:59.240404
231919458	Ozoda	\N	998977643388	uz	\N	\N	\N	2020-09-07 09:44:40.378494
232258718	Мухлиса	abdugaffarova_m	998998000452	ru	\N	\N	\N	2020-09-23 09:26:26.933962
236710001	Akbar	xojiakbar_n	998974644447	ru	\N	\N	\N	2020-08-12 10:08:13.063768
236903502	Aziza	AzizaFarhodova	998944053132	uz	\N	\N	\N	2020-08-14 15:13:53.461473
237340668	Dildora	\N	998909552122	uz	\N	\N	\N	2020-08-17 06:50:39.990243
239823149	Malika	umidovaa_m	998903180446	uz	\N	\N	\N	2020-08-16 09:07:08.239099
240363837	Doniyor	Zayd_88	998998003233	uz	\N	\N	\N	2020-09-21 12:32:27.515644
241393794	Mansurjon	MansurjonLG	998946182738	uz	\N	\N	\N	2020-09-26 04:24:24.994953
242029554	Yusuf	yusuf_okhunjonov	998994892101	uz	\N	\N	\N	2020-09-14 08:30:45.423307
242747382	S	bintu_rosul	998903525525	ru	\N	\N	\N	2020-08-09 12:27:58.488812
244763372	Дилфуза	\N	998977491449	ru	\N	\N	\N	2020-08-15 11:46:11.383649
245329864	Дилноза	\N	998935223344	ru	\N	\N	\N	2020-08-12 14:56:25.142707
245603132	sardor	sareekc	998991009450	uz	\N	\N	\N	2020-09-06 11:39:29.331322
247103580	Abdullox	A19575	998998759575	uz	\N	\N	\N	2020-08-12 20:00:19.491696
247260510	Mary	\N	998990125023	ru	\N	\N	\N	2020-08-23 17:38:55.855678
247868320	Shomansurxon	ShozakirOff	998877041211	uz	\N	\N	\N	2020-09-21 15:47:21.521212
249576911	Шахзод	\N	998977350384	uz	\N	\N	\N	2020-08-09 16:31:27.337693
251840924	Шахзода	Vanellope7	998995351769	ru	\N	\N	\N	2020-09-09 04:05:25.848586
252370547	Umida Tulaganova	UmidaKamron	998977621513	uz	\N	\N	\N	2020-09-01 11:18:11.152323
252895698	+998977627781	\N	998977627781	ru	\N	\N	\N	2020-08-09 03:07:41.2736
253894186	Зарина	Dil_Zar	998998600044	uz	\N	\N	\N	2020-08-10 10:13:03.332114
254184003	Gulrux	Shukurova_Gulrux	+998998353883	uz	\N	\N	\N	2020-09-03 12:06:07.147525
254906589	Gavhar	Gavhar97	998977626068	ru	\N	\N	\N	2020-09-09 21:10:12.601
255465159	Алекс	sunnydrop	998977292493	ru	\N	\N	\N	2020-08-13 09:47:04.258739
255643719	Elena	Sallen_1808	998999164999	ru	\N	\N	\N	2020-08-18 16:08:19.403266
258742903	Муборак	ismailovamubi	99897 4120440	ru	\N	\N	\N	2020-09-17 17:10:46.761516
259442603	Шахло	AbdukadirovaShahlo_1	+998998454575	ru	\N	\N	\N	2020-08-12 11:36:17.370104
260429456	Диля	\N	998901215554	ru	\N	\N	\N	2020-09-07 10:41:23.419966
261342879	Jovohir	\N	998983078281	uz	\N	\N	\N	2020-09-02 15:34:59.567715
261667586	Nazokat	nna_757	998974002580	uz	\N	\N	\N	2020-08-26 09:29:21.662073
261831727	Бахром	\N	998903236627	ru	\N	\N	\N	2020-08-09 14:36:55.668862
262302725	Yulduz	NazarovaY	998974437334	uz	\N	\N	\N	2020-08-09 19:40:48.271674
264184824	Елена	Helena_Yak	998903241035	ru	\N	\N	\N	2020-08-16 13:53:03.797621
265550912	Бехзод	Bekhzodjaan	998977587212	ru	\N	\N	\N	2020-08-09 12:38:41.318669
265642927	Nargiza	\N	998901787900	ru	\N	\N	\N	2020-09-21 13:02:42.256482
265772264	Комила	Komila73	998977510011	ru	\N	\N	\N	2020-08-29 10:24:55.854184
268018976	Дурдона	durdonashod	998915342330	ru	\N	\N	\N	2020-09-09 11:06:09.696501
269353106	Sardor	\N	998983620346	uz	\N	\N	\N	2020-08-12 07:35:15.262338
269861608	Акрамжон	akram_john	998999908066	ru	\N	\N	\N	2020-08-09 14:31:20.382301
273528409	Павел	\N	998935706785	ru	\N	\N	\N	2020-08-09 07:21:22.789073
274348443	Mohinur	\N	998903180447	uz	\N	\N	\N	2020-08-10 09:57:14.688524
275034089	Ибрагим	Ibragim_abdusamatov01	998900030131	ru	\N	\N	\N	2020-09-06 14:35:50.671478
275298034	Risha	Rrrishaa	998977206040	ru	\N	\N	\N	2020-09-19 13:38:17.363671
275312221	Abdulazizkhan	khan_I3	998946543070	uz	\N	\N	\N	2020-08-18 05:56:55.316704
277023102	Шахзода	Shazoshka	998935342314	ru	\N	\N	\N	2020-08-30 17:38:37.2224
277458432	Сардор	acm92	998903538151	ru	\N	\N	\N	2020-08-10 10:36:18.599233
277745212	Мария	MagenTri1310	998903498626	ru	\N	\N	\N	2020-09-06 17:35:08.347861
280232257	Миржалол	SouL_Kitchenn	+998909794733	ru	\N	\N	\N	2020-08-30 17:54:05.992782
280568429	Oybek	\N	998946091010	uz	\N	\N	\N	2020-08-10 04:35:29.803184
282068243	Bahrom	ifor_parfums	998909969338	ru	\N	\N	\N	2020-08-28 16:59:13.484871
284886975	Ilyos	\N	998903599353	uz	\N	\N	\N	2020-09-02 14:52:07.902256
285376202	Noiba	\N	998903558834	uz	\N	\N	\N	2020-09-08 14:00:36.077374
288721209	Karomat	Murodaliyeva	998998887672	uz	\N	\N	\N	2020-09-06 20:17:59.382652
289608102	Мадина	Daniyarovna_M	998977191281	ru	\N	\N	\N	2020-09-23 07:35:31.155663
290155336	Асадбек	asad_ks	998977081007	ru	\N	\N	\N	2020-08-09 19:03:14.162394
290469875	Muhabbat	\N	998974401144	uz	\N	\N	\N	2020-09-04 06:37:30.749146
295396198	Жасур	jasur_b1	+998917870303	uz	\N	\N	\N	2020-08-31 11:39:04.880498
298441765	Шахноза	\N	998977489800	ru	\N	\N	\N	2020-09-06 11:07:22.867543
299491470	Komola	\N	998998002750	uz	\N	\N	\N	2020-09-07 13:22:57.577386
301386661	Komoliddin	komol89	998998117038	ru	\N	\N	\N	2020-08-09 15:37:35.005736
301631812	Сардор	sardor_017	998971004737	ru	\N	\N	\N	2020-09-04 10:09:38.989464
301895461	998935851818	Barsaaaaaal	998935851818	ru	\N	\N	\N	2020-08-11 04:21:55.959732
302616358	Begzod	\N	998998033535	uz	\N	\N	\N	2020-08-10 18:58:35.435268
304331745	Tölqin	Abduvakhobovich	+998973303434	uz	\N	\N	\N	2020-08-25 06:36:12.845167
304399344	Raima	Raima_99	998998991208	ru	\N	\N	\N	2020-08-13 15:42:49.627989
304969301	Shuxrat	Shux1312	998998159999	uz	\N	\N	\N	2020-08-12 09:27:54.715342
305319455	Альбина	\N	998977740146	ru	\N	\N	\N	2020-08-09 14:49:33.152804
305452661	Shahnoza	\N	+998993060640	uz	\N	\N	\N	2020-09-17 09:36:31.064423
305737609	Бехруз	Behruz_akh	998909020373	ru	\N	\N	\N	2020-08-09 14:42:43.268623
307311604	Екатерина	kate_thouresen	998998327549	ru	\N	\N	\N	2020-09-17 14:42:52.57769
309267023	Мадхия	\N	998998988070	ru	\N	\N	\N	2020-08-22 14:44:49.274046
311304724	Robiya	\N	998909980502	ru	\N	\N	\N	2020-08-15 06:04:09.027824
311723796	Jorullox	\N	998998886617	uz	\N	\N	\N	2020-08-05 19:25:47.266473
312452547	Saida	\N	998977644191	uz	\N	\N	\N	2020-09-01 08:19:23.853193
314090824	Nazokat	Abidovna_96	998946566646	ru	\N	\N	\N	2020-09-06 15:41:52.942791
314188521	Javohir	\N	998909666605	uz	\N	\N	\N	2020-09-14 06:49:13.012072
314601227	Ziyoda	Ziyodakhonnn	998998503108	uz	\N	\N	\N	2020-08-20 08:10:12.713538
318499019	Ала	Asdfhrwe	998998224503	ru	\N	\N	\N	2020-08-12 09:16:45.551798
321654067	Jasmin	Mira595	+998998687868	ru	\N	\N	\N	2020-08-10 04:06:25.553198
322180616	Sarvinoz	sarvinoz11	998974349411	uz	\N	\N	\N	2020-09-19 11:35:07.25301
322524870	Shoxrux	MAMARASULOVSHOXRUX	998993771555	ru	\N	\N	\N	2020-09-08 11:52:40.123022
322923514	Ulugbek	Z7777ZZZZ	+998935695794	uz	\N	\N	\N	2020-09-08 09:23:35.816491
324260934	Дил	Dilmurod_Tulyaganov	998901144106	ru	\N	\N	\N	2020-08-09 12:45:13.139273
324502573	Aziz	zidimon1717	998998831994	uz	\N	\N	\N	2020-08-09 18:45:18.179096
325312623	Xikmattilla	X_Xikmattilla	+998990100098	uz	\N	\N	\N	2020-08-14 05:43:18.964201
325931323	Azamat Talipov	\N	998909877080	uz	\N	\N	\N	2020-08-09 16:08:27.968383
326694372	Александра	lashes_aleksiya	998909406436	ru	\N	\N	\N	2020-08-11 08:13:22.161519
326739104	Juratxoja	juratxoja	998935695556	uz	\N	\N	\N	2020-08-14 15:31:38.836807
327658966	абдуллох	ffrayer	998998627347	ru	\N	\N	\N	2020-08-11 04:44:11.453836
328904278	Ислом	James_CoIe	998977432755	ru	\N	\N	\N	2020-09-12 18:46:19.708176
330605486	Нодиржон	Nodirjon_96	998911921272	ru	\N	\N	\N	2020-08-09 13:03:31.578055
330704912	Азиза	\N	998903717123	ru	\N	\N	\N	2020-08-12 08:28:48.875817
331338712	Hsss	abdslv	998977371998	ru	\N	\N	\N	2020-08-11 13:40:43.041068
332569044	998974459282	\N	998974459282	ru	\N	\N	\N	2020-08-27 12:40:38.277418
334091517	комил	kzakhidov	998903275050	uz	\N	\N	\N	2020-09-16 17:24:38.481361
334372411	Шоазиз	shopulatovs	998983373755	uz	\N	\N	\N	2020-08-30 11:48:22.256666
335796350	Ziyo'viddin	\N	998935999956	uz	\N	\N	\N	2020-08-31 11:49:21.747294
336199578	Камронбеу	rkama_018	998974477779	ru	\N	\N	\N	2020-09-06 11:43:06.184585
336886195	Murod	\N	998977173004	uz	\N	\N	\N	2020-08-09 13:00:17.077124
341746147	Любовь	\N	998900157020	ru	\N	\N	\N	2020-08-10 12:02:51.104215
342217193	Sitora	\N	998903323314	ru	\N	\N	\N	2020-09-09 15:26:53.668762
343748933	Dilmurod	\N	998977407704	ru	\N	\N	\N	2020-09-07 00:08:55.094048
344471826	Sora	\N	998909106087	ru	\N	\N	\N	2020-09-08 07:23:20.840214
344753329	Наталья	Kinder_Natalya	998998428047	ru	\N	\N	\N	2020-09-05 14:35:38.64329
345122778	Шерзод	Murod0234	998988120234	uz	\N	\N	\N	2020-09-11 16:52:56.952436
346621489	+998970013010	madomee	998935409324	ru	\N	\N	\N	2020-08-17 16:26:15.237815
347095851	Komolxoja	KomolxojaSaidakbarov	998998661566	uz	\N	\N	\N	2020-08-12 06:12:55.500143
350858796	Владимир	nnnnaf	998909039266	ru	\N	\N	\N	2020-08-09 19:16:34.418661
351264292	Dilfuza	Dil899	998998996988	ru	\N	\N	\N	2020-09-06 15:38:19.722419
354406284	Зухра	\N	998909434693	ru	\N	\N	\N	2020-08-09 10:55:10.627074
358476336	Akmal	akma1chek	998998562959	ru	\N	\N	\N	2020-08-09 12:59:52.588466
360449283	Ziyoda	\N	+998911669940	uz	\N	\N	\N	2020-08-11 18:16:54.223798
361634380	Карина	soldatova98	+998903715227	ru	\N	\N	\N	2020-08-16 10:33:20.379698
362012047	Roza	Di_fl	998974774835	ru	\N	\N	\N	2020-08-31 03:13:40.619993
362508112	Lobar	\N	998971314943	ru	\N	\N	\N	2020-08-14 09:39:40.534184
362508771	Sahxnoza	\N	998933787136	ru	\N	\N	\N	2020-08-13 15:44:17.613103
365948595	Fotima	Fotimaaxon	998998992525	uz	\N	\N	\N	2020-09-24 17:13:45.181755
366163369	Abbos	\N	998998487377	uz	\N	\N	\N	2020-09-06 14:26:28.855862
366988420	Искандер	\N	998990337020	ru	\N	\N	\N	2020-09-16 20:55:47.970737
368090022	Mohira	\N	998909370587	uz	\N	\N	\N	2020-08-25 10:50:59.614615
369245025	Абдулазиз	Abdulaziz77	998977719000	ru	\N	\N	\N	2020-08-30 12:40:58.736016
370388307	Цой Ольга	\N	998998994208	ru	\N	\N	\N	2020-08-20 13:54:30.430601
373712050	Хумаюн	huma_hodjahanov	998973301212	ru	\N	\N	\N	2020-08-30 16:54:58.233558
373792706	Sora	\N	998909721115	uz	\N	\N	\N	2020-09-09 06:15:52.747084
374539657	Камола	Kamolazafarova	998903530018	ru	\N	\N	\N	2020-08-21 09:26:52.643632
377397458	Shaxnoza	\N	998903483354	uz	\N	\N	\N	2020-09-07 05:39:40.333933
377770554	Рухсора	\N	998909082554	ru	\N	\N	\N	2020-08-10 10:50:54.786563
377810048	Gulsara	Alhamdulillah_75	998977608695	uz	\N	\N	\N	2020-08-19 16:39:55.938747
378811112	Abdulloh	muslim4355	998935454355	uz	\N	\N	\N	2020-09-14 08:52:40.60544
379239413	А	shtadm	998903163160	ru	\N	\N	\N	2020-08-12 08:38:27.365558
380961009	Диля	coldlikeice	+998935711384	ru	\N	\N	\N	2020-09-21 11:35:04.895913
382231184	Мафтуна	akhatovam	998909556900	ru	\N	\N	\N	2020-09-22 18:18:43.204924
384450944	Шохсанам	\N	998973429119	ru	\N	\N	\N	2020-09-05 14:46:47.937746
384966694	Xojiakbar	Kadirov_4929	998946284929	uz	\N	\N	\N	2020-09-07 19:55:36.481917
385268473	Муниса	\N	+998997856359	uz	\N	\N	\N	2020-09-03 13:08:54.98827
386783578	Shodiya	Shodiyaxon1993	998909727289	uz	\N	\N	\N	2020-09-08 10:54:12.32276
386919230	Розалией	\N	998977088213	ru	\N	\N	\N	2020-08-27 08:13:10.559686
390517197	Анастасия	popova_anastasiia	998998601857	ru	\N	\N	\N	2020-09-07 05:58:01.04804
390852170	Назокат	\N	998977409242	ru	\N	\N	\N	2020-09-06 09:52:52.410669
392120312	Komil	kadirov_8100	998909528100	uz	\N	\N	\N	2020-08-28 00:31:20.801587
393631379	Abdumannop	\N	998977744624	uz	\N	\N	\N	2020-08-10 09:09:26.528849
397308874	Abdulaziz	AbdulazizNazrullayev	998990703899	uz	\N	\N	\N	2020-08-30 19:16:16.751146
397910414	Русалина	aidaabasova	998935880119	ru	\N	\N	\N	2020-08-17 18:12:43.141658
398161966	NG	\N	998909552823	ru	\N	\N	\N	2020-08-23 13:42:09.783827
398191053	Xusnora	\N	998911663223	uz	\N	\N	\N	2020-08-16 07:06:18.940049
398435795	Omina	\N	998911631985	uz	\N	\N	\N	2020-09-08 07:46:33.223633
400133491	Мукаддам	khaydarova7	998905451777	ru	\N	\N	\N	2020-08-24 08:42:35.302513
402911500	Habiba	Kxamidova701	998998279347	uz	\N	\N	\N	2020-09-02 06:06:27.621351
409844579	Lobar	lobar_muxiddinova	998998557005	uz	\N	\N	\N	2020-08-21 15:55:35.477278
410587771	Да	\N	998946939000	ru	\N	\N	\N	2020-08-08 18:07:46.861383
411268426	Mukhammadjon	MukhammadJhon	998974776041	uz	\N	\N	\N	2020-08-09 15:13:46.099517
412065784	Farzona	\N	998909196864	uz	\N	\N	\N	2020-09-01 15:27:48.921956
412843983	Комилжон	\N	998935042220	ru	\N	\N	\N	2020-09-18 09:34:08.525902
413272482	Abduhakim	Iloveallahandmuhammad	998933970255	uz	\N	\N	\N	2020-09-13 15:53:56.592109
417500559	Ленара	\N	+998974709403	ru	\N	\N	\N	2020-08-11 04:17:36.671195
419397254	Murodil	admiin9090	998944639090	ru	\N	\N	\N	2020-09-06 15:58:09.971542
421955254	Александра	kim_aleksiya	79967424887	ru	\N	\N	\N	2020-08-11 08:09:51.418058
423343055	Sitora	sitoraix	998911636462	ru	\N	\N	\N	2020-09-09 16:46:46.116439
423420660	Sanjar	sanjarakooo	998933869627	uz	\N	\N	\N	2020-09-08 04:12:43.127205
423785687	Komola	\N	998974448350	uz	\N	\N	\N	2020-08-10 11:22:06.148534
423925390	Guzal	\N	998901683220	ru	\N	\N	\N	2020-08-30 15:37:44.835086
424255768	Камола	\N	998998241542	uz	\N	\N	\N	2020-08-30 18:50:47.801313
425938857	Shoh	ShM6A	998903461696	ru	\N	\N	\N	2020-09-15 05:47:34.644072
426028131	Комрон	TemirovK	998911906462	uz	\N	\N	\N	2020-08-10 04:54:30.226412
426786594	Fazilat	a_f_a2002	998903978855	uz	\N	\N	\N	2020-09-26 09:12:58.20474
430040542	Севара	firuzovna_01	998946091216	ru	\N	\N	\N	2020-09-06 13:57:46.250095
430924505	+998998428884	\N	998998428884	ru	\N	\N	\N	2020-08-31 08:44:14.355169
431976116	+998977050504	sultonov_022	998977050504	uz	\N	\N	\N	2020-08-10 10:17:06.966629
432901480	Яна	Alex_diehard	998994399570	ru	\N	\N	\N	2020-09-03 14:28:55.069602
434359629	Asal	asal_xon	998935192800	uz	\N	\N	\N	2020-09-04 10:36:22.974284
434675053	Sitora Shaxobiddinova	\N	998907888552	uz	\N	\N	\N	2020-08-09 10:43:23.042205
437349810	Nodira	\N	+998933847675	uz	\N	\N	\N	2020-09-20 11:09:01.475989
438723745	Nozima	Ramizovna_N	998977361251	uz	\N	\N	\N	2020-09-23 09:57:01.008058
440069331	Елизавета	ruli13	998977536044	ru	\N	\N	\N	2020-09-06 19:05:10.025891
440142534	Mirkomil	ManUnited1151	+998977111151	uz	\N	\N	\N	2020-08-31 13:27:10.541132
440945087	Dilshod	\N	998998700339	uz	\N	\N	\N	2020-08-09 19:30:25.920796
441382397	Shahzoda	shvzo	998903292111	ru	\N	\N	\N	2020-08-27 02:41:51.369731
441966978	Abdurashid	abdurashid_nizamov	998946193535	uz	\N	\N	\N	2020-09-20 06:49:43.755953
442592456	Сардор	SGDS90	998998006415	ru	\N	\N	\N	2020-09-10 03:31:32.172707
444630177	Аюб	ayub_isroilov	998998694410	ru	\N	\N	\N	2020-09-13 18:56:56.272041
446146970	Камила	\N	998909198303	ru	\N	\N	\N	2020-08-24 06:22:29.381954
446478820	Madina	\N	998998897212	uz	\N	\N	\N	2020-08-18 07:54:32.285112
446792260	Афзал	\N	998931875566	ru	\N	\N	\N	2020-08-09 22:54:13.113932
449962536	Abdulboqiy	Abdulboq1y	998916803257	uz	\N	\N	\N	2020-08-10 05:45:04.138924
450116018	Abu	abdullo1919	998997285976	uz	\N	\N	\N	2020-09-14 07:10:20.636678
450672763	Hussein	\N	998977562020	uz	\N	\N	\N	2020-09-12 14:31:28.380645
450691492	Aziza	\N	998911364701	uz	\N	\N	\N	2020-08-21 18:41:04.513445
450791988	Mohira	\N	998903516997	uz	\N	\N	\N	2020-08-09 09:35:54.901746
451095612	Фатима	patyfa1	998998844994	ru	\N	\N	\N	2020-08-31 15:17:16.374063
452225498	hilola	\N	998977524387	uz	\N	\N	\N	2020-09-07 08:24:03.727792
452478942	Sanam	\N	998977666446	ru	\N	\N	\N	2020-09-07 19:47:02.82052
454260042	Azizbek Khaydarov	\N	998997201320	ru	\N	\N	\N	2020-09-14 14:46:11.272266
455747753	Лобархон	\N	+998990044049	ru	\N	\N	\N	2020-09-25 17:13:10.568759
456096813	Сабина	sabikamilovna_3003	998901789944	ru	\N	\N	\N	2020-08-20 09:57:48.670182
456547805	Юлия	\N	998909593993	ru	\N	\N	\N	2020-08-10 13:35:41.124222
457688828	Хумоюг	ibragimov_x911	998998995161	ru	\N	\N	\N	2020-08-23 13:52:19.697782
458600651	Doston	TTT008	998978313333	ru	\N	\N	\N	2020-09-02 17:06:35.209383
458865556	Madina	BintuMubin	998977431102	ru	\N	\N	\N	2020-09-08 14:30:08.4767
460553863	Azimjon + 998998403731	\N	998998403731	uz	\N	\N	\N	2020-08-09 14:48:03.081536
461303523	Мария	mariaclassy	998998719838	ru	\N	\N	\N	2020-08-16 12:43:19.002249
461492450	Abdulvahhob	\N	998981777781	uz	\N	\N	\N	2020-09-03 03:46:48.96448
461824401	Iroda	amina_xo	+998935303030	uz	\N	\N	\N	2020-08-18 10:48:48.445182
462699805	Dilnoza	d_mirkomilova	998998379965	uz	\N	\N	\N	2020-09-07 15:48:51.491678
463621855	Madina	bahadir_talibnazarov	998946470030	uz	\N	\N	\N	2020-08-31 10:24:48.236812
464117397	Burhon	\N	998998678822	ru	\N	\N	\N	2020-09-06 06:47:19.790193
464358955	Javohir	Javohir060	998906800305	uz	\N	\N	\N	2020-09-06 12:51:48.519863
465563942	Abdurazzoq	\N	998983696090	uz	\N	\N	\N	2020-08-09 12:51:00.682197
465632014	Abdulqodir	Nvrbckdown	+998909643469	ru	\N	\N	\N	2020-08-18 10:19:58.514696
466083330	Mukaram	\N	998977693669	uz	\N	\N	\N	2020-08-09 18:16:01.776518
468580284	Fayzullo	\N	998935999552	uz	\N	\N	\N	2020-08-10 07:13:13.391343
469203864	Шахзода	MufazzalKhanim	998909250742	ru	\N	\N	\N	2020-09-16 05:13:22.292006
469492761	Shaxrizoda	\N	998973440036	ru	\N	\N	\N	2020-08-12 14:55:57.853806
473416257	Дмитрий	\N	998935157629	ru	\N	\N	\N	2020-08-23 18:55:45.386168
473593032	Islom	umarov_36	998909163336	ru	\N	\N	\N	2020-08-09 12:21:15.85556
474394698	Kamola	\N	998998147727	ru	\N	\N	\N	2020-08-12 07:04:51.028795
475877782	Музаффар	\N	998998281200	uz	\N	\N	\N	2020-08-22 18:47:14.847141
477383270	Barno	\N	998903180429	uz	\N	\N	\N	2020-08-16 09:11:55.816894
477831574	Нигина	niginapirnazarova	998935860199	uz	\N	\N	\N	2020-09-07 04:08:38.862117
480558355	+998907888656	\N	+998907888656	ru	\N	\N	\N	2020-08-09 09:04:46.195495
482181034	Nodira	\N	+998946758180	uz	\N	\N	\N	2020-08-09 18:38:03.733592
483404120	Durdona	\N	998909040757	ru	\N	\N	\N	2020-08-08 11:35:03.443019
484035007	Fotima	\N	998998957974	uz	\N	\N	\N	2020-08-09 20:15:45.225098
488279533	Munisa	Imona2427	998977448224	uz	\N	\N	\N	2020-08-31 09:29:14.597064
488987326	Behzod Shovkatov	showcatoff	998977111155	uz	\N	\N	\N	2020-08-20 12:22:17.360948
492678504	Висола	\N	998974484478	ru	\N	\N	\N	2020-08-15 10:57:56.681362
494387375	Zamira	\N	998998470013	ru	\N	\N	\N	2020-08-14 10:27:11.886111
495508670	Mushtariy	\N	998909460087	uz	\N	\N	\N	2020-08-08 16:34:43.459608
496181524	Ziyodbek	Ziyodbek_502	998977742220	uz	\N	\N	\N	2020-08-10 03:48:38.278885
496518276	Надира	nadira_u	998944157777	ru	\N	\N	\N	2020-08-24 15:42:03.608422
496834329	Nozima	\N	998998822112	uz	\N	\N	\N	2020-08-12 19:26:59.692404
497007594	/stop	Khasan002	998946650099	uz	\N	\N	\N	2020-08-30 13:41:10.99993
501223854	Nigina	\N	99897 423 24 53	uz	\N	\N	\N	2020-09-20 19:09:52.523784
501558319	Музаффар	mirjavkharov_m	998977702428	uz	\N	\N	\N	2020-08-18 12:42:37.335645
501872869	Сабина	Sabina8925	998998165235	ru	\N	\N	\N	2020-08-25 16:29:01.092407
504935200	Бекзод	\N	998909351313	ru	\N	\N	\N	2020-09-13 16:51:04.879805
506343357	Jahongir	\N	998997107171	uz	\N	\N	\N	2020-08-09 10:34:07.343191
506526099	Sobir	china_exx	998998484424	uz	\N	\N	\N	2020-08-09 12:28:25.279226
508052768	Zaynabxon	Tyalyulyu	998931643030	uz	\N	\N	\N	2020-09-17 15:25:36.8224
508270977	Милана	\N	998990551525	ru	\N	\N	\N	2020-09-10 13:52:04.251755
508311259	Feruza	NasirovaFeruza	998977188282	ru	\N	\N	\N	2020-09-06 08:52:38.252016
508483061	Муниса	\N	998935576676	ru	\N	\N	\N	2020-08-17 13:10:10.885351
510982455	Азиза	\N	998977770722	ru	\N	\N	\N	2020-08-11 06:26:51.113454
511774034	Madina	silion79	998903508501	uz	\N	\N	\N	2020-08-14 17:40:30.481136
513226655	Севара	justseva	998946957500	ru	\N	\N	\N	2020-09-25 05:53:53.958581
514537465	Omina	\N	998946374020	uz	\N	\N	\N	2020-09-09 17:39:24.089088
515253189	Adnona	\N	998999022444	uz	\N	\N	\N	2020-09-09 09:43:56.349817
515588435	/start	om1ji	998974504074	ru	\N	\N	\N	2020-09-07 12:50:45.679359
516611361	Nigora	\N	998909180109	uz	\N	\N	\N	2020-09-01 01:35:43.484182
517545777	Шохсанам Ибрагимова	IbrakhimovaSh	+998903382818	ru	\N	\N	\N	2020-08-31 15:33:56.642988
518109259	Анвар	anvarmirza	998909272673	ru	\N	\N	\N	2020-08-01 10:32:34.36056
518973604	Ali	blum_uzb	998909996875	uz	\N	\N	\N	2020-08-09 13:04:17.668158
520644391	Malika	\N	998903165002	uz	\N	\N	\N	2020-08-22 17:47:14.760921
523948893	Õğiloy	doctor_Muxtorovna	998909331739	uz	\N	\N	\N	2020-08-21 10:25:09.370185
527341100	Мафтуна	\N	998974103320	ru	\N	\N	\N	2020-08-09 18:30:26.081765
527608137	Abdumajid	Abdumajiddd	998977753443	uz	\N	\N	\N	2020-09-07 14:23:27.265987
527679356	Erkin	\N	998998456637	uz	\N	\N	\N	2020-09-14 04:23:23.846736
528110896	Samira	samirattsh	998933947788	ru	\N	\N	\N	2020-08-12 12:37:36.304102
529196795	Саид	saidmakhsudov	998998033030	uz	\N	\N	\N	2020-08-10 09:01:11.611508
529907638	Dilnoza	dilnozik1195	998998993883	ru	\N	\N	\N	2020-09-06 16:06:50.169553
530406280	Мафтуна	maftuna_raimova	998971014952	ru	\N	\N	\N	2020-08-23 14:58:34.079967
530633196	Javokhir	javokh_r	998935459205	uz	\N	\N	\N	2020-09-19 12:33:29.672344
531378611	Dilmurod	\N	998994612314	uz	\N	\N	\N	2020-08-10 12:28:44.199794
533631673	Асаль	solyamarmeladova	998977175117	ru	\N	\N	\N	2020-08-12 10:04:48.837071
537476034	Robiya	\N	998933957945	uz	\N	\N	\N	2020-09-08 21:29:32.118091
540768474	H	absolutely_zer0	998909529450	ru	\N	\N	\N	2020-08-10 07:24:15.541409
540898999	Abdulla	AAA_00777	998998426863	uz	\N	\N	\N	2020-09-19 16:23:50.020508
541997393	Egamberdiyeva Mohira	egamberdiyeva23	998998390968	uz	\N	\N	\N	2020-08-08 16:06:30.087522
542633266	Элёр	Elyor667	998946672567	uz	\N	\N	\N	2020-08-11 12:47:18.594292
542918091	Муродов	Bosya123	998973300063	ru	\N	\N	\N	2020-09-14 01:48:40.87517
544101535	Iskander	\N	998909533333	ru	\N	\N	\N	2020-09-08 11:51:41.20777
544860987	Muborak	\N	998911361612	uz	\N	\N	\N	2020-08-30 15:25:16.986744
544917517	Ziyovuddin	\N	998909722228	uz	\N	\N	\N	2020-09-16 04:25:04.530259
547812824	Кабулов Сардор	Kabulov282	998998660145	ru	\N	\N	\N	2020-09-15 03:44:32.519685
548728892	Mohinur	\N	998974801898	uz	\N	\N	\N	2020-09-06 11:30:49.757076
548868952	Ziyoda	khaydaraliyeva_z	998997893103	ru	\N	\N	\N	2020-09-19 05:27:06.530275
551748698	Азиза	azizakhmedova	998935784901	ru	\N	\N	\N	2020-08-16 22:11:06.972254
552045600	Камола	\N	998909486779	ru	\N	\N	\N	2020-08-22 14:00:08.903107
553130550	Maya	\N	+998946335776	uz	\N	\N	\N	2020-09-03 20:42:49.776734
555299026	Dono	\N	998908080154	ru	\N	\N	\N	2020-09-09 08:37:46.247311
556542829	Shakhzod	shakhzod01011	998972996226	uz	\N	\N	\N	2020-09-06 18:42:46.380928
557457484	Гузаль	\N	998977818570	ru	\N	\N	\N	2020-09-06 19:00:03.747092
559484236	Nilufar	\N	998977111859	uz	\N	\N	\N	2020-08-20 05:43:51.600922
559896280	Iroda	\N	998977340650	uz	\N	\N	\N	2020-09-08 18:02:46.1059
560230167	+998933552997	miraclemarvel	998915425550	uz	\N	\N	\N	2020-09-14 08:35:06.792734
560404568	Islom	islom_dobri	998998183761	uz	\N	\N	\N	2020-08-09 19:17:27.798987
561069037	Sirojiddin	\N	998974704333	uz	\N	\N	\N	2020-08-09 13:23:50.016066
561378253	Элина	elina_reed	998909789886	ru	\N	\N	\N	2020-09-08 14:07:48.471666
561976955	Doniyor	\N	998911655588	uz	\N	\N	\N	2020-08-22 13:59:03.735938
563706045	Utkir	\N	998977504535	ru	\N	\N	\N	2020-09-17 16:48:12.614327
563982823	Dilafruz	\N	998977606881	uz	\N	\N	\N	2020-08-14 11:48:04.570202
563992255	Barno	\N	998998477232	uz	\N	\N	\N	2020-09-08 18:07:35.106803
564143933	Abdulla	\N	998977557488	uz	\N	\N	\N	2020-08-11 11:32:16.753478
564698869	Анастасия	Anabet4	998990175071	ru	\N	\N	\N	2020-08-16 05:42:14.732746
564790333	Fotima	\N	998977700669	uz	\N	\N	\N	2020-08-31 09:17:12.895799
565484896	Гульноза	gsmileg	998974121270	ru	\N	\N	\N	2020-08-14 11:49:57.422387
565597810	Sardorbek	\N	998998007117	ru	\N	\N	\N	2020-09-15 06:02:20.577516
566263979	Нигора	\N	998903721978	ru	\N	\N	\N	2020-09-16 17:58:41.485724
567412915	Dilfuza	Dilfuzichka94	998909482665	uz	\N	\N	\N	2020-09-04 09:30:29.169199
567624539	Shorasul	\N	998946789787	uz	\N	\N	\N	2020-08-14 13:46:05.049274
568320617	Gulnoza	Kinderka_G	998977807758	uz	\N	\N	\N	2020-08-17 20:00:56.428375
569096814	Shermuhammad	shermuhammad01	998998210860	uz	\N	\N	\N	2020-09-22 08:42:29.796053
569175251	Jasur	apasniy_01	+998996462829	uz	\N	\N	\N	2020-08-09 20:17:26.285051
570176396	Bekzod	\N	998900004447	uz	\N	\N	\N	2020-08-29 18:31:50.590447
570637885	M	\N	998901597117	uz	\N	\N	\N	2020-09-11 15:43:12.856116
571940102	Bobur	bobsnn	+998993080002	uz	\N	\N	\N	2020-08-09 12:30:16.134203
571977469	Akbar	Xurshidakhan	998946542221	uz	\N	\N	\N	2020-08-12 09:51:26.806627
572139262	Василя	GorbVasilya	+998977760765	ru	\N	\N	\N	2020-08-12 11:37:50.160164
572612279	Usmon Olimjonov	Olimjonov_2	998908057777	ru	\N	\N	\N	2020-09-11 15:28:56.728432
572829455	Miraziz	\N	998909479720	uz	\N	\N	\N	2020-09-25 06:25:34.516195
573317968	Мадина	gaybullaevam	998998738055	ru	\N	\N	\N	2020-08-14 05:26:58.65199
573604337	Habibulloh	\N	998933948988	uz	\N	\N	\N	2020-08-13 10:24:44.920764
575408119	Elmira	elmira_nazimova	998998038460	ru	\N	\N	\N	2020-08-28 15:18:41.496453
575455290	Umida	\N	998998481555	uz	\N	\N	\N	2020-09-23 11:04:44.620185
575941499	G'ulomxo'ja	khujayev_g	998935405577	uz	\N	\N	\N	2020-08-10 08:31:05.199996
577092273	Лола	queen19992	998998688869	ru	\N	\N	\N	2020-08-10 13:35:28.267237
577477454	Uchqun	fatkhullayev_u	998909269466	uz	\N	\N	\N	2020-08-09 17:01:22.501042
577885219	Nodira	\N	+998994899891	uz	\N	\N	\N	2020-09-15 13:53:36.010959
579328987	Lobar	\N	998903735577	ru	\N	\N	\N	2020-09-20 06:17:56.317373
580327136	Самира	syama_06	998998896648	ru	\N	\N	\N	2020-08-26 06:45:41.220455
581378616	Asila	Oyposhaxon	998903177185	uz	\N	\N	\N	2020-09-13 17:33:37.392429
584066859	Shoxrux	Shoxrux_701	998944747007	uz	\N	\N	\N	2020-08-15 09:12:07.678656
585822551	Dildora	\N	+998977039307	uz	\N	\N	\N	2020-09-18 11:43:08.976597
586359485	Baxtiyor	Baxtiyor_1999	998990994554	ru	\N	\N	\N	2020-08-12 19:19:40.88956
590751141	Насимов Жовидхон	NJSH_2004	998901766740	ru	\N	\N	\N	2020-08-09 14:36:07.918009
591094948	+998903302255	\N	998903302255	ru	\N	\N	\N	2020-09-06 09:21:20.211347
591789426	Malika	\N	998900041202	ru	\N	\N	\N	2020-08-27 20:35:13.274042
592847796	Диер	Onajonimm_jannatimmm	+998946377323	ru	\N	\N	\N	2020-08-09 20:24:27.440763
593004307	Gulhayo	\N	998909210032	uz	\N	\N	\N	2020-08-21 00:45:28.913226
593664713	Мумин	\N	998917700077	uz	\N	\N	\N	2020-08-30 20:32:31.248872
600433169	Ситора	\N	998977257991	ru	\N	\N	\N	2020-08-09 08:26:19.813672
601555248	Axmedova Xurshida	\N	998949345555	uz	\N	\N	\N	2020-09-23 05:42:26.633327
601871763	Murodjon	\N	998998446306	uz	\N	\N	\N	2020-08-26 18:14:41.725354
604787539	Mashxud	\N	998997926773	uz	\N	\N	\N	2020-09-13 10:34:59.012138
606087376	Umida	\N	998909391030	uz	\N	\N	\N	2020-09-02 08:30:14.596398
606574614	Дилором	Dilichka_dm	998974335885	ru	\N	\N	\N	2020-09-08 16:15:57.014338
606723736	998005507	\N	998998005507	ru	\N	\N	\N	2020-08-10 00:26:07.870048
606755954	Farangiz	zxcvbn29	+998903167708	uz	\N	\N	\N	2020-08-09 06:23:37.670597
606829571	Gayrat	al1mardonoff	998998099098	uz	\N	\N	\N	2020-09-13 15:28:45.018511
611336665	Дурдона	\N	998900342421	uz	\N	\N	\N	2020-09-08 18:42:55.533856
612518382	Будур	budur1999	+998944199552	ru	\N	\N	\N	2020-08-10 17:00:06.98511
612886413	Назокат	Nazokat_brend	998973301808	uz	\N	\N	\N	2020-08-09 15:38:17.203385
613589872	Мухиддин	mproduz	998999015238	uz	\N	\N	\N	2020-08-09 19:01:52.508694
615011731	Javohir	Javakhir_95	998998554778	uz	\N	\N	\N	2020-08-09 13:07:48.468777
615138015	Muxlisa	Jodugaar	998935724042	ru	\N	\N	\N	2020-09-08 04:15:40.661309
615910111	Munavar	\N	998974212882	uz	\N	\N	\N	2020-08-14 03:29:11.601258
616840140	Санжар	\N	99899 8868252	ru	\N	\N	\N	2020-08-27 16:06:16.17131
616846661	Komila	\N	998909298973	uz	\N	\N	\N	2020-09-17 07:39:37.688347
618036796	Ibrohim	\N	998908066122	uz	\N	\N	\N	2020-09-18 18:06:25.797632
618102499	Aziza	Aziza_Italy	998998440852	uz	\N	\N	\N	2020-08-23 12:33:58.62256
619459485	Умида	Umi2117	998996967316	ru	\N	\N	\N	2020-09-16 16:41:33.528843
620170238	Nargiza	osiyobutik7777	998974197777	uz	\N	\N	\N	2020-09-25 05:28:04.656249
622920664	Humoyun	\N	998974346010	uz	\N	\N	\N	2020-08-10 17:10:02.597329
623501868	936050000	dm_m1	+998936050000	ru	\N	\N	\N	2020-08-29 07:04:56.07574
624007320	+998911660200	far1za_d	+998911660200	ru	\N	\N	\N	2020-09-06 11:41:44.739126
624421518	Fotima	\N	998994878302	uz	\N	\N	\N	2020-09-21 10:15:38.635758
625299884	Kamola	KamillaAdmin	998977809356	ru	\N	\N	\N	2020-09-07 11:14:34.275719
627705619	Лилия	\N	998935708608	ru	\N	\N	\N	2020-09-10 12:31:03.56524
627856592	Елена	\N	998997971501	ru	\N	\N	\N	2020-09-25 18:17:22.590273
628662870	Laziza	\N	+998903581802	uz	\N	\N	\N	2020-08-05 17:06:55.394755
630485513	Mehribonu	MehribonuHamid	998946882059	uz	\N	\N	\N	2020-09-10 05:57:11.365418
631270439	Elyor	Khudaykulovvv220	998974071234	uz	\N	\N	\N	2020-08-10 10:37:30.578788
631602425	977112010	kamilovna_1606	998977112010	ru	\N	\N	\N	2020-08-09 13:18:30.643621
631766780	Nazokat	Djuraeva_N_I	998909962562	ru	\N	\N	\N	2020-08-09 11:00:01.522195
631909445	Gullola	gulolaslog	998997907400	uz	\N	\N	\N	2020-08-14 11:15:44.3567
632119349	Mahzuna	Makhzun	998946302524	uz	\N	\N	\N	2020-09-06 06:41:15.669329
633288098	Сирожиддин	\N	998974009909	ru	\N	\N	\N	2020-08-11 12:29:12.812724
633826806	Халиса	\N	998974333363	ru	\N	\N	\N	2020-09-04 00:50:19.913971
633950582	Madina	\N	998908053338	uz	\N	\N	\N	2020-08-19 10:50:08.208979
635083348	Feride	FerideBassaeva	998993227544	ru	\N	\N	\N	2020-08-09 10:32:20.468096
635453650	Zuhra	makhamadjanovaz	+998901850989	uz	\N	\N	\N	2020-09-24 13:24:42.594929
635655596	Дильноза	Cheriiiish	998977077633	ru	\N	\N	\N	2020-08-12 08:12:18.020479
637455300	Хуснора	Khus_k	998909222611	ru	\N	\N	\N	2020-08-12 14:03:07.014644
637691381	/	n9n1n5	998909390085	ru	\N	\N	\N	2020-09-06 07:56:13.775724
639321249	Bahtigul	ShaMaYuZuDaRB	998909443854	uz	\N	\N	\N	2020-09-18 13:27:33.874523
639336999	Гузаля	ggg_mm23	998909796408	ru	\N	\N	\N	2020-08-12 07:18:06.35929
639840492	Shuhrat	kasimovss	+998971010714	ru	\N	\N	\N	2020-08-25 05:54:12.804934
640035490	Alibek	\N	998995550202	ru	\N	\N	\N	2020-09-26 02:12:15.359883
640666162	Дилдора	\N	998977009192	uz	\N	\N	\N	2020-08-26 08:25:30.203425
642332509	Zilola	\N	998990877812	uz	\N	\N	\N	2020-08-25 21:33:57.8872
643675650	Камилахон	Ka_mila_xon	998908067922	ru	\N	\N	\N	2020-08-13 04:49:58.126907
644115580	998027006	\N	998998027006	ru	\N	\N	\N	2020-09-06 12:29:50.28719
644947405	Zulxumor	\N	998998744171	uz	\N	\N	\N	2020-08-29 04:57:22.229955
646076328	Sevara	ffaeva	998977519619	ru	\N	\N	\N	2020-09-12 15:07:10.901884
646166685	+998909993788	\N	998909993788	ru	\N	\N	\N	2020-08-09 15:20:59.1201
646731445	Sevara	sevaraa_00	998998283634	ru	\N	\N	\N	2020-08-23 18:01:24.946952
647323874	Хонзода	\N	998900023008	ru	\N	\N	\N	2020-09-06 20:10:44.716414
648550857	Iroda	Saidalieva_i	998977020990	uz	\N	\N	\N	2020-09-20 10:28:33.420912
650797819	Nilufar	\N	998977126779	uz	\N	\N	\N	2020-08-26 11:12:10.64976
651124733	Abror	\N	998973491008	uz	\N	\N	\N	2020-08-10 11:42:00.648505
651356202	Ксения	Ksyushelya	998998305106	ru	\N	\N	\N	2020-08-09 13:46:11.425906
651880188	998994406616	adiba_12	998994406616	ru	\N	\N	\N	2020-08-31 05:13:27.085314
652479438	Бахром	\N	998998518998	ru	\N	\N	\N	2020-08-27 03:28:56.407232
652482995	Shox	shox_5977	998900140550	uz	\N	\N	\N	2020-08-16 17:58:20.097798
653609321	Асаль	asalyakennedy	998977322290	ru	\N	\N	\N	2020-08-09 11:28:38.086789
654417280	Mushtariy	\N	998983647777	uz	\N	\N	\N	2020-08-10 19:42:42.027937
654822497	Odiljon	odiljohns	998935181893	uz	\N	\N	\N	2020-08-09 14:57:13.116797
655138385	Bahodir	\N	998946902622	ru	\N	\N	\N	2020-08-30 08:19:36.769196
655293277	Rustam	\N	998997211821	uz	\N	\N	\N	2020-09-14 13:02:11.293707
656045062	Aзим	\N	998946638575	ru	\N	\N	\N	2020-08-09 14:29:38.479834
657451036	Отабек	simply_shredded7	998900123403	ru	\N	\N	\N	2020-09-13 22:01:34.914473
658055554	кукумбер	\N	821077271902	ru	\N	\N	\N	2020-08-13 14:39:05.80833
658505102	Dilzoda	dindin80_19	998998782869	uz	\N	\N	\N	2020-09-08 14:10:46.188595
659047681	Наргиза	\N	998977410072	uz	\N	\N	\N	2020-09-18 14:03:59.794057
659363183	Davron	Davron_090	998983690140	uz	\N	\N	\N	2020-08-09 13:09:41.27684
659577046	назокат	bakhromava	998993050177	ru	\N	\N	\N	2020-08-25 11:20:42.398496
659696908	Sara	\N	998909446166	uz	\N	\N	\N	2020-08-30 15:55:00.965675
659909758	Сохиб	alimbekov	998983692110	uz	\N	\N	\N	2020-08-19 08:46:11.436668
660681091	Shirin	farzonam_00	998990027717	uz	\N	\N	\N	2020-09-10 05:26:18.345275
662031674	Muslima	\N	998933858117	uz	\N	\N	\N	2020-09-25 04:29:48.883039
662808794	Суннатилло	booklife_uzz	998911917781	ru	\N	\N	\N	2020-09-10 07:18:41.093476
663049866	Shexzede	shexzede	998998680397	ru	\N	\N	\N	2020-09-08 16:05:44.136758
665298910	Shodiya	Renesmee_s	998990275840	uz	\N	\N	\N	2020-08-10 07:58:06.936735
666192848	Ziyoda	ziyodaz	998998575885	ru	\N	\N	\N	2020-08-10 13:37:13.029552
666407236	Dildora	\N	998977143940	uz	\N	\N	\N	2020-08-09 14:36:10.582512
667027966	Javlon	iJavlon	998988098089	uz	\N	\N	\N	2020-08-09 12:38:57.469702
667195561	Madina	Milasaa	998946354567	uz	\N	\N	\N	2020-08-09 14:59:44.864936
667214956	Sirojiddin	\N	+998998748482	uz	\N	\N	\N	2020-09-08 10:02:19.297154
667500129	Muslim	o1_jalolov_m	998997215099	ru	\N	\N	\N	2020-09-14 08:32:38.270059
668096114	Муниса	munisa1920	998901349451	ru	\N	\N	\N	2020-09-22 16:50:17.193419
668260833	Nodira	\N	998935718488	uz	\N	\N	\N	2020-09-26 05:33:28.465612
668359712	Iroda	\N	+998977239515	uz	\N	\N	\N	2020-08-11 08:50:12.961581
669734439	Mohinur	\N	998903941234	uz	\N	\N	\N	2020-08-24 09:28:22.587395
670818614	Mohinur	mohinur_akramovna	998998522938	uz	\N	\N	\N	2020-08-17 16:07:45.903511
671390463	Abdulaziz	\N	998909374331	uz	\N	\N	\N	2020-08-17 16:43:41.037624
671664786	Zilola	\N	998935296655	uz	\N	\N	\N	2020-08-30 18:47:59.594329
672244132	Roza	Gevorkyan_Roza	998935479099	ru	\N	\N	\N	2020-08-09 10:51:55.033933
672850186	Азиза	azizamirobidova	998973330855	ru	\N	\N	\N	2020-08-20 12:51:17.542661
673142023	Парвина	Salon2447	+998998792447	ru	\N	\N	\N	2020-09-07 13:37:43.076515
673638771	Ravshan	Ravshanrma	998977600407	uz	\N	\N	\N	2020-09-23 18:13:33.783199
674437582	Diyora	\N	+998903562831	uz	\N	\N	\N	2020-08-12 07:07:18.830948
674603502	Alex	alexdispatch	998951695023	ru	\N	\N	\N	2020-09-18 16:42:55.996193
676274917	990040888	\N	998990040888	ru	\N	\N	\N	2020-08-18 07:46:53.477079
677139217	Yulduz	yuwki	998930039999	ru	\N	\N	\N	2020-08-10 11:45:49.156701
677384149	Ziyoda	z_alimjanova	998977636609	uz	\N	\N	\N	2020-09-14 09:29:47.633321
678059737	Abror	abror_nasimov	998975351111	uz	\N	\N	\N	2020-09-13 22:03:02.415035
678754067	Fayzullo	Samiyusuf_0	998946322874	uz	\N	\N	\N	2020-09-14 09:50:19.173335
678806736	Komola	\N	998903710742	ru	\N	\N	\N	2020-09-07 17:13:41.790219
679850172	Abbos	Waxsultan	+998983671771	uz	\N	\N	\N	2020-08-10 10:55:27.229195
680245424	Samiya	\N	998993154475	uz	\N	\N	\N	2020-09-23 16:02:07.758195
681419070	Нодира	adm_joynamooz	998909151984	ru	\N	\N	\N	2020-09-06 13:54:43.13769
685247013	Севара	Sevara_Vision	998971560691	uz	\N	\N	\N	2020-09-09 19:50:54.373699
686385782	Luiza	\N	998935817809	ru	\N	\N	\N	2020-08-18 09:21:03.681993
686636762	991111779	khursh1d_01	998991111779	uz	\N	\N	\N	2020-08-12 20:59:32.205157
688702356	umida	umi2930	+998909712930	uz	\N	\N	\N	2020-08-09 15:55:57.460697
689548859	Saboxat	SNsinner	998908067275	uz	\N	\N	\N	2020-08-14 14:14:50.505285
691188321	Ильдар	Miruqi	998909126680	ru	\N	\N	\N	2020-08-12 12:08:09.121746
691523464	Nargiza	\N	998990330539	uz	\N	\N	\N	2020-08-21 11:19:18.017904
692411174	islam	Islam_0703	998903928001	uz	\N	\N	\N	2020-09-14 12:37:04.827851
692775649	Мафтун	mftn23	998909566733	ru	\N	\N	\N	2020-08-17 23:46:13.15316
692829189	Nilufar	\N	998909462175	ru	\N	\N	\N	2020-08-14 12:14:19.805484
693529029	Тимур	sherliev077	+998990827170	ru	\N	\N	\N	2020-09-22 17:37:44.999073
693962405	Мадина	madi_ka07	998971432181	ru	\N	\N	\N	2020-08-24 05:40:06.796813
695440843	𝑀𝑜ℎ𝑖𝑟𝑎	mahish_ka	998935132627	uz	\N	\N	\N	2020-08-14 17:44:36.661283
699649299	Durdona	\N	998998869529	uz	\N	\N	\N	2020-08-10 10:22:04.999696
700371950	Аля	\N	998977835773	ru	\N	\N	\N	2020-08-21 13:35:45.077583
701385488	Farangiz	\N	998911650130	ru	\N	\N	\N	2020-08-31 08:42:58.177908
702261039	Madina	\N	998977094000	uz	\N	\N	\N	2020-08-10 10:09:22.968302
702318126	Нисошка	\N	998998325686	ru	\N	\N	\N	2020-08-10 11:41:07.659596
702379930	ibrohim	therealikh	998909267969	uz	\N	\N	\N	2020-09-03 16:22:43.918017
704337795	Nozima	\N	998944105050	uz	\N	\N	\N	2020-09-08 10:44:20.904347
704488465	Iroda	irodakhon12	998974490337	uz	\N	\N	\N	2020-08-30 16:44:38.961607
706641206	Тимур	timuuur17	998909433090	ru	\N	\N	\N	2020-08-31 02:43:50.517583
706844800	Shahnoza	\N	998946815137	uz	\N	\N	\N	2020-09-07 07:02:03.43319
707246645	Хилола	\N	998974440207	ru	\N	\N	\N	2020-08-10 13:43:51.39249
707877840	Nonni	iymanka17	+998974021700	ru	\N	\N	\N	2020-09-16 14:01:19.363743
709630605	Mubina	\N	998977706634	uz	\N	\N	\N	2020-09-16 15:42:30.255113
710425535	Ameen	\N	+998998919199	uz	\N	\N	\N	2020-09-07 16:17:53.312866
711946568	Iqbola	\N	998999912725	uz	\N	\N	\N	2020-08-19 07:10:47.184444
712076972	Nigina	\N	998915570100	uz	\N	\N	\N	2020-08-21 09:52:48.704577
714275948	Диера	\N	998998418555	ru	\N	\N	\N	2020-08-31 13:11:14.072425
714383063	Malika	\N	998993003344	uz	\N	\N	\N	2020-08-09 20:28:20.457911
715443541	Mubina	Sultankhudjaeva_m	998998575000	ru	\N	\N	\N	2020-09-25 08:39:34.417821
716391294	Xojimurod	Xojimurod_Anvarov	998977602056	uz	\N	\N	\N	2020-08-09 12:26:23.793871
716443347	Gulnoza	\N	998946652010	uz	\N	\N	\N	2020-09-11 09:09:02.746051
716800695	Mirafzal	\N	998996018660	ru	\N	\N	\N	2020-08-09 14:53:05.208687
717212945	Елена	\N	+998993152507	ru	\N	\N	\N	2020-09-06 12:30:05.549125
717403243	Умида	\N	998977300931	uz	\N	\N	\N	2020-09-07 15:03:25.087159
717716757	Xabibulloh	\N	+998935154436	uz	\N	\N	\N	2020-09-13 14:53:18.06025
718605731	Madina	Mbas2013	998946887688	uz	\N	\N	\N	2020-08-09 05:22:42.845393
718764491	Бунёд	bunyod0777	998914333334	ru	\N	\N	\N	2020-09-22 16:10:32.011575
719428576	Dilbahor	Dilbahor_designer	998901136706	uz	\N	\N	\N	2020-09-25 17:34:58.845429
719801646	Anora	ShaxinaUz	998998113230	uz	\N	\N	\N	2020-08-10 09:15:20.276596
720191394	Muslima	M_sadikovaa	998909688694	uz	\N	\N	\N	2020-09-08 06:21:46.812338
720736753	Bahodir	\N	998901856762	ru	\N	\N	\N	2020-08-19 10:06:34.909321
720850407	Махмуда	\N	998977217151	uz	\N	\N	\N	2020-08-26 07:12:22.10658
723186466	Komola	\N	998935777015	uz	\N	\N	\N	2020-08-10 16:39:22.739431
723207829	Aziza	Ilkh_aziza	998946547115	uz	\N	\N	\N	2020-08-25 14:51:40.171808
723515670	Adkins	Marjona_KIA	998997267735	uz	\N	\N	\N	2020-08-30 18:40:55.921637
723814434	Xafixa	\N	998990055757	uz	\N	\N	\N	2020-09-25 08:35:47.293209
725156955	/start	\N	998977113550	uz	\N	\N	\N	2020-08-17 14:41:31.521427
725743074	Malika	Doctor_malika_1102	998900321319	uz	\N	\N	\N	2020-09-07 20:07:20.196324
725926695	Умар	\N	998909747863	ru	\N	\N	\N	2020-08-27 05:36:56.014008
726614016	Мухаммад Нодирбек	\N	998911370999	ru	\N	\N	\N	2020-08-11 11:31:56.080408
727149537	Дилшод	\N	998977073303	ru	\N	\N	\N	2020-09-17 14:03:06.865081
727436743	Зайниддин	Rakhimoff_officia1	+998909326700	uz	\N	\N	\N	2020-09-06 12:16:25.2131
727654769	Maftuna	\N	998998677927	uz	\N	\N	\N	2020-09-06 03:27:33.095475
728577333	бехзод	husenov24_07	998937042407	uz	\N	\N	\N	2020-08-10 09:43:38.296881
728862754	Нодира	\N	998935294487	ru	\N	\N	\N	2020-08-09 10:18:28.195825
728991993	Nazokat	Abdumajidovaa	998909251349	uz	\N	\N	\N	2020-09-07 08:50:42.753425
732088389	Yo'ldasheva nargiza	\N	998998548873	uz	\N	\N	\N	2020-08-09 11:18:17.823204
732551848	Фазилат	\N	998911363312	ru	\N	\N	\N	2020-09-08 17:21:30.008663
737441695	Шахзода	Parizoda_B	998901957772	uz	\N	\N	\N	2020-08-27 03:21:02.716307
740680204	Зилола	Makhmudkhodjayeva	998935786611	ru	\N	\N	\N	2020-08-09 14:30:40.743898
740767373	Saboxat	\N	998935091609	uz	\N	\N	\N	2020-09-25 13:37:30.999281
742736529	Turg'unova Shahrizoda	Turgunoffa	998991012210	uz	\N	\N	\N	2020-08-20 15:26:14.802482
742888841	Oybek	\N	998909180208	uz	\N	\N	\N	2020-09-19 18:31:35.444488
743979450	Sharifa	\N	+998935722638	ru	\N	\N	\N	2020-08-13 08:52:43.797457
745458462	Саодат	saodaaathon	998990717771	ru	\N	\N	\N	2020-08-23 13:19:42.222437
746677319	Ziyoda	\N	998998676069	ru	\N	\N	\N	2020-08-10 06:37:31.881
748127078	Холида	fx_sw	998999721185	ru	\N	\N	\N	2020-09-06 07:45:23.172057
748518352	Mohira	Akhmatova_1909	+998935525528	uz	\N	\N	\N	2020-08-09 19:19:30.230939
749653497	Abdulloh	\N	998946409195	uz	\N	\N	\N	2020-08-11 08:08:27.705639
752483774	Islom	jaxongirovich_i	998909054692	uz	\N	\N	\N	2020-09-15 04:01:01.346061
752552796	Sitora	\N	998977233939	ru	\N	\N	\N	2020-09-07 09:33:38.690352
752800438	Ойбек	\N	998909795754	ru	\N	\N	\N	2020-08-19 15:56:14.786591
752969327	Madina	medinakhan1777	998900245554	uz	\N	\N	\N	2020-09-16 04:18:26.384278
755156814	Амалия	\N	998909726298	ru	\N	\N	\N	2020-09-07 15:20:56.724312
756087107	Элина	SeoLina10	998909533177	ru	\N	\N	\N	2020-09-06 13:51:52.685588
756100813	Шахноза	\N	998941013003	uz	\N	\N	\N	2020-09-14 09:23:02.752885
758259026	Xvc	yorkinovich	447748250478	ru	\N	\N	\N	2020-09-18 14:48:40.846257
758349942	/	\N	998901300700	ru	\N	\N	\N	2020-08-20 08:10:45.25243
758668569	Дениель	L_4D4N	79151316839	ru	\N	\N	\N	2020-08-28 23:09:52.942349
759376289	madina	\N	998974405839	uz	\N	\N	\N	2020-09-06 17:10:57.890377
760180776	Азиз	Grand_decor1	998901351935	ru	\N	\N	\N	2020-09-19 12:04:00.875585
760913092	Otabek	TopTextileUzbekistan	998974240226	uz	\N	\N	\N	2020-08-11 14:57:25.817978
761336078	Диляфруз	\N	998935418333	ru	\N	\N	\N	2020-09-04 09:55:16.721251
761488651	Жасмина	rozimova	998974100082	ru	\N	\N	\N	2020-08-31 17:39:32.574029
761640629	DIYORA	Diyorasultonzoda	977730092	ru	\N	\N	\N	2020-08-23 02:58:27.314169
761648316	Siroj	Siroj_700	998909350909	ru	\N	\N	\N	2020-08-10 12:00:32.430255
762992232	Muyassar	\N	998935869639	uz	\N	\N	\N	2020-08-17 15:54:01.134164
763050020	Маша	Kriss_teen1	998998193563	ru	\N	\N	\N	2020-09-08 10:08:08.956445
763359526	Sardor	\N	998997202424	uz	\N	\N	\N	2020-08-13 16:20:49.447247
765178585	Камила	\N	998998828023	ru	\N	\N	\N	2020-09-06 16:06:22.905088
765426842	Диана	gloriya_global	998909680406	ru	\N	\N	\N	2020-08-11 17:26:19.232456
765575907	Мухаммадали	mkhmmd_l	998990276913	uz	\N	\N	\N	2020-09-01 04:34:39.387575
765875620	Xadicha	\N	998935102886	uz	\N	\N	\N	2020-09-08 09:52:21.369253
768609039	Bobur	\N	998998580101	ru	\N	\N	\N	2020-08-14 14:31:16.66338
769157498	xasan	xasan_xoja	998998748575	ru	\N	\N	\N	2020-09-14 05:20:56.184222
769825034	Dilorom	Innatillayevna	998998218596	uz	\N	\N	\N	2020-09-07 06:43:11.191864
770400535	Mirona	\N	998994874757	ru	\N	\N	\N	2020-08-31 08:06:00.219329
771541156	Oybek	\N	998909605700	uz	\N	\N	\N	2020-08-27 16:15:38.334223
771884635	UMA	\N	998998470400	ru	\N	\N	\N	2020-09-10 06:08:25.661945
772047008	Nilufar	Ninishka8787	998909181281	ru	\N	\N	\N	2020-09-08 18:11:17.184739
772152950	Feruza	AFeruzaR99	998998266731	uz	\N	\N	\N	2020-08-26 17:25:43.668076
776576315	Dilmurod	DilmurodUsarov	998911924404	uz	\N	\N	\N	2020-08-09 14:51:59.24024
777960456	Dilshod	ddavronov1	998 97 3444401	ru	\N	\N	\N	2020-08-10 10:01:32.762
778333577	97 722 04 08	Durdona_Vis_ion	998977220408	ru	\N	\N	\N	2020-08-30 11:51:14.777153
779997577	Севара	\N	998901280068	ru	\N	\N	\N	2020-09-23 04:17:43.29911
780236531	Сурайе	SureyaYu	998930062448	ru	\N	\N	\N	2020-08-24 15:39:17.541998
780516835	Лайла	\N	998971575910	ru	\N	\N	\N	2020-08-15 10:51:36.824095
780706549	Gozal	\N	998909049912	uz	\N	\N	\N	2020-08-09 15:47:48.796341
780884856	Marhabo	\N	998974073128	ru	\N	\N	\N	2020-08-15 09:41:36.522239
781396927	Shaxzod	kasimov_sh26	998977730403	ru	\N	\N	\N	2020-09-06 17:46:38.559292
782748337	Надежда	nadievs	998946811405	ru	\N	\N	\N	2020-08-18 07:47:51.588615
783131593	Nuriddinov Javoxir	\N	998990099009	uz	\N	\N	\N	2020-09-11 12:52:14.156684
783851934	Dinara	\N	998909955909	ru	\N	\N	\N	2020-08-09 19:30:07.679401
784566060	Marhabo	\N	998974344405	uz	\N	\N	\N	2020-08-30 11:42:45.000403
785342339	Tohir	\N	998973446200	ru	\N	\N	\N	2020-08-09 15:02:45.368166
786667933	Диана	Lllgd03	998997949813	ru	\N	\N	\N	2020-08-26 14:23:14.401047
786924123	Durdona	saidovadurdona	998935361021	uz	\N	\N	\N	2020-09-25 11:12:10.381165
787596435	Sarvar	lamoreuz	+998990808778	uz	\N	\N	\N	2020-08-23 10:55:25.155621
788978613	Risolat	\N	998933753700	uz	\N	\N	\N	2020-09-24 12:04:28.715905
789034008	Holida	\N	998974458982	uz	\N	\N	\N	2020-08-29 14:52:56.880365
791889437	Mehrinisa	kadirovamekhrinisa	998946972882	uz	\N	\N	\N	2020-08-09 14:49:54.410413
794023379	Samira	samirakhon5358	+998995117999	uz	\N	\N	\N	2020-09-06 17:21:15.825436
794401366	Lazokat	L2112	998999199666	uz	\N	\N	\N	2020-09-11 10:14:00.407777
795587209	Хумора	xomyak16	998993973018	ru	\N	\N	\N	2020-08-21 09:25:46.924907
795612417	/start	\N	998903937177	ru	\N	\N	\N	2020-08-30 20:18:30.554041
796404092	Ziyouddin	Ziyoviness	998908083159	uz	\N	\N	\N	2020-08-10 08:18:12.743298
796590081	Xadicha	\N	998977585055	ru	\N	\N	\N	2020-09-05 12:58:28.446797
797434165	Умидахон	\N	998901169996	ru	\N	\N	\N	2020-08-23 09:29:00.131201
797498546	Siroj	skh001	998911350500	uz	\N	\N	\N	2020-09-25 14:05:32.125267
798737190	Mustafo	Mustaf0_0	998903165181	ru	\N	\N	\N	2020-08-19 09:41:28.995696
798916712	Dilmurod	rashidov1007	+998990701705	uz	\N	\N	\N	2020-08-09 17:17:33.811586
800153901	/	\N	+998907909168	ru	\N	\N	\N	2020-09-07 11:11:02.817823
801784773	Dinara	\N	998903310101	uz	\N	\N	\N	2020-09-08 11:10:45.379093
802009348	Азиза	\N	+998977203061	ru	\N	\N	\N	2020-09-15 07:42:49.125042
802131373	Madina	\N	998998200414	uz	\N	\N	\N	2020-09-07 16:38:03.451512
803282553	Шахзода	\N	998901220303	ru	\N	\N	\N	2020-09-05 11:00:58.493956
804278024	Fotima	chulievaa	+998972454242	uz	\N	\N	\N	2020-08-13 15:14:57.824293
804471084	behruz	bekhruzabdullayev	998981773077	uz	\N	\N	\N	2020-09-23 20:18:31.174228
805112552	Mehribon	Mehribon94	998941255552	uz	\N	\N	\N	2020-08-13 11:55:58.014695
805117559	Zuhraxon	\N	998935555059	ru	\N	\N	\N	2020-08-10 10:22:40.14583
805264003	Мадина	\N	998977394994	ru	\N	\N	\N	2020-09-07 07:48:41.012517
806862192	Бахром	\N	+998935155835	ru	\N	\N	\N	2020-08-09 14:46:00.086343
807087293	Guzal	guzal_jamshidovna	998990008772	ru	\N	\N	\N	2020-08-23 17:56:41.588802
807470310	Beka	bekzodyuldashevb	998998488470	ru	\N	\N	\N	2020-09-13 15:46:11.341774
807905068	Севинч	ev_mad	998935764660	uz	\N	\N	\N	2020-08-16 09:19:29.865916
810592335	Aziza	azizafox	998977036050	ru	\N	\N	\N	2020-09-25 15:42:32.425023
810600005	Эвелина	\N	998974292992	ru	\N	\N	\N	2020-09-16 16:44:43.997485
811532990	+998971464494	asadullaevas	998971464494	ru	\N	\N	\N	2020-08-27 09:05:47.615974
811644356	Bernora	Bellaslifee	998949388748	uz	\N	\N	\N	2020-08-10 15:03:00.896734
812152460	Ирина	\N	998909169218	ru	\N	\N	\N	2020-09-09 13:11:58.013372
812185156	Ibrohim	\N	998999621999	uz	\N	\N	\N	2020-09-25 02:45:57.990472
812881339	Дилноза	\N	998935493033	ru	\N	\N	\N	2020-08-20 13:33:01.864183
813230318	Hamida	\N	998946793343	uz	\N	\N	\N	2020-08-30 21:21:28.4097
813909907	Xamida	\N	998973308891	ru	\N	\N	\N	2020-08-10 03:07:10.500383
815089260	Umida	\N	998998601044	uz	\N	\N	\N	2020-08-25 06:50:55.596491
817028728	iammurodceek	iammurodceek	998946368741	uz	\N	\N	\N	2020-08-10 05:23:45.382059
817653660	Go'zal	dr_Ilhomovna	998946495666	uz	\N	\N	\N	2020-09-06 10:11:21.542834
818011345	Chciv	\N	998998170996	ru	\N	\N	\N	2020-08-21 13:02:39.376514
819477405	Азиза	Ziza013005A	998972603001	uz	\N	\N	\N	2020-09-07 15:06:03.244526
820702784	Диёрбек	Mirjamalov_d	998998406621	ru	\N	\N	\N	2020-09-07 20:53:05.931441
821118523	Камил	KomiL4iK_777	998998755731	ru	\N	\N	\N	2020-09-01 14:46:29.51928
824751079	Muborak	Yuldasheva060304	998990024252	uz	\N	\N	\N	2020-09-26 10:12:28.65883
824768428	Кристина	Kkkkkkkkkkkkkkkkkkkrrrrrrrrrrr	998909716397	ru	\N	\N	\N	2020-08-10 14:18:36.830328
826158104	Саида	\N	998909483808	ru	\N	\N	\N	2020-08-22 16:34:43.561378
828094497	Anvar	\N	998990338881	uz	\N	\N	\N	2020-09-01 06:02:26.690275
829951812	Firuze	\N	998974002666	uz	\N	\N	\N	2020-08-31 07:24:52.385647
830522641	Сарвиноз	sarviinoz	+998930099064	uz	\N	\N	\N	2020-08-09 12:48:27.930194
832244828	Madina	\N	998977089398	uz	\N	\N	\N	2020-09-06 09:06:00.861428
832368004	Сабина	\N	998970071944	ru	\N	\N	\N	2020-09-25 18:48:54.260995
833238280	Камол	\N	998901132246	ru	\N	\N	\N	2020-08-09 20:27:44.262794
834171401	Nazosh	\N	998998851317	uz	\N	\N	\N	2020-08-26 09:43:23.077562
836148285	Рахима	\N	998998397379	ru	\N	\N	\N	2020-08-23 15:24:13.065034
838391996	Muhriddin	Mirzakharimov7	998993950712	uz	\N	\N	\N	2020-08-31 11:35:26.923952
840636543	Фозылбек	\N	998999330043	ru	\N	\N	\N	2020-08-09 16:42:35.335775
841518811	Барно	\N	+998974210080	ru	\N	\N	\N	2020-09-11 13:40:48.852671
841762185	Komiljon	Lexus_001k	998998456911	ru	\N	\N	\N	2020-08-23 13:46:20.481264
841958895	Zilola	\N	998909547108	uz	\N	\N	\N	2020-08-24 03:59:09.370952
842356597	Носирова Мухтарам	nosirovam19	998990398123	ru	\N	\N	\N	2020-09-07 06:52:55.484112
842738606	Валентина	lyalya_e	998935076925	ru	\N	\N	\N	2020-08-12 04:10:08.183016
843119397	Dior	Maxkamov_10	998946368585	uz	\N	\N	\N	2020-09-08 08:34:53.813009
843523805	Robiya	phalenopsiis	998977675005	ru	\N	\N	\N	2020-09-07 10:31:03.225761
844268896	Masuda	za1wa_0303	998933958081	uz	\N	\N	\N	2020-09-07 16:14:14.174651
845212210	Рустам	\N	998977274488	ru	\N	\N	\N	2020-09-04 14:14:55.83963
846768710	Malika	kmalika_handmade	998909003017	ru	\N	\N	\N	2020-08-31 08:08:11.446672
848454748	Sarvinoz	s_khane	998975734434	uz	\N	\N	\N	2020-08-30 15:58:33.147766
848733647	Dilshod	kasimovd_d	998998386444	uz	\N	\N	\N	2020-08-09 13:36:38.000614
851432881	Сохиба	\N	998909088559	ru	\N	\N	\N	2020-08-24 15:21:03.427113
851798115	Samandar	\N	+998977379505	uz	\N	\N	\N	2020-08-30 19:05:30.71018
852216644	Ibrohim +998998767666	\N	998998767667	uz	\N	\N	\N	2020-08-15 10:38:57.0289
853524041	Мирсадулла	justmirka	998998109333	ru	\N	\N	\N	2020-08-09 13:33:09.055279
853545025	+998905010909	baxtik_0909_I_B_M	998905010909	ru	\N	\N	\N	2020-08-14 06:46:22.581462
854969691	Сурайё	\N	998999012862	uz	\N	\N	\N	2020-09-09 06:19:13.195754
856415853	Shohrux	K1NG08	998976155566	uz	\N	\N	\N	2020-09-06 15:28:15.438179
857007257	Maftuna	\N	998903986644	ru	\N	\N	\N	2020-09-16 11:51:28.16693
857840475	Farangiz	\N	998977571705	uz	\N	\N	\N	2020-09-09 08:53:56.583978
859321779	Tillo	DANGER_CAPlTAN	998901668293	uz	\N	\N	\N	2020-08-09 18:19:28.886474
861005517	Миромил Садиков	\N	998946687494	ru	\N	\N	\N	2020-09-10 06:11:03.804743
861840906	Nozima	khalbaeva_n	998915053005	uz	\N	\N	\N	2020-09-06 09:39:24.798733
865492778	Dilim	Kosmetologdilim	+998902337997	uz	\N	\N	\N	2020-08-31 03:34:58.855315
865964924	Fazilat	\N	998977477018	uz	\N	\N	\N	2020-09-03 12:29:08.19578
866103245	Мафтуна	\N	998930044442	uz	\N	\N	\N	2020-09-05 10:40:45.412946
868965093	Sabina	\N	998909633181	ru	\N	\N	\N	2020-08-26 08:11:37.575895
870270310	Visola	\N	998977210798	ru	\N	\N	\N	2020-08-10 04:32:02.045199
870694682	Севара	\N	998990111639	ru	\N	\N	\N	2020-08-18 13:09:58.849045
870740758	Dilnoza	Ninoz_sayfullayeva	998903517119	uz	\N	\N	\N	2020-09-07 18:05:32.829177
871172161	Лайло	spectrophobiaa	998909218798	ru	\N	\N	\N	2020-08-09 12:43:51.056897
873087515	Шахзода	\N	998946595505	ru	\N	\N	\N	2020-08-14 14:17:27.91662
873175522	Guli	\N	998909203780	uz	\N	\N	\N	2020-08-14 07:39:50.790608
873216461	Zilola	\N	998935777774	ru	\N	\N	\N	2020-08-09 14:28:33.004854
873928306	Nozima	\N	998935604311	uz	\N	\N	\N	2020-09-06 18:12:36.864155
875154984	иброхим	ibrokhim73	+998998390205	ru	\N	\N	\N	2020-08-10 06:08:15.847343
875694379	Saida	\N	998946975957	uz	\N	\N	\N	2020-08-20 14:33:17.803512
876153005	Мирдийор	\N	998998786968	ru	\N	\N	\N	2020-09-06 12:23:34.569384
876336921	Камилла	dande_1ion	998909097417	ru	\N	\N	\N	2020-09-07 10:46:30.62739
877081752	Наргиза	\N	998971460077	ru	\N	\N	\N	2020-08-31 13:15:44.841296
877334939	Soliha	\N	998946503430	uz	\N	\N	\N	2020-09-09 12:35:42.000579
877703839	Nilufar	Avazova_N_B	998900072575	uz	\N	\N	\N	2020-08-26 13:51:18.020876
879926986	Камола	\N	998998976715	ru	\N	\N	\N	2020-08-13 12:15:12.131721
880257635	Абдулазиз	abdulaziz_682	998972626229	ru	\N	\N	\N	2020-08-12 10:51:46.907325
881275425	Лолита	Lolitaii98	998900139998	ru	\N	\N	\N	2020-09-17 14:01:39.218841
882207728	Феруза	\N	998946596263	ru	\N	\N	\N	2020-09-08 10:36:25.663763
883094294	Гулрух	\N	998998233991	ru	\N	\N	\N	2020-08-09 11:56:43.124904
883393724	Komola	Komola_9595	998935719955	uz	\N	\N	\N	2020-08-09 11:26:33.430991
884475962	Abrorxon	\N	998981235566	uz	\N	\N	\N	2020-09-17 18:50:45.401392
885917593	Юлдуз	Yulduz_15_06	998997857228	ru	\N	\N	\N	2020-09-13 16:55:00.187078
887721954	Камолиддин	guest_7774	998977727371	ru	\N	\N	\N	2020-08-11 16:14:12.363761
888536136	Adres	Nureke_007	998977740794	uz	\N	\N	\N	2020-09-09 14:58:55.414173
889917708	Rano Samadova	Umarovan_10	998977709335	uz	\N	\N	\N	2020-09-10 10:57:31.650621
891232064	Abduraxmon	\N	998971450770	uz	\N	\N	\N	2020-08-21 09:25:36.774737
892771117	+998931727544	Akbar_04_25	998931727544	ru	\N	\N	\N	2020-08-13 01:58:34.498856
894322458	Jasmina	\N	+998990477614	uz	\N	\N	\N	2020-09-14 13:37:35.707058
895380287	Robiya	\N	998975391500	uz	\N	\N	\N	2020-08-31 08:36:29.416659
896166144	Shoxista	Abralova_sh	998998850703	ru	\N	\N	\N	2020-09-06 14:39:35.129869
897388676	Javohir	ozodovj	998997842499	uz	\N	\N	\N	2020-09-14 03:25:05.759206
897553579	Nilufar	\N	998977777675	uz	\N	\N	\N	2020-09-06 08:12:38.821543
897889378	Mukarrama	\N	998900021112	uz	\N	\N	\N	2020-08-24 07:58:12.325913
898227450	Дилдора	\N	998903572770	uz	\N	\N	\N	2020-09-25 14:08:11.085446
899063503	Kamola	\N	998977547706	uz	\N	\N	\N	2020-09-25 17:39:52.644046
899853592	_sevara_chocoberry	\N	998935285666	uz	\N	\N	\N	2020-08-09 16:15:52.816645
900428242	Sevara	\N	998900000670	uz	\N	\N	\N	2020-08-10 06:51:36.849724
900595486	998999931195	wennill	998999931195	uz	\N	\N	\N	2020-08-09 16:11:41.659627
901677880	Dildora	\N	998946165538	uz	\N	\N	\N	2020-09-16 08:24:21.94748
903060273	Содиков Абдумуталиб Рустамович	sodykovofficial	+998990001822	ru	\N	\N	\N	2020-08-22 15:42:00.027234
904026606	Nargis	farhadovnaaaa	998909307181	uz	\N	\N	\N	2020-08-09 14:40:54.160741
904355339	Abduvaliyeva xadicha	\N	998909933998	uz	\N	\N	\N	2020-09-07 13:51:36.469698
905595505	Iroda	\N	998977289882	uz	\N	\N	\N	2020-08-18 11:17:41.293006
906657907	Шазноз	\N	998909808544	uz	\N	\N	\N	2020-08-30 10:10:45.075163
906899925	M	\N	998900019112	uz	\N	\N	\N	2020-08-31 10:13:54.513542
907083696	Диёра +998930061933	\N	998930061933	ru	\N	\N	\N	2020-09-25 09:08:55.954031
909301600	shahnoza	\N	998990222708	uz	\N	\N	\N	2020-09-25 14:01:54.637313
909550868	Nilufar	\N	998998374114	uz	\N	\N	\N	2020-09-07 06:28:54.540384
909692811	Шоира	\N	998994439948	ru	\N	\N	\N	2020-08-08 18:40:46.178275
910038984	Лайло	\N	998901895618	ru	\N	\N	\N	2020-08-21 20:29:14.856496
910503615	Shahnoza	Shahnoz_N	998998785508	uz	\N	\N	\N	2020-09-20 16:58:43.663025
911035615	Dilafruz	\N	998930098877	uz	\N	\N	\N	2020-09-09 17:01:21.938536
912464405	Севинч	ismoilova_s_t	998909151433	ru	\N	\N	\N	2020-09-08 17:15:55.454064
913487381	Suhrob	\N	998909783366	uz	\N	\N	\N	2020-09-13 16:40:44.059693
913817843	Muqaddas	\N	+998903541775	uz	\N	\N	\N	2020-08-31 13:43:37.120357
914297617	Surayyo	surayyokh	998998934243	uz	\N	\N	\N	2020-09-11 10:44:24.821987
914533356	🇷🇺 Русский	\N	998933784558	ru	\N	\N	\N	2020-09-01 02:13:35.752195
915240198	Toshpulatova Durdona Alijon qizi	\N	998946267016	uz	\N	\N	\N	2020-09-09 10:46:02.78281
915321784	..	\N	998 935688658	uz	\N	\N	\N	2020-08-20 17:24:28.716387
916248341	Аъзам	azam_azka	998998685101	ru	\N	\N	\N	2020-09-06 20:05:21.394211
918344978	Shaxrizoda	shakkhrizade	998935949339	uz	\N	\N	\N	2020-09-20 12:24:33.291467
918556385	Dilnoza	\N	998900048222	ru	\N	\N	\N	2020-09-25 08:59:12.869629
919574915	Robiya	\N	998972689955	uz	\N	\N	\N	2020-08-30 18:12:52.349343
920437686	zulya	\N	998977250007	uz	\N	\N	\N	2020-09-08 18:25:20.290559
924276602	Эъзоза	Guccifloria	998974141757	uz	\N	\N	\N	2020-09-07 12:31:48.427353
925314120	Hamrohon	\N	998977089800	ru	\N	\N	\N	2020-09-09 16:23:23.461093
925618965	Халида	\N	998995125069	ru	\N	\N	\N	2020-09-07 17:07:28.491465
925740928	Maxmuda	\N	998990177008	uz	\N	\N	\N	2020-09-07 13:40:36.634136
927029920	Sevinch	\N	998998101028	uz	\N	\N	\N	2020-08-31 09:56:43.00978
927514821	Munisa	zavkiyevna	+998903319990	ru	\N	\N	\N	2020-08-12 13:19:23.83707
930074438	Диёра	diyorasfood	998930016031	ru	\N	\N	\N	2020-09-06 09:46:04.535747
933810605	Nargiza	\N	998996064183	uz	\N	\N	\N	2020-09-04 10:50:43.122822
936382329	Елена	elena_s18	998903231228	ru	\N	\N	\N	2020-09-09 10:24:36.556832
937159959	Rahmatillo	\N	998976902177	uz	\N	\N	\N	2020-08-24 12:43:22.483935
937855698	Dilafruz	\N	998998338700	uz	\N	\N	\N	2020-09-16 22:21:27.533016
937989651	Заринабону	Undis_on	998912444224	ru	\N	\N	\N	2020-08-10 09:44:03.561072
938866883	Diyora	\N	998998512114	uz	\N	\N	\N	2020-09-21 14:32:17.496446
939384902	Behruz	Behruz_0940	998997100940	uz	\N	\N	\N	2020-08-12 15:29:24.060848
939529716	Diyora	\N	+998995358810	uz	\N	\N	\N	2020-08-10 12:59:38.733417
940936808	Диля	\N	+998974100180	ru	\N	\N	\N	2020-08-30 19:05:51.592474
945874692	Вика	\N	998909385002	ru	\N	\N	\N	2020-09-09 11:54:57.171677
947461081	Shirin	\N	998900264000	uz	\N	\N	\N	2020-08-08 18:29:13.793099
948967286	Нилуфар	Khadiatullaeva	998997200181	ru	\N	\N	\N	2020-08-12 03:23:25.431575
950451962	Dodi	takhirova_dodi	998974205808	uz	\N	\N	\N	2020-09-25 17:00:37.519983
951226883	Мафтуна	maftuw_2220	998994345119	uz	\N	\N	\N	2020-08-31 06:30:46.547544
953426239	Komila	khabibullayevna_k	998998371919	uz	\N	\N	\N	2020-08-12 00:19:59.298639
953803034	Mira	\N	+998903310012	uz	\N	\N	\N	2020-09-20 15:12:52.101454
954113448	Maktuba	Mirsadikova_0310	998977811223	uz	\N	\N	\N	2020-09-09 04:09:14.153615
954632319	Альфия	\N	998913371974	ru	\N	\N	\N	2020-09-08 13:15:41.332878
954765698	Мадина	\N	998977165456	ru	\N	\N	\N	2020-08-30 19:07:21.528505
955289219	София	Sweetybaby7	998902063077	ru	\N	\N	\N	2020-08-27 15:06:39.637963
955591969	.	rayhona_mrr	998909201199	ru	\N	\N	\N	2020-09-07 00:57:37.348673
956039575	Mohinur	lady0427	998998720427	uz	\N	\N	\N	2020-09-01 05:53:31.646462
956244622	Мухаммад	\N	+998990039733	ru	\N	\N	\N	2020-09-09 04:50:21.457328
956517390	Shahzoda	s1ahzoda	998946053722	ru	\N	\N	\N	2020-08-15 13:50:24.930126
957136217	Feruz	Feruza_Shavkatovna	998971353538	uz	\N	\N	\N	2020-08-08 10:48:49.29733
957267123	Zebowka	Zebowka_Sanatova	998994048818	ru	\N	\N	\N	2020-09-07 12:57:56.602789
958096874	Ангелина	\N	998917778947	ru	\N	\N	\N	2020-08-10 10:06:33.107105
958304502	Nodira	\N	998975380107	uz	\N	\N	\N	2020-09-06 20:12:17.785453
958337270	Dilsora	\N	998977514555	uz	\N	\N	\N	2020-09-05 10:43:29.837856
959057583	Mohinur	fayzullayev_na	+998946561726	uz	\N	\N	\N	2020-09-18 14:21:43.686906
959267896	Муня	yarmuny	998998817474	ru	\N	\N	\N	2020-09-26 09:49:57.287695
959457436	Guzal	Shavkatovna_g_s	998977082223	ru	\N	\N	\N	2020-09-17 21:48:49.653568
959832224	Нилюфар	nka26	998930025326	ru	\N	\N	\N	2020-09-26 09:55:02.050891
959932287	Фарзона	bakhadirova_04	998993523157	ru	\N	\N	\N	2020-09-09 06:53:21.852125
962044843	Доник	Donik_SL	998946352809	ru	\N	\N	\N	2020-09-07 11:07:14.32424
962468737	Maftuma	Y_a_p_m	998991234567	uz	\N	\N	\N	2020-08-09 17:47:18.486457
967069147	Feruza	\N	998946502116	uz	\N	\N	\N	2020-09-25 13:50:22.36403
967156349	Shahzoda	\N	998935680214	uz	\N	\N	\N	2020-08-11 07:42:26.746645
967491289	Рустам	Rustamjumabaev	998993011247	ru	\N	\N	\N	2020-08-09 12:35:40.060216
967582045	+998977680508	\N	998977680508	ru	\N	\N	\N	2020-09-09 17:45:24.490229
968650671	Ирода	Iroday	998996650555	ru	\N	\N	\N	2020-09-05 16:40:25.727808
970462037	Хонзода	\N	+998999972612	uz	\N	\N	\N	2020-09-24 17:19:32.512957
971432086	Muhammad	Tilla_110	998996003964	uz	\N	\N	\N	2020-09-01 21:56:01.273363
971901804	Камила	After_311	998990086900	ru	\N	\N	\N	2020-08-16 17:26:04.956564
973984579	/start	\N	998998874911	ru	\N	\N	\N	2020-08-19 15:16:01.236426
974207421	Мохинур	\N	998977211901	ru	\N	\N	\N	2020-09-08 14:01:05.640822
975173304	Erkinov Jafarbek	Erkinoff_J_1	998900147676	uz	\N	\N	\N	2020-09-07 09:17:48.01148
975611798	Мохизар	\N	998975630777	ru	\N	\N	\N	2020-08-07 21:31:27.887824
975830453	Nasiba	\N	+998935431705	uz	\N	\N	\N	2020-08-26 08:40:22.663734
976000999	Joʻrabek	\N	+998901890606	uz	\N	\N	\N	2020-08-13 05:19:07.306171
977716421	Шахсанам	\N	998998585550	ru	\N	\N	\N	2020-08-31 11:30:26.128515
977833110	Шахноза	shmirzarakhimova	998909385818	ru	\N	\N	\N	2020-09-25 14:08:20.661747
977849065	Сагдиана	sagdi_0808	998998820808	ru	\N	\N	\N	2020-09-06 19:20:32.446055
980225110	Parvina	\N	998946041875	uz	\N	\N	\N	2020-08-09 13:16:42.915834
982992930	Ruxsora	\N	998994440616	uz	\N	\N	\N	2020-09-08 20:08:00.929537
983321875	Anvar	\N	+998993052162	uz	\N	\N	\N	2020-09-25 19:38:51.698175
985097565	Muazzam	\N	998998514058	uz	\N	\N	\N	2020-08-31 07:46:14.357554
985300624	+99890 0003088	Year1998	998900003088	ru	\N	\N	\N	2020-08-16 09:49:59.390465
985422184	madina	\N	998996030309	uz	\N	\N	\N	2020-08-09 14:23:32.676377
985851871	Madina	Metrika_uz	998998841402	uz	\N	\N	\N	2020-08-13 05:21:20.888492
987525613	Абдугафур	\N	998930000767	uz	\N	\N	\N	2020-08-09 16:26:51.207216
988329638	Dilnoza	FDARAR	+998996015871	uz	\N	\N	\N	2020-08-30 14:05:48.261545
989852823	Gavhar	rga01	998903935601	uz	\N	\N	\N	2020-09-07 19:01:37.106735
990771229	Rixsiboyeva muslima	\N	998977738997	uz	\N	\N	\N	2020-09-15 10:29:37.859589
991062970	Азиз	\N	998900136507	ru	\N	\N	\N	2020-08-11 07:10:12.550504
991708613	Fazilat	\N	998994447644	uz	\N	\N	\N	2020-08-18 11:50:48.752186
991762328	/start	Miracle1804	998993751804	ru	\N	\N	\N	2020-09-07 06:47:37.119457
991903472	Shoxobiddin	Shaxobiddin_01	998990374979	ru	\N	\N	\N	2020-09-04 09:11:14.652427
991985389	Latofat	\N	998997000079	uz	\N	\N	\N	2020-08-30 16:40:41.657218
992382738	Zilola	febbago01	998998074099	uz	\N	\N	\N	2020-08-10 09:47:51.698135
992456810	Umida	\N	998991013031	uz	\N	\N	\N	2020-08-22 18:54:53.092665
992523723	sabina	sabiiwwm	998900299599	uz	\N	\N	\N	2020-09-25 13:21:21.639696
992586225	Дильбар	\N	998977570032	ru	\N	\N	\N	2020-09-06 07:03:50.278754
992699512	Fazilat	\N	998977701031	uz	\N	\N	\N	2020-09-25 16:47:37.079987
993284807	Dip	Heaven1113	998977744922	uz	\N	\N	\N	2020-09-10 10:01:40.205911
993697778	nilufar	\N	998911953031	uz	\N	\N	\N	2020-09-06 10:55:36.469177
993840177	Saidkomol	\N	998994877747	uz	\N	\N	\N	2020-08-11 02:41:14.909915
994266624	Хумоюн Мирзо	uzb_O11	998903585545	ru	\N	\N	\N	2020-08-12 07:05:58.506506
994383088	Nurilloh	\N	+998974443490	uz	\N	\N	\N	2020-08-13 04:14:31.893454
994665591	muslima	KambarovaM	998909914200	uz	\N	\N	\N	2020-09-11 03:47:41.262021
995016621	madina	\N	998998053836	uz	\N	\N	\N	2020-08-10 09:54:32.010427
996396797	Madina	\N	998946090105	uz	\N	\N	\N	2020-09-17 07:56:37.640305
996558256	Nazokat	\N	998998737717	uz	\N	\N	\N	2020-08-30 16:48:16.764361
997210522	Farangiz	Jakhongirovnaf	998998400059	uz	\N	\N	\N	2020-08-22 15:28:20.891843
997339131	mohıra	\N	998908055111	ru	\N	\N	\N	2020-09-22 15:06:01.255059
998092165	+998997082808	mokhira_g_a	998997082808	ru	\N	\N	\N	2020-08-09 13:48:20.226588
998255889	Hurmatulloh	khabibzade_030	998977277718	uz	\N	\N	\N	2020-08-26 23:58:35.588903
998436613	Xusan	\N	99894 6145614	uz	\N	\N	\N	2020-08-10 13:04:06.131232
998516802	Durdona	\N	998931064141	uz	\N	\N	\N	2020-08-30 12:21:58.647931
998576686	Bochit	Bochit7777	+998977779494	uz	\N	\N	\N	2020-09-07 06:01:00.027774
998871744	Хилола	\N	998990502404	ru	\N	\N	\N	2020-08-13 08:52:18.970088
999270777	Nilufar	\N	998990550378	uz	\N	\N	\N	2020-08-25 05:29:44.678313
999373725	Aziza	azizadjalalova	998998081100	ru	\N	\N	\N	2020-09-11 13:48:02.477907
1000664719	Sevara	k_a_d_i_r_o_v_a	998909244929	uz	\N	\N	\N	2020-09-01 09:04:49.037991
1001511309	Fazliddin	Te_amo_D	998990201718	uz	\N	\N	\N	2020-09-09 09:10:22.956835
1002178100	Aziz	\N	998900247775	ru	\N	\N	\N	2020-08-10 10:13:59.609581
1003798147	Dona	dono_2303	998996065903	ru	\N	\N	\N	2020-09-14 06:51:40.950419
1004586909	Фотима	\N	998911649864	ru	\N	\N	\N	2020-09-19 20:51:52.20371
1004697359	Shahnoza	shahnoza_16	998933956722	ru	\N	\N	\N	2020-09-07 15:08:12.583723
1005127798	Mubina	Gulchehra_X	998971552729	uz	\N	\N	\N	2020-08-13 02:28:31.949355
1007073972	Humora	\N	998909636977	uz	\N	\N	\N	2020-09-07 05:33:55.665035
1007218333	IRODA	anv_i_a	998909573705	uz	\N	\N	\N	2020-08-30 13:15:16.333684
1007351860	Ubaydulla	\N	998999259995	uz	\N	\N	\N	2020-09-14 14:10:01.421972
1007800089	SHAHZODA	\N	998974142080	uz	\N	\N	\N	2020-09-14 18:42:28.591555
1008009206	Ramazon	\N	998990277010	uz	\N	\N	\N	2020-08-09 13:55:19.902506
1008705290	Bodies	\N	998900050030	ru	\N	\N	\N	2020-09-12 15:19:33.662062
1009993361	Саодат	yuldasheva_0110	998974422723	ru	\N	\N	\N	2020-09-04 10:11:11.090259
1009999426	Шохси	Shoxsi_ibragimova	998903369647	uz	\N	\N	\N	2020-09-09 13:51:13.831607
1010290310	Zebuniso	\N	998978578787	uz	\N	\N	\N	2020-08-11 13:27:42.141044
1010655563	Shoxrux	shokhachtoli	998990511511	uz	\N	\N	\N	2020-08-13 08:02:38.065317
1010995803	Shahzoda	\N	+998900045818	uz	\N	\N	\N	2020-09-08 05:04:47.917047
1012433456	Dilya	\N	998998965959	uz	\N	\N	\N	2020-08-09 12:24:38.811931
1013074756	Zulayho	\N	998996378642	uz	\N	\N	\N	2020-09-02 15:01:14.051946
1013688936	sher	yusupoff1sh	998990013116	uz	\N	\N	\N	2020-08-10 15:11:41.99767
1013851175	Nigina	\N	998935330743	uz	\N	\N	\N	2020-08-10 10:46:08.319368
1014315711	Sadirova odina	\N	998977444310	uz	\N	\N	\N	2020-08-18 03:35:39.363278
1014372002	Мадина	chipseeek	998903565412	ru	\N	\N	\N	2020-08-18 09:08:40.050799
1016215074	Yusufjon	MR_VORISOFF	+998977143200	uz	\N	\N	\N	2020-08-09 16:29:58.626497
1017018673	Barno	\N	998977213421	ru	\N	\N	\N	2020-08-22 14:12:20.115642
1018151078	Durdona	\N	998909256006	uz	\N	\N	\N	2020-09-07 19:44:57.074534
1019268191	Диёра	\N	998990081998	ru	\N	\N	\N	2020-08-14 08:15:57.698083
1021601371	Малика	malika314	998977176951	ru	\N	\N	\N	2020-08-02 14:16:23.152941
1021969920	Muratova Gozal	\N	998946896546	ru	\N	\N	\N	2020-09-17 08:38:23.078321
1022476216	Sabina	\N	+998990515205	uz	\N	\N	\N	2020-09-24 05:46:56.809057
1023928779	Дидафруз	\N	998971468777	ru	\N	\N	\N	2020-09-08 15:55:51.897369
1024086866	998946961113	malii707	998946961113	ru	\N	\N	\N	2020-09-18 12:23:40.956642
1024387462	Baron	\N	998977211010	uz	\N	\N	\N	2020-08-12 06:08:54.852891
1024642152	Tojiddin	sodikxodjaev	998973334833	ru	\N	\N	\N	2020-09-16 09:51:17.941272
1025714550	Noila	\N	998909282958	uz	\N	\N	\N	2020-08-09 12:43:09.962266
1026069650	Sevara	\N	998911956988	uz	\N	\N	\N	2020-09-09 08:07:16.034145
1027023420	Mahliyo	Arzon_kosmetik_uz	998993077843	uz	\N	\N	\N	2020-09-13 15:35:55.288953
1027514934	Joziba	j_abdujabborova	998998865921	uz	\N	\N	\N	2020-09-21 17:57:21.336504
1028288652	shahrizoda	\N	998990999616	uz	\N	\N	\N	2020-08-31 06:31:51.963958
1028960510	Нозима	\N	998998829020	uz	\N	\N	\N	2020-08-31 10:44:46.582832
1029442868	Nurullaxojayev otabek	nurullaxojayev_o	998998510104	uz	\N	\N	\N	2020-08-09 17:54:00.146783
1030222628	Feruz	\N	+998993009696	uz	\N	\N	\N	2020-08-21 04:10:55.183353
1031175996	m	\N	998999168455	ru	\N	\N	\N	2020-08-27 18:00:05.137179
1032065627	Shahzodq	\N	998935441498	uz	\N	\N	\N	2020-09-08 08:49:51.024625
1034076869	Abduhamid	rahmonberdiev_a	998977911999	uz	\N	\N	\N	2020-08-12 06:59:45.236826
1034276791	Madina	\N	998971554467	ru	\N	\N	\N	2020-09-12 16:20:36.137913
1035376208	Farangiz	\N	998994814095	uz	\N	\N	\N	2020-08-13 05:39:15.921933
1035845334	Menu	\N	998900134017	ru	\N	\N	\N	2020-09-12 14:10:19.199249
1036959695	Rahima	rahima_vkh	998902000036	uz	\N	\N	\N	2020-09-17 08:26:26.842242
1037938191	Sanjar	\N	998909038686	uz	\N	\N	\N	2020-09-23 15:21:13.104146
1038255611	Ислом	tohirjonov_97	998974010204	ru	\N	\N	\N	2020-08-15 12:28:48.658878
1039490850	Sunnat	annvaroovic	998909003831	uz	\N	\N	\N	2020-09-18 17:45:41.480859
1040882142	Sevara	\N	998977765025	uz	\N	\N	\N	2020-08-30 16:54:17.17147
1042069466	Дилрабо	\N	998900012662	uz	\N	\N	\N	2020-09-07 16:31:09.800825
1042912827	Индира	\N	+998998761370	ru	\N	\N	\N	2020-08-10 05:44:15.954532
1044472599	Юлдуз	dododoyrhw	+998935408017	ru	\N	\N	\N	2020-08-11 09:51:37.324027
1044834717	Комила	M00mmmm	998998100016	ru	\N	\N	\N	2020-09-06 16:09:20.741219
1045047905	Dilrabo	\N	+998946520800	uz	\N	\N	\N	2020-08-26 08:24:44.066408
1045094698	Madina	\N	998993047957	uz	\N	\N	\N	2020-09-08 09:35:05.411876
1046197926	Guli	gulim_lasmaker	998994382299	uz	\N	\N	\N	2020-08-22 11:46:53.634844
1046282459	Abbos	klass_smm	998974093534	ru	\N	\N	\N	2020-09-07 09:38:47.478516
1047062152	Xadicha	gayratova_x	998946754447	uz	\N	\N	\N	2020-08-09 08:13:52.928425
1048196796	A	\N	998946064840	ru	\N	\N	\N	2020-09-21 12:33:37.759374
1053388412	Aziza	\N	998946990000	uz	\N	\N	\N	2020-09-24 18:06:41.825951
1053979100	Николай	\N	998977379329	ru	\N	\N	\N	2020-08-09 13:04:53.597628
1056335829	Шахло	shakhlon18	998971563288	ru	\N	\N	\N	2020-09-14 11:51:22.777513
1057308049	Madina	Arifovna_0301	998973334368	uz	\N	\N	\N	2020-08-11 18:15:38.504423
1058203097	амина	\N	998909882433	ru	\N	\N	\N	2020-09-19 14:20:44.419918
1058910604	Oqila	Oqilaxan	998998066227	uz	\N	\N	\N	2020-09-09 21:50:28.421947
1060229385	Ummu Kulsum	aminufa_uk	998931081750	uz	\N	\N	\N	2020-08-11 08:48:23.880469
1061219663	Robiya	\N	998901204433	uz	\N	\N	\N	2020-09-06 16:51:17.145006
1061997197	Durdona	Durdona_Anvarova	998995323762	uz	\N	\N	\N	2020-09-21 14:38:17.570443
1062140101	Zulfiya	\N	998998270297	uz	\N	\N	\N	2020-08-31 04:42:17.390835
1062619587	sabina	\N	998935955611	uz	\N	\N	\N	2020-08-09 14:34:17.907817
1062793187	Дильноза	D3003Z	998974643730	ru	\N	\N	\N	2020-09-09 05:49:03.877789
1064406105	/start	\N	+998911370999	ru	\N	\N	\N	2020-08-11 11:43:11.45773
1064582215	Shirin	\N	998996136602	uz	\N	\N	\N	2020-08-10 09:48:27.557361
1064667684	Амирхон	amirkhon_s	998981176409	ru	\N	\N	\N	2020-08-09 12:37:43.274248
1065380833	Дарина	\N	998990880945	ru	\N	\N	\N	2020-09-04 10:50:14.671264
1065747543	Komola	\N	998903934474	ru	\N	\N	\N	2020-08-27 16:12:03.803344
1065994783	Afnan	\N	998994415977	uz	\N	\N	\N	2020-08-22 07:10:34.670583
1066852197	Sardor	\N	998990008062	uz	\N	\N	\N	2020-08-26 08:53:14.712378
1067304463	Усмонбек	USM0NBEK	998909545070	uz	\N	\N	\N	2020-08-16 08:44:42.791276
1067308982	Gulnoza	gulnoza_9	998900112121	uz	\N	\N	\N	2020-08-11 06:46:37.62168
1068750372	Korakoz	\N	998998007553	uz	\N	\N	\N	2020-08-30 17:22:35.389314
1069359849	Мансурова Нигина	\N	998333444005	ru	\N	\N	\N	2020-09-25 05:20:05.305439
1071418365	Azizbek	\N	998999010061	uz	\N	\N	\N	2020-09-07 13:39:25.818043
1073531636	/Kamilla	\N	998900176868	ru	\N	\N	\N	2020-09-05 07:12:48.36691
1073541312	Madi	madibsb	998977487747	ru	\N	\N	\N	2020-09-16 17:43:04.543371
1074618010	Dilshod	\N	998998762428	uz	\N	\N	\N	2020-09-07 05:27:28.388837
1075285344	MAFTUNA	\N	998909876899	uz	\N	\N	\N	2020-09-08 19:32:02.020406
1076015131	Mirona	\N	998999014444	ru	\N	\N	\N	2020-08-31 08:07:26.883384
1076835740	Jamoliddin	Jamoliddinxoji97	998887015500	uz	\N	\N	\N	2020-09-09 07:03:05.521379
1077895748	Komila	\N	998990803222	uz	\N	\N	\N	2020-09-11 10:57:10.404089
1079361551	Солиха	\N	998903436066	uz	\N	\N	\N	2020-09-13 15:11:49.011803
1080833725	Камила	\N	998971323340	ru	\N	\N	\N	2020-08-09 21:42:39.79267
1083081438	Azim	\N	+998901252552	uz	\N	\N	\N	2020-08-13 04:20:10.923285
1084116748	Nika	\N	+998998424933	ru	\N	\N	\N	2020-09-25 14:16:09.367725
1084225158	Xumora	Jorayeva_xumora	998935357723	uz	\N	\N	\N	2020-09-21 12:01:21.579071
1086489178	Дильноза	\N	998977579922	ru	\N	\N	\N	2020-08-21 17:40:44.205175
1087703894	E'zoza	\N	998931064671	uz	\N	\N	\N	2020-08-09 22:47:20.752572
1088270118	Mmm	\N	998996904255	uz	\N	\N	\N	2020-08-11 20:58:36.800485
1088286505	Erik	\N	998900001134	uz	\N	\N	\N	2020-09-23 12:51:35.328727
1089781112	Висола	visola1	998904048330	ru	\N	\N	\N	2020-08-19 07:57:27.912704
1091877786	Sevara	\N	998974808218	uz	\N	\N	\N	2020-09-06 15:56:45.668698
1094348301	Nata	\N	998900328001	ru	\N	\N	\N	2020-09-17 16:37:34.66282
1095619607	Камода	\N	998977486779	ru	\N	\N	\N	2020-08-17 17:53:00.581851
1097233820	Nilufar	\N	+998903283822	uz	\N	\N	\N	2020-09-09 08:53:56.358783
1097761839	Гульшан	gugusi	998990198188	ru	\N	\N	\N	2020-08-12 09:55:14.409759
1101135740	Komila	\N	998946334885	uz	\N	\N	\N	2020-08-31 11:24:01.123064
1101295389	Фериде	\N	998900358003	ru	\N	\N	\N	2020-09-09 08:15:58.741847
1103593061	Мария	evgenievnaaaa	998903911099	ru	\N	\N	\N	2020-09-26 09:21:55.249608
1105524412	Sitora	\N	998971304414	uz	\N	\N	\N	2020-08-13 13:49:11.705243
1106206798	Afruza	\N	998993657235	uz	\N	\N	\N	2020-09-09 11:51:53.839838
1106534904	Madina	\N	998977503150	uz	\N	\N	\N	2020-08-11 14:13:52.381869
1107969944	Hadiyja	BizjimginaularniAllohgasoldikk	998909712303	uz	\N	\N	\N	2020-09-06 10:29:28.034179
1108111456	Висола	vkholmukhamedova	998998586690	ru	\N	\N	\N	2020-09-17 13:30:22.465567
1108986515	Казакова Сабина Рузиевна	KSR0811	998934374929	ru	\N	\N	\N	2020-09-15 10:40:37.408673
1110033868	Maxbuba	\N	998977287717	uz	\N	\N	\N	2020-08-31 13:11:44.079335
1110465922	Меруерт	\N	998900121359	ru	\N	\N	\N	2020-09-08 04:23:00.78783
1110955015	Амир	Amir_Rakhmanov	998909021363	ru	\N	\N	\N	2020-08-11 21:08:58.917782
1112132300	Севарахон	\N	998903318088	ru	\N	\N	\N	2020-09-25 14:33:39.77109
1113856930	Farrux	\N	998901377737	uz	\N	\N	\N	2020-09-09 03:19:49.849426
1115576317	Mohira	\N	998904859994	uz	\N	\N	\N	2020-09-07 12:28:11.623121
1117975377	Yulduz	\N	998944034440	uz	\N	\N	\N	2020-09-17 12:43:30.558796
1118659446	Isfandiyor	arthookahshop	+998993633777	uz	\N	\N	\N	2020-08-31 19:08:56.779398
1118728221	Mavjuda	Online_44	998900374414	uz	\N	\N	\N	2020-09-23 21:37:52.640607
1120168973	Мадина	\N	998977300067	ru	\N	\N	\N	2020-08-09 14:39:07.952474
1120834765	Nodir	\N	998900086667	ru	\N	\N	\N	2020-09-24 16:27:40.114211
1122741162	nodira	\N	+998998684844	uz	\N	\N	\N	2020-08-24 06:57:27.85955
1126193264	Laziza	\N	998938088088	ru	\N	\N	\N	2020-08-19 16:36:05.531313
1128755929	Сайёра	\N	998909816699	ru	\N	\N	\N	2020-09-17 09:17:28.658986
1129346981	Сабина	\N	998977318224	ru	\N	\N	\N	2020-08-12 18:03:17.392986
1132026352	Lobar	l_agzamovnaA	998935866441	uz	\N	\N	\N	2020-09-07 15:41:04.021515
1132146866	Lobar	\N	+998933786767	uz	\N	\N	\N	2020-09-14 10:51:58.077211
1132959724	/start	\N	998974000573	ru	\N	\N	\N	2020-09-09 14:52:10.155923
1133711319	Чарос	charoszs	998909799730	ru	\N	\N	\N	2020-09-22 09:00:12.26952
1134155403	Зарина	\N	998900349189	ru	\N	\N	\N	2020-09-04 20:55:27.002884
1135294174	Marjona	\N	998973652423	ru	\N	\N	\N	2020-08-30 10:29:23.421375
1137867467	Sabohat	\N	998909039885	uz	\N	\N	\N	2020-08-10 08:01:30.759614
1138871296	Bilol	\N	+998999027391	uz	\N	\N	\N	2020-09-04 10:59:25.650075
1141495967	Bilol	\N	+998998800772	uz	\N	\N	\N	2020-09-07 14:41:26.703291
1143529887	Gulzoda	KGA7117	998911917117	uz	\N	\N	\N	2020-09-25 13:54:06.660069
1148004532	Komila	beregite_blizkix	998944144411	ru	\N	\N	\N	2020-09-21 10:26:37.641683
1148234934	Malika	mel1iss	998990773457	uz	\N	\N	\N	2020-09-08 10:46:07.29599
1151885863	Жохонгир	\N	998970071172	uz	\N	\N	\N	2020-09-17 13:51:24.840128
1152725521	Ruxshona	Ruxshoonaa	+998930036002	uz	\N	\N	\N	2020-09-08 14:10:01.216363
1153038347	Ирада	iradatadj	998909335302	ru	\N	\N	\N	2020-09-06 08:39:00.262979
1153038717	Nozima	\N	998946865597	uz	\N	\N	\N	2020-08-30 10:36:00.352601
1153673504	Shaxlo	\N	998944264476	uz	\N	\N	\N	2020-09-08 14:43:01.570674
1154369190	mastonbek	akhrolbekov	998998397005	uz	\N	\N	\N	2020-09-06 18:00:40.888965
1154776193	Малика	\N	998997800123	uz	\N	\N	\N	2020-09-09 13:34:33.132392
1157062836	Laylo	LayloSultanovaB	998900229994	ru	\N	\N	\N	2020-09-03 06:44:32.333675
1158913758	Мохинур	\N	+998903351230	ru	\N	\N	\N	2020-09-01 17:20:09.233156
1158968437	Jasur	\N	13477047766	uz	\N	\N	\N	2020-08-09 12:36:52.683176
1159555411	Malika	\N	998931093534	uz	\N	\N	\N	2020-09-17 05:45:37.4972
1160785606	Abror	\N	998905700057	uz	\N	\N	\N	2020-09-09 06:59:10.805121
1162634036	Назира	nazir_0228	+998935582481	ru	\N	\N	\N	2020-09-21 16:33:22.647985
1163418283	Asadbek	\N	998909930808	uz	\N	\N	\N	2020-09-16 07:00:21.091385
1164013178	Nodira	\N	998994096009	uz	\N	\N	\N	2020-09-08 05:38:31.568891
1165125080	Нигора	liberian_girl	998998657077	ru	\N	\N	\N	2020-09-13 16:30:58.752577
1165353248	Oydin	\N	998998383060	ru	\N	\N	\N	2020-08-18 12:49:15.094973
1165843624	Dilnozaxon Nabirakhujaeva	\N	+998997258066	uz	\N	\N	\N	2020-09-08 13:11:49.599933
1167644372	Muhlisa	\N	+998946789880	uz	\N	\N	\N	2020-09-21 10:25:29.644439
1168220733	Ситора	\N	998900277275	ru	\N	\N	\N	2020-09-15 06:07:00.548067
1169012778	Альбина	\N	998993742544	ru	\N	\N	\N	2020-09-08 12:02:03.500381
1170067137	Komoliddin	\N	998909352288	uz	\N	\N	\N	2020-08-10 04:38:09.040006
1171061937	Akmal	Bobomurodov_Akmal	998973221221	uz	\N	\N	\N	2020-09-18 05:19:59.200553
1173450490	Dilorom	\N	998991008651	uz	\N	\N	\N	2020-09-09 13:07:10.140609
1174003865	Hayola	\N	998997855201	uz	\N	\N	\N	2020-09-12 13:04:29.412957
1177790473	Ikrom	\N	998974801337	uz	\N	\N	\N	2020-09-14 11:00:57.219637
1180160045	Зарина	Maple_grove	998903502656	ru	\N	\N	\N	2020-09-23 11:39:00.67658
1180332414	Saris	ka4apaki	998915068118	ru	\N	\N	\N	2020-08-10 11:35:07.417544
1181147756	Vasilaxon	\N	+998909307488	uz	\N	\N	\N	2020-09-26 07:18:10.024874
1181310152	Zuhraxon	zuhraaxon	998935027020	ru	\N	\N	\N	2020-08-10 10:22:56.847004
1181686264	Odilbek	odilbek_7576	998993694216	uz	\N	\N	\N	2020-09-13 16:00:07.324391
1182153696	Nozima	nadeyus_ne_prosto_tak	998974075555	ru	\N	\N	\N	2020-09-11 15:20:55.659902
1182499136	Gozal	\N	998903461979	uz	\N	\N	\N	2020-09-05 10:53:10.387945
1185428215	Elephant	elephantgroup01	998971010714	ru	\N	\N	\N	2020-08-24 12:20:28.742921
1186969535	Севинч	sevv_a	998995901904	ru	\N	\N	\N	2020-09-08 05:26:53.357536
1188023761	Nodira	\N	+998999052535	uz	\N	\N	\N	2020-09-08 12:31:34.099406
1192081954	Илина	\N	998901353137	ru	\N	\N	\N	2020-08-20 20:51:53.395032
1192943561	Bobur	\N	998998856550	uz	\N	\N	\N	2020-09-08 17:52:27.773696
1196360297	Gaybulla	\N	998946615153	uz	\N	\N	\N	2020-09-06 11:05:17.363151
1198101713	Madina	\N	+998993734343	uz	\N	\N	\N	2020-08-31 11:24:28.078078
1200923694	Набиева Хадича	\N	998998004569	uz	\N	\N	\N	2020-08-09 13:13:47.075761
1202650967	Zulayho	\N	998977689397	uz	\N	\N	\N	2020-09-17 05:52:26.759
1206814913	Azamat	\N	998939800585	ru	\N	\N	\N	2020-08-10 10:10:45.681473
1207426620	Жасур	\N	998909955519	ru	\N	\N	\N	2020-08-27 14:36:23.313498
1208041336	Мавлуда	\N	998977036661	uz	\N	\N	\N	2020-09-11 13:15:34.010957
1208782613	Гайбулло	iceandgoldexclusive	998946341414	ru	\N	\N	\N	2020-08-09 13:52:39.219103
1208782614	@yozing 	\N	+998998756999	\N	wfXXvM_mlIQWmPXrZBO5nYddEdo	\N	\N	2020-08-06 06:13:38.153031
1211170776	nigina	\N	998999097700	uz	\N	\N	\N	2020-08-10 12:34:06.566663
1211860449	Farangiz	\N	17472274097	uz	\N	\N	\N	2020-08-09 08:13:53.688872
1212372665	Mubina	\N	998909020705	uz	\N	\N	\N	2020-09-14 08:17:11.669999
1213046645	Dilmurod	\N	99899 804 68 34	uz	\N	\N	\N	2020-08-30 19:11:25.011172
1214599095	Fazliddin	Fazli_929	998998021144	uz	\N	\N	\N	2020-09-26 07:52:43.097006
1214925737	Diyora	\N	998999263035	uz	\N	\N	\N	2020-09-12 14:48:59.828639
1219020905	Мухаммаджон	\N	998977400313	ru	\N	\N	\N	2020-08-08 19:56:59.688937
1219131838	Solixa	\N	998944291551	uz	\N	\N	\N	2020-08-12 10:33:56.902789
1219365499	Iroda	brdklvaa	998946438550	ru	\N	\N	\N	2020-08-09 13:47:34.414236
1220533673	Robiya	\N	998974022711	uz	\N	\N	\N	2020-09-20 00:32:41.516385
1221670480	Komola	\N	998909977468	uz	\N	\N	\N	2020-09-07 06:03:35.075139
1224702788	Farangiz	\N	998974250889	uz	\N	\N	\N	2020-08-10 14:23:05.653617
1225593874	Dilfuza	\N	998901571858	uz	\N	\N	\N	2020-09-07 13:05:15.392068
1226264496	сухроб	\N	998909229363	uz	\N	\N	\N	2020-08-30 19:45:15.568834
1230849186	Ziyoda	Mir_jalilova	998974617751	uz	\N	\N	\N	2020-09-09 23:25:57.72393
1232284271	Muattar	\N	998977686446	uz	\N	\N	\N	2020-08-30 12:40:58.172095
1233292570	Elshod	\N	998909935066	uz	\N	\N	\N	2020-08-14 13:52:00.234541
1233414130	muslima	\N	998995222005	uz	\N	\N	\N	2020-09-06 11:16:18.920931
1234729096	Abdullayeva odina ulugbekovna	\N	998973441213	uz	\N	\N	\N	2020-09-13 17:06:17.034432
1236615021	Диёра	dodokin2002	998946883010	ru	\N	\N	\N	2020-09-07 14:36:21.033773
1238096372	Mohira	Muslimina11	998909947573	uz	\N	\N	\N	2020-09-22 17:22:14.466318
1238138747	Vazira	\N	998903303777	uz	\N	\N	\N	2020-09-17 16:38:44.694967
1238428198	Maftuna	\N	+998935959601	uz	\N	\N	\N	2020-08-31 02:08:17.608544
1238604624	Бахтиёр	Baxti_2030	998946052030	ru	\N	\N	\N	2020-08-09 13:48:34.839054
1239222834	Azizbekj	\N	998981702707	ru	\N	\N	\N	2020-08-15 09:01:49.446615
1240123642	Lunalika	\N	998990111883	uz	\N	\N	\N	2020-08-08 16:07:45.499483
1242044258	Вероника	\N	998930042638	ru	\N	\N	\N	2020-09-07 17:29:12.300627
1243327554	Nilufar	BoTiRoVa89	998974424999	uz	\N	\N	\N	2020-09-16 17:24:40.437931
1243630439	Mushtariy	\N	998990477876	uz	\N	\N	\N	2020-08-30 17:52:55.367405
1248848934	Samandar	alonewolf1132	998990831132	uz	\N	\N	\N	2020-08-09 12:46:57.655438
1252962808	Мухсина Камилова	\N	998909479272	ru	\N	\N	\N	2020-09-08 11:53:53.61521
1254122256	Abdulaziz	\N	12692621307	uz	\N	\N	\N	2020-08-10 03:57:18.96402
1259368838	Умида	umishim_26	998900349888	ru	\N	\N	\N	2020-09-22 18:41:43.917584
1267736519	Саманназ	\N	998935813833	ru	\N	\N	\N	2020-08-26 13:16:47.372239
1268767625	sevars	\N	998977459299	uz	\N	\N	\N	2020-09-20 15:46:22.570989
1269230908	Самиуллох	Dolgojdanchik	998977730607	ru	\N	\N	\N	2020-09-16 10:02:27.409317
1271427851	Jamila	\N	998909196206	uz	\N	\N	\N	2020-08-10 16:05:28.520162
1271590541	Настя	nastyakd1811	998971391614	ru	\N	\N	\N	2020-08-17 18:54:22.984452
1271743636	G’aybullo	rukhullaev	998990848444	uz	\N	\N	\N	2020-08-07 06:30:19.972863
1272469256	Shahlo	Shakhlo0301	998998890301	uz	\N	\N	\N	2020-09-06 12:30:59.078568
1274086572	Diyora	\N	998909280848	ru	\N	\N	\N	2020-09-24 09:23:57.088183
1275025094	Nargiza	ns9503	998977449593	ru	\N	\N	\N	2020-08-14 12:05:21.331669
1279756135	Ситора	\N	998900232313	ru	\N	\N	\N	2020-08-31 11:44:06.61258
1281387313	Robiya	\N	998990479977	uz	\N	\N	\N	2020-08-23 09:32:12.057437
1283444236	Madinabonu	Madiw_8334	998946977025	uz	\N	\N	\N	2020-09-08 15:40:41.948861
1285826482	Guli	\N	998995810701	uz	\N	\N	\N	2020-08-22 05:01:06.73486
1285912930	zilola	\N	998971013997	uz	\N	\N	\N	2020-09-08 06:05:52.324001
1291225030	Zulfiya	\N	998997252559	ru	\N	\N	\N	2020-08-25 08:07:03.588097
1291488779	Elyor	\N	+998977220009	uz	\N	\N	\N	2020-09-17 08:07:16.345673
1291956675	Samandar	Umirzakov00	998935652807	uz	\N	\N	\N	2020-08-30 11:56:21.228729
1294618325	Дениель	permanentusernames	998998248047	ru	\N	\N	\N	2020-08-16 11:14:41.74757
1295321257	Muslima	muhammad1ya	998977154484	uz	\N	\N	\N	2020-09-07 16:56:00.288891
1295800874	Jasmina	\N	998945480807	uz	\N	\N	\N	2020-09-07 13:55:42.914819
1297155763	islom	\N	998997903031	ru	\N	\N	\N	2020-08-12 14:24:48.877249
1298755495	Dildora	\N	+998977380177	uz	\N	\N	\N	2020-09-07 05:02:47.72526
1303181563	Ra'no	\N	998998568845	uz	\N	\N	\N	2020-09-07 07:47:39.69803
1307130589	Nilufar	\N	998946001497	uz	\N	\N	\N	2020-09-09 11:27:15.085928
1308831886	Aziz	\N	998909925818	uz	\N	\N	\N	2020-09-08 18:48:20.664597
1308955342	Феруза	\N	998977500919	uz	\N	\N	\N	2020-09-16 17:41:30.386924
1309881682	Камола	Oriflame_OPTOM_Kosmetika	998909464356	uz	\N	\N	\N	2020-09-23 03:17:54.503386
1309986751	Хасан	abdukadirov_x_a	+998930060105	ru	\N	\N	\N	2020-09-14 13:07:17.53941
1313896035	Малика	malika_rashidovna	998901216221	ru	\N	\N	\N	2020-09-06 06:42:28.938886
1314456245	Shahrizoda	\N	998974340424	uz	\N	\N	\N	2020-09-14 13:26:07.105281
1315191408	Madina	\N	+998994091930	uz	\N	\N	\N	2020-09-19 09:34:28.571893
1315459097	Умида	Umida_yldsh	998909519996	ru	\N	\N	\N	2020-08-30 12:47:10.480747
1315834590	Aziz	\N	998909443034	uz	\N	\N	\N	2020-09-02 19:38:08.440573
1323072213	Maftuna	\N	998998411103	ru	\N	\N	\N	2020-08-31 04:51:47.316104
1325778149	Dilzoda	\N	+998930053855	uz	\N	\N	\N	2020-08-14 14:48:50.607335
1330541774	Muhayyo	\N	998909116350	uz	\N	\N	\N	2020-09-17 04:51:12.944792
1331547687	Farangiz	\N	+998994814095	uz	\N	\N	\N	2020-08-14 18:45:08.074769
1331779936	Markhabo	otabekovvvna	998999612525	uz	\N	\N	\N	2020-09-09 20:46:35.504472
1332410099	Сунэна	\N	+998901160709	ru	\N	\N	\N	2020-08-22 18:56:59.988979
1335899436	Жасмин	\N	998901787413	ru	\N	\N	\N	2020-09-06 10:38:17.428895
1338375556	Mohinur	\N	998977050809	ru	\N	\N	\N	2020-09-24 08:21:30.45739
1339717005	Mavluda	\N	998997200910	uz	\N	\N	\N	2020-08-31 05:42:27.056005
1342062712	Farangiz	\N	+998999211990	uz	\N	\N	\N	2020-08-10 14:31:21.106586
1342145734	Настя	Puuupsik	998974501104	ru	\N	\N	\N	2020-09-14 11:55:06.765151
1347837938	Menga hozir vafli kerak	\N	998994644870	uz	\N	\N	\N	2020-09-07 14:30:55.720053
1347946951	Shoira	\N	+998900380311	uz	\N	\N	\N	2020-09-06 11:02:20.917407
1348931260	Badalova Aisha	\N	998900370230	ru	\N	\N	\N	2020-08-16 05:35:49.517324
1358147870	Mubina	\N	998909157060	ru	\N	\N	\N	2020-08-18 16:13:27.228131
1358184776	Bilol	Biloln0772	+998998800772	uz	\N	\N	\N	2020-09-04 11:12:39.354258
1358477835	Omina	\N	998990199432	uz	\N	\N	\N	2020-09-08 07:58:11.44286
1360108359	Zilola	\N	998977839017	ru	\N	\N	\N	2020-09-13 19:08:55.903322
1360196135	Komola	\N	998998062750	uz	\N	\N	\N	2020-08-30 11:55:27.778125
1362558206	Яна	chuvashka1225	998909901291	ru	\N	\N	\N	2020-09-08 19:48:28.553797
1364085299	Madina	\N	998909299592	uz	\N	\N	\N	2020-08-15 17:41:09.180504
1374169778	Madina	\N	998998074940	uz	\N	\N	\N	2020-09-09 13:49:12.536222
1376155643	Jasur	\N	998935995013	uz	\N	\N	\N	2020-08-11 06:27:25.328768
1376623942	Умида	\N	998977699898	ru	\N	\N	\N	2020-08-31 13:22:11.489089
1377370815	Диёра	\N	998909126545	ru	\N	\N	\N	2020-08-15 16:03:54.989842
1377804508	Abdurasulovamadina	\N	998974770773	uz	\N	\N	\N	2020-08-16 09:10:01.813557
1379297941	Maliks	\N	998970002877	uz	\N	\N	\N	2020-08-30 16:31:19.597041
1380125902	Odina	\N	998998540356	uz	\N	\N	\N	2020-09-10 14:27:24.874053
1380652842	Mastona	\N	+998900147676	uz	\N	\N	\N	2020-08-16 15:01:00.687047
1383722099	Nozima	\N	998946020242	uz	\N	\N	\N	2020-08-09 17:00:07.88135
1386729457	Malika	\N	+998974901002	uz	\N	\N	\N	2020-08-30 12:55:35.777478
1389360817	Nilufar	\N	998976458448	uz	\N	\N	\N	2020-08-31 10:33:17.604333
1394594233	B.S	\N	998905482711	uz	\N	\N	\N	2020-09-14 05:43:48.325152
1394764430	Islom	\N	998900375155	ru	\N	\N	\N	2020-08-14 15:08:01.887302
1395720340	Jamshid	\N	998971054344	uz	\N	\N	\N	2020-09-04 18:37:48.449298
1397554057	+998971490445	\N	998971490445	ru	\N	\N	\N	2020-08-16 18:15:48.105347
857023285	Mixriddin	Mukhriddin_Fakhriddinovich3722	998999313722	uz	\N	\N	\N	2020-09-26 14:58:11.404848
245010578	Мадина	\N	+998909157060	uz	\N	\N	\N	2020-09-26 15:16:24.810616
932578963	Muslima	\N	998972661664	uz	\N	\N	\N	2020-09-26 16:38:43.687946
971955353	Малика	\N	998901343003	ru	\N	\N	\N	2020-09-26 15:59:43.402679
387446579	Махкамова Камила	\N	998977549649	ru	\N	\N	\N	2020-09-26 14:41:25.16359
396112385	Munisa	munisaaliyeva	998901686303	ru	\N	\N	\N	2020-09-26 12:06:36.302916
433328543	Zarina	\N	998909804957	ru	\N	\N	\N	2020-09-26 16:16:06.27434
1014334488	Bekzod	bekstranger	+998936131682	uz	\N	\N	\N	2020-09-26 14:57:01.059569
470538443	Bunyod	\N	998909869065	uz	\N	\N	\N	2020-09-26 14:14:58.46806
1154051	Ulug'bek	Beck8788	998908068788	ru	\N	\N	\N	2020-09-26 10:13:03.029119
583411442	Дв	zakking1	998900000000	ru	\N	\N	\N	2020-09-24 17:06:33.058863
2634351	Lola	\N	998977250199	ru	\N	\N	\N	2020-09-26 14:18:10.837493
610216476	Александра	Kayumovaalexandra	998900075270	ru	\N	\N	\N	2020-09-26 13:22:01.371045
618260427	Zilola Ali	\N	998998990480	ru	\N	\N	\N	2020-09-26 14:58:09.019473
108313091	Исроил Ибрагимов	\N	+998990992233	uz	\N	\N	\N	2020-09-26 12:17:44.147225
\.


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 36, true);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: dish_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.dish_categories_id_seq', 1, true);


--
-- Name: dishes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.dishes_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.locations_id_seq', 18, true);


--
-- Name: notification_chats_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.notification_chats_chat_id_seq', 1, false);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.order_items_id_seq', 39, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.orders_id_seq', 52, true);


--
-- Name: registration_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.registration_requests_id_seq', 1, false);


--
-- Name: user_admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.user_admins_id_seq', 1, false);


--
-- Name: user_dish_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.user_dish_user_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: telegrambot
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: dish_categories dish_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dish_categories
    ADD CONSTRAINT dish_categories_pkey PRIMARY KEY (id);


--
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: notification_chats notification_chats_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.notification_chats
    ADD CONSTRAINT notification_chats_pkey PRIMARY KEY (chat_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: registration_requests registration_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.registration_requests
    ADD CONSTRAINT registration_requests_pkey PRIMARY KEY (id);


--
-- Name: user_admins user_admins_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.user_admins
    ADD CONSTRAINT user_admins_pkey PRIMARY KEY (id);


--
-- Name: user_dish user_dish_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.user_dish
    ADD CONSTRAINT user_dish_pkey PRIMARY KEY (user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: dish_categories_level_idx; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX dish_categories_level_idx ON public.dish_categories USING btree (level);


--
-- Name: dish_categories_lft_idx; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX dish_categories_lft_idx ON public.dish_categories USING btree (lft);


--
-- Name: dish_categories_rgt_idx; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX dish_categories_rgt_idx ON public.dish_categories USING btree (rgt);


--
-- Name: ix_user_admins_email; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX ix_user_admins_email ON public.user_admins USING btree (email);


--
-- Name: ix_user_dish_dish_id; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX ix_user_dish_dish_id ON public.user_dish USING btree (dish_id);


--
-- Name: ix_user_dish_user_id; Type: INDEX; Schema: public; Owner: telegrambot
--

CREATE INDEX ix_user_dish_user_id ON public.user_dish USING btree (user_id);


--
-- Name: cart_items cart_items_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id) ON DELETE SET NULL;


--
-- Name: cart_items cart_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: dish_categories dish_categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dish_categories
    ADD CONSTRAINT dish_categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.dish_categories(id) ON DELETE CASCADE;


--
-- Name: dishes dishes_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.dish_categories(id);


--
-- Name: locations locations_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_items order_items_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(id) ON DELETE SET NULL;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: telegrambot
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

