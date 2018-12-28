--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5 (Ubuntu 10.5-0ubuntu0.18.04)
-- Dumped by pg_dump version 11.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: completehotelrooms(); Type: FUNCTION; Schema: public; Owner: homestead
--

CREATE FUNCTION public.completehotelrooms() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                DECLARE
                i INTEGER := 25;
                j INTEGER := 0;
                k INTEGER := 0;
                aux INTEGER := 0;
                price INTEGER := 100;
                valor INTEGER := NEW.id;
                BEGIN           
                LOOP 
                    EXIT WHEN j = i;
                    j := j + 1;  
                    k := k + 1; 
                    aux := j%4+1;
                    price := price * aux * k; 
                    INSERT INTO hotelrooms( hotel_id,number_of_beds,room_type,room_number,room_price_per_day,floor_number,available,created_at,updated_at) VALUES (valor,aux,k,j,price,j+1,true, NEW.created_at,NEW.updated_at);
                    IF k = 4 THEN
                        k := 0;
                    END IF;
                    price:=100;
                END LOOP ;
                RETURN NEW;
            END
            $$;


ALTER FUNCTION public.completehotelrooms() OWNER TO homestead;

--
-- Name: darrol(); Type: FUNCTION; Schema: public; Owner: homestead
--

CREATE FUNCTION public.darrol() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                BEGIN            
                 UPDATE users
                 SET rol_id = 1
                 WHERE users.id = NEW.id   
                ;
                RETURN NEW;
            END
            $$;


ALTER FUNCTION public.darrol() OWNER TO homestead;

--
-- Name: llenarasientos(); Type: FUNCTION; Schema: public; Owner: homestead
--

CREATE FUNCTION public.llenarasientos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                DECLARE
                i INTEGER := 25;
                j INTEGER := 0;
                letter CHAR:= 'a';
                valor INTEGER := NEW.id;
                BEGIN           
                LOOP 
                    EXIT WHEN j = i;
                    j := j + 1;
                    INSERT INTO airplaneseats( flight_id,passenger_id,seat_type,row,seat_letter,available,created_at,updated_at) VALUES 
                    (valor,null,1,j,letter,true, NEW.created_at,NEW.updated_at);
                END LOOP ;
                RETURN NEW;
            END
            $$;


ALTER FUNCTION public.llenarasientos() OWNER TO homestead;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: airplaneseats; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.airplaneseats (
    id integer NOT NULL,
    flight_id integer,
    seat_type smallint NOT NULL,
    "row" integer NOT NULL,
    seat_letter character varying(255) NOT NULL,
    available boolean NOT NULL,
    passenger_id integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.airplaneseats OWNER TO homestead;

--
-- Name: airplaneseats_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.airplaneseats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.airplaneseats_id_seq OWNER TO homestead;

--
-- Name: airplaneseats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.airplaneseats_id_seq OWNED BY public.airplaneseats.id;


--
-- Name: airports; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.airports (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    "phoneNumber" character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.airports OWNER TO homestead;

--
-- Name: airports_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.airports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.airports_id_seq OWNER TO homestead;

--
-- Name: airports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.airports_id_seq OWNED BY public.airports.id;


--
-- Name: cars; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.cars (
    id integer NOT NULL,
    "carModel" character varying(255) NOT NULL,
    "vehicleRegistration" character varying(255) NOT NULL,
    available boolean NOT NULL,
    "passengerCapacity" integer NOT NULL,
    "pricePerHour" integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cars OWNER TO homestead;

--
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_id_seq OWNER TO homestead;

--
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    "cityName" character varying(255) NOT NULL,
    country_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.cities OWNER TO homestead;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO homestead;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    "countryName" character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.countries OWNER TO homestead;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO homestead;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: flightreserves; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.flightreserves (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    airplaneseat_id integer NOT NULL,
    reserve_id integer NOT NULL
);


ALTER TABLE public.flightreserves OWNER TO homestead;

--
-- Name: flightreserves_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.flightreserves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flightreserves_id_seq OWNER TO homestead;

--
-- Name: flightreserves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.flightreserves_id_seq OWNED BY public.flightreserves.id;


--
-- Name: flights; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.flights (
    id integer NOT NULL,
    "flightNumber" character varying(255) NOT NULL,
    "airplaneModel" character varying(255) NOT NULL,
    "airplaneCapacity" integer NOT NULL,
    departure_id integer NOT NULL,
    arrival_id integer NOT NULL,
    "flightDate" date NOT NULL,
    "departureTime" character varying(255) NOT NULL,
    confirmed boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.flights OWNER TO homestead;

--
-- Name: flights_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.flights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flights_id_seq OWNER TO homestead;

--
-- Name: flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.flights_id_seq OWNED BY public.flights.id;


--
-- Name: flightsegments; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.flightsegments (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    flight_id integer NOT NULL,
    segment_id integer NOT NULL
);


ALTER TABLE public.flightsegments OWNER TO homestead;

--
-- Name: flightsegments_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.flightsegments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flightsegments_id_seq OWNER TO homestead;

--
-- Name: flightsegments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.flightsegments_id_seq OWNED BY public.flightsegments.id;


--
-- Name: hotelreserves; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.hotelreserves (
    id integer NOT NULL,
    hotelroom_id integer NOT NULL,
    reserve_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hotelreserves OWNER TO homestead;

--
-- Name: hotelreserves_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.hotelreserves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotelreserves_id_seq OWNER TO homestead;

--
-- Name: hotelreserves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.hotelreserves_id_seq OWNED BY public.hotelreserves.id;


--
-- Name: hotelrooms; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.hotelrooms (
    id integer NOT NULL,
    hotel_id integer NOT NULL,
    number_of_beds integer NOT NULL,
    room_type integer NOT NULL,
    room_number integer NOT NULL,
    room_price_per_day integer NOT NULL,
    floor_number integer NOT NULL,
    available boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hotelrooms OWNER TO homestead;

--
-- Name: hotelrooms_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.hotelrooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotelrooms_id_seq OWNER TO homestead;

--
-- Name: hotelrooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.hotelrooms_id_seq OWNED BY public.hotelrooms.id;


--
-- Name: hotels; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.hotels (
    id integer NOT NULL,
    "hotelName" character varying(255) NOT NULL,
    stars integer NOT NULL,
    "hotelCapacity" integer NOT NULL,
    "phoneNumber" character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.hotels OWNER TO homestead;

--
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotels_id_seq OWNER TO homestead;

--
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- Name: insurences; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.insurences (
    id integer NOT NULL,
    amount integer NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.insurences OWNER TO homestead;

--
-- Name: insurences_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.insurences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insurences_id_seq OWNER TO homestead;

--
-- Name: insurences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.insurences_id_seq OWNED BY public.insurences.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO homestead;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO homestead;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: packagereserves; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.packagereserves (
    id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    reserve_id integer NOT NULL,
    package_id integer NOT NULL
);


ALTER TABLE public.packagereserves OWNER TO homestead;

--
-- Name: packagereserves_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.packagereserves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.packagereserves_id_seq OWNER TO homestead;

--
-- Name: packagereserves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.packagereserves_id_seq OWNED BY public.packagereserves.id;


--
-- Name: packages; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.packages (
    id integer NOT NULL,
    hotelroom_id integer NOT NULL,
    car_id integer NOT NULL,
    airplaneseat_id integer NOT NULL,
    "precioPaquete" integer NOT NULL,
    "fechaInicio" date NOT NULL,
    "fechaTermino" date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.packages OWNER TO homestead;

--
-- Name: packages_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.packages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.packages_id_seq OWNER TO homestead;

--
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.packages_id_seq OWNED BY public.packages.id;


--
-- Name: passengers; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.passengers (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    age integer NOT NULL,
    "checkIn" boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.passengers OWNER TO homestead;

--
-- Name: passengers_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.passengers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passengers_id_seq OWNER TO homestead;

--
-- Name: passengers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.passengers_id_seq OWNED BY public.passengers.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO homestead;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    "paymentMethod" character varying(255) NOT NULL,
    "bankName" character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.payments OWNER TO homestead;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO homestead;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.purchases (
    id integer NOT NULL,
    "totalPrice" integer NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    payment_id integer NOT NULL,
    reserve_id integer NOT NULL
);


ALTER TABLE public.purchases OWNER TO homestead;

--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.purchases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchases_id_seq OWNER TO homestead;

--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;


--
-- Name: records; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.records (
    id integer NOT NULL,
    "logDate" date NOT NULL,
    "logDescription" character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.records OWNER TO homestead;

--
-- Name: records_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.records_id_seq OWNER TO homestead;

--
-- Name: records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.records_id_seq OWNED BY public.records.id;


--
-- Name: reserves; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.reserves (
    id integer NOT NULL,
    "reserveDate" date NOT NULL,
    "reserveBalance" integer NOT NULL,
    insurance boolean NOT NULL,
    user_id integer NOT NULL,
    insurence_id integer NOT NULL,
    car_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.reserves OWNER TO homestead;

--
-- Name: reserves_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.reserves_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reserves_id_seq OWNER TO homestead;

--
-- Name: reserves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.reserves_id_seq OWNED BY public.reserves.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    type integer NOT NULL,
    description character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO homestead;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO homestead;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: segments; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.segments (
    id integer NOT NULL,
    "destinyCity" character varying(255) NOT NULL,
    "waitingTime" integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.segments OWNER TO homestead;

--
-- Name: segments_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.segments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.segments_id_seq OWNER TO homestead;

--
-- Name: segments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.segments_id_seq OWNED BY public.segments.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: homestead
--

CREATE TABLE public.users (
    id integer NOT NULL,
    rol_id integer,
    record_id integer,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    age integer NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    "passportNumber" character varying(255) NOT NULL,
    "phoneNumber" character varying(255) NOT NULL,
    disability boolean NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO homestead;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: homestead
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO homestead;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homestead
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: airplaneseats id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.airplaneseats ALTER COLUMN id SET DEFAULT nextval('public.airplaneseats_id_seq'::regclass);


--
-- Name: airports id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.airports ALTER COLUMN id SET DEFAULT nextval('public.airports_id_seq'::regclass);


--
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: flightreserves id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flightreserves ALTER COLUMN id SET DEFAULT nextval('public.flightreserves_id_seq'::regclass);


--
-- Name: flights id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flights ALTER COLUMN id SET DEFAULT nextval('public.flights_id_seq'::regclass);


--
-- Name: flightsegments id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flightsegments ALTER COLUMN id SET DEFAULT nextval('public.flightsegments_id_seq'::regclass);


--
-- Name: hotelreserves id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.hotelreserves ALTER COLUMN id SET DEFAULT nextval('public.hotelreserves_id_seq'::regclass);


--
-- Name: hotelrooms id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.hotelrooms ALTER COLUMN id SET DEFAULT nextval('public.hotelrooms_id_seq'::regclass);


--
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- Name: insurences id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.insurences ALTER COLUMN id SET DEFAULT nextval('public.insurences_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: packagereserves id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.packagereserves ALTER COLUMN id SET DEFAULT nextval('public.packagereserves_id_seq'::regclass);


--
-- Name: packages id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.packages ALTER COLUMN id SET DEFAULT nextval('public.packages_id_seq'::regclass);


--
-- Name: passengers id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.passengers ALTER COLUMN id SET DEFAULT nextval('public.passengers_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);


--
-- Name: records id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.records ALTER COLUMN id SET DEFAULT nextval('public.records_id_seq'::regclass);


--
-- Name: reserves id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.reserves ALTER COLUMN id SET DEFAULT nextval('public.reserves_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: segments id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.segments ALTER COLUMN id SET DEFAULT nextval('public.segments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: airplaneseats; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.airplaneseats VALUES (1, 1, 1, 1, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (2, 1, 1, 2, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (3, 1, 1, 3, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (4, 1, 1, 4, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (5, 1, 1, 5, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (6, 1, 1, 6, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (7, 1, 1, 7, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (8, 1, 1, 8, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (9, 1, 1, 9, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (10, 1, 1, 10, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (11, 1, 1, 11, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (12, 1, 1, 12, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (13, 1, 1, 13, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (14, 1, 1, 14, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (15, 1, 1, 15, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (16, 1, 1, 16, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (17, 1, 1, 17, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (18, 1, 1, 18, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (19, 1, 1, 19, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (20, 1, 1, 20, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (21, 1, 1, 21, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (22, 1, 1, 22, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (23, 1, 1, 23, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (24, 1, 1, 24, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (25, 1, 1, 25, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (26, 2, 1, 1, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (27, 2, 1, 2, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (28, 2, 1, 3, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (29, 2, 1, 4, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (30, 2, 1, 5, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (31, 2, 1, 6, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (32, 2, 1, 7, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (33, 2, 1, 8, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (34, 2, 1, 9, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (35, 2, 1, 10, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (36, 2, 1, 11, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (37, 2, 1, 12, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (38, 2, 1, 13, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (39, 2, 1, 14, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (40, 2, 1, 15, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (41, 2, 1, 16, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (42, 2, 1, 17, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (43, 2, 1, 18, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (44, 2, 1, 19, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (45, 2, 1, 20, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (46, 2, 1, 21, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (47, 2, 1, 22, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (48, 2, 1, 23, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (49, 2, 1, 24, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (50, 2, 1, 25, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (51, 3, 1, 1, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (52, 3, 1, 2, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (53, 3, 1, 3, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (54, 3, 1, 4, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (55, 3, 1, 5, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (56, 3, 1, 6, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (57, 3, 1, 7, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (58, 3, 1, 8, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (59, 3, 1, 9, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (60, 3, 1, 10, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (61, 3, 1, 11, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (62, 3, 1, 12, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (63, 3, 1, 13, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (64, 3, 1, 14, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (65, 3, 1, 15, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (66, 3, 1, 16, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (67, 3, 1, 17, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (68, 3, 1, 18, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (69, 3, 1, 19, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (70, 3, 1, 20, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (71, 3, 1, 21, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (72, 3, 1, 22, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (73, 3, 1, 23, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (74, 3, 1, 24, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (75, 3, 1, 25, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (76, 4, 1, 1, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (77, 4, 1, 2, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (78, 4, 1, 3, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (79, 4, 1, 4, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (80, 4, 1, 5, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (81, 4, 1, 6, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (82, 4, 1, 7, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (83, 4, 1, 8, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (84, 4, 1, 9, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (85, 4, 1, 10, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (86, 4, 1, 11, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (87, 4, 1, 12, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (88, 4, 1, 13, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (89, 4, 1, 14, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (90, 4, 1, 15, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (91, 4, 1, 16, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (92, 4, 1, 17, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (93, 4, 1, 18, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (94, 4, 1, 19, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (95, 4, 1, 20, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (96, 4, 1, 21, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (97, 4, 1, 22, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (98, 4, 1, 23, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (99, 4, 1, 24, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (100, 4, 1, 25, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (101, 5, 1, 1, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (102, 5, 1, 2, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (103, 5, 1, 3, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (104, 5, 1, 4, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (105, 5, 1, 5, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (106, 5, 1, 6, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (107, 5, 1, 7, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (108, 5, 1, 8, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (109, 5, 1, 9, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (110, 5, 1, 10, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (111, 5, 1, 11, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (112, 5, 1, 12, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (113, 5, 1, 13, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (114, 5, 1, 14, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (115, 5, 1, 15, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (116, 5, 1, 16, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (117, 5, 1, 17, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (118, 5, 1, 18, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (119, 5, 1, 19, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (120, 5, 1, 20, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (121, 5, 1, 21, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (122, 5, 1, 22, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (123, 5, 1, 23, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (124, 5, 1, 24, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (125, 5, 1, 25, 'a', true, NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (126, NULL, 3, 18, 'h', true, 3, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (127, NULL, 2, 5, 'd', false, 4, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (128, NULL, 2, 5, 'g', true, 3, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (129, NULL, 3, 12, 'n', false, 3, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airplaneseats VALUES (130, NULL, 2, 17, 'a', false, 3, '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.airports VALUES (1, 'Baumbach-Schuppe', '326 Hansen Burgs
South Edythe, MT 26104-3035', 'North Una', '+4741093422794', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airports VALUES (2, 'Mueller Inc', '512 Lynch Square
Port Erica, WY 77529', 'Johnstonberg', '+9481990513664', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airports VALUES (3, 'Mante-Reilly', '3448 Hilpert Wells
Madalinefort, CT 53569-3825', 'Destineyborough', '+9115743207157', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airports VALUES (4, 'Medhurst, Lubowitz and Mitchell', '73876 Brown Divide Suite 979
New Hilton, WV 98641-7768', 'Eloisechester', '+4144415192646', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.airports VALUES (5, 'Bosco, Hodkiewicz and Dickinson', '879 Koch Fields
Vaughnton, CA 12688-8804', 'Schuppestad', '+6451039286636', '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.cars VALUES (1, 'Geo Tracker', 'JKJ-871', true, 6, 69, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cars VALUES (2, 'Alpine A110', 'DPI-937', true, 5, 195, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cars VALUES (3, 'Packard One Twenty', 'DPH-079', true, 5, 13, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cars VALUES (4, 'Alpine A610', 'SQK-832', false, 5, 48, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cars VALUES (5, 'Pinzgauer 710', 'EXJ-031', false, 4, 193, '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.cities VALUES (1, 'Santiago', 1, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cities VALUES (2, 'Concepcion', 1, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cities VALUES (3, 'Punta Arenas', 1, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cities VALUES (4, 'East Vincenttown', 3, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cities VALUES (5, 'New Agustin', 6, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cities VALUES (6, 'Joanychester', 4, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cities VALUES (7, 'East Zackfort', 4, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.cities VALUES (8, 'Wolfborough', 2, '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.countries VALUES (1, 'Chile', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.countries VALUES (2, 'New Caledonia', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.countries VALUES (3, 'Honduras', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.countries VALUES (4, 'Iraq', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.countries VALUES (5, 'Tajikistan', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.countries VALUES (6, 'Bouvet Island (Bouvetoya)', '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: flightreserves; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.flightreserves VALUES (1, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 42, 15);
INSERT INTO public.flightreserves VALUES (2, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 27, 12);
INSERT INTO public.flightreserves VALUES (3, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 32, 31);
INSERT INTO public.flightreserves VALUES (4, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 31, 8);
INSERT INTO public.flightreserves VALUES (5, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 84, 31);


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.flights VALUES (1, 'FF8509', 'AJG-757', 143, 6, 6, '2019-01-09', '07:07', false, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.flights VALUES (2, 'SD4547', 'FTH-919', 102, 4, 4, '2019-01-20', '06:04', false, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.flights VALUES (3, 'LH4005', 'SHR-178', 92, 5, 6, '2019-01-21', '12:10', false, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.flights VALUES (4, 'WG0984', 'QYW-392', 121, 8, 5, '2018-12-31', '13:41', false, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.flights VALUES (5, 'DS6391', 'YZD-732', 97, 5, 2, '2019-01-16', '04:49', true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: flightsegments; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.flightsegments VALUES (1, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 5, 2);
INSERT INTO public.flightsegments VALUES (2, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 4, 4);
INSERT INTO public.flightsegments VALUES (3, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 1, 4);
INSERT INTO public.flightsegments VALUES (4, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 3, 1);
INSERT INTO public.flightsegments VALUES (5, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 2, 3);


--
-- Data for Name: hotelreserves; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.hotelreserves VALUES (1, 71, 10, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.hotelreserves VALUES (2, 46, 24, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.hotelreserves VALUES (3, 77, 44, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.hotelreserves VALUES (4, 36, 34, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.hotelreserves VALUES (5, 71, 6, '2018-12-28 19:54:31', '2018-12-28 19:54:31');


--
-- Data for Name: hotelrooms; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.hotelrooms VALUES (1, 1, 2, 1, 1, 200, 2, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (2, 1, 3, 2, 2, 600, 3, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (3, 1, 4, 3, 3, 1200, 4, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (4, 1, 1, 4, 4, 400, 5, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (5, 1, 2, 1, 5, 200, 6, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (6, 1, 3, 2, 6, 600, 7, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (7, 1, 4, 3, 7, 1200, 8, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (8, 1, 1, 4, 8, 400, 9, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (9, 1, 2, 1, 9, 200, 10, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (10, 1, 3, 2, 10, 600, 11, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (11, 1, 4, 3, 11, 1200, 12, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (12, 1, 1, 4, 12, 400, 13, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (13, 1, 2, 1, 13, 200, 14, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (14, 1, 3, 2, 14, 600, 15, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (15, 1, 4, 3, 15, 1200, 16, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (16, 1, 1, 4, 16, 400, 17, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (17, 1, 2, 1, 17, 200, 18, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (18, 1, 3, 2, 18, 600, 19, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (19, 1, 4, 3, 19, 1200, 20, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (20, 1, 1, 4, 20, 400, 21, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (21, 1, 2, 1, 21, 200, 22, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (22, 1, 3, 2, 22, 600, 23, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (23, 1, 4, 3, 23, 1200, 24, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (24, 1, 1, 4, 24, 400, 25, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (25, 1, 2, 1, 25, 200, 26, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (26, 2, 2, 1, 1, 200, 2, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (27, 2, 3, 2, 2, 600, 3, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (28, 2, 4, 3, 3, 1200, 4, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (29, 2, 1, 4, 4, 400, 5, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (30, 2, 2, 1, 5, 200, 6, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (31, 2, 3, 2, 6, 600, 7, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (32, 2, 4, 3, 7, 1200, 8, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (33, 2, 1, 4, 8, 400, 9, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (34, 2, 2, 1, 9, 200, 10, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (35, 2, 3, 2, 10, 600, 11, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (36, 2, 4, 3, 11, 1200, 12, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (37, 2, 1, 4, 12, 400, 13, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (38, 2, 2, 1, 13, 200, 14, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (39, 2, 3, 2, 14, 600, 15, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (40, 2, 4, 3, 15, 1200, 16, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (41, 2, 1, 4, 16, 400, 17, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (42, 2, 2, 1, 17, 200, 18, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (43, 2, 3, 2, 18, 600, 19, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (44, 2, 4, 3, 19, 1200, 20, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (45, 2, 1, 4, 20, 400, 21, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (46, 2, 2, 1, 21, 200, 22, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (47, 2, 3, 2, 22, 600, 23, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (48, 2, 4, 3, 23, 1200, 24, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (49, 2, 1, 4, 24, 400, 25, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (50, 2, 2, 1, 25, 200, 26, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (51, 3, 2, 1, 1, 200, 2, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (52, 3, 3, 2, 2, 600, 3, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (53, 3, 4, 3, 3, 1200, 4, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (54, 3, 1, 4, 4, 400, 5, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (55, 3, 2, 1, 5, 200, 6, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (56, 3, 3, 2, 6, 600, 7, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (57, 3, 4, 3, 7, 1200, 8, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (58, 3, 1, 4, 8, 400, 9, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (59, 3, 2, 1, 9, 200, 10, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (60, 3, 3, 2, 10, 600, 11, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (61, 3, 4, 3, 11, 1200, 12, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (62, 3, 1, 4, 12, 400, 13, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (63, 3, 2, 1, 13, 200, 14, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (64, 3, 3, 2, 14, 600, 15, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (65, 3, 4, 3, 15, 1200, 16, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (66, 3, 1, 4, 16, 400, 17, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (67, 3, 2, 1, 17, 200, 18, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (68, 3, 3, 2, 18, 600, 19, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (69, 3, 4, 3, 19, 1200, 20, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (70, 3, 1, 4, 20, 400, 21, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (71, 3, 2, 1, 21, 200, 22, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (72, 3, 3, 2, 22, 600, 23, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (73, 3, 4, 3, 23, 1200, 24, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (74, 3, 1, 4, 24, 400, 25, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (75, 3, 2, 1, 25, 200, 26, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (76, 4, 2, 1, 1, 200, 2, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (77, 4, 3, 2, 2, 600, 3, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (78, 4, 4, 3, 3, 1200, 4, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (79, 4, 1, 4, 4, 400, 5, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (80, 4, 2, 1, 5, 200, 6, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (81, 4, 3, 2, 6, 600, 7, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (82, 4, 4, 3, 7, 1200, 8, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (83, 4, 1, 4, 8, 400, 9, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (84, 4, 2, 1, 9, 200, 10, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (85, 4, 3, 2, 10, 600, 11, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (86, 4, 4, 3, 11, 1200, 12, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (87, 4, 1, 4, 12, 400, 13, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (88, 4, 2, 1, 13, 200, 14, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (89, 4, 3, 2, 14, 600, 15, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (90, 4, 4, 3, 15, 1200, 16, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (91, 4, 1, 4, 16, 400, 17, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (92, 4, 2, 1, 17, 200, 18, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (93, 4, 3, 2, 18, 600, 19, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (94, 4, 4, 3, 19, 1200, 20, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (95, 4, 1, 4, 20, 400, 21, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (96, 4, 2, 1, 21, 200, 22, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (97, 4, 3, 2, 22, 600, 23, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (98, 4, 4, 3, 23, 1200, 24, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (99, 4, 1, 4, 24, 400, 25, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (100, 4, 2, 1, 25, 200, 26, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (101, 5, 2, 1, 1, 200, 2, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (102, 5, 3, 2, 2, 600, 3, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (103, 5, 4, 3, 3, 1200, 4, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (104, 5, 1, 4, 4, 400, 5, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (105, 5, 2, 1, 5, 200, 6, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (106, 5, 3, 2, 6, 600, 7, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (107, 5, 4, 3, 7, 1200, 8, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (108, 5, 1, 4, 8, 400, 9, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (109, 5, 2, 1, 9, 200, 10, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (110, 5, 3, 2, 10, 600, 11, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (111, 5, 4, 3, 11, 1200, 12, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (112, 5, 1, 4, 12, 400, 13, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (113, 5, 2, 1, 13, 200, 14, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (114, 5, 3, 2, 14, 600, 15, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (115, 5, 4, 3, 15, 1200, 16, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (116, 5, 1, 4, 16, 400, 17, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (117, 5, 2, 1, 17, 200, 18, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (118, 5, 3, 2, 18, 600, 19, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (119, 5, 4, 3, 19, 1200, 20, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (120, 5, 1, 4, 20, 400, 21, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (121, 5, 2, 1, 21, 200, 22, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (122, 5, 3, 2, 22, 600, 23, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (123, 5, 4, 3, 23, 1200, 24, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (124, 5, 1, 4, 24, 400, 25, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (125, 5, 2, 1, 25, 200, 26, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (126, 2, 4, 1, 48, 22902, 22, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (127, 5, 4, 2, 71, 25458, 4, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (128, 2, 4, 3, 3, 32467, 11, false, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (129, 1, 1, 1, 9, 48171, 22, false, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotelrooms VALUES (130, 3, 2, 1, 58, 32695, 4, false, '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.hotels VALUES (1, 'Satterfield PLC', 5, 182, '+4665367840255', '937 Macy Cape Suite 729
Aricborough, IL 81471-1471', 1, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotels VALUES (2, 'Jaskolski, Homenick and Jerde', 1, 185, '+3487223343803', '8448 Borer Parkways Suite 537
North Mitchel, WA 32497', 3, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotels VALUES (3, 'Denesik-Corwin', 3, 195, '+9742603841857', '773 Borer Parkway
West Chelsiefort, NY 70235-0766', 4, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotels VALUES (4, 'Walter, Effertz and Kuhic', 5, 177, '+5561916363186', '522 Nienow Plain Suite 543
Jenamouth, MN 65124-7943', 3, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.hotels VALUES (5, 'Mante and Sons', 4, 150, '+2665400808104', '97974 Griffin Throughway Apt. 323
New Ayana, SC 85302-6986', 3, '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: insurences; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.insurences VALUES (1, 408, 'Just at this corner--No, tie ''em together first--they don''t reach half high enough yet--Oh! they''ll do well enough; don''t be nervous, or I''ll have you executed, whether you''re a little different.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.insurences VALUES (2, 330, 'So you see, so many different sizes in a hurry: a large crowd collected round it: there was a different person then.'' ''Explain all that,'' he said to Alice, and she sat down at her with large round.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.insurences VALUES (3, 382, 'When the sands are all dry, he is gay as a cushion, resting their elbows on it, for she had been to the shore. CHAPTER III. A Caucus-Race and a fan! Quick, now!'' And Alice was beginning very.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.insurences VALUES (4, 269, 'Dormouse. ''Don''t talk nonsense,'' said Alice to herself. Imagine her surprise, when the Rabbit noticed Alice, as she could see, as they lay on the shingle--will you come and join the dance? Will you.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.insurences VALUES (5, 149, 'I must be growing small again.'' She got up this morning? I almost think I should have liked teaching it tricks very much, if--if I''d only been the right words,'' said poor Alice, that she looked down.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.migrations VALUES (1, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations VALUES (2, '2017_11_29_142907_create_roles_table', 1);
INSERT INTO public.migrations VALUES (3, '2017_11_29_144428_create_records_table', 1);
INSERT INTO public.migrations VALUES (4, '2017_12_19_191916_create_users_table', 1);
INSERT INTO public.migrations VALUES (5, '2018_10_17_225008_create_countries_table', 1);
INSERT INTO public.migrations VALUES (6, '2018_10_17_225040_create_cities_table', 1);
INSERT INTO public.migrations VALUES (7, '2018_11_12_145426_create_insurences_table', 1);
INSERT INTO public.migrations VALUES (8, '2018_11_12_215047_create_cars_table', 1);
INSERT INTO public.migrations VALUES (9, '2018_11_12_215105_create_flights_table', 1);
INSERT INTO public.migrations VALUES (10, '2018_11_12_215124_create_hotels_table', 1);
INSERT INTO public.migrations VALUES (11, '2018_11_15_145701_create_payments_table', 1);
INSERT INTO public.migrations VALUES (12, '2018_11_16_140118_create_reserves_table', 1);
INSERT INTO public.migrations VALUES (13, '2018_11_16_140259_create_purchases_table', 1);
INSERT INTO public.migrations VALUES (14, '2018_11_16_140412_create_airports_table', 1);
INSERT INTO public.migrations VALUES (15, '2018_11_19_005556_create_hotelrooms_table', 1);
INSERT INTO public.migrations VALUES (16, '2018_11_19_005630_create_passengers_table', 1);
INSERT INTO public.migrations VALUES (17, '2018_11_19_005711_create_segments_table', 1);
INSERT INTO public.migrations VALUES (18, '2018_11_19_005751_create_airplaneseats_table', 1);
INSERT INTO public.migrations VALUES (19, '2018_11_20_172401_create_packages_table', 1);
INSERT INTO public.migrations VALUES (20, '2018_11_30_205124_create_hotelreserves_table', 1);
INSERT INTO public.migrations VALUES (21, '2018_11_30_211543_create_packagereserves_table', 1);
INSERT INTO public.migrations VALUES (22, '2018_12_01_231556_create_flightsegments_table', 1);
INSERT INTO public.migrations VALUES (23, '2018_12_19_192013_create_trigger_table', 1);
INSERT INTO public.migrations VALUES (24, '2018_12_20_132142_create_seats_trigger_table', 1);
INSERT INTO public.migrations VALUES (25, '2018_12_26_234845_create_flightreserves_table', 1);
INSERT INTO public.migrations VALUES (26, '2018_12_28_025031_create_hotelrooms_trigger_table', 1);


--
-- Data for Name: packagereserves; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.packagereserves VALUES (1, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 1, 1);
INSERT INTO public.packagereserves VALUES (2, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 1, 4);
INSERT INTO public.packagereserves VALUES (3, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 7, 5);
INSERT INTO public.packagereserves VALUES (4, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 28, 1);
INSERT INTO public.packagereserves VALUES (5, '2018-12-28 19:54:31', '2018-12-28 19:54:31', 26, 2);


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.packages VALUES (1, 53, 2, 57, 246, '2018-12-30', '2019-01-08', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.packages VALUES (2, 13, 4, 16, 41, '2019-01-01', '2019-01-09', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.packages VALUES (3, 65, 5, 49, 462, '2019-01-04', '2019-01-06', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.packages VALUES (4, 5, 4, 69, 79, '2018-12-31', '2019-01-09', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.packages VALUES (5, 112, 2, 38, 471, '2018-12-29', '2019-01-06', '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.passengers VALUES (1, 'Alfredo', 'Rice', 46, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.passengers VALUES (2, 'America', 'Kub', 9, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.passengers VALUES (3, 'Ed', 'Pouros', 10, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.passengers VALUES (4, 'Patience', 'Hoeger', 58, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.passengers VALUES (5, 'Jaeden', 'Bosco', 89, true, '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.payments VALUES (1, 'Discover Card', 'Hudson, Sanford and Bogan', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.payments VALUES (2, 'MasterCard', 'Daugherty Ltd', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.payments VALUES (3, 'Visa', 'Larson, Runolfsson and Pollich', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.payments VALUES (4, 'Visa', 'Larkin, Walker and Mertz', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.payments VALUES (5, 'Visa', 'Fay, Reinger and Brakus', '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.purchases VALUES (1, 12936, '2018-12-30 05:49:00', '2018-12-28 19:54:31', '2018-12-28 19:54:31', 4, 23);
INSERT INTO public.purchases VALUES (2, 19777, '2019-01-01 11:44:31', '2018-12-28 19:54:31', '2018-12-28 19:54:31', 2, 10);
INSERT INTO public.purchases VALUES (3, 12152, '2019-01-02 10:11:12', '2018-12-28 19:54:31', '2018-12-28 19:54:31', 1, 36);
INSERT INTO public.purchases VALUES (4, 14901, '2018-12-30 09:32:51', '2018-12-28 19:54:31', '2018-12-28 19:54:31', 4, 4);
INSERT INTO public.purchases VALUES (5, 2656, '2019-01-04 02:47:32', '2018-12-28 19:54:31', '2018-12-28 19:54:31', 3, 26);


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.records VALUES (1, '2018-12-29', 'Alice, and she went on in the grass, merely remarking that a red-hot poker will burn you if you were or might have been a holiday?'' ''Of course not,'' Alice cautiously replied, not feeling at all a.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.records VALUES (2, '2018-12-30', 'Alice had been all the jurors had a wink of sleep these three little sisters--they were learning to draw,'' the Dormouse went on, taking first one side and up I goes like a candle. I wonder what CAN.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.records VALUES (3, '2019-01-03', 'DON''T know,'' said the Gryphon, ''she wants for to know what a Gryphon is, look at them--''I wish they''d get the trial one way up as the door and found quite a chorus of voices asked. ''Why, SHE, of.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.records VALUES (4, '2018-12-30', 'Lobster; I heard him declare, "You have baked me too brown, I must go back and see how he did it,) he did with the bread-and-butter getting so far off). ''Oh, my poor hands, how is it directed to?''.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.records VALUES (5, '2018-12-29', 'I''m doubtful about the crumbs,'' said the Hatter, and here the Mock Turtle. ''Seals, turtles, salmon, and so on.'' ''What a funny watch!'' she remarked. ''It tells the day of the e--e--evening, Beautiful.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: reserves; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.reserves VALUES (1, '2019-01-03', 10237, false, 4, 2, 1, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (2, '2019-01-02', 350, true, 2, 1, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (3, '2019-01-03', 6142, false, 3, 4, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (4, '2019-01-01', 6058, false, 9, 1, 5, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (5, '2018-12-29', 14127, true, 4, 5, 1, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (6, '2018-12-29', 7307, true, 10, 5, 1, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (7, '2018-12-30', 19464, false, 9, 3, 1, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (8, '2019-01-01', 17868, false, 3, 2, 1, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (9, '2019-01-02', 2414, true, 4, 4, 1, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (10, '2019-01-03', 19672, false, 9, 2, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (11, '2019-01-01', 2177, false, 10, 1, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (12, '2018-12-30', 4823, true, 6, 3, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (13, '2018-12-31', 15467, true, 4, 1, 5, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (14, '2018-12-29', 16769, true, 9, 1, 3, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (15, '2018-12-30', 2279, false, 8, 3, 3, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (16, '2019-01-01', 6490, false, 4, 2, 4, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (17, '2018-12-30', 15957, true, 6, 3, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (18, '2018-12-31', 18824, false, 7, 3, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (19, '2019-01-01', 17317, true, 9, 2, 1, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (20, '2018-12-29', 346, false, 3, 2, 3, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (21, '2018-12-29', 3335, false, 9, 3, 5, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (22, '2019-01-01', 16695, true, 1, 3, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (23, '2018-12-30', 10336, false, 10, 5, 5, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (24, '2018-12-29', 10113, false, 6, 4, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (25, '2019-01-04', 11175, true, 10, 2, 4, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (26, '2018-12-31', 997, false, 7, 5, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (27, '2018-12-30', 7041, false, 5, 3, 1, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (28, '2018-12-29', 7059, false, 9, 5, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (29, '2019-01-01', 5506, true, 7, 4, 3, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (30, '2018-12-30', 11987, false, 8, 2, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (31, '2019-01-03', 18372, false, 5, 5, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (32, '2018-12-30', 12657, true, 9, 3, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (33, '2018-12-31', 16866, false, 1, 4, 3, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (34, '2018-12-30', 11028, true, 2, 2, 5, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (35, '2019-01-01', 7962, true, 7, 3, 5, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (36, '2018-12-29', 9146, false, 2, 4, 3, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (37, '2018-12-30', 17312, true, 7, 2, 4, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (38, '2019-01-01', 7979, false, 4, 4, 5, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (39, '2018-12-29', 12407, false, 2, 2, 4, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (40, '2018-12-30', 9748, true, 9, 2, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (41, '2019-01-02', 8353, false, 6, 1, 4, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (42, '2019-01-04', 11155, true, 8, 5, 2, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (43, '2019-01-01', 3616, false, 2, 4, 4, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (44, '2018-12-30', 9181, false, 3, 5, 5, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (45, '2019-01-04', 14039, true, 5, 2, 1, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (46, '2018-12-29', 6327, false, 2, 1, 4, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (47, '2018-12-30', 1179, false, 8, 5, 5, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (48, '2018-12-30', 16229, false, 2, 5, 3, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (49, '2019-01-04', 19992, false, 9, 4, 5, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.reserves VALUES (50, '2019-01-03', 1394, false, 10, 2, 4, '2018-12-28 19:54:31', '2018-12-28 19:54:31');


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.roles VALUES (1, 1, 'Usuario comun: Puede recorrer la pagina, comprar y editar su perfil.', '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Data for Name: segments; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.segments VALUES (1, 'Elnaland', 83, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.segments VALUES (2, 'West Tomasaland', 60, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.segments VALUES (3, 'Watsicachester', 50, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.segments VALUES (4, 'Lake Lacyhaven', 39, '2018-12-28 19:54:31', '2018-12-28 19:54:31');
INSERT INTO public.segments VALUES (5, 'New Anitatown', 91, '2018-12-28 19:54:31', '2018-12-28 19:54:31');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.users VALUES (1, 1, 4, 'Dr. Jarod Rutherford', 'Skiles', 86, 'powlowski.roxane@example.net', NULL, '76', '64', false, 'I don''t know,'' he went on eagerly: ''There is such a thing before, but she did not look at the Caterpillar''s making such a nice little histories about children who had spoken first. ''That''s none of.', NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.users VALUES (2, 1, 4, 'Miss Ivy Bednar Sr.', 'Quigley', 40, 'wolf.mariela@example.net', NULL, '23', '97', true, 'Just at this corner--No, tie ''em together first--they don''t reach half high enough yet--Oh! they''ll do well enough; don''t be nervous, or I''ll have you executed on the bank, and of having nothing to.', NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.users VALUES (3, 1, 5, 'Ansley Schulist', 'Pfeffer', 14, 'gbogan@example.org', NULL, '33', '51', true, 'The Queen''s argument was, that her flamingo was gone across to the game. CHAPTER IX. The Mock Turtle at last, and managed to put down yet, before the end of every line: ''Speak roughly to your little.', NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.users VALUES (4, 1, 1, 'Gwen Bosco', 'Bergstrom', 16, 'edwina.miller@example.com', NULL, '32', '91', false, 'He unfolded the paper as he said to the dance. ''"What matters it how far we go?" his scaly friend replied. "There is another shore, you know, this sort of mixed flavour of cherry-tart, custard.', NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.users VALUES (5, 1, 3, 'Trever Stehr', 'Weimann', 6, 'qbuckridge@example.net', NULL, '86', '56', true, 'This time Alice waited patiently until it chose to speak first, ''why your cat grins like that?'' ''It''s a mineral, I THINK,'' said Alice. ''Of course you don''t!'' the Hatter went on, ''"--found it.', NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.users VALUES (6, 1, 5, 'Prof. Wallace Reynolds', 'Rice', 47, 'alexzander90@example.net', NULL, '9', '54', true, 'Gryphon. ''Do you know I''m mad?'' said Alice. ''I''ve tried the effect of lying down with her arms round it as well go in ringlets at all; and I''m sure _I_ shan''t be beheaded!'' ''What for?'' said the Mock.', NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.users VALUES (7, 1, 3, 'Mrs. Sarah Olson Jr.', 'Lang', 62, 'trace89@example.net', NULL, '95', '22', true, 'Some of the mushroom, and crawled away in the last few minutes, and began by producing from under his arm a great hurry. ''You did!'' said the Dormouse into the air off all its feet at the top of her.', NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.users VALUES (8, 1, 2, 'Janice Farrell V', 'Towne', 15, 'lily.stracke@example.org', NULL, '27', '15', false, 'Queen ordering off her head!'' Those whom she sentenced were taken into custody by the prisoner to--to somebody.'' ''It must be removed,'' said the Cat. ''I''d nearly forgotten to ask.'' ''It turned into a.', NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.users VALUES (9, 1, 3, 'German Franecki', 'Von', 56, 'elliott.vonrueden@example.net', NULL, '32', '15', false, 'I am, sir,'' said Alice; ''but when you throw them, and all the time it vanished quite slowly, beginning with the dream of Wonderland of long ago: and how she would keep, through all her wonderful.', NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');
INSERT INTO public.users VALUES (10, 1, 2, 'Leilani Rau', 'Prohaska', 78, 'antonio13@example.com', NULL, '57', '26', true, 'Caterpillar contemptuously. ''Who are YOU?'' Which brought them back again to the confused clamour of the ground.'' So she swallowed one of the guinea-pigs cheered, and was just in time to be lost, as.', NULL, '2018-12-28 19:54:30', '2018-12-28 19:54:30');


--
-- Name: airplaneseats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.airplaneseats_id_seq', 130, true);


--
-- Name: airports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.airports_id_seq', 5, true);


--
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.cars_id_seq', 5, true);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.cities_id_seq', 8, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.countries_id_seq', 6, true);


--
-- Name: flightreserves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.flightreserves_id_seq', 5, true);


--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.flights_id_seq', 5, true);


--
-- Name: flightsegments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.flightsegments_id_seq', 5, true);


--
-- Name: hotelreserves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.hotelreserves_id_seq', 5, true);


--
-- Name: hotelrooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.hotelrooms_id_seq', 130, true);


--
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.hotels_id_seq', 5, true);


--
-- Name: insurences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.insurences_id_seq', 5, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.migrations_id_seq', 26, true);


--
-- Name: packagereserves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.packagereserves_id_seq', 5, true);


--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.packages_id_seq', 5, true);


--
-- Name: passengers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.passengers_id_seq', 5, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.payments_id_seq', 5, true);


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.purchases_id_seq', 5, true);


--
-- Name: records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.records_id_seq', 5, true);


--
-- Name: reserves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.reserves_id_seq', 50, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, true);


--
-- Name: segments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.segments_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homestead
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: airplaneseats airplaneseats_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.airplaneseats
    ADD CONSTRAINT airplaneseats_pkey PRIMARY KEY (id);


--
-- Name: airports airports_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


--
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: flightreserves flightreserves_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flightreserves
    ADD CONSTRAINT flightreserves_pkey PRIMARY KEY (id);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);


--
-- Name: flightsegments flightsegments_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flightsegments
    ADD CONSTRAINT flightsegments_pkey PRIMARY KEY (id);


--
-- Name: hotelreserves hotelreserves_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.hotelreserves
    ADD CONSTRAINT hotelreserves_pkey PRIMARY KEY (id);


--
-- Name: hotelrooms hotelrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.hotelrooms
    ADD CONSTRAINT hotelrooms_pkey PRIMARY KEY (id);


--
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- Name: insurences insurences_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.insurences
    ADD CONSTRAINT insurences_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: packagereserves packagereserves_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.packagereserves
    ADD CONSTRAINT packagereserves_pkey PRIMARY KEY (id);


--
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


--
-- Name: passengers passengers_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: records records_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (id);


--
-- Name: reserves reserves_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.reserves
    ADD CONSTRAINT reserves_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: segments segments_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.segments
    ADD CONSTRAINT segments_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: homestead
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: users asignarrol; Type: TRIGGER; Schema: public; Owner: homestead
--

CREATE TRIGGER asignarrol AFTER INSERT ON public.users FOR EACH ROW EXECUTE PROCEDURE public.darrol();


--
-- Name: flights crearasiento; Type: TRIGGER; Schema: public; Owner: homestead
--

CREATE TRIGGER crearasiento AFTER INSERT ON public.flights FOR EACH ROW EXECUTE PROCEDURE public.llenarasientos();


--
-- Name: hotels createhotelroom; Type: TRIGGER; Schema: public; Owner: homestead
--

CREATE TRIGGER createhotelroom AFTER INSERT ON public.hotels FOR EACH ROW EXECUTE PROCEDURE public.completehotelrooms();


--
-- Name: airplaneseats airplaneseats_flight_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.airplaneseats
    ADD CONSTRAINT airplaneseats_flight_id_foreign FOREIGN KEY (flight_id) REFERENCES public.flights(id) ON DELETE CASCADE;


--
-- Name: airplaneseats airplaneseats_passenger_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.airplaneseats
    ADD CONSTRAINT airplaneseats_passenger_id_foreign FOREIGN KEY (passenger_id) REFERENCES public.passengers(id) ON DELETE CASCADE;


--
-- Name: cities cities_country_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_country_id_foreign FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE CASCADE;


--
-- Name: flightreserves flightreserves_airplaneseat_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flightreserves
    ADD CONSTRAINT flightreserves_airplaneseat_id_foreign FOREIGN KEY (airplaneseat_id) REFERENCES public.airplaneseats(id) ON DELETE CASCADE;


--
-- Name: flightreserves flightreserves_reserve_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flightreserves
    ADD CONSTRAINT flightreserves_reserve_id_foreign FOREIGN KEY (reserve_id) REFERENCES public.reserves(id) ON DELETE CASCADE;


--
-- Name: flights flights_arrival_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_arrival_id_foreign FOREIGN KEY (arrival_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- Name: flights flights_departure_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_departure_id_foreign FOREIGN KEY (departure_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- Name: flightsegments flightsegments_flight_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flightsegments
    ADD CONSTRAINT flightsegments_flight_id_foreign FOREIGN KEY (flight_id) REFERENCES public.flights(id) ON DELETE CASCADE;


--
-- Name: flightsegments flightsegments_segment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.flightsegments
    ADD CONSTRAINT flightsegments_segment_id_foreign FOREIGN KEY (segment_id) REFERENCES public.segments(id) ON DELETE CASCADE;


--
-- Name: hotelreserves hotelreserves_hotelroom_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.hotelreserves
    ADD CONSTRAINT hotelreserves_hotelroom_id_foreign FOREIGN KEY (hotelroom_id) REFERENCES public.hotelrooms(id) ON DELETE CASCADE;


--
-- Name: hotelreserves hotelreserves_reserve_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.hotelreserves
    ADD CONSTRAINT hotelreserves_reserve_id_foreign FOREIGN KEY (reserve_id) REFERENCES public.reserves(id) ON DELETE CASCADE;


--
-- Name: hotelrooms hotelrooms_hotel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.hotelrooms
    ADD CONSTRAINT hotelrooms_hotel_id_foreign FOREIGN KEY (hotel_id) REFERENCES public.hotels(id) ON DELETE CASCADE;


--
-- Name: hotels hotels_city_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_city_id_foreign FOREIGN KEY (city_id) REFERENCES public.cities(id) ON DELETE CASCADE;


--
-- Name: packagereserves packagereserves_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.packagereserves
    ADD CONSTRAINT packagereserves_package_id_foreign FOREIGN KEY (package_id) REFERENCES public.packages(id) ON DELETE CASCADE;


--
-- Name: packagereserves packagereserves_reserve_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.packagereserves
    ADD CONSTRAINT packagereserves_reserve_id_foreign FOREIGN KEY (reserve_id) REFERENCES public.reserves(id) ON DELETE CASCADE;


--
-- Name: packages packages_airplaneseat_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_airplaneseat_id_foreign FOREIGN KEY (airplaneseat_id) REFERENCES public.airplaneseats(id) ON DELETE CASCADE;


--
-- Name: packages packages_car_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_car_id_foreign FOREIGN KEY (car_id) REFERENCES public.cars(id) ON DELETE CASCADE;


--
-- Name: packages packages_hotelroom_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_hotelroom_id_foreign FOREIGN KEY (hotelroom_id) REFERENCES public.hotelrooms(id) ON DELETE CASCADE;


--
-- Name: purchases purchases_payment_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_payment_id_foreign FOREIGN KEY (payment_id) REFERENCES public.payments(id) ON DELETE CASCADE;


--
-- Name: purchases purchases_reserve_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_reserve_id_foreign FOREIGN KEY (reserve_id) REFERENCES public.reserves(id) ON DELETE CASCADE;


--
-- Name: reserves reserves_car_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.reserves
    ADD CONSTRAINT reserves_car_id_foreign FOREIGN KEY (car_id) REFERENCES public.cars(id) ON DELETE CASCADE;


--
-- Name: reserves reserves_insurence_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.reserves
    ADD CONSTRAINT reserves_insurence_id_foreign FOREIGN KEY (insurence_id) REFERENCES public.insurences(id) ON DELETE CASCADE;


--
-- Name: reserves reserves_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.reserves
    ADD CONSTRAINT reserves_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_record_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_record_id_foreign FOREIGN KEY (record_id) REFERENCES public.records(id) ON DELETE CASCADE;


--
-- Name: users users_rol_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: homestead
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_rol_id_foreign FOREIGN KEY (rol_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

