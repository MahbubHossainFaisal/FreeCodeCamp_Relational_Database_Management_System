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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_stars_in_billions integer,
    avg_temperature_kelvin integer,
    distance_light_years_in_millions numeric,
    description text,
    has_life boolean
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
    orbit_period integer,
    crater_count integer,
    radius_in_km numeric,
    description text,
    has_life boolean,
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
    avg_temperature_kelvin integer,
    age_in_millions_of_years integer,
    mass_in_exatons numeric,
    description text,
    has_life boolean,
    star_id integer
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
    avg_temperature_kelvin integer,
    age_in_millions_of_years integer,
    distance_light_years numeric,
    description text,
    has_life boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet_junction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet_junction (
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30),
    star_planet_junction_id integer NOT NULL
);


ALTER TABLE public.star_planet_junction OWNER TO freecodecamp;

--
-- Name: star_planet_junction_sl_no_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_junction_sl_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_junction_sl_no_seq OWNER TO freecodecamp;

--
-- Name: star_planet_junction_sl_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_junction_sl_no_seq OWNED BY public.star_planet_junction.star_planet_junction_id;


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
-- Name: star_planet_junction star_planet_junction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_junction ALTER COLUMN star_planet_junction_id SET DEFAULT nextval('public.star_planet_junction_sl_no_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', 400, 10000, 25, 'Spiral Galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 100, 8000, 24, 'Covering with dark band of dust', false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 800, 15000, 31, 'Prominant dust lane resembling a sombrero hat', false);
INSERT INTO public.galaxy VALUES (2, 'Milky way', 100, 5800, 3, 'contains our solar system', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40, 8000, 3, 'located 3 million years away from earth', false);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 1000, 10000, 3, 'Spiral galaxy located 2.53 million years away from earth', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 27, 500000, 1737, 'Neutral satelite of earth', false, 1);
INSERT INTO public.moon VALUES (2, 'Titan', 16, 50, 2575, 'Largest moon of saturn', false, 2);
INSERT INTO public.moon VALUES (3, 'Europa', 3, 100, 1561, 'One of the moon of jupiter', false, 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', 7, 50, 2634, 'Largest moon of jupiter', false, 3);
INSERT INTO public.moon VALUES (5, 'Callisto', 16, 25, 2410, 'Second largest moon of jupiter', false, 3);
INSERT INTO public.moon VALUES (6, 'Lo', 2, 400, 1821, 'The innermost moon of jupiter', false, 3);
INSERT INTO public.moon VALUES (7, 'Enceladus', 1, 15, 504, 'A moon of saturn', false, 6);
INSERT INTO public.moon VALUES (8, 'Triton', 6, 40, 1353, 'largest moon of neptune', false, 7);
INSERT INTO public.moon VALUES (9, 'Charon', 6, 10, 606, 'Largest moon of pluto', false, 9);
INSERT INTO public.moon VALUES (10, 'Eeriota', 3, 70, 1561, 'A moon of Jupiter', false, 3);
INSERT INTO public.moon VALUES (11, 'Phobos', 0, 20, 11, 'The largest moon of mars', false, 2);
INSERT INTO public.moon VALUES (12, 'Miranda', 1, 15, 235, 'A moon of uranus', false, 8);
INSERT INTO public.moon VALUES (13, 'Phoebe', 0, 5, 106, 'A moon of saturn', false, 6);
INSERT INTO public.moon VALUES (14, 'Oberon', 13, 30, 761, 'Second largest moon of uranus', false, 8);
INSERT INTO public.moon VALUES (15, 'Titania', 8, 25, 789, 'Largest moon of uranus', false, 8);
INSERT INTO public.moon VALUES (16, 'Rhea', 4, 60, 764, 'A moon of saturn', false, 6);
INSERT INTO public.moon VALUES (17, 'Hyperion', 21, 10, 135, 'A moon of saturn', false, 6);
INSERT INTO public.moon VALUES (18, 'Chariklo', 63, 5, 124, 'A minor planet with ring based system', false, 8);
INSERT INTO public.moon VALUES (19, 'Tethys', 2, 50, 531, 'A mid sized moon of saturn', false, 6);
INSERT INTO public.moon VALUES (20, 'Larissa', 0, 8, 97, 'A moon of neptune', false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 288, 5, 6, 'The third planet from the sun in solar system', true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 210, 5, 1, 'The forth planet from the sun in our solar system', false, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 165, 4, 2, 'The largest planet in our solar system', false, 3);
INSERT INTO public.planet VALUES (4, 'Venus', 735, 4, 5, 'The second planet from the sun', false, 1);
INSERT INTO public.planet VALUES (5, 'MMercury', 340, 5, 1, 'Closest planet to the sun', false, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 134, 5, 4, 'A gas giant', false, 6);
INSERT INTO public.planet VALUES (7, 'Neptune', 58, 5, 17, 'The eighth planet from the sun', false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 59, 5, 15, 'A gas giant', false, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 44, 5, 1, 'A dwarf planet', false, 4);
INSERT INTO public.planet VALUES (10, 'Makemake', 30, 5, 0, 'A dwarf planet in Kuiper Bel', false, 6);
INSERT INTO public.planet VALUES (11, 'Eris', 30, 4, 0, 'Dwarf planet in outer solar system', false, 5);
INSERT INTO public.planet VALUES (12, 'Ceres', 168, 5, 0, 'Largest object in asteroid belt', false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, 4600, 0, 'The star at the center of our solar system', false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3042, 5, 4, 'Closest star to our solar system', false, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 3500, 9, 640, 'A red supergiant star', false, 3);
INSERT INTO public.star VALUES (4, 'Vega', 9600, 455, 25, 'bright star in night sky', false, 4);
INSERT INTO public.star VALUES (5, 'Regal', 11000, 10, 860, 'A blue supergiant star', false, 5);
INSERT INTO public.star VALUES (6, 'Alpha Crushis', 27000, 8, 320, 'A multiple star system', false, 6);


--
-- Data for Name: star_planet_junction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet_junction VALUES (1, 1, 'Junction 1', 1);
INSERT INTO public.star_planet_junction VALUES (2, 2, 'Junction 2', 2);
INSERT INTO public.star_planet_junction VALUES (3, 3, 'Jumction 3', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_planet_junction_sl_no_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_junction_sl_no_seq', 3, true);


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
-- Name: star_planet_junction star_planet_junction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_junction
    ADD CONSTRAINT star_planet_junction_pkey PRIMARY KEY (star_planet_junction_id);


--
-- Name: galaxy unique_name_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_constraint UNIQUE (name);


--
-- Name: moon unique_name_constraint2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_constraint2 UNIQUE (name);


--
-- Name: planet unique_name_constraint3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_constraint3 UNIQUE (name);


--
-- Name: star unique_name_constraint4; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_constraint4 UNIQUE (name);


--
-- Name: star_planet_junction unique_name_constraint5; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet_junction
    ADD CONSTRAINT unique_name_constraint5 UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- PostgreSQL database dump complete
--

