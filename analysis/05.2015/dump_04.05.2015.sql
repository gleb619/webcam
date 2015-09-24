-- SQL Manager 2011 for PostgreSQL 5.0.0.3
-- ---------------------------------------
-- Хост         : 192.168.1.102
-- База данных  : webcam
-- Версия       : PostgreSQL 9.4beta3 on i686-pc-linux-gnu, compiled by gcc (Ubuntu 4.9.1-16ubuntu6) 4.9.1, 32-bit



SET search_path = public, pg_catalog;
DROP VIEW IF EXISTS public.users_view;
DROP VIEW IF EXISTS public.user_roles_view;
DROP VIEW IF EXISTS public.tm_user_info_view;
DROP VIEW IF EXISTS public.settings_view;
DROP VIEW IF EXISTS public.rel_user_settings_view;
DROP VIEW IF EXISTS public.photo_view;
DROP SEQUENCE IF EXISTS public.sq_settings;
DROP SEQUENCE IF EXISTS public.sq_relusersettings;
DROP SEQUENCE IF EXISTS public.sq_photo;
DROP TABLE IF EXISTS public.rel_user_settings;
DROP TABLE IF EXISTS public.settings;
DROP TABLE IF EXISTS public.photo;
DROP SEQUENCE IF EXISTS public.sq_users;
DROP SEQUENCE IF EXISTS public.sq_userroles;
DROP SEQUENCE IF EXISTS public.sq_tmuserinfo;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.user_roles;
DROP TABLE IF EXISTS public.tm_user_info;
SET check_function_bodies = false;
--
-- Structure for table tm_user_info (OID = 52505) : 
--
CREATE TABLE public.tm_user_info (
    id integer NOT NULL,
    createdby varchar(255),
    createon timestamp without time zone,
    firmid integer,
    lastmodifiedby varchar(255),
    modifyon timestamp without time zone,
    serieskey varchar(255),
    version integer,
    label varchar(255),
    browser varchar(255),
    browser_version varchar(255),
    last_login timestamp without time zone,
    platform varchar(255),
    platformversion varchar(255),
    proxy_content varchar(255),
    remote_host varchar(255),
    user_agent varchar(255),
    user_ip_address varchar(255),
    username varchar(255)
) WITHOUT OIDS;
--
-- Structure for table user_roles (OID = 52513) : 
--
CREATE TABLE public.user_roles (
    id integer NOT NULL,
    role varchar(255),
    user_id integer
) WITHOUT OIDS;
--
-- Structure for table users (OID = 52518) : 
--
CREATE TABLE public.users (
    id integer NOT NULL,
    createdby varchar(255),
    createon timestamp without time zone,
    firmid integer,
    lastmodifiedby varchar(255),
    modifyon timestamp without time zone,
    serieskey varchar(255),
    version integer,
    activated boolean,
    activationkey varchar(255),
    email varchar(255),
    enabled boolean,
    firstname varchar(255),
    landingpage varchar(255),
    langkey varchar(255),
    lastname varchar(255),
    password varchar(255),
    username varchar(255) NOT NULL,
    token varchar
) WITHOUT OIDS;
--
-- Definition for sequence sq_tmuserinfo (OID = 52533) : 
--
CREATE SEQUENCE public.sq_tmuserinfo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence sq_userroles (OID = 52535) : 
--
CREATE SEQUENCE public.sq_userroles
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence sq_users (OID = 52537) : 
--
CREATE SEQUENCE public.sq_users
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table photo (OID = 52539) : 
--
CREATE TABLE public.photo (
    id integer NOT NULL,
    name varchar,
    path varchar,
    createdby varchar(255),
    createon timestamp without time zone,
    firmid integer,
    lastmodifiedby varchar(255),
    modifyon timestamp without time zone,
    serieskey varchar(255),
    version integer,
    label varchar(255)
) WITHOUT OIDS;
--
-- Structure for table settings (OID = 52547) : 
--
CREATE TABLE public.settings (
    id integer NOT NULL,
    name varchar,
    value varchar,
    createdby varchar(255),
    createon timestamp without time zone,
    firmid integer,
    lastmodifiedby varchar(255),
    modifyon timestamp without time zone,
    serieskey varchar(255),
    version integer,
    label varchar(255)
) WITHOUT OIDS;
--
-- Structure for table rel_user_settings (OID = 52555) : 
--
CREATE TABLE public.rel_user_settings (
    id integer NOT NULL,
    users_id integer,
    settings_id integer
) WITHOUT OIDS;
--
-- Definition for sequence sq_photo (OID = 52574) : 
--
CREATE SEQUENCE public.sq_photo
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence sq_relusersettings (OID = 52576) : 
--
CREATE SEQUENCE public.sq_relusersettings
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence sq_settings (OID = 52578) : 
--
CREATE SEQUENCE public.sq_settings
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for view photo_view (OID = 52580) : 
--
CREATE VIEW public.photo_view AS
SELECT photo.id,
    photo.version,
    photo.name,
    photo.path,
    photo.createdby,
    photo.createon,
    photo.firmid AS firm,
    photo.lastmodifiedby,
    photo.modifyon,
    photo.serieskey,
    photo.label
FROM photo;

--
-- Definition for view rel_user_settings_view (OID = 52584) : 
--
CREATE VIEW public.rel_user_settings_view AS
SELECT rel_user_settings.id,
    settings0.label AS settings,
    settings0.id AS settingsid,
    (((users1.lastname)::text || ' '::text) || (users1.firstname)::text) AS users,
    users1.id AS usersid
FROM ((rel_user_settings
     LEFT JOIN settings settings0 ON ((rel_user_settings.settings_id =
         settings0.id)))
     LEFT JOIN users users1 ON ((rel_user_settings.users_id = users1.id)));

--
-- Definition for view settings_view (OID = 52589) : 
--
CREATE VIEW public.settings_view AS
SELECT settings.id,
    settings.version,
    settings.name,
    settings.value,
    settings.createdby,
    settings.createon,
    settings.firmid AS firm,
    settings.lastmodifiedby,
    settings.modifyon,
    settings.serieskey,
    settings.label
FROM settings;

--
-- Definition for view tm_user_info_view (OID = 52593) : 
--
CREATE VIEW public.tm_user_info_view AS
SELECT tm_user_info.id,
    tm_user_info.version,
    tm_user_info.createdby,
    tm_user_info.createon,
    tm_user_info.firmid AS firm,
    tm_user_info.lastmodifiedby,
    tm_user_info.modifyon,
    tm_user_info.serieskey,
    tm_user_info.label,
    tm_user_info.browser,
    tm_user_info.browser_version AS browserversion,
    tm_user_info.last_login AS lastlogin,
    tm_user_info.platform,
    tm_user_info.platformversion,
    tm_user_info.proxy_content AS proxycontent,
    tm_user_info.remote_host AS remotehost,
    tm_user_info.user_agent AS useragent,
    tm_user_info.user_ip_address AS useripaddress,
    tm_user_info.username
FROM tm_user_info;

--
-- Definition for view user_roles_view (OID = 52597) : 
--
CREATE VIEW public.user_roles_view AS
SELECT user_roles.id,
    user_roles.role,
    (((users0.lastname)::text || ' '::text) || (users0.firstname)::text) AS users,
    users0.id AS usersid
FROM (user_roles
     LEFT JOIN users users0 ON ((user_roles.user_id = users0.id)));

--
-- Definition for view users_view (OID = 52601) : 
--
CREATE VIEW public.users_view AS
SELECT users.id,
    users.version,
    users.createdby,
    users.createon,
    users.firmid AS firm,
    users.lastmodifiedby,
    users.modifyon,
    users.serieskey,
    users.activated,
    users.activationkey,
    users.email,
    users.enabled,
    users.firstname,
    users.landingpage,
    users.langkey,
    users.lastname,
    users.password,
    users.username,
    users.token
FROM users;

--
-- Data for table public.tm_user_info (OID = 52505) (LIMIT 0,1)
--
INSERT INTO tm_user_info (id, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, label, browser, browser_version, last_login, platform, platformversion, proxy_content, remote_host, user_agent, user_ip_address, username)
VALUES (1, NULL, '2015-05-04 21:34:36.624', 1, NULL, '2015-05-04 21:34:36.624', NULL, 0, NULL, 'Chrome', '44.0.2390.0', '2015-05-04 21:34:36.585', 'Windows', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2390.0 Safari/537.36', '0:0:0:0:0:0:0:1', 'root1');

--
-- Data for table public.user_roles (OID = 52513) (LIMIT 0,9)
--
INSERT INTO user_roles (id, role, user_id)
VALUES (19, 'ROLE_USER', 13);

INSERT INTO user_roles (id, role, user_id)
VALUES (20, 'ROLE_ADMIN', 13);

INSERT INTO user_roles (id, role, user_id)
VALUES (21, 'ROLE_USER', 14);

INSERT INTO user_roles (id, role, user_id)
VALUES (22, 'ROLE_USER', 15);

INSERT INTO user_roles (id, role, user_id)
VALUES (23, 'ROLE_ADMIN', 15);

INSERT INTO user_roles (id, role, user_id)
VALUES (24, 'ROLE_USER', 16);

INSERT INTO user_roles (id, role, user_id)
VALUES (25, 'ROLE_USER', 17);

INSERT INTO user_roles (id, role, user_id)
VALUES (26, 'ROLE_ADMIN', 17);

INSERT INTO user_roles (id, role, user_id)
VALUES (27, 'ROLE_USER', 18);

--
-- Data for table public.users (OID = 52518) (LIMIT 0,6)
--
INSERT INTO users (id, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, activated, activationkey, email, enabled, firstname, landingpage, langkey, lastname, password, username, token)
VALUES (13, NULL, '2015-05-04 20:45:57.679', 1, NULL, '2015-05-04 20:45:57.679', NULL, 0, false, NULL, NULL, true, NULL, NULL, NULL, NULL, '$2a$10$syhT7zTQj1gS5gRjnwrZ/eI8QnEdHPAED0/eZioRVEFIgOv1JNJG6', 'root1', '31999ada52811514c518aa9cc7432677e350e977f555da4f468dfefcff14295a');

INSERT INTO users (id, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, activated, activationkey, email, enabled, firstname, landingpage, langkey, lastname, password, username, token)
VALUES (14, NULL, '2015-05-04 20:45:57.766', 1, NULL, '2015-05-04 20:45:57.766', NULL, 0, false, NULL, NULL, true, NULL, NULL, NULL, NULL, '$2a$10$GHH8aKv4INsUZRTVqyKW9ugMfkcQy9dwVO84cicIBqR0mUjPRoyHG', 'user1', 'b3fcab83cbc4de196b32d6a03f024e5febf0b10a2fdb96deea9d40ad91bf07ce');

INSERT INTO users (id, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, activated, activationkey, email, enabled, firstname, landingpage, langkey, lastname, password, username, token)
VALUES (15, NULL, '2015-05-04 20:45:57.835', 2, NULL, '2015-05-04 20:45:57.835', NULL, 0, false, NULL, NULL, true, NULL, NULL, NULL, NULL, '$2a$10$yb0UPc3I/lmcwb9MLKgTPe0kD7MZMoPxEhXW3IZ485gC5DRKfMdny', 'root2', 'e2e58637b8c9c341038534441a2751319ba80524fd23a4bd3f5e7ea7ce4cfd4c');

INSERT INTO users (id, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, activated, activationkey, email, enabled, firstname, landingpage, langkey, lastname, password, username, token)
VALUES (16, NULL, '2015-05-04 20:45:57.905', 2, NULL, '2015-05-04 20:45:57.905', NULL, 0, false, NULL, NULL, true, NULL, NULL, NULL, NULL, '$2a$10$.z./CJSc/nVhEDKPwsI5peQpbFm3IgKyZp4ubvWMXpiMUYdTuTEAe', 'user2', 'af1bfc8def3da0277e5304e52d823a4349e20fed82b52ca5c1ed709a9fcbdfe0');

INSERT INTO users (id, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, activated, activationkey, email, enabled, firstname, landingpage, langkey, lastname, password, username, token)
VALUES (17, NULL, '2015-05-04 20:45:57.974', 3, NULL, '2015-05-04 20:45:57.974', NULL, 0, false, NULL, NULL, true, NULL, NULL, NULL, NULL, '$2a$10$PS4e0d/8NYtrIL.5xJ8ef.h38PF97d.olLhZd14SvvAFTzWmx8Z3W', 'root3', '2bb544a28953ec1a08f83345b3b445b5bc10b8c8066f7aeb50a3927bbd43c751');

INSERT INTO users (id, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, activated, activationkey, email, enabled, firstname, landingpage, langkey, lastname, password, username, token)
VALUES (18, NULL, '2015-05-04 20:45:58.044', 3, NULL, '2015-05-04 20:45:58.044', NULL, 0, false, NULL, NULL, true, NULL, NULL, NULL, NULL, '$2a$10$szgPiTnBHHynjP8/tCOC2OeDQJcxkpE8QrR64JloH/31S4Z3B/5zC', 'user3', '780325f636854683c986b106725c9dcc2e27fb0dae92a5b3d71f1858d49a3cb9');

--
-- Data for table public.photo (OID = 52539) (LIMIT 0,4)
--
INSERT INTO photo (id, name, path, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, label)
VALUES (1, '1430753871271.jpeg', 'D:/PHOTO/88b47abe-6e23-45d9-82d2-35c5e333d788.jpeg', 'root1', '2015-05-04 21:37:51.727', 1, 'root1', '2015-05-04 21:37:51.762', NULL, 0, '88b47abe-6e23-45d9-82d2-35c5e333d788.jpeg');

INSERT INTO photo (id, name, path, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, label)
VALUES (4, '1430754744270.jpeg', 'D:/PHOTO/af2e6170-22ae-484f-a1f1-31a45b638310.jpeg', 'root1', '2015-05-04 21:52:24.796', 1, 'root1', '2015-05-04 21:52:24.802', NULL, 0, 'af2e6170-22ae-484f-a1f1-31a45b638310.jpeg');

INSERT INTO photo (id, name, path, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, label)
VALUES (5, '1430754749208.jpeg', 'D:/PHOTO/26ab713d-900a-4b56-a41d-d582c8e315a8.jpeg', 'root1', '2015-05-04 21:52:29.27', 1, 'root1', '2015-05-04 21:52:29.27', NULL, 0, '26ab713d-900a-4b56-a41d-d582c8e315a8.jpeg');

INSERT INTO photo (id, name, path, createdby, createon, firmid, lastmodifiedby, modifyon, serieskey, version, label)
VALUES (6, '1430754754206.jpeg', 'D:/PHOTO/b81a7790-c4d1-4680-88fe-ef06718bca21.jpeg', 'root1', '2015-05-04 21:52:34.268', 1, 'root1', '2015-05-04 21:52:34.269', NULL, 0, 'b81a7790-c4d1-4680-88fe-ef06718bca21.jpeg');

--
-- Definition for index tm_user_info_pkey (OID = 52511) : 
--
ALTER TABLE ONLY tm_user_info
    ADD CONSTRAINT tm_user_info_pkey
    PRIMARY KEY (id);
--
-- Definition for index user_roles_pkey (OID = 52516) : 
--
ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey
    PRIMARY KEY (id);
--
-- Definition for index users_pkey (OID = 52524) : 
--
ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey
    PRIMARY KEY (id);
--
-- Definition for index uk_r43af9ap4edm43mmtq01oddj6 (OID = 52526) : 
--
ALTER TABLE ONLY users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6
    UNIQUE (username);
--
-- Definition for index fk_g1uebn6mqk9qiaw45vnacmyo2 (OID = 52528) : 
--
ALTER TABLE ONLY user_roles
    ADD CONSTRAINT fk_g1uebn6mqk9qiaw45vnacmyo2
    FOREIGN KEY (user_id) REFERENCES users(id);
--
-- Definition for index photo_pkey (OID = 52545) : 
--
ALTER TABLE ONLY photo
    ADD CONSTRAINT photo_pkey
    PRIMARY KEY (id);
--
-- Definition for index settings_pkey (OID = 52553) : 
--
ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey
    PRIMARY KEY (id);
--
-- Definition for index rel_user_settings_pkey (OID = 52558) : 
--
ALTER TABLE ONLY rel_user_settings
    ADD CONSTRAINT rel_user_settings_pkey
    PRIMARY KEY (id);
--
-- Definition for index rel_user_settings_fk (OID = 52560) : 
--
ALTER TABLE ONLY rel_user_settings
    ADD CONSTRAINT rel_user_settings_fk
    FOREIGN KEY (users_id) REFERENCES users(id);
--
-- Definition for index rel_user_settings_fk1 (OID = 52565) : 
--
ALTER TABLE ONLY rel_user_settings
    ADD CONSTRAINT rel_user_settings_fk1
    FOREIGN KEY (settings_id) REFERENCES settings(id);
--
-- Data for sequence public.sq_tmuserinfo (OID = 52533)
--
SELECT pg_catalog.setval('sq_tmuserinfo', 1, true);
--
-- Data for sequence public.sq_userroles (OID = 52535)
--
SELECT pg_catalog.setval('sq_userroles', 27, true);
--
-- Data for sequence public.sq_users (OID = 52537)
--
SELECT pg_catalog.setval('sq_users', 18, true);
--
-- Data for sequence public.sq_photo (OID = 52574)
--
SELECT pg_catalog.setval('sq_photo', 10, true);
--
-- Data for sequence public.sq_relusersettings (OID = 52576)
--
SELECT pg_catalog.setval('sq_relusersettings', 1, false);
--
-- Data for sequence public.sq_settings (OID = 52578)
--
SELECT pg_catalog.setval('sq_settings', 1, false);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
