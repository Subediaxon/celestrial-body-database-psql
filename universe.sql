--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: discoveries; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.discoveries (
    discoveries_id integer NOT NULL,
    name character varying(35) NOT NULL,
    age integer NOT NULL,
    country character varying(40) NOT NULL
);


ALTER TABLE public.discoveries OWNER TO freecodecamp;

--
-- Name: discoveries_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discoveries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discoveries_id_seq OWNER TO freecodecamp;

--
-- Name: discoveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discoveries_id_seq OWNED BY public.discoveries.discoveries_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_in_light_years integer,
    num_of_planets integer,
    percentage_of_life_support numeric(5,3),
    galaxy_desc text,
    hospitable boolean,
    discoveries_id integer NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    discoveries_id integer NOT NULL,
    atmosphere character varying(50)
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
    star_id integer NOT NULL,
    has_life boolean,
    discoveries_id integer NOT NULL
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
    galaxy_id integer NOT NULL,
    approx_diameter integer NOT NULL,
    age_in_million_years numeric(5,3),
    discoveries_id integer NOT NULL
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
-- Name: discoveries discoveries_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoveries ALTER COLUMN discoveries_id SET DEFAULT nextval('public.discoveries_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: discoveries; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.discoveries VALUES (1, 'George Martin', 54, 'Italy');
INSERT INTO public.discoveries VALUES (2, 'Huston Bush', 62, 'USA');
INSERT INTO public.discoveries VALUES (3, 'Kean Saandre', 32, 'Russia');
INSERT INTO public.discoveries VALUES (4, 'Rabindra Mishra', 37, 'India');
INSERT INTO public.discoveries VALUES (5, 'Kristina Roy', 71, 'Argentina');
INSERT INTO public.discoveries VALUES (6, 'Teageo Rea', 66, 'South Africa');
INSERT INTO public.discoveries VALUES (7, 'Sam Willson', 55, 'Wales');
INSERT INTO public.discoveries VALUES (8, 'Olex Richardson', 45, 'USA');
INSERT INTO public.discoveries VALUES (9, 'Dean Max', 44, 'USA');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'GAL1', 158, 48, 54.000, 'big and round with lots of rare minerals', false, 1);
INSERT INTO public.galaxy VALUES (3, 'GAL152', 188, 84, 45.000, 'lots of planets with atmosphere of poison clouds', false, 5);
INSERT INTO public.galaxy VALUES (4, 'GAL554', 1195, 321, 85.000, 'lots of planets with visible water body like earth', true, 3);
INSERT INTO public.galaxy VALUES (5, 'GAL77485', 4456, 34, 20.000, 'Very far away from our galaxy and immposible to find any new evidences', false, 3);
INSERT INTO public.galaxy VALUES (6, 'GAL5484', 183, 45, 65.000, 'no visible sun for the source of light', false, 1);
INSERT INTO public.galaxy VALUES (7, 'GAL5486', 421, 12, 84.000, 'looks like it has a many planets with atmosphere of oxygen', true, 7);
INSERT INTO public.galaxy VALUES (8, 'GAL7784', 951, 15, 12.000, 'very distant galaxy with very low possibility of surviving planets', false, 8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (9, 'MOON999', 15, 4, NULL);
INSERT INTO public.moon VALUES (10, 'MOON847', 13, 3, NULL);
INSERT INTO public.moon VALUES (21, 'MOON321', 8, 9, NULL);
INSERT INTO public.moon VALUES (22, 'MOON227', 9, 6, NULL);
INSERT INTO public.moon VALUES (23, 'MOON54', 13, 7, NULL);
INSERT INTO public.moon VALUES (24, 'MOON11', 16, 9, NULL);
INSERT INTO public.moon VALUES (25, 'MOON101', 8, 8, NULL);
INSERT INTO public.moon VALUES (26, 'MOON205', 3, 7, NULL);
INSERT INTO public.moon VALUES (27, 'MOON305', 8, 5, NULL);
INSERT INTO public.moon VALUES (28, 'MOON420', 13, 1, NULL);
INSERT INTO public.moon VALUES (32, 'MOON555', 15, 9, NULL);
INSERT INTO public.moon VALUES (33, 'MOON621', 12, 8, NULL);
INSERT INTO public.moon VALUES (34, 'MOON742', 13, 7, NULL);
INSERT INTO public.moon VALUES (1, 'MOON123', 3, 2, 'Dust');
INSERT INTO public.moon VALUES (2, 'MOON234', 8, 5, 'Nitrogen');
INSERT INTO public.moon VALUES (5, 'MOON465', 17, 4, 'Carbon Dioxide');
INSERT INTO public.moon VALUES (6, 'MOON845', 13, 3, 'Sulphur');
INSERT INTO public.moon VALUES (11, 'MOON954', 12, 2, 'Diamond');
INSERT INTO public.moon VALUES (12, 'MOON772', 16, 1, 'Oxygen');
INSERT INTO public.moon VALUES (13, 'MOON544', 13, 3, 'Dust');
INSERT INTO public.moon VALUES (14, 'MOON112', 16, 4, 'Oxygen');
INSERT INTO public.moon VALUES (15, 'MOON231', 3, 3, 'Nitrogen');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'PAL456', 8, true, 1);
INSERT INTO public.planet VALUES (7, 'PAL487', 7, false, 5);
INSERT INTO public.planet VALUES (8, 'PAL512', 12, false, 4);
INSERT INTO public.planet VALUES (9, 'PAL123', 12, false, 5);
INSERT INTO public.planet VALUES (12, 'PAL325', 10, NULL, 2);
INSERT INTO public.planet VALUES (13, 'PAL48', 12, false, 3);
INSERT INTO public.planet VALUES (14, 'PAL345', 12, true, 5);
INSERT INTO public.planet VALUES (15, 'PAL3251', 9, NULL, 4);
INSERT INTO public.planet VALUES (16, 'PAL4854', 11, false, 3);
INSERT INTO public.planet VALUES (17, 'PAL3451', 7, true, 2);
INSERT INTO public.planet VALUES (22, 'PAL108', 18, true, 7);
INSERT INTO public.planet VALUES (23, 'PAL906', 18, false, 3);
INSERT INTO public.planet VALUES (24, 'PAL807', 19, NULL, 1);
INSERT INTO public.planet VALUES (25, 'PAL605', 20, NULL, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'STAR1564', 5, 458, 6.112, 3);
INSERT INTO public.star VALUES (8, 'STAR8457', 6, 485, 3.102, 1);
INSERT INTO public.star VALUES (9, 'STAR9851', 2, 845, 8.123, 1);
INSERT INTO public.star VALUES (10, 'STAR6325', 5, 254, 6.541, 5);
INSERT INTO public.star VALUES (11, 'STAR8451', 6, 485, 5.251, 3);
INSERT INTO public.star VALUES (12, 'STAR3254', 3, 521, 63.212, 4);
INSERT INTO public.star VALUES (18, 'STAR1023', 8, 564, 59.000, 8);
INSERT INTO public.star VALUES (19, 'STAR841', 7, 845, 84.000, 9);
INSERT INTO public.star VALUES (20, 'STAR923', 6, 234, 99.451, 5);


--
-- Name: discoveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discoveries_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 36, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 25, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: discoveries discoveries_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoveries
    ADD CONSTRAINT discoveries_pkey PRIMARY KEY (discoveries_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: discoveries unique_id_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.discoveries
    ADD CONSTRAINT unique_id_name UNIQUE (discoveries_id, name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


--
-- Name: galaxy galaxy_discovered_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_discovered_by_fkey FOREIGN KEY (discoveries_id) REFERENCES public.discoveries(discoveries_id);


--
-- Name: moon moon_discovered_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_discovered_by_fkey FOREIGN KEY (discoveries_id) REFERENCES public.discoveries(discoveries_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_discovered_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_discovered_by_fkey FOREIGN KEY (discoveries_id) REFERENCES public.discoveries(discoveries_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_discovered_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_discovered_by_fkey FOREIGN KEY (discoveries_id) REFERENCES public.discoveries(discoveries_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

