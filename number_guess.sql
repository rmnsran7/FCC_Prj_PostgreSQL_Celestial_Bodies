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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    random_number integer NOT NULL,
    total_guess integer DEFAULT 0 NOT NULL,
    user_id integer NOT NULL,
    guessed boolean DEFAULT false
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 42, 4, 1, true);
INSERT INTO public.games VALUES (2, 88, 6, 1, true);
INSERT INTO public.games VALUES (3, 17, 1, 1, true);
INSERT INTO public.games VALUES (4, 63, 8, 1, true);
INSERT INTO public.games VALUES (5, 29, 3, 1, true);
INSERT INTO public.games VALUES (6, 55, 5, 1, true);
INSERT INTO public.games VALUES (7, 71, 6, 1, true);
INSERT INTO public.games VALUES (8, 39, 2, 1, true);
INSERT INTO public.games VALUES (9, 83, 7, 1, true);
INSERT INTO public.games VALUES (10, 12, 3, 1, true);
INSERT INTO public.games VALUES (11, 68, 5, 1, true);
INSERT INTO public.games VALUES (12, 92, 9, 1, true);
INSERT INTO public.games VALUES (13, 21, 2, 1, true);
INSERT INTO public.games VALUES (14, 76, 6, 1, true);
INSERT INTO public.games VALUES (15, 34, 4, 1, true);
INSERT INTO public.games VALUES (16, 57, 7, 1, true);
INSERT INTO public.games VALUES (17, 126, 0, 1, false);
INSERT INTO public.games VALUES (18, 4, 0, 1, false);
INSERT INTO public.games VALUES (19, 5, 0, 1, false);
INSERT INTO public.games VALUES (20, 6, 6, 1, true);
INSERT INTO public.games VALUES (21, 6, 6, 4, true);
INSERT INTO public.games VALUES (22, 7, 8, 5, true);
INSERT INTO public.games VALUES (23, 6, 7, 5, true);
INSERT INTO public.games VALUES (24, 2, 3, 6, true);
INSERT INTO public.games VALUES (25, 8, 9, 6, true);
INSERT INTO public.games VALUES (26, 6, 9, 5, true);
INSERT INTO public.games VALUES (27, 4, 6, 5, true);
INSERT INTO public.games VALUES (28, 2, 3, 5, true);
INSERT INTO public.games VALUES (29, 9, 10, 7, true);
INSERT INTO public.games VALUES (30, 8, 9, 7, true);
INSERT INTO public.games VALUES (31, 2, 3, 8, true);
INSERT INTO public.games VALUES (32, 5, 6, 8, true);
INSERT INTO public.games VALUES (33, 3, 6, 7, true);
INSERT INTO public.games VALUES (34, 1, 3, 7, true);
INSERT INTO public.games VALUES (35, 9, 10, 7, true);
INSERT INTO public.games VALUES (36, 7, 8, 9, true);
INSERT INTO public.games VALUES (37, 8, 9, 9, true);
INSERT INTO public.games VALUES (38, 1, 2, 10, true);
INSERT INTO public.games VALUES (39, 1, 2, 10, true);
INSERT INTO public.games VALUES (40, 2, 5, 9, true);
INSERT INTO public.games VALUES (41, 5, 7, 9, true);
INSERT INTO public.games VALUES (42, 3, 4, 9, true);
INSERT INTO public.games VALUES (43, 7, 8, 11, true);
INSERT INTO public.games VALUES (44, 2, 3, 11, true);
INSERT INTO public.games VALUES (45, 1, 2, 12, true);
INSERT INTO public.games VALUES (46, 6, 7, 12, true);
INSERT INTO public.games VALUES (47, 9, 12, 11, true);
INSERT INTO public.games VALUES (48, 2, 4, 11, true);
INSERT INTO public.games VALUES (49, 7, 8, 11, true);
INSERT INTO public.games VALUES (50, 5, 6, 13, true);
INSERT INTO public.games VALUES (51, 9, 10, 13, true);
INSERT INTO public.games VALUES (52, 9, 10, 14, true);
INSERT INTO public.games VALUES (53, 1, 2, 14, true);
INSERT INTO public.games VALUES (54, 3, 6, 13, true);
INSERT INTO public.games VALUES (55, 6, 8, 13, true);
INSERT INTO public.games VALUES (56, 7, 8, 13, true);
INSERT INTO public.games VALUES (57, 1, 2, 15, true);
INSERT INTO public.games VALUES (58, 10, 11, 15, true);
INSERT INTO public.games VALUES (59, 4, 5, 16, true);
INSERT INTO public.games VALUES (60, 5, 6, 16, true);
INSERT INTO public.games VALUES (61, 5, 8, 15, true);
INSERT INTO public.games VALUES (62, 3, 5, 15, true);
INSERT INTO public.games VALUES (63, 2, 3, 15, true);
INSERT INTO public.games VALUES (64, 7, 0, 1, false);
INSERT INTO public.games VALUES (65, 911, 912, 17, true);
INSERT INTO public.games VALUES (66, 817, 818, 17, true);
INSERT INTO public.games VALUES (67, 66, 67, 18, true);
INSERT INTO public.games VALUES (68, 510, 511, 18, true);
INSERT INTO public.games VALUES (69, 167, 170, 17, true);
INSERT INTO public.games VALUES (70, 448, 450, 17, true);
INSERT INTO public.games VALUES (71, 674, 675, 17, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Raman');
INSERT INTO public.users VALUES (2, 'djfgkdf');
INSERT INTO public.users VALUES (3, 'sfdgbfbfd');
INSERT INTO public.users VALUES (4, 'rdfuighodfjk');
INSERT INTO public.users VALUES (5, 'user_1731874636341');
INSERT INTO public.users VALUES (6, 'user_1731874636340');
INSERT INTO public.users VALUES (7, 'user_1731874659882');
INSERT INTO public.users VALUES (8, 'user_1731874659881');
INSERT INTO public.users VALUES (9, 'user_1731874772481');
INSERT INTO public.users VALUES (10, 'user_1731874772480');
INSERT INTO public.users VALUES (11, 'user_1731874954032');
INSERT INTO public.users VALUES (12, 'user_1731874954031');
INSERT INTO public.users VALUES (13, 'user_1731874986032');
INSERT INTO public.users VALUES (14, 'user_1731874986031');
INSERT INTO public.users VALUES (15, 'user_1731875085909');
INSERT INTO public.users VALUES (16, 'user_1731875085908');
INSERT INTO public.users VALUES (17, 'user_1731875191726');
INSERT INTO public.users VALUES (18, 'user_1731875191725');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 71, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games fkey_user_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fkey_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

