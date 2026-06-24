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
    user_id integer,
    number_of_guesses integer NOT NULL
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
    username character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (1, 2, 13);
INSERT INTO public.games VALUES (2, 3, 465);
INSERT INTO public.games VALUES (3, 3, 185);
INSERT INTO public.games VALUES (4, 4, 30);
INSERT INTO public.games VALUES (5, 4, 254);
INSERT INTO public.games VALUES (6, 3, 374);
INSERT INTO public.games VALUES (7, 3, 190);
INSERT INTO public.games VALUES (8, 3, 842);
INSERT INTO public.games VALUES (9, 5, 423);
INSERT INTO public.games VALUES (10, 5, 230);
INSERT INTO public.games VALUES (11, 6, 548);
INSERT INTO public.games VALUES (12, 6, 766);
INSERT INTO public.games VALUES (13, 5, 450);
INSERT INTO public.games VALUES (14, 5, 80);
INSERT INTO public.games VALUES (15, 5, 142);
INSERT INTO public.games VALUES (16, 7, 103);
INSERT INTO public.games VALUES (17, 7, 688);
INSERT INTO public.games VALUES (18, 8, 725);
INSERT INTO public.games VALUES (19, 8, 819);
INSERT INTO public.games VALUES (20, 7, 783);
INSERT INTO public.games VALUES (21, 7, 653);
INSERT INTO public.games VALUES (22, 7, 495);
INSERT INTO public.games VALUES (23, 9, 500);
INSERT INTO public.games VALUES (24, 9, 852);
INSERT INTO public.games VALUES (25, 10, 353);
INSERT INTO public.games VALUES (26, 10, 476);
INSERT INTO public.games VALUES (27, 9, 248);
INSERT INTO public.games VALUES (28, 9, 142);
INSERT INTO public.games VALUES (29, 9, 918);
INSERT INTO public.games VALUES (30, 11, 894);
INSERT INTO public.games VALUES (31, 11, 279);
INSERT INTO public.games VALUES (32, 12, 360);
INSERT INTO public.games VALUES (33, 12, 965);
INSERT INTO public.games VALUES (34, 11, 1);
INSERT INTO public.games VALUES (35, 11, 928);
INSERT INTO public.games VALUES (36, 11, 16);
INSERT INTO public.games VALUES (37, 13, 763);
INSERT INTO public.games VALUES (38, 13, 132);
INSERT INTO public.games VALUES (39, 14, 982);
INSERT INTO public.games VALUES (40, 14, 251);
INSERT INTO public.games VALUES (41, 13, 709);
INSERT INTO public.games VALUES (42, 13, 464);
INSERT INTO public.games VALUES (43, 13, 982);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'aaa');
INSERT INTO public.users VALUES (2, '11123');
INSERT INTO public.users VALUES (3, 'user_1782305161009');
INSERT INTO public.users VALUES (4, 'user_1782305161008');
INSERT INTO public.users VALUES (5, 'user_1782305206298');
INSERT INTO public.users VALUES (6, 'user_1782305206297');
INSERT INTO public.users VALUES (7, 'user_1782305322971');
INSERT INTO public.users VALUES (8, 'user_1782305322970');
INSERT INTO public.users VALUES (9, 'user_1782305405430');
INSERT INTO public.users VALUES (10, 'user_1782305405429');
INSERT INTO public.users VALUES (11, 'user_1782305491464');
INSERT INTO public.users VALUES (12, 'user_1782305491463');
INSERT INTO public.users VALUES (13, 'user_1782305524360');
INSERT INTO public.users VALUES (14, 'user_1782305524359');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 43, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


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
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

