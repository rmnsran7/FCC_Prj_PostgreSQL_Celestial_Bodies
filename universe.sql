--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(50) NOT NULL,
    description character varying(200),
    galaxy_type character varying(10),
    distance_from_earth_ly double precision,
    blackhole boolean,
    CONSTRAINT galaxy_type_not_null CHECK ((galaxy_type IS NOT NULL))
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
-- Name: life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life (
    life_id integer NOT NULL,
    name character varying(100) NOT NULL,
    no_of_cells integer,
    water_based boolean,
    land_based boolean,
    can_fly boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.life OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_life_id_seq OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_life_id_seq OWNED BY public.life.life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    distance_from_planet_in_km double precision,
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    decription character varying(200),
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(50),
    description character varying(200),
    mass_in_sm numeric(35,5),
    galaxy_id integer NOT NULL,
    age integer
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
-- Name: life life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life ALTER COLUMN life_id SET DEFAULT nextval('public.life_life_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home galaxy of the Solar System', 'spiral', 100000, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to the Milky Way', 'spiral', 250000, false);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Supermassive elliptical galaxy', 'elliptical', 55000000, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Interacting spiral galaxy', 'spiral', 23000000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Unusual galaxy with a distinct bulge', 'spiral', 29000000, false);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 'Ring galaxy with a unique appearance', 'ring', 50000000, false);


--
-- Data for Name: life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life VALUES (1, 'Aquatic Microbe', 1, true, false, false, 3);
INSERT INTO public.life VALUES (2, 'Human', 37, false, true, false, 3);
INSERT INTO public.life VALUES (3, 'Eagle', 7000, true, true, true, 3);
INSERT INTO public.life VALUES (4, 'Dolphin', 1009, true, true, false, 3);
INSERT INTO public.life VALUES (5, 'Butterfly', 0, false, true, true, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (24, 'Luna', 'Earth''s natural satellite', 384400, 3);
INSERT INTO public.moon VALUES (25, 'Phobos', 'Larger and closer moon of Mars', 9377, 4);
INSERT INTO public.moon VALUES (26, 'Deimos', 'Smaller and outer moon of Mars', 23460, 4);
INSERT INTO public.moon VALUES (27, 'Ganymede', 'Largest moon of Jupiter', 1070400, 5);
INSERT INTO public.moon VALUES (28, 'Callisto', 'Second-largest moon of Jupiter', 1882700, 5);
INSERT INTO public.moon VALUES (29, 'Io', 'Innermost of the Galilean moons of Jupiter', 421800, 5);
INSERT INTO public.moon VALUES (30, 'Europa', 'Icy moon of Jupiter', 671100, 5);
INSERT INTO public.moon VALUES (31, 'Titan', 'Largest moon of Saturn', 1221870, 6);
INSERT INTO public.moon VALUES (32, 'Rhea', 'Second-largest moon of Saturn', 527040, 6);
INSERT INTO public.moon VALUES (33, 'Iapetus', 'Outermost large moon of Saturn', 3561300, 6);
INSERT INTO public.moon VALUES (34, 'Miranda', 'Moon of Uranus', 129900, 7);
INSERT INTO public.moon VALUES (35, 'Triton', 'Largest moon of Neptune', 354800, 8);
INSERT INTO public.moon VALUES (36, 'Proteus', 'Second-largest moon of Neptune', 117647, 8);
INSERT INTO public.moon VALUES (37, 'Charon', 'Moon of Pluto', 19571, 9);
INSERT INTO public.moon VALUES (38, 'Kepler-1625b I', 'Exomoon orbiting Kepler-1625b', 377500, 10);
INSERT INTO public.moon VALUES (39, 'Endor', 'Forest moon of the gas giant planet Yavin 4', 4900, 11);
INSERT INTO public.moon VALUES (40, 'Pandora', 'Moon in orbit around the gas giant Polyphemus', 141700, 12);
INSERT INTO public.moon VALUES (41, 'Ariel', 'Moon of Uranus', 191240, 7);
INSERT INTO public.moon VALUES (42, 'Umbriel', 'Moon of Uranus', 266300, 7);
INSERT INTO public.moon VALUES (43, 'Titania', 'Moon of Uranus', 435910, 7);
INSERT INTO public.moon VALUES (44, 'Oberon', 'Moon of Uranus', 584000, 7);
INSERT INTO public.moon VALUES (45, 'Nereid', 'Third-largest moon of Neptune', 5513810, 8);
INSERT INTO public.moon VALUES (46, 'Triton-2', 'Moon of Neptune', 354800, 8);
INSERT INTO public.moon VALUES (47, 'Styx', 'Moon of Pluto', 42656, 9);
INSERT INTO public.moon VALUES (48, 'Kerberos', 'Moon of Pluto', 57783, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Innermost planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun, known for its thick atmosphere', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third planet from the Sun, home to a wide variety of life forms', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Red planet with a thin atmosphere', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in the Solar System', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its prominent rings', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Giant planet with a unique tilt', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Blue planet with active weather patterns', false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'Exoplanet orbiting the red dwarf star Kepler-186', true, 2);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1d', 'Exoplanet in the habitable zone of the ultracool dwarf star TRAPPIST-1', true, 3);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'Exoplanet orbiting Proxima Centauri, the closest star to the Sun', true, 4);
INSERT INTO public.planet VALUES (12, 'HD 40307 g', 'Super-Earth exoplanet in the habitable zone of the star HD 40307', true, 5);
INSERT INTO public.planet VALUES (13, 'WASP-12b', 'Hot Jupiter exoplanet with a very short orbital period', false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Main sequence star at the center of the Solar System', 1.98900, 1, 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red dwarf star closest to the Sun', 2.44700, 1, 56100);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant in the constellation of Orion', 1.40000, 2, 8600);
INSERT INTO public.star VALUES (4, 'Sirius', 'Brightest star in the night sky', 2.06300, 1, 23000);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Primary star in the Alpha Centauri system', 2.18000, 1, 6000);
INSERT INTO public.star VALUES (6, 'Polaris', 'North Star in the constellation Ursa Minor', 6.56200, 1, 7000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: life_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_life_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 48, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: life life_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_name_key UNIQUE (name);


--
-- Name: life life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_pkey PRIMARY KEY (life_id);


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
-- Name: life life_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

