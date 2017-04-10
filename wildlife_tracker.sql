--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: animals; Type: TABLE; Schema: public; Owner: meganwarnock
--

CREATE TABLE animals (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE animals OWNER TO meganwarnock;

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: meganwarnock
--

CREATE SEQUENCE animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE animals_id_seq OWNER TO meganwarnock;

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meganwarnock
--

ALTER SEQUENCE animals_id_seq OWNED BY animals.id;


--
-- Name: endangered_animals; Type: TABLE; Schema: public; Owner: meganwarnock
--

CREATE TABLE endangered_animals (
    id integer NOT NULL,
    name character varying,
    health character varying,
    age character varying
);


ALTER TABLE endangered_animals OWNER TO meganwarnock;

--
-- Name: endangered_animals_id_seq; Type: SEQUENCE; Schema: public; Owner: meganwarnock
--

CREATE SEQUENCE endangered_animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE endangered_animals_id_seq OWNER TO meganwarnock;

--
-- Name: endangered_animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meganwarnock
--

ALTER SEQUENCE endangered_animals_id_seq OWNED BY endangered_animals.id;


--
-- Name: rangers; Type: TABLE; Schema: public; Owner: meganwarnock
--

CREATE TABLE rangers (
    id integer NOT NULL,
    name character varying,
    badge_number integer,
    address character varying
);


ALTER TABLE rangers OWNER TO meganwarnock;

--
-- Name: rangers_id_seq; Type: SEQUENCE; Schema: public; Owner: meganwarnock
--

CREATE SEQUENCE rangers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rangers_id_seq OWNER TO meganwarnock;

--
-- Name: rangers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meganwarnock
--

ALTER SEQUENCE rangers_id_seq OWNED BY rangers.id;


--
-- Name: sightings; Type: TABLE; Schema: public; Owner: meganwarnock
--

CREATE TABLE sightings (
    id integer NOT NULL,
    animal_id integer,
    location character varying,
    date timestamp without time zone,
    ranger_id integer
);


ALTER TABLE sightings OWNER TO meganwarnock;

--
-- Name: sightings_id_seq; Type: SEQUENCE; Schema: public; Owner: meganwarnock
--

CREATE SEQUENCE sightings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sightings_id_seq OWNER TO meganwarnock;

--
-- Name: sightings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meganwarnock
--

ALTER SEQUENCE sightings_id_seq OWNED BY sightings.id;


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: meganwarnock
--

ALTER TABLE ONLY animals ALTER COLUMN id SET DEFAULT nextval('animals_id_seq'::regclass);


--
-- Name: endangered_animals id; Type: DEFAULT; Schema: public; Owner: meganwarnock
--

ALTER TABLE ONLY endangered_animals ALTER COLUMN id SET DEFAULT nextval('endangered_animals_id_seq'::regclass);


--
-- Name: rangers id; Type: DEFAULT; Schema: public; Owner: meganwarnock
--

ALTER TABLE ONLY rangers ALTER COLUMN id SET DEFAULT nextval('rangers_id_seq'::regclass);


--
-- Name: sightings id; Type: DEFAULT; Schema: public; Owner: meganwarnock
--

ALTER TABLE ONLY sightings ALTER COLUMN id SET DEFAULT nextval('sightings_id_seq'::regclass);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: meganwarnock
--

COPY animals (id, name) FROM stdin;
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meganwarnock
--

SELECT pg_catalog.setval('animals_id_seq', 8, true);


--
-- Data for Name: endangered_animals; Type: TABLE DATA; Schema: public; Owner: meganwarnock
--

COPY endangered_animals (id, name, health, age) FROM stdin;
\.


--
-- Name: endangered_animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meganwarnock
--

SELECT pg_catalog.setval('endangered_animals_id_seq', 5, true);


--
-- Data for Name: rangers; Type: TABLE DATA; Schema: public; Owner: meganwarnock
--

COPY rangers (id, name, badge_number, address) FROM stdin;
\.


--
-- Name: rangers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meganwarnock
--

SELECT pg_catalog.setval('rangers_id_seq', 1, false);


--
-- Data for Name: sightings; Type: TABLE DATA; Schema: public; Owner: meganwarnock
--

COPY sightings (id, animal_id, location, date, ranger_id) FROM stdin;
\.


--
-- Name: sightings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meganwarnock
--

SELECT pg_catalog.setval('sightings_id_seq', 25, true);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: meganwarnock
--

ALTER TABLE ONLY animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- Name: endangered_animals endangered_animals_pkey; Type: CONSTRAINT; Schema: public; Owner: meganwarnock
--

ALTER TABLE ONLY endangered_animals
    ADD CONSTRAINT endangered_animals_pkey PRIMARY KEY (id);


--
-- Name: rangers rangers_pkey; Type: CONSTRAINT; Schema: public; Owner: meganwarnock
--

ALTER TABLE ONLY rangers
    ADD CONSTRAINT rangers_pkey PRIMARY KEY (id);


--
-- Name: sightings sightings_pkey; Type: CONSTRAINT; Schema: public; Owner: meganwarnock
--

ALTER TABLE ONLY sightings
    ADD CONSTRAINT sightings_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

