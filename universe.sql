--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    galaxy_type character varying(30),
    size_in_lightyears numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: mineral; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mineral (
    mineral_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer
);


ALTER TABLE public.mineral OWNER TO freecodecamp;

--
-- Name: mineral_mineral_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mineral_mineral_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mineral_mineral_id_seq OWNER TO freecodecamp;

--
-- Name: mineral_mineral_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mineral_mineral_id_seq OWNED BY public.mineral.mineral_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    star_id integer,
    is_rocky boolean,
    no_of_moons integer,
    no_of_rings integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    star_type character varying(30),
    galaxy_id integer,
    is_dwarf boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: mineral mineral_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mineral ALTER COLUMN mineral_id SET DEFAULT nextval('public.mineral_mineral_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 13600, 'Spiral', 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, 3000, 'Spiral', 220000);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', NULL, 13500, 'Spiral', 76900);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', NULL, 10000, 'Spiral', 200000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', NULL, 10000, 'Lenticular', 75000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', NULL, 10000, 'Elliptical', 120000);


--
-- Data for Name: mineral; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mineral VALUES (1, 'Olivine', 1);
INSERT INTO public.mineral VALUES (2, 'Pyroxene', 1);
INSERT INTO public.mineral VALUES (3, 'Plagioclase Feldspar', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 4510, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 4500, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 4500, 2);
INSERT INTO public.moon VALUES (4, 'Io', NULL, 4600, 5);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 4600, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 4600, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, 4600, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', NULL, 4600, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', NULL, 4600, 5);
INSERT INTO public.moon VALUES (10, 'Titan', NULL, 4600, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', NULL, 4600, 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', NULL, 4600, 6);
INSERT INTO public.moon VALUES (13, 'Dione', NULL, 4600, 6);
INSERT INTO public.moon VALUES (14, 'Enceladus', NULL, 4600, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', NULL, 4600, 6);
INSERT INTO public.moon VALUES (16, 'Mimas', NULL, 4600, 6);
INSERT INTO public.moon VALUES (17, 'Ariel', NULL, 4600, 7);
INSERT INTO public.moon VALUES (18, 'Titania', NULL, 4600, 7);
INSERT INTO public.moon VALUES (19, 'Triton', NULL, 4600, 8);
INSERT INTO public.moon VALUES (20, 'Nereid', NULL, 4600, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, 4540, 1, true, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', NULL, 4500, 1, true, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, 4500, 1, true, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Mercury', NULL, 4500, 1, true, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 4600, 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 4600, 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 4600, 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 4600, 1, false, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', NULL, 4850, 4, true, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', NULL, 4850, 4, false, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', NULL, 4850, 4, true, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Vega b', NULL, 455, 6, false, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SUN', NULL, 4600, 'Yellow Dwarf', 1, true);
INSERT INTO public.star VALUES (2, 'Sirius A', NULL, 242, 'Main Sequence', 1, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', NULL, 10, 'Red Supergiant', 1, false);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', NULL, 4850, 'Red Dwarf', 1, true);
INSERT INTO public.star VALUES (5, 'Rigel', NULL, 8, 'Blue Supergiant', 1, false);
INSERT INTO public.star VALUES (6, 'Vega', NULL, 455, 'Main Sequence', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mineral_mineral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mineral_mineral_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mineral mineral_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mineral
    ADD CONSTRAINT mineral_name_key UNIQUE (name);


--
-- Name: mineral mineral_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mineral
    ADD CONSTRAINT mineral_pkey PRIMARY KEY (mineral_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: mineral mineral_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mineral
    ADD CONSTRAINT mineral_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

