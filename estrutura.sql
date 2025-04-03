--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: demonstracoes_contabeis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demonstracoes_contabeis (
    id integer NOT NULL,
    data date NOT NULL,
    reg_ans character varying(20) NOT NULL,
    cd_conta character varying(50) NOT NULL,
    descricao text NOT NULL,
    valor_inicial text,
    valor_final text
);


ALTER TABLE public.demonstracoes_contabeis OWNER TO postgres;

--
-- Name: demonstracoes_contabeis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.demonstracoes_contabeis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.demonstracoes_contabeis_id_seq OWNER TO postgres;

--
-- Name: demonstracoes_contabeis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.demonstracoes_contabeis_id_seq OWNED BY public.demonstracoes_contabeis.id;


--
-- Name: demonstrativos_contabeis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demonstrativos_contabeis (
    id integer NOT NULL,
    operadora_id integer NOT NULL,
    ano integer NOT NULL,
    trimestre integer NOT NULL,
    categoria text NOT NULL,
    valor numeric(10,2) NOT NULL
);


ALTER TABLE public.demonstrativos_contabeis OWNER TO postgres;

--
-- Name: demonstrativos_contabeis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.demonstrativos_contabeis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.demonstrativos_contabeis_id_seq OWNER TO postgres;

--
-- Name: demonstrativos_contabeis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.demonstrativos_contabeis_id_seq OWNED BY public.demonstrativos_contabeis.id;


--
-- Name: operadoras_ativas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operadoras_ativas (
    operadora_id integer NOT NULL,
    nome_operadora character varying(255),
    cnpj character varying(18),
    status_operadora character varying(50),
    tipo_operadora character varying(50),
    municipio character varying(255),
    uf character varying(2),
    codigo_operadora integer
);


ALTER TABLE public.operadoras_ativas OWNER TO postgres;

--
-- Name: temp_demonstrativos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_demonstrativos (
    data date,
    operadora_id integer,
    cd_conta_contabil text,
    categoria text,
    vl_saldo_inicial numeric,
    vl_saldo_final numeric
);


ALTER TABLE public.temp_demonstrativos OWNER TO postgres;

--
-- Name: demonstracoes_contabeis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demonstracoes_contabeis ALTER COLUMN id SET DEFAULT nextval('public.demonstracoes_contabeis_id_seq'::regclass);


--
-- Name: demonstrativos_contabeis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demonstrativos_contabeis ALTER COLUMN id SET DEFAULT nextval('public.demonstrativos_contabeis_id_seq'::regclass);


--
-- Name: demonstracoes_contabeis demonstracoes_contabeis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demonstracoes_contabeis
    ADD CONSTRAINT demonstracoes_contabeis_pkey PRIMARY KEY (id);


--
-- Name: demonstrativos_contabeis demonstrativos_contabeis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demonstrativos_contabeis
    ADD CONSTRAINT demonstrativos_contabeis_pkey PRIMARY KEY (id);


--
-- Name: operadoras_ativas operadoras_ativas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operadoras_ativas
    ADD CONSTRAINT operadoras_ativas_pkey PRIMARY KEY (operadora_id);


--
-- PostgreSQL database dump complete
--

