--
-- PostgreSQL database dump
--


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



CREATE TABLE public.temp_demonstrativos (
    data date,
    operadora_id integer,
    cd_conta_contabil text,
    categoria text,
    vl_saldo_inicial numeric,
    vl_saldo_final numeric
);

