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
    user_id integer NOT NULL,
    score integer NOT NULL
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
    name character varying(30) NOT NULL
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

INSERT INTO public.games VALUES (1, 6, 426);
INSERT INTO public.games VALUES (2, 6, 565);
INSERT INTO public.games VALUES (3, 7, 927);
INSERT INTO public.games VALUES (4, 7, 487);
INSERT INTO public.games VALUES (5, 6, 663);
INSERT INTO public.games VALUES (6, 6, 32);
INSERT INTO public.games VALUES (7, 6, 997);
INSERT INTO public.games VALUES (8, 5, 8);
INSERT INTO public.games VALUES (9, 8, 915);
INSERT INTO public.games VALUES (10, 8, 659);
INSERT INTO public.games VALUES (11, 9, 607);
INSERT INTO public.games VALUES (12, 9, 774);
INSERT INTO public.games VALUES (13, 8, 152);
INSERT INTO public.games VALUES (14, 8, 791);
INSERT INTO public.games VALUES (15, 8, 761);
INSERT INTO public.games VALUES (16, 10, 996);
INSERT INTO public.games VALUES (17, 10, 878);
INSERT INTO public.games VALUES (18, 11, 632);
INSERT INTO public.games VALUES (19, 11, 881);
INSERT INTO public.games VALUES (20, 10, 470);
INSERT INTO public.games VALUES (21, 10, 93);
INSERT INTO public.games VALUES (22, 10, 920);
INSERT INTO public.games VALUES (23, 12, 350);
INSERT INTO public.games VALUES (24, 12, 532);
INSERT INTO public.games VALUES (25, 13, 917);
INSERT INTO public.games VALUES (26, 13, 614);
INSERT INTO public.games VALUES (27, 12, 441);
INSERT INTO public.games VALUES (28, 12, 394);
INSERT INTO public.games VALUES (29, 12, 123);
INSERT INTO public.games VALUES (30, 14, 257);
INSERT INTO public.games VALUES (31, 14, 539);
INSERT INTO public.games VALUES (32, 15, 831);
INSERT INTO public.games VALUES (33, 15, 392);
INSERT INTO public.games VALUES (34, 14, 101);
INSERT INTO public.games VALUES (35, 14, 459);
INSERT INTO public.games VALUES (36, 14, 680);
INSERT INTO public.games VALUES (37, 16, 408);
INSERT INTO public.games VALUES (38, 16, 282);
INSERT INTO public.games VALUES (39, 17, 922);
INSERT INTO public.games VALUES (40, 17, 227);
INSERT INTO public.games VALUES (41, 16, 132);
INSERT INTO public.games VALUES (42, 16, 108);
INSERT INTO public.games VALUES (43, 16, 207);
INSERT INTO public.games VALUES (44, 18, 592);
INSERT INTO public.games VALUES (45, 18, 255);
INSERT INTO public.games VALUES (46, 19, 204);
INSERT INTO public.games VALUES (47, 19, 771);
INSERT INTO public.games VALUES (48, 18, 268);
INSERT INTO public.games VALUES (49, 18, 121);
INSERT INTO public.games VALUES (50, 18, 232);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1793758732372');
INSERT INTO public.users VALUES (2, 'user_1793758732373');
INSERT INTO public.users VALUES (3, 'user_1793758749563');
INSERT INTO public.users VALUES (4, 'user_1793758749562');
INSERT INTO public.users VALUES (5, 'Elijah');
INSERT INTO public.users VALUES (6, 'user_1793758785658');
INSERT INTO public.users VALUES (7, 'user_1793758785657');
INSERT INTO public.users VALUES (8, 'user_1793758957802');
INSERT INTO public.users VALUES (9, 'user_1793758957801');
INSERT INTO public.users VALUES (10, 'user_1793759023531');
INSERT INTO public.users VALUES (11, 'user_1793759023530');
INSERT INTO public.users VALUES (12, 'user_1793759347866');
INSERT INTO public.users VALUES (13, 'user_1793759347865');
INSERT INTO public.users VALUES (14, 'user_1793759363277');
INSERT INTO public.users VALUES (15, 'user_1793759363276');
INSERT INTO public.users VALUES (16, 'user_1793759373091');
INSERT INTO public.users VALUES (17, 'user_1793759373090');
INSERT INTO public.users VALUES (18, 'user_1793759412545');
INSERT INTO public.users VALUES (19, 'user_1793759412544');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 50, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 19, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

