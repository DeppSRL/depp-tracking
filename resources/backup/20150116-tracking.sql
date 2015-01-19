--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: recurrence_date; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recurrence_date (
    id integer NOT NULL,
    recurrence_id integer NOT NULL,
    mode boolean NOT NULL,
    dt timestamp with time zone NOT NULL
);


ALTER TABLE public.recurrence_date OWNER TO postgres;

--
-- Name: recurrence_date_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recurrence_date_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recurrence_date_id_seq OWNER TO postgres;

--
-- Name: recurrence_date_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recurrence_date_id_seq OWNED BY recurrence_date.id;


--
-- Name: recurrence_param; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recurrence_param (
    id integer NOT NULL,
    rule_id integer NOT NULL,
    param character varying(16) NOT NULL,
    value integer NOT NULL,
    index integer NOT NULL
);


ALTER TABLE public.recurrence_param OWNER TO postgres;

--
-- Name: recurrence_param_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recurrence_param_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recurrence_param_id_seq OWNER TO postgres;

--
-- Name: recurrence_param_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recurrence_param_id_seq OWNED BY recurrence_param.id;


--
-- Name: recurrence_recurrence; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recurrence_recurrence (
    id integer NOT NULL,
    dtstart timestamp with time zone,
    dtend timestamp with time zone
);


ALTER TABLE public.recurrence_recurrence OWNER TO postgres;

--
-- Name: recurrence_recurrence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recurrence_recurrence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recurrence_recurrence_id_seq OWNER TO postgres;

--
-- Name: recurrence_recurrence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recurrence_recurrence_id_seq OWNED BY recurrence_recurrence.id;


--
-- Name: recurrence_rule; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recurrence_rule (
    id integer NOT NULL,
    recurrence_id integer NOT NULL,
    mode boolean NOT NULL,
    freq integer NOT NULL,
    "interval" integer NOT NULL,
    wkst integer,
    count integer,
    until timestamp with time zone,
    CONSTRAINT recurrence_rule_count_check CHECK ((count >= 0)),
    CONSTRAINT recurrence_rule_freq_check CHECK ((freq >= 0)),
    CONSTRAINT recurrence_rule_interval_check CHECK (("interval" >= 0)),
    CONSTRAINT recurrence_rule_wkst_check CHECK ((wkst >= 0))
);


ALTER TABLE public.recurrence_rule OWNER TO postgres;

--
-- Name: recurrence_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE recurrence_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recurrence_rule_id_seq OWNER TO postgres;

--
-- Name: recurrence_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE recurrence_rule_id_seq OWNED BY recurrence_rule.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO postgres;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO postgres;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: tracking_activity; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tracking_activity (
    id integer NOT NULL,
    project_id integer NOT NULL,
    activity_type integer,
    description character varying(256) NOT NULL,
    hours numeric(3,1) NOT NULL,
    worker_id integer NOT NULL,
    owner_id integer NOT NULL,
    activity_date date NOT NULL
);


ALTER TABLE public.tracking_activity OWNER TO postgres;

--
-- Name: tracking_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tracking_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_activity_id_seq OWNER TO postgres;

--
-- Name: tracking_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tracking_activity_id_seq OWNED BY tracking_activity.id;


--
-- Name: tracking_project; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tracking_project (
    id integer NOT NULL,
    start_date character varying(10),
    end_date character varying(10),
    name character varying(128) NOT NULL,
    identification_code character varying(5) NOT NULL,
    description text NOT NULL,
    resources text NOT NULL,
    customer character varying(128) NOT NULL,
    project_type integer NOT NULL,
    phase integer,
    status integer
);


ALTER TABLE public.tracking_project OWNER TO postgres;

--
-- Name: tracking_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tracking_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_project_id_seq OWNER TO postgres;

--
-- Name: tracking_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tracking_project_id_seq OWNED BY tracking_project.id;


--
-- Name: tracking_project_managers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tracking_project_managers (
    id integer NOT NULL,
    project_id integer NOT NULL,
    worker_id integer NOT NULL
);


ALTER TABLE public.tracking_project_managers OWNER TO postgres;

--
-- Name: tracking_project_managers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tracking_project_managers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_project_managers_id_seq OWNER TO postgres;

--
-- Name: tracking_project_managers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tracking_project_managers_id_seq OWNED BY tracking_project_managers.id;


--
-- Name: tracking_project_workers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tracking_project_workers (
    id integer NOT NULL,
    project_id integer NOT NULL,
    worker_id integer NOT NULL
);


ALTER TABLE public.tracking_project_workers OWNER TO postgres;

--
-- Name: tracking_project_workers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tracking_project_workers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_project_workers_id_seq OWNER TO postgres;

--
-- Name: tracking_project_workers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tracking_project_workers_id_seq OWNED BY tracking_project_workers.id;


--
-- Name: tracking_recurringactivity; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tracking_recurringactivity (
    id integer NOT NULL,
    project_id integer NOT NULL,
    activity_type integer,
    description character varying(256) NOT NULL,
    hours numeric(3,1) NOT NULL,
    worker_id integer NOT NULL,
    owner_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    recurrences text
);


ALTER TABLE public.tracking_recurringactivity OWNER TO postgres;

--
-- Name: tracking_recurringactivity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tracking_recurringactivity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_recurringactivity_id_seq OWNER TO postgres;

--
-- Name: tracking_recurringactivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tracking_recurringactivity_id_seq OWNED BY tracking_recurringactivity.id;


--
-- Name: tracking_weeklyactivity; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tracking_weeklyactivity (
    id integer NOT NULL,
    project_id integer NOT NULL,
    activity_type integer,
    description character varying(256) NOT NULL,
    hours numeric(3,1) NOT NULL,
    worker_id integer NOT NULL,
    owner_id integer NOT NULL,
    week character varying(7) NOT NULL
);


ALTER TABLE public.tracking_weeklyactivity OWNER TO postgres;

--
-- Name: tracking_weeklyactivity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tracking_weeklyactivity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_weeklyactivity_id_seq OWNER TO postgres;

--
-- Name: tracking_weeklyactivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tracking_weeklyactivity_id_seq OWNED BY tracking_weeklyactivity.id;


--
-- Name: tracking_worker; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tracking_worker (
    id integer NOT NULL,
    user_id integer NOT NULL,
    worker_type integer,
    contract_type integer,
    time_perc integer
);


ALTER TABLE public.tracking_worker OWNER TO postgres;

--
-- Name: tracking_worker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tracking_worker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_worker_id_seq OWNER TO postgres;

--
-- Name: tracking_worker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tracking_worker_id_seq OWNED BY tracking_worker.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurrence_date ALTER COLUMN id SET DEFAULT nextval('recurrence_date_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurrence_param ALTER COLUMN id SET DEFAULT nextval('recurrence_param_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurrence_recurrence ALTER COLUMN id SET DEFAULT nextval('recurrence_recurrence_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurrence_rule ALTER COLUMN id SET DEFAULT nextval('recurrence_rule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_activity ALTER COLUMN id SET DEFAULT nextval('tracking_activity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_project ALTER COLUMN id SET DEFAULT nextval('tracking_project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_project_managers ALTER COLUMN id SET DEFAULT nextval('tracking_project_managers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_project_workers ALTER COLUMN id SET DEFAULT nextval('tracking_project_workers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_recurringactivity ALTER COLUMN id SET DEFAULT nextval('tracking_recurringactivity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_weeklyactivity ALTER COLUMN id SET DEFAULT nextval('tracking_weeklyactivity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_worker ALTER COLUMN id SET DEFAULT nextval('tracking_worker_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
1	Employees
2	Project manager
3	Manager
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 3, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
18	1	48
19	1	33
20	1	32
21	1	31
22	1	45
23	1	43
24	1	46
25	1	47
26	1	44
27	2	30
28	2	28
29	2	29
30	3	8
31	3	42
32	3	7
33	3	40
34	3	41
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 34, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add migration history	8	add_migrationhistory
23	Can change migration history	8	change_migrationhistory
24	Can delete migration history	8	delete_migrationhistory
28	Can add project	10	add_project
29	Can change project	10	change_project
30	Can delete project	10	delete_project
31	Can add activity	11	add_activity
32	Can change activity	11	change_activity
33	Can delete activity	11	delete_activity
34	Can add user object permission	12	add_userobjectpermission
35	Can change user object permission	12	change_userobjectpermission
36	Can delete user object permission	12	delete_userobjectpermission
37	Can add group object permission	13	add_groupobjectpermission
38	Can change group object permission	13	change_groupobjectpermission
39	Can delete group object permission	13	delete_groupobjectpermission
40	Can add Worker	14	add_worker
41	Can change Worker	14	change_worker
42	Can delete Worker	14	delete_worker
43	Can add Recurring activity	15	add_recurringactivity
44	Can change Recurring activity	15	change_recurringactivity
45	Can delete Recurring activity	15	delete_recurringactivity
46	Can add Weekly activity	16	add_weeklyactivity
47	Can change Weekly activity	16	change_weeklyactivity
48	Can delete Weekly activity	16	delete_weeklyactivity
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 48, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$Qb8wCsXwVaZ3$X82x2VNdgPsKUMR4Oa79/PKvtIdWDYYmGabx0sa6Uao=	2014-12-18 16:46:11.53+01	t	admin			guglielmo@openpolis.it	t	t	2014-06-19 18:35:31.464+02
2	pbkdf2_sha256$12000$IU1eADoIN7w1$R5V0aG5UhTUa8eMfhFb/6qsXPg/edzR5l6WxmRJUwdY=	2014-11-14 15:03:27.647+01	f	guglielmo	Guglielmo	Celata	guglielmo@depp.it	t	t	2014-06-20 10:53:16+02
3	pbkdf2_sha256$12000$A5QEW24W8e92$/kglozOLIUEGqEIGHIFEfFmZY+1Fkxox7MSzq2qYpo8=	2015-01-15 18:05:41.81918+01	f	stefanov	Stefano	Vergani	stefano.vergani.it@gmail.com	t	t	2014-06-20 15:46:15+02
5	pbkdf2_sha256$12000$JXCU5q40jMqW$rbJSYJuGaGLAe1tXDNfRrI0uO3GXb5OZ1h0y4VRn3ts=	2014-12-16 18:05:40.566+01	f	danielef	Daniele	Faraglia	daniele.faraglia@gmail.com	t	t	2014-06-20 15:46:55+02
9	pbkdf2_sha256$12000$ygeTvgzU7ZEc$Ns/QpkXYBDtNhT+450nvH7TE40+N2BBPo023vyj1FiY=	2014-11-03 20:47:37.606+01	f	ettore	Ettore	Di Cesare	ettore@depp.it	t	t	2014-06-26 23:01:57+02
10	pbkdf2_sha256$12000$KxvJB5udxS9U$CQvFCLP/EYVYEG3SBcmg3bLrsdwSFIX3BCQA0MOls80=	2014-12-05 10:57:43.04+01	f	benedetta	Benedetta	Vangi	benedetta.vangi@gmail.com	t	t	2014-06-26 23:02:55+02
14	pbkdf2_sha256$12000$yGR04PO36lyL$kAdj5eViymE8/l74ZTybbFIephP0+ShYRDQ+ZFjDOUE=	2015-01-05 12:16:44.083437+01	f	danieled	Daniele	De Bernardin	danieledebernardin@gmail.com	t	t	2014-09-04 12:37:54+02
8	pbkdf2_sha256$12000$GjAwvqBb9g3b$E3nEjDqsmUdrYlG5jMks6zfmMzhwge2SGNUQSMp774g=	2015-01-07 12:53:41.521614+01	f	vittorio	Vittorio	Alvino	vittorio@depp.it	t	t	2014-06-26 23:01:41+02
7	pbkdf2_sha256$12000$i0FihTJZCIcu$L1ukyVyO9zMQ1mjBOwYVE4owhSmfj6NMlPEohJNDAJM=	2015-01-07 13:00:10.507084+01	f	vincenzo	Vincenzo	Smaldore	vincenzo@depp.it	t	t	2014-06-26 23:01:27+02
13	pbkdf2_sha256$12000$o5NJWVXMt7tu$rhMzMdsHTAUmg1BCXDw6RoTVd/hOGQKwlXF2RIsCqMU=	2015-01-07 16:40:14.501996+01	f	albana	Albana	Gremi	agremi16@gmail.com	t	t	2014-09-01 15:38:13+02
15	pbkdf2_sha256$12000$wVsBZnWrv48X$KyJY2Ox6xKr+oTRhnekhiI19jbQ25zmmSzKMagWranQ=	2015-01-12 10:34:33.44021+01	f	tiziana	Tiziana	Giudicotti	tiziana.giudicotti@gmail.com	t	t	2014-11-17 16:24:27+01
4	pbkdf2_sha256$12000$77DCrOxx3Bod$Yq5a+pm9CgZh8Xba2eQUoCSfgrmrpZ472cTmSQ/FURM=	2015-01-13 19:29:03.485963+01	f	stefanob	Stefano	Bernardini	sberna@depp.it	t	t	2014-06-20 15:46:39+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
20	2	1
21	2	2
22	3	1
23	3	2
24	4	1
25	5	1
26	7	1
27	7	3
28	7	2
29	8	1
30	8	3
31	8	2
32	9	1
33	9	3
34	9	2
35	10	1
36	13	1
37	14	1
38	15	1
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 38, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 15, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1573	2014-12-18 18:55:35.074292+01	3	11	802	Valutazione strumenti repository codice (1h)	1	
1574	2014-12-18 18:55:59.637956+01	3	11	803	Integrazione template mobile (3h)	1	
1575	2014-12-18 19:03:36.434776+01	3	11	802	Valutazione strumenti repository codice (2h)	2	hours modificato/a.
1576	2014-12-18 19:04:33.651551+01	3	11	804	Disabilitare xml flag nel template (1h)	1	
1577	2014-12-18 19:04:48.470467+01	3	11	805	Progettazione xml helper mixin (2h)	1	
1578	2014-12-19 17:26:19.389289+01	15	11	806	Redazione contenuti (2h)	1	
1579	2014-12-19 17:27:35.119414+01	15	11	807	Verifica province (2h)	1	
1580	2014-12-19 17:28:17.856759+01	15	11	808	Inserimento voti (5h)	1	
1581	2014-12-19 17:29:15.588395+01	15	11	809	Inserimento voti (6h)	1	
1582	2014-12-19 17:30:03.219828+01	15	11	810	Inserimento voti (4h)	1	
1583	2014-12-19 17:30:37.862218+01	15	11	811	Verifica voti (1h)	1	
1584	2014-12-19 17:31:20.115436+01	15	11	812	Verifica voti (2h)	1	
1585	2014-12-19 17:31:54.664367+01	15	11	813	Inserimento voti (1h)	1	
1586	2014-12-19 17:32:19.20858+01	15	11	814	Verifica province (1h)	1	
1587	2014-12-19 17:34:49.663218+01	13	16	52	contabilità (6.5h)	1	
1588	2014-12-19 17:36:28.656393+01	13	16	53	rendicontazione (8h)	1	
1589	2014-12-19 18:07:04.283154+01	3	11	815	Meeting messa online (1h)	1	
1590	2014-12-19 18:07:48.351476+01	3	11	816	Stesura procedura deploy, gestione consegna del template (3h)	1	
1591	2014-12-19 18:08:13.085183+01	3	11	817	Integrazione template mobile (2h)	1	
1592	2014-12-19 18:08:48.57366+01	3	11	818	Risoluzione bug dns (2h)	1	
1593	2014-12-22 15:47:17.819851+01	5	11	819	Widget e form per le associazioni (8h)	1	
1594	2014-12-22 15:47:46.790905+01	5	11	820	Bug fixing (6h)	1	
1595	2014-12-22 15:50:11.995888+01	5	11	712	Analisi pre-release (2.0h)	2	project modificato/a.
1596	2014-12-22 16:16:39.145767+01	4	11	821	Analisi Solr (6h)	1	
1597	2014-12-22 16:17:20.988468+01	4	11	822	Nuova sezione su pagina OpenData (2h)	1	
1598	2014-12-22 16:18:36.849666+01	4	11	823	Reintegro dati delibere CIPE per pagina Fonti di finanziamento (1h)	1	
1599	2014-12-22 18:11:46.605601+01	3	11	824	Riunione comunicazione con Vic e Vinz (2h)	1	
1600	2014-12-22 18:12:08.589441+01	3	11	825	Integrazione template mobile (2h)	1	
1601	2014-12-22 18:12:30.403497+01	3	11	825	Integrazione template mobile (3h)	2	hours modificato/a.
1602	2014-12-22 18:24:12.844148+01	3	11	826	Gestione issue / organizzazione progetto (2h)	1	
1603	2014-12-22 18:24:24.335942+01	3	11	826	Gestione issue / organizzazione progetto (3h)	2	hours modificato/a.
1604	2014-12-23 19:11:33.302635+01	4	11	827	Installazione e test Solr (3.5h)	1	
1605	2014-12-23 19:11:50.685088+01	4	11	827	Installazione e test Solr (4h)	2	hours modificato/a.
1606	2014-12-23 19:15:11.287889+01	4	11	828	Gestione privacy_flag e modifiche su cache per i box 'Ultimi progetti conclusi' (4h)	1	
1607	2014-12-23 19:16:00.121681+01	4	11	829	Impostazione ricerca (2h)	1	
1608	2014-12-24 14:09:14.588274+01	3	11	830	Deploy online firenze (4h)	1	
1609	2014-12-24 14:09:45.236036+01	3	11	831	Skype call con partner sui dati (2h)	1	
1610	2014-12-29 18:23:39.795739+01	3	11	832	Template mobile (2h)	1	
1611	2014-12-29 18:26:29.215453+01	3	11	833	Organizzazione procedure (2h)	1	
1612	2014-12-29 18:27:07.20743+01	3	11	832	Template mobile (3h)	2	hours modificato/a.
1613	2014-12-29 18:27:36.298225+01	3	11	833	Organizzazione procedure (3h)	2	hours modificato/a.
1614	2014-12-29 18:28:02.057483+01	3	11	832	Template mobile (3.0h)	2	Nessun campo modificato.
1615	2014-12-29 18:28:41.49842+01	3	11	833	Organizzazione procedure: valutazione scrum, risposta email e proc. VNE Oparl (3.0h)	2	description modificato/a.
1616	2014-12-30 19:10:37.659847+01	3	11	834	Template mobile: pagine bilancio (5h)	1	
1617	2014-12-30 19:11:06.916271+01	3	11	835	Analisi degli strumenti per archivio dei documenti (3h)	1	
1618	2015-01-05 18:33:27.308047+01	14	11	836	prova (4h)	1	
1619	2015-01-05 18:33:36.777565+01	14	11	836	prova (4.0h)	3	
1620	2015-01-05 19:08:20.731956+01	3	11	837	Meeting strumenti con Vincenzo e Vittorio (1h)	1	
1621	2015-01-05 19:11:40.563251+01	3	11	838	call Evernote (1h)	1	
1622	2015-01-05 19:16:00.152875+01	3	11	839	Meeting widget (1h)	1	
1623	2015-01-05 19:17:10.951357+01	3	11	840	Meeting Vincenzo Project management (1h)	1	
1624	2015-01-05 19:17:19.481913+01	3	11	839	Meeting widget (2h)	2	hours modificato/a.
1625	2015-01-05 19:17:58.158983+01	3	11	841	Stesura bozza documento di progetto e doc valutazione strumenti (3h)	1	
1626	2015-01-07 13:04:42.876973+01	7	10	43	Dossier Quirinale 2015 (DS10)	1	
1627	2015-01-07 13:06:03.313914+01	7	10	44	Report Inclusione sociale (Rep1)	1	
1628	2015-01-07 14:05:16.956032+01	14	11	842	raccolta e aggiornamento dati da vecchio dossier (3h)	1	
1629	2015-01-07 14:07:17.204+01	14	11	843	raccolta dati sui discorsi (4h)	1	
1630	2015-01-07 14:07:35.894118+01	14	11	844	raccolta dati discorsi (6h)	1	
1631	2015-01-07 14:08:09.948693+01	14	11	845	organizzazione e stesura testi (2h)	1	
1632	2015-01-07 16:41:14.650295+01	13	16	54	contabilità (8.5h)	1	
1633	2015-01-07 18:48:48.45021+01	3	11	846	Meeting con Ettore pre-call (1h)	1	
1634	2015-01-07 18:49:04.665533+01	3	11	847	Meeting Vittorio e Vinc (1h)	1	
1635	2015-01-07 18:49:22.231435+01	3	11	848	Meeting Vittorio prev.2014 (1h)	1	
1636	2015-01-07 18:49:48.918062+01	3	11	849	Template mobile: confronti (1h)	1	
1637	2015-01-07 18:50:11.489798+01	3	11	850	Valutazione strumenti documentazione/ gantt (3h)	1	
1638	2015-01-07 18:55:12.907023+01	3	11	849	Template mobile: confronti (2.0h)	2	hours modificato/a.
1639	2015-01-08 20:32:54.461588+01	3	11	851	Template mobile: pagina comune e menu affix (3h)	1	
1640	2015-01-08 20:33:22.737789+01	3	11	852	Meeting Giangiulio x template (1h)	1	
1641	2015-01-08 20:34:59.844218+01	3	11	851	Template mobile: pagina comune e menu affix (6h)	2	hours modificato/a.
1642	2015-01-09 18:08:04.760634+01	14	11	853	finito i testi (5h)	1	
1643	2015-01-09 18:14:03.476551+01	3	11	854	Meeting danais (1h)	1	
1645	2015-01-09 18:14:30.194996+01	3	11	856	Meeting Giangiulio x template (1h)	1	
1646	2015-01-09 18:15:12.477691+01	3	11	857	Messa in prod. castiglione, template mobile (3h)	1	
1648	2015-01-09 19:13:51.486644+01	4	11	858	Sviluppo motore di ricerca (5h)	1	
1650	2015-01-09 19:15:39.997324+01	4	11	860	Import e filtri criteri di pagamento (5h)	1	
1652	2015-01-09 19:16:50.858108+01	4	11	862	Sviluppo motore di ricerca (5h)	1	
1656	2015-01-12 10:35:46.298186+01	15	11	864	Ricerca contenuti (6h)	1	
1657	2015-01-12 10:36:25.858367+01	15	11	865	Ricerca contenuti (6h)	1	
1658	2015-01-12 10:37:03.483403+01	15	11	866	Ricerca contenuti (6h)	1	
1659	2015-01-12 10:37:44.462532+01	15	11	867	Ricerca contenuti (6h)	1	
1660	2015-01-12 10:38:18.790471+01	15	11	868	Ricerca contenuti (6h)	1	
1661	2015-01-12 16:34:10.543625+01	4	11	863	Sviluppo motore di ricerca (7.5h)	2	hours modificato/a.
1662	2015-01-12 16:36:39.744836+01	4	11	869	Analisi richieste, sostituzione file 'Open data' e modifica box in home e pagine interne (3h)	1	
1663	2015-01-12 16:38:03.029661+01	4	11	869	Modifiche in pagina 'Open data' e box in home e pagine interne (3.0h)	2	description modificato/a.
1664	2015-01-12 18:16:26.967979+01	13	16	55	contabilità (12h)	1	
1665	2015-01-12 23:55:38.928294+01	3	11	870	Meeting Ettore procedure (2h)	1	
1644	2015-01-09 18:14:17.359545+01	3	11	855	Meeting daniele f x strumenti (1h)	1	
1647	2015-01-09 18:15:21.441616+01	3	11	854	Meeting danais (2h)	2	hours modificato/a.
1649	2015-01-09 19:14:25.694095+01	4	11	859	Sviluppo motore di ricerca (2h)	1	
1651	2015-01-09 19:16:34.680597+01	4	11	861	Import e filtri criteri di pagamento (3h)	1	
1653	2015-01-09 19:17:03.492018+01	4	11	863	Sviluppo motore di ricerca (8h)	1	
1666	2015-01-12 23:55:56.474612+01	3	11	871	Meeting Giangiulio x template (1h)	1	
1654	2015-01-09 19:17:16.61324+01	4	11	859	Sviluppo motore di ricerca (3h)	2	hours modificato/a.
1667	2015-01-12 23:56:29.475127+01	3	11	872	Template mobile: pagina comune, parti mancanti e bug (4h)	1	
1668	2015-01-12 23:57:02.754985+01	3	11	872	Template mobile: pagina comune, parti mancanti e bug (5h)	2	hours modificato/a.
1669	2015-01-13 10:39:00.649337+01	8	11	873	organizzazione (4h)	1	
1670	2015-01-13 10:45:31.085338+01	8	10	45	You Are in EU (YREU)	1	
1671	2015-01-13 10:47:38.337277+01	8	11	874	progettazione (4h)	1	
1672	2015-01-13 10:48:46.644712+01	8	11	875	gestione amministrativa (4h)	1	
1673	2015-01-13 10:49:16.46775+01	8	11	876	progettazione (4h)	1	
1674	2015-01-13 10:49:53.957435+01	8	11	877	Gestione amministrativa (8h)	1	
1675	2015-01-13 10:50:22.452734+01	8	11	878	progettazione (8h)	1	
1676	2015-01-13 10:51:07.378378+01	8	11	879	progettazione (8h)	1	
1677	2015-01-13 10:51:45.015622+01	8	11	880	progettazione (5h)	1	
1678	2015-01-13 10:52:14.029925+01	8	11	881	progettazione (3h)	1	
1679	2015-01-13 19:16:41.222893+01	3	11	882	Risoluzione bug template mobile (6h)	1	
1680	2015-01-13 19:29:36.31347+01	4	11	883	Sviluppo motore di ricerca (4.5h)	1	
1681	2015-01-13 19:30:38.178799+01	4	11	884	Varie manutenzioni (6h)	1	
1682	2015-01-13 19:31:48.090829+01	4	11	885	Modellazione nuovi dati (2h)	1	
1683	2015-01-14 18:48:23.834997+01	3	11	886	Template mobile: bug fix (4h)	1	
1684	2015-01-14 18:48:55.791509+01	3	11	887	Ripristino sito, era offline (1h)	1	
1685	2015-01-14 18:49:26.071077+01	3	11	888	Call giangiulio (1h)	1	
1686	2015-01-14 18:50:03.624866+01	3	11	889	Risoluzione connessione wifi con telecom italia (1h)	1	
1687	2015-01-14 18:50:31.561579+01	3	11	886	Template mobile: bug fix (5h)	2	hours modificato/a.
1688	2015-01-15 09:35:27.03305+01	14	11	890	Nuove tabelle: grandi elettori + discorsi (3h)	1	
1689	2015-01-15 16:41:11.99081+01	14	11	891	Finiti testi per nuove tabelle + rilettura testi (1.5h)	1	
1690	2015-01-15 17:31:24.083756+01	14	11	892	Schedulare Openpolitix + Politico della Settimana (3h)	1	
1691	2015-01-15 17:32:40.138259+01	14	11	893	traduzione testi (6h)	1	
1692	2015-01-15 17:33:23.334117+01	14	11	894	traduzione testi bando (4h)	1	
1693	2015-01-15 17:33:32.823426+01	14	11	893	traduzione testi bando (6.0h)	2	description modificato/a.
1694	2015-01-15 17:35:07.534596+01	14	11	895	traduzione e revisione testi bando (4h)	1	
1695	2015-01-15 17:36:56.584384+01	14	11	896	Politico della Settimana  (3h)	1	
1696	2015-01-15 17:44:45.490783+01	14	11	897	Riunione pianificazione - Vincenzo & Vittorio (1h)	1	
1697	2015-01-15 18:29:05.447817+01	14	11	891	Finiti testi per nuove tabelle + rilettura testi (3h)	2	hours modificato/a.
1698	2015-01-15 18:45:20.329686+01	3	11	898	Lavoro su depp-tracking: installazione (2h)	1	
1699	2015-01-15 18:46:41.677883+01	3	11	899	Bug fix template mobile (4h)	1	
1700	2015-01-15 18:46:59.242134+01	3	11	900	Lavoro per preventivo 14 xml (2h)	1	
1701	2015-01-16 15:16:59.754334+01	14	11	901	Import Ministero Interno (2h)	1	
1702	2015-01-16 15:17:15.281562+01	14	11	902	Riservato (2h)	1	
1655	2015-01-09 19:17:32.927827+01	4	11	860	Import e filtri criteri di pagamento (4.5h)	2	hours modificato/a.
761	2014-09-22 09:54:22.888+02	1	15	50	Test	3	
17	2014-06-20 15:17:50.315+02	1	11	2	Testing (1.5)	3	
1	2014-06-20 10:53:17.129+02	1	3	2	guglielmo	1	
3	2014-06-20 10:55:54.159+02	1	3	2	guglielmo	2	first_name, last_name, email e is_staff modificato/a.
4	2014-06-20 11:11:55.305+02	1	3	2	guglielmo	2	Nessun campo modificato.
5	2014-06-20 11:25:33.323+02	1	10	1	Open Coesione (OC)	1	
6	2014-06-20 11:28:07.732+02	1	10	2	Open Bilanci (OB)	1	
7	2014-06-20 11:50:22.428+02	1	11	1	Activity object	1	
8	2014-06-20 12:47:10.395+02	1	11	1	Rapporto lavorazioni svolte per il cliente (2.5)	2	owner modificato/a.
9	2014-06-20 13:27:53.514+02	1	2	1	Employees	1	
10	2014-06-20 13:28:05.011+02	1	3	2	guglielmo	2	groups modificato/a.
11	2014-06-20 13:28:42.535+02	2	11	2	Test (1)	1	
12	2014-06-20 13:29:40.587+02	1	2	1	Employees	2	permissions modificato/a.
13	2014-06-20 13:31:00.914+02	2	11	2	Testing (1.5)	2	description e hours modificato/a.
14	2014-06-20 13:31:11.299+02	2	11	1	Rapporto lavorazioni svolte per il cliente (3)	2	hours modificato/a.
15	2014-06-20 13:31:43.153+02	1	2	1	Employees	2	permissions modificato/a.
16	2014-06-20 13:43:25.362+02	1	2	1	Employees	2	permissions modificato/a.
18	2014-06-20 15:44:38.427+02	1	2	2	Project manager	1	
19	2014-06-20 15:45:01.421+02	1	2	2	Project manager	2	permissions modificato/a.
20	2014-06-20 15:45:40.525+02	1	3	2	guglielmo	2	groups modificato/a.
21	2014-06-20 15:46:15.206+02	2	3	3	stefanov	1	
23	2014-06-20 15:46:39.79+02	2	3	4	stefanob	1	
25	2014-06-20 15:46:55.622+02	2	3	5	danielef	1	
27	2014-06-20 15:47:26.403+02	1	2	2	Project manager	2	permissions modificato/a.
28	2014-06-20 19:12:42.634+02	1	3	4	stefanob	2	password modificato/a.
29	2014-06-20 19:13:13.605+02	1	3	4	stefanob	2	first_name, last_name, email, is_staff e groups modificato/a.
30	2014-06-20 19:18:59.646+02	4	11	2	Testing (4)	1	
31	2014-06-20 19:34:47.409+02	4	11	2	Testing (3.4h)	2	hours modificato/a.
32	2014-06-20 19:34:52.052+02	4	11	2	Testing (3.5h)	2	hours modificato/a.
33	2014-06-24 14:55:34.276+02	1	10	3	OpenAID (oaid)	1	
34	2014-06-24 14:55:41.485+02	1	10	3	OpenAID (OAID)	2	identification_code modificato/a.
35	2014-06-25 16:58:58.068+02	1	11	2	Testing (3.5h)	3	
36	2014-06-25 17:00:06.566+02	2	11	2	Formazione Stefano su import dati (2h)	1	
37	2014-06-25 17:00:36.415+02	2	11	3	Formazione su import dati (1h)	1	
38	2014-06-25 17:01:08.531+02	2	11	4	Import progetti inattivi da CSV (4h)	1	
39	2014-06-25 17:01:58.762+02	2	11	5	Aggiornamento indicatori ISTAT (2h)	1	
40	2014-06-25 17:03:57.582+02	2	10	4	Infrastrutture Management (MAN)	1	
41	2014-06-25 17:04:33.835+02	2	11	6	Messa online sito depp-tracking (3h)	1	
42	2014-06-25 17:05:35.207+02	2	11	7	Controllo e omogeneizzazione traduzioni (6h)	1	
43	2014-06-25 17:06:14.322+02	2	11	8	Sviluppo funzionalità e debugging (8h)	1	
44	2014-06-25 20:32:38.14+02	2	11	9	Chiusura issues da #259 a #263 (2h)	1	
45	2014-06-26 16:25:50.346+02	1	3	3	stefanov	2	first_name, last_name, email, is_staff e groups modificato/a.
46	2014-06-26 16:26:04.389+02	1	3	3	stefanov	2	groups modificato/a.
47	2014-06-26 16:26:15.231+02	1	3	3	stefanov	2	password modificato/a.
48	2014-06-26 16:54:42.318+02	3	11	10	Classifiche: parimerito (8h)	1	
49	2014-06-26 16:55:16.936+02	3	11	10	Classifiche: parimerito #201 (8h)	2	description modificato/a.
50	2014-06-26 18:21:54.666+02	3	11	11	Import nuovi quadri (2h)	1	
51	2014-06-26 18:22:14.867+02	3	11	12	Run couchdb script per titoli / voci (4h)	1	
52	2014-06-26 20:04:58.99+02	2	11	13	Context data import. Issue #4. (6h)	1	
53	2014-06-26 20:06:05.652+02	2	11	14	Formazione StefanoB su import dati (2h)	1	
54	2014-06-26 20:07:07.595+02	2	11	15	Import progetti inattivi. (6h)	1	
55	2014-06-26 20:16:23.748+02	2	11	16	Motore di ricerca. Elastic, poi Solr. (8h)	1	
56	2014-06-26 23:00:53.548+02	1	3	6	danieled	1	
58	2014-06-26 23:01:27.112+02	1	3	7	vincenzo	1	
60	2014-06-26 23:01:41.284+02	1	3	8	vittorio	1	
62	2014-06-26 23:01:57.069+02	1	3	9	ettore	1	
64	2014-06-26 23:02:55.245+02	1	3	10	benedetta	1	
66	2014-06-26 23:03:14.095+02	1	3	11	mrwolf	1	
68	2014-06-26 23:03:29.613+02	1	3	12	visup	1	
70	2014-06-26 23:04:26.984+02	1	3	10	benedetta	2	first_name, last_name, email, is_staff e groups modificato/a.
71	2014-06-26 23:05:11.012+02	1	3	6	danieled	2	first_name, last_name, email, is_staff e groups modificato/a.
72	2014-06-26 23:05:42.238+02	1	3	5	danielef	2	first_name, last_name, email, is_staff e groups modificato/a.
73	2014-06-26 23:05:59.829+02	1	3	9	ettore	2	first_name, last_name, email, is_staff e groups modificato/a.
74	2014-06-26 23:06:26.778+02	1	3	7	vincenzo	2	first_name, last_name, email, is_staff e groups modificato/a.
75	2014-06-26 23:06:48.655+02	1	3	8	vittorio	2	first_name, last_name, email, is_staff e groups modificato/a.
76	2014-06-26 23:07:02.585+02	1	3	-1	AnonymousUser	3	
77	2014-06-27 00:31:55.905+02	1	14	9	benedetta	2	Nessun campo modificato.
78	2014-06-27 00:34:03.196+02	1	14	9	benedetta	2	worker_type, contract_type e time_perc modificato/a.
79	2014-06-27 00:34:42.117+02	1	14	1	guglielmo	2	worker_type e contract_type modificato/a.
80	2014-06-27 00:34:52.033+02	1	14	7	vittorio	2	worker_type e contract_type modificato/a.
81	2014-06-27 00:35:15.682+02	1	14	8	ettore	2	worker_type, contract_type e time_perc modificato/a.
82	2014-06-27 00:35:27.591+02	1	14	5	danieled	2	worker_type, contract_type e time_perc modificato/a.
83	2014-06-27 00:35:38.058+02	1	14	3	stefanob	2	worker_type, contract_type e time_perc modificato/a.
84	2014-06-27 00:35:55.091+02	1	14	2	stefanov	2	worker_type, contract_type e time_perc modificato/a.
85	2014-06-27 00:36:08.025+02	1	14	1	guglielmo	2	time_perc modificato/a.
86	2014-06-27 00:36:22.857+02	1	14	10	mrwolf	2	worker_type modificato/a.
87	2014-06-27 00:36:30.009+02	1	14	11	visup	2	worker_type modificato/a.
88	2014-06-27 00:45:09.138+02	1	11	17	Aggiunta dettagli worker (2h)	1	
89	2014-06-27 00:46:20.559+02	1	10	4	Infrastrutture Management (IMAN)	2	identification_code modificato/a.
90	2014-06-27 00:46:51.864+02	1	10	2	Open Bilanci (OB)	2	managers modificato/a.
91	2014-06-27 00:47:00.861+02	1	10	1	Open Coesione (OC)	2	Nessun campo modificato.
92	2014-06-27 00:47:10.067+02	1	10	3	OpenAID (OAID)	2	managers modificato/a.
93	2014-06-27 00:48:08.283+02	2	10	2	Open Bilanci (OB)	2	managers modificato/a.
94	2014-06-27 00:48:23.176+02	2	10	1	Open Coesione (OC)	2	Nessun campo modificato.
95	2014-06-27 00:48:35.192+02	2	10	3	OpenAID (OAID)	2	managers modificato/a.
96	2014-06-27 14:52:58.835+02	1	3	4	stefanob	2	password modificato/a.
97	2014-06-27 14:54:45.524+02	1	11	15	Import progetti inattivi. (6h)	2	owner modificato/a.
98	2014-06-27 14:54:52.139+02	1	11	4	Import progetti inattivi da CSV (4h)	2	owner modificato/a.
99	2014-06-27 14:54:56.65+02	1	11	3	Formazione su import dati (1h)	2	owner modificato/a.
100	2014-06-27 19:43:46.064+02	3	11	18	Couch script per facilitare normalizzazione titoli/voci (8h)	1	
101	2014-06-30 18:34:31.318+02	2	11	19	Sviluppo Notizie e FAQ multilingua e integrazione (12h)	1	
102	2014-06-30 18:41:01.052+02	2	11	19	Sviluppo Notizie, Pagine statiche e FAQ multilingua e integrazione (issue #10, #11 e #23) (16h)	2	description e hours modificato/a.
103	2014-06-30 18:41:22.709+02	2	11	19	Sviluppo Notizie, Pagine statiche e FAQ, multilingua e integrazione (issue #10, #11 e #23) (16h)	2	description modificato/a.
104	2014-06-30 18:41:49.393+02	2	11	19	Sviluppo Notizie, Pagine statiche e FAQ, (multilingua e integrazione). Issue #10, #11 e #23) (20h)	2	description e hours modificato/a.
105	2014-06-30 19:06:52.557+02	3	11	20	Normalizzazione titoli di bilancio (6h)	1	
106	2014-06-30 19:07:18.749+02	3	11	21	Riunione per normalizzazione titoli (2h)	1	
107	2014-06-30 19:08:49.045+02	4	11	22	Pagine aggregate progetti (6h)	1	
108	2014-06-30 19:09:26.979+02	1	3	5	danielef	2	password modificato/a.
109	2014-06-30 19:10:16.557+02	5	11	23	Implementazione del sito OpenAID (40h)	1	
110	2014-06-30 19:11:14.691+02	1	11	23	Implementazione dei template e delle viste per le codelists, i progetti e la homepage (40h)	2	description modificato/a.
111	2014-06-30 19:11:33.214+02	1	11	24	Implementazione delle mappe (8h)	1	
112	2014-06-30 19:11:42.837+02	1	11	23	Implementazione dei template e delle viste per le codelists, i progetti e la homepage (40h)	2	Nessun campo modificato.
113	2014-06-30 19:11:48.031+02	1	11	23	Implementazione dei template e delle viste per le codelists, i progetti e la homepage (24h)	2	hours modificato/a.
114	2014-07-01 18:35:13.614+02	2	10	5	Gestione e amministrazione generale (GEST)	1	
115	2014-07-01 18:35:49.702+02	2	11	25	Riunione di produzione (3.5h)	1	
116	2014-07-01 18:36:34.43+02	2	11	26	Refactoring filtro su programma e implementazione filtro su gruppo programmi (4h)	1	
117	2014-07-02 10:39:11.202+02	3	11	27	Meeting gestione scadenze progettuali (1h)	1	
118	2014-07-02 10:51:29.092+02	3	11	28	Couchdb: aggiornamento gdoc normalizzazione Voci (2h)	1	
119	2014-07-02 10:54:32.327+02	3	11	28	Couchdb: aggiornamento gdoc normalizzazione Voci (2h)	2	Nessun campo modificato.
120	2014-07-02 10:54:52.092+02	3	11	28	Couchdb: aggiornamento gdoc normalizzazione Voci e bug fix (3h)	2	description e hours modificato/a.
121	2014-07-02 14:34:06.315+02	2	11	29	Aggiunte attività ricorrenti al Tracking (4h)	1	
122	2014-07-02 14:35:11.688+02	1	2	3	Manager	1	
123	2014-07-02 14:35:20.326+02	1	2	2	Project manager	2	Changed permissions.
124	2014-07-02 14:35:24.455+02	1	2	1	Employees	2	No fields changed.
125	2014-07-02 14:35:27.936+02	1	2	2	Project manager	2	No fields changed.
126	2014-07-02 14:35:36.816+02	1	2	3	Manager	2	No fields changed.
127	2014-07-02 14:36:12.852+02	1	2	1	Employees	2	Changed permissions.
128	2014-07-02 14:36:31.254+02	1	3	9	ettore	2	Changed groups.
129	2014-07-02 14:36:38.824+02	1	3	2	guglielmo	2	Changed groups.
130	2014-07-02 14:36:51.447+02	1	3	3	stefanov	2	Changed groups.
131	2014-07-02 14:36:59.526+02	1	3	7	vincenzo	2	Changed groups.
132	2014-07-02 14:37:08.289+02	1	3	8	vittorio	2	Changed groups.
133	2014-07-02 14:38:06.812+02	1	2	3	Manager	2	Changed permissions.
134	2014-07-02 18:01:37.439+02	1	3	4	stefanob	2	Changed groups.
135	2014-07-02 18:02:05.422+02	1	3	4	stefanob	2	Changed groups.
136	2014-07-02 18:02:17.517+02	1	3	2	guglielmo	2	Changed groups.
137	2014-07-02 18:04:28.392+02	1	10	2	Open Bilanci (OB)	2	Changed managers.
138	2014-07-02 18:05:19.539+02	3	11	30	Import bilancio xml (2h)	1	
139	2014-07-02 18:06:08.913+02	3	11	31	Integrazione nuovo Js menu gerarchico (2h)	1	
140	2014-07-02 18:07:46.41+02	3	11	28	Couchdb: aggiornamento gdoc normalizzazione Voci e bug fix (3h)	2	Changed activity_date.
141	2014-07-02 18:08:05.569+02	3	11	27	Meeting gestione scadenze progettuali (1h)	2	Changed activity_date.
142	2014-07-02 18:09:41.275+02	3	11	10	Classifiche: parimerito #201 (8h)	2	Changed activity_date.
143	2014-07-02 18:10:18.897+02	3	11	10	Classifiche: parimerito #201 (8h)	2	Changed activity_date.
144	2014-07-02 18:10:41.897+02	3	11	21	Riunione per normalizzazione titoli (2h)	2	Changed activity_date.
145	2014-07-02 18:10:49.851+02	3	11	20	Normalizzazione titoli di bilancio (6h)	2	Changed activity_date.
146	2014-07-02 18:11:07.659+02	3	11	18	Couch script per facilitare normalizzazione titoli/voci (8h)	2	Changed activity_date.
147	2014-07-03 07:00:41.131+02	2	11	1	Rapporto lavorazioni svolte per il cliente (3h)	2	Changed activity_date.
148	2014-07-03 07:00:55.87+02	2	11	2	Formazione Stefano su import dati (2h)	2	Changed activity_date.
149	2014-07-03 07:01:08.491+02	2	11	5	Aggiornamento indicatori ISTAT (2h)	2	Changed activity_date.
150	2014-07-03 07:01:22.724+02	2	11	6	Messa online sito depp-tracking (3h)	2	Changed activity_date.
151	2014-07-03 07:01:37.966+02	2	11	7	Controllo e omogeneizzazione traduzioni (6h)	2	Changed activity_date.
152	2014-07-03 07:01:52.043+02	2	11	8	Sviluppo funzionalità e debugging (8h)	2	Changed activity_date.
153	2014-07-03 07:02:17.627+02	2	11	9	Chiusura issues da #259 a #263 (2h)	2	Changed activity_date.
154	2014-07-03 07:02:37.968+02	2	11	13	Context data import. Issue #4. (6h)	2	Changed activity_date.
155	2014-07-03 07:02:53.345+02	2	11	14	Formazione StefanoB su import dati (2h)	2	Changed activity_date.
156	2014-07-03 07:03:05.072+02	2	11	16	Motore di ricerca. Elastic, poi Solr. (8h)	2	Changed activity_date.
157	2014-07-03 07:03:18.083+02	2	11	17	Aggiunta dettagli worker (2h)	2	Changed activity_date.
158	2014-07-03 07:03:33.343+02	2	11	19	Sviluppo Notizie, Pagine statiche e FAQ, (multilingua e integrazione). Issue #10, #11 e #23) (20h)	2	Changed activity_date.
159	2014-07-03 07:03:50.325+02	2	11	25	Riunione di produzione (3.5h)	2	Changed activity_date.
160	2014-07-03 07:03:58.857+02	2	11	26	Refactoring filtro su programma e implementazione filtro su gruppo programmi (4h)	2	Changed activity_date.
161	2014-07-03 12:10:51.357+02	1	14	12	admin	1	
162	2014-07-03 12:17:58.026+02	1	11	24	Implementazione delle mappe (8h)	2	Changed activity_date.
163	2014-07-03 12:18:11.894+02	1	11	23	Implementazione dei template e delle viste per le codelists, i progetti e la homepage (24h)	2	Changed activity_date.
164	2014-07-03 12:21:17.505+02	1	11	3	Formazione su import dati (1h)	2	Changed activity_date.
165	2014-07-03 12:21:29.127+02	1	11	15	Import progetti inattivi. (6h)	2	Changed activity_date.
166	2014-07-03 12:21:48.659+02	1	11	22	Pagine aggregate progetti (6h)	2	Changed activity_date.
167	2014-07-03 12:22:11.677+02	1	11	4	Import progetti inattivi da CSV (4h)	2	Changed activity_date.
168	2014-07-03 12:25:01.675+02	4	11	32	Pagine aggregate progetti (6h)	1	
169	2014-07-03 12:25:39.216+02	4	11	33	Pagine aggregate progetti (7h)	1	
170	2014-07-03 14:50:30.962+02	2	11	34	Formazione Stefano su Solr (2h)	1	
171	2014-07-03 14:50:54.202+02	2	11	35	Nuova procedura import dati (2h)	1	
172	2014-07-03 14:51:49.124+02	2	11	36	Skype con Alessio Dragoni: Specifiche dettagli architetturali per OpenData Lazio (0.5h)	1	
173	2014-07-03 14:52:23.835+02	2	11	37	API per l'applicazione di Tracking (3h)	1	
174	2014-07-03 14:52:39.86+02	2	11	34	Formazione Stefano su Solr (2h)	2	Changed activity_type.
175	2014-07-03 16:21:26.232+02	3	11	38	Normalizzazione voci bilancio: gdocs (3h)	1	
176	2014-07-03 16:21:52.785+02	3	11	39	Github: nuove milestone e issues. Update gantt progetto (1h)	1	
177	2014-07-03 16:22:19.226+02	3	11	40	Import manuale codici bilancio (2h)	1	
178	2014-07-03 17:41:30.648+02	5	11	41	Produzione csv doppioni anno per anno (2h)	1	
179	2014-07-04 16:06:02.27+02	3	11	42	Import manuale codici bilancio (4h)	1	
180	2014-07-04 16:06:15.512+02	3	11	43	Analisi nuovo import XML (2h)	1	
181	2014-07-04 16:06:40.848+02	3	11	44	Integrazione menu gerarchico (2h)	1	
182	2014-07-04 18:54:47.18+02	5	11	45	Realizzazione tabs con grafici (6h)	1	
183	2014-07-07 12:01:30.349+02	2	11	46	Import dati (3h)	1	
184	2014-07-07 12:05:33.487+02	2	11	47	Incontro pianificazione lavori (2.5h)	1	
185	2014-07-07 12:11:24.046+02	2	11	48	Inserimento requisiti OpenCoesione in Gantt e Issue (2h)	1	
186	2014-07-07 12:11:38.568+02	2	11	47	Incontro pianificazione lavori (2.5h)	2	Changed activity_date.
187	2014-07-07 12:11:45.667+02	2	11	48	Inserimento requisiti OpenCoesione in Gantt e Issue (2h)	2	Changed activity_date.
188	2014-07-07 13:34:30.403+02	2	15	1	Rionione di produzione	1	
189	2014-07-07 13:34:45.786+02	2	15	1	Rionione di produzione	2	Changed end_date and recurrences.
190	2014-07-07 13:35:00.988+02	2	15	1	Riunione di produzione	2	Changed description and recurrences.
191	2014-07-07 18:34:10.795+02	3	11	49	Import Bilancio xml (4h)	1	
192	2014-07-07 18:34:39.753+02	3	11	50	Normalizzazione voci bilancio: gdocs (3h)	1	
193	2014-07-07 18:34:57.172+02	3	11	51	Normalizzazione voci bilancio (1h)	1	
194	2014-07-08 12:07:02.126+02	5	11	52	Tabs della homepage (6h)	1	
195	2014-07-08 16:29:45.216+02	3	11	53	Import manuale codici bilancio (1h)	1	
196	2014-07-08 16:30:24.894+02	3	11	54	Import menu gerarchico - mail recap con Alessandro (2h)	1	
197	2014-07-08 16:30:39.303+02	3	11	55	Analisi nuovo import XML (1h)	1	
198	2014-07-09 18:27:50.198+02	3	11	56	Meeting refine grafico (1h)	1	
199	2014-07-09 18:28:23.563+02	3	11	57	Meeting professore universitario (2h)	1	
200	2014-07-09 18:29:00.859+02	3	11	58	Analisi nuovo import XML (4h)	1	
201	2014-07-10 18:25:03.328+02	3	11	59	Integrazione menu gerarchico (2h)	1	
202	2014-07-10 18:25:19.19+02	3	11	60	Meeting refine grafico (1h)	1	
203	2014-07-10 18:25:44.697+02	3	11	61	Analisi nuovo import XML (5h)	1	
204	2014-07-11 10:33:34.402+02	2	11	62	Import dati di Giugno (8h)	1	
205	2014-07-11 10:34:13.276+02	2	11	63	Import dati di Giugno (4h)	1	
206	2014-07-11 10:35:03.019+02	2	11	64	Formazione Stefano su Mappe (3h)	1	
207	2014-07-11 10:35:26.501+02	2	11	65	Skype call (2h)	1	
208	2014-07-11 10:36:44.393+02	2	11	66	Hotfixes (#278, #279) (4h)	1	
209	2014-07-11 10:37:42.506+02	2	11	67	Sviluppo flatpages e file browser (4h)	1	
210	2014-07-11 10:38:03.528+02	2	11	68	Sviluppo flatpages e file browser (6h)	1	
211	2014-07-11 10:38:33.74+02	2	11	69	Documentazione flat pages e file browser (2h)	1	
212	2014-07-14 10:23:20.043+02	3	11	70	Refine grafico con Benedetta (2h)	1	
213	2014-07-14 10:23:49.155+02	3	11	71	Meeting con Vittorio: modifiche all'albero (2h)	1	
214	2014-07-14 10:24:08.819+02	3	11	72	Import bilancio xml (4h)	1	
215	2014-07-14 16:48:03.003+02	3	11	73	Refine grafico con Benedetta (1h)	1	
216	2014-07-14 16:48:23.78+02	3	11	74	Modifiche albero con Vittorio (2h)	1	
217	2014-07-14 16:48:35.042+02	3	11	75	Integrazione nuovo Js menu gerarchico (1h)	1	
218	2014-07-14 16:49:10.389+02	3	11	76	Sviluppo xml2slug (4h)	1	
219	2014-07-15 18:21:20.433+02	3	11	77	Modifiche albero con Vittorio (2h)	1	
220	2014-07-15 18:21:49.67+02	3	11	78	Import bilancio xml (4h)	1	
221	2014-07-15 18:22:07.011+02	3	11	79	Documentation on xml import (2h)	1	
222	2014-07-15 22:21:11.573+02	5	11	80	Solr e indicizzazione multilinguaggio (6h)	1	
223	2014-07-15 22:21:28.732+02	5	11	80	Solr e indicizzazione multilinguaggio (6h)	2	Changed project.
224	2014-07-15 22:22:33.739+02	5	11	81	Refining con ettore (6h)	1	
225	2014-07-15 22:23:22.939+02	5	11	82	refining (6h)	1	
226	2014-07-15 22:24:58.557+02	5	11	83	Responsive per Mobile/Tablet  (3h)	1	
227	2014-07-15 22:25:48.732+02	5	11	84	Deploy and fabric (6h)	1	
228	2014-07-16 14:56:39.639+02	2	11	85	Riunione produzione (4h)	1	
229	2014-07-16 14:57:08.857+02	2	11	86	Hotfix pre-deploy nuovi dati (4h)	1	
230	2014-07-16 14:57:47.904+02	2	11	87	Hotfix pre-deploy nuovi dati (8h)	1	
231	2014-07-16 14:58:11.292+02	2	11	88	Hotfix pre-deploy nuovi dati (8h)	1	
232	2014-07-16 15:27:11.204+02	2	11	87	Modulo gestione immagini e files (8h)	2	Changed description.
233	2014-07-16 16:04:31.535+02	2	11	87	Hotfix pre-deploy nuovi dati (8h)	2	Changed description.
234	2014-07-16 18:07:00.55+02	3	11	89	Modifiche struttura albero bilancio (8h)	1	
235	2014-07-16 18:07:12.024+02	3	11	89	Modifiche struttura albero bilancio (6h)	2	Changed hours.
236	2014-07-16 18:07:34.78+02	3	11	90	Documentazione import xml (2h)	1	
237	2014-07-16 19:13:25.198+02	2	11	91	Hotfix pre-deploy nuovi dati (8h)	1	
238	2014-07-16 19:14:07.885+02	2	11	87	Hotfix sistema gestione flatpages e files (8h)	2	Changed description.
239	2014-07-16 19:14:19.132+02	2	11	86	Hotfix sistema gestione flatpages e files (4h)	2	Changed description.
240	2014-07-16 19:14:31.038+02	2	11	86	Hotfix pre-deploy nuovi dati (4h)	2	Changed description.
241	2014-07-16 19:14:38.979+02	2	11	91	Hotfix sistema gestione flatpages e files (8h)	2	Changed description.
242	2014-07-16 19:15:08.141+02	2	11	87	Hotfix pre-deploy nuovi dati (8h)	2	Changed description.
243	2014-07-16 19:15:18.287+02	2	11	86	Hotfix  sistema gestione flatpages e files (4h)	2	Changed description.
244	2014-07-17 17:21:19.389+02	3	11	92	Semplificazione nuove voci bilancio (6h)	1	
245	2014-07-17 17:21:42.66+02	3	11	93	Documentazione import nuovi quadri (2h)	1	
246	2014-07-21 17:08:45.995+02	3	11	94	Normalizzazione voci bilancio: gdocs (5h)	1	
247	2014-07-21 17:09:06.026+02	3	11	95	Gestione aggiornamento sito DEPP (2h)	1	
248	2014-07-22 18:17:20.978+02	3	11	96	Import bilancio xml Dati di contesto  (2h)	1	
249	2014-07-22 18:17:45.149+02	3	11	97	Update albero bilancio (1h)	1	
250	2014-07-22 18:18:10.945+02	3	11	98	Meeting semplificazione bilancio, Open siope (2h)	1	
251	2014-07-22 18:18:52.703+02	3	11	99	Scripting per normalizzazione couch (3h)	1	
252	2014-07-23 17:37:43.96+02	5	11	100	Admin per Projects e Activities (3h)	1	
253	2014-07-23 18:07:23.604+02	3	11	101	Plenaria (3h)	1	
254	2014-07-23 18:07:34.896+02	3	11	101	Plenaria (3h)	2	Changed project.
255	2014-07-23 18:07:56.716+02	3	11	102	Semplificazione nuove voci bilancio (2h)	1	
256	2014-07-23 18:09:07.877+02	3	11	102	Semplificazione nuove voci bilancio (3h)	2	Changed hours.
257	2014-07-23 18:09:58.722+02	3	11	103	Import parametri deficitari (2h)	1	
258	2014-07-24 18:23:16.127+02	3	11	104	Update semplificazione (1h)	1	
259	2014-07-24 18:23:58.949+02	3	11	105	Update semplificazione (4h)	1	
260	2014-07-24 18:24:22.092+02	3	11	106	Correzioni gdoc semplificazione  (2h)	1	
261	2014-07-24 18:25:06.56+02	3	11	105	Analisi nuova semplificazione (5h)	2	Changed description and hours.
262	2014-07-25 18:05:46.948+02	3	11	107	Correzioni gdoc semplificazione (4h)	1	
263	2014-07-25 18:06:02.228+02	3	11	108	Correzione script merge keys (3h)	1	
264	2014-07-25 18:06:23.013+02	3	11	109	Update semplificazione (1h)	1	
265	2014-07-28 18:23:15.796+02	3	11	110	Correzioni gdoc semplificazione nuove voci bilancio (4h)	1	
266	2014-07-28 18:23:26.497+02	3	11	111	Semplificazione nuove voci bilancio (4h)	1	
267	2014-07-29 18:11:41.552+02	3	11	112	Semplificazione nuove voci bilancio (8h)	1	
268	2014-07-30 16:52:28.513+02	3	11	113	Check semplificazione bilancio (3h)	1	
269	2014-07-30 16:52:40.51+02	3	11	114	Sviluppo nuovi indicatori (5h)	1	
270	2014-07-31 18:10:08.614+02	3	11	115	Sviluppo nuovi indicatori (2h)	1	
271	2014-07-31 18:10:29.418+02	3	11	116	Import nuovi quadri (6h)	1	
272	2014-08-04 18:12:41.909+02	3	11	117	Export indicatori evabeta (5h)	1	
273	2014-08-04 18:12:54.368+02	3	11	118	Export indicatori evabeta (3h)	1	
274	2014-08-06 18:40:12.746+02	3	11	119	Pianificazione con Vittorio (1h)	1	
275	2014-08-06 18:40:39.541+02	3	11	120	Inserimenti Avanzo/disavanzo in accordion e widget (6h)	1	
276	2014-08-07 23:27:14.848+02	3	11	121	Pianificazione con Vittorio (2h)	1	
277	2014-08-07 23:27:41.295+02	3	11	122	Adattamento widget a nuova struttura albero (4h)	1	
278	2014-08-08 18:30:19.878+02	3	11	123	Planning e issue github (2h)	1	
279	2014-08-08 18:30:53.409+02	3	11	124	Risoluzione issue dati + ri-semplificazione (6h)	1	
280	2014-08-26 12:02:30.764+02	3	11	125	Import dati normalizzati in Postgres (2h)	1	
281	2014-08-26 12:03:06.794+02	3	11	126	Aggiornamento grafica del sito (4h)	1	
282	2014-08-29 18:03:28.314+02	3	11	127	Issue widget visup (1h)	1	
283	2014-08-29 18:04:10.609+02	3	11	128	Integrazione widget visup (2h)	1	
284	2014-08-29 18:04:24.015+02	3	11	129	Nuovo menu navigazione (5h)	1	
285	2014-09-01 14:53:09.577+02	1	3	9	ettore	2	Changed password.
286	2014-09-01 14:54:15.684+02	1	3	9	ettore	2	No fields changed.
287	2014-09-01 14:54:31.843+02	1	3	8	vittorio	2	Changed password.
288	2014-09-01 14:54:37.616+02	1	3	8	vittorio	2	No fields changed.
289	2014-09-01 14:54:57.795+02	1	3	7	vincenzo	2	Changed password.
290	2014-09-01 15:02:10.384+02	1	3	7	vincenzo	2	No fields changed.
291	2014-09-01 15:38:13.95+02	1	3	13	albana	1	
292	2014-09-01 15:39:10.955+02	1	3	13	albana	2	Changed first_name, last_name, email, is_staff and groups.
293	2014-09-01 15:48:58.96+02	1	14	13	albana	1	
294	2014-09-01 15:51:53.575+02	9	10	3	OpenAID (OAID)	2	Changed workers.
295	2014-09-01 16:47:23.657+02	1	3	10	benedetta	2	Changed password.
296	2014-09-01 18:01:05.084+02	3	11	130	Meeting task e chiamata con Giangiulio (1h)	1	
297	2014-09-01 18:01:40.773+02	3	11	131	Nuovo menu navigazione, ristrutturazione viste Bilancio (3h)	1	
298	2014-09-01 18:01:59.093+02	3	11	132	Nuova struttura pagina bilancio  (4h)	1	
299	2014-09-02 15:34:14.939+02	8	3	8	vittorio	2	Changed password.
300	2014-09-03 00:41:14.363+02	3	11	133	Nuovo menu navigazione, ristrutturazione viste bilancio (6h)	1	
301	2014-09-03 11:17:00.247+02	10	11	134	Revisione templates per i Comuni - Consegna v04 a mrWolf (6h)	1	
302	2014-09-03 11:25:45.583+02	10	11	135	Revisione Widget Selettore anni e Timeline sindaci (4h)	1	
303	2014-09-03 15:07:10.337+02	10	11	136	Progetto Comuni v01 (4h)	1	
304	2014-09-03 15:07:30.71+02	10	11	134	Revisione Progetto Comuni v00 - Consegna v04 a mrWolf (6h)	2	Changed description.
305	2014-09-03 15:08:07.26+02	10	11	134	Revisione Progetto Comuni v00 (5h)	2	Changed description and hours.
306	2014-09-03 15:08:52.209+02	10	11	137	Consegna Templates v04 a mrWolf (1h)	1	
307	2014-09-03 15:09:56.817+02	10	11	137	Rilascio Templates v04 a mrWolf (1h)	2	Changed description.
308	2014-09-03 15:10:23.497+02	10	11	134	Progetto Comuni v00 (5h)	2	Changed description.
309	2014-09-03 15:10:50.152+02	10	11	134	Refine Progetto Comuni v00 (5h)	2	Changed description.
310	2014-09-03 15:11:26.931+02	10	11	134	Revisione Progetto Comuni v00 (5h)	2	Changed description.
311	2014-09-03 15:12:00.074+02	10	11	135	Osservazioni Widget Selettore anni e Timeline sindaci (4h)	2	Changed description.
312	2014-09-03 15:13:24.88+02	10	11	136	Definizione Progetto Comuni v01 (4h)	2	Changed description.
313	2014-09-03 15:57:17.049+02	10	11	136	Definizione Progetto Comuni v01 (5h)	2	Changed hours.
314	2014-09-03 16:08:43.814+02	8	11	138	versione mobile (1h)	1	
315	2014-09-03 16:15:16.225+02	8	15	2	Commerciale	1	
316	2014-09-03 18:32:58.963+02	3	11	133	Nuovo menu navigazione, ristrutturazione viste bilancio (6h)	2	Changed activity_date.
317	2014-09-03 18:33:13.221+02	3	11	139	Nuovo menu navigazione, ristrutturazione viste bilancio (8h)	1	
318	2014-09-04 12:31:56.815+02	7	10	6	Open Politici (OP)	1	
319	2014-09-04 12:33:16.709+02	7	11	140	controllo verifica siti (0.1h)	1	
320	2014-09-04 12:37:41.142+02	1	3	6	danieled	3	
321	2014-09-04 12:37:54.823+02	1	3	14	danieled	1	
322	2014-09-04 12:38:39.696+02	1	3	14	danieled	2	Changed first_name, last_name, email and is_staff.
323	2014-09-04 12:38:53.399+02	1	3	14	danieled	2	Changed is_staff.
324	2014-09-04 12:39:17.014+02	1	3	14	danieled	2	Changed is_staff.
325	2014-09-04 12:40:06.792+02	1	3	14	danieled	2	Changed groups.
326	2014-09-04 16:24:56.216+02	10	11	141	Definizione Progetto Comuni v01 (2h)	1	
327	2014-09-04 18:00:42.718+02	3	11	142	Nuova navigazione sito: debugging (3h)	1	
328	2014-09-04 18:00:55.209+02	3	11	143	Debug menu gerarchico (5h)	1	
329	2014-09-08 10:53:19.502+02	3	11	144	Menu gerarchico: debug (4h)	1	
330	2014-09-08 22:36:00.329+02	10	11	145	Definizione Progetto Comuni v01 (3h)	1	
331	2014-09-08 23:46:56.499+02	3	11	146	Acquisizione nuovi quadri bilancio (6h)	1	
332	2014-09-09 12:18:05.722+02	10	11	147	Briefing U-ACT con Vincenzo (1h)	1	
333	2014-09-09 16:52:57.301+02	10	11	148	Verifica Templates v04 / html 1.7.0 mrWolf (5h)	1	
334	2014-09-09 18:07:46.428+02	3	11	149	Debug menu gerarchico (1h)	1	
335	2014-09-09 18:08:00.397+02	3	11	150	Debug accordion (1h)	1	
336	2014-09-09 18:08:45.752+02	3	11	151	Normalizzazione voci bilancio (1h)	1	
337	2014-09-09 18:08:59.508+02	3	11	149	Debug menu gerarchico (2h)	2	hours modificato/a.
338	2014-09-09 18:54:22.115+02	13	15	3	contabilità	1	
339	2014-09-09 18:55:56.044+02	13	15	3	contabilità	2	recurrences modificato/a.
340	2014-09-09 18:57:19.753+02	13	15	4	contabilità	1	
341	2014-09-10 12:42:00.159+02	1	10	6	Open Politici (OP)	2	workers modificato/a.
342	2014-09-10 12:42:18.201+02	1	10	5	Gestione e amministrazione generale (GEST)	2	workers modificato/a.
343	2014-09-10 12:42:28.69+02	1	10	4	Infrastrutture Management (IMAN)	2	workers modificato/a.
344	2014-09-10 12:42:43.588+02	1	10	3	OpenAID (OAID)	2	workers modificato/a.
345	2014-09-10 12:43:03.517+02	1	10	2	Open Bilanci (OB)	2	workers modificato/a.
346	2014-09-10 12:43:11.278+02	1	10	3	OpenAID (OAID)	2	workers modificato/a.
347	2014-09-10 12:43:28.378+02	1	10	1	Open Coesione (OC)	2	workers modificato/a.
348	2014-09-10 12:49:19.413+02	1	10	7	uAct (UACT)	1	
349	2014-09-10 12:49:29.157+02	1	10	2	Open Bilanci (OB)	2	workers modificato/a.
350	2014-09-10 12:57:17.871+02	1	10	8	Open Parlamento (OPP)	1	
351	2014-09-10 12:57:43.888+02	1	10	6	Open Politici (OP)	2	customer modificato/a.
352	2014-09-10 12:58:15.27+02	1	3	15	raimondo	1	
353	2014-09-10 12:58:26.846+02	1	14	14	raimondo	1	
354	2014-09-10 12:58:40.586+02	1	10	4	Infrastrutture Management (IMAN)	2	workers modificato/a.
355	2014-09-10 12:58:51.647+02	1	10	5	Gestione e amministrazione generale (GEST)	2	Nessun campo modificato.
356	2014-09-10 14:39:03.022+02	1	15	3	contabilità	3	
357	2014-09-10 14:48:28.645+02	1	15	4	contabilità	2	end_date e recurrences modificato/a.
440	2014-09-15 16:58:03.436+02	1	10	25	Dossier Commissione UE (DS6)	1	
358	2014-09-10 14:49:00.879+02	1	15	1	Riunione di produzione	2	end_date e recurrences modificato/a.
359	2014-09-10 15:00:26.756+02	1	15	4	Contabilità	2	description e recurrences modificato/a.
360	2014-09-10 15:24:35.197+02	1	15	1	Riunione di produzione	2	start_date e recurrences modificato/a.
361	2014-09-10 15:38:47.54+02	1	15	4	Contabilità	2	start_date e recurrences modificato/a.
362	2014-09-10 15:42:41.225+02	1	15	4	Contabilità	2	start_date e recurrences modificato/a.
363	2014-09-10 16:40:50.987+02	1	15	4	Contabilità	2	start_date e recurrences modificato/a.
364	2014-09-10 16:54:59.013+02	3	11	152	Risoluzione bug accordion (4h)	1	
365	2014-09-10 16:55:15.255+02	3	11	153	Import nuovi quadri (4h)	1	
366	2014-09-10 16:56:16.464+02	10	11	154	Revisione U-ACT con Vincenzo Ettore e Daniele (1h)	1	
367	2014-09-10 16:56:24.511+02	10	11	147	Briefing U-ACT con Vincenzo (1h)	2	project modificato/a.
368	2014-09-11 11:07:17.793+02	1	2	1	Employees	2	permissions modificato/a.
369	2014-09-11 11:14:43.131+02	8	14	6	vincenzo	2	worker_type e time_perc modificato/a.
370	2014-09-11 11:36:37.893+02	1	14	15	danieled	1	
371	2014-09-11 11:36:52.447+02	1	10	8	Open Parlamento (OPP)	2	workers modificato/a.
372	2014-09-11 11:36:57.694+02	1	10	7	uAct (UACT)	2	workers modificato/a.
373	2014-09-11 11:37:04.473+02	1	10	6	Open Politici (OP)	2	workers modificato/a.
374	2014-09-11 11:37:10.296+02	1	10	5	Gestione e amministrazione generale (GEST)	2	workers modificato/a.
375	2014-09-11 11:37:16.283+02	1	10	3	OpenAID (OAID)	2	workers modificato/a.
376	2014-09-11 11:37:21.563+02	1	10	2	Open Bilanci (OB)	2	workers modificato/a.
377	2014-09-11 12:19:18.909+02	8	10	9	Voi Siete Qui (VSQ)	1	
378	2014-09-11 12:23:41.189+02	7	15	5	redazionale	1	
379	2014-09-11 12:42:03.731+02	8	10	10	Parlamento Casa di Vetro (PCV)	1	
380	2014-09-11 12:42:12.268+02	8	10	10	Parlamento Casa di Vetro (PCV)	2	Nessun campo modificato.
381	2014-09-11 12:43:53.132+02	8	10	11	FOIA (FOIA)	1	
382	2014-09-11 12:51:26.458+02	8	10	12	Espresso (ESPR)	1	
383	2014-09-11 12:56:58.697+02	8	10	13	Comunicazione (COM)	1	
384	2014-09-11 13:00:05.213+02	8	10	14	Open Municipio (OM)	1	
385	2014-09-11 13:05:26.005+02	8	10	15	Open Data Lazio Formazione (ODLF)	1	
386	2014-09-11 13:07:59.281+02	8	10	16	Open Data Lazio Censimento  (ODLC)	1	
387	2014-09-11 13:11:32.271+02	8	10	17	Open Data Lazio Sanità (ODLS)	1	
388	2014-09-11 13:14:36.409+02	8	10	18	Open Data Lazio Progetti (ODLP)	1	
389	2014-09-11 13:20:31.187+02	8	10	19	Open Data Lazio Spesa (ODLS)	1	
390	2014-09-11 14:23:52.272+02	10	11	154	Revisione U-ACT con Vincenzo Ettore e Daniele e nuovi templates (1h)	2	activity_type e description modificato/a.
391	2014-09-11 14:24:35.358+02	10	11	155	Verifica Templates v04 / html 1.7.0 mrWolf (3h)	1	
392	2014-09-11 14:24:59.696+02	10	11	154	Revisione con Vincenzo Ettore e Daniele e nuovi templates (1h)	2	description modificato/a.
393	2014-09-11 14:25:07.152+02	10	11	147	Briefing con Vincenzo (1h)	2	description modificato/a.
394	2014-09-11 16:25:31.89+02	10	11	156	Definizione dettagli sito (1h)	1	
395	2014-09-11 18:09:29.067+02	3	11	157	Normalizzazione voci bilancio: gdocs (4h)	1	
396	2014-09-11 18:09:40.93+02	3	11	158	Semplificazione nuove voci bilancio (4h)	1	
397	2014-09-12 18:07:53.542+02	3	11	159	Semplificazione nuove voci bilancio (8h)	1	
398	2014-09-12 19:03:07.538+02	8	15	2	Commerciale	2	hours e recurrences modificato/a.
399	2014-09-12 19:04:42.306+02	8	15	2	Commerciale	2	recurrences modificato/a.
400	2014-09-12 19:07:41.049+02	8	16	1	coordinamento (10h)	1	
401	2014-09-15 10:44:19.571+02	8	16	1	coordinamento (10h)	2	Nessun campo modificato.
402	2014-09-15 10:45:11.783+02	8	16	2	coordinamento (10h)	1	
403	2014-09-15 10:45:44.874+02	8	16	3	coordinamento (10h)	1	
404	2014-09-15 10:45:50.624+02	8	16	3	coordinamento (10h)	2	Nessun campo modificato.
405	2014-09-15 10:47:24.271+02	8	16	4	OB per i comuni (6h)	1	
406	2014-09-15 10:47:25.929+02	8	16	4	OB per i comuni (6h)	2	Nessun campo modificato.
407	2014-09-15 10:52:32.569+02	8	15	6	coordinamento	1	
408	2014-09-15 15:54:05.766+02	1	15	7	verifica siti, import interni, segnalazioni community	1	
409	2014-09-15 15:56:05.529+02	1	15	7	verifica siti, import interni, segnalazioni community	2	recurrences modificato/a.
410	2014-09-15 15:58:04.871+02	1	15	7	verifica siti, import interni, segnalazioni community	2	recurrences modificato/a.
411	2014-09-15 16:00:29.35+02	1	15	7	verifica siti, import interni, segnalazioni community	2	recurrences modificato/a.
412	2014-09-15 16:07:16.564+02	1	15	7	verifica siti, import interni, segnalazioni community	2	recurrences modificato/a.
413	2014-09-15 16:07:22.93+02	1	15	7	verifica siti, import interni, segnalazioni community	2	recurrences modificato/a.
414	2014-09-15 16:09:41.817+02	1	15	7	verifica siti, import interni, segnalazioni community	2	recurrences modificato/a.
415	2014-09-15 16:11:33.928+02	1	15	8	tagging, priorità, controllo iter, evidenze	1	
416	2014-09-15 16:12:57.986+02	1	15	9	tagging, dati politici	1	
417	2014-09-15 16:14:26.125+02	1	15	10	ricerca dati, publishing openpolitix	1	
418	2014-09-15 16:15:36.646+02	1	15	11	publishing openblog, condivisioni social, ricerche dati, elaborazione grafici	1	
419	2014-09-15 16:20:52.488+02	1	15	12	ricerca dati, elaborazione domande, creazione approfondimenti	1	
420	2014-09-15 16:22:41.957+02	1	15	13	traduzione progetti	1	
421	2014-09-15 16:24:19.317+02	1	11	160	inserimento mail (16h)	1	
422	2014-09-15 16:25:48.727+02	1	11	161	aggiornamento politici  (76h)	1	
423	2014-09-15 16:27:05.05+02	1	11	162	aggiornamento politici  (72h)	1	
424	2014-09-15 16:27:38.719+02	1	15	13	traduzione progetti	2	worker e recurrences modificato/a.
425	2014-09-15 16:28:01.75+02	1	15	11	publishing openblog, condivisioni social, ricerche dati, elaborazione grafici	2	start_date e recurrences modificato/a.
426	2014-09-15 16:28:32.938+02	1	15	10	ricerca dati, publishing openpolitix	2	start_date e recurrences modificato/a.
427	2014-09-15 16:28:44.534+02	1	15	9	tagging, dati politici	2	start_date e recurrences modificato/a.
428	2014-09-15 16:28:52.596+02	1	15	8	tagging, priorità, controllo iter, evidenze	2	start_date e recurrences modificato/a.
429	2014-09-15 16:29:04.914+02	1	15	7	verifica siti, import interni, segnalazioni community	2	start_date e recurrences modificato/a.
430	2014-09-15 16:44:38.571+02	1	10	20	Dossier Finanziamento Pubblico (DS1)	1	
431	2014-09-15 16:45:49.695+02	1	10	21	Dossier Finanziamento Privato (DS2)	1	
432	2014-09-15 16:47:53.591+02	1	10	22	Dossier Donne in Politica (DS3)	1	
433	2014-09-15 16:49:08.764+02	1	10	23	Dossier Governo Renzi (DS4)	1	
434	2014-09-15 16:50:32.63+02	1	10	24	Dossier M5S (DS5)	1	
435	2014-09-15 16:51:35.011+02	1	11	163	ricerca dati (40h)	1	
436	2014-09-15 16:53:46.164+02	1	11	164	ricerca dati (32h)	1	
437	2014-09-15 16:54:22.226+02	1	11	165	ricerca dati (16h)	1	
438	2014-09-15 16:55:09.929+02	1	11	166	ricerca dati (8h)	1	
439	2014-09-15 16:55:48.738+02	1	11	167	ricerca dati (24h)	1	
441	2014-09-15 16:59:19.366+02	1	11	168	ricerca dati (32h)	1	
442	2014-09-15 16:59:53.681+02	1	11	169	ricerca dati (8h)	1	
443	2014-09-15 17:00:52.952+02	8	15	14	progetto	1	
444	2014-09-15 17:07:08.417+02	1	11	170	aggiornamento politici  (64h)	1	
445	2014-09-15 17:07:44.129+02	1	11	171	testi e comunicazione sito (64h)	1	
446	2014-09-15 17:08:07.094+02	8	15	6	coordinamento	2	hours e recurrences modificato/a.
447	2014-09-15 17:08:59.041+02	1	16	5	testi e comunicazione sito (16h)	1	
448	2014-09-15 17:09:12.47+02	1	16	5	testi e comunicazione sito (16h)	2	worker e owner modificato/a.
449	2014-09-15 17:10:19.027+02	1	11	172	presentazione Ministero Esteri a Firenze (8h)	1	
450	2014-09-15 17:11:39.784+02	1	15	15	aggiornamento politici e gestione community	1	
451	2014-09-15 17:12:08.337+02	1	15	15	aggiornamento politici e gestione community	2	recurrences modificato/a.
452	2014-09-15 17:13:03.841+02	1	15	16	analisi atti	1	
453	2014-09-15 17:14:21.065+02	1	11	173	elaborazioni domande, risposte politici e comunicazione (96h)	1	
454	2014-09-15 17:16:18.886+02	1	15	17	testi sito e comunicazione	1	
455	2014-09-15 17:16:57.722+02	1	15	18	riunioni in parlamento	1	
456	2014-09-15 17:17:43.217+02	8	15	2	gestione e rendiconto amministrativo	2	activity_type, description, hours, start_date, end_date e recurrences modificato/a.
457	2014-09-15 17:19:22.441+02	8	15	14	progettazione	2	description e recurrences modificato/a.
458	2014-09-15 17:20:11.966+02	8	15	2	rendicontazione Filas	2	description e recurrences modificato/a.
459	2014-09-15 17:23:23.483+02	1	15	19	ricerca dati, scrittura aritcoli	1	
460	2014-09-15 17:24:04.812+02	8	15	6	coordinamento	2	start_date, end_date e recurrences modificato/a.
461	2014-09-15 17:24:24.126+02	1	15	20	post, newsletter, ricerche	1	
462	2014-09-15 17:25:20.058+02	1	11	174	ricerche, analisi, riunioni (16h)	1	
463	2014-09-15 17:27:31.521+02	1	10	26	Camere Aperte 2014 (CA14)	1	
464	2014-09-15 17:28:15.984+02	1	11	175	ricerche, analisi, riunioni (64h)	1	
465	2014-09-15 17:28:39.558+02	1	10	26	Camere Aperte 2014 (CA14)	2	description modificato/a.
466	2014-09-15 17:28:58.304+02	8	15	21	coordinamento	1	
467	2014-09-15 17:29:58.547+02	8	15	6	Gestione amministrativa	2	description, hours e recurrences modificato/a.
468	2014-09-15 17:31:50.341+02	1	15	16	analisi atti	2	hours e recurrences modificato/a.
469	2014-09-15 17:32:04.841+02	1	15	15	aggiornamento politici e gestione community	2	hours e recurrences modificato/a.
470	2014-09-15 17:32:21.872+02	1	15	17	testi sito e comunicazione	3	
471	2014-09-15 17:32:31.697+02	1	15	18	riunioni in parlamento	3	
472	2014-09-15 17:49:34.43+02	1	11	176	testi sito e comunicazione (90h)	1	
473	2014-09-15 17:50:06.505+02	1	11	177	riunioni in parlamento (40h)	1	
474	2014-09-15 17:51:41.444+02	1	16	6	indice di produttività (8h)	1	
475	2014-09-15 17:52:38.093+02	1	11	178	revisione dizionario tag (32h)	1	
476	2014-09-15 17:54:45.061+02	1	15	22	analisi per post	1	
477	2014-09-15 17:55:34.278+02	1	15	23	analisi per post	1	
478	2014-09-15 17:58:24.532+02	1	15	24	riunione settimanale di produzione	1	
479	2014-09-15 18:03:52.203+02	3	11	179	Semplificazione nuove voci bilancio (3h)	1	
480	2014-09-15 18:04:08.15+02	3	11	180	Indicatori evabeta v2 (5h)	1	
481	2014-09-15 18:04:18.399+02	8	16	4	OB per i comuni (6h)	2	Nessun campo modificato.
482	2014-09-15 18:05:44.097+02	8	16	7	Indicatori EvaBeta (10h)	1	
483	2014-09-15 18:06:05.896+02	8	16	8	Indicatori EvaBeta (10h)	1	
484	2014-09-15 18:06:55.911+02	8	16	9	indicatori EvaBeta (16h)	1	
485	2014-09-15 18:07:40.189+02	8	16	10	Indicatori EvaBeta (2h)	1	
486	2014-09-15 18:07:59.884+02	8	16	7	Indicatori EvaBeta (10h)	2	week modificato/a.
487	2014-09-15 18:23:40.261+02	8	16	11	gestione amministrativa (10h)	1	
488	2014-09-15 18:25:15.102+02	8	16	12	Gestione amministrativa (10h)	1	
489	2014-09-15 18:25:58.042+02	8	16	13	gestione amministrativa (10h)	1	
490	2014-09-15 19:17:31.765+02	1	3	4	stefanob	2	password modificato/a.
491	2014-09-15 19:17:41.066+02	1	3	4	stefanob	2	Nessun campo modificato.
492	2014-09-15 19:19:42.838+02	4	11	181	Rifattorizzazione import (6.5h)	1	
493	2014-09-15 19:23:06.846+02	8	11	182	riunione settimanale (2h)	1	
494	2014-09-15 19:23:42.725+02	8	11	183	Commerciale (0.5h)	1	
495	2014-09-16 09:56:35.723+02	10	11	184	Definizione v04 Responsive (3h)	1	
496	2014-09-16 09:58:11.535+02	10	11	185	Predisposizione Keynote Personal Democracy (2h)	1	
497	2014-09-16 12:36:45.991+02	10	11	186	Verifica Templates v04 / html 1.7.0 mrWolf (3h) (2h)	1	
498	2014-09-16 12:38:28.134+02	10	11	187	redisposizione Keynote Personal Democracy (2h) (1h)	1	
499	2014-09-16 16:59:35.265+02	5	11	188	Evoluzione delle API (4h)	1	
500	2014-09-16 16:59:57.326+02	5	11	189	Refining grafici (4h)	1	
501	2014-09-16 18:06:43.773+02	3	11	190	Ottimizzazione import dati e calcolo mediane (5h)	1	
502	2014-09-16 18:06:55.62+02	3	11	191	Semplificazione nuove voci bilancio (3h)	1	
503	2014-09-16 18:25:34.715+02	2	16	14	Correzione indice di produttività (16h)	1	
504	2014-09-16 18:26:14.656+02	2	16	15	Analisi nuove procedure di import (8h)	1	
505	2014-09-16 18:27:12.752+02	2	11	192	Meeting per OpenRegione Lazio in Lait (2.5h)	1	
506	2014-09-16 18:27:41.409+02	2	11	193	Riunione su OpenRegione Lazio (0.5h)	1	
507	2014-09-16 18:31:09.983+02	2	10	27	Charts Builder (CHAB)	1	
508	2014-09-16 18:31:44.107+02	2	11	194	Definizione attività e preparazione del Gantt (1h)	1	
509	2014-09-16 18:33:19.925+02	2	11	195	Configurazione caselle di posta per Uact (0.5h)	1	
510	2014-09-16 18:33:59.975+02	2	11	196	Analisi carico eccessivo e blocco richieste da un IP per openparlamento (1h)	1	
511	2014-09-16 19:18:32.372+02	4	11	197	Rifattorizzazione import (6.5h)	1	
512	2014-09-16 22:50:36.967+02	2	11	198	Presentazione per Personal Democracy Forum 29 settembre (1h)	1	
513	2014-09-16 23:16:49.092+02	8	10	28	Open Consiglio Lazio (OCL)	1	
514	2014-09-16 23:18:39.646+02	8	11	199	Incontro in Consiglio (4h)	1	
515	2014-09-16 23:19:58.385+02	8	11	200	Incontro in Consiglio (4h)	1	
516	2014-09-16 23:20:49.684+02	8	11	201	incontro in Consiglio (4h)	1	
517	2014-09-16 23:21:53.847+02	8	11	202	incontro in Lait (3h)	1	
518	2014-09-16 23:22:24.517+02	8	11	203	Analisi (0.5h)	1	
519	2014-09-16 23:23:08.873+02	8	11	204	coordinamento (0.5h)	1	
520	2014-09-16 23:24:34.42+02	8	11	205	rating (1h)	1	
521	2014-09-16 23:25:22.423+02	8	11	206	gestione amministrativa (1h)	1	
522	2014-09-17 11:12:37.213+02	1	3	11	mrwolf	3	
523	2014-09-17 11:12:37.224+02	1	3	15	raimondo	3	
524	2014-09-17 11:12:37.225+02	1	3	12	visup	3	
525	2014-09-17 11:46:35.122+02	1	10	19	Open Data Lazio Spesa (ODLSP)	2	identification_code modificato/a.
526	2014-09-17 12:57:18.975+02	1	15	15	aggiornamento politici e gestione community	2	start_date e recurrences modificato/a.
527	2014-09-17 12:57:28.551+02	1	15	16	analisi atti	2	start_date e recurrences modificato/a.
528	2014-09-17 12:57:35.68+02	1	15	19	ricerca dati, scrittura aritcoli	2	start_date e recurrences modificato/a.
529	2014-09-17 12:57:43.027+02	1	15	20	post, newsletter, ricerche	2	start_date e recurrences modificato/a.
530	2014-09-17 12:57:56.525+02	1	15	24	riunione settimanale di produzione	2	start_date e recurrences modificato/a.
531	2014-09-17 13:00:48.394+02	1	11	207	piano editoriale, analisi, relazione con cliente (16h)	1	
532	2014-09-17 13:01:29.529+02	1	11	208	piano editoriale, analisi, relazione con cliente (16h)	1	
533	2014-09-17 13:02:05.587+02	1	11	209	piano editoriale, analisi, relazione con cliente (8h)	1	
534	2014-09-17 13:02:39.681+02	1	11	210	piano editoriale, analisi, relazione con cliente (16h)	1	
535	2014-09-17 13:03:22.215+02	1	11	211	piano editoriale, analisi, relazione con cliente (8h)	1	
536	2014-09-17 16:33:30.229+02	10	11	187	Predisposizione Keynote Personal Democracy (2h) (1h)	2	description modificato/a.
537	2014-09-17 16:33:58.637+02	10	11	212	Verifica Templates v04 / html 1.7.0 mrWolf  (4h)	1	
538	2014-09-17 17:23:08.318+02	10	11	187	Predisposizione Keynote Personal Democracy (1h)	2	description modificato/a.
539	2014-09-17 17:23:10.913+02	10	11	187	Predisposizione Keynote Personal Democracy (1h)	2	Nessun campo modificato.
540	2014-09-17 17:23:28.595+02	10	11	186	Verifica Templates v04 / html 1.7.0 mrWolf (2h)	2	description modificato/a.
541	2014-09-17 17:23:39.761+02	10	11	212	Verifica Templates v04 / html 1.7.0 mrWolf  (5h)	2	hours modificato/a.
542	2014-09-17 17:45:05.251+02	13	15	25	contabilità	1	
543	2014-09-17 17:46:47.541+02	13	15	26	contabilità	1	
544	2014-09-17 17:48:31.114+02	13	15	4	Contabilità	2	start_date, end_date e recurrences modificato/a.
545	2014-09-17 18:03:13.785+02	5	11	213	Template per le Email (4h)	1	
546	2014-09-17 18:05:00.446+02	13	15	4	Contabilità	3	
547	2014-09-17 18:07:21.81+02	3	11	214	Indicatori evabeta v2 (3h)	1	
548	2014-09-17 18:07:35.693+02	3	11	215	Servizi ai Comuni (5h)	1	
549	2014-09-17 18:30:42.328+02	13	15	27	contabilità	1	
550	2014-09-17 18:33:57.49+02	13	15	26	contabilità	2	hours, start_date e recurrences modificato/a.
551	2014-09-17 18:34:40.614+02	13	15	27	contabilità	2	hours e recurrences modificato/a.
552	2014-09-17 18:34:52.154+02	13	15	26	contabilità	2	hours e recurrences modificato/a.
553	2014-09-17 18:46:46.727+02	13	15	28	rendicontazione 	1	
554	2014-09-17 19:14:56.88+02	5	11	216	Sviluppo alpha (80h)	1	
555	2014-09-17 19:15:36.013+02	5	11	217	Sviluppo Widgets (50h)	1	
556	2014-09-17 19:15:47.968+02	5	11	216	Sviluppo UACT alpha (60h)	2	description e hours modificato/a.
557	2014-09-17 19:16:31.999+02	5	11	218	Sviluppo Widgets (30h)	1	
558	2014-09-17 19:18:07.684+02	5	11	219	Sviluppo UACT beta (80h)	1	
559	2014-09-17 19:18:55.615+02	5	11	220	Cambio del sistema di code (20h)	1	
560	2014-09-17 19:19:27.796+02	5	11	221	Deploy e refining (80h)	1	
561	2014-09-17 19:20:37.361+02	5	11	222	Navigazione e refining (20h)	1	
562	2014-09-17 19:22:32.621+02	5	11	223	Analisi eimplementazione di OpenAID (90h)	1	
563	2014-09-17 19:24:52.306+02	4	11	224	Rifattorizzazione import (6h)	1	
564	2014-09-17 19:26:48.617+02	1	10	29	OpenBlog (BLOG)	1	
565	2014-09-17 19:27:27.133+02	5	11	225	Realizzazione tema Wordpress (20h)	1	
566	2014-09-17 19:30:57.656+02	5	11	222	Navigazione e refining (40h)	2	hours modificato/a.
567	2014-09-17 19:32:24.306+02	5	11	226	Realizzazione tema Wordpress (30h)	1	
568	2014-09-17 19:32:41.093+02	5	11	218	Sviluppo Widgets (80h)	2	hours modificato/a.
569	2014-09-17 19:33:05.374+02	5	11	221	Deploy VSQ 2014 (80h)	2	description modificato/a.
570	2014-09-17 19:33:12.638+02	5	11	221	Refining e Deploy VSQ 2014 (80h)	2	description modificato/a.
571	2014-09-17 19:34:04.952+02	5	11	221	Refining e Deploy VSQ 2014 (90h)	2	hours modificato/a.
572	2014-09-17 19:34:39.79+02	5	11	223	Analisi eimplementazione di OpenAID (70h)	2	hours modificato/a.
573	2014-09-17 19:36:21.952+02	5	11	227	Refining e aggiornamenti dati (40h)	1	
574	2014-09-17 23:09:23.003+02	10	11	228	Predisposizione Keynote Personal Democracy (3h)	1	
575	2014-09-18 12:07:36.1+02	10	15	29	Identity e sito	1	
576	2014-09-18 12:11:12.69+02	10	15	30	Prova di inserimento ricorsi settimanali Open Bilanci	1	
577	2014-09-18 12:11:34.857+02	10	15	29	Prova di inserimento u-Act: Identity e sito	2	description e recurrences modificato/a.
578	2014-09-18 14:38:50.978+02	8	11	229	gestione amministrativa (4h)	1	
579	2014-09-18 14:40:01.031+02	8	11	230	Indicatori EvaBeta (2h)	1	
580	2014-09-18 14:40:13.983+02	8	11	230	Indicatori EvaBeta (2h)	2	Nessun campo modificato.
581	2014-09-18 14:40:40.812+02	8	11	231	Indicatori EvaBeta (3h)	1	
582	2014-09-18 14:41:19.11+02	8	11	232	Servizi per i Comuni (1h)	1	
583	2014-09-18 15:56:14.738+02	10	11	233	Verifica Templates v04 / html 1.7.0 mrWolf (4h)	1	
584	2014-09-18 15:56:39.018+02	10	11	234	redisposizione Keynote Personal Democracy (1h)	1	
585	2014-09-18 15:56:47.132+02	10	11	234	Predisposizione Keynote Personal Democracy (1h)	2	description modificato/a.
586	2014-09-18 18:07:31.736+02	3	11	235	Servizi ai Comuni (6h)	1	
587	2014-09-18 18:07:55.369+02	3	11	236	Nuova interfaccia (2h)	1	
588	2014-09-18 19:12:33.003+02	8	10	30	Open Bilanci per i Comuni (OBC)	1	
589	2014-09-18 19:14:42.858+02	8	10	30	Open Bilanci per i Comuni (OBC)	2	workers modificato/a.
590	2014-09-18 19:19:57.445+02	8	16	16	progettazione (8h)	1	
591	2014-09-18 19:20:34.379+02	8	16	17	progettazione (8h)	1	
592	2014-09-18 19:21:04.493+02	8	16	18	progettazione (4h)	1	
593	2014-09-18 19:21:51.751+02	8	16	4	OB per i comuni (6h)	3	
594	2014-09-18 19:33:51.034+02	5	11	217	Sviluppo Widgets (60h)	2	hours modificato/a.
595	2014-09-18 19:33:53.792+02	5	11	216	Sviluppo UACT alpha (80h)	2	hours modificato/a.
596	2014-09-18 19:34:22.577+02	5	11	226	Realizzazione tema Wordpress (40h)	2	hours modificato/a.
597	2014-09-18 19:34:43.892+02	5	11	226	Realizzazione tema Wordpress (60h)	2	hours modificato/a.
598	2014-09-18 19:36:51.212+02	5	11	217	Sviluppo Widgets (75h)	2	hours modificato/a.
599	2014-09-18 19:36:57.182+02	5	11	216	Sviluppo UACT alpha (95h)	2	hours modificato/a.
600	2014-09-18 19:37:24.973+02	5	11	218	Sviluppo Widgets (85h)	2	hours modificato/a.
601	2014-09-18 19:37:39.622+02	5	11	226	Realizzazione tema Wordpress (85h)	2	hours modificato/a.
602	2014-09-18 19:38:01.088+02	5	11	219	Sviluppo UACT beta (90h)	2	hours modificato/a.
603	2014-09-18 19:38:11.898+02	5	11	220	Cambio del sistema di code (40h)	2	hours modificato/a.
604	2014-09-18 19:38:36.437+02	5	11	220	Cambio del sistema di code (50h)	2	hours modificato/a.
605	2014-09-18 19:40:04.71+02	5	11	237	Testing e refining (20h)	1	
606	2014-09-18 19:40:31.539+02	5	11	225	Realizzazione tema Wordpress (10h)	2	hours modificato/a.
607	2014-09-18 19:46:40.17+02	4	11	238	Rifattorizzazione import (7h)	1	
608	2014-09-18 20:13:12.089+02	5	11	239	Realizzazione widgets (40h)	1	
609	2014-09-18 20:14:42.398+02	5	11	223	Analisi e implementazione di OpenAID (70h)	2	description modificato/a.
610	2014-09-18 20:15:32.617+02	1	10	2	Open Bilanci (OB)	2	workers modificato/a.
611	2014-09-18 20:17:18.321+02	5	11	240	Widgets mappe (80h)	1	
612	2014-09-18 20:19:41.666+02	5	11	222	Navigazione e refining (80h)	2	hours modificato/a.
613	2014-09-18 20:19:51.3+02	5	11	240	Widgets mappe (40h)	2	hours modificato/a.
614	2014-09-18 20:20:04.298+02	5	11	239	Realizzazione widgets (40h)	2	project modificato/a.
615	2014-09-18 20:20:33.319+02	5	11	239	Widgets politici (40h)	2	description modificato/a.
616	2014-09-18 20:22:46.575+02	5	11	24	Implementazione delle mappe (30h)	2	hours modificato/a.
617	2014-09-18 20:24:10.173+02	5	11	241	Testing e refining (40h)	1	
618	2014-09-18 20:26:44.825+02	5	11	242	Design VSQ social (20h)	1	
619	2014-09-18 20:27:32.19+02	5	11	243	Referrals, VIP, blog (40h)	1	
620	2014-09-18 22:36:08.879+02	10	11	234	Predisposizione Keynote Personal Democracy (2h)	2	hours modificato/a.
621	2014-09-19 10:07:28.412+02	10	15	30	Prova di inserimento ricorsi settimanali Open Bilanci	3	
622	2014-09-19 10:07:28.565+02	10	15	29	Prova di inserimento u-Act: Identity e sito	3	
623	2014-09-19 11:03:06.644+02	8	10	31	Senato Ragazzi (SR)	1	
624	2014-09-19 12:42:24.613+02	8	10	32	Invitalia Hosting (INVIT)	1	
625	2014-09-19 12:43:01.071+02	4	11	244	Manutenzione ordinaria (6h)	1	
626	2014-09-19 12:43:43.006+02	4	11	245	Manutenzione ordinaria (6h)	1	
627	2014-09-19 12:44:23.093+02	4	11	246	Manutenzione ordinaria (5h)	1	
628	2014-09-19 12:44:56.607+02	4	11	247	Rifattorizzazione import (6h)	1	
629	2014-09-19 12:45:41.204+02	4	11	248	Rifattorizzazione import (6h)	1	
630	2014-09-19 12:51:00.966+02	4	15	29	Rifattorizzazione import	1	
631	2014-09-19 13:02:08.042+02	4	15	29	Rifattorizzazione import	2	recurrences modificato/a.
632	2014-09-19 13:08:33.96+02	10	15	30	Restyling grafico di pagine del sito, loghi e iconografia 	1	
633	2014-09-19 13:12:13.887+02	10	15	31	Progetto grafico sito, pagine Comune e widget, analisi responsiveness, verifica html	1	
634	2014-09-19 13:12:18.805+02	10	15	32	Progetto grafico sito, pagine Comune e widget, analisi responsiveness, verifica html	1	
635	2014-09-19 13:12:19.314+02	5	11	249	Ideazione di Accesso e Cassetto (10h)	1	
636	2014-09-19 13:12:37.621+02	10	15	32	Progetto grafico sito, pagine Comune e widget, analisi responsiveness, verifica html	2	recurrences modificato/a.
637	2014-09-19 13:12:51.355+02	5	11	250	Prototipo Cassetto (20h)	1	
638	2014-09-19 13:16:05.776+02	10	15	31	Progetto grafico sito, pagine Comune e widget, analisi responsiveness, verifica html	3	
639	2014-09-19 13:20:26.033+02	10	15	32	Progetto grafico sito, pagine Comune e widget, analisi responsiveness, verifica html	2	hours e recurrences modificato/a.
640	2014-09-19 13:27:37.3+02	10	15	33	Progetto grafico sito	1	
641	2014-09-19 13:30:20.552+02	10	15	34	Progetto grafico sito e identity	1	
642	2014-09-19 13:32:36.696+02	10	15	35	Campagna social e piccoli interventi grafici	1	
643	2014-09-19 13:32:45.909+02	10	15	36	Campagna social e piccoli interventi grafici	1	
644	2014-09-19 13:38:17.997+02	10	15	35	Campagna social e piccoli interventi grafici	3	
645	2014-09-19 13:39:49.534+02	10	15	37	Cartella stampa, presentazione, campagna social	1	
646	2014-09-19 13:40:20.661+02	5	11	251	Implementazione di Cassetto (32h)	1	
647	2014-09-19 13:40:29.457+02	4	11	252	Rifattorizzazione import (6h)	1	
648	2014-09-19 13:40:45.912+02	5	11	253	Implementazione di Accesso2 (8h)	1	
649	2014-09-19 13:41:20.42+02	5	11	254	Implementazione di Accesso2 (8h)	1	
650	2014-09-19 13:41:26.896+02	10	15	38	Campagne social	1	
651	2014-09-19 13:41:27.447+02	5	11	254	Implementazione di Accesso2 (8h)	2	activity_date modificato/a.
652	2014-09-19 13:42:37.963+02	5	11	255	Analisi VSQ2 (16h)	1	
653	2014-09-19 13:42:42.195+02	5	11	255	Analisi VSQ2 (20h)	2	hours modificato/a.
654	2014-09-19 13:42:51.148+02	10	15	39	Analisi layout	1	
655	2014-09-19 13:43:02.163+02	4	11	248	Rifattorizzazione import (6h)	3	
656	2014-09-19 13:43:55.419+02	5	11	256	Import traduzioni e correzioni DCGS (20h)	1	
657	2014-09-19 13:44:27.83+02	10	15	40	Progetto grafico sito e newsletter, iconografia	1	
658	2014-09-19 13:45:32.562+02	4	15	29	Rifattorizzazione import	2	end_date e recurrences modificato/a.
659	2014-09-19 13:46:34.243+02	4	15	29	Rifattorizzazione import	2	recurrences modificato/a.
660	2014-09-19 13:47:42.629+02	4	15	29	Rifattorizzazione import	2	end_date e recurrences modificato/a.
661	2014-09-19 13:47:44.051+02	10	15	41	Progetto grafico sito	1	
662	2014-09-19 13:48:11.404+02	4	15	29	Rifattorizzazione import	2	recurrences modificato/a.
663	2014-09-19 13:48:54.042+02	4	15	29	Rifattorizzazione import	2	recurrences modificato/a.
664	2014-09-19 13:49:10.07+02	10	15	32	Progetto grafico sito e widget, analisi responsiveness, verifica html	2	description, hours e recurrences modificato/a.
665	2014-09-19 13:49:26.891+02	4	15	29	Rifattorizzazione import	3	
666	2014-09-19 13:49:29.755+02	10	15	41	Progetto grafico sito	2	hours e recurrences modificato/a.
667	2014-09-19 13:50:38.609+02	4	16	19	Rifattorizzazione import (35h)	1	
668	2014-09-19 13:51:02.552+02	4	16	20	Rifattorizzazione import (35h)	1	
669	2014-09-19 13:52:29.356+02	10	15	42	Progetto grafico sito	1	
670	2014-09-19 13:53:48.918+02	10	15	43	Analisi casistiche per tool	1	
671	2014-09-19 13:55:26.854+02	10	15	44	Restyling sito DEPP	1	
672	2014-09-19 13:56:37.56+02	10	15	45	Analisi progetto	1	
673	2014-09-19 13:57:10.487+02	10	15	46	Analisi progetto	1	
674	2014-09-19 13:57:32.791+02	10	15	47	Analisi progetto	1	
675	2014-09-19 14:53:19.496+02	4	15	48	Attività varie	1	
676	2014-09-19 14:54:30.284+02	4	15	48	Attività varie	2	recurrences modificato/a.
677	2014-09-19 15:00:05.22+02	4	15	48	Attività varie	2	recurrences modificato/a.
678	2014-09-19 15:03:49.497+02	4	15	48	Attività varie	2	end_date e recurrences modificato/a.
679	2014-09-19 15:04:44.813+02	4	15	49	Attività varie	1	
680	2014-09-19 15:05:11.653+02	4	15	48	Attività varie	2	hours e recurrences modificato/a.
681	2014-09-19 15:09:19.111+02	4	16	20	Rifattorizzazione import (35h)	3	
682	2014-09-19 15:09:19.167+02	4	16	19	Rifattorizzazione import (35h)	3	
683	2014-09-19 15:14:23.15+02	4	11	246	Manutenzione ordinaria (6h)	2	hours modificato/a.
684	2014-09-19 15:14:52.616+02	4	11	247	Rifattorizzazione import (5h)	2	hours modificato/a.
685	2014-09-19 15:22:56.819+02	4	11	257	Rifattorizzazione import (7h)	1	
686	2014-09-19 15:23:25.179+02	4	11	258	Rifattorizzazione import (7h)	1	
687	2014-09-19 15:23:50.115+02	4	11	259	Rifattorizzazione import (6.5h)	1	
688	2014-09-19 15:24:08.75+02	4	11	260	Rifattorizzazione import (6.5h)	1	
689	2014-09-19 15:24:34.168+02	4	11	261	Rifattorizzazione import (6h)	1	
690	2014-09-19 15:25:17.298+02	4	11	262	Rifattorizzazione import (7h)	1	
691	2014-09-19 15:27:37.262+02	4	11	247	Rifattorizzazione import (6h)	2	hours modificato/a.
692	2014-09-19 15:27:59.972+02	4	11	246	Manutenzione ordinaria (5h)	2	hours modificato/a.
693	2014-09-19 15:32:05.703+02	4	11	263	Rifattorizzazione import (7h)	1	
694	2014-09-19 15:32:26.582+02	4	11	264	Rifattorizzazione import (7h)	1	
695	2014-09-19 15:32:45.233+02	4	11	265	Rifattorizzazione import (6h)	1	
696	2014-09-19 15:33:09.13+02	4	11	266	Rifattorizzazione import (6h)	1	
697	2014-09-19 15:35:19.217+02	4	11	15	Import progetti inattivi. (6h)	2	activity_date modificato/a.
698	2014-09-19 15:35:34.95+02	4	11	4	Import progetti inattivi (4h)	2	description modificato/a.
699	2014-09-19 15:35:43.336+02	4	11	15	Import progetti inattivi (6h)	2	description modificato/a.
700	2014-09-19 15:37:02.434+02	4	15	48	Attività varie	2	end_date e recurrences modificato/a.
701	2014-09-19 16:52:49.02+02	13	15	28	rendicontazione 	2	activity_type, hours e recurrences modificato/a.
702	2014-09-19 17:41:39.025+02	1	10	2	Open Bilanci (OB)	2	workers modificato/a.
703	2014-09-19 17:48:53.139+02	8	10	33	Open Ricostruzione (ORIC)	1	
704	2014-09-19 18:08:16.083+02	3	11	267	Servizi ai Comuni (5h)	1	
705	2014-09-19 18:08:31.703+02	3	11	268	Nuovi indicatori (2h)	1	
706	2014-09-19 18:09:00.499+02	3	11	269	Chiamata con Giangiulio (1h)	1	
707	2014-09-19 19:16:40.613+02	13	15	27	contabilità	2	hours e recurrences modificato/a.
708	2014-09-19 19:23:40.621+02	13	15	25	contabilità	2	recurrences modificato/a.
709	2014-09-19 19:24:18.594+02	13	15	26	contabilità	3	
710	2014-09-19 19:24:18.601+02	13	15	25	contabilità	3	
711	2014-09-19 19:28:50.965+02	13	15	27	contabilità	2	end_date e recurrences modificato/a.
712	2014-09-19 19:29:12.326+02	13	15	28	rendicontazione 	2	recurrences modificato/a.
713	2014-09-19 19:29:30.321+02	4	11	270	Rifattorizzazione import (6.5h)	1	
714	2014-09-19 19:31:24.627+02	13	15	28	rendicontazione 	2	hours, start_date e recurrences modificato/a.
715	2014-09-19 19:32:18.591+02	13	15	28	rendicontazione 	2	hours e recurrences modificato/a.
716	2014-09-19 19:44:32.229+02	10	15	33	Progetto grafico sito	2	hours e recurrences modificato/a.
717	2014-09-19 19:44:58.199+02	10	15	33	Progetto grafico sito	2	recurrences modificato/a.
718	2014-09-19 19:46:32.561+02	10	15	34	Progetto grafico sito e identity	2	hours, end_date e recurrences modificato/a.
719	2014-09-19 19:48:23.591+02	10	15	32	Progetto grafico sito e widget, analisi responsiveness, verifica html	2	hours, start_date, end_date e recurrences modificato/a.
720	2014-09-19 19:49:20.713+02	10	15	30	Restyling grafico di pagine del sito, loghi e iconografia 	2	hours e recurrences modificato/a.
721	2014-09-19 19:49:45.687+02	10	15	34	Progetto grafico sito e identity	2	hours e recurrences modificato/a.
722	2014-09-19 19:50:09.648+02	10	15	36	Campagna social e piccoli interventi grafici	2	hours e recurrences modificato/a.
723	2014-09-19 19:50:32.972+02	10	15	37	Cartella stampa, presentazione, campagna social	2	hours e recurrences modificato/a.
724	2014-09-19 19:50:53.65+02	10	15	38	Campagne social	2	hours e recurrences modificato/a.
725	2014-09-19 19:51:35.588+02	10	15	39	Analisi layout	2	hours e recurrences modificato/a.
726	2014-09-19 19:52:21.388+02	10	15	40	Progetto grafico sito e newsletter, iconografia	2	hours, end_date e recurrences modificato/a.
727	2014-09-19 19:53:53.505+02	10	15	41	Progetto grafico sito	2	hours, end_date e recurrences modificato/a.
728	2014-09-19 19:54:24.804+02	10	15	42	Progetto grafico sito	2	hours e recurrences modificato/a.
729	2014-09-19 19:55:09.936+02	10	15	44	Restyling sito DEPP	2	hours, end_date e recurrences modificato/a.
730	2014-09-19 20:02:04.887+02	10	15	34	Progetto grafico sito e identity	2	end_date e recurrences modificato/a.
731	2014-09-19 20:03:33.778+02	10	15	32	Progetto grafico sito e widget, analisi responsiveness, verifica html	2	end_date e recurrences modificato/a.
732	2014-09-19 20:04:28.972+02	10	15	41	Progetto grafico sito	2	start_date e recurrences modificato/a.
733	2014-09-19 20:06:35.908+02	8	10	29	OpenBlog (BLOG)	2	workers modificato/a.
734	2014-09-19 20:08:30.767+02	10	15	40	Progetto grafico sito e newsletter, iconografia	2	end_date e recurrences modificato/a.
735	2014-09-19 20:09:13.361+02	8	10	26	Camere Aperte 2014 (CA14)	2	workers modificato/a.
736	2014-09-19 20:12:08.376+02	8	10	13	Comunicazione (COM)	2	workers modificato/a.
737	2014-09-19 20:13:54.582+02	10	15	36	Campagna social e piccoli interventi grafici	2	end_date e recurrences modificato/a.
738	2014-09-19 20:14:33.667+02	8	10	9	Voi Siete Qui (VSQ)	2	workers modificato/a.
739	2014-09-19 20:16:03.603+02	10	15	36	Campagna social e piccoli interventi grafici	2	start_date e recurrences modificato/a.
740	2014-09-19 20:17:03.128+02	10	15	33	Progetto grafico sito	2	start_date e recurrences modificato/a.
741	2014-09-19 20:18:35.053+02	10	15	43	Analisi casistiche per tool	2	start_date, end_date e recurrences modificato/a.
742	2014-09-19 20:19:14.036+02	10	15	45	Analisi progetto	2	start_date, end_date e recurrences modificato/a.
743	2014-09-19 20:19:54.587+02	10	15	46	Analisi progetto	2	start_date, end_date e recurrences modificato/a.
744	2014-09-19 20:20:25.515+02	10	15	47	Analisi progetto	2	start_date, end_date e recurrences modificato/a.
745	2014-09-19 20:25:25.313+02	10	15	32	Progetto grafico sito e widget, analisi responsiveness, verifica html	2	hours e recurrences modificato/a.
746	2014-09-19 20:27:13.859+02	10	15	32	Progetto grafico sito e widget, analisi responsiveness, verifica html	2	hours e recurrences modificato/a.
747	2014-09-19 20:29:40.624+02	10	15	32	Progetto grafico sito e widget, analisi responsiveness, verifica html	2	start_date e recurrences modificato/a.
748	2014-09-20 17:59:01.655+02	10	11	271	Conteggio ore/progetti genn-ago 2014 (3h)	1	
749	2014-09-20 17:59:51.515+02	10	11	272	Verifica Templates v04 / html 1.7.0 mrWolf (2h)	1	
750	2014-09-20 18:47:57.828+02	10	11	272	Verifica Templates v04 / html 1.7.0 mrWolf (1h)	2	hours modificato/a.
751	2014-09-21 10:16:56.425+02	8	11	273	Indicatori EvaBeta (4h)	1	
752	2014-09-21 10:17:24.064+02	8	11	274	Indicatori EvaBeta (2h)	1	
753	2014-09-21 10:18:40.069+02	8	11	275	coordinamento (3h)	1	
754	2014-09-21 10:19:16.875+02	8	11	276	gestione amministrativa (3h)	1	
755	2014-09-21 11:15:29.394+02	1	15	50	Test	1	
756	2014-09-21 11:16:39.644+02	1	15	50	Test	2	recurrences modificato/a.
757	2014-09-21 11:17:38.15+02	1	15	50	Test	2	hours e recurrences modificato/a.
758	2014-09-21 11:18:54.349+02	1	15	50	Test	2	hours, worker, owner e recurrences modificato/a.
759	2014-09-21 14:36:11.981+02	8	15	51	Promozione Openpolis e Lobbying	1	
760	2014-09-21 14:37:39.554+02	8	15	51	Promozione Openpolis e Lobbying	2	hours e recurrences modificato/a.
762	2014-09-22 09:57:21.713+02	1	15	52	Attività varie e generali	1	
763	2014-09-22 09:59:33.843+02	1	15	52	Attività varie e generali	2	recurrences modificato/a.
764	2014-09-22 10:01:23.774+02	1	15	52	Attività varie e generali	2	end_date e recurrences modificato/a.
765	2014-09-22 10:03:14.932+02	1	11	6	Messa online sito depp-tracking (3h)	2	Nessun campo modificato.
766	2014-09-22 10:07:03.253+02	1	15	53	Attività varie e generali	1	
767	2014-09-22 10:08:09.54+02	1	15	53	Attività varie e generali	2	recurrences modificato/a.
768	2014-09-22 10:10:25.051+02	1	15	53	Attività varie e generali	3	
854	2014-10-02 18:14:41.623+02	3	11	327	Correzione avanzo / disavanzo (8h)	1	
769	2014-09-22 10:10:42.741+02	1	15	52	Attività varie e generali	2	end_date e recurrences modificato/a.
770	2014-09-22 10:14:25.14+02	1	15	52	Attività varie e generali	2	hours e recurrences modificato/a.
771	2014-09-22 10:15:17.535+02	1	15	52	Attività varie e generali	2	hours e recurrences modificato/a.
772	2014-09-22 10:17:25.608+02	1	15	53	Attività varie	1	
773	2014-09-22 10:18:44.552+02	1	15	53	Attività varie	2	hours e recurrences modificato/a.
774	2014-09-22 10:19:25.963+02	1	15	53	Attività varie	2	hours e recurrences modificato/a.
775	2014-09-22 10:37:11.177+02	1	15	54	Gestione infrastrutturale	1	
776	2014-09-22 12:27:02.612+02	1	15	55	API, standard Popolo e django-popolo	1	
777	2014-09-22 12:28:09.875+02	1	15	55	API, standard Popolo e django-popolo	2	hours e recurrences modificato/a.
778	2014-09-22 12:30:19.135+02	1	15	56	Attività propedeutiche al deploy (infrastruttura)	1	
779	2014-09-22 12:31:31.766+02	1	15	57	Manutenzione ordinaria	1	
780	2014-09-22 12:57:40.266+02	1	16	19	Implementazione piattaforma survey (16h)	1	
781	2014-09-22 12:58:26.256+02	1	16	20	Meeting in LAIT per analisi dati sanità (4h)	1	
782	2014-09-22 12:58:40.846+02	1	16	20	Meeting in LAIT per analisi dati sanità (4h)	3	
783	2014-09-22 12:59:01.809+02	1	11	193	Riunione su OpenRegione Lazio (0.5h)	2	project modificato/a.
784	2014-09-22 12:59:15.498+02	1	11	192	Meeting per OpenRegione Lazio in Lait (2.5h)	2	project modificato/a.
785	2014-09-22 13:01:23.51+02	1	15	58	Preparazione infrastrutture per Europee	1	
786	2014-09-22 13:02:34.381+02	1	15	59	Correzioni minori e gestione infrastruttura	1	
787	2014-09-22 13:05:14.275+02	1	15	60	Manutenzione ordinaria ed evolutiva	1	
788	2014-09-22 15:40:22.088+02	1	15	61	Sviluppo iniziale	1	
789	2014-09-22 15:41:41.731+02	1	15	58	Preparazione infrastrutture per Europee	2	worker, owner e recurrences modificato/a.
790	2014-09-22 15:42:45.775+02	1	15	58	Preparazione infrastrutture per Europee	2	recurrences modificato/a.
791	2014-09-22 15:44:04.97+02	1	15	61	Sviluppo iniziale	2	hours, end_date e recurrences modificato/a.
792	2014-09-22 17:14:03.628+02	10	11	277	Verifica Templates v04 / html 1.7.0 mrWolf (2h)	1	
793	2014-09-22 17:15:30.635+02	10	11	278	Definizione progetto Comuni v01 Responsive (2h)	1	
794	2014-09-22 18:57:46.865+02	3	11	279	Navigazione (8h)	1	
795	2014-09-23 13:01:09.563+02	10	11	280	Verifica Templates v04 / html 1.7.0 mrWolf (3h)	1	
796	2014-09-23 13:01:12.712+02	10	11	280	Verifica Templates v04 / html 1.7.0 mrWolf (3h)	2	Nessun campo modificato.
797	2014-09-23 17:10:05.818+02	10	11	280	Verifica Templates v04 / html 1.7.0 mrWolf (4h)	2	hours modificato/a.
798	2014-09-23 17:10:40.309+02	10	11	281	Definizione progetto Comuni v01 Responsive (1h)	1	
799	2014-09-23 17:10:41.577+02	10	11	281	Definizione progetto Comuni v01 Responsive (1h)	2	Nessun campo modificato.
800	2014-09-23 17:59:46.77+02	3	11	282	Navigazione: riconfigurazione delle url (8h)	1	
801	2014-09-24 09:56:20.091+02	8	11	283	Incontro in Consiglio (6h)	1	
802	2014-09-24 09:57:25.473+02	8	11	284	coordinamento (1h)	1	
803	2014-09-24 12:50:24.594+02	4	11	285	Rifattorizzazione import (6.5h)	1	
804	2014-09-24 12:50:39.677+02	4	11	286	Rifattorizzazione import (7h)	1	
805	2014-09-24 18:04:20.668+02	3	11	287	Risoluzione bug produzione (2h)	1	
806	2014-09-24 18:04:51.17+02	3	11	288	Google webmaster tool (2h)	1	
807	2014-09-24 18:05:28.344+02	3	11	289	Popup modale (1h)	1	
808	2014-09-24 18:06:30.049+02	3	11	290	Caricamento logo, testi header/footer (2h)	1	
809	2014-09-24 18:06:40.748+02	3	11	288	Google webmaster tool (3h)	2	hours modificato/a.
810	2014-09-24 19:34:37.805+02	4	11	291	Rifattorizzazione import (7h)	1	
811	2014-09-25 12:56:43.626+02	10	11	292	Verifica Templates v04 / html 1.7.0 mrWolf (1h)	1	
812	2014-09-25 15:30:21.522+02	10	11	293	Verifica Templates Comune v01 / html 1.7.0 mrWolf (1h)	1	
813	2014-09-25 15:31:39.542+02	10	11	294	Definizione v04 Responsive (2h)	1	
814	2014-09-25 15:32:33.146+02	10	11	295	Verifica Templates v04 / Menu gerarchico con Stefano (1h)	1	
815	2014-09-25 18:08:24.267+02	3	11	296	Navigazione  (1h)	1	
816	2014-09-25 18:10:35.821+02	3	11	296	Nuove url (3h)	2	description e hours modificato/a.
817	2014-09-25 18:10:56.954+02	3	11	297	Caricamento logo (2h)	1	
818	2014-09-25 18:11:18.025+02	3	11	298	Meeting su modifiche template (1h)	1	
819	2014-09-25 18:11:47.612+02	3	11	299	Debug codice produzione (1h)	1	
820	2014-09-25 18:12:23.744+02	3	11	297	Caricamento logo (2h)	2	Nessun campo modificato.
821	2014-09-25 18:12:35.944+02	3	11	300	Sitemap (1h)	1	
822	2014-09-25 19:27:38.602+02	4	11	301	Rifattorizzazione import (6.5h)	1	
823	2014-09-26 18:21:37.834+02	3	11	302	Messa online servizi (2h)	1	
824	2014-09-26 18:21:54.01+02	3	11	303	Debug (1h)	1	
825	2014-09-26 18:22:09.414+02	3	11	304	Popup modale (1h)	1	
826	2014-09-26 18:23:13.729+02	3	11	305	Sitemap (3h)	1	
827	2014-09-29 14:28:59.422+02	10	11	306	Definizione progetto Comuni v01 Responsive (4h)	1	
828	2014-09-29 14:29:20.408+02	10	11	307	Definizione progetto Comuni v01 Responsive (1h)	1	
829	2014-09-29 19:17:27.218+02	3	11	308	Sitemap xml (7h)	1	
830	2014-09-29 19:17:43.586+02	3	11	309	Call visup (1h)	1	
831	2014-09-30 11:13:53.484+02	8	16	20	coordinamento (32h)	1	
832	2014-09-30 11:15:10.462+02	8	16	21	Tavolo civico (8h)	1	
833	2014-09-30 11:15:54.136+02	8	16	22	conferenza (5h)	1	
834	2014-09-30 11:19:01.479+02	8	16	23	coordinamento (16h)	1	
835	2014-09-30 18:43:38.478+02	3	11	310	Bug template  (3h)	1	
836	2014-09-30 18:44:11.542+02	3	11	311	Sitemap: disabilitazione in staging (2h)	1	
837	2014-09-30 19:32:50.207+02	4	11	312	Rifattorizzazione import (6h)	1	
838	2014-09-30 19:33:11.077+02	4	11	313	Rifattorizzazione import (7h)	1	
839	2014-09-30 19:33:20.986+02	4	11	314	Rifattorizzazione import (7h)	1	
840	2014-10-01 11:02:28.827+02	8	11	315	Riunione depp (2h)	1	
841	2014-10-01 11:03:16.651+02	8	11	316	coordinamento (6h)	1	
842	2014-10-01 11:05:03.163+02	8	11	317	Incontro Camera Deputati (3h)	1	
843	2014-10-01 11:05:36.407+02	8	11	318	coordinamento (6h)	1	
844	2014-10-01 18:31:26.195+02	3	11	319	Bug avanzo / disavanzo di bilancio (3h)	1	
845	2014-10-01 18:31:40.368+02	3	11	320	Ottimizzazione codice widget (3h)	1	
846	2014-10-01 18:31:50.064+02	3	11	321	Bug template (2h)	1	
847	2014-10-01 19:09:48.228+02	10	11	322	Definizione Progetto Comuni v01 (1h)	1	
848	2014-10-01 19:10:26.691+02	10	11	322	Definizione Progetto Comuni v02 (1h)	2	description modificato/a.
849	2014-10-01 19:13:11.19+02	10	11	323	Verifica Templates v04 / html 1.7.0 mrWolf (4h)	1	
850	2014-10-01 20:06:03.641+02	13	16	24	contabilità (6.5h)	1	
851	2014-10-02 13:28:31.563+02	10	11	324	Verifica Templates Comune v01 / html 1.7.0 mrWolf (1h)	1	
852	2014-10-02 13:28:57.583+02	10	11	325	Definizione progetto Comuni v01 Responsive (2h)	1	
853	2014-10-02 18:11:48.254+02	14	11	326	Aggiornamento elezioni provinciali 2014 + aggiornamenti di vari comuni ancora vuoti dopo amministrative 2014 (4h)	1	
855	2014-10-02 19:30:57.373+02	4	11	328	Rifattorizzazione import (6.5h)	1	
856	2014-10-02 19:31:09.682+02	4	11	329	Rifattorizzazione import (7h)	1	
857	2014-10-03 18:08:30.235+02	3	11	330	Integrazione template (2h)	1	
858	2014-10-03 18:08:58.011+02	3	11	331	meeting progettazione (2h)	1	
859	2014-10-03 18:09:38.162+02	3	11	332	Correzioni widget bilancio (3h)	1	
860	2014-10-03 18:09:51.28+02	3	11	330	Integrazione template (3h)	2	hours modificato/a.
861	2014-10-05 22:42:14.781+02	8	10	34	Ricerca Finanziamenti (ZFIN)	1	
862	2014-10-05 22:42:33.522+02	8	10	13	Comunicazione (ZCOM)	2	identification_code modificato/a.
863	2014-10-05 22:42:48.207+02	8	10	29	OpenBlog (ZBLOG)	2	identification_code modificato/a.
864	2014-10-05 22:43:58.589+02	8	10	27	Charts Builder (ZCHAB)	2	identification_code modificato/a.
865	2014-10-05 22:44:26.023+02	8	10	11	FOIA (ZFOIA)	2	identification_code modificato/a.
866	2014-10-05 22:44:48.355+02	8	10	10	Parlamento Casa di Vetro (ZPCV)	2	identification_code modificato/a.
867	2014-10-05 22:45:08.426+02	8	10	9	Voi Siete Qui (ZVSQ)	2	identification_code modificato/a.
868	2014-10-05 22:45:25.896+02	8	10	5	Gestione e amministrazione generale (ZGEST)	2	identification_code modificato/a.
869	2014-10-05 22:45:40.148+02	8	10	4	Infrastrutture Management (ZIMAN)	2	identification_code modificato/a.
870	2014-10-05 22:47:43.275+02	8	16	25	HORIZON 2020 (16h)	1	
871	2014-10-06 11:58:38.396+02	10	11	333	Osservazioni Widget Selettore anni e Timeline sindaci (2h)	1	
872	2014-10-06 12:00:55.689+02	10	11	334	Definizione progetto restyling grafici con Vincenzo e Daniele (1h)	1	
873	2014-10-06 12:01:49.264+02	10	11	335	Definizione progetto Comuni v01 Responsive (1.5h)	1	
874	2014-10-06 12:02:07.312+02	10	11	336	Definizione progetto Comuni v01 Responsive (2.5h)	1	
875	2014-10-06 12:02:19.532+02	10	11	336	Definizione progetto Comuni v01 Responsive (3h)	2	hours modificato/a.
876	2014-10-06 18:00:23.505+02	3	11	337	Aggiornamento template (8h)	1	
877	2014-10-07 18:08:06.185+02	3	11	338	Aggiornamento template (8h)	1	
878	2014-10-07 18:20:45.513+02	8	10	26	Camere Aperte 2014 (ZCA14)	2	identification_code modificato/a.
879	2014-10-07 18:35:44.225+02	13	15	27	contabilità	2	recurrences modificato/a.
880	2014-10-07 19:40:13.41+02	4	11	339	Rifattorizzazione import (6.5h)	1	
881	2014-10-07 19:40:28.538+02	4	11	340	Rifattorizzazione import (6.5h)	1	
882	2014-10-07 23:27:48.313+02	8	10	5	Gestione e amministrazione generale (ZZGES)	2	identification_code e description modificato/a.
883	2014-10-08 16:58:05.489+02	7	10	25	Dossier Commissione UE (DS7)	2	identification_code modificato/a.
884	2014-10-08 16:58:13.16+02	7	10	24	Dossier M5S (DS6)	2	identification_code modificato/a.
885	2014-10-08 16:59:53.444+02	7	10	35	Dossier OpenBilanci (DS5)	1	
886	2014-10-08 17:01:30.666+02	7	11	341	incontro repubblica, elaborazione testi (48h)	1	
887	2014-10-08 17:04:51.069+02	7	10	36	Dossier Indice di Produttività (DS8)	1	
888	2014-10-08 18:00:58.374+02	3	11	342	Aggiornamento template (8h)	1	
889	2014-10-08 18:58:35.769+02	14	11	343	brainstorming tabelle + creazione tabellone + inizio data entry (2h)	1	
890	2014-10-09 15:43:15.244+02	10	11	344	Analisi indice di produttività (2h)	1	
891	2014-10-09 15:44:31.451+02	10	11	345	Verifica Templates v04 su staging (2h)	1	
892	2014-10-09 15:44:47.93+02	10	11	344	Analisi Indice di produttività (2h)	2	description modificato/a.
893	2014-10-09 17:28:54.026+02	8	11	346	riunione rti (4h)	1	
894	2014-10-09 17:30:06.872+02	8	11	347	ricerca finanziamenti EU (4h)	1	
895	2014-10-09 17:30:48.902+02	8	11	348	Commerciale (4h)	1	
896	2014-10-09 17:31:55.943+02	8	11	349	gestione personale (2h)	1	
897	2014-10-09 17:32:32.807+02	8	11	350	riunione settimanale (2h)	1	
898	2014-10-09 17:32:55.185+02	8	11	351	ricerca finanziamenti EU (4h)	1	
899	2014-10-09 17:44:20.815+02	9	15	62	Rapporto con il cliente e rendicontazioni	1	
900	2014-10-09 17:49:36.59+02	9	15	63	Progettazione, coordinamento e rapporto con il cliente	1	
901	2014-10-09 17:51:21.771+02	9	15	62	Rapporto con il cliente e rendicontazioni	2	recurrences modificato/a.
902	2014-10-09 18:06:48.789+02	3	11	352	Aggiornamento template (8h)	1	
903	2014-10-09 18:20:28.912+02	14	11	353	Prime elaborazioni per tabelle (5h)	1	
904	2014-10-09 19:16:21.045+02	4	11	354	Rifattorizzazione import (4h)	1	
905	2014-10-09 19:16:39.876+02	4	11	355	Rifattorizzazione import (3h)	1	
906	2014-10-09 19:17:18.435+02	4	11	356	Invio email di notifica su iscrizione a newsletter (1h)	1	
907	2014-10-10 12:38:55.163+02	8	15	64	dd	1	
908	2014-10-10 12:40:15.963+02	8	15	64	dd	3	
909	2014-10-10 12:41:38.025+02	8	15	64	dd	1	
910	2014-10-10 18:08:11.506+02	13	16	26	contabilità (7h)	1	
911	2014-10-10 18:09:06.084+02	13	16	27	contabilità (8h)	1	
912	2014-10-10 18:28:32.27+02	3	11	357	Aggiornamento template (8h)	1	
913	2014-10-10 19:05:16.522+02	4	11	358	Slugify su progetti (2h)	1	
914	2014-10-13 14:26:33.343+02	10	11	359	Progetto minidossier Indice di produttività (1h)	1	
915	2014-10-13 14:30:38.162+02	8	15	65	prova	1	
916	2014-10-13 14:33:21.306+02	8	15	65	prova	2	hours e recurrences modificato/a.
917	2014-10-13 16:58:01.072+02	1	15	66	Festa OGP	1	
918	2014-10-13 17:03:02.477+02	1	15	66	Festa OGP	3	
919	2014-10-13 18:17:11.831+02	14	11	360	Elaborazione e Aggregazione dati (5h)	1	
920	2014-10-13 18:17:29.287+02	14	11	361	Elaborazione e Aggregazione dati (5h)	1	
921	2014-10-13 18:34:59.902+02	3	11	362	Aggiornamento template (8h)	1	
922	2014-10-13 18:35:03.443+02	8	15	65	prova	3	
923	2014-10-13 18:35:03.573+02	8	15	64	dd	3	
924	2014-10-13 18:40:05.564+02	8	11	347	ricerca finanziamenti EU (8h)	2	hours modificato/a.
925	2014-10-13 18:40:13.502+02	8	11	351	ricerca finanziamenti EU (8h)	2	hours modificato/a.
926	2014-10-13 18:41:30.762+02	8	11	363	Eu Parliament (4h)	1	
927	2014-10-13 18:42:21.093+02	8	11	364	coordimnamento (4h)	1	
928	2014-10-13 22:29:37.554+02	7	10	37	Master Sole24Ore (MS24)	1	
929	2014-10-13 22:30:31.406+02	7	11	365	Corso (16h)	1	
930	2014-10-13 22:31:07.4+02	7	11	366	corso (40h)	1	
931	2014-10-13 22:46:03.883+02	7	11	367	riunione gruppo di lavoro (3h)	1	
932	2014-10-13 22:46:55.893+02	7	11	368	inserimento contenuti di test (3h)	1	
933	2014-10-14 10:40:35.706+02	3	15	64	Sviluppo piattaforma	1	
934	2014-10-14 10:41:09.134+02	3	15	64	Sviluppo piattaforma	2	end_date e recurrences modificato/a.
935	2014-10-14 12:54:20.976+02	14	11	369	Fine elaborazione tabelle (2h)	1	
936	2014-10-14 14:48:12.753+02	7	15	20	post, newsletter, ricerche	2	recurrences modificato/a.
937	2014-10-14 14:48:30.983+02	7	15	19	ricerca dati, scrittura aritcoli	2	recurrences modificato/a.
938	2014-10-14 14:48:40.508+02	7	15	16	analisi atti	2	recurrences modificato/a.
939	2014-10-14 14:48:49.681+02	7	15	15	aggiornamento politici e gestione community	2	recurrences modificato/a.
940	2014-10-14 14:48:55.417+02	7	15	11	publishing openblog, condivisioni social, ricerche dati, elaborazione grafici	2	recurrences modificato/a.
941	2014-10-14 14:49:01.674+02	7	15	10	ricerca dati, publishing openpolitix	2	recurrences modificato/a.
942	2014-10-14 14:49:11.905+02	7	15	9	tagging, dati politici	2	recurrences modificato/a.
943	2014-10-14 14:49:18.315+02	7	15	8	tagging, priorità, controllo iter, evidenze	2	recurrences modificato/a.
944	2014-10-14 14:49:23.936+02	7	15	7	verifica siti, import interni, segnalazioni community	2	recurrences modificato/a.
945	2014-10-14 14:51:38.144+02	7	10	2	Open Bilanci (OB)	2	workers modificato/a.
946	2014-10-14 14:54:15.122+02	7	15	65	post	1	
947	2014-10-14 14:54:55.723+02	7	15	66	post	1	
948	2014-10-14 15:17:12.13+02	1	15	20	post, newsletter, ricerche	2	recurrences modificato/a.
949	2014-10-14 15:42:37.87+02	1	15	66	post	2	recurrences modificato/a.
950	2014-10-14 15:42:48.036+02	1	15	19	ricerca dati, scrittura aritcoli	2	recurrences modificato/a.
951	2014-10-14 15:42:57.92+02	1	15	16	analisi atti	2	recurrences modificato/a.
952	2014-10-14 15:43:07.576+02	1	15	15	aggiornamento politici e gestione community	2	recurrences modificato/a.
953	2014-10-14 18:20:04.589+02	3	11	370	Aggiornamento template Indicatori, fix entrate/spese (8h)	1	
954	2014-10-14 18:20:12.794+02	3	11	362	Aggiornamento template entrate,spese (8h)	2	description modificato/a.
955	2014-10-14 18:20:24.026+02	3	11	357	Aggiornamento template, entrate spese accordion (8h)	2	description modificato/a.
956	2014-10-15 09:14:30.105+02	10	11	371	Progetto minidossier Indice di produttività (3h)	1	
957	2014-10-15 09:15:00.619+02	10	11	372	Verifica Templates v04 su staging (1h)	1	
958	2014-10-15 18:05:48.485+02	3	11	373	Progettazione Open spesa, territori (2h)	1	
959	2014-10-15 18:06:17.071+02	3	11	374	Aggiornamento template: indicatori e miniclassifiche (6h)	1	
960	2014-10-15 18:38:15.041+02	14	11	375	Inizio Import Ministero Interno (4h)	1	
961	2014-10-15 23:22:15.212+02	10	11	376	Progetto minidossier Indice di produttività (4h)	1	
962	2014-10-16 15:54:25.077+02	10	11	377	Progetto minidossier Indice di produttività (4h)	1	
963	2014-10-16 18:21:54.303+02	3	11	378	Aggiornamento template: pagina confronti, menu gerarchico (8h)	1	
964	2014-10-16 19:14:38.591+02	4	11	379	Gestione sidebar su pagine flat (3h)	1	
965	2014-10-16 19:16:48.168+02	4	11	380	Gestione sidebar su pagine flat (2h)	1	
966	2014-10-16 19:19:10.781+02	4	11	381	Riunione di startup, con analisi problamatica localizzazioni (2h)	1	
967	2014-10-16 20:25:08.777+02	8	11	382	riunione depp (2h)	1	
968	2014-10-16 20:26:44.437+02	8	11	383	controllo di gestione (3h)	1	
969	2014-10-16 20:27:22.028+02	8	11	384	coordinamento (3h)	1	
970	2014-10-16 20:28:04.598+02	8	11	385	coordinamento (3h)	1	
971	2014-10-16 20:28:57.013+02	8	11	386	Campagna OpenSiope (3h)	1	
972	2014-10-16 20:30:02.773+02	8	11	387	finanz. eu (2h)	1	
973	2014-10-16 20:31:28.266+02	8	11	388	Lobbying ParlamentoCasadiVetro (2h)	1	
974	2014-10-16 20:32:17.713+02	8	11	389	lobbying ParlamentoCasadiVetro e Siope (4h)	1	
975	2014-10-16 20:32:42.551+02	8	11	390	coordinamento (4h)	1	
976	2014-10-16 20:39:03.017+02	8	11	391	coordinamento (8h)	1	
977	2014-10-16 20:39:26.215+02	8	11	392	coordinamento (8h)	1	
978	2014-10-17 15:11:57.669+02	10	11	393	Progetto minidossier Indice di produttività (3h)	1	
979	2014-10-17 15:12:27.328+02	10	11	394	Verifica Templates v04 su staging (1h)	1	
980	2014-10-17 16:29:03.163+02	14	11	395	Tabelle aggiuntive (1.5h)	1	
981	2014-10-17 16:45:16.151+02	14	11	396	Import Min.Interno (1.5h)	1	
982	2014-10-17 17:40:52.504+02	14	11	397	Import Min. Interno (1.5h)	1	
983	2014-10-17 18:01:32.224+02	3	11	398	Aggiornamento template: Confronti, bug fix (8h)	1	
984	2014-10-19 20:23:45.539+02	8	11	399	lobbying  (4h)	1	
985	2014-10-19 20:24:34.9+02	8	11	400	coordinamento (2h)	1	
986	2014-10-19 20:25:34.409+02	8	11	401	ricerca finanziamenti EU (2h)	1	
987	2014-10-19 22:05:40.271+02	10	11	402	Progetto minidossier Indice di produttività (3h)	1	
988	2014-10-20 10:34:13.858+02	9	15	63	Progettazione, coordinamento e rapporto con il cliente	2	recurrences modificato/a.
989	2014-10-20 10:36:24.81+02	9	15	67	redazione offerta e censimento dati	1	
990	2014-10-20 10:37:42.326+02	9	15	68	aggiornamento dati	1	
991	2014-10-20 10:38:39.735+02	9	15	69	agg. dati e sviluppo sw	1	
992	2014-10-20 10:39:51.034+02	9	15	70	rapporti e progettazione	1	
993	2014-10-20 10:41:24.317+02	9	11	403	Incontro cliente, manutenzione, redazione offerta (16h)	1	
994	2014-10-20 10:42:26.807+02	9	11	404	Incontri e redazione offerta (16h)	1	
995	2014-10-20 10:43:17.1+02	2	16	28	Gestione dei progetti (20h)	1	
996	2014-10-20 10:43:50.477+02	2	16	29	Gestione dei progetti (20h)	1	
997	2014-10-20 10:43:59.729+02	9	11	405	incontro per emilia romagna (8h)	1	
998	2014-10-20 10:45:12.945+02	9	11	406	incontro per emilia romagna (8h)	1	
999	2014-10-20 18:11:41.442+02	14	11	407	Import Min. Interno (2h)	1	
1000	2014-10-20 18:15:17.959+02	3	11	408	Aggiornamento template: classifiche. Fix miniclassifiche + fix vari (8h)	1	
1001	2014-10-20 20:27:44.289+02	10	11	409	Progetto minidossier Indice di produttività (4h)	1	
1002	2014-10-21 15:40:21.178+02	10	11	410	Progetto minidossier Indice di produttività (4h)	1	
1003	2014-10-21 18:16:38.258+02	3	11	411	Aggiornamento template: bug fix, incarichi (6h)	1	
1004	2014-10-21 18:16:56.772+02	3	11	412	Correzione script mediane (1h)	1	
1005	2014-10-21 18:17:15.291+02	3	11	413	Riassunto issue Visup (1h)	1	
1006	2014-10-21 18:41:57.504+02	13	16	30	contabilità (8.5h)	1	
1007	2014-10-22 09:33:56.131+02	2	11	414	Definizione metadati estesi per impegni e pagamenti.. Report meeting di giovedì al cliente. (1h)	1	
1008	2014-10-22 09:35:24.78+02	2	11	415	Deploy modifiche su flatpages in staging. Allineamento dati utenti in staging. (3h)	1	
1009	2014-10-22 09:36:30.295+02	2	11	416	Startup dell'analisi. Identificazione componenti necessari e strumenti da (ri-)usare. (1h)	1	
1010	2014-10-22 09:37:08.87+02	2	11	417	Gestione progetti Daniele, Gantt, task sparsi vari. (1h)	1	
1011	2014-10-22 09:38:17.081+02	2	11	418	Trasferta Bologna. Regione Emilia Romagna per Open Consiglio (8h)	1	
1012	2014-10-22 09:39:12.62+02	2	11	419	Correzione alcuni bug (1h)	1	
1013	2014-10-22 09:39:36.328+02	2	11	420	Attività varie e generali (2h)	1	
1014	2014-10-22 09:40:00.39+02	2	11	421	Meeting in Lait con ISED.. (3h)	1	
1015	2014-10-22 18:00:40.353+02	3	11	422	Aggiornamento template: menu slim, fix accordion (8h)	1	
1016	2014-10-23 10:42:44.719+02	14	11	423	Nuove tabelle (1.5h)	1	
1017	2014-10-23 16:25:27.54+02	5	11	424	Modifiche alle API (2h)	1	
1018	2014-10-23 17:32:10.88+02	14	11	425	import Min. Interni (1.5h)	1	
1019	2014-10-23 17:32:22.457+02	14	11	425	import Min. Interni (2h)	2	hours modificato/a.
1020	2014-10-23 17:55:51.871+02	14	11	426	Problema caricamento foto risolto (0.5h)	1	
1021	2014-10-23 18:03:32.201+02	3	11	427	Aggiornamento template: menu slim (1h)	1	
1022	2014-10-23 18:03:45.559+02	3	11	428	Aggiornamento template (7h)	1	
1023	2014-10-23 18:54:39.478+02	10	11	429	Progetto minidossier Indice di produttività (6h)	1	
1024	2014-10-23 18:55:47.225+02	10	11	430	Progetto minidossier Indice di produttività (2h)	1	
1025	2014-10-23 18:56:16.169+02	10	11	431	Progetto minidossier Indice di produttività (2h)	1	
1026	2014-10-23 18:56:30.345+02	10	11	432	Progetto minidossier Indice di produttività (2h)	1	
1027	2014-10-24 17:50:59.266+02	2	11	433	Analisi tempi di sviluppo e preparazione del Gantt (1h)	1	
1028	2014-10-24 17:51:32.994+02	2	11	434	Meeting di recap delle richieste future (4h)	1	
1029	2014-10-24 17:52:41.957+02	2	11	435	Analisi in preparazione dell'inserimento primi 20 dataset (2h)	1	
1030	2014-10-24 17:56:33.487+02	2	11	436	Startup progetto Django (1.5h)	1	
1031	2014-10-24 17:57:49.047+02	2	11	437	Generazione metadati su ODL (3h)	1	
1032	2014-10-24 17:58:32.677+02	2	11	438	Attività varie e generali (1h)	1	
1033	2014-10-24 17:59:27.841+02	2	11	439	Preparazione metadati e dati dei primi 20 datasets (3h)	1	
1034	2014-10-24 17:59:58.496+02	2	11	440	Attività varie e generali (1h)	1	
1035	2014-10-24 18:00:32.503+02	2	11	441	Test installazione Pentaho BI (kettle server) (2h)	1	
1036	2014-10-24 18:11:42.725+02	3	11	442	Aggiornamento template: link accordion classifiche (6h)	1	
1037	2014-10-24 18:11:59.067+02	3	11	443	Update widget visup (2h)	1	
1038	2014-10-24 20:55:10.002+02	13	16	31	contabilità (7h)	1	
1039	2014-10-27 18:02:54.073+01	3	11	444	Aggiornamento template: link accordion classifiche, fix css (8h)	1	
1040	2014-10-27 18:19:52.775+01	10	11	445	Progetto minidossier Indice di produttività (5h)	1	
1041	2014-10-27 18:20:14.633+01	10	11	446	Progetto minidossier Indice di produttività (6h)	1	
1042	2014-10-28 18:11:45.759+01	3	11	447	Ordine delle voci in accordion, css fix dell'accordion (8h)	1	
1043	2014-10-28 19:31:58.784+01	8	11	448	Riunione depp (2h)	1	
1044	2014-10-28 19:34:04.775+01	8	11	449	analisi (2h)	1	
1045	2014-10-28 19:35:10.065+01	8	11	450	coordinamento (2h)	1	
1046	2014-10-28 19:36:12.589+01	8	11	451	Incontro in Consiglio (5h)	1	
1047	2014-10-28 19:38:28.511+01	8	11	452	coordinamento (4h)	1	
1048	2014-10-28 19:39:36.824+01	8	11	453	commerciale (3h)	1	
1049	2014-10-28 19:40:33.733+01	8	11	454	coordinamento (4h)	1	
1050	2014-10-28 19:42:16.105+01	8	11	455	Evento - Conferenza (8h)	1	
1051	2014-10-28 19:43:26.222+01	8	11	456	Evento - Conferenza (8h)	1	
1052	2014-10-28 19:44:34.937+01	8	11	457	Commerciale (2h)	1	
1053	2014-10-28 19:46:04.678+01	8	11	458	coordinamento (4h)	1	
1054	2014-10-28 19:46:56.349+01	8	11	459	Campagne (4h)	1	
1055	2014-10-28 19:47:26.97+01	8	11	460	incontro in Consiglio (5h)	1	
1056	2014-10-29 09:33:28.224+01	10	11	461	Progetto minidossier Indice di produttività (4h)	1	
1057	2014-10-29 09:41:28.668+01	14	11	462	Verifica dati dopo impaginazione di benedetta (1.5h)	1	
1058	2014-10-29 09:44:41.645+01	7	16	32	coordinamento editoriale (4h)	1	
1059	2014-10-29 09:45:26.238+01	7	16	33	coordinamento editoriale (8h)	1	
1060	2014-10-29 09:45:58.206+01	7	16	34	coordinamento editoriale (10h)	1	
1061	2014-10-29 11:05:33.811+01	1	15	62	Rapporto con il cliente e rendicontazioni	2	recurrences modificato/a.
1062	2014-10-29 11:06:06.527+01	1	15	69	agg. dati e sviluppo sw	2	recurrences modificato/a.
1063	2014-10-29 11:06:17.76+01	1	15	68	aggiornamento dati	2	recurrences modificato/a.
1064	2014-10-29 11:06:48.528+01	1	15	67	redazione offerta e censimento dati	2	recurrences modificato/a.
1065	2014-10-29 11:06:58.537+01	1	15	63	Progettazione, coordinamento e rapporto con il cliente	2	recurrences modificato/a.
1066	2014-10-29 11:07:09.254+01	1	15	70	rapporti e progettazione	2	recurrences modificato/a.
1067	2014-10-29 11:09:17.087+01	9	11	463	Incontro a Bologna (8h)	1	
1068	2014-10-29 11:13:29.939+01	9	11	464	Incontro al DPS (4h)	1	
1069	2014-10-29 11:15:49.733+01	9	11	465	Incontro con Regione (4h)	1	
1070	2014-10-29 11:17:01.564+01	9	11	466	Incontro il Lait con tutta al RTI (4h)	1	
1071	2014-10-29 12:03:53.708+01	2	11	467	Preparazione dei Dataset (2h)	1	
1072	2014-10-29 12:04:14.381+01	2	11	467	Preparazione metadati e dati dei primi 20 datasets (2h)	2	description modificato/a.
1073	2014-10-29 12:04:43.324+01	2	11	468	Caricamento dei Dataset in Lait (4h)	1	
1074	2014-10-29 12:18:03.178+01	2	11	469	Incontro con i fisici di Vittorio Loreto e  (3h)	1	
1075	2014-10-29 12:18:26.02+01	2	11	470	Attività varie e generali (2h)	1	
1076	2014-10-29 12:18:47.491+01	2	11	471	Attività varie e generali (2h)	1	
1077	2014-10-29 12:22:06.116+01	2	11	472	Oscuramento contenuto; messa in produzione della gestione sidebar. (1h)	1	
1078	2014-10-29 15:27:57.133+01	5	11	473	Aggiornamento API (8h)	1	
1079	2014-10-29 15:28:09.661+01	5	11	474	Aggiornamento API (8h)	1	
1080	2014-10-29 15:28:44.139+01	5	11	475	OpAccesso (24h)	1	
1081	2014-10-29 15:29:09.562+01	5	11	476	OpCassetto (14h)	1	
1082	2014-10-29 15:29:41.431+01	5	11	477	Progettazione infrastruttura Accesso/Cassetto (40h)	1	
1083	2014-10-29 15:30:42.201+01	5	11	478	Deploy e refining (32h)	1	
1084	2014-10-29 15:32:05.83+01	8	11	479	riunione depp (3h)	1	
1085	2014-10-29 15:32:19.248+01	5	11	480	Progettazione infrastruttura (32h)	1	
1086	2014-10-29 15:32:30.601+01	8	11	481	commerciale (4h)	1	
1087	2014-10-29 15:32:40.242+01	5	11	480	Progettazione infrastruttura (32h)	2	activity_date modificato/a.
1088	2014-10-29 15:32:57.697+01	5	11	480	Progettazione infrastruttura (32h)	2	activity_date modificato/a.
1089	2014-10-29 15:33:34.645+01	5	11	188	Evoluzione delle API (8h)	2	hours modificato/a.
1090	2014-10-29 15:33:38.87+01	5	11	189	Refining grafici (8h)	2	hours modificato/a.
1091	2014-10-29 15:33:42.643+01	5	11	213	Template per le Email (8h)	2	hours modificato/a.
1092	2014-10-29 15:34:47.948+01	5	11	482	Progettazione WidgetBuilder (32h)	1	
1093	2014-10-29 18:05:36.936+01	3	11	483	Logo / logotipo header (1h)	1	
1094	2014-10-29 18:07:46.457+01	3	11	484	Debug navigazione nuovo template (5h)	1	
1095	2014-10-29 18:07:53.915+01	3	11	483	Logo / logotipo header (2h)	2	hours modificato/a.
1096	2014-10-29 18:08:14.136+01	3	11	485	Messa online beta (1h)	1	
1097	2014-10-30 18:16:24.335+01	3	11	486	Messa online beta (2h)	1	
1098	2014-10-30 18:17:51.89+01	3	11	487	Fix bug couch2pg (2h)	1	
1099	2014-10-30 18:18:53.109+01	3	11	486	Messa online beta (4h)	2	hours modificato/a.
1100	2014-10-30 18:19:20.627+01	3	11	488	Import xml (2h)	1	
1101	2014-10-30 18:42:37.523+01	8	11	489	coordinamento (6h)	1	
1102	2014-10-30 18:45:07.074+01	8	11	490	ricerca finanziamenti EU (2h)	1	
1103	2014-10-31 18:05:41.847+01	3	11	491	Messa online beta (3h)	1	
1104	2014-10-31 18:07:27.75+01	3	11	492	Bug fixing beta (3h)	1	
1105	2014-10-31 18:07:56.294+01	3	11	493	Import dati (1h)	1	
1106	2014-10-31 18:08:13.905+01	3	11	494	Mapping xml (1h)	1	
1107	2014-11-02 12:14:02.764+01	13	16	35	contabilità (8h)	1	
1108	2014-11-02 17:20:25.677+01	8	15	6	Gestione amministrativa	2	hours, start_date, end_date e recurrences modificato/a.
1109	2014-11-02 17:20:37.808+01	8	15	6	Gestione amministrativa	2	recurrences modificato/a.
1190	2014-11-03 20:55:24.961+01	9	15	72	Mkg	1	
1110	2014-11-02 18:08:29.908+01	10	11	495	Progetto minidossier Indice di produttività (7h)	1	
1111	2014-11-03 12:39:18.888+01	14	11	496	traduzione in inglese + revisioni varie (5h)	1	
1112	2014-11-03 13:26:44.949+01	5	11	497	Widget produttività (8h)	1	
1113	2014-11-03 17:48:49.805+01	7	16	36	coordinamento editoriale (16h)	1	
1114	2014-11-03 17:48:55.277+01	14	11	498	Traduzioni in inglese + revisioni testi (4h)	1	
1115	2014-11-03 17:57:26.274+01	14	11	499	controllo dati dopo inserimenti grafici (2h)	1	
1116	2014-11-03 17:57:47.391+01	14	11	499	controllo dati dopo inserimenti grafici (1.5h)	2	hours modificato/a.
1117	2014-11-03 17:58:37.344+01	8	11	500	comm (4h)	1	
1118	2014-11-03 17:59:29.129+01	8	11	501	coordinamento (5h)	1	
1119	2014-11-03 18:02:05.712+01	14	11	502	Pubblicazione Indice e lancio (2h)	1	
1120	2014-11-03 18:14:49.797+01	3	11	503	Messa online beta (2h)	1	
1121	2014-11-03 18:15:43.864+01	3	11	504	Risoluzione bug interfaccia (2h)	1	
1122	2014-11-03 18:15:46.478+01	4	11	505	Analisi e progettazione API territori (5h)	1	
1123	2014-11-03 18:16:00.935+01	3	11	506	Aggiornamento procedura di import couch2pg (2h)	1	
1124	2014-11-03 18:16:03.458+01	3	11	506	Aggiornamento procedura di import couch2pg (2h)	2	Nessun campo modificato.
1125	2014-11-03 18:16:12.466+01	4	11	507	Analisi e progettazione API territori (5h)	1	
1126	2014-11-03 18:16:46.095+01	3	11	508	Aggiornamento documentazione (1h)	1	
1127	2014-11-03 18:16:56.107+01	3	11	506	Aggiornamento procedura di import couch2pg (3h)	2	hours modificato/a.
1128	2014-11-03 18:16:57.323+01	4	11	509	Analisi e progettazione API territori (5h)	1	
1129	2014-11-03 18:17:19.26+01	4	11	510	Analisi e progettazione API territori (5h)	1	
1130	2014-11-03 18:17:54.564+01	4	11	511	Analisi e progettazione API territori (5h)	1	
1131	2014-11-03 18:18:15.414+01	4	11	512	Analisi e progettazione API territori (5h)	1	
1132	2014-11-03 18:18:36.512+01	4	11	513	Analisi e progettazione API territori (5h)	1	
1133	2014-11-03 18:19:15.755+01	4	11	514	Analisi e progettazione API territori (5h)	1	
1134	2014-11-03 18:19:33.577+01	4	11	515	Analisi e progettazione API territori (5h)	1	
1135	2014-11-03 18:19:49.77+01	4	11	516	Analisi e progettazione API territori (5h)	1	
1136	2014-11-03 18:20:52.605+01	4	11	514	Analisi e progettazione API territori (5h)	2	activity_date modificato/a.
1137	2014-11-03 18:21:02.865+01	4	11	515	Analisi e progettazione API territori (5h)	2	activity_date modificato/a.
1138	2014-11-03 18:21:15.593+01	4	11	516	Analisi e progettazione API territori (5h)	2	activity_date modificato/a.
1139	2014-11-03 18:35:28.986+01	2	11	517	Riunione di produzione (1h)	1	
1140	2014-11-03 18:35:56.483+01	2	11	518	Attività varie e generali (2h)	1	
1141	2014-11-03 18:36:28.335+01	2	11	519	Attività varie e generali (2h)	1	
1142	2014-11-03 18:36:50.166+01	2	11	520	Attività varie e generali (2h)	1	
1143	2014-11-03 18:36:59.607+01	2	11	520	Attività varie e generali (2h)	2	activity_date modificato/a.
1144	2014-11-03 18:37:47.983+01	2	11	521	Debug per deploy in produzione (1h)	1	
1145	2014-11-03 18:40:59.065+01	2	11	522	Analisi estrazione dati Kettle (1h)	1	
1146	2014-11-03 18:41:42.486+01	2	11	523	Debug per deploy in produzione (4h)	1	
1147	2014-11-03 18:42:06.661+01	2	11	524	Debug per deploy in produzione (3h)	1	
1148	2014-11-03 18:42:40.31+01	2	11	525	Debug per deploy in produzione (2h)	1	
1149	2014-11-03 18:43:20.635+01	2	11	525	Debug per deploy in produzione (3h)	2	hours modificato/a.
1150	2014-11-03 18:44:00.459+01	2	11	526	Analisi Kettle per estrazione dati (2h)	1	
1151	2014-11-03 18:46:06.248+01	2	11	527	Deploy rimozione blocco su indice produttività (1h)	1	
1152	2014-11-03 18:46:41.14+01	2	11	528	Startup progetto con Stefano (1h)	1	
1153	2014-11-03 18:50:54.104+01	2	10	38	Poplus Component Integration (PCI)	1	
1154	2014-11-03 18:51:30.916+01	2	11	529	Analisi Represent Boundaries e Mapit (3h)	1	
1155	2014-11-03 18:54:34.69+01	2	10	39	Verifica consistena dati OP (OPV)	1	
1156	2014-11-03 18:54:44.323+01	2	10	38	Poplus Component Integration (PCI)	2	workers modificato/a.
1157	2014-11-03 18:55:19.163+01	2	11	530	Analisi utilizzo Kettle (2h)	1	
1158	2014-11-03 18:56:58.808+01	2	10	19	Open Data Lazio Spesa (ODLSP)	2	managers modificato/a.
1159	2014-11-03 18:58:32.303+01	2	10	16	Open Data Lazio Censimento  (ODLC)	2	managers modificato/a.
1160	2014-11-03 19:47:02.428+01	5	11	531	Analisi di Oauth2 e librerie python (32h)	1	
1161	2014-11-03 19:49:00.008+01	5	11	532	Widgets: Indicatore della posizione in classifica generale (8h)	1	
1162	2014-11-03 19:49:22.855+01	5	11	497	Widgets: Produttività parlamentari (8h)	2	description modificato/a.
1163	2014-11-03 19:49:35.53+01	5	11	497	Widgets: Produttività parlamentari (8h)	2	Nessun campo modificato.
1164	2014-11-03 19:51:41.221+01	5	11	476	OpCassetto (28h)	2	hours modificato/a.
1165	2014-11-03 19:52:17.071+01	5	11	254	Implementazione di Accesso2 (24h)	2	hours modificato/a.
1166	2014-11-03 19:52:23.39+01	5	11	253	Implementazione di Accesso2 (8h)	3	
1167	2014-11-03 19:54:03.941+01	5	11	531	Analisi di Oauth2 e librerie python (48h)	2	hours modificato/a.
1168	2014-11-03 19:54:21.416+01	5	11	531	Analisi di Oauth2 e librerie python (40h)	2	hours modificato/a.
1169	2014-11-03 19:54:32.099+01	5	11	531	Analisi di Oauth2 e librerie python (16h)	2	hours modificato/a.
1170	2014-11-03 19:54:53.606+01	5	11	213	Template per le Email (16h)	2	hours modificato/a.
1171	2014-11-03 19:59:00.752+01	5	11	533	Indice17: deploy e aggiornamenti (8h)	1	
1172	2014-11-03 20:08:36.972+01	5	11	474	Aggiornamento API (32h)	2	hours modificato/a.
1173	2014-11-03 20:08:58.585+01	5	11	474	Aggiornamento API (16h)	2	hours modificato/a.
1174	2014-11-03 20:09:01.808+01	5	11	473	Aggiornamento API (16h)	2	hours modificato/a.
1175	2014-11-03 20:09:09.828+01	5	11	473	Aggiornamento API (16h)	3	
1176	2014-11-03 20:09:14.215+01	5	11	474	Aggiornamento API (32h)	2	hours modificato/a.
1177	2014-11-03 20:09:31.764+01	5	11	189	Refining grafici (16h)	2	hours modificato/a.
1178	2014-11-03 20:09:41.227+01	5	11	531	Analisi di Oauth2 e librerie python (32h)	2	hours modificato/a.
1179	2014-11-03 20:10:08.405+01	5	11	474	Aggiornamento API (24h)	2	hours modificato/a.
1180	2014-11-03 20:10:37.573+01	5	11	424	Modifiche alle API (10h)	2	hours modificato/a.
1181	2014-11-03 20:10:42.582+01	5	11	424	Modifiche alle API (2h)	2	hours modificato/a.
1182	2014-11-03 20:10:49.551+01	5	11	189	Refining grafici (20h)	2	hours modificato/a.
1183	2014-11-03 20:10:53.192+01	5	11	188	Evoluzione delle API (12h)	2	hours modificato/a.
1184	2014-11-03 20:48:20.135+01	9	15	68	aggiornamento dati	2	hours e recurrences modificato/a.
1185	2014-11-03 20:48:50.671+01	9	15	63	Progettazione, coordinamento e rapporto con il cliente	2	hours e recurrences modificato/a.
1186	2014-11-03 20:49:32.166+01	9	11	403	Incontro cliente, manutenzione, redazione offerta (24h)	2	hours modificato/a.
1187	2014-11-03 20:50:35.476+01	9	11	534	redazione offerta (16h)	1	
1188	2014-11-03 20:51:16.394+01	9	11	535	call con cliente (4h)	1	
1189	2014-11-03 20:53:18.168+01	9	15	71	Riunione Settimanale RTI	1	
1191	2014-11-03 20:56:45.284+01	9	15	73	amministrazione varia	1	
1192	2014-11-03 20:57:31.577+01	9	15	74	Riunione settimanale interna	1	
1193	2014-11-04 11:01:19.596+01	10	11	359	Progetto collana minidossier (1h)	2	description modificato/a.
1194	2014-11-04 11:01:29.599+01	10	11	371	Progetto collana minidossier (3h)	2	description modificato/a.
1195	2014-11-04 11:01:43.597+01	10	11	376	Progetto collana minidossier (4h)	2	description modificato/a.
1196	2014-11-04 11:01:54.429+01	10	11	377	Progetto collana minidossier (4h)	2	description modificato/a.
1197	2014-11-04 11:02:23.526+01	10	11	495	Impaginazione testi e correzione refusi IPP (7h)	2	description modificato/a.
1198	2014-11-04 11:03:20.985+01	10	11	445	Cover social e copertina (5h)	2	description modificato/a.
1199	2014-11-04 11:03:52.222+01	10	11	461	Cover social e copertina (5h)	2	description e hours modificato/a.
1200	2014-11-04 11:04:02.836+01	10	11	445	Progetto minidossier Indice di produttività (4h)	2	description e hours modificato/a.
1201	2014-11-04 11:04:16.183+01	10	11	495	Impaginazione testi e correzioni varie (7h)	2	description modificato/a.
1202	2014-11-04 11:05:19.116+01	10	11	536	Cover social e poster (4h)	1	
1203	2014-11-04 12:23:07.952+01	10	11	537	Locandina (2h)	1	
1204	2014-11-04 16:11:46.209+01	5	11	538	Indice17: banner produttività e footer (4h)	1	
1205	2014-11-04 16:16:24.785+01	1	10	36	Dossier Indice di Produttività (DS8)	2	workers modificato/a.
1206	2014-11-04 17:11:51.688+01	5	11	539	Aggiornamento tramite sparql (4h)	1	
1207	2014-11-04 18:02:27.875+01	3	11	540	Debug grafico header (2h)	1	
1208	2014-11-04 18:02:49.092+01	3	11	541	Riunione con Vittorio su import xml (1h)	1	
1209	2014-11-04 18:03:04.063+01	3	11	542	Riunione Giangiulio (2h)	1	
1210	2014-11-04 18:03:50.699+01	3	11	540	Debug grafico header (3h)	2	hours modificato/a.
1211	2014-11-04 18:04:35.973+01	3	11	543	Aggiornamento su robots, procedure di import e indicizzazione (2h)	1	
1212	2014-11-05 10:52:26.988+01	14	11	544	Import Min. Interni (2h)	1	
1213	2014-11-05 18:00:21.914+01	5	11	539	Analisi query sparql su dati.camera.it (4h)	2	description modificato/a.
1214	2014-11-05 18:00:58.414+01	5	11	545	Progettazione aggiornamento dati da dati.camera.it (6h)	1	
1215	2014-11-05 18:37:56.611+01	3	11	546	Pagine statiche, pagina statica not found (5h)	1	
1216	2014-11-05 18:38:14.761+01	3	11	547	Meeting progettazione nuovo slider home (1h)	1	
1217	2014-11-05 18:39:04.657+01	3	11	548	Aggiunta robots.txt (2h)	1	
1218	2014-11-05 18:39:27.127+01	3	11	546	Pagine statiche, pagina statica not found (4h)	2	hours modificato/a.
1219	2014-11-05 18:39:48.673+01	3	11	549	Studio web master tools google, risoluzione errori crawler (1h)	1	
1220	2014-11-06 17:56:41.404+01	14	11	550	Ultimo import Min Interni (2h)	1	
1221	2014-11-06 18:04:55.11+01	3	11	551	Import xml: procedura (4h)	1	
1222	2014-11-06 18:05:13.585+01	3	11	552	Update doc deploy (2h)	1	
1223	2014-11-06 18:05:37.789+01	3	11	553	Dump indicatori per fornitura (1h)	1	
1224	2014-11-06 18:06:03.285+01	3	11	554	Debug interfaccia grafica (1h)	1	
1225	2014-11-07 10:52:47.825+01	5	11	555	Sparql e test su database (6h)	1	
1226	2014-11-07 15:11:10.343+01	7	16	37	coordinamento editoriale (10h)	1	
1227	2014-11-07 15:13:02.698+01	7	16	38	riunione ad Internazionale (3h)	1	
1228	2014-11-07 16:03:31.784+01	14	11	556	aggiornamento dati dopo insediamento commissione juncker (2h)	1	
1229	2014-11-07 18:02:53.69+01	3	11	557	Template mobile (1h)	1	
1230	2014-11-07 18:03:37.427+01	3	11	558	Import xml: definizione procedura (6h)	1	
1231	2014-11-07 18:03:51.619+01	3	11	559	Robots.txt in produzione (1h)	1	
1232	2014-11-09 13:50:35.312+01	8	11	560	commerciale (4h)	1	
1233	2014-11-09 13:51:17.324+01	8	11	561	coordinamento (4h)	1	
1234	2014-11-09 13:52:38.544+01	8	11	562	coordinamento (8h)	1	
1235	2014-11-09 13:53:04.03+01	8	11	563	coordinamento (4h)	1	
1236	2014-11-09 13:53:52.02+01	8	11	564	analisi (4h)	1	
1237	2014-11-09 13:54:32.741+01	8	11	565	coordinamento (8h)	1	
1238	2014-11-09 14:00:09.398+01	8	11	563	coordinamento (4h)	2	project e activity_type modificato/a.
1239	2014-11-09 14:00:34.702+01	8	11	565	coordinamento (4h)	2	hours modificato/a.
1240	2014-11-09 14:01:06.149+01	8	11	566	progettazione (4h)	1	
1241	2014-11-10 10:19:19.348+01	2	11	567	Attività varie e generali (2h)	1	
1242	2014-11-10 10:20:17.652+01	2	11	568	Correzione bug, risposta ad email, caricamento dati cambiati. (2h)	1	
1243	2014-11-10 10:21:15.108+01	2	11	569	Risoluzione sovraccarico traffico su OPP, proveniente da widget Espresso (3h)	1	
1244	2014-11-10 10:21:55.387+01	2	11	570	Refine impostazione progetto con Stefano (1h)	1	
1245	2014-11-10 10:24:10.784+01	2	11	571	Analisi funzionalità Kettle (4h)	1	
1246	2014-11-10 10:24:47.649+01	2	11	572	Inserimento descrizione nuovi indicatori (2h)	1	
1247	2014-11-10 10:25:20.864+01	2	11	573	Attività varie e generali (2h)	1	
1248	2014-11-10 10:25:36.017+01	2	11	574	Attività varie e generali (1h)	1	
1249	2014-11-10 10:25:55.304+01	2	11	574	Attività varie e generali (2h)	2	hours modificato/a.
1250	2014-11-10 10:26:38.663+01	2	11	575	Analisi funzionalità Kettle (2h)	1	
1251	2014-11-10 10:26:47.118+01	2	11	575	Analisi funzionalità Kettle (2h)	2	project modificato/a.
1252	2014-11-10 10:27:21.017+01	2	11	576	Progetto Django (2h)	1	
1253	2014-11-10 10:27:45.283+01	2	11	577	Riunione in Lait su dati di bilancio (3h)	1	
1254	2014-11-10 12:09:24.362+01	10	11	578	Analisi preliminare Home (4h)	1	
1255	2014-11-10 12:10:03.23+01	10	11	536	Cover social e locandina (4h)	2	description modificato/a.
1256	2014-11-10 12:10:31.317+01	10	11	335	Definizione progetto Comuni Responsive (1.5h)	2	description modificato/a.
1257	2014-11-10 12:11:08.671+01	10	11	579	Definizione progetto Comuni e Generale Responsive (6h)	1	
1258	2014-11-10 12:11:25.704+01	10	11	580	Definizione progetto Comuni e Generale Responsive (4h)	1	
1259	2014-11-10 12:11:50.85+01	10	11	581	Progetto preliminare homepage (3h)	1	
1260	2014-11-10 12:12:08.251+01	10	11	580	Definizione progetto Comuni e Generale Responsive (4h)	2	activity_date modificato/a.
1261	2014-11-10 12:12:19.811+01	10	11	579	Definizione progetto Comuni e Generale Responsive (6h)	2	activity_date modificato/a.
1262	2014-11-10 12:12:42.001+01	10	11	372	Verifica Templates Generale su staging (1h)	2	description modificato/a.
1263	2014-11-10 12:12:52.704+01	10	11	394	Verifica Templates Generale su staging (1h)	2	description modificato/a.
1264	2014-11-10 12:13:03.917+01	10	11	345	Verifica Templates Generale su staging (2h)	2	description modificato/a.
1265	2014-11-10 12:13:14.135+01	10	11	336	Definizione progetto Comuni Responsive (3h)	2	description modificato/a.
1266	2014-11-10 12:13:24.762+01	10	11	325	Definizione progetto Comuni Responsive (2h)	2	description modificato/a.
1267	2014-11-10 12:13:40.69+01	10	11	324	Verifica Templates Comune / html mrWolf (1h)	2	description modificato/a.
1268	2014-11-10 12:13:55.635+01	10	11	323	Verifica Templates Generale / html mrWolf (4h)	2	description modificato/a.
1269	2014-11-10 12:14:06.628+01	10	11	322	Definizione Progetto Comuni (1h)	2	description modificato/a.
1270	2014-11-10 12:14:16.271+01	10	11	306	Definizione progetto Comuni Responsive (4h)	2	description modificato/a.
1271	2014-11-10 12:14:36.761+01	10	11	281	Definizione progetto Comuni Responsive (1h)	2	description modificato/a.
1272	2014-11-10 12:14:55.472+01	10	11	278	Definizione progetto Comuni Responsive (2h)	2	description modificato/a.
1273	2014-11-10 12:15:07.894+01	10	11	307	Definizione progetto Comuni Responsive (1h)	2	description modificato/a.
1274	2014-11-10 12:15:42.677+01	10	11	148	Verifica Templates Generale / html mrWolf (5h)	2	description modificato/a.
1275	2014-11-10 12:16:28.499+01	10	11	155	Verifica Templates Generale / html mrWolf (3h)	2	description modificato/a.
1276	2014-11-10 12:16:41.398+01	10	11	186	Verifica Templates Generale / html mrWolf (2h)	2	description modificato/a.
1277	2014-11-10 12:16:53.063+01	10	11	212	Verifica Templates Generale / html mrWolf (5h)	2	description modificato/a.
1278	2014-11-10 12:17:12.065+01	10	11	233	Verifica Templates Generale / html mrWolf (4h)	2	description modificato/a.
1279	2014-11-10 12:17:24.393+01	10	11	272	Verifica Templates Generale / html mrWolf (1h)	2	description modificato/a.
1280	2014-11-10 12:17:33.247+01	10	11	277	Verifica Templates Generale / html mrWolf (2h)	2	description modificato/a.
1281	2014-11-10 12:17:53.049+01	10	11	280	Verifica Templates Generale / html mrWolf (4h)	2	description modificato/a.
1282	2014-11-10 12:18:06.735+01	10	11	292	Verifica Templates Generale / html mrWolf (1h)	2	description modificato/a.
1283	2014-11-10 12:54:25.647+01	4	11	582	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (6h)	1	
1284	2014-11-10 12:54:43.585+01	4	11	583	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (6h)	1	
1285	2014-11-10 12:55:01.741+01	4	11	584	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (7h)	1	
1286	2014-11-10 12:55:16.695+01	4	11	585	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (7h)	1	
1287	2014-11-10 12:55:49.686+01	4	11	584	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (7h)	2	activity_date modificato/a.
1288	2014-11-10 12:55:58.165+01	4	11	585	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (7h)	2	activity_date modificato/a.
1289	2014-11-10 17:11:26.191+01	8	11	586	coordinamento (4h)	1	
1290	2014-11-10 17:11:57.107+01	8	11	587	Versione responsive (2h)	1	
1291	2014-11-10 17:12:21.931+01	8	11	588	lobbying ParlamentoCasadiVetro e Siope (2h)	1	
1292	2014-11-10 18:26:18.063+01	3	11	589	Import codici xml: script di import codici (8h)	1	
1293	2014-11-10 18:45:23.707+01	1	10	8	Open Parlamento (OPP)	2	workers modificato/a.
1294	2014-11-10 18:51:01.677+01	5	11	590	Controlli di integrità gruppi e cariche (6h)	1	
1295	2014-11-10 18:51:26.5+01	5	11	590	Controlli di integrità gruppi e cariche (6h)	2	activity_date modificato/a.
1296	2014-11-10 18:52:02.266+01	10	11	591	Progetto preliminare homepage (4h)	1	
1297	2014-11-10 19:00:11.675+01	2	11	592	Analisi opportunità utilizzo django-admincommand (scartato) (2h)	1	
1298	2014-11-10 19:01:05.989+01	2	11	593	Sviluppo interfaccia di gestione delle verifiche (in admin) (4h)	1	
1299	2014-11-10 19:01:16.247+01	2	11	592	Analisi opportunità utilizzo django-admincommand (scartato) (2h)	2	activity_type modificato/a.
1300	2014-11-10 19:01:51.177+01	2	11	594	Test installazione docker su eeeBox (fallito, 32 bit, richiede 64bit) (1h)	1	
1301	2014-11-10 19:02:09.528+01	2	11	595	Attività varie e generali (1h)	1	
1302	2014-11-10 19:32:16.6+01	4	11	596	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (6.5h)	1	
1303	2014-11-11 14:18:18.01+01	4	11	596	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (6.5h)	2	activity_type modificato/a.
1304	2014-11-11 14:18:48.759+01	4	11	596	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (6.5h)	2	activity_type modificato/a.
1305	2014-11-11 15:25:12.868+01	7	10	40	Dossier Politiche Coesione (DS9)	1	
1306	2014-11-11 17:37:03.839+01	14	11	597	analisi programmazione 2014-2020 (1.5h)	1	
1307	2014-11-11 18:28:38.016+01	3	11	598	Import xml: script xml2slug (7h)	1	
1308	2014-11-11 18:28:53.278+01	3	11	599	Mappatura xml (1h)	1	
1309	2014-11-11 19:24:11.949+01	13	16	39	contabilità (6.5h)	1	
1310	2014-11-12 14:08:07.626+01	5	11	600	Importazione sedute e votazioni (8h)	1	
1311	2014-11-12 14:08:27.206+01	5	11	601	Importazione sedute e votazioni da senato (8h)	1	
1312	2014-11-12 14:08:33.472+01	5	11	600	Importazione sedute e votazioni da camera (8h)	2	description modificato/a.
1313	2014-11-12 17:17:25.329+01	10	11	602	Definizione homepage (4h) (4h)	1	
1314	2014-11-12 17:17:57.413+01	10	11	603	Definizione homepage (3h)	1	
1315	2014-11-12 17:28:57.182+01	10	11	603	Definizione homepage (4h)	2	hours modificato/a.
1316	2014-11-12 18:14:25.696+01	3	11	604	Import xml: fix bug xml2slug (5h)	1	
1317	2014-11-12 18:14:48.994+01	3	11	605	Investigazione errori google bot (1h)	1	
1318	2014-11-12 18:15:11.468+01	3	11	606	Import xml: script import xml2pg (2h)	1	
1319	2014-11-12 19:38:38.165+01	4	11	582	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (6h)	2	activity_type modificato/a.
1320	2014-11-12 19:38:49.003+01	4	11	583	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (6h)	2	activity_type modificato/a.
1321	2014-11-12 19:38:57.661+01	4	11	584	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (7h)	2	activity_type modificato/a.
1322	2014-11-12 19:39:05.08+01	4	11	585	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (7h)	2	activity_type modificato/a.
1323	2014-11-12 19:39:13.576+01	4	11	596	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (6.5h)	2	activity_type modificato/a.
1324	2014-11-12 19:39:48.759+01	4	11	607	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (6.5h)	1	
1325	2014-11-12 19:40:02.876+01	4	11	608	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (7h)	1	
1326	2014-11-13 14:52:25.586+01	3	11	609	Import xml: ramo cassa/ somma funzioni (4h)	1	
1327	2014-11-14 10:51:39.148+01	8	11	610	coordinamento (5h)	1	
1328	2014-11-14 10:52:17.488+01	8	11	611	riunione depp (2h)	1	
1329	2014-11-14 10:52:48.802+01	8	11	612	coordinamento (8h)	1	
1330	2014-11-14 10:53:26.596+01	8	11	613	Parl EU (5h)	1	
1331	2014-11-14 10:54:24.831+01	8	11	614	Import xml (4h)	1	
1332	2014-11-14 10:55:02.358+01	8	11	615	coordinamento (4h)	1	
1333	2014-11-14 10:55:26.707+01	8	11	616	Parl EU (4h)	1	
1334	2014-11-14 14:04:44.854+01	10	11	617	Impaginazione EBook ITA (4h)	1	
1335	2014-11-14 14:05:14.764+01	10	11	618	Impaginazione EBook ITA e ENG (4h)	1	
1336	2014-11-14 15:10:21.003+01	2	16	40	Sviluppo prime tre regole (con rifattorizzazione per ottimizzare sviluppo regole successive) (13h)	1	
1337	2014-11-14 15:10:58.188+01	2	16	41	Attività varie e generali (4h)	1	
1338	2014-11-14 15:11:53.051+01	2	11	619	Estrazione 2 dataset BILTCO in Lait (6h)	1	
1339	2014-11-14 15:15:47.541+01	2	15	1	Riunione di produzione	2	recurrences modificato/a.
1340	2014-11-14 18:37:55.801+01	3	11	620	Import xml: ramo cassa / somma funzioni (4h)	1	
1341	2014-11-14 19:07:56.928+01	4	11	621	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (7.5h)	1	
1342	2014-11-14 19:08:09.924+01	4	11	622	Analisi CSV, creazione modello dei dati e sviluppo procedura di import (6h)	1	
1343	2014-11-14 19:24:00.642+01	13	16	42	contabilità (6.5h)	1	
1344	2014-11-15 16:41:50.221+01	3	11	623	Import xml: bug fix rami fittizi (2h)	1	
1345	2014-11-17 13:05:03.577+01	5	11	624	Implementazione updater (8h)	1	
1346	2014-11-17 13:05:22.222+01	5	11	625	Implementazione updater (4h)	1	
1347	2014-11-17 13:05:36.833+01	5	11	626	Implementazione updater (4h)	1	
1348	2014-11-17 16:24:27.644+01	7	3	15	Tiziana	1	
1349	2014-11-17 16:24:49.501+01	7	3	15	Tiziana	2	groups modificato/a.
1350	2014-11-17 16:25:13.961+01	7	3	15	Tiziana	2	first_name, last_name e email modificato/a.
1351	2014-11-17 16:25:31.558+01	7	3	15	tTiziana	2	username e is_staff modificato/a.
1352	2014-11-17 16:26:03.2+01	7	3	15	tiziana	2	username modificato/a.
1353	2014-11-17 16:29:12.49+01	7	14	16	tiziana	1	
1354	2014-11-17 16:29:30.096+01	7	10	8	Open Parlamento (OPP)	2	workers modificato/a.
1355	2014-11-17 16:30:42.418+01	15	11	627	Verifica iter ddl (6h)	1	
1356	2014-11-17 17:23:33.37+01	14	11	628	Inizio lavoro dossier (creazione indice + prime tabelle) (6h)	1	
1357	2014-11-17 18:13:52.302+01	3	11	629	Import xml: inserimento nel bilancio voci non mappate (somme) (6h)	1	
1358	2014-11-17 18:14:12.402+01	3	11	630	Import xml: inserimento nel bilancio voci non mappate (somme) (2h)	1	
1359	2014-11-17 18:17:23.994+01	8	10	41	Rapporto competitività Comuni (RCC)	1	
1360	2014-11-17 18:18:22.687+01	8	11	631	Riunione depp (2h)	1	
1361	2014-11-17 18:19:05.183+01	8	11	632	coordinamento (2h)	1	
1362	2014-11-17 18:19:42.343+01	8	11	633	coordinamento (3h)	1	
1363	2014-11-17 19:47:35.241+01	4	11	634	\tAnalisi CSV, creazione modello dei dati e sviluppo procedura di import (7h)	1	
1364	2014-11-18 15:08:02.542+01	10	11	635	Definizione pagine Ricerca e Aggregazioni (4h)	1	
1365	2014-11-18 15:09:27.2+01	10	11	636	Definizione pagine Pagamento e FAQ, nuovi colori (4h)	1	
1366	2014-11-18 17:45:48.77+01	8	11	637	debugging (2h)	1	
1367	2014-11-18 17:46:16.554+01	8	11	638	coordinamento (6h)	1	
1368	2014-11-18 19:13:53.171+01	4	11	639	Sviluppo scheletro navigazione (6h)	1	
1369	2014-11-19 10:56:58.312+01	14	11	640	elaborazione tabelle e raccolta dati (6h)	1	
1370	2014-11-19 10:59:15.528+01	15	11	627	Verifica iter ddl (4h)	2	hours e activity_date modificato/a.
1371	2014-11-19 11:00:13.508+01	7	10	39	Verifica congruità dati OP (OPV)	2	name, description e workers modificato/a.
1372	2014-11-19 11:00:42.994+01	15	11	641	Verifica iter ddl (4h)	1	
1373	2014-11-19 11:01:26.868+01	15	11	641	Verifica iter ddl (6h)	2	hours e activity_date modificato/a.
1374	2014-11-19 12:48:24.761+01	10	11	642	Revisione Epub (1h)	1	
1375	2014-11-19 15:51:01.828+01	10	11	643	Locandina (3h)	1	
1376	2014-11-19 17:32:28.686+01	5	11	644	Realizzazione command line interface (8h)	1	
1377	2014-11-19 17:32:46.612+01	5	11	645	Realizzazione command line interface (5h)	1	
1378	2014-11-19 17:33:24.926+01	5	11	646	Import correzioni DCGS dei CRSID (5h)	1	
1379	2014-11-19 18:01:07.336+01	14	11	647	Fine tabelle, e prima grafici per prima consegna (6h)	1	
1380	2014-11-19 18:01:28.588+01	14	11	647	Fine tabelle, e prima grafici per prima consegna (4h)	2	hours modificato/a.
1381	2014-11-19 18:03:44.649+01	15	11	648	Verifica amministrazioni comunali (6h)	1	
1382	2014-11-19 18:04:27.688+01	15	11	648	Verifica amministrazioni comunali (5h)	2	hours modificato/a.
1383	2014-11-19 18:17:59.059+01	3	11	649	Debug: somme funzioni (4h)	1	
1384	2014-11-19 18:18:35.791+01	3	11	650	Nuova tabella per tracciamento import xml (2h)	1	
1385	2014-11-19 18:18:58.413+01	3	11	651	Analisi errori bot (motori di ricerca) (2h)	1	
1386	2014-11-20 12:41:26.055+01	8	11	652	coordinamento (5h)	1	
1387	2014-11-20 12:42:25.507+01	8	11	653	Redazione lezioni (2h)	1	
1388	2014-11-20 12:43:17.458+01	8	11	654	OGP (2h)	1	
1389	2014-11-20 12:44:21.904+01	8	11	655	coordinamento (4h)	1	
1390	2014-11-20 12:45:06.798+01	8	11	656	incontro in Lait (3h)	1	
1391	2014-11-20 14:21:04.362+01	10	11	642	Revisione Epub (1h)	2	Nessun campo modificato.
1392	2014-11-20 14:21:27.773+01	10	11	657	Revisione Epub (3h)	1	
1393	2014-11-20 14:21:41.616+01	10	11	658	Locandina (1h)	1	
1394	2014-11-20 17:27:20.549+01	14	11	659	Tabelle aggiuntive da opencoesione (3h)	1	
1395	2014-11-20 18:39:33.553+01	3	11	660	Risoluzione bug voci competenza (2h)	1	
1396	2014-11-20 18:40:01.415+01	3	11	661	Call giangiulio (1h)	1	
1397	2014-11-20 18:40:20.003+01	3	11	662	Debugging x bot (1h)	1	
1398	2014-11-20 18:40:44.453+01	3	11	663	Debug valori funzioni (2h)	1	
1399	2014-11-20 18:41:11.483+01	3	11	664	Debug api google url shortener (2h)	1	
1400	2014-11-20 19:11:03.984+01	4	11	665	Sviluppo scheletro navigazione (6.5h)	1	
1401	2014-11-20 19:11:44.659+01	4	11	666	Sviluppo scheletro navigazione (6.5h)	1	
1402	2014-11-21 17:19:14.57+01	15	11	667	Verifica DDL unificati (2h)	1	
1403	2014-11-21 17:21:17.677+01	15	11	668	Verifica amministrazioni comunali (4h)	1	
1404	2014-11-21 17:22:00.776+01	15	11	669	Verifica amministrazioni comunali (6h)	1	
1405	2014-11-21 19:16:05.07+01	4	11	670	Sviluppo scheletro navigazione (6h)	1	
1406	2014-11-24 11:14:56.728+01	3	11	671	Correzione somme funzioni (3h)	1	
1407	2014-11-24 14:46:30.856+01	10	11	672	Locandina (2h)	1	
1408	2014-11-24 18:06:39.289+01	3	11	673	Somma funzioni, interventi non corretta (8h)	1	
1409	2014-11-24 19:43:42.016+01	4	11	674	Sviluppo scheletro navigazione (7.5h)	1	
1410	2014-11-25 16:40:35.491+01	14	11	675	realizzazione grafici per repubblica (6h)	1	
1411	2014-11-25 18:13:05.449+01	3	11	676	Debug import xml: somma non corretta (6h)	1	
1412	2014-11-25 18:13:31.554+01	3	11	677	Aggiunta flag bilancio importato xml (1h)	1	
1413	2014-11-25 18:13:47.571+01	3	11	678	Gestione errore server staging (1h)	1	
1414	2014-11-26 16:43:26.237+01	10	11	679	Verifica html mr. Wolf Comune e Generale mobile (4h)	1	
1415	2014-11-26 16:56:47.156+01	14	11	680	bozza intro per repubblica (1h)	1	
1416	2014-11-26 18:01:35.791+01	3	11	681	Cambio arco temporale applicazione (3h)	1	
1417	2014-11-26 18:01:50.889+01	3	11	682	Call giangiulio (1h)	1	
1418	2014-11-26 18:03:40.579+01	3	11	683	Implementazione nuovo arco temporale applicazione (2h)	1	
1419	2014-11-26 18:04:11.96+01	3	11	681	Cambio arco temporale applicazione (5h)	2	hours modificato/a.
1420	2014-11-26 19:38:54.2+01	4	11	684	Sviluppo scheletro navigazione (6.5h)	1	
1421	2014-11-26 19:39:23.648+01	4	11	685	Sviluppo scheletro navigazione (7h)	1	
1422	2014-11-27 11:32:34.891+01	10	11	686	Verifica html mr. Wolf Comune e Generale mobile (1h)	1	
1423	2014-11-27 14:17:00.874+01	10	11	687	Definizione pagina Soggetto e stili (3h)	1	
1424	2014-11-27 18:40:20.711+01	3	11	688	Call giangiulio template mobile (1h)	1	
1425	2014-11-27 18:40:56.745+01	3	11	689	Sistema automatizzato per arco temporale (3h)	1	
1426	2014-11-27 18:41:47.141+01	3	11	690	ottimizzazione su ultimo bilancio considerato (3h)	1	
1427	2014-11-27 18:42:19.487+01	3	11	691	Strumenti project mng (1h)	1	
1428	2014-11-28 07:03:07.913+01	8	11	692	riunione settimanale (2h)	1	
1429	2014-11-28 07:03:53.1+01	8	11	693	coordinamento (6h)	1	
1430	2014-11-28 07:04:46.806+01	8	11	694	conferenza (8h)	1	
1431	2014-11-28 07:07:12.975+01	8	11	695	versione responsive (4h)	1	
1432	2014-11-28 07:10:36.923+01	8	11	696	offerte (4h)	1	
1433	2014-11-28 07:11:15.596+01	8	11	697	conferenza (4h)	1	
1434	2014-11-28 07:11:42.923+01	8	11	698	coordinamento (4h)	1	
1435	2014-11-28 07:12:33.447+01	8	11	699	incontro (2h)	1	
1436	2014-11-28 07:13:36.491+01	8	11	700	modulo formazione (3h)	1	
1437	2014-11-28 07:14:23.143+01	8	11	701	incontro (3h)	1	
1438	2014-11-28 15:58:54.476+01	13	16	43	contabilità (6.5h)	1	
1439	2014-11-28 17:27:45.971+01	5	11	702	Test import dati da camera e senato (8h)	1	
1440	2014-11-28 17:28:07.842+01	5	11	703	Test import dati da camera e senato (8h)	1	
1441	2014-11-28 17:28:39.022+01	5	11	704	Aggiornamento CRSID (8h)	1	
1442	2014-11-28 17:30:30.853+01	5	11	705	Script aggiornamento titoli e deploy in staging (10h)	1	
1443	2014-11-28 17:31:30.792+01	5	11	706	Analisi delle funzionalità e dei bug proritari (6h)	1	
1444	2014-11-28 17:31:38.915+01	5	11	706	Analisi delle funzionalità e dei bug proritari (3h)	2	hours modificato/a.
1445	2014-11-28 17:32:05.161+01	5	11	646	Analisi e realizzazione dello script per cambi di CRSID (5h)	2	description modificato/a.
1446	2014-11-28 18:20:42.246+01	3	11	707	Template mobile (2h)	1	
1447	2014-11-28 18:21:27.039+01	3	11	708	Ottimizzazione codice ultimo bilancio considerato (4h)	1	
1448	2014-11-28 18:22:49.001+01	3	11	709	Ottimizzazione codice ultimo bilancio considerato (2h)	1	
1449	2014-11-28 18:33:06.302+01	3	11	707	Template mobile (1h)	2	hours modificato/a.
1450	2014-11-28 18:33:20.108+01	3	11	709	Ottimizzazione codice ultimo bilancio considerato (1h)	2	hours modificato/a.
1451	2014-11-28 18:33:51.604+01	3	11	710	Indicizzazione blog (2h)	1	
1452	2014-12-01 10:39:52.57+01	10	11	711	Verifica html mr. Wolf Comune e Generale mobile (5h)	1	
1453	2014-12-01 12:53:22.411+01	5	11	712	Analisi pre-release (2h)	1	
1454	2014-12-01 12:54:21.637+01	5	11	713	Correzione bugs (4h)	1	
1455	2014-12-01 12:57:18.369+01	15	11	714	Verifica congruità dati  (6h)	1	
1456	2014-12-01 12:58:07.208+01	15	11	714	Verifica amministrazioni comunali (6h)	2	project e description modificato/a.
1457	2014-12-01 13:00:10.579+01	15	11	715	Ricerca ddl  (1h)	1	
1458	2014-12-01 13:01:00.705+01	15	11	716	Verifica amministrazioni comunali (5h)	1	
1459	2014-12-01 13:01:17.178+01	15	11	715	Ricerca ddl  (1h)	2	activity_date modificato/a.
1460	2014-12-01 13:02:15.87+01	15	11	717	Verifica amministrazioni comunali (6h)	1	
1461	2014-12-01 13:03:26.97+01	15	11	718	Verifica amministrazioni comunali (4h)	1	
1462	2014-12-01 13:57:17.266+01	10	11	719	Palette colori treemap (1.5h)	1	
1463	2014-12-01 13:57:45.325+01	10	11	720	Verifica parziale sito (1h)	1	
1464	2014-12-01 13:58:15.41+01	10	11	721	Verifica html mr. Wolf Comune e Generale tablet (1h)	1	
1465	2014-12-01 14:28:13.45+01	15	11	722	Indirizzario (2h)	1	
1466	2014-12-01 14:30:26.257+01	15	11	723	Indirizzario (6h)	1	
1467	2014-12-01 18:30:20.14+01	3	11	724	Update bilancio: nuova navigazione per bilanci mancanti (5h)	1	
1468	2014-12-01 18:30:29.365+01	3	11	725	Planning (1h)	1	
1469	2014-12-01 18:30:52.81+01	3	11	726	Bug fixing (1h)	1	
1470	2014-12-01 18:31:17.216+01	3	11	726	Bug fixing (2h)	2	hours modificato/a.
1471	2014-12-02 18:06:23.658+01	3	11	727	Debugging navigazione nuova Overview (1h)	1	
1472	2014-12-02 18:06:41.044+01	3	11	728	update import incarichi (2h)	1	
1473	2014-12-02 18:07:10.981+01	3	11	727	Debugging navigazione nuova Overview (3h)	2	hours modificato/a.
1474	2014-12-02 18:08:20.701+01	3	11	727	Debugging navigazione nuova Overview (4h)	2	hours modificato/a.
1475	2014-12-02 18:08:51.968+01	3	11	729	Feedback template mobile (2h)	1	
1476	2014-12-02 18:55:31.595+01	8	11	730	conferenza (5h)	1	
1477	2014-12-02 18:56:01.625+01	8	11	731	coordinamento (3h)	1	
1478	2014-12-02 18:56:43.849+01	8	11	732	coordinamento (8h)	1	
1479	2014-12-03 09:36:10.503+01	7	16	44	Piano editoriale e rapporti con il cliente (8h)	1	
1480	2014-12-03 09:36:46.03+01	7	16	45	Piano editoriale e rapporti con il cliente (8h)	1	
1481	2014-12-03 09:37:10.562+01	7	16	46	Piano editoriale e rapporti con il cliente (8h)	1	
1482	2014-12-03 09:38:47.704+01	7	16	47	indicazione priorità sviluppo (4h)	1	
1483	2014-12-03 09:39:41.191+01	7	16	48	call con Action Aid (2h)	1	
1484	2014-12-03 09:40:01.383+01	7	16	49	call con Action Aid (2h)	1	
1485	2014-12-03 10:08:11.018+01	15	11	718	Verifica amministrazioni comunali (4h)	2	project modificato/a.
1486	2014-12-03 10:08:42.973+01	15	11	717	Verifica amministrazioni comunali (6h)	2	project modificato/a.
1487	2014-12-03 10:09:09.714+01	15	11	716	Verifica amministrazioni comunali (5h)	2	project modificato/a.
1488	2014-12-03 10:09:32.703+01	15	11	714	Verifica amministrazioni comunali (6h)	2	project modificato/a.
1489	2014-12-03 10:10:02.426+01	15	11	669	Verifica amministrazioni comunali (6h)	2	project modificato/a.
1490	2014-12-03 10:10:29.696+01	15	11	668	Verifica amministrazioni comunali (4h)	2	project modificato/a.
1491	2014-12-03 10:10:47.554+01	15	11	648	Verifica amministrazioni comunali (5h)	2	project modificato/a.
1492	2014-12-03 18:01:06.735+01	3	11	733	Debug nuova pagina "bilancio mancante" (4h)	1	
1493	2014-12-03 18:02:22.572+01	3	11	734	Bug share link su classifiche (1h)	1	
1494	2014-12-03 18:02:43.829+01	3	11	735	Cambio costanti temporali OB (3h)	1	
1495	2014-12-03 19:26:59.107+01	13	16	50	contabilità (8h)	1	
1496	2014-12-04 16:20:56.438+01	8	11	736	coordinamento (6h)	1	
1497	2014-12-04 16:21:34.287+01	8	11	737	coordinamento (2h)	1	
1498	2014-12-04 16:21:56.109+01	8	11	738	coordinamento (8h)	1	
1499	2014-12-04 18:12:43.26+01	5	11	739	Refactoring import targets (8h)	1	
1500	2014-12-04 18:12:52.872+01	5	11	740	Refactoring import targets (8h)	1	
1501	2014-12-04 18:13:16.154+01	5	11	741	Gestione dei Supporters (8h)	1	
1502	2014-12-04 18:13:49.643+01	5	11	742	Refactoring invio email (6h)	1	
1503	2014-12-04 18:27:04.417+01	3	11	743	Template mobile (1h)	1	
1504	2014-12-04 18:27:29.91+01	3	11	744	Settaggi arco temporale applicazione (1h)	1	
1505	2014-12-04 18:27:54.796+01	3	11	745	Strumenti per organizzare il flusso di lavoro (1h)	1	
1506	2014-12-04 18:28:06.838+01	3	11	743	Template mobile (1h)	2	project modificato/a.
1507	2014-12-04 18:28:35.388+01	3	11	746	Cambio set temporali (2h)	1	
1508	2014-12-04 18:29:09.06+01	3	11	747	Debug css link accordion (2h)	1	
1509	2014-12-04 18:29:23.995+01	3	11	747	Debug css link accordion (3h)	2	hours modificato/a.
1510	2014-12-05 10:58:18.343+01	10	11	748	Verifica html mr. Wolf Comune e Generale tablet (2h)	1	
1511	2014-12-05 10:58:33.393+01	10	11	749	Verifica html mr. Wolf Comune e Generale tablet (3.5h)	1	
1512	2014-12-05 10:59:14.119+01	10	11	750	Verifica html mr. Wolf Comune e Generale tablet (2h)	1	
1513	2014-12-05 11:00:19.089+01	10	11	751	Verifica html mr. Wolf Comune e Generale tablet  (3h)	1	
1514	2014-12-05 17:34:46.491+01	15	11	752	Indirizzario (2.5h)	1	
1515	2014-12-05 17:35:38.361+01	15	11	753	Verifica amministrazioni comunali (3.5h)	1	
1516	2014-12-05 17:36:45.634+01	15	11	754	Indirizzario (2h)	1	
1517	2014-12-05 17:37:33.647+01	15	11	755	Aggiornamento province (3h)	1	
1518	2014-12-05 17:38:03.186+01	15	11	756	Aggiornamento province (5h)	1	
1519	2014-12-05 17:38:45.335+01	15	11	757	Verifica amministrazioni comunali (6h)	1	
1520	2014-12-05 17:39:24.078+01	15	11	758	Verifica voti (5h)	1	
1521	2014-12-05 18:39:22.261+01	3	11	759	Fix accordion (2h)	1	
1522	2014-12-05 18:40:04.104+01	3	11	760	Aggiornamento open data xml (5h)	1	
1523	2014-12-05 18:41:10.658+01	3	11	759	Fix accordion e navigazione (3h)	2	description e hours modificato/a.
1524	2014-12-05 19:01:25.332+01	4	11	761	Import nuovi dati (3h)	1	
1525	2014-12-05 19:02:15.475+01	4	11	762	Gestione nuovo campo "privacy" (4h)	1	
1526	2014-12-05 19:02:40.01+01	4	11	763	Gestione nuovo campo "privacy" (6.5h)	1	
1527	2014-12-05 19:02:57.236+01	4	11	762	Gestione nuovo campo "privacy" (3.5h)	2	hours modificato/a.
1528	2014-12-05 19:03:41.89+01	4	11	764	Gestione nuovo campo "privacy" e import nuovi dati (3h)	1	
1529	2014-12-05 19:03:55.723+01	4	11	763	Gestione nuovo campo "privacy" e import nuovi dati (6.5h)	2	description modificato/a.
1530	2014-12-05 19:14:04.266+01	13	16	51	contabilità (9h)	1	
1531	2014-12-09 18:42:37.619+01	3	11	765	Aggiornamento open data xml (4h)	1	
1532	2014-12-09 18:43:00.861+01	3	11	766	Aggiornamento Import couch (2h)	1	
1533	2014-12-09 18:43:17.177+01	3	11	767	Aggiornamento Import couch (2h)	1	
1534	2014-12-10 18:03:49.786+01	3	11	768	Aggiornamento e fix import couch2pg (5h)	1	
1535	2014-12-10 18:04:08.327+01	3	11	769	Aggiornamento procedura di import couch2pg (1h)	1	
1536	2014-12-10 18:04:35.582+01	3	11	770	Call con BIID (1h)	1	
1537	2014-12-10 18:05:28.177+01	3	11	769	Aggiornamento procedura di import couch2pg (2h)	2	hours modificato/a.
1538	2014-12-10 18:18:52.9+01	5	11	771	Correzione bugs e deploy staging/production (6h)	1	
1539	2014-12-10 18:19:12.88+01	5	11	772	Deploy in produzione (6h)	1	
1540	2014-12-11 18:10:25.945+01	3	11	773	Aggiornamento procedura di import couch2pg (7h)	1	
1541	2014-12-11 18:10:40.211+01	3	11	774	debug nuova procedura import (1h)	1	
1542	2014-12-12 18:04:05.083+01	3	11	775	Fix capoluoghi per indicators2csv (3h)	1	
1543	2014-12-12 18:04:38.725+01	3	11	776	Test e debug nuova procedura couch2pg (3h)	1	
1544	2014-12-12 18:06:03.046+01	3	11	777	Aggiunta flag bilancio xml nel template (2h)	1	
1545	2014-12-12 19:33:01.959+01	4	11	778	Import nuovi dati (6h)	1	
1546	2014-12-12 19:33:16.583+01	4	11	779	Import nuovi dati (2h)	1	
1547	2014-12-15 15:22:41.733+01	15	11	780	Verifica voti (3h)	1	
1548	2014-12-15 15:23:28.049+01	15	11	781	Inserimento voti (2h)	1	
1549	2014-12-15 15:25:03.022+01	15	11	782	Indirizzario (2h)	1	
1550	2014-12-15 15:25:43.097+01	15	11	783	Inserimento voti (2h)	1	
1551	2014-12-15 15:26:39.644+01	15	11	784	Inserimento voti (1h)	1	
1552	2014-12-15 15:29:07.321+01	15	11	785	Verifica province (2h)	1	
1553	2014-12-15 15:30:16.291+01	15	11	786	Inserimento voti (2h)	1	
1554	2014-12-15 17:03:24.136+01	7	10	42	Internazionale (In)	1	
1555	2014-12-15 17:06:56.603+01	15	11	787	Redazione contenuti (0.5h)	1	
1556	2014-12-15 17:07:43.893+01	15	11	788	Redazione contenuti (2h)	1	
1557	2014-12-15 17:08:46.523+01	15	11	789	Redazione contenuti (1h)	1	
1558	2014-12-15 18:18:29.695+01	3	11	790	Fix capoluoghi (1h)	1	
1559	2014-12-15 18:18:47.732+01	3	11	791	Aggiunta flag bilancio importato xml (4h)	1	
1560	2014-12-15 18:19:07.614+01	3	11	792	Riunione Vincenzo: strumenti per tracking (1h)	1	
1561	2014-12-15 18:19:38.877+01	3	11	790	Fix capoluoghi (2h)	2	hours modificato/a.
1562	2014-12-15 18:19:43.457+01	3	11	791	Aggiunta flag bilancio importato xml (5h)	2	hours modificato/a.
1563	2014-12-15 18:24:18.15+01	3	11	791	Aggiunta flag bilancio importato xml (4h)	2	hours modificato/a.
1564	2014-12-16 18:06:44.022+01	5	11	793	Debug produzione (6h)	1	
1565	2014-12-17 17:54:30.446+01	4	11	794	Modifiche import progetti CIPE (3h)	1	
1566	2014-12-17 17:56:04.994+01	4	11	795	Import nuovi dati (6h)	1	
1567	2014-12-17 17:56:18.184+01	5	11	796	Correzione bugs (8h)	1	
1568	2014-12-17 17:56:30.855+01	5	11	797	Correzione bugs (8h)	1	
1569	2014-12-17 17:56:37.127+01	4	11	798	Formazione Solr (1h)	1	
1570	2014-12-17 17:56:42.445+01	5	11	799	Correzione bugs (8h)	1	
1571	2014-12-17 18:42:52.872+01	3	11	800	Implementazione seconda immagine header (4h)	1	
1572	2014-12-17 18:43:57+01	3	11	801	Fix bilancio not found bug (4h)	1	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1702, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	site	sites	site
7	log entry	admin	logentry
8	migration history	south	migrationhistory
10	project	tracking	project
11	activity	tracking	activity
12	user object permission	guardian	userobjectpermission
13	group object permission	guardian	groupobjectpermission
14	Worker	tracking	worker
15	Recurring activity	tracking	recurringactivity
16	Weekly activity	tracking	weeklyactivity
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 16, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
06ybum4q3vlpyx5u6cpl83ovmq05sxp0	YjVlNmY3YTdlMjA4MzFjNWZjZGM4MzRiNGYzOTU1YTFkYjlkNmI4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9	2014-10-01 16:33:20.734+02
0abbpjvixqr9kboro3ap0a0soefm67aj	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-24 19:04:25.926+02
0e7wsnzxelsk7vn7bkhs1m1z5kbxvqwm	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-12-26 19:31:36.074+01
0tp2dh4lb76n32bx9crksyiv9auu39yb	MDhkNjA2MmFlYTFiYzVmMWUyNTM3ZDFlNDNiMjMwZjNlMTMwOWQ3YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=	2014-07-29 22:20:09.343+02
0v8nv474ehu7tc8dvqky8ho5bgk1zl8f	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-11-24 12:53:12.067+01
10lxw1e7rzm7bh462g99pexqeskzdcqy	NGVlMzI3ODY4MmUxN2MzZjZiOWY5NWZlYTA0NmNmNTU2YWM3NGU4NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-07-04 20:51:06.13+02
10yem9vtmmrsbdt899onossb6dfaedv0	YWUzNjM0YTRjZTg4YzgyZGRhOGZjNDg0OWE1MGI5MDM1YzdiMDEwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTN9	2014-10-15 20:04:06.75+02
1xo1sqk2c7novvwgyst2lymo92z3g83o	MDhkNjA2MmFlYTFiYzVmMWUyNTM3ZDFlNDNiMjMwZjNlMTMwOWQ3YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=	2014-11-24 18:46:51.634+01
2dqvc8zliv14qf4ttjzdxox3sbjjfuv4	MjdmMDZiYjJjYjBhMGRmZjFmODUyZmUxZGRiNzk1MTdmYWJkMWU4ODp7fQ==	2014-07-14 19:09:05.917+02
2hr2dp7z2xwl9w9fi9jvb5240vvn8afl	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-11-17 17:39:22.983+01
2z77ermxq5pnjqne9capybh1vi1we17e	YjVlNmY3YTdlMjA4MzFjNWZjZGM4MzRiNGYzOTU1YTFkYjlkNmI4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9	2014-11-16 18:07:49.729+01
2zsjl0nk3mpe56qt5sr9gkdx9wldcean	ZmYxMmE3OTJkNDYyNmNiMmQ3NWI2NTdjYTdlNDRjYWJkYzVjY2RiMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9	2014-12-18 17:36:24.451+01
32czjsl1c782jrk6gvenuevnson9dawy	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-23 19:15:51.216+02
3b95y81y5a2bpuro52hw1rw83humkf25	YjVlNmY3YTdlMjA4MzFjNWZjZGM4MzRiNGYzOTU1YTFkYjlkNmI4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9	2014-10-29 22:21:58.713+01
3cfilu32ho8d2t9oens5hmpvgrtbskkf	MDhkNjA2MmFlYTFiYzVmMWUyNTM3ZDFlNDNiMjMwZjNlMTMwOWQ3YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=	2014-07-17 17:39:36.692+02
3u1vioh8ukox4rzo61vgl1j0ci231uxu	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-08 12:48:34.539+02
456d038uqgihv88u9nrh1ikj24l9qads	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-07-30 18:05:55.706+02
4fczd1960ss97ow6mkswp4u9gz5641xc	MWY2ZTdiMmE2ZDBkOWQxZjE4ZTU5ZTU5Y2UzY2FhNzExMjA3MTZmZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTV9	2014-12-01 16:27:14.031+01
4m53qw9p3pz14b1cbbybn4sjdgpvy9el	MjdmMDZiYjJjYjBhMGRmZjFmODUyZmUxZGRiNzk1MTdmYWJkMWU4ODp7fQ==	2014-11-13 18:01:27.605+01
4sa7a8jgm791igi890lch8k0xfrmxzpz	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-10-27 13:26:46.959+01
4t68qqxlmagadn5l3ti6u2up8kueldzl	NWQ3NzY1Yzg3NzZhZDgzNjRlZGVkOGVlZGVmMTgxYTI5ZWFhMTkxYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-02 20:15:18.943+02
4tlaus70tkx79hht7ppjo7mtj5aeersl	MjdmMDZiYjJjYjBhMGRmZjFmODUyZmUxZGRiNzk1MTdmYWJkMWU4ODp7fQ==	2014-07-11 14:53:57.911+02
4vppbh1aaajh2kl76bpvevedyp16br5d	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-30 18:13:47.747+01
56stegy3vxk3eez6htvbjqn4ilfkcjcj	ZmYxMmE3OTJkNDYyNmNiMmQ3NWI2NTdjYTdlNDRjYWJkYzVjY2RiMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9	2014-09-25 11:37:33.818+02
5gq3vozs86nd4cqtnlwfyh708r4jg3d7	ODZmMTE0ZDY2YWMyNmJkY2M2ZTlhNzZmOWUzNjdjMjI3Y2JlZTQ1Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=	2014-09-15 15:49:52.344+02
5ic9w10jmmpgberq6dt51tnfugf3axi6	ZWFlZmM2Y2YzY2FmYTQ3NDBjMWFjN2I2ZjI3YzIyNzM2Yzk0MWY1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-09-23 17:09:55.734+02
5qas2sgceca9pqrmta6lzf0gqj7k7sgu	MjdmMDZiYjJjYjBhMGRmZjFmODUyZmUxZGRiNzk1MTdmYWJkMWU4ODp7fQ==	2014-11-13 18:01:55.235+01
5tczsd2tj26gmc3bs5t45r4ksll0z1e1	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-11-25 18:06:13.719+01
5w7bewjmyxsk7zx2090ea3m0upk5dv5m	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-09-12 18:02:42.154+02
5xweulznqeh7gv1sspcqyafxjxkyzxp3	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-11-24 19:31:22.491+01
64tdxomzrtdfg6wnc0f3jhssbwtsn8t5	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-10-10 18:21:18.431+02
6mf10g096kkpo45ksrjbq306zzuyegux	MjdmMDZiYjJjYjBhMGRmZjFmODUyZmUxZGRiNzk1MTdmYWJkMWU4ODp7fQ==	2014-11-13 18:02:14.965+01
6monozxb5e6c7sgfdn31lnodr74tf4b6	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-12-05 19:15:41.285+01
6qthy1m6irijcq7bdn400as4485v6hvz	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-23 17:52:53.399+02
6rvxo9407wqo83o6aoyhx4cewmg96rpo	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-03 19:29:02.228+02
6tk2llwokqed6imesumg6tyuhib2peos	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-10-27 13:31:28.136+01
6vi14qvzplvgjs6zoc5smihul0a52ack	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-12-31 17:53:15.736+01
9eun758hd9y8qmyh3sc5u3hn2yy017ot	YjVlNmY3YTdlMjA4MzFjNWZjZGM4MzRiNGYzOTU1YTFkYjlkNmI4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9	2014-09-17 11:13:06.38+02
9kxkqrh89p8zrgmwtquqcdc1d406c1x0	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-07-11 14:53:04.413+02
9tusv9on3esa5t9myi0dopmjot1yujwz	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-16 19:30:13.57+02
a2bobumpmu1kp3kfvdba6jxnbboopu9m	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-23 18:15:44.478+02
aa8ls9k85s592s5oxn864ovzt0u7cmnf	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-21 19:39:42.956+02
aoaixyi3zv3kwd3ru3a7kpzkj01cvsix	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-08-14 18:09:52.853+02
at1vlkkdebo6xtime204jf3nfwfdj9lz	NWQ3NzY1Yzg3NzZhZDgzNjRlZGVkOGVlZGVmMTgxYTI5ZWFhMTkxYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-01 19:23:50.582+02
b32mco4co0kp9mvb9t41rmiero1iwt6u	NzIyODg2ODNhMDMyZTlkMWY1MWUwMzgzOGE5MTI5YzY0ZWQ2ZWY0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=	2014-10-17 16:14:22.931+02
b883ixtvhv0p3kz43yd28mrn7g3zjqf1	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-11-10 18:02:20.238+01
bfpl7g22vrlh3mp2fqqgn1vqrdvi3cba	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-09-30 19:17:26.582+02
bfydtlctagnqki19dhyn6nvcvjdnlgwt	MjdmMDZiYjJjYjBhMGRmZjFmODUyZmUxZGRiNzk1MTdmYWJkMWU4ODp7fQ==	2014-11-13 17:59:33.037+01
byxnzduy3yemof0uk7vmspsc5g3dt0vb	MDhkNjA2MmFlYTFiYzVmMWUyNTM3ZDFlNDNiMjMwZjNlMTMwOWQ3YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=	2014-12-19 00:14:03.44+01
c69xsbpes70tfor57vibqux5dosbssdq	NWQ3NzY1Yzg3NzZhZDgzNjRlZGVkOGVlZGVmMTgxYTI5ZWFhMTkxYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2015-01-01 16:46:11.532+01
chqg5ouxn7lplbycuunvmtumlw6bkxmp	NWQ3NzY1Yzg3NzZhZDgzNjRlZGVkOGVlZGVmMTgxYTI5ZWFhMTkxYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-05 11:07:37.26+02
cyr8ms06ojyffyfie7vfmrueg8o238bo	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-12-22 18:59:57.709+01
d1w87k7bxm00q4lulm6l3ye33h371vlt	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-11-28 10:50:05.539+01
d8m21gjxeyc81d93wg2g6t3plyh1hh1c	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-03 13:38:23.797+02
dajbwanajyjjwh0thg0bz8d86bl7g9pa	ZWFlZmM2Y2YzY2FmYTQ3NDBjMWFjN2I2ZjI3YzIyNzM2Yzk0MWY1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-07-25 09:56:57.117+02
der8v51k82xavrrsi5closc32vjeu834	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-12-08 19:43:15.941+01
dmfro7cgru3gvs2kbu2iborhqyhkcg0j	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-10-24 18:28:17.443+02
dubq2z4apvuv5h3e6jp6btlxio1853ht	NzIyODg2ODNhMDMyZTlkMWY1MWUwMzgzOGE5MTI5YzY0ZWQ2ZWY0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=	2014-12-03 10:56:42.08+01
eb6rdl34hd62ghqpcpzyjsx08c4apqtc	YWUzNjM0YTRjZTg4YzgyZGRhOGZjNDg0OWE1MGI5MDM1YzdiMDEwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTN9	2014-11-25 19:23:01.42+01
ebd2b76p0erk7hqju4mi4i8yrm5tpy7n	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-12-01 19:47:04.549+01
ejgh730soi1j45er4y0j1uz98yoaiz90	MTcwMDMzNjNkNDk2ZmQwZjJiYTc4ZWNiYTI1YzBjNzc2NTM0MzJjZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-07-04 19:23:47.723+02
evryvrx5qrqqa8iw6uow0jzt0gcq7l3s	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-11-10 19:15:35.971+01
f7kue8wnlyfoueni87lqqrf89yw5eaap	MDhkNjA2MmFlYTFiYzVmMWUyNTM3ZDFlNDNiMjMwZjNlMTMwOWQ3YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=	2014-12-30 18:05:40.568+01
ffxsic2iowekm35pw5kw0nw9o7tyvp53	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-09-09 12:01:45.147+02
fgmqzlqguntplmh5cin36im03azf8ha2	MDhkNjA2MmFlYTFiYzVmMWUyNTM3ZDFlNDNiMjMwZjNlMTMwOWQ3YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=	2014-12-12 17:26:12.207+01
fku7kq6xurzmcup24fate6hk0pshead5	ZWFlZmM2Y2YzY2FmYTQ3NDBjMWFjN2I2ZjI3YzIyNzM2Yzk0MWY1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-07-10 20:03:26.122+02
fwf1fq52b25ubppky7m6ggyduj3lcz4m	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-12-23 18:42:02.457+01
gdojxckan7nwsi2yvb4lpzs46hyzvo0r	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-09-25 11:44:38.689+02
gdvosdg5733ktvi1qa0f3yy6ljmgjrll	NWQ3NzY1Yzg3NzZhZDgzNjRlZGVkOGVlZGVmMTgxYTI5ZWFhMTkxYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-10-01 19:17:12.017+02
gx7wy9sos9cwutne92kppveizl4t7v2p	ZmYxMmE3OTJkNDYyNmNiMmQ3NWI2NTdjYTdlNDRjYWJkYzVjY2RiMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9	2014-12-01 17:22:58.461+01
hap2j85ijb88dw7q8pggpfabdalp6w3o	NzIyODg2ODNhMDMyZTlkMWY1MWUwMzgzOGE5MTI5YzY0ZWQ2ZWY0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=	2014-10-31 15:29:34.285+01
heawmdumujlkycobbz92unp31lxs3ukn	YjVlNmY3YTdlMjA4MzFjNWZjZGM4MzRiNGYzOTU1YTFkYjlkNmI4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9	2014-10-30 14:53:19.716+01
hlk0l3152kv01piybxkmp8x8be9greub	MjdmMDZiYjJjYjBhMGRmZjFmODUyZmUxZGRiNzk1MTdmYWJkMWU4ODp7fQ==	2014-10-03 20:37:15.888+02
hrwejbnztpkamrsgpabfn0sccljkjzsz	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-10-12 23:54:42.585+02
hu0hvr285jeyfn9wwx872gwmpqk6hj2f	ODZmMTE0ZDY2YWMyNmJkY2M2ZTlhNzZmOWUzNjdjMjI3Y2JlZTQ1Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=	2014-11-03 09:33:38.433+01
hxn56zg1xfr25h9a7bcs69fm0txqnkr1	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-23 18:17:45.593+02
j1bjlqhn6cagwl2i78pbydfa7gz9sasu	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-14 19:32:13.596+02
jfilhe0edp3lf5ltowzaza365880n8ac	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-09-26 18:07:39.71+02
k0wrm6lj6kvvflrskcec2o1b345bk9dt	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-03 12:38:13.013+02
k82u6pwqsuvp1j66dosu2q2dd91jg5ut	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-12-19 19:00:34.756+01
kasp86cofi7emc6c2j5rfe9zpecbbqkw	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-11-28 19:07:18.257+01
kckr41bypx5ul4k5esdri52alxrz1lfr	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-10-21 23:16:44.712+02
ksb0v34l15ej1173yx8tp4ghou8pne3e	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-03 14:50:54.019+02
ksdijpx8hxstgh0rk0n1kvav7c43zf15	YjVlNmY3YTdlMjA4MzFjNWZjZGM4MzRiNGYzOTU1YTFkYjlkNmI4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9	2014-12-02 15:07:10.48+01
ksswn1rkm5snvhhawu8o2jbmujec926n	NWQ3NzY1Yzg3NzZhZDgzNjRlZGVkOGVlZGVmMTgxYTI5ZWFhMTkxYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-18 12:35:43.484+02
kt5h5ofvognomrif8dvx56jxwzf7a5l1	YjVlNmY3YTdlMjA4MzFjNWZjZGM4MzRiNGYzOTU1YTFkYjlkNmI4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9	2014-12-19 10:57:43.042+01
lld35kyz53nerpnc6t2988cmxc91yut7	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-12-04 19:10:19.683+01
m3iwbf8ue13klsbam818hw8btzb2b5z6	MWY2ZTdiMmE2ZDBkOWQxZjE4ZTU5ZTU5Y2UzY2FhNzExMjA3MTZmZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTV9	2014-12-03 10:58:23.141+01
mh6421edkao1pvoyzecgdejmb5yw0tul	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-11-28 10:49:54.216+01
mikcmebzf8atn5a7qr4b5lbutpjy0zch	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-08-18 18:11:31.776+02
mnhi24vz4qwsc1bkuqs783dmmwrj7w5i	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-11-24 18:59:07.609+01
n89huxsnsuxz8o8b5o7egs7gp12bfww6	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-11-21 19:39:30.473+01
np0vg1vxk0hke67h2evim632pbl5odh4	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-06 19:26:56.8+02
nvqqc94iy5j30ajq8p3rmltfher9p7hq	YWUzNjM0YTRjZTg4YzgyZGRhOGZjNDg0OWE1MGI5MDM1YzdiMDEwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTN9	2014-11-04 17:40:42.098+01
ox441l0uo8qh7o67v0lg7lm2qs15n3ac	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-11-12 08:54:12.391+01
p2pm5960dv5gqj0v8owp0bnsroidijij	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-09 19:27:07.919+02
p3klwtlcnzpniv05aor4wiek8xwpfcvg	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-11-26 19:38:14.514+01
q2rhilzojsug6unak5eg4ug61rccyppv	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-02 19:46:09.876+02
qbw38yoeb6ftjes8yxzoyy4wupgssehc	ODZmMTE0ZDY2YWMyNmJkY2M2ZTlhNzZmOWUzNjdjMjI3Y2JlZTQ1Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=	2014-10-19 11:44:06.392+02
qjyn9fguhj1ilvnkcqkg98qkv0p31wtc	YWUzNjM0YTRjZTg4YzgyZGRhOGZjNDg0OWE1MGI5MDM1YzdiMDEwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTN9	2014-12-12 15:57:29.07+01
qmcpvwh3ekr2xipsej3yr4khd43hmtba	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-11-25 14:17:36.508+01
qpnskbgom5wi8zkkcdgt3imlc2jkhdgp	YWUzNjM0YTRjZTg4YzgyZGRhOGZjNDg0OWE1MGI5MDM1YzdiMDEwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTN9	2014-09-23 18:55:13.181+02
r0mw7dkeu66ns1vf42zf1cqqmrq3puvh	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-07-17 12:23:43.558+02
raicp71xa4v4mvqcp8kjg9h1t263vjqh	MDhkNjA2MmFlYTFiYzVmMWUyNTM3ZDFlNDNiMjMwZjNlMTMwOWQ3YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=	2014-10-27 18:18:34.867+01
ri1uaby01wpvl84hh8wgplvoz7nx0zmj	NWQ3NzY1Yzg3NzZhZDgzNjRlZGVkOGVlZGVmMTgxYTI5ZWFhMTkxYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-09-22 14:15:22.498+02
s3f4t286yopi8ecqog7nehr6ltw7rang	NzIyODg2ODNhMDMyZTlkMWY1MWUwMzgzOGE5MTI5YzY0ZWQ2ZWY0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=	2014-12-29 17:02:01.224+01
sgfmphn0sl78wfionuinrp0mhqqlwxkn	ODZmMTE0ZDY2YWMyNmJkY2M2ZTlhNzZmOWUzNjdjMjI3Y2JlZTQ1Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OX0=	2014-11-17 20:47:37.61+01
sxi93m0ajq3cx5znlstwq1jea4jhr7kx	YWUzNjM0YTRjZTg4YzgyZGRhOGZjNDg0OWE1MGI5MDM1YzdiMDEwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTN9	2014-10-03 19:16:07.129+02
sxtqftrnxoa3tbohxwtdlfdo3ddhq1p3	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-12-02 19:13:13.461+01
t1m1etunut3e9hgbglayv3by1wa8ok04	NWQ3NzY1Yzg3NzZhZDgzNjRlZGVkOGVlZGVmMTgxYTI5ZWFhMTkxYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2015-01-01 15:34:32.918+01
t4witwkuvomdhb2lu8is1ar5f43bym27	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-08 19:34:08.81+02
t8fpi3elh8deo7ev0c7i5y093821bw5y	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-11-28 18:37:22.802+01
tb6ogaf1cmhp1yoalbmdl0ca5tzmqz47	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-12-16 18:54:09.038+01
tnwishe5exouxh3xhuy5qwg5kf9plpi4	ZmYxMmE3OTJkNDYyNmNiMmQ3NWI2NTdjYTdlNDRjYWJkYzVjY2RiMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9	2014-10-31 15:28:29.068+01
ty3xneu436nzfpp6agnnjle4ygkk2fwn	MjdmMDZiYjJjYjBhMGRmZjFmODUyZmUxZGRiNzk1MTdmYWJkMWU4ODp7fQ==	2014-09-15 12:49:58.741+02
u0gqoy2pqpnx5fzvzrp38gu9j8j8ev0c	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-11-24 18:25:35.515+01
vghsxgevf5pt791jwjydmbqnrjc3tkzj	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-12-09 18:12:24.108+01
vi9lckm8b6xc7wltd7z7r7damm1zc1qi	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2014-07-16 18:00:35.771+02
vqtdpjwlhsmlk8ug6rnqy2w9tlacpxqj	ZmYxMmE3OTJkNDYyNmNiMmQ3NWI2NTdjYTdlNDRjYWJkYzVjY2RiMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9	2014-10-16 17:55:31.54+02
vssm7gazeq8tu6gxi4hi41me4y6n610d	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-03 13:20:39.868+02
wka94ljramrk0dhxak5pqp9sdrm18d0v	YjVlNmY3YTdlMjA4MzFjNWZjZGM4MzRiNGYzOTU1YTFkYjlkNmI4ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9	2014-10-15 19:08:27.226+02
wv4uece4tp1osldc6f2cywx22b8v52ru	ZmYxMmE3OTJkNDYyNmNiMmQ3NWI2NTdjYTdlNDRjYWJkYzVjY2RiMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9	2014-11-17 12:38:32.747+01
x2phbe03yi0wuirpsxnx1yniu0susi3f	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2014-11-12 08:52:44.4+01
xwle9fcp6ledswv4wfave0ee2ewfl9a0	MDhkNjA2MmFlYTFiYzVmMWUyNTM3ZDFlNDNiMjMwZjNlMTMwOWQ3YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NX0=	2014-10-01 19:14:19.518+02
xx7u4irwg3p93u56fvsymz9nkstuwix8	NzIyODg2ODNhMDMyZTlkMWY1MWUwMzgzOGE5MTI5YzY0ZWQ2ZWY0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=	2014-11-17 17:48:09.795+01
z61ywx4dy66bhqzsgj7j33swmhx52nh9	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-09-29 19:17:34.309+02
z7w6sl6eyubwi0rz0jkhipxbaens6r1u	NjY1NmFjMTZiMzAxMThhMDJiMjE3MTIzYjc5NDQ2ZDgyNGU5ZWMxYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-07-10 23:23:16.56+02
z93w928vkuqgmzh1jonppehmc5blj80g	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-12-10 19:38:22.621+01
z9ew6c2nskx2xk4th5cbq4iaznvfp9ip	ZWFlZmM2Y2YzY2FmYTQ3NDBjMWFjN2I2ZjI3YzIyNzM2Yzk0MWY1ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-11-28 15:03:27.652+01
zcp06jez681fvlbix3xiwpp873d8b8et	MWY2ZTdiMmE2ZDBkOWQxZjE4ZTU5ZTU5Y2UzY2FhNzExMjA3MTZmZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTV9	2014-12-19 17:33:28.985+01
zk0nl1hykv44vxhd5zmdfyy3zmm0l4ev	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2014-10-01 19:24:17.242+02
w63np3aeeez4ehuju6z91ac5ko4kw3r6	ZmYxMmE3OTJkNDYyNmNiMmQ3NWI2NTdjYTdlNDRjYWJkYzVjY2RiMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9	2015-01-02 17:17:18.395469+01
e7avx5hxz4c6fqdo6nd74ush5f2clput	YWUzNjM0YTRjZTg4YzgyZGRhOGZjNDg0OWE1MGI5MDM1YzdiMDEwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTN9	2015-01-02 17:33:16.188464+01
p2vkkf578s69wrs9emiydgh300atl9mq	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-01-03 16:52:23.279265+01
2m7zz0pcimbkv8l0gtgt9uuab9nkj0l9	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2015-01-05 16:15:33.050267+01
cr8zdymymyq2q1iu9rmoow1rrlqyap6s	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2015-01-06 19:10:24.799708+01
gcbxmacvohwmfkdac1zsfjgf379o1olb	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2015-01-07 14:08:48.643293+01
0z9swq1o12qdwdbhyc7l4jj3d1g1emgy	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2015-01-12 14:57:49.828045+01
qvrff1u7sazw9sqkiah81x9ff28n3437	ZmYxMmE3OTJkNDYyNmNiMmQ3NWI2NTdjYTdlNDRjYWJkYzVjY2RiMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTR9	2015-01-19 12:16:44.085176+01
ud20olwhhwk5m7pz5wwu8l9cv5fvs8lz	NzM4YWVlNmJlMTliNmQ1ZmI2YTE5ZTYxMWMzZjQ1ZDg3NmY1ODJlZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6OH0=	2015-01-21 12:53:41.523275+01
e7r6p0k2n8t8gyjpy40gpevkamv9iisg	NzIyODg2ODNhMDMyZTlkMWY1MWUwMzgzOGE5MTI5YzY0ZWQ2ZWY0Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=	2015-01-21 13:00:10.508876+01
pf9sb5fy6rzfck45k565gm5dfzfc989j	YWUzNjM0YTRjZTg4YzgyZGRhOGZjNDg0OWE1MGI5MDM1YzdiMDEwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTN9	2015-01-21 16:40:14.504708+01
t8i5lyfrdtxwle3hu2lm16o49ozwofmt	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2015-01-22 20:32:20.182681+01
qpucn8vqm475sa8r15i4guo43sa81wn5	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2015-01-23 19:13:08.578656+01
4bohkffdo4hfhoy3me03zq6usbo0obtr	MWY2ZTdiMmE2ZDBkOWQxZjE4ZTU5ZTU5Y2UzY2FhNzExMjA3MTZmZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTV9	2015-01-26 10:34:33.442153+01
03wo1l5890a6enkm186mhzlk0od64bo2	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2015-01-26 16:33:56.272892+01
88aipqo72gcvsrhaf9dihguq6629a8o7	OGY2NDBmYmFkYWFlYjNkYjBkOWJiMWVlZTA1MjA1ZWQ1OTdhMTUzMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=	2015-01-27 19:29:03.488089+01
w5u6rq1hiq8a0hfr95fh9o6156p180n4	MGE0ZGU5M2Q0ODlmNDEyMDZmYzIwYTk3ZDI0ZTYyMjc5ODg1NmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6M30=	2015-01-29 18:05:41.820876+01
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: recurrence_date; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recurrence_date (id, recurrence_id, mode, dt) FROM stdin;
\.


--
-- Name: recurrence_date_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recurrence_date_id_seq', 1, false);


--
-- Data for Name: recurrence_param; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recurrence_param (id, rule_id, param, value, index) FROM stdin;
\.


--
-- Name: recurrence_param_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recurrence_param_id_seq', 1, false);


--
-- Data for Name: recurrence_recurrence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recurrence_recurrence (id, dtstart, dtend) FROM stdin;
\.


--
-- Name: recurrence_recurrence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recurrence_recurrence_id_seq', 1, false);


--
-- Data for Name: recurrence_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY recurrence_rule (id, recurrence_id, mode, freq, "interval", wkst, count, until) FROM stdin;
\.


--
-- Name: recurrence_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('recurrence_rule_id_seq', 1, false);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	django_extensions	0001_empty	2014-07-02 13:59:38.168+02
2	tracking	0001_initial	2014-07-03 06:58:10.85+02
3	tracking	0002_auto	2014-07-03 06:58:36.584+02
4	tracking	0003_auto__add_weeklyactivity	2014-09-04 18:46:42.318+02
5	tracking	0004_auto__chg_field_recurringactivity_end_date__chg_field_recurringactivit	2014-09-10 12:39:20.991+02
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 5, true);


--
-- Data for Name: tracking_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tracking_activity (id, project_id, activity_type, description, hours, worker_id, owner_id, activity_date) FROM stdin;
803	30	3	Integrazione template mobile	3.0	2	2	2014-12-18
802	5	1	Valutazione strumenti repository codice	2.0	2	2	2014-12-18
804	30	3	Disabilitare xml flag nel template	1.0	2	2	2014-12-18
805	30	1	Progettazione xml helper mixin	2.0	2	2	2014-12-18
806	42	5	Redazione contenuti	2.0	16	16	2014-12-15
807	6	4	Verifica province	2.0	16	16	2014-12-15
808	8	4	Inserimento voti	5.0	16	16	2014-12-16
809	8	4	Inserimento voti	6.0	16	16	2014-12-17
810	8	4	Inserimento voti	4.0	16	16	2014-12-18
811	8	4	Verifica voti	1.0	16	16	2014-12-18
812	8	4	Verifica voti	2.0	16	16	2014-12-19
813	8	4	Inserimento voti	1.0	16	16	2014-12-19
814	6	4	Verifica province	1.0	16	16	2014-12-19
815	2	9	Meeting messa online	1.0	2	2	2014-12-19
816	2	6	Stesura procedura deploy, gestione consegna del template	3.0	2	2	2014-12-19
817	30	3	Integrazione template mobile	2.0	2	2	2014-12-19
818	2	3	Risoluzione bug dns	2.0	2	2	2014-12-19
819	7	3	Widget e form per le associazioni	8.0	4	4	2014-12-22
820	7	3	Bug fixing	6.0	4	4	2014-12-18
712	7	1	Analisi pre-release	2.0	4	4	2014-11-28
821	1	3	Analisi Solr	6.0	3	3	2014-12-17
822	1	3	Nuova sezione su pagina OpenData	2.0	3	3	2014-12-22
823	1	3	Reintegro dati delibere CIPE per pagina Fonti di finanziamento	1.0	3	3	2014-12-22
824	30	9	Riunione comunicazione con Vic e Vinz	2.0	2	2	2014-12-22
825	30	3	Integrazione template mobile	3.0	2	2	2014-12-22
826	2	9	Gestione issue / organizzazione progetto	3.0	2	2	2014-12-22
827	19	3	Installazione e test Solr	4.0	3	3	2014-12-22
828	1	3	Gestione privacy_flag e modifiche su cache per i box 'Ultimi progetti conclusi'	4.0	3	3	2014-12-23
829	19	3	Impostazione ricerca	2.0	3	3	2014-12-23
830	30	3	Deploy online firenze	4.0	2	2	2014-12-23
831	33	9	Skype call con partner sui dati	2.0	2	2	2014-12-24
873	5	9	organizzazione	4.0	7	7	2015-01-05
874	45	2	progettazione	4.0	7	7	2015-01-05
832	30	3	Template mobile	3.0	2	2	2014-12-29
833	5	1	Organizzazione procedure: valutazione scrum, risposta email e proc. VNE Oparl	3.0	2	2	2014-12-29
834	30	3	Template mobile: pagine bilancio	5.0	2	2	2014-12-30
835	5	1	Analisi degli strumenti per archivio dei documenti	3.0	2	2	2014-12-30
837	5	9	Meeting strumenti con Vincenzo e Vittorio	1.0	2	2	2015-01-05
838	5	10	call Evernote	1.0	2	2	2015-01-05
840	5	9	Meeting Vincenzo Project management	1.0	2	2	2015-01-05
839	2	9	Meeting widget	2.0	2	2	2015-01-05
841	5	1	Stesura bozza documento di progetto e doc valutazione strumenti	3.0	2	2	2015-01-05
842	43	4	raccolta e aggiornamento dati da vecchio dossier	3.0	15	15	2014-12-19
843	43	5	raccolta dati sui discorsi	4.0	15	15	2014-12-29
844	43	5	raccolta dati discorsi	6.0	15	15	2014-12-30
845	43	5	organizzazione e stesura testi	2.0	15	15	2015-01-05
846	33	9	Meeting con Ettore pre-call	1.0	2	2	2015-01-07
847	5	9	Meeting Vittorio e Vinc	1.0	2	2	2015-01-07
848	30	9	Meeting Vittorio prev.2014	1.0	2	2	2015-01-07
850	5	1	Valutazione strumenti documentazione/ gantt	3.0	2	2	2015-01-07
849	30	3	Template mobile: confronti	2.0	2	2	2015-01-07
852	30	9	Meeting Giangiulio x template	1.0	2	2	2015-01-08
851	30	3	Template mobile: pagina comune e menu affix	6.0	2	2	2015-01-08
853	43	5	finito i testi	5.0	15	15	2015-01-08
856	30	9	Meeting Giangiulio x template	1.0	2	2	2015-01-09
857	30	3	Messa in prod. castiglione, template mobile	3.0	2	2	2015-01-09
854	33	0	Meeting danais	2.0	2	2	2015-01-09
858	19	3	Sviluppo motore di ricerca	5.0	3	3	2015-01-05
862	19	3	Sviluppo motore di ricerca	5.0	3	3	2015-01-08
860	19	3	Import e filtri criteri di pagamento	4.5	3	3	2015-01-07
864	44	5	Ricerca contenuti	6.0	16	16	2014-12-29
865	44	5	Ricerca contenuti	6.0	16	16	2014-12-30
866	44	5	Ricerca contenuti	6.0	16	16	2015-01-07
867	44	5	Ricerca contenuti	6.0	16	16	2015-01-08
868	44	5	Ricerca contenuti	6.0	16	16	2015-01-09
869	1	3	Modifiche in pagina 'Open data' e box in home e pagine interne	3.0	3	3	2015-01-12
870	5	9	Meeting Ettore procedure	2.0	2	2	2015-01-12
871	30	9	Meeting Giangiulio x template	1.0	2	2	2015-01-12
872	30	3	Template mobile: pagina comune, parti mancanti e bug	5.0	2	2	2015-01-12
875	5	6	gestione amministrativa	4.0	7	7	2015-01-07
876	45	2	progettazione	4.0	7	7	2015-01-07
877	5	6	Gestione amministrativa	8.0	7	7	2015-01-08
878	45	2	progettazione	8.0	7	7	2015-01-09
879	45	2	progettazione	8.0	7	7	2015-01-12
880	45	2	progettazione	5.0	7	7	2015-01-13
881	5	6	progettazione	3.0	7	7	2015-01-13
882	30	3	Risoluzione bug template mobile	6.0	2	2	2015-01-13
883	19	3	Sviluppo motore di ricerca	4.5	3	3	2015-01-12
884	1	3	Varie manutenzioni	6.0	3	3	2015-01-13
885	19	3	Modellazione nuovi dati	2.0	3	3	2015-01-13
887	10	3	Ripristino sito, era offline	1.0	2	2	2015-01-14
888	30	9	Call giangiulio	1.0	2	2	2015-01-14
889	5	10	Risoluzione connessione wifi con telecom italia	1.0	2	2	2015-01-14
886	30	3	Template mobile: bug fix	5.0	2	2	2015-01-14
890	43	4	Nuove tabelle: grandi elettori + discorsi	3.0	15	15	2015-01-14
892	12	5	Schedulare Openpolitix + Politico della Settimana	3.0	15	15	2015-01-15
894	45	5	traduzione testi bando	4.0	15	15	2015-01-13
893	45	6	traduzione testi bando	6.0	15	15	2015-01-12
895	45	5	traduzione e revisione testi bando	4.0	15	15	2015-01-14
896	12	5	Politico della Settimana 	3.0	15	15	2015-01-09
897	45	5	Riunione pianificazione - Vincenzo & Vittorio	1.0	15	15	2015-01-08
855	5	9	Meeting daniele f x strumenti	1.0	2	2	2015-01-09
861	19	3	Import e filtri criteri di pagamento	3.0	3	3	2015-01-08
859	19	3	Sviluppo motore di ricerca	3.0	3	3	2015-01-07
863	19	3	Sviluppo motore di ricerca	7.5	3	3	2015-01-09
891	43	5	Finiti testi per nuove tabelle + rilettura testi	3.0	15	15	2015-01-15
898	5	3	Lavoro su depp-tracking: installazione	2.0	2	2	2015-01-15
899	30	3	Bug fix template mobile	4.0	2	2	2015-01-15
900	2	4	Lavoro per preventivo 14 xml	2.0	2	2	2015-01-15
901	6	4	Import Ministero Interno	2.0	15	15	2015-01-16
902	12	5	Riservato	2.0	15	15	2015-01-16
654	13	10	OGP	2.0	7	7	2014-11-19
1	1	6	Rapporto lavorazioni svolte per il cliente	3.0	1	1	2014-06-20
2	1	9	Formazione Stefano su import dati	2.0	1	1	2014-06-25
3	1	4	Formazione su import dati	1.0	3	3	2014-06-27
4	1	4	Import progetti inattivi	4.0	3	3	2014-06-27
5	1	3	Aggiornamento indicatori ISTAT	2.0	1	1	2014-06-25
6	4	3	Messa online sito depp-tracking	3.0	1	1	2014-06-25
7	3	3	Controllo e omogeneizzazione traduzioni	6.0	4	1	2014-06-25
8	2	3	Sviluppo funzionalità e debugging	8.0	2	1	2014-06-25
9	1	3	Chiusura issues da #259 a #263	2.0	1	1	2014-06-25
10	2	3	Classifiche: parimerito #201	8.0	2	2	2014-06-27
11	2	1	Import nuovi quadri	2.0	2	2	2014-07-02
12	2	3	Run couchdb script per titoli / voci	4.0	2	2	2014-07-02
13	3	3	Context data import. Issue #4.	6.0	1	1	2014-06-26
14	1	9	Formazione StefanoB su import dati	2.0	1	1	2014-06-26
15	1	3	Import progetti inattivi	6.0	3	3	2014-06-26
16	3	3	Motore di ricerca. Elastic, poi Solr.	8.0	4	1	2014-06-26
17	4	3	Aggiunta dettagli worker	2.0	1	1	2014-06-27
18	2	3	Couch script per facilitare normalizzazione titoli/voci	8.0	2	2	2014-06-26
19	3	3	Sviluppo Notizie, Pagine statiche e FAQ, (multilingua e integrazione). Issue #10, #11 e #23)	20.0	1	1	2014-06-30
20	2	3	Normalizzazione titoli di bilancio	6.0	2	2	2014-06-30
21	2	9	Riunione per normalizzazione titoli	2.0	2	2	2014-06-30
22	1	3	Pagine aggregate progetti	6.0	3	3	2014-06-30
23	3	3	Implementazione dei template e delle viste per le codelists, i progetti e la homepage	24.0	4	4	2014-06-30
24	3	3	Implementazione delle mappe	30.0	4	4	2014-06-30
25	5	0	Riunione di produzione	3.5	1	1	2014-07-01
26	1	3	Refactoring filtro su programma e implementazione filtro su gruppo programmi	4.0	1	1	2014-07-01
27	2	1	Meeting gestione scadenze progettuali	1.0	2	2	2014-07-01
28	2	3	Couchdb: aggiornamento gdoc normalizzazione Voci e bug fix	3.0	2	2	2014-07-01
29	4	3	Aggiunte attività ricorrenti al Tracking	4.0	1	1	2014-07-02
30	2	1	Import bilancio xml	2.0	2	2	2014-07-02
31	2	3	Integrazione nuovo Js menu gerarchico	2.0	2	2	2014-07-02
32	1	3	Pagine aggregate progetti	6.0	3	3	2014-07-01
33	1	\N	Pagine aggregate progetti	7.0	3	3	2014-07-02
34	1	10	Formazione Stefano su Solr	2.0	1	1	2014-07-02
35	1	1	Nuova procedura import dati	2.0	1	1	2014-07-03
36	5	9	Skype con Alessio Dragoni: Specifiche dettagli architetturali per OpenData Lazio	0.5	1	1	2014-07-03
37	4	3	API per l'applicazione di Tracking	3.0	1	1	2014-07-03
38	2	1	Normalizzazione voci bilancio: gdocs	3.0	2	2	2014-07-03
39	2	6	Github: nuove milestone e issues. Update gantt progetto	1.0	2	2	2014-07-03
40	2	4	Import manuale codici bilancio	2.0	2	2	2014-07-03
41	3	3	Produzione csv doppioni anno per anno	2.0	4	4	2014-07-03
42	2	4	Import manuale codici bilancio	4.0	2	2	2014-07-04
43	2	1	Analisi nuovo import XML	2.0	2	2	2014-07-04
44	2	3	Integrazione menu gerarchico	2.0	2	2	2014-07-04
45	3	3	Realizzazione tabs con grafici	6.0	4	4	2014-07-04
46	1	4	Import dati	3.0	1	1	2014-07-04
47	1	0	Incontro pianificazione lavori	2.5	1	1	2014-07-04
48	5	6	Inserimento requisiti OpenCoesione in Gantt e Issue	2.0	1	1	2014-07-04
49	2	1	Import Bilancio xml	4.0	2	2	2014-07-07
50	2	1	Normalizzazione voci bilancio: gdocs	3.0	2	2	2014-07-07
51	2	9	Normalizzazione voci bilancio	1.0	2	2	2014-07-07
52	3	3	Tabs della homepage	6.0	4	4	2014-07-07
53	2	4	Import manuale codici bilancio	1.0	2	2	2014-07-08
54	2	3	Import menu gerarchico - mail recap con Alessandro	2.0	2	2	2014-07-08
55	2	1	Analisi nuovo import XML	1.0	2	2	2014-07-08
56	2	9	Meeting refine grafico	1.0	2	2	2014-07-09
57	5	10	Meeting professore universitario	2.0	2	2	2014-07-09
58	2	1	Analisi nuovo import XML	4.0	2	2	2014-07-09
59	2	3	Integrazione menu gerarchico	2.0	2	2	2014-07-10
60	2	9	Meeting refine grafico	1.0	2	2	2014-07-10
61	2	3	Analisi nuovo import XML	5.0	2	2	2014-07-10
62	1	4	Import dati di Giugno	8.0	1	1	2014-07-07
63	1	4	Import dati di Giugno	4.0	1	1	2014-07-08
64	1	10	Formazione Stefano su Mappe	3.0	1	1	2014-07-09
65	1	0	Skype call	2.0	1	1	2014-07-09
66	1	3	Hotfixes (#278, #279)	4.0	1	1	2014-07-08
67	1	3	Sviluppo flatpages e file browser	4.0	1	1	2014-07-09
68	1	3	Sviluppo flatpages e file browser	6.0	1	1	2014-07-10
69	1	10	Documentazione flat pages e file browser	2.0	1	1	2014-07-10
70	2	9	Refine grafico con Benedetta	2.0	2	2	2014-07-11
71	2	9	Meeting con Vittorio: modifiche all'albero	2.0	2	2	2014-07-11
72	2	1	Import bilancio xml	4.0	2	2	2014-07-11
73	2	9	Refine grafico con Benedetta	1.0	2	2	2014-07-14
74	2	9	Modifiche albero con Vittorio	2.0	2	2	2014-07-14
75	2	3	Integrazione nuovo Js menu gerarchico	1.0	2	2	2014-07-14
76	2	3	Sviluppo xml2slug	4.0	2	2	2014-07-14
77	2	9	Modifiche albero con Vittorio	2.0	2	2	2014-07-15
78	2	3	Import bilancio xml	4.0	2	2	2014-07-15
79	2	10	Documentation on xml import	2.0	2	2	2014-07-15
80	3	3	Solr e indicizzazione multilinguaggio	6.0	4	4	2014-07-08
81	3	3	Refining con ettore	6.0	4	4	2014-07-09
82	3	3	refining	6.0	4	4	2014-07-10
83	3	3	Responsive per Mobile/Tablet 	3.0	4	4	2014-07-12
84	3	3	Deploy and fabric	6.0	4	4	2014-07-11
85	5	9	Riunione produzione	4.0	1	1	2014-07-15
86	1	3	Hotfix  sistema gestione flatpages e files	4.0	1	1	2014-07-15
87	1	3	Hotfix pre-deploy nuovi dati	8.0	1	1	2014-07-14
88	1	3	Hotfix pre-deploy nuovi dati	8.0	1	1	2014-07-11
89	2	3	Modifiche struttura albero bilancio	6.0	2	2	2014-07-16
90	2	10	Documentazione import xml	2.0	2	2	2014-07-16
91	1	3	Hotfix sistema gestione flatpages e files	8.0	1	1	2014-07-16
92	2	3	Semplificazione nuove voci bilancio	6.0	2	2	2014-07-17
93	2	10	Documentazione import nuovi quadri	2.0	2	2	2014-07-17
94	2	3	Normalizzazione voci bilancio: gdocs	5.0	2	2	2014-07-21
95	5	9	Gestione aggiornamento sito DEPP	2.0	2	2	2014-07-21
96	2	3	Import bilancio xml Dati di contesto 	2.0	2	2	2014-07-22
97	2	3	Update albero bilancio	1.0	2	2	2014-07-22
98	2	9	Meeting semplificazione bilancio, Open siope	2.0	2	2	2014-07-22
99	2	3	Scripting per normalizzazione couch	3.0	2	2	2014-07-22
100	3	3	Admin per Projects e Activities	3.0	4	4	2014-07-22
101	5	9	Plenaria	3.0	2	2	2014-07-23
102	2	9	Semplificazione nuove voci bilancio	3.0	2	2	2014-07-23
103	2	1	Import parametri deficitari	2.0	2	2	2014-07-23
104	2	9	Update semplificazione	1.0	2	2	2014-07-24
105	2	1	Analisi nuova semplificazione	5.0	2	2	2014-07-24
106	2	4	Correzioni gdoc semplificazione 	2.0	2	2	2014-07-24
107	2	4	Correzioni gdoc semplificazione	4.0	2	2	2014-07-25
108	2	3	Correzione script merge keys	3.0	2	2	2014-07-25
109	2	3	Update semplificazione	1.0	2	2	2014-07-25
110	2	4	Correzioni gdoc semplificazione nuove voci bilancio	4.0	2	2	2014-07-28
111	2	3	Semplificazione nuove voci bilancio	4.0	2	2	2014-07-28
112	2	3	Semplificazione nuove voci bilancio	8.0	2	2	2014-07-29
113	2	3	Check semplificazione bilancio	3.0	2	2	2014-07-30
114	2	3	Sviluppo nuovi indicatori	5.0	2	2	2014-07-30
115	2	3	Sviluppo nuovi indicatori	2.0	2	2	2014-07-31
116	2	3	Import nuovi quadri	6.0	2	2	2014-07-31
117	2	3	Export indicatori evabeta	5.0	2	2	2014-08-04
118	2	4	Export indicatori evabeta	3.0	2	2	2014-08-04
119	2	9	Pianificazione con Vittorio	1.0	2	2	2014-08-06
120	2	3	Inserimenti Avanzo/disavanzo in accordion e widget	6.0	2	2	2014-08-06
121	2	9	Pianificazione con Vittorio	2.0	2	2	2014-08-07
122	2	3	Adattamento widget a nuova struttura albero	4.0	2	2	2014-08-07
123	2	6	Planning e issue github	2.0	2	2	2014-08-08
124	2	3	Risoluzione issue dati + ri-semplificazione	6.0	2	2	2014-08-08
125	2	4	Import dati normalizzati in Postgres	2.0	2	2	2014-08-25
126	2	3	Aggiornamento grafica del sito	4.0	2	2	2014-08-25
127	2	9	Issue widget visup	1.0	2	2	2014-08-29
128	2	3	Integrazione widget visup	2.0	2	2	2014-08-29
129	2	3	Nuovo menu navigazione	5.0	2	2	2014-08-29
130	2	9	Meeting task e chiamata con Giangiulio	1.0	2	2	2014-09-01
131	2	3	Nuovo menu navigazione, ristrutturazione viste Bilancio	3.0	2	2	2014-09-01
132	2	1	Nuova struttura pagina bilancio 	4.0	2	2	2014-09-01
133	2	3	Nuovo menu navigazione, ristrutturazione viste bilancio	6.0	2	2	2014-09-02
134	2	7	Revisione Progetto Comuni v00	5.0	9	9	2014-09-01
135	2	3	Osservazioni Widget Selettore anni e Timeline sindaci	4.0	9	9	2014-09-02
136	2	7	Definizione Progetto Comuni v01	5.0	9	9	2014-09-03
137	2	7	Rilascio Templates v04 a mrWolf	1.0	9	9	2014-09-02
138	2	6	versione mobile	1.0	7	7	2014-09-03
139	2	3	Nuovo menu navigazione, ristrutturazione viste bilancio	8.0	2	2	2014-09-03
140	6	4	controllo verifica siti	0.1	6	6	2014-09-04
141	2	7	Definizione Progetto Comuni v01	2.0	9	9	2014-09-04
142	2	3	Nuova navigazione sito: debugging	3.0	2	2	2014-09-04
143	2	3	Debug menu gerarchico	5.0	2	2	2014-09-04
144	2	3	Menu gerarchico: debug	4.0	2	2	2014-09-05
145	2	7	Definizione Progetto Comuni v01	3.0	9	9	2014-09-08
146	2	4	Acquisizione nuovi quadri bilancio	6.0	2	2	2014-09-08
147	7	1	Briefing con Vincenzo	1.0	9	9	2014-09-09
148	2	3	Verifica Templates Generale / html mrWolf	5.0	9	9	2014-09-09
149	2	3	Debug menu gerarchico	2.0	2	2	2014-09-09
150	2	3	Debug accordion	1.0	2	2	2014-09-09
151	2	4	Normalizzazione voci bilancio	1.0	2	2	2014-09-09
152	2	3	Risoluzione bug accordion	4.0	2	2	2014-09-10
153	2	4	Import nuovi quadri	4.0	2	2	2014-09-10
154	7	7	Revisione con Vincenzo Ettore e Daniele e nuovi templates	1.0	9	9	2014-09-10
155	2	3	Verifica Templates Generale / html mrWolf	3.0	9	9	2014-09-11
156	7	7	Definizione dettagli sito	1.0	9	9	2014-09-11
157	2	4	Normalizzazione voci bilancio: gdocs	4.0	2	2	2014-09-11
158	2	3	Semplificazione nuove voci bilancio	4.0	2	2	2014-09-11
159	2	3	Semplificazione nuove voci bilancio	8.0	2	2	2014-09-12
160	7	4	inserimento mail	16.0	15	8	2014-03-17
161	2	4	aggiornamento politici 	76.0	15	7	2014-04-01
162	10	4	aggiornamento politici 	72.0	15	6	2014-02-01
163	20	4	ricerca dati	40.0	15	6	2014-02-03
164	21	4	ricerca dati	32.0	15	6	2014-02-17
165	22	4	ricerca dati	16.0	15	6	2014-03-03
166	23	4	ricerca dati	8.0	15	6	2014-04-01
167	24	4	ricerca dati	24.0	15	6	2014-07-01
168	25	4	ricerca dati	32.0	15	6	2014-09-01
169	11	4	ricerca dati	8.0	15	6	2014-09-08
170	2	4	aggiornamento politici 	64.0	6	7	2014-03-01
171	2	5	testi e comunicazione sito	64.0	6	7	2014-05-01
172	3	0	presentazione Ministero Esteri a Firenze	8.0	6	8	2014-07-14
173	9	5	elaborazioni domande, risposte politici e comunicazione	96.0	6	6	2014-05-31
174	11	6	ricerche, analisi, riunioni	16.0	6	6	2014-07-01
175	26	6	ricerche, analisi, riunioni	64.0	6	6	2014-03-01
176	10	5	testi sito e comunicazione	90.0	6	6	2014-03-02
177	10	0	riunioni in parlamento	40.0	6	6	2014-02-28
178	8	1	revisione dizionario tag	32.0	6	6	2014-07-31
179	2	4	Semplificazione nuove voci bilancio	3.0	2	2	2014-09-15
180	2	3	Indicatori evabeta v2	5.0	2	2	2014-09-15
181	1	3	Rifattorizzazione import	6.5	3	3	2014-09-15
182	5	9	riunione settimanale	2.0	7	7	2014-09-15
183	2	8	Commerciale	0.5	7	7	2014-09-15
184	2	7	Definizione v04 Responsive	3.0	9	9	2014-09-12
185	2	1	Predisposizione Keynote Personal Democracy	2.0	9	9	2014-09-15
186	2	3	Verifica Templates Generale / html mrWolf	2.0	9	9	2014-09-16
187	2	1	Predisposizione Keynote Personal Democracy	1.0	9	9	2014-09-16
188	3	3	Evoluzione delle API	12.0	4	4	2014-09-15
189	7	3	Refining grafici	20.0	4	4	2014-09-15
190	2	3	Ottimizzazione import dati e calcolo mediane	5.0	2	2	2014-09-16
191	2	4	Semplificazione nuove voci bilancio	3.0	2	2	2014-09-16
192	16	0	Meeting per OpenRegione Lazio in Lait	2.5	1	1	2014-09-16
193	16	9	Riunione su OpenRegione Lazio	0.5	1	1	2014-09-16
194	27	6	Definizione attività e preparazione del Gantt	1.0	1	1	2014-09-16
195	7	10	Configurazione caselle di posta per Uact	0.5	1	1	2014-09-16
196	4	10	Analisi carico eccessivo e blocco richieste da un IP per openparlamento	1.0	1	1	2014-09-16
197	1	3	Rifattorizzazione import	6.5	3	3	2014-09-16
198	13	2	Presentazione per Personal Democracy Forum 29 settembre	1.0	1	1	2014-09-16
199	28	0	Incontro in Consiglio	4.0	7	7	2014-06-20
200	28	0	Incontro in Consiglio	4.0	7	7	2014-07-08
201	28	0	incontro in Consiglio	4.0	7	7	2014-07-18
202	28	0	incontro in Lait	3.0	7	7	2014-09-16
203	28	9	Analisi	0.5	7	7	2014-09-16
204	2	6	coordinamento	0.5	7	7	2014-09-16
205	2	2	rating	1.0	7	7	2014-09-16
206	5	10	gestione amministrativa	1.0	7	7	2014-09-16
207	20	6	piano editoriale, analisi, relazione con cliente	16.0	6	6	2014-01-16
208	21	6	piano editoriale, analisi, relazione con cliente	16.0	6	6	2014-02-01
209	22	6	piano editoriale, analisi, relazione con cliente	8.0	6	6	2014-04-01
210	23	6	piano editoriale, analisi, relazione con cliente	16.0	6	6	2014-03-03
211	24	6	piano editoriale, analisi, relazione con cliente	8.0	6	6	2014-07-01
212	2	3	Verifica Templates Generale / html mrWolf	5.0	9	9	2014-09-17
213	7	\N	Template per le Email	16.0	4	4	2014-09-16
214	2	4	Indicatori evabeta v2	3.0	2	2	2014-09-17
215	2	3	Servizi ai Comuni	5.0	2	2	2014-09-17
216	7	3	Sviluppo UACT alpha	95.0	4	4	2014-01-01
217	12	\N	Sviluppo Widgets	75.0	4	4	2014-01-01
218	12	3	Sviluppo Widgets	85.0	4	4	2014-02-01
219	7	3	Sviluppo UACT beta	90.0	4	4	2014-03-01
220	9	3	Cambio del sistema di code	50.0	4	4	2014-03-01
221	9	3	Refining e Deploy VSQ 2014	90.0	4	4	2014-04-01
222	2	3	Navigazione e refining	80.0	4	4	2014-05-01
223	3	3	Analisi e implementazione di OpenAID	70.0	4	4	2014-06-01
224	1	3	Rifattorizzazione import	6.0	3	3	2014-09-17
225	29	3	Realizzazione tema Wordpress	10.0	4	4	2014-03-01
226	29	3	Realizzazione tema Wordpress	85.0	4	4	2014-02-01
227	3	3	Refining e aggiornamenti dati	40.0	4	4	2014-08-01
228	2	7	Predisposizione Keynote Personal Democracy	3.0	9	9	2014-09-17
229	5	10	gestione amministrativa	4.0	7	7	2014-09-17
230	2	1	Indicatori EvaBeta	2.0	7	7	2014-09-17
231	2	1	Indicatori EvaBeta	3.0	7	7	2014-09-18
232	2	2	Servizi per i Comuni	1.0	7	7	2014-09-18
233	2	3	Verifica Templates Generale / html mrWolf	4.0	9	9	2014-09-18
234	2	7	Predisposizione Keynote Personal Democracy	2.0	9	9	2014-09-18
235	2	3	Servizi ai Comuni	6.0	2	2	2014-09-18
236	2	9	Nuova interfaccia	2.0	2	2	2014-09-18
237	9	3	Testing e refining	20.0	4	4	2014-03-01
238	1	3	Rifattorizzazione import	7.0	3	3	2014-09-18
239	12	3	Widgets politici	40.0	4	4	2014-05-01
240	12	3	Widgets mappe	40.0	4	4	2014-05-01
241	9	3	Testing e refining	40.0	4	4	2014-04-01
242	9	2	Design VSQ social	20.0	4	4	2014-07-01
243	7	3	Referrals, VIP, blog	40.0	4	4	2014-07-01
244	1	3	Manutenzione ordinaria	6.0	3	3	2014-08-25
245	1	3	Manutenzione ordinaria	6.0	3	3	2014-08-26
246	1	3	Manutenzione ordinaria	5.0	3	3	2014-08-27
247	1	3	Rifattorizzazione import	6.0	3	3	2014-08-28
249	4	2	Ideazione di Accesso e Cassetto	10.0	4	4	2014-07-01
250	4	3	Prototipo Cassetto	20.0	4	4	2014-08-01
251	4	3	Implementazione di Cassetto	32.0	4	4	2014-08-01
252	1	3	Rifattorizzazione import	6.0	3	3	2014-08-29
254	4	3	Implementazione di Accesso2	24.0	4	4	2014-09-17
255	9	2	Analisi VSQ2	20.0	4	4	2014-08-01
256	3	\N	Import traduzioni e correzioni DCGS	20.0	4	4	2014-06-01
257	1	3	Rifattorizzazione import	7.0	3	3	2014-09-01
258	1	3	Rifattorizzazione import	7.0	3	3	2014-09-02
259	1	3	Rifattorizzazione import	6.5	3	3	2014-09-03
260	1	3	Rifattorizzazione import	6.5	3	3	2014-09-04
261	1	3	Rifattorizzazione import	6.0	3	3	2014-09-05
262	1	3	Rifattorizzazione import	7.0	3	3	2014-09-08
263	1	3	Rifattorizzazione import	7.0	3	3	2014-09-09
264	1	3	Rifattorizzazione import	7.0	3	3	2014-09-10
265	1	3	Rifattorizzazione import	6.0	3	3	2014-09-11
266	1	3	Rifattorizzazione import	6.0	3	3	2014-09-12
267	2	3	Servizi ai Comuni	5.0	2	2	2014-09-19
268	2	4	Nuovi indicatori	2.0	2	2	2014-09-19
269	2	10	Chiamata con Giangiulio	1.0	2	2	2014-09-19
270	1	3	Rifattorizzazione import	6.5	3	3	2014-09-19
271	5	1	Conteggio ore/progetti genn-ago 2014	3.0	9	9	2014-09-19
272	2	3	Verifica Templates Generale / html mrWolf	1.0	9	9	2014-09-20
273	2	6	Indicatori EvaBeta	4.0	7	7	2014-09-19
274	2	6	Indicatori EvaBeta	2.0	7	7	2014-09-18
275	5	10	coordinamento	3.0	7	7	2014-09-19
276	5	10	gestione amministrativa	3.0	7	7	2014-09-18
277	2	3	Verifica Templates Generale / html mrWolf	2.0	9	9	2014-09-22
278	2	7	Definizione progetto Comuni Responsive	2.0	9	9	2014-09-22
279	30	3	Navigazione	8.0	2	2	2014-09-22
280	2	3	Verifica Templates Generale / html mrWolf	4.0	9	9	2014-09-23
281	2	7	Definizione progetto Comuni Responsive	1.0	9	9	2014-09-23
282	30	3	Navigazione: riconfigurazione delle url	8.0	2	2	2014-09-23
283	28	0	Incontro in Consiglio	6.0	7	7	2014-09-23
284	2	6	coordinamento	1.0	7	7	2014-09-23
285	1	3	Rifattorizzazione import	6.5	3	3	2014-09-22
286	1	3	Rifattorizzazione import	7.0	3	3	2014-09-23
287	2	3	Risoluzione bug produzione	2.0	2	2	2014-09-24
288	2	10	Google webmaster tool	3.0	2	2	2014-09-24
289	33	3	Popup modale	1.0	2	2	2014-09-24
290	30	3	Caricamento logo, testi header/footer	2.0	2	2	2014-09-24
291	1	3	Rifattorizzazione import	7.0	3	3	2014-09-24
292	2	3	Verifica Templates Generale / html mrWolf	1.0	9	9	2014-09-24
293	2	3	Verifica Templates Comune v01 / html 1.7.0 mrWolf	1.0	9	9	2014-09-25
294	2	7	Definizione v04 Responsive	2.0	9	9	2014-09-25
295	2	3	Verifica Templates v04 / Menu gerarchico con Stefano	1.0	9	9	2014-09-25
296	30	3	Nuove url	3.0	2	2	2014-09-25
297	30	3	Caricamento logo	2.0	2	2	2014-09-25
298	30	9	Meeting su modifiche template	1.0	2	2	2014-09-25
299	2	3	Debug codice produzione	1.0	2	2	2014-09-25
300	2	3	Sitemap	1.0	2	2	2014-09-25
301	1	3	Rifattorizzazione import	6.5	3	3	2014-09-25
302	30	3	Messa online servizi	2.0	2	2	2014-09-26
303	30	3	Debug	1.0	2	2	2014-09-26
304	33	3	Popup modale	1.0	2	2	2014-09-26
305	2	3	Sitemap	3.0	2	2	2014-09-26
306	2	7	Definizione progetto Comuni Responsive	4.0	9	9	2014-09-29
307	2	7	Definizione progetto Comuni Responsive	1.0	9	9	2014-09-26
308	2	3	Sitemap xml	7.0	2	2	2014-09-29
309	2	2	Call visup	1.0	2	2	2014-09-29
310	2	9	Bug template 	3.0	2	2	2014-09-30
311	2	3	Sitemap: disabilitazione in staging	2.0	2	2	2014-09-30
312	1	3	Rifattorizzazione import	6.0	3	3	2014-09-26
313	1	3	Rifattorizzazione import	7.0	3	3	2014-09-29
314	1	3	Rifattorizzazione import	7.0	3	3	2014-09-30
315	5	9	Riunione depp	2.0	7	7	2014-09-30
316	5	10	coordinamento	6.0	7	7	2014-09-30
317	8	8	Incontro Camera Deputati	3.0	7	7	2014-10-01
318	5	10	coordinamento	6.0	7	7	2014-10-01
319	2	3	Bug avanzo / disavanzo di bilancio	3.0	2	2	2014-10-01
320	2	3	Ottimizzazione codice widget	3.0	2	2	2014-10-01
321	2	9	Bug template	2.0	2	2	2014-10-01
322	2	7	Definizione Progetto Comuni	1.0	9	9	2014-10-01
323	2	3	Verifica Templates Generale / html mrWolf	4.0	9	9	2014-10-01
324	2	3	Verifica Templates Comune / html mrWolf	1.0	9	9	2014-10-02
325	2	7	Definizione progetto Comuni Responsive	2.0	9	9	2014-10-02
326	6	4	Aggiornamento elezioni provinciali 2014 + aggiornamenti di vari comuni ancora vuoti dopo amministrative 2014	4.0	15	15	2014-10-02
327	2	3	Correzione avanzo / disavanzo	8.0	2	2	2014-10-02
328	1	3	Rifattorizzazione import	6.5	3	3	2014-10-01
329	1	3	Rifattorizzazione import	7.0	3	3	2014-10-02
330	2	3	Integrazione template	3.0	2	2	2014-10-03
331	19	9	meeting progettazione	2.0	2	2	2014-10-03
332	2	3	Correzioni widget bilancio	3.0	2	2	2014-10-03
333	2	3	Osservazioni Widget Selettore anni e Timeline sindaci	2.0	9	9	2014-10-06
334	27	7	Definizione progetto restyling grafici con Vincenzo e Daniele	1.0	9	9	2014-10-06
335	2	7	Definizione progetto Comuni Responsive	1.5	9	9	2014-10-06
336	2	7	Definizione progetto Comuni Responsive	3.0	9	9	2014-10-03
337	2	3	Aggiornamento template	8.0	2	2	2014-10-06
338	2	3	Aggiornamento template	8.0	2	2	2014-10-07
339	1	3	Rifattorizzazione import	6.5	3	3	2014-10-06
340	1	3	Rifattorizzazione import	6.5	3	3	2014-10-07
341	35	6	incontro repubblica, elaborazione testi	48.0	6	6	2014-05-08
342	2	3	Aggiornamento template	8.0	2	2	2014-10-08
343	36	4	brainstorming tabelle + creazione tabellone + inizio data entry	2.0	15	15	2014-10-08
344	36	1	Analisi Indice di produttività	2.0	9	9	2014-10-03
345	2	3	Verifica Templates Generale su staging	2.0	9	9	2014-10-09
346	19	6	riunione rti	4.0	7	7	2014-10-09
347	34	1	ricerca finanziamenti EU	8.0	7	7	2014-10-08
348	5	10	Commerciale	4.0	7	7	2014-10-08
349	5	10	gestione personale	2.0	7	7	2014-10-06
350	5	9	riunione settimanale	2.0	7	7	2014-10-06
351	34	1	ricerca finanziamenti EU	8.0	7	7	2014-10-06
352	2	3	Aggiornamento template	8.0	2	2	2014-10-09
353	36	4	Prime elaborazioni per tabelle	5.0	15	15	2014-10-09
354	1	3	Rifattorizzazione import	4.0	3	3	2014-10-08
355	1	3	Rifattorizzazione import	3.0	3	3	2014-10-09
356	1	3	Invio email di notifica su iscrizione a newsletter	1.0	3	3	2014-10-09
357	2	3	Aggiornamento template, entrate spese accordion	8.0	2	2	2014-10-10
358	1	3	Slugify su progetti	2.0	3	3	2014-10-10
359	36	7	Progetto collana minidossier	1.0	9	9	2014-10-13
360	36	4	Elaborazione e Aggregazione dati	5.0	15	15	2014-10-10
361	36	4	Elaborazione e Aggregazione dati	5.0	15	15	2014-10-13
362	2	3	Aggiornamento template entrate,spese	8.0	2	2	2014-10-13
363	34	1	Eu Parliament	4.0	7	7	2014-10-13
364	5	10	coordimnamento	4.0	7	7	2014-10-13
365	37	10	Corso	16.0	6	6	2014-09-26
366	37	10	corso	40.0	6	6	2014-10-10
367	11	10	riunione gruppo di lavoro	3.0	6	6	2014-10-10
368	7	5	inserimento contenuti di test	3.0	6	6	2014-10-09
369	36	4	Fine elaborazione tabelle	2.0	15	15	2014-10-14
370	2	3	Aggiornamento template Indicatori, fix entrate/spese	8.0	2	2	2014-10-14
371	36	7	Progetto collana minidossier	3.0	9	9	2014-10-14
372	2	3	Verifica Templates Generale su staging	1.0	9	9	2014-10-14
373	5	9	Progettazione Open spesa, territori	2.0	2	2	2014-10-15
374	2	3	Aggiornamento template: indicatori e miniclassifiche	6.0	2	2	2014-10-15
375	6	4	Inizio Import Ministero Interno	4.0	15	15	2014-10-15
376	36	7	Progetto collana minidossier	4.0	9	9	2014-10-15
377	36	7	Progetto collana minidossier	4.0	9	9	2014-10-16
378	2	3	Aggiornamento template: pagina confronti, menu gerarchico	8.0	2	2	2014-10-16
379	1	3	Gestione sidebar su pagine flat	3.0	3	3	2014-10-15
380	1	3	Gestione sidebar su pagine flat	2.0	3	3	2014-10-16
381	19	9	Riunione di startup, con analisi problamatica localizzazioni	2.0	3	3	2014-10-15
382	5	9	riunione depp	2.0	7	7	2014-10-14
383	5	1	controllo di gestione	3.0	7	7	2014-10-14
384	5	10	coordinamento	3.0	7	7	2014-10-14
385	5	10	coordinamento	3.0	7	7	2014-10-15
386	13	0	Campagna OpenSiope	3.0	7	7	2014-10-15
387	34	1	finanz. eu	2.0	7	7	2014-10-15
388	13	10	Lobbying ParlamentoCasadiVetro	2.0	7	7	2014-10-15
389	13	10	lobbying ParlamentoCasadiVetro e Siope	4.0	7	7	2014-10-16
390	5	6	coordinamento	4.0	7	7	2014-10-16
391	5	10	coordinamento	8.0	7	7	2014-10-09
392	5	10	coordinamento	8.0	7	7	2014-10-08
393	36	7	Progetto minidossier Indice di produttività	3.0	9	9	2014-10-17
394	2	3	Verifica Templates Generale su staging	1.0	9	9	2014-10-17
395	36	4	Tabelle aggiuntive	1.5	15	15	2014-10-17
396	6	4	Import Min.Interno	1.5	15	15	2014-10-16
397	6	4	Import Min. Interno	1.5	15	15	2014-10-17
398	2	3	Aggiornamento template: Confronti, bug fix	8.0	2	2	2014-10-17
399	13	10	lobbying 	4.0	7	7	2014-10-17
400	5	10	coordinamento	2.0	7	7	2014-10-17
401	34	1	ricerca finanziamenti EU	2.0	7	7	2014-10-17
402	36	7	Progetto minidossier Indice di produttività	3.0	9	9	2014-10-19
403	31	10	Incontro cliente, manutenzione, redazione offerta	24.0	8	8	2014-04-20
404	33	8	Incontri e redazione offerta	16.0	8	8	2014-02-01
405	14	0	incontro per emilia romagna	8.0	8	8	2014-10-17
406	33	0	incontro per emilia romagna	8.0	8	8	2014-09-10
407	36	4	Import Min. Interno	2.0	15	15	2014-10-20
408	2	3	Aggiornamento template: classifiche. Fix miniclassifiche + fix vari	8.0	2	2	2014-10-20
409	36	7	Progetto minidossier Indice di produttività	4.0	9	9	2014-10-20
410	36	7	Progetto minidossier Indice di produttività	4.0	9	9	2014-10-21
411	2	3	Aggiornamento template: bug fix, incarichi	6.0	2	2	2014-10-21
412	2	4	Correzione script mediane	1.0	2	2	2014-10-21
413	2	6	Riassunto issue Visup	1.0	2	2	2014-10-21
414	19	1	Definizione metadati estesi per impegni e pagamenti.. Report meeting di giovedì al cliente.	1.0	1	1	2014-10-21
415	1	3	Deploy modifiche su flatpages in staging. Allineamento dati utenti in staging.	3.0	1	1	2014-10-21
416	19	1	Startup dell'analisi. Identificazione componenti necessari e strumenti da (ri-)usare.	1.0	1	1	2014-10-21
417	5	6	Gestione progetti Daniele, Gantt, task sparsi vari.	1.0	1	1	2014-10-21
418	5	0	Trasferta Bologna. Regione Emilia Romagna per Open Consiglio	8.0	1	1	2014-10-17
419	1	3	Correzione alcuni bug	1.0	1	1	2014-10-16
420	5	6	Attività varie e generali	2.0	1	1	2014-10-16
421	19	0	Meeting in Lait con ISED..	3.0	1	1	2014-10-16
422	2	3	Aggiornamento template: menu slim, fix accordion	8.0	2	2	2014-10-22
423	36	4	Nuove tabelle	1.5	15	15	2014-10-22
424	3	3	Modifiche alle API	2.0	4	4	2014-10-23
425	6	4	import Min. Interni	2.0	15	15	2014-10-23
426	12	4	Problema caricamento foto risolto	0.5	15	15	2014-10-23
427	2	3	Aggiornamento template: menu slim	1.0	2	2	2014-10-23
428	30	3	Aggiornamento template	7.0	2	2	2014-10-23
429	36	7	Progetto minidossier Indice di produttività	6.0	9	9	2014-10-23
430	36	7	Progetto minidossier Indice di produttività	2.0	9	9	2014-10-22
431	36	7	Progetto minidossier Indice di produttività	2.0	9	9	2014-10-22
432	36	7	Progetto minidossier Indice di produttività	2.0	9	9	2014-10-22
433	19	6	Analisi tempi di sviluppo e preparazione del Gantt	1.0	1	1	2014-10-22
434	1	0	Meeting di recap delle richieste future	4.0	1	1	2014-10-22
435	16	9	Analisi in preparazione dell'inserimento primi 20 dataset	2.0	1	1	2014-10-22
436	19	3	Startup progetto Django	1.5	1	1	2014-10-23
437	16	4	Generazione metadati su ODL	3.0	1	1	2014-10-23
438	5	6	Attività varie e generali	1.0	1	1	2014-10-23
439	16	4	Preparazione metadati e dati dei primi 20 datasets	3.0	1	1	2014-10-24
440	5	6	Attività varie e generali	1.0	1	1	2014-10-24
441	16	1	Test installazione Pentaho BI (kettle server)	2.0	1	1	2014-10-24
442	2	3	Aggiornamento template: link accordion classifiche	6.0	2	2	2014-10-24
443	2	3	Update widget visup	2.0	2	2	2014-10-24
444	2	3	Aggiornamento template: link accordion classifiche, fix css	8.0	2	2	2014-10-27
445	36	7	Progetto minidossier Indice di produttività	4.0	9	9	2014-10-27
446	36	7	Progetto minidossier Indice di produttività	6.0	9	9	2014-10-24
447	2	3	Ordine delle voci in accordion, css fix dell'accordion	8.0	2	2	2014-10-28
448	5	9	Riunione depp	2.0	7	7	2014-10-20
449	15	1	analisi	2.0	7	7	2014-10-20
450	5	6	coordinamento	2.0	7	7	2014-10-20
451	28	0	Incontro in Consiglio	5.0	7	7	2014-10-21
452	5	6	coordinamento	4.0	7	7	2014-10-21
453	5	8	commerciale	3.0	7	7	2014-10-22
454	5	6	coordinamento	4.0	7	7	2014-10-22
455	13	8	Evento - Conferenza	8.0	7	7	2014-10-23
456	13	8	Evento - Conferenza	8.0	7	7	2014-10-24
457	5	8	Commerciale	2.0	7	7	2014-10-27
458	5	6	coordinamento	4.0	7	7	2014-10-27
459	13	0	Campagne	4.0	7	7	2014-10-28
460	28	0	incontro in Consiglio	5.0	7	7	2014-10-28
461	36	7	Cover social e copertina	5.0	9	9	2014-10-28
462	36	4	Verifica dati dopo impaginazione di benedetta	1.5	15	15	2014-10-28
463	17	0	Incontro a Bologna	8.0	8	8	2014-10-24
464	1	0	Incontro al DPS	4.0	8	8	2014-10-22
465	17	0	Incontro con Regione	4.0	8	8	2014-10-27
466	16	0	Incontro il Lait con tutta al RTI	4.0	8	8	2014-10-28
467	16	4	Preparazione metadati e dati dei primi 20 datasets	2.0	1	1	2014-10-27
468	16	4	Caricamento dei Dataset in Lait	4.0	1	1	2014-10-27
469	34	10	Incontro con i fisici di Vittorio Loreto e 	3.0	1	1	2014-10-28
470	5	6	Attività varie e generali	2.0	1	1	2014-10-27
471	5	6	Attività varie e generali	2.0	1	1	2014-10-28
472	1	3	Oscuramento contenuto; messa in produzione della gestione sidebar.	1.0	1	1	2014-10-28
474	3	\N	Aggiornamento API	24.0	4	4	2014-10-27
475	4	\N	OpAccesso	24.0	4	4	2014-10-20
476	4	\N	OpCassetto	28.0	4	4	2014-10-23
477	4	\N	Progettazione infrastruttura Accesso/Cassetto	40.0	4	4	2014-10-13
478	7	\N	Deploy e refining	32.0	4	4	2014-10-06
479	5	9	riunione depp	3.0	7	7	2014-10-29
480	4	\N	Progettazione infrastruttura	32.0	4	4	2014-09-22
481	5	8	commerciale	4.0	7	7	2014-10-29
482	4	\N	Progettazione WidgetBuilder	32.0	4	4	2014-09-29
483	30	3	Logo / logotipo header	2.0	2	2	2014-10-29
484	2	3	Debug navigazione nuovo template	5.0	2	2	2014-10-29
485	2	10	Messa online beta	1.0	2	2	2014-10-29
486	2	10	Messa online beta	4.0	2	2	2014-10-30
487	2	3	Fix bug couch2pg	2.0	2	2	2014-10-30
488	30	3	Import xml	2.0	2	2	2014-10-30
489	5	6	coordinamento	6.0	7	7	2014-10-30
490	34	1	ricerca finanziamenti EU	2.0	7	7	2014-10-30
491	2	10	Messa online beta	3.0	2	2	2014-10-31
492	2	3	Bug fixing beta	3.0	2	2	2014-10-31
493	2	3	Import dati	1.0	2	2	2014-10-31
494	30	4	Mapping xml	1.0	2	2	2014-10-31
495	36	7	Impaginazione testi e correzioni varie	7.0	9	9	2014-11-02
496	36	5	traduzione in inglese + revisioni varie	5.0	15	15	2014-10-31
497	12	3	Widgets: Produttività parlamentari	8.0	4	4	2014-10-31
498	36	5	Traduzioni in inglese + revisioni testi	4.0	15	15	2014-11-01
499	36	5	controllo dati dopo inserimenti grafici	1.5	15	15	2014-10-30
500	5	8	comm	4.0	7	7	2014-11-03
501	5	10	coordinamento	5.0	7	7	2014-11-03
502	36	5	Pubblicazione Indice e lancio	2.0	15	15	2014-11-03
503	2	10	Messa online beta	2.0	2	2	2014-11-03
504	2	3	Risoluzione bug interfaccia	2.0	2	2	2014-11-03
505	19	1	Analisi e progettazione API territori	5.0	3	3	2014-10-20
506	2	3	Aggiornamento procedura di import couch2pg	3.0	2	2	2014-11-03
507	19	1	Analisi e progettazione API territori	5.0	3	3	2014-10-21
508	2	10	Aggiornamento documentazione	1.0	2	2	2014-11-03
509	19	2	Analisi e progettazione API territori	5.0	3	3	2014-10-22
510	19	1	Analisi e progettazione API territori	5.0	3	3	2014-10-23
511	19	1	Analisi e progettazione API territori	5.0	3	3	2014-10-24
512	19	1	Analisi e progettazione API territori	5.0	3	3	2014-10-27
513	19	1	Analisi e progettazione API territori	5.0	3	3	2014-10-28
514	19	1	Analisi e progettazione API territori	5.0	3	3	2014-10-29
515	19	1	Analisi e progettazione API territori	5.0	3	3	2014-10-30
516	19	1	Analisi e progettazione API territori	5.0	3	3	2014-10-31
517	5	9	Riunione di produzione	1.0	1	1	2014-10-29
518	5	6	Attività varie e generali	2.0	1	1	2014-10-29
519	5	6	Attività varie e generali	2.0	1	1	2014-10-30
520	5	6	Attività varie e generali	2.0	1	1	2014-10-31
521	2	3	Debug per deploy in produzione	1.0	1	1	2014-10-29
522	16	1	Analisi estrazione dati Kettle	1.0	1	1	2014-10-29
523	2	3	Debug per deploy in produzione	4.0	1	1	2014-10-30
524	2	3	Debug per deploy in produzione	3.0	1	1	2014-10-31
525	2	3	Debug per deploy in produzione	3.0	1	1	2014-11-03
526	16	1	Analisi Kettle per estrazione dati	2.0	1	1	2014-11-03
527	8	3	Deploy rimozione blocco su indice produttività	1.0	1	1	2014-11-03
528	19	1	Startup progetto con Stefano	1.0	1	1	2014-11-03
529	38	1	Analisi Represent Boundaries e Mapit	3.0	1	1	2014-10-31
530	39	1	Analisi utilizzo Kettle	2.0	1	1	2014-10-31
531	4	\N	Analisi di Oauth2 e librerie python	32.0	4	4	2014-09-01
532	12	3	Widgets: Indicatore della posizione in classifica generale	8.0	4	4	2014-10-30
533	36	3	Indice17: deploy e aggiornamenti	8.0	4	4	2014-11-03
534	33	8	redazione offerta	16.0	8	8	2014-06-18
535	16	0	call con cliente	4.0	8	8	2014-10-31
536	36	7	Cover social e locandina	4.0	9	9	2014-11-03
537	36	7	Locandina	2.0	9	9	2014-11-04
538	36	3	Indice17: banner produttività e footer	4.0	4	4	2014-11-04
539	8	1	Analisi query sparql su dati.camera.it	4.0	4	4	2014-11-04
540	30	3	Debug grafico header	3.0	2	2	2014-11-04
541	2	9	Riunione con Vittorio su import xml	1.0	2	2	2014-11-04
542	2	10	Riunione Giangiulio	2.0	2	2	2014-11-04
543	2	3	Aggiornamento su robots, procedure di import e indicizzazione	2.0	2	2	2014-11-04
544	6	4	Import Min. Interni	2.0	15	15	2014-11-04
545	8	1	Progettazione aggiornamento dati da dati.camera.it	6.0	4	4	2014-11-05
546	30	3	Pagine statiche, pagina statica not found	4.0	2	2	2014-11-05
547	2	9	Meeting progettazione nuovo slider home	1.0	2	2	2014-11-05
548	2	3	Aggiunta robots.txt	2.0	2	2	2014-11-05
549	2	1	Studio web master tools google, risoluzione errori crawler	1.0	2	2	2014-11-05
550	6	4	Ultimo import Min Interni	2.0	15	15	2014-11-06
551	30	3	Import xml: procedura	4.0	2	2	2014-11-06
552	2	2	Update doc deploy	2.0	2	2	2014-11-06
553	2	4	Dump indicatori per fornitura	1.0	2	2	2014-11-06
554	30	3	Debug interfaccia grafica	1.0	2	2	2014-11-06
555	8	2	Sparql e test su database	6.0	4	4	2014-11-06
556	25	4	aggiornamento dati dopo insediamento commissione juncker	2.0	15	15	2014-11-07
557	30	9	Template mobile	1.0	2	2	2014-11-07
558	30	2	Import xml: definizione procedura	6.0	2	2	2014-11-07
559	2	3	Robots.txt in produzione	1.0	2	2	2014-11-07
560	5	8	commerciale	4.0	7	7	2014-11-04
561	5	6	coordinamento	4.0	7	7	2014-11-04
562	5	6	coordinamento	8.0	7	7	2014-11-05
563	15	2	coordinamento	4.0	7	7	2014-11-06
564	30	1	analisi	4.0	7	7	2014-11-06
565	5	6	coordinamento	4.0	7	7	2014-11-07
566	15	2	progettazione	4.0	7	7	2014-11-07
567	5	6	Attività varie e generali	2.0	1	1	2014-11-04
568	1	3	Correzione bug, risposta ad email, caricamento dati cambiati.	2.0	1	1	2014-11-04
569	8	3	Risoluzione sovraccarico traffico su OPP, proveniente da widget Espresso	3.0	1	1	2014-11-05
570	19	2	Refine impostazione progetto con Stefano	1.0	1	1	2014-11-05
571	39	1	Analisi funzionalità Kettle	4.0	1	1	2014-11-06
572	2	5	Inserimento descrizione nuovi indicatori	2.0	1	1	2014-11-06
573	5	6	Attività varie e generali	2.0	1	1	2014-11-06
574	5	6	Attività varie e generali	2.0	1	1	2014-11-05
575	39	1	Analisi funzionalità Kettle	2.0	1	1	2014-11-07
576	39	3	Progetto Django	2.0	1	1	2014-11-07
577	16	0	Riunione in Lait su dati di bilancio	3.0	1	1	2014-11-07
578	19	1	Analisi preliminare Home	4.0	9	9	2014-11-05
579	2	7	Definizione progetto Comuni e Generale Responsive	6.0	9	9	2014-11-06
580	2	7	Definizione progetto Comuni e Generale Responsive	4.0	9	9	2014-11-07
581	19	7	Progetto preliminare homepage	3.0	9	9	2014-11-07
582	19	3	Analisi CSV, creazione modello dei dati e sviluppo procedura di import	6.0	3	3	2014-11-03
583	19	3	Analisi CSV, creazione modello dei dati e sviluppo procedura di import	6.0	3	3	2014-11-04
584	19	3	Analisi CSV, creazione modello dei dati e sviluppo procedura di import	7.0	3	3	2014-11-05
585	19	3	Analisi CSV, creazione modello dei dati e sviluppo procedura di import	7.0	3	3	2014-11-07
586	5	6	coordinamento	4.0	7	7	2014-11-10
587	2	2	Versione responsive	2.0	7	7	2014-11-10
588	13	0	lobbying ParlamentoCasadiVetro e Siope	2.0	7	7	2014-11-10
589	30	3	Import codici xml: script di import codici	8.0	2	2	2014-11-10
590	8	3	Controlli di integrità gruppi e cariche	6.0	4	4	2014-11-07
591	19	7	Progetto preliminare homepage	4.0	9	9	2014-11-10
592	39	1	Analisi opportunità utilizzo django-admincommand (scartato)	2.0	1	1	2014-11-10
593	39	3	Sviluppo interfaccia di gestione delle verifiche (in admin)	4.0	1	1	2014-11-10
594	4	1	Test installazione docker su eeeBox (fallito, 32 bit, richiede 64bit)	1.0	1	1	2014-11-10
595	5	6	Attività varie e generali	1.0	1	1	2014-11-10
596	19	3	Analisi CSV, creazione modello dei dati e sviluppo procedura di import	6.5	3	3	2014-11-10
597	40	1	analisi programmazione 2014-2020	1.5	15	15	2014-11-11
598	30	3	Import xml: script xml2slug	7.0	2	2	2014-11-11
599	30	9	Mappatura xml	1.0	2	2	2014-11-11
600	8	3	Importazione sedute e votazioni da camera	8.0	4	4	2014-11-10
601	8	\N	Importazione sedute e votazioni da senato	8.0	4	4	2014-11-11
602	19	7	Definizione homepage (4h)	4.0	9	9	2014-11-11
603	19	7	Definizione homepage	4.0	9	9	2014-11-12
604	30	3	Import xml: fix bug xml2slug	5.0	2	2	2014-11-12
605	2	10	Investigazione errori google bot	1.0	2	2	2014-11-12
606	30	3	Import xml: script import xml2pg	2.0	2	2	2014-11-12
607	19	3	Analisi CSV, creazione modello dei dati e sviluppo procedura di import	6.5	3	3	2014-11-11
608	19	3	Analisi CSV, creazione modello dei dati e sviluppo procedura di import	7.0	3	3	2014-11-12
609	30	2	Import xml: ramo cassa/ somma funzioni	4.0	2	2	2014-11-13
610	5	6	coordinamento	5.0	7	7	2014-11-11
611	5	9	riunione depp	2.0	7	7	2014-11-11
612	5	6	coordinamento	8.0	7	7	2014-11-12
613	34	1	Parl EU	5.0	7	7	2014-11-13
614	30	2	Import xml	4.0	7	7	2014-11-13
615	5	6	coordinamento	4.0	7	7	2014-11-14
616	34	1	Parl EU	4.0	7	7	2014-11-14
617	36	7	Impaginazione EBook ITA	4.0	9	9	2014-11-13
618	36	7	Impaginazione EBook ITA e ENG	4.0	9	9	2014-11-14
619	16	3	Estrazione 2 dataset BILTCO in Lait	6.0	1	1	2014-11-13
620	30	3	Import xml: ramo cassa / somma funzioni	4.0	2	2	2014-11-14
621	19	3	Analisi CSV, creazione modello dei dati e sviluppo procedura di import	7.5	3	3	2014-11-13
622	19	3	Analisi CSV, creazione modello dei dati e sviluppo procedura di import	6.0	3	3	2014-11-14
623	30	3	Import xml: bug fix rami fittizi	2.0	2	2	2014-11-15
624	8	\N	Implementazione updater	8.0	4	4	2014-11-12
625	8	\N	Implementazione updater	4.0	4	4	2014-11-13
626	8	\N	Implementazione updater	4.0	4	4	2014-11-14
627	8	4	Verifica iter ddl	4.0	16	16	2014-11-18
628	40	4	Inizio lavoro dossier (creazione indice + prime tabelle)	6.0	15	15	2014-11-17
629	30	2	Import xml: inserimento nel bilancio voci non mappate (somme)	6.0	2	2	2014-11-17
630	30	3	Import xml: inserimento nel bilancio voci non mappate (somme)	2.0	2	2	2014-11-17
631	5	9	Riunione depp	2.0	7	7	2014-11-17
632	5	6	coordinamento	2.0	7	7	2014-11-17
633	41	2	coordinamento	3.0	7	7	2014-11-17
634	19	3	\tAnalisi CSV, creazione modello dei dati e sviluppo procedura di import	7.0	3	3	2014-11-17
635	19	7	Definizione pagine Ricerca e Aggregazioni	4.0	9	9	2014-11-17
636	19	7	Definizione pagine Pagamento e FAQ, nuovi colori	4.0	9	9	2014-11-18
637	30	3	debugging	2.0	7	7	2014-11-18
638	5	6	coordinamento	6.0	7	7	2014-11-18
639	19	3	Sviluppo scheletro navigazione	6.0	3	3	2014-11-18
640	40	4	elaborazione tabelle e raccolta dati	6.0	15	15	2014-11-18
641	8	4	Verifica iter ddl	6.0	16	16	2014-11-17
642	36	7	Revisione Epub	1.0	9	9	2014-11-19
643	36	7	Locandina	3.0	9	9	2014-11-19
644	8	3	Realizzazione command line interface	8.0	4	4	2014-11-17
645	8	\N	Realizzazione command line interface	5.0	4	4	2014-11-18
646	3	3	Analisi e realizzazione dello script per cambi di CRSID	5.0	4	4	2014-11-19
647	40	4	Fine tabelle, e prima grafici per prima consegna	4.0	15	15	2014-11-19
648	6	4	Verifica amministrazioni comunali	5.0	16	16	2014-11-19
649	30	3	Debug: somme funzioni	4.0	2	2	2014-11-19
650	30	3	Nuova tabella per tracciamento import xml	2.0	2	2	2014-11-19
651	2	1	Analisi errori bot (motori di ricerca)	2.0	2	2	2014-11-19
652	5	6	coordinamento	5.0	7	7	2014-11-19
653	15	5	Redazione lezioni	2.0	7	7	2014-11-19
655	5	6	coordinamento	4.0	7	7	2014-11-20
656	19	0	incontro in Lait	3.0	7	7	2014-11-20
657	36	7	Revisione Epub	3.0	9	9	2014-11-20
658	36	7	Locandina	1.0	9	9	2014-11-20
659	40	4	Tabelle aggiuntive da opencoesione	3.0	15	15	2014-11-20
660	2	3	Risoluzione bug voci competenza	2.0	2	2	2014-11-20
661	2	10	Call giangiulio	1.0	2	2	2014-11-20
662	2	3	Debugging x bot	1.0	2	2	2014-11-20
663	30	3	Debug valori funzioni	2.0	2	2	2014-11-20
664	2	3	Debug api google url shortener	2.0	2	2	2014-11-20
665	19	3	Sviluppo scheletro navigazione	6.5	3	3	2014-11-19
666	19	3	Sviluppo scheletro navigazione	6.5	3	3	2014-11-20
667	8	4	Verifica DDL unificati	2.0	16	16	2014-11-20
668	6	4	Verifica amministrazioni comunali	4.0	16	16	2014-11-20
669	6	\N	Verifica amministrazioni comunali	6.0	16	16	2014-11-21
670	19	3	Sviluppo scheletro navigazione	6.0	3	3	2014-11-21
671	30	3	Correzione somme funzioni	3.0	2	2	2014-11-21
672	36	7	Locandina	2.0	9	9	2014-11-21
673	30	3	Somma funzioni, interventi non corretta	8.0	2	2	2014-11-24
674	19	3	Sviluppo scheletro navigazione	7.5	3	3	2014-11-24
675	40	5	realizzazione grafici per repubblica	6.0	15	15	2014-11-25
676	30	3	Debug import xml: somma non corretta	6.0	2	2	2014-11-25
677	30	4	Aggiunta flag bilancio importato xml	1.0	2	2	2014-11-25
678	2	3	Gestione errore server staging	1.0	2	2	2014-11-25
679	2	3	Verifica html mr. Wolf Comune e Generale mobile	4.0	9	9	2014-11-26
680	40	5	bozza intro per repubblica	1.0	15	15	2014-11-26
681	2	2	Cambio arco temporale applicazione	5.0	2	2	2014-11-26
682	2	10	Call giangiulio	1.0	2	2	2014-11-26
683	30	3	Implementazione nuovo arco temporale applicazione	2.0	2	2	2014-11-26
684	19	3	Sviluppo scheletro navigazione	6.5	3	3	2014-11-25
685	19	3	Sviluppo scheletro navigazione	7.0	3	3	2014-11-26
686	2	3	Verifica html mr. Wolf Comune e Generale mobile	1.0	9	9	2014-11-27
687	19	7	Definizione pagina Soggetto e stili	3.0	9	9	2014-11-27
688	30	10	Call giangiulio template mobile	1.0	2	2	2014-11-27
689	2	2	Sistema automatizzato per arco temporale	3.0	2	2	2014-11-27
690	2	1	ottimizzazione su ultimo bilancio considerato	3.0	2	2	2014-11-27
691	5	9	Strumenti project mng	1.0	2	2	2014-11-27
692	5	9	riunione settimanale	2.0	7	7	2014-11-24
693	5	6	coordinamento	6.0	7	7	2014-11-24
694	13	10	conferenza	8.0	7	7	2014-11-25
695	2	6	versione responsive	4.0	7	7	2014-11-26
696	5	8	offerte	4.0	7	7	2014-11-27
697	13	10	conferenza	4.0	7	7	2014-11-27
698	5	6	coordinamento	4.0	7	7	2014-11-27
699	5	0	incontro	2.0	7	7	2014-11-28
700	15	5	modulo formazione	3.0	7	7	2014-11-28
701	19	0	incontro	3.0	7	7	2014-11-28
702	8	3	Test import dati da camera e senato	8.0	4	4	2014-11-20
703	8	3	Test import dati da camera e senato	8.0	4	4	2014-11-21
704	3	3	Aggiornamento CRSID	8.0	4	4	2014-11-24
705	3	3	Script aggiornamento titoli e deploy in staging	10.0	4	4	2014-11-25
706	7	1	Analisi delle funzionalità e dei bug proritari	3.0	4	4	2014-11-26
707	30	9	Template mobile	1.0	2	2	2014-11-28
708	2	2	Ottimizzazione codice ultimo bilancio considerato	4.0	2	2	2014-11-28
709	2	3	Ottimizzazione codice ultimo bilancio considerato	1.0	2	2	2014-11-28
710	29	1	Indicizzazione blog	2.0	2	2	2014-11-28
711	2	3	Verifica html mr. Wolf Comune e Generale mobile	5.0	9	9	2014-11-28
713	7	3	Correzione bugs	4.0	4	4	2014-11-28
714	6	4	Verifica amministrazioni comunali	6.0	16	16	2014-11-24
715	8	4	Ricerca ddl 	1.0	16	16	2014-11-25
716	6	4	Verifica amministrazioni comunali	5.0	16	16	2014-11-25
717	6	4	Verifica amministrazioni comunali	6.0	16	16	2014-11-26
718	6	4	Verifica amministrazioni comunali	4.0	16	16	2014-11-27
719	19	7	Palette colori treemap	1.5	9	9	2014-12-01
720	7	3	Verifica parziale sito	1.0	9	9	2014-12-01
721	2	3	Verifica html mr. Wolf Comune e Generale tablet	1.0	9	9	2014-12-01
722	6	4	Indirizzario	2.0	16	16	2014-11-27
723	6	4	Indirizzario	6.0	16	16	2014-11-28
724	30	3	Update bilancio: nuova navigazione per bilanci mancanti	5.0	2	2	2014-12-01
725	2	9	Planning	1.0	2	2	2014-12-01
726	2	3	Bug fixing	2.0	2	2	2014-12-01
727	30	3	Debugging navigazione nuova Overview	4.0	2	2	2014-12-02
728	30	3	update import incarichi	2.0	2	2	2014-12-02
729	30	3	Feedback template mobile	2.0	2	2	2014-12-02
730	28	8	conferenza	5.0	7	7	2014-12-01
731	5	6	coordinamento	3.0	7	7	2014-12-01
732	5	6	coordinamento	8.0	7	7	2014-12-02
733	30	3	Debug nuova pagina "bilancio mancante"	4.0	2	2	2014-12-03
734	2	1	Bug share link su classifiche	1.0	2	2	2014-12-03
735	2	3	Cambio costanti temporali OB	3.0	2	2	2014-12-03
736	5	6	coordinamento	6.0	7	7	2014-12-03
737	2	6	coordinamento	2.0	7	7	2014-12-03
738	5	6	coordinamento	8.0	7	7	2014-12-04
739	7	3	Refactoring import targets	8.0	4	4	2014-12-01
740	7	3	Refactoring import targets	8.0	4	4	2014-12-02
741	7	3	Gestione dei Supporters	8.0	4	4	2014-12-03
742	7	3	Refactoring invio email	6.0	4	4	2014-12-04
743	30	9	Template mobile	1.0	2	2	2014-12-04
744	30	9	Settaggi arco temporale applicazione	1.0	2	2	2014-12-04
745	5	9	Strumenti per organizzare il flusso di lavoro	1.0	2	2	2014-12-04
746	2	3	Cambio set temporali	2.0	2	2	2014-12-04
747	2	3	Debug css link accordion	3.0	2	2	2014-12-04
748	2	3	Verifica html mr. Wolf Comune e Generale tablet	2.0	9	9	2014-12-05
749	2	3	Verifica html mr. Wolf Comune e Generale tablet	3.5	9	9	2014-12-04
750	2	3	Verifica html mr. Wolf Comune e Generale tablet	2.0	9	9	2014-12-03
751	2	3	Verifica html mr. Wolf Comune e Generale tablet 	3.0	9	9	2014-12-02
752	6	4	Indirizzario	2.5	16	16	2014-12-01
753	6	4	Verifica amministrazioni comunali	3.5	16	16	2014-12-01
754	6	4	Indirizzario	2.0	16	16	2014-12-02
755	6	4	Aggiornamento province	3.0	16	16	2014-12-02
756	6	4	Aggiornamento province	5.0	16	16	2014-12-03
757	6	4	Verifica amministrazioni comunali	6.0	16	16	2014-12-04
758	8	4	Verifica voti	5.0	16	16	2014-12-05
759	2	3	Fix accordion e navigazione	3.0	2	2	2014-12-05
760	30	3	Aggiornamento open data xml	5.0	2	2	2014-12-05
761	1	3	Import nuovi dati	3.0	3	3	2014-12-01
762	1	3	Gestione nuovo campo "privacy"	3.5	3	3	2014-12-01
763	1	3	Gestione nuovo campo "privacy" e import nuovi dati	6.5	3	3	2014-12-02
764	1	3	Gestione nuovo campo "privacy" e import nuovi dati	3.0	3	3	2014-12-03
765	30	3	Aggiornamento open data xml	4.0	2	2	2014-12-09
766	30	2	Aggiornamento Import couch	2.0	2	2	2014-12-09
767	30	3	Aggiornamento Import couch	2.0	2	2	2014-12-09
768	30	2	Aggiornamento e fix import couch2pg	5.0	2	2	2014-12-10
769	30	3	Aggiornamento procedura di import couch2pg	2.0	2	2	2014-12-10
770	5	10	Call con BIID	1.0	2	2	2014-12-10
771	7	3	Correzione bugs e deploy staging/production	6.0	4	4	2014-12-09
772	7	3	Deploy in produzione	6.0	4	4	2014-12-10
773	30	3	Aggiornamento procedura di import couch2pg	7.0	2	2	2014-12-11
774	30	3	debug nuova procedura import	1.0	2	2	2014-12-11
775	2	4	Fix capoluoghi per indicators2csv	3.0	2	2	2014-12-12
776	30	3	Test e debug nuova procedura couch2pg	3.0	2	2	2014-12-12
777	30	3	Aggiunta flag bilancio xml nel template	2.0	2	2	2014-12-12
778	1	3	Import nuovi dati	6.0	3	3	2014-12-11
779	1	3	Import nuovi dati	2.0	3	3	2014-12-12
780	8	4	Verifica voti	3.0	16	16	2014-12-09
781	8	4	Inserimento voti	2.0	16	16	2014-12-09
782	6	4	Indirizzario	2.0	16	16	2014-12-10
783	8	4	Inserimento voti	2.0	16	16	2014-12-10
784	8	4	Inserimento voti	1.0	16	16	2014-12-11
785	6	4	Verifica province	2.0	16	16	2014-12-11
786	8	4	Inserimento voti	2.0	16	16	2014-12-12
787	42	5	Redazione contenuti	0.5	16	16	2014-12-10
788	42	5	Redazione contenuti	2.0	16	16	2014-12-11
789	42	5	Redazione contenuti	1.0	16	16	2014-12-12
790	2	4	Fix capoluoghi	2.0	2	2	2014-12-15
791	30	3	Aggiunta flag bilancio importato xml	4.0	2	2	2014-12-15
792	5	9	Riunione Vincenzo: strumenti per tracking	1.0	2	2	2014-12-15
793	7	3	Debug produzione	6.0	4	4	2014-12-11
794	1	3	Modifiche import progetti CIPE	3.0	3	3	2014-12-15
795	1	3	Import nuovi dati	6.0	3	3	2014-12-16
796	7	3	Correzione bugs	8.0	4	4	2014-12-15
797	7	3	Correzione bugs	8.0	4	4	2014-12-16
798	1	3	Formazione Solr	1.0	3	3	2014-12-16
799	7	3	Correzione bugs	8.0	4	4	2014-12-17
800	30	3	Implementazione seconda immagine header	4.0	2	2	2014-12-17
801	2	3	Fix bilancio not found bug	4.0	2	2	2014-12-17
\.


--
-- Name: tracking_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tracking_activity_id_seq', 902, true);


--
-- Data for Name: tracking_project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tracking_project (id, start_date, end_date, name, identification_code, description, resources, customer, project_type, phase, status) FROM stdin;
1	2012-06		Open Coesione	OC	Portale sull'attuazione degli investimenti programmati nel ciclo 2007-2013 da Regioni e amministrazioni centrali dello Stato con le risorse per la coesione. 	production: http://www.opencoesione.gov.it\r\nstaging: http://oc2.staging.deppsviluppo.org\r\n\r\ngithub: http://github.com/DeppSRL/open_coesione\r\nissues: http://github.com/DeppSRL/open_coesione/issues	DPS	1	4	1
2	2013-04		Open Bilanci	OB	I bilanci di tutti i Comuni italiani degli ultimi dieci anni.	production: http://www.openbilanci.it\r\nstaging: http://openbilanci.staging.deppsviluppo.org\r\n\r\ngithub: http://github.com/DeppSRL/open_bilanci\r\nissues: http://github.com/DeppSRL/open_bilanci/issues\r\n	FILAS	1	3	1
3			OpenAID	OAID	Dati sugli aiuti umanitari.	https://github.com/DeppSRL/open-aid	dps	0	\N	\N
4			Infrastrutture Management	ZIMAN	Sviluppo e razionalizzazione infrastrutture per il management	Sito di tracking: http://management.depp.it	INTERNO	1	3	1
5			Gestione e amministrazione generale	ZZGES	Fanno riferimento a questo meta-progetto le attività di direzione, gestione e amministrazione generale dell'azienda. Riunioni, gestione pratiche, ...	Nada	INTERNO	0	\N	1
6	2014-09		Open Politici	OP	Attività di gestione e manutenzione della piattaforma, della base data e della community di 	www.politici.openpolis.it	INTERNO + RCS-Corriere.it	0	4	1
7	2014-01	2014-12	uAct	UACT	Piattaforma di campagne online in collaborazione con Action Aid	Produzione: http://uact.it/\r\nStaging: http://staging.openaction.it/\r\ngithub: https://github.com/DeppSRL/open-action-3\r\n\r\nServer produzione: ovhe (176.31.74.25)\r\nServer Staging: staging (176.31.74.29)\r\n	Action Aid	1	3	1
8			Open Parlamento	OPP	Il nostro sito bandiera sul monitoraggio delle attività parlamentari	produzione: http://parlamento.openpolis.it/ => http://parlamento17.openpolis.it/\r\nproduzione leg 16: http://parlamento16.openpolis.it/\r\n\r\ngithub: https://github.com/openpolis/openparlamento\r\n\r\nserver di produzione: ovhb1 (94.23.65.144)\r\n	INTERNO	0	4	1
9	2014-01		Voi Siete Qui	ZVSQ	test politico elettorale	www.voisietequi.it	Openpolis	1	9	0
10	2014-01		Parlamento Casa di Vetro	ZPCV	Campagna per la trasparenza delle commissioni parlamentari	www.parlamentocasadivetro.it	Openpolis	1	3	1
11	2014-01		FOIA	ZFOIA	Campagna per l'adozione del Foia in Italia	www.foia4italy.it	openpolis	1	3	1
12	2014-01	2014-12	Espresso	ESPR	Commessa web e settimanale	http://temi.repubblica.it/espresso-open-politix/	Gruppo L'Espresso 	1	3	1
13	2014-01		Comunicazione	ZCOM	Ufficio stampa, OpenBlog, FB, TW, Convegni, etc.	www.openpolis.it	Openpolis	0	3	1
14	2014-01		Open Municipio	OM	Gestione piattaforma e singole istanze	www.openmunicipio.it	Depp srl	0	3	1
15	2014-01		Open Data Lazio Formazione	ODLF	Attività di formazione 	www.laitspa.it	Regione Lazio - LAIT SPA	1	3	1
16	2014-01		Open Data Lazio Censimento 	ODLC	Censimento dei dataset	www.laitspa.it	Regione Lazio - LAIT SPA	1	3	1
17	2014-05		Open Data Lazio Sanità	ODLS	Applicazione dedicata ai dati sanitari	www.laitspa.it	Regione Lazio - LAIT SPA	1	3	1
18	2014-01		Open Data Lazio Progetti	ODLP	Applicazione dedicata ai progetti di sviluppo regionale	www.laitspa.it	Regione Lazio - LAIT SPA	1	3	1
19	2014-01		Open Data Lazio Spesa	ODLSP	Applcazione dedicata alla spesa regionale	www.laitspa.it	Regione Lazio - LAIT SPA	1	3	1
20	2014-01	2014-02	Dossier Finanziamento Pubblico	DS1	Mini Dossier di approfondimento sul finanziamento pubblico ai partiti dal 1992 al 2013	drive	Repubblica	1	9	0
21	2014-01	2014-02	Dossier Finanziamento Privato	DS2	Finanziamenti ricevuti dai partiti dal 1992 al 2013	drive	Repubblica	1	9	0
22	2014-02	2014-03	Dossier Donne in Politica	DS3	Approfondimento sulla presenza di donne nella politica italiana	drive	Repubblica	1	9	0
23	2014-03	2014-04	Dossier Governo Renzi	DS4	Approfondimento su composizione del Governo Renzi	drive	Repubblica	1	9	0
24	2014-06	2014-07	Dossier M5S	DS6	Approfondimento sull'attività parlamentare del M5S	drive	l'Espresso	1	9	0
25	2014-09	2014-11	Dossier Commissione UE	DS7	Approfondimento sulla composizione della Commissione UE di Juncker	drive	Il Fatto	1	3	1
26	2014-01	2014-12	Camere Aperte 2014	ZCA14	rapporto sull'attività del Parlamento	drive	openpolis	0	2	1
27	2014-09-15	2014-09-25	Charts Builder	ZCHAB	Costruttore di charts per visualizzazioni semplici a partire dai dati. 	http://github.com/openpolis	INTERNO	1	2	1
28	2014-06		Open Consiglio Lazio	OCL	Adattamento di Open Municipio al Consiglio regionale	www.openmunicipio.it	Consiglio regionale del Lazio	1	1	1
29			OpenBlog	ZBLOG	Blog dell'associazione Openpolis	https://github.com/openpolis/openblog-theme	INTERNO	1	9	1
30	2014-07		Open Bilanci per i Comuni	OBC	Servizi Open bilanci per i Comuni	www.openbilanci.it	Comuni	1	3	1
31	2014-01		Senato Ragazzi	SR	Manutenzione della piattaforma Senato per i Ragazzi	http://www.senatoperiragazzi.it/	Senato della Repubblica	0	4	1
32	2014-01		Invitalia Hosting	INVIT	Servizi di hosting	http://www.invitalia.it/	Invitalia	0	4	1
33	2014-01		Open Ricostruzione	ORIC	Manutenzione ordinaria e evolutiva della piattaforma Open Ricostruzione	openricostruzione.it	Regioen Emili Romagna	0	4	1
34	2014-06		Ricerca Finanziamenti	ZFIN	Ricerca e individuazione di fonti di finanziamento EU, ITA, REGIONE e altro	www.eu.eu	depp srl	0	1	1
35	2014-05	2014-05	Dossier OpenBilanci	DS5	elaborazioni e mappe 	drive	la repubblica	1	9	0
36	2014-10		Dossier Indice di Produttività	DS8	elaborazioni, testi, grafici per la consegna a Espresso e per un rapporto in formato elettronico	drive	l'Espresso	1	3	1
37	2014-09	2014-10	Master Sole24Ore	MS24	Corso e laboratori presso il Master "Relazioni Istituzionali" della Business School del Sole24Ore 	drive	Business School del Sole24Ore 	1	3	1
38	2014-10-30	2015-03-31	Poplus Component Integration	PCI	Integrazione dei componenti Poplus. Progetto finanziato da MySociety	http://poplus.org/	MySociety	1	1	1
39	2014-10-30	2014-12-20	Verifica congruità dati OP	OPV	Procedure di verifica della congruità dei dati Openpolis, Openparlamento, Accesso, ...	httpo://www.openpolis.it	INTERNO	1	1	1
40	2014-11	2014-12	Dossier Politiche Coesione	DS9	dati ed elaborazioni per un approfondimento per la Repubblica	opencoesione.gov.it e sito della commissione europea\r\n\r\nle elaborazioni sono su drive\r\n\r\n	la repubblica	1	2	1
42	2014-12	2015-12	Internazionale	In	fornitura contenuti editoriali per il settimanale Internazionale	drive	Internazionale	0	0	1
41	2014-11-01		Rapporto competitività Comuni	RCC	Rapporto per http://www.sinloc.com/ basato sugli indicatori di Open bilanci realizzato in coll.ne con Univ. di Firenze http://www.unifi.it/p-doc2-2013-0-A-2c303a2d3429-0.html	http://www.sinloc.com/\r\nhttp://www.unifi.it/p-doc2-2013-0-A-2c303a2d3429-0.html	Sinloc	1	3	1
43	2015-01	2015-12	Dossier Quirinale 2015	DS10	MiniDossier per l'elezione del Presidente della Repubblica	drive	espresso	1	3	1
44	2015-01	2015-12	Report Inclusione sociale	Rep1	report per Action Aid	drive	Action Aid	1	3	1
45	2014-11		You Are in EU	YREU	Progetto VsQ socila per il bando del Parlamento EU 	www.voisietequi.it	parlamento EU	0	2	1
\.


--
-- Name: tracking_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tracking_project_id_seq', 45, true);


--
-- Data for Name: tracking_project_managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tracking_project_managers (id, project_id, worker_id) FROM stdin;
57	1	1
58	2	1
59	2	2
60	2	7
61	3	1
62	3	8
63	4	1
64	5	1
65	5	8
66	5	7
67	5	6
68	6	1
69	7	1
70	7	8
71	7	6
72	8	1
73	8	8
74	8	7
75	8	6
76	9	6
77	10	6
78	11	6
79	12	6
80	13	6
81	14	7
82	15	8
83	16	1
84	16	8
85	17	8
86	18	8
87	19	1
88	19	8
89	20	6
90	21	6
91	22	6
92	23	6
93	24	6
94	25	6
95	26	6
96	27	1
97	27	6
98	28	7
99	29	6
100	30	7
101	31	8
102	32	8
103	33	8
104	34	7
105	35	6
106	36	6
107	37	6
108	38	1
109	39	1
110	40	6
111	41	7
112	42	6
113	43	6
114	44	6
115	45	7
\.


--
-- Name: tracking_project_managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tracking_project_managers_id_seq', 115, true);


--
-- Data for Name: tracking_project_workers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tracking_project_workers (id, project_id, worker_id) FROM stdin;
335	43	6
336	43	15
337	44	16
338	44	6
339	44	15
340	45	6
341	45	15
168	1	1
169	1	8
170	1	3
171	1	9
172	2	13
173	2	15
174	2	1
175	2	2
176	2	4
177	2	7
178	2	6
179	2	9
180	3	1
181	3	8
182	3	9
183	3	15
184	3	4
185	4	1
186	4	4
187	5	13
188	5	15
189	5	1
190	5	3
191	5	2
192	5	4
193	5	7
194	5	6
195	5	9
196	5	8
197	6	15
198	6	1
199	6	2
200	6	4
201	6	6
202	6	8
203	7	15
204	7	1
205	7	4
206	7	6
207	7	9
208	7	8
209	8	15
210	8	16
211	8	1
212	8	4
213	8	7
214	8	6
215	8	8
216	9	15
217	9	1
218	9	2
219	9	4
220	9	6
221	9	9
222	10	9
223	10	2
224	10	15
225	10	7
226	10	6
227	11	15
228	11	7
229	11	6
230	12	15
231	12	1
232	12	4
233	12	7
234	12	6
235	12	9
236	12	8
237	13	9
238	13	8
239	13	15
240	13	7
241	13	6
242	14	15
243	14	1
244	14	2
245	14	7
246	14	6
247	14	9
248	14	8
249	15	15
250	15	1
251	15	7
252	15	6
253	15	9
254	15	8
255	16	1
256	16	8
257	16	3
258	16	2
259	16	4
260	17	1
261	17	3
262	17	2
263	17	4
264	17	9
265	17	8
266	18	1
267	18	8
268	18	3
269	18	9
270	19	1
271	19	8
272	19	2
273	19	9
274	19	7
275	20	15
276	20	6
277	21	15
278	21	6
279	22	15
280	22	6
281	23	15
282	23	6
283	24	15
284	24	6
285	25	15
286	25	6
287	26	15
288	26	1
289	26	7
290	26	6
291	26	9
292	26	8
293	27	9
294	27	4
295	28	1
296	28	9
297	28	2
298	28	7
299	29	9
300	29	4
301	30	1
302	30	9
303	30	2
304	30	7
305	31	9
306	31	8
307	31	2
308	32	1
309	33	1
310	33	8
311	33	2
312	33	9
313	34	8
314	34	7
315	35	3
316	35	4
317	35	6
318	36	9
319	36	15
320	36	4
321	36	6
322	37	6
323	38	1
324	38	4
325	39	1
326	39	6
327	39	2
328	39	15
329	39	16
330	40	15
331	40	6
332	41	7
333	42	6
334	42	16
\.


--
-- Name: tracking_project_workers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tracking_project_workers_id_seq', 341, true);


--
-- Data for Name: tracking_recurringactivity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tracking_recurringactivity (id, project_id, activity_type, description, hours, worker_id, owner_id, start_date, end_date, recurrences) FROM stdin;
1	5	9	Riunione di produzione	3.0	1	1	2014-09-01	2014-12-23	RRULE:FREQ=WEEKLY;BYDAY=TU
2	2	6	rendicontazione Filas	4.0	7	7	2014-01-13	2014-04-30	RRULE:FREQ=WEEKLY
5	9	10	redazionale	8.0	6	6	2014-02-01	2014-04-30	RRULE:FREQ=WEEKLY
6	5	10	Gestione amministrativa	20.0	7	7	2014-01-10	2014-08-15	RRULE:FREQ=WEEKLY
7	6	4	verifica siti, import interni, segnalazioni community	4.0	15	6	2014-02-01	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=MO
8	8	5	tagging, priorità, controllo iter, evidenze	8.0	15	6	2014-02-01	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=MO
9	14	4	tagging, dati politici	4.0	15	6	2014-02-01	2014-12-31	RRULE:FREQ=MONTHLY;BYMONTHDAY=1
10	12	5	ricerca dati, publishing openpolitix	12.0	15	6	2014-02-01	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=MO
11	13	5	publishing openblog, condivisioni social, ricerche dati, elaborazione grafici	4.0	15	6	2014-02-01	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=MO
12	9	5	ricerca dati, elaborazione domande, creazione approfondimenti	12.0	15	6	2014-03-01	2014-05-31	RRULE:FREQ=WEEKLY
13	3	4	traduzione progetti	16.0	15	12	2014-06-01	2014-06-30	RRULE:FREQ=WEEKLY
14	2	2	progettazione	10.0	7	7	2014-01-13	2014-07-31	RRULE:FREQ=WEEKLY
15	6	4	aggiornamento politici e gestione community	1.0	6	6	2014-02-01	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=WE
16	8	5	analisi atti	2.0	6	6	2014-02-01	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=WE
19	12	5	ricerca dati, scrittura aritcoli	10.0	6	6	2014-02-01	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=WE
20	13	5	post, newsletter, ricerche	16.0	6	6	2014-02-01	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=WE
21	2	6	coordinamento	8.0	7	7	2014-01-13	2014-07-31	RRULE:FREQ=WEEKLY
22	2	5	analisi per post	1.0	6	7	2014-06-01	2014-12-31	RRULE:FREQ=WEEKLY
23	2	5	analisi per post	2.0	15	7	2014-06-01	2014-12-31	RRULE:FREQ=WEEKLY
24	5	9	riunione settimanale di produzione	3.0	6	7	2014-02-01	2014-12-31	RRULE:FREQ=WEEKLY
27	5	10	contabilità	6.0	13	13	2014-01-06	2014-09-05	RRULE:FREQ=WEEKLY
28	2	10	rendicontazione 	18.0	13	13	2014-02-03	2014-04-25	RRULE:FREQ=WEEKLY
30	1	7	Restyling grafico di pagine del sito, loghi e iconografia 	4.0	9	9	2014-06-18	2014-07-23	RRULE:FREQ=WEEKLY
32	2	7	Progetto grafico sito e widget, analisi responsiveness, verifica html	14.0	9	9	2014-01-27	2014-08-29	RRULE:FREQ=WEEKLY
33	3	7	Progetto grafico sito	6.0	9	9	2014-04-28	2014-07-21	RRULE:FREQ=WEEKLY
34	7	7	Progetto grafico sito e identity	2.0	9	9	2014-01-28	2014-07-31	RRULE:FREQ=WEEKLY
36	9	7	Campagna social e piccoli interventi grafici	2.0	9	9	2014-09-01	2014-05-23	RRULE:FREQ=WEEKLY
37	10	7	Cartella stampa, presentazione, campagna social	3.0	9	9	2014-01-03	2014-03-18	RRULE:FREQ=WEEKLY
38	13	7	Campagne social	3.0	9	9	2014-04-04	2014-04-22	RRULE:FREQ=WEEKLY
39	26	7	Analisi layout	4.0	9	9	2014-03-11	2014-04-16	RRULE:FREQ=WEEKLY
40	29	7	Progetto grafico sito e newsletter, iconografia	3.0	9	9	2014-02-19	2014-03-21	RRULE:FREQ=WEEKLY
41	30	7	Progetto grafico sito	7.0	9	9	2014-08-01	2014-09-05	RRULE:FREQ=WEEKLY
42	31	7	Progetto grafico sito	3.0	9	9	2014-01-13	2014-03-17	RRULE:FREQ=WEEKLY
43	27	7	Analisi casistiche per tool	4.0	9	9	2014-08-04	2014-08-08	RRULE:FREQ=WEEKLY
44	13	7	Restyling sito DEPP	2.0	9	9	2014-07-22	2014-08-01	RRULE:FREQ=WEEKLY
45	17	1	Analisi progetto	2.0	9	9	2014-08-04	2014-08-08	RRULE:FREQ=WEEKLY
46	19	1	Analisi progetto	2.0	9	9	2014-08-04	2014-08-08	RRULE:FREQ=WEEKLY
47	19	1	Analisi progetto	2.0	9	9	2014-08-04	2014-08-08	RRULE:FREQ=WEEKLY
48	1	3	Attività varie	5.0	3	3	2014-06-03	2014-06-25	RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR
49	1	3	Attività varie	5.0	3	3	2014-07-03	2014-07-31	RRULE:FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR
51	13	10	Promozione Openpolis e Lobbying	2.0	7	7	2014-01-13	2014-07-31	RRULE:FREQ=WEEKLY
52	4	10	Attività varie e generali	15.0	1	1	2014-01-13	2014-07-31	RRULE:FREQ=MONTHLY;BYMONTHDAY=28
53	8	3	Attività varie	6.0	1	1	2014-01-13	2014-09-01	RRULE:FREQ=MONTHLY;BYMONTHDAY=28
54	7	6	Gestione infrastrutturale	8.0	1	1	2014-01-13	2014-09-01	RRULE:FREQ=MONTHLY;BYMONTHDAY=28
55	6	6	API, standard Popolo e django-popolo	18.0	1	1	2014-01-13	2014-09-22	RRULE:FREQ=MONTHLY;BYMONTHDAY=28
56	12	3	Attività propedeutiche al deploy (infrastruttura)	12.0	1	1	2014-03-01	2014-07-01	RRULE:FREQ=MONTHLY;BYMONTHDAY=28
57	14	3	Manutenzione ordinaria	11.0	1	1	2014-02-01	2014-07-01	RRULE:FREQ=MONTHLY;BYMONTHDAY=28
58	9	6	Preparazione infrastrutture per Europee	30.0	1	1	2014-03-01	2014-05-01	RRULE:FREQ=MONTHLY;BYMONTHDAY=28
59	31	3	Correzioni minori e gestione infrastruttura	2.0	1	1	2014-01-13	2014-09-22	RRULE:FREQ=MONTHLY;BYMONTHDAY=28
60	1	3	Manutenzione ordinaria ed evolutiva	60.0	1	1	2014-01-13	2014-07-01	RRULE:FREQ=MONTHLY;BYMONTHDAY=28
61	2	3	Sviluppo iniziale	60.0	1	1	2014-03-01	2014-06-01	RRULE:FREQ=MONTHLY;BYMONTHDAY=28
62	1	6	Rapporto con il cliente e rendicontazioni	8.0	8	8	2014-01-01	2014-12-31	RRULE:FREQ=MONTHLY;BYMONTHDAY=10
63	3	6	Progettazione, coordinamento e rapporto con il cliente	18.0	8	8	2014-01-01	2014-08-01	RRULE:FREQ=MONTHLY;BYMONTHDAY=10
64	2	3	Sviluppo piattaforma	8.0	2	2	2014-01-07	2014-06-25	
65	2	5	post	3.0	15	6	2014-06-16	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=MO
66	2	5	post	0.5	6	6	2014-06-13	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=WE
67	16	1	redazione offerta e censimento dati	40.0	8	8	2014-03-01	2014-10-01	RRULE:FREQ=MONTHLY;BYMONTHDAY=10
68	8	3	aggiornamento dati	12.0	8	8	2014-01-01	2014-12-31	RRULE:FREQ=MONTHLY;BYMONTHDAY=10
69	6	3	agg. dati e sviluppo sw	4.0	8	8	2014-01-01	2014-12-31	RRULE:FREQ=MONTHLY;BYMONTHDAY=10
70	7	2	rapporti e progettazione	16.0	8	8	2014-01-01	2014-07-01	RRULE:FREQ=MONTHLY;BYMONTHDAY=10
71	16	9	Riunione Settimanale RTI	2.0	8	8	2014-09-29	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=MO
72	5	8	Mkg	8.0	8	8	2014-01-01	2014-12-31	RRULE:FREQ=MONTHLY;BYMONTHDAY=2
73	5	10	amministrazione varia	12.0	8	8	2014-01-01	2014-12-31	RRULE:FREQ=MONTHLY;BYMONTHDAY=2
74	5	9	Riunione settimanale interna	4.0	8	8	2014-05-01	2014-12-31	RRULE:FREQ=WEEKLY;BYDAY=TU
\.


--
-- Name: tracking_recurringactivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tracking_recurringactivity_id_seq', 74, true);


--
-- Data for Name: tracking_weeklyactivity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tracking_weeklyactivity (id, project_id, activity_type, description, hours, worker_id, owner_id, week) FROM stdin;
1	2	6	coordinamento	10.0	7	7	2014W37
2	2	6	coordinamento	10.0	7	7	2014W35
3	2	6	coordinamento	10.0	7	7	2014W36
5	7	5	testi e comunicazione sito	16.0	6	8	2014W37
6	8	1	indice di produttività	8.0	6	6	2014W37
7	2	2	Indicatori EvaBeta	10.0	7	7	2014W36
8	2	2	Indicatori EvaBeta	10.0	7	7	2014W37
9	2	2	indicatori EvaBeta	16.0	7	7	2014W35
10	2	2	Indicatori EvaBeta	2.0	7	7	2014W38
11	5	10	gestione amministrativa	10.0	7	7	2014W35
12	5	10	Gestione amministrativa	10.0	7	7	2014W36
13	5	10	gestione amministrativa	10.0	7	7	2014W37
14	8	3	Correzione indice di produttività	16.0	1	1	2014W34
15	1	1	Analisi nuove procedure di import	8.0	1	1	2014W35
16	30	2	progettazione	8.0	7	7	2014W32
17	30	2	progettazione	8.0	7	7	2014W36
18	30	2	progettazione	4.0	7	7	2014W37
19	16	3	Implementazione piattaforma survey	16.0	1	1	2014W37
20	5	10	coordinamento	32.0	7	7	2014W39
21	13	0	Tavolo civico	8.0	7	7	2014W39
22	13	10	conferenza	5.0	7	7	2014W40
23	5	10	coordinamento	16.0	7	7	2014W38
24	5	10	contabilità	6.5	13	13	2014W39
25	34	1	HORIZON 2020	16.0	7	7	2014W40
26	5	10	contabilità	7.0	13	13	2014W40
27	5	10	contabilità	8.0	13	13	2014W41
28	5	6	Gestione dei progetti	20.0	1	1	2014W40
29	5	6	Gestione dei progetti	20.0	1	1	2014W41
30	5	10	contabilità	8.5	13	13	2014W42
31	5	10	contabilità	7.0	13	13	2014W43
32	36	6	coordinamento editoriale	4.0	6	6	2014W41
33	36	6	coordinamento editoriale	8.0	6	6	2014W42
34	36	6	coordinamento editoriale	10.0	6	6	2014W43
35	5	10	contabilità	8.0	13	13	2014W44
36	36	6	coordinamento editoriale	16.0	6	6	2014W44
37	36	6	coordinamento editoriale	10.0	6	6	2014W45
38	5	0	riunione ad Internazionale	3.0	6	6	2014W45
39	5	10	contabilità	6.5	13	13	2014W45
40	39	3	Sviluppo prime tre regole (con rifattorizzazione per ottimizzare sviluppo regole successive)	13.0	1	1	2014W46
41	5	6	Attività varie e generali	4.0	1	1	2014W46
42	5	10	contabilità	6.5	13	13	2014W46
43	5	10	contabilità	6.5	13	13	2014W47
44	40	6	Piano editoriale e rapporti con il cliente	8.0	6	6	2014W48
45	40	6	Piano editoriale e rapporti con il cliente	8.0	6	6	2014W47
46	40	6	Piano editoriale e rapporti con il cliente	8.0	6	6	2014W46
47	7	9	indicazione priorità sviluppo	4.0	6	6	2014W48
48	7	0	call con Action Aid	2.0	6	6	2014W48
49	7	0	call con Action Aid	2.0	6	6	2014W47
50	5	10	contabilità	8.0	13	13	2014W48
51	5	10	contabilità	9.0	13	13	2014W49
52	5	10	contabilità	6.5	13	13	2014W50
53	5	10	rendicontazione	8.0	13	13	2014W51
54	5	10	contabilità	8.5	13	13	2015W01
55	5	10	contabilità	12.0	13	13	2015W02
\.


--
-- Name: tracking_weeklyactivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tracking_weeklyactivity_id_seq', 55, true);


--
-- Data for Name: tracking_worker; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tracking_worker (id, user_id, worker_type, contract_type, time_perc) FROM stdin;
1	2	0	1	100
2	3	1	1	100
3	4	1	1	100
4	5	\N	\N	\N
6	7	0	\N	100
7	8	0	1	\N
8	9	0	0	75
9	10	1	1	50
12	1	\N	\N	\N
13	13	1	1	\N
15	14	1	0	100
16	15	1	0	100
\.


--
-- Name: tracking_worker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tracking_worker_id_seq', 16, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: recurrence_date_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recurrence_date
    ADD CONSTRAINT recurrence_date_pkey PRIMARY KEY (id);


--
-- Name: recurrence_param_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recurrence_param
    ADD CONSTRAINT recurrence_param_pkey PRIMARY KEY (id);


--
-- Name: recurrence_recurrence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recurrence_recurrence
    ADD CONSTRAINT recurrence_recurrence_pkey PRIMARY KEY (id);


--
-- Name: recurrence_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recurrence_rule
    ADD CONSTRAINT recurrence_rule_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: tracking_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracking_activity
    ADD CONSTRAINT tracking_activity_pkey PRIMARY KEY (id);


--
-- Name: tracking_project_managers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracking_project_managers
    ADD CONSTRAINT tracking_project_managers_pkey PRIMARY KEY (id);


--
-- Name: tracking_project_managers_project_id_31b74edd_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracking_project_managers
    ADD CONSTRAINT tracking_project_managers_project_id_31b74edd_uniq UNIQUE (project_id, worker_id);


--
-- Name: tracking_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracking_project
    ADD CONSTRAINT tracking_project_pkey PRIMARY KEY (id);


--
-- Name: tracking_project_workers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracking_project_workers
    ADD CONSTRAINT tracking_project_workers_pkey PRIMARY KEY (id);


--
-- Name: tracking_project_workers_project_id_fdf3283_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracking_project_workers
    ADD CONSTRAINT tracking_project_workers_project_id_fdf3283_uniq UNIQUE (project_id, worker_id);


--
-- Name: tracking_recurringactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracking_recurringactivity
    ADD CONSTRAINT tracking_recurringactivity_pkey PRIMARY KEY (id);


--
-- Name: tracking_weeklyactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracking_weeklyactivity
    ADD CONSTRAINT tracking_weeklyactivity_pkey PRIMARY KEY (id);


--
-- Name: tracking_worker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracking_worker
    ADD CONSTRAINT tracking_worker_pkey PRIMARY KEY (id);


--
-- Name: tracking_worker_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tracking_worker
    ADD CONSTRAINT tracking_worker_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: recurrence_date_recurrence_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX recurrence_date_recurrence_id ON recurrence_date USING btree (recurrence_id);


--
-- Name: recurrence_param_rule_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX recurrence_param_rule_id ON recurrence_param USING btree (rule_id);


--
-- Name: recurrence_rule_recurrence_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX recurrence_rule_recurrence_id ON recurrence_rule USING btree (recurrence_id);


--
-- Name: tracking_activity_owner_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_activity_owner_id ON tracking_activity USING btree (owner_id);


--
-- Name: tracking_activity_project_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_activity_project_id ON tracking_activity USING btree (project_id);


--
-- Name: tracking_activity_worker_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_activity_worker_id ON tracking_activity USING btree (worker_id);


--
-- Name: tracking_project_managers_project_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_project_managers_project_id ON tracking_project_managers USING btree (project_id);


--
-- Name: tracking_project_managers_worker_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_project_managers_worker_id ON tracking_project_managers USING btree (worker_id);


--
-- Name: tracking_project_workers_project_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_project_workers_project_id ON tracking_project_workers USING btree (project_id);


--
-- Name: tracking_project_workers_worker_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_project_workers_worker_id ON tracking_project_workers USING btree (worker_id);


--
-- Name: tracking_recurringactivity_owner_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_recurringactivity_owner_id ON tracking_recurringactivity USING btree (owner_id);


--
-- Name: tracking_recurringactivity_project_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_recurringactivity_project_id ON tracking_recurringactivity USING btree (project_id);


--
-- Name: tracking_recurringactivity_worker_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_recurringactivity_worker_id ON tracking_recurringactivity USING btree (worker_id);


--
-- Name: tracking_weeklyactivity_owner_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_weeklyactivity_owner_id ON tracking_weeklyactivity USING btree (owner_id);


--
-- Name: tracking_weeklyactivity_project_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_weeklyactivity_project_id ON tracking_weeklyactivity USING btree (project_id);


--
-- Name: tracking_weeklyactivity_worker_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tracking_weeklyactivity_worker_id ON tracking_weeklyactivity USING btree (worker_id);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: owner_id_refs_id_6abadeb2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_recurringactivity
    ADD CONSTRAINT owner_id_refs_id_6abadeb2 FOREIGN KEY (owner_id) REFERENCES tracking_worker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: owner_id_refs_id_6bfd46f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_activity
    ADD CONSTRAINT owner_id_refs_id_6bfd46f1 FOREIGN KEY (owner_id) REFERENCES tracking_worker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: owner_id_refs_id_9614e274; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_weeklyactivity
    ADD CONSTRAINT owner_id_refs_id_9614e274 FOREIGN KEY (owner_id) REFERENCES tracking_worker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project_id_refs_id_32aca265; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_recurringactivity
    ADD CONSTRAINT project_id_refs_id_32aca265 FOREIGN KEY (project_id) REFERENCES tracking_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project_id_refs_id_92951596; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_activity
    ADD CONSTRAINT project_id_refs_id_92951596 FOREIGN KEY (project_id) REFERENCES tracking_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project_id_refs_id_a0be51ea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_project_managers
    ADD CONSTRAINT project_id_refs_id_a0be51ea FOREIGN KEY (project_id) REFERENCES tracking_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project_id_refs_id_c1e888a5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_project_workers
    ADD CONSTRAINT project_id_refs_id_c1e888a5 FOREIGN KEY (project_id) REFERENCES tracking_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: project_id_refs_id_e2252036; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_weeklyactivity
    ADD CONSTRAINT project_id_refs_id_e2252036 FOREIGN KEY (project_id) REFERENCES tracking_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recurrence_date_recurrence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurrence_date
    ADD CONSTRAINT recurrence_date_recurrence_id_fkey FOREIGN KEY (recurrence_id) REFERENCES recurrence_recurrence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recurrence_param_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurrence_param
    ADD CONSTRAINT recurrence_param_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES recurrence_rule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recurrence_rule_recurrence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurrence_rule
    ADD CONSTRAINT recurrence_rule_recurrence_id_fkey FOREIGN KEY (recurrence_id) REFERENCES recurrence_recurrence(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_30395f57; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_worker
    ADD CONSTRAINT user_id_refs_id_30395f57 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_id_refs_id_6abadeb2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_recurringactivity
    ADD CONSTRAINT worker_id_refs_id_6abadeb2 FOREIGN KEY (worker_id) REFERENCES tracking_worker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_id_refs_id_6bfd46f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_activity
    ADD CONSTRAINT worker_id_refs_id_6bfd46f1 FOREIGN KEY (worker_id) REFERENCES tracking_worker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_id_refs_id_9614e274; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_weeklyactivity
    ADD CONSTRAINT worker_id_refs_id_9614e274 FOREIGN KEY (worker_id) REFERENCES tracking_worker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_id_refs_id_d18ab3dc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_project_managers
    ADD CONSTRAINT worker_id_refs_id_d18ab3dc FOREIGN KEY (worker_id) REFERENCES tracking_worker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: worker_id_refs_id_fe137132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tracking_project_workers
    ADD CONSTRAINT worker_id_refs_id_fe137132 FOREIGN KEY (worker_id) REFERENCES tracking_worker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

