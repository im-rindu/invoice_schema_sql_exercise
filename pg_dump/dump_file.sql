--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-1.pgdg22.04+1)

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
-- Name: invoice; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA invoice;


ALTER SCHEMA invoice OWNER TO postgres;

--
-- Name: amount_type_t; Type: TYPE; Schema: invoice; Owner: postgres
--

CREATE TYPE invoice.amount_type_t AS ENUM (
    'percent',
    'flat'
);


ALTER TYPE invoice.amount_type_t OWNER TO postgres;

--
-- Name: type_t; Type: TYPE; Schema: invoice; Owner: postgres
--

CREATE TYPE invoice.type_t AS ENUM (
    'cashback',
    'discount',
    'free_shipment'
);


ALTER TYPE invoice.type_t OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: payment; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.payment (
    id integer NOT NULL,
    name text,
    payment_type_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone,
    is_deleted boolean
);


ALTER TABLE invoice.payment OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.payment_id_seq OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.payment_id_seq OWNED BY invoice.payment.id;


--
-- Name: payment_type; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.payment_type (
    id integer NOT NULL,
    name text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone,
    is_deleted boolean
);


ALTER TABLE invoice.payment_type OWNER TO postgres;

--
-- Name: payment_type_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.payment_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.payment_type_id_seq OWNER TO postgres;

--
-- Name: payment_type_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.payment_type_id_seq OWNED BY invoice.payment_type.id;


--
-- Name: product; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.product (
    id integer NOT NULL,
    name text,
    price double precision,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone,
    is_deleted boolean
);


ALTER TABLE invoice.product OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.product_id_seq OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.product_id_seq OWNED BY invoice.product.id;


--
-- Name: promo; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.promo (
    id integer NOT NULL,
    name text,
    code text,
    type invoice.type_t,
    amount double precision,
    amount_type invoice.amount_type_t,
    requirement_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone,
    is_deleted boolean
);


ALTER TABLE invoice.promo OWNER TO postgres;

--
-- Name: promo_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.promo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.promo_id_seq OWNER TO postgres;

--
-- Name: promo_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.promo_id_seq OWNED BY invoice.promo.id;


--
-- Name: promo_requirement; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.promo_requirement (
    id integer NOT NULL,
    requirement text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone,
    is_deleted boolean
);


ALTER TABLE invoice.promo_requirement OWNER TO postgres;

--
-- Name: promo_requirement_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.promo_requirement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.promo_requirement_id_seq OWNER TO postgres;

--
-- Name: promo_requirement_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.promo_requirement_id_seq OWNED BY invoice.promo_requirement.id;


--
-- Name: seller; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.seller (
    id integer NOT NULL,
    name text,
    address text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone,
    is_deleted boolean
);


ALTER TABLE invoice.seller OWNER TO postgres;

--
-- Name: seller_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.seller_id_seq OWNER TO postgres;

--
-- Name: seller_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.seller_id_seq OWNED BY invoice.seller.id;


--
-- Name: shipper; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.shipper (
    id integer NOT NULL,
    name text,
    shipping_fee double precision,
    is_deleted boolean
);


ALTER TABLE invoice.shipper OWNER TO postgres;

--
-- Name: shipper_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.shipper_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.shipper_id_seq OWNER TO postgres;

--
-- Name: shipper_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.shipper_id_seq OWNED BY invoice.shipper.id;


--
-- Name: transaction; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.transaction (
    id integer NOT NULL,
    trasaction_code text NOT NULL,
    seller_id integer NOT NULL,
    user_id integer NOT NULL,
    shipper_id integer NOT NULL,
    transaction_date timestamp with time zone NOT NULL,
    is_asuransi boolean NOT NULL,
    total_asuransi_fee double precision NOT NULL,
    total_shipping double precision NOT NULL,
    service_fee double precision,
    app_fee double precision,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone,
    is_deleted boolean,
    total_transaction double precision NOT NULL
);


ALTER TABLE invoice.transaction OWNER TO postgres;

--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.transaction_id_seq OWNER TO postgres;

--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.transaction_id_seq OWNED BY invoice.transaction.id;


--
-- Name: transaction_payment; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.transaction_payment (
    id integer NOT NULL,
    transaction_id integer,
    payment_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone,
    is_deleted boolean
);


ALTER TABLE invoice.transaction_payment OWNER TO postgres;

--
-- Name: transaction_payment_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.transaction_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.transaction_payment_id_seq OWNER TO postgres;

--
-- Name: transaction_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.transaction_payment_id_seq OWNED BY invoice.transaction_payment.id;


--
-- Name: transaction_product; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.transaction_product (
    id integer NOT NULL,
    transaction_id integer,
    product_id integer,
    amount integer,
    cur_product_price double precision,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone,
    is_deleted boolean
);


ALTER TABLE invoice.transaction_product OWNER TO postgres;

--
-- Name: transaction_product_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.transaction_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.transaction_product_id_seq OWNER TO postgres;

--
-- Name: transaction_product_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.transaction_product_id_seq OWNED BY invoice.transaction_product.id;


--
-- Name: transaction_promo; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice.transaction_promo (
    id integer NOT NULL,
    transaction_id integer,
    promo_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone
);


ALTER TABLE invoice.transaction_promo OWNER TO postgres;

--
-- Name: transaction_promo_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.transaction_promo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.transaction_promo_id_seq OWNER TO postgres;

--
-- Name: transaction_promo_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.transaction_promo_id_seq OWNED BY invoice.transaction_promo.id;


--
-- Name: user; Type: TABLE; Schema: invoice; Owner: postgres
--

CREATE TABLE invoice."user" (
    id integer NOT NULL,
    name text,
    address text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp with time zone,
    is_deleted boolean
);


ALTER TABLE invoice."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: invoice; Owner: postgres
--

CREATE SEQUENCE invoice.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE invoice.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: invoice; Owner: postgres
--

ALTER SEQUENCE invoice.user_id_seq OWNED BY invoice."user".id;


--
-- Name: payment id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.payment ALTER COLUMN id SET DEFAULT nextval('invoice.payment_id_seq'::regclass);


--
-- Name: payment_type id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.payment_type ALTER COLUMN id SET DEFAULT nextval('invoice.payment_type_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.product ALTER COLUMN id SET DEFAULT nextval('invoice.product_id_seq'::regclass);


--
-- Name: promo id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.promo ALTER COLUMN id SET DEFAULT nextval('invoice.promo_id_seq'::regclass);


--
-- Name: promo_requirement id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.promo_requirement ALTER COLUMN id SET DEFAULT nextval('invoice.promo_requirement_id_seq'::regclass);


--
-- Name: seller id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.seller ALTER COLUMN id SET DEFAULT nextval('invoice.seller_id_seq'::regclass);


--
-- Name: shipper id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.shipper ALTER COLUMN id SET DEFAULT nextval('invoice.shipper_id_seq'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction ALTER COLUMN id SET DEFAULT nextval('invoice.transaction_id_seq'::regclass);


--
-- Name: transaction_payment id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_payment ALTER COLUMN id SET DEFAULT nextval('invoice.transaction_payment_id_seq'::regclass);


--
-- Name: transaction_product id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_product ALTER COLUMN id SET DEFAULT nextval('invoice.transaction_product_id_seq'::regclass);


--
-- Name: transaction_promo id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_promo ALTER COLUMN id SET DEFAULT nextval('invoice.transaction_promo_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice."user" ALTER COLUMN id SET DEFAULT nextval('invoice.user_id_seq'::regclass);


--
-- Data for Name: payment; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.payment (id, name, payment_type_id, created_at, updated_at, deleted_at, is_deleted) FROM stdin;
1	BRIVA	1	2024-05-31 13:11:01.619467+00	2024-05-31 13:11:01.619467+00	\N	\N
2	BCA VA	1	2024-05-31 13:11:01.619467+00	2024-05-31 13:11:01.619467+00	\N	\N
3	Gopay Coin	2	2024-05-31 13:11:01.619467+00	2024-05-31 13:11:01.619467+00	\N	\N
\.


--
-- Data for Name: payment_type; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.payment_type (id, name, created_at, updated_at, deleted_at, is_deleted) FROM stdin;
1	Credit or Debit Card	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
2	Virtual Account	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
3	Poin	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.product (id, name, price, created_at, updated_at, deleted_at, is_deleted) FROM stdin;
1	Laptop canggih paling canggih	100000	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
2	Susu kotak 1 dus	230000	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
3	Handle Pintu 2 arah	300000	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
\.


--
-- Data for Name: promo; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.promo (id, name, code, type, amount, amount_type, requirement_id, created_at, updated_at, deleted_at, is_deleted) FROM stdin;
1	Discount 10%	P-001	discount	0.1	percent	1	2024-05-31 13:11:01.619467+00	2024-05-31 13:11:01.619467+00	\N	\N
2	Cashback 20%	P-002	cashback	0.2	percent	3	2024-05-31 13:11:01.619467+00	2024-05-31 13:11:01.619467+00	\N	\N
3	Free Ongkir Rp 5000	P-003	free_shipment	5000	flat	2	2024-05-31 13:11:01.619467+00	2024-05-31 13:11:01.619467+00	\N	\N
\.


--
-- Data for Name: promo_requirement; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.promo_requirement (id, requirement, created_at, updated_at, deleted_at, is_deleted) FROM stdin;
1	Minimal belanja 20000	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
2	Gunakan virtual account ABC	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
3	Beli di Toko Bata Merah Bersahaja	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
\.


--
-- Data for Name: seller; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.seller (id, name, address, created_at, updated_at, deleted_at, is_deleted) FROM stdin;
1	Toko Bata Merah Bersahaja	Jl. komplek pertokoan bersahaja	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
2	Toko Emas Tidak Barokah	Jl. tol km 72	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
3	Cilok Baso Frozen	Jl. Beku kaya kutub no 88	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
\.


--
-- Data for Name: shipper; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.shipper (id, name, shipping_fee, is_deleted) FROM stdin;
1	SiNgebut	10000	\N
2	EntarAja	9000	\N
3	Iki	13000	\N
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.transaction (id, trasaction_code, seller_id, user_id, shipper_id, transaction_date, is_asuransi, total_asuransi_fee, total_shipping, service_fee, app_fee, created_at, updated_at, deleted_at, is_deleted, total_transaction) FROM stdin;
1	tr-001	1	1	1	2024-05-31 13:10:55.454289+00	t	2000	3000	1000	1000	2024-05-31 13:10:55.454289+00	2024-05-31 13:10:55.454289+00	\N	\N	400000
2	tr-002	1	2	3	2024-05-31 13:10:55.454289+00	f	0	5000	2000	500	2024-05-31 13:10:55.454289+00	2024-05-31 13:10:55.454289+00	\N	\N	900000
3	tr-003	2	3	2	2024-05-31 13:10:55.454289+00	t	2000	3000	1000	1000	2024-05-31 13:10:55.454289+00	2024-05-31 13:10:55.454289+00	\N	\N	80000
\.


--
-- Data for Name: transaction_payment; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.transaction_payment (id, transaction_id, payment_id, created_at, updated_at, deleted_at, is_deleted) FROM stdin;
1	3	1	2024-05-31 13:11:08.877073+00	2024-05-31 13:11:08.877073+00	\N	\N
2	2	2	2024-05-31 13:11:08.877073+00	2024-05-31 13:11:08.877073+00	\N	\N
3	1	3	2024-05-31 13:11:08.877073+00	2024-05-31 13:11:08.877073+00	\N	\N
\.


--
-- Data for Name: transaction_product; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.transaction_product (id, transaction_id, product_id, amount, cur_product_price, created_at, updated_at, deleted_at, is_deleted) FROM stdin;
1	3	1	2	200000	2024-05-31 13:11:01.619467+00	2024-05-31 13:11:01.619467+00	\N	\N
2	3	2	1	300000	2024-05-31 13:11:01.619467+00	2024-05-31 13:11:01.619467+00	\N	\N
3	2	3	3	50000	2024-05-31 13:11:01.619467+00	2024-05-31 13:11:01.619467+00	\N	\N
\.


--
-- Data for Name: transaction_promo; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice.transaction_promo (id, transaction_id, promo_id, created_at, updated_at, deleted_at) FROM stdin;
1	3	3	2024-05-31 13:11:08.877073+00	2024-05-31 13:11:08.877073+00	\N
2	3	1	2024-05-31 13:11:08.877073+00	2024-05-31 13:11:08.877073+00	\N
3	2	2	2024-05-31 13:11:08.877073+00	2024-05-31 13:11:08.877073+00	\N
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: invoice; Owner: postgres
--

COPY invoice."user" (id, name, address, created_at, updated_at, deleted_at, is_deleted) FROM stdin;
1	Dono Perkoso	Jl. rumah rumahan no 881	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
2	Asep Surkasep	Jl. Asosiasi Asep Amanah no 2	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
3	Toni Hartoni	Jl. martono haroto no 1	2024-05-31 13:10:47.942241+00	2024-05-31 13:10:47.942241+00	\N	\N
\.


--
-- Name: payment_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.payment_id_seq', 3, true);


--
-- Name: payment_type_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.payment_type_id_seq', 3, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.product_id_seq', 3, true);


--
-- Name: promo_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.promo_id_seq', 3, true);


--
-- Name: promo_requirement_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.promo_requirement_id_seq', 3, true);


--
-- Name: seller_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.seller_id_seq', 3, true);


--
-- Name: shipper_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.shipper_id_seq', 3, true);


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.transaction_id_seq', 3, true);


--
-- Name: transaction_payment_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.transaction_payment_id_seq', 3, true);


--
-- Name: transaction_product_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.transaction_product_id_seq', 3, true);


--
-- Name: transaction_promo_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.transaction_promo_id_seq', 3, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: invoice; Owner: postgres
--

SELECT pg_catalog.setval('invoice.user_id_seq', 3, true);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: payment_type payment_type_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.payment_type
    ADD CONSTRAINT payment_type_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: promo promo_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.promo
    ADD CONSTRAINT promo_pkey PRIMARY KEY (id);


--
-- Name: promo_requirement promo_requirement_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.promo_requirement
    ADD CONSTRAINT promo_requirement_pkey PRIMARY KEY (id);


--
-- Name: seller seller_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.seller
    ADD CONSTRAINT seller_pkey PRIMARY KEY (id);


--
-- Name: shipper shipper_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.shipper
    ADD CONSTRAINT shipper_pkey PRIMARY KEY (id);


--
-- Name: transaction_payment transaction_payment_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_payment
    ADD CONSTRAINT transaction_payment_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: transaction_product transaction_product_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_product
    ADD CONSTRAINT transaction_product_pkey PRIMARY KEY (id);


--
-- Name: transaction_promo transaction_promo_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_promo
    ADD CONSTRAINT transaction_promo_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: payment payment_payment_type_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.payment
    ADD CONSTRAINT payment_payment_type_id_fkey FOREIGN KEY (payment_type_id) REFERENCES invoice.payment_type(id);


--
-- Name: promo promo_requirement_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.promo
    ADD CONSTRAINT promo_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES invoice.promo_requirement(id);


--
-- Name: transaction_payment transaction_payment_payment_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_payment
    ADD CONSTRAINT transaction_payment_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES invoice.payment(id);


--
-- Name: transaction_payment transaction_payment_transaction_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_payment
    ADD CONSTRAINT transaction_payment_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES invoice.transaction(id);


--
-- Name: transaction_product transaction_product_product_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_product
    ADD CONSTRAINT transaction_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES invoice.product(id);


--
-- Name: transaction_product transaction_product_transaction_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_product
    ADD CONSTRAINT transaction_product_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES invoice.transaction(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: transaction_promo transaction_promo_promo_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_promo
    ADD CONSTRAINT transaction_promo_promo_id_fkey FOREIGN KEY (promo_id) REFERENCES invoice.promo(id);


--
-- Name: transaction_promo transaction_promo_transaction_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction_promo
    ADD CONSTRAINT transaction_promo_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES invoice.transaction(id);


--
-- Name: transaction transaction_seller_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction
    ADD CONSTRAINT transaction_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES invoice.seller(id);


--
-- Name: transaction transaction_shipper_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction
    ADD CONSTRAINT transaction_shipper_id_fkey FOREIGN KEY (shipper_id) REFERENCES invoice.shipper(id);


--
-- Name: transaction transaction_user_id_fkey; Type: FK CONSTRAINT; Schema: invoice; Owner: postgres
--

ALTER TABLE ONLY invoice.transaction
    ADD CONSTRAINT transaction_user_id_fkey FOREIGN KEY (user_id) REFERENCES invoice."user"(id);


--
-- PostgreSQL database dump complete
--

