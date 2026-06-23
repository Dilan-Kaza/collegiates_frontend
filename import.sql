-- Adminer 5.4.2 PostgreSQL 17.10 dump

DROP TABLE IF EXISTS "auth_group";
CREATE TABLE "public"."auth_group" (
    "id" integer DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "name" character varying(150) NOT NULL,
    CONSTRAINT "auth_group_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX auth_group_name_key ON public.auth_group USING btree (name);

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


DROP TABLE IF EXISTS "auth_group_permissions";
CREATE TABLE "public"."auth_group_permissions" (
    "id" bigint DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "auth_group_permissions_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX auth_group_permissions_group_id_permission_id_0cd325b0_uniq ON public.auth_group_permissions USING btree (group_id, permission_id);

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


DROP TABLE IF EXISTS "auth_permission";
CREATE TABLE "public"."auth_permission" (
    "id" integer DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL,
    CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX auth_permission_content_type_id_codename_01ab375a_uniq ON public.auth_permission USING btree (content_type_id, codename);

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);

INSERT INTO "auth_permission" ("id", "name", "content_type_id", "codename") VALUES
(1,	'Can add blog',	1,	'add_blog'),
(2,	'Can change blog',	1,	'change_blog'),
(3,	'Can delete blog',	1,	'delete_blog'),
(4,	'Can view blog',	1,	'view_blog'),
(5,	'Can add college',	2,	'add_college'),
(6,	'Can change college',	2,	'change_college'),
(7,	'Can delete college',	2,	'delete_college'),
(8,	'Can view college',	2,	'view_college'),
(9,	'Can add event',	3,	'add_event'),
(10,	'Can change event',	3,	'change_event'),
(11,	'Can delete event',	3,	'delete_event'),
(12,	'Can view event',	3,	'view_event'),
(13,	'Can add user',	8,	'add_user'),
(14,	'Can change user',	8,	'change_user'),
(15,	'Can delete user',	8,	'delete_user'),
(16,	'Can view user',	8,	'view_user'),
(17,	'Can add groupset',	4,	'add_groupset'),
(18,	'Can change groupset',	4,	'change_groupset'),
(19,	'Can delete groupset',	4,	'delete_groupset'),
(20,	'Can view groupset',	4,	'view_groupset'),
(21,	'Can add groupset member',	5,	'add_groupsetmember'),
(22,	'Can change groupset member',	5,	'change_groupsetmember'),
(23,	'Can delete groupset member',	5,	'delete_groupsetmember'),
(24,	'Can view groupset member',	5,	'view_groupsetmember'),
(25,	'Can add settings',	7,	'add_settings'),
(26,	'Can change settings',	7,	'change_settings'),
(27,	'Can delete settings',	7,	'delete_settings'),
(28,	'Can view settings',	7,	'view_settings'),
(29,	'Can add registration',	6,	'add_registration'),
(30,	'Can change registration',	6,	'change_registration'),
(31,	'Can delete registration',	6,	'delete_registration'),
(32,	'Can view registration',	6,	'view_registration'),
(33,	'Can add log entry',	9,	'add_logentry'),
(34,	'Can change log entry',	9,	'change_logentry'),
(35,	'Can delete log entry',	9,	'delete_logentry'),
(36,	'Can view log entry',	9,	'view_logentry'),
(37,	'Can add permission',	11,	'add_permission'),
(38,	'Can change permission',	11,	'change_permission'),
(39,	'Can delete permission',	11,	'delete_permission'),
(40,	'Can view permission',	11,	'view_permission'),
(41,	'Can add group',	10,	'add_group'),
(42,	'Can change group',	10,	'change_group'),
(43,	'Can delete group',	10,	'delete_group'),
(44,	'Can view group',	10,	'view_group'),
(45,	'Can add content type',	12,	'add_contenttype'),
(46,	'Can change content type',	12,	'change_contenttype'),
(47,	'Can delete content type',	12,	'delete_contenttype'),
(48,	'Can view content type',	12,	'view_contenttype'),
(49,	'Can add session',	13,	'add_session'),
(50,	'Can change session',	13,	'change_session'),
(51,	'Can delete session',	13,	'delete_session'),
(52,	'Can view session',	13,	'view_session'),
(53,	'Can add Token',	14,	'add_token'),
(54,	'Can change Token',	14,	'change_token'),
(55,	'Can delete Token',	14,	'delete_token'),
(56,	'Can view Token',	14,	'view_token'),
(57,	'Can add Token',	15,	'add_tokenproxy'),
(58,	'Can change Token',	15,	'change_tokenproxy'),
(59,	'Can delete Token',	15,	'delete_tokenproxy'),
(60,	'Can view Token',	15,	'view_tokenproxy'),
(61,	'Can add Blacklisted Token',	16,	'add_blacklistedtoken'),
(62,	'Can change Blacklisted Token',	16,	'change_blacklistedtoken'),
(63,	'Can delete Blacklisted Token',	16,	'delete_blacklistedtoken'),
(64,	'Can view Blacklisted Token',	16,	'view_blacklistedtoken'),
(65,	'Can add Outstanding Token',	17,	'add_outstandingtoken'),
(66,	'Can change Outstanding Token',	17,	'change_outstandingtoken'),
(67,	'Can delete Outstanding Token',	17,	'delete_outstandingtoken'),
(68,	'Can view Outstanding Token',	17,	'view_outstandingtoken');

DROP TABLE IF EXISTS "authtoken_token";
CREATE TABLE "public"."authtoken_token" (
    "key" character varying(40) NOT NULL,
    "created" timestamptz NOT NULL,
    "user_id" uuid NOT NULL,
    CONSTRAINT "authtoken_token_pkey" PRIMARY KEY ("key")
)
WITH (oids = false);

CREATE UNIQUE INDEX authtoken_token_user_id_key ON public.authtoken_token USING btree (user_id);

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


DROP TABLE IF EXISTS "blog";
CREATE TABLE "public"."blog" (
    "blog_id" uuid NOT NULL,
    "date_created" timestamptz NOT NULL,
    "author" character varying(255) NOT NULL,
    "category" character varying(255) NOT NULL,
    "title" character varying(255) NOT NULL,
    "blog_content" text NOT NULL,
    CONSTRAINT "blog_pkey" PRIMARY KEY ("blog_id")
)
WITH (oids = false);


DROP TABLE IF EXISTS "colleges";
CREATE TABLE "public"."colleges" (
    "college_id" uuid NOT NULL,
    "college_name" character varying(255) NOT NULL,
    CONSTRAINT "colleges_pkey" PRIMARY KEY ("college_id")
)
WITH (oids = false);

CREATE UNIQUE INDEX colleges_college_name_key ON public.colleges USING btree (college_name);

CREATE INDEX colleges_college_name_f4170216_like ON public.colleges USING btree (college_name varchar_pattern_ops);

INSERT INTO "colleges" ("college_id", "college_name") VALUES
('1d5f98f6-361d-492e-9783-e493193512a8',	'U Maryland: College Park'),
('43380dfa-54e8-4c02-a994-640a49990aa5',	'Columbia U'),
('b5b23fe8-0156-44b1-a9f4-15e777de64b6',	'UC Berkeley'),
('980b8e46-13ac-4a0b-96b1-051c4fd0d68f',	'Cornell U'),
('9bacde23-1217-4f80-8164-928c4f5784aa',	'Georgia Tech'),
('d44f01fb-af9c-4171-ad17-6d0f7a5cb0da',	'Harvard U'),
('0221a4c1-d9e4-4d1c-b59b-cb5761cd2086',	'Northern Arizona U'),
('01b00da2-5dad-46f4-a136-755d84f5b091',	'Ohio State U'),
('4cbde0f7-338e-408a-becd-fdd5d0957391',	'San Jose State U'),
('08f759b9-8fd1-487c-a93f-9ce54bbcd1c3',	'Stanford U'),
('44f2729a-db4b-4991-b05a-c832afe975f5',	'UC Irvine'),
('dc3c57f5-a8d4-475c-9874-75591d4eca82',	'UC Los Angeles'),
('4b3f9407-1fa5-47c9-b491-7bc6d61945cd',	'U Houston'),
('6813c3f7-b275-47a6-9987-69b1fff746fe',	'U Maryland: Baltimore County'),
('30bcc118-4dfe-4c9a-b3aa-5a24612ada5a',	'U North Carolina'),
('c3adeaaa-d764-40f3-a95e-99f2a4a68f8e',	'U Oregon'),
('7e0dc253-712f-422d-9ca0-3dc2fb0bd917',	'U Texas'),
('33853e33-2efe-4509-9e44-4807be9590b3',	'U Virginia'),
('cc8187e7-ea27-4505-b378-b8b108a7ab32',	'U Washington'),
('345fbcca-2a58-41af-b5de-e15d270696d0',	'Virginia Tech'),
('8ae65f87-cf4e-453b-b446-9eeccf920879',	'Yale U'),
('5b85dbf5-3faa-440a-89db-061cc7d8dcc5',	'Wellesley U'),
('1fd8089f-6323-4fcb-a309-8f0329229eb4',	'UC San Diego'),
('19261e31-f2e0-4518-ac2d-5047ccbe39bc',	'UC Davis'),
('abdf5e98-e52e-427d-a23a-4800a4a362ed',	'U Southern California'),
('7d7e4d26-4088-4c6f-97a5-40e23b4c084c',	'Cal Poly Pomona'),
('4ecf79a3-b501-4349-b76c-13de525338f1',	'UC Merced'),
('c64e865a-6e2c-46ef-8ac4-d40111b6e392',	'California State U, Fullerton'),
('f2db22e2-1f63-49d2-9aec-df7b6e075368',	'Palmer College of Chiropractic West'),
('1c757efc-9e40-43c0-aaaf-4f55f904464a',	'Santa Monica College'),
('020063fd-9757-42ea-99fd-44d3784cb511',	'East Lost Angeles College'),
('e5814a7b-99a1-488b-a09b-2fb1d2a2868a',	'UC San Francisco'),
('f7a11c15-4d84-4ba7-a238-b11b1374a876',	'UC Santa Cruz'),
('ea846755-73a2-4379-b726-52b028c58766',	'Pasadena City College'),
('fc36e8c3-e7b7-4afb-be1a-3161634fb442',	'Portland Community College'),
('3bfb8459-d149-4a3f-9149-7ab357b59611',	'UC Santa Barbara'),
('76f7491c-f59b-48d8-a702-740935ae2b92',	'U Pennsylvania'),
('4c110454-605d-43db-9986-5315b1375fb5',	'Berklee College of Music'),
('a20b7eee-11a4-45c1-b1d7-ce15a032e741',	'U Maryland: Baltimore'),
('de20de44-a9eb-424c-aa48-7f71e6f82b8a',	'Santa Rosa Junior College'),
('032ec959-4ec5-4436-86d5-55311b26972f',	'Georgetown University'),
('ac85591c-4590-4d6c-b437-f9f4b9523eae',	'U Nebraska, Kearney'),
('c46a8ad7-e4a0-4e2e-81bc-841deb1d8c3f',	'Pacific College of Oriental Medicine'),
('701204ff-ca51-4c2f-94da-07b107426aad',	'UC Riverside'),
('c64876ea-e7f8-4127-8297-d07559f86328',	'U Maryland: University College'),
('27606374-851c-4638-9ca1-e394cb01529a',	'California College of the Arts'),
('8f4566d1-d467-40cb-8e1e-239321c90a48',	'Arizona State U'),
('688af74a-6e15-4650-8b95-d2053a95cf59',	'U Hawaii - Maui College'),
('ad7c7547-f326-41f1-907a-a57f7cfa4cb4',	'Leeward Community College'),
('5141dfd6-1b47-4eea-8c4a-59721722fb7f',	'Kapi''olani Community College'),
('5bb9df77-b4eb-4555-b3eb-b6a7d1d34d03',	'U Hawaii - Manoa'),
('f20ee895-c8df-4cb9-8b8e-982475e59120',	'U Hawaii - West Oahu'),
('6cd2d6b6-601e-4d02-9828-840c3c8a822b',	'Carnegie Mellon U'),
('ce1b575a-f5d6-4290-9dd3-d9f93c75131d',	'U Pittsburgh'),
('2bb8c0aa-fea8-4480-a474-dc10e6831ffd',	'Virginia Commonwealth U'),
('44d737bb-d6d5-4953-bd0e-c67ce142c052',	'Point Park University'),
('2190fd90-2151-4145-8378-858c655df465',	'Massachusetts Institute of Technology'),
('796b98b7-0c6d-4618-9180-7827d3c1c5df',	'Bentley University'),
('8424ef5e-2a34-40bb-b676-a797d452462a',	'Rutgers U - New Brunswick'),
('0baa3a9c-60f5-4df1-affc-0f31db245641',	'U Illinois Urbana-Champaign'),
('c5c8b549-e06d-4f06-99a7-ee604b063a6e',	'Saint Peter''s University'),
('0017a614-b249-468b-aa4b-d8ee400e91ea',	'College of Staten Island'),
('06697a84-6dfa-4c18-b27a-b3bb5a7b41d7',	'Seattle Central College'),
('999615a0-681c-4697-963e-9eaf6dde2b76',	'San Francisco State U'),
('c346281e-3ba3-472f-8f2b-7d1375530b7f',	'Bastyr U'),
('18500864-fb00-48c3-9b56-be64c546fa04',	'Central Washington U'),
('497242a7-8ba2-4673-88fb-c0ced8375761',	'San Diego Miramar College'),
('ba6e833c-94d5-4018-9449-d041af6931b7',	'California State U, Long Beach'),
('098f6387-c59d-4213-b0d3-69f31042d638',	'SUNY Stony Brook '),
('2f5b755d-1272-4359-9b33-176c3394855f',	'New York U'),
('0ec397ea-f69f-400f-add0-5185458f4f1d',	'Maryland Institute College of Art'),
('6edcc68a-e84b-4db5-ad03-289ad81d35f4',	'Cosumnes River College'),
('5cddc13a-f5d0-4794-967e-431732b90fa3',	'West Coast University'),
('3d95d1c4-95e1-42c0-98b7-6d52182cf4c3',	'U Oklahoma'),
('e0a78905-567e-47ea-8aca-b85c4c93eed3',	'Univ of Oklahoma'),
('db27883d-7166-4ba9-8425-a22ca8969dbd',	'George Mason U'),
('1b75e0e3-cdce-4010-b1fa-6c696492798d',	'Chapman Univ'),
('ca9251cf-4399-4f87-b9f4-ea4b64d1695c',	'SUNY Empire State College'),
('f5c88b27-1f98-4662-9287-1c6cef4b9731',	'U Chicago'),
('3c70b9f7-bcf0-4a8a-a766-1275c34184ae',	'University of Alaska Southeast'),
('72e78cc9-7f97-48e1-98e6-93a029b93bea',	'Northeastern University'),
('0fa76886-9262-4200-b0df-94a4a98ac40f',	'San Diego State University'),
('d65046bd-757c-4615-a197-67b1a2564b6f',	'Case Western Reserve University'),
('174ff43d-c9e9-438e-bf52-28f3e2ae87ac',	'Berkeley City College'),
('d17bf650-53ba-4522-aa55-d838ef52e372',	'New Jersey Institute of Technology'),
('516d7666-38ab-458b-be51-c959931737af',	'Boston University'),
('b50d82d4-70c8-4f93-9115-0a1ac5492551',	'The Juilliard School');

DROP TABLE IF EXISTS "django_admin_log";
CREATE TABLE "public"."django_admin_log" (
    "id" integer DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "action_time" timestamptz NOT NULL,
    "object_id" text,
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" text NOT NULL,
    "content_type_id" integer,
    "user_id" uuid NOT NULL,
    CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "django_admin_log_action_flag_check" CHECK ((action_flag >= 0))
)
WITH (oids = false);

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);

INSERT INTO "django_admin_log" ("id", "action_time", "object_id", "object_repr", "action_flag", "change_message", "content_type_id", "user_id") VALUES
(1,	'2026-06-10 05:45:00.330045+00',	'd75de271-bf23-4d72-9ea5-4115c4f4058a',	'Dilan Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(2,	'2026-06-10 05:45:54.979205+00',	'b84f8c57-0e64-4ebb-b20e-888bbbf22180',	'Dilan Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(3,	'2026-06-10 05:47:03.69286+00',	'6cb8718f-3bf0-4ec4-8886-ef9057437207',	'Dilan Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(4,	'2026-06-10 05:49:24.235271+00',	'e21a73bc-a0c5-49fe-98b9-4718985002ce',	'Dilan Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(5,	'2026-06-10 05:50:51.011881+00',	'43a3efe0-0d7a-4614-9acf-5b868b7f9985',	'Dilan Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(6,	'2026-06-10 05:52:28.011444+00',	'2afdb9fd-d772-484b-a8de-aa5dc103ac3d',	'Dilan2 Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(7,	'2026-06-10 05:53:30.118423+00',	'faa2340f-9374-4fa1-850f-e3e204b6dbfe',	'Dilan2 Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(8,	'2026-06-10 05:57:32.498849+00',	'690b721f-e769-409b-874e-477bb27085cc',	'Dilan2 Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(9,	'2026-06-15 22:43:42.102371+00',	'b2005ce4-69f0-45a9-8fa8-768244825507',	'Dilan Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(10,	'2026-06-15 23:52:10.868896+00',	'ee1cd8f7-11ee-4fbc-ac77-ae64d5330a13',	'Dilan2 Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(11,	'2026-06-16 00:02:44.670751+00',	'a094d703-cfa9-4998-aafa-ce370625c906',	'Dilan Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(12,	'2026-06-16 17:34:54.930348+00',	'1ca43ecc-590d-46a6-9d22-7fe1637b74f8',	'Dilan2 Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(13,	'2026-06-16 22:24:26.81676+00',	'c81da384-e468-4b23-ac4e-0620d5b70cf8',	'Dilan2 Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4'),
(14,	'2026-06-19 01:15:22.442369+00',	'7aa60c37-b221-4cb4-b34b-da26e693e54a',	'Dilan2 Kaza',	3,	'',	8,	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4');

DROP TABLE IF EXISTS "django_content_type";
CREATE TABLE "public"."django_content_type" (
    "id" integer DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL,
    CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX django_content_type_app_label_model_76bd3d3b_uniq ON public.django_content_type USING btree (app_label, model);

INSERT INTO "django_content_type" ("id", "app_label", "model") VALUES
(1,	'collegiates_app',	'blog'),
(2,	'collegiates_app',	'college'),
(3,	'collegiates_app',	'event'),
(4,	'collegiates_app',	'groupset'),
(5,	'collegiates_app',	'groupsetmember'),
(6,	'collegiates_app',	'registration'),
(7,	'collegiates_app',	'settings'),
(8,	'collegiates_app',	'user'),
(9,	'admin',	'logentry'),
(10,	'auth',	'group'),
(11,	'auth',	'permission'),
(12,	'contenttypes',	'contenttype'),
(13,	'sessions',	'session'),
(14,	'authtoken',	'token'),
(15,	'authtoken',	'tokenproxy'),
(16,	'token_blacklist',	'blacklistedtoken'),
(17,	'token_blacklist',	'outstandingtoken');

DROP TABLE IF EXISTS "django_migrations";
CREATE TABLE "public"."django_migrations" (
    "id" bigint DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamptz NOT NULL,
    CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

INSERT INTO "django_migrations" ("id", "app", "name", "applied") VALUES
(1,	'contenttypes',	'0001_initial',	'2026-06-02 17:42:24.684291+00'),
(2,	'contenttypes',	'0002_remove_content_type_name',	'2026-06-02 17:42:24.687114+00'),
(3,	'auth',	'0001_initial',	'2026-06-02 17:42:24.695862+00'),
(4,	'auth',	'0002_alter_permission_name_max_length',	'2026-06-02 17:42:24.697648+00'),
(5,	'auth',	'0003_alter_user_email_max_length',	'2026-06-02 17:42:24.699454+00'),
(6,	'auth',	'0004_alter_user_username_opts',	'2026-06-02 17:42:24.701762+00'),
(7,	'auth',	'0005_alter_user_last_login_null',	'2026-06-02 17:42:24.704774+00'),
(8,	'auth',	'0006_require_contenttypes_0002',	'2026-06-02 17:42:24.705959+00'),
(9,	'auth',	'0007_alter_validators_add_error_messages',	'2026-06-02 17:42:24.708843+00'),
(10,	'auth',	'0008_alter_user_username_max_length',	'2026-06-02 17:42:24.71088+00'),
(11,	'auth',	'0009_alter_user_last_name_max_length',	'2026-06-02 17:42:24.712926+00'),
(12,	'auth',	'0010_alter_group_name_max_length',	'2026-06-02 17:42:24.715594+00'),
(13,	'auth',	'0011_update_proxy_permissions',	'2026-06-02 17:42:24.717649+00'),
(14,	'auth',	'0012_alter_user_first_name_max_length',	'2026-06-02 17:42:24.719478+00'),
(15,	'collegiates_app',	'0001_initial',	'2026-06-02 17:42:24.753007+00'),
(16,	'admin',	'0001_initial',	'2026-06-02 17:42:24.759667+00'),
(17,	'admin',	'0002_logentry_remove_auto_add',	'2026-06-02 17:42:24.762757+00'),
(18,	'admin',	'0003_logentry_add_action_flag_choices',	'2026-06-02 17:42:24.766271+00'),
(19,	'sessions',	'0001_initial',	'2026-06-02 17:42:24.769213+00'),
(20,	'authtoken',	'0001_initial',	'2026-06-05 23:16:27.177593+00'),
(21,	'authtoken',	'0002_auto_20160226_1747',	'2026-06-05 23:16:27.190003+00'),
(22,	'authtoken',	'0003_tokenproxy',	'2026-06-05 23:16:27.191451+00'),
(23,	'authtoken',	'0004_alter_tokenproxy_options',	'2026-06-05 23:16:27.193353+00'),
(24,	'token_blacklist',	'0001_initial',	'2026-06-05 23:16:27.205455+00'),
(25,	'token_blacklist',	'0002_outstandingtoken_jti_hex',	'2026-06-05 23:16:27.209359+00'),
(26,	'token_blacklist',	'0003_auto_20171017_2007',	'2026-06-05 23:16:27.214958+00'),
(27,	'token_blacklist',	'0004_auto_20171017_2013',	'2026-06-05 23:16:27.220305+00'),
(28,	'token_blacklist',	'0005_remove_outstandingtoken_jti',	'2026-06-05 23:16:27.225209+00'),
(29,	'token_blacklist',	'0006_auto_20171017_2113',	'2026-06-05 23:16:27.230388+00'),
(30,	'token_blacklist',	'0007_auto_20171017_2214',	'2026-06-05 23:16:27.24688+00'),
(31,	'token_blacklist',	'0008_migrate_to_bigautofield',	'2026-06-05 23:16:27.260074+00'),
(32,	'token_blacklist',	'0010_fix_migrate_to_bigautofield',	'2026-06-05 23:16:27.268765+00'),
(33,	'token_blacklist',	'0011_linearizes_history',	'2026-06-05 23:16:27.270005+00'),
(34,	'token_blacklist',	'0012_alter_outstandingtoken_user',	'2026-06-05 23:16:27.274335+00'),
(35,	'token_blacklist',	'0013_alter_blacklistedtoken_options_and_more',	'2026-06-05 23:16:27.279175+00');

DROP TABLE IF EXISTS "django_session";
CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" text NOT NULL,
    "expire_date" timestamptz NOT NULL,
    CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key")
)
WITH (oids = false);

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);

INSERT INTO "django_session" ("session_key", "session_data", "expire_date") VALUES
('3g7812hx7h72r41y1cmo5gxi56onwq8a',	'.eJxVy7sOgkAQheF32VrIuBdn1tLCyncgc1kENZCIVMZ3Fw2Ftv8539M1PD-6Zp7KvenN7V1bBJG2UBURrSIYVUwZKg3MZCi-aHSbXyas1zJ8rF3GJdTfaa1TfRrP_XDsy80O6_FPdzx1C_UmyRi1RQxMO2Ai8j6LAWCiFjll9CkkjMsJFMwX8hpTDsBKQdzrDZ_mQFo:1wVwQ4:JGx9xkZF2k4mcfT6a35y1Co5cnhxmjMwXn0p-6BfIi4',	'2026-06-20 19:10:56.433644+00'),
('unf9mqetglm04qobl1upbmj0w4rd3v53',	'.eJxVy7sOgkAQheF32VrIuBdn1tLCyncgc1kENZCIVMZ3Fw2Ftv8539M1PD-6Zp7KvenN7V1bBJG2UBURrSIYVUwZKg3MZCi-aHSbXyas1zJ8rF3GJdTfaa1TfRrP_XDsy80O6_FPdzx1C_UmyRi1RQxMO2Ai8j6LAWCiFjll9CkkjMsJFMwX8hpTDsBKQdzrDZ_mQFo:1wXBjx:EL7ihnUpIOn1VITC3HHLm_0BaUJuz8T8M2lJHE8VZYw',	'2026-06-24 05:44:37.179863+00'),
('kwnfu5hh9cfg351t0l2kk7573zdx3yyd',	'.eJxVy7sOgkAQheF32VrIuBdn1tLCyncgc1kENZCIVMZ3Fw2Ftv8539M1PD-6Zp7KvenN7V1bBJG2UBURrSIYVUwZKg3MZCi-aHSbXyas1zJ8rF3GJdTfaa1TfRrP_XDsy80O6_FPdzx1C_UmyRi1RQxMO2Ai8j6LAWCiFjll9CkkjMsJFMwX8hpTDsBKQdzrDZ_mQFo:1wZG1Y:b8JtO1CncE-2Kn_6by154w22LO7mnN9062WdXrRUbSQ',	'2026-06-29 22:43:20.329295+00'),
('8wanmgrf293tpbevzwnkggq8tw2sob55',	'.eJxVy7sOgkAQheF32VrIuBdn1tLCyncgc1kENZCIVMZ3Fw2Ftv8539M1PD-6Zp7KvenN7V1bBJG2UBURrSIYVUwZKg3MZCi-aHSbXyas1zJ8rF3GJdTfaa1TfRrP_XDsy80O6_FPdzx1C_UmyRi1RQxMO2Ai8j6LAWCiFjll9CkkjMsJFMwX8hpTDsBKQdzrDZ_mQFo:1wZY8h:JpHh7FLOYn9zuA3Stnegi7x1cJJreJ6ePnTfB_LgIVQ',	'2026-06-30 18:03:55.077785+00');

DROP TABLE IF EXISTS "events";
CREATE TABLE "public"."events" (
    "event_code" character varying(50) NOT NULL,
    "event_name" character varying(255) NOT NULL,
    "event_level" character varying(1) NOT NULL,
    "gender_category" character varying(1) NOT NULL,
    "is_nandu" boolean NOT NULL,
    CONSTRAINT "events_pkey" PRIMARY KEY ("event_code")
)
WITH (oids = false);

CREATE UNIQUE INDEX events_event_name_key ON public.events USING btree (event_name);

CREATE INDEX events_event_code_2d5a890e_like ON public.events USING btree (event_code varchar_pattern_ops);

CREATE INDEX events_event_name_83ed1fb8_like ON public.events USING btree (event_name varchar_pattern_ops);

INSERT INTO "events" ("event_code", "event_name", "event_level", "gender_category", "is_nandu") VALUES
('NFN111',	'Advanced Female Nandu Longfist',	'A',	'F',	'1'),
('NMN111',	'Advanced Male Nandu Longfist',	'A',	'M',	'1'),
('NFN112',	'Advanced Female Nandu Southern Fist',	'A',	'F',	'1'),
('NMN112',	'Advanced Male Nandu Southern Fist',	'A',	'M',	'1'),
('NFN311',	'Advanced Female Nandu Taiji Barehand',	'A',	'F',	'1'),
('NMN311',	'Advanced Male Nandu Taiji Barehand',	'A',	'M',	'1'),
('AFA101',	'Advanced Female Longfist',	'A',	'F',	'0'),
('AMA101',	'Advanced Male Longfist',	'A',	'M',	'0'),
('AFA102',	'Advanced Female Southern Fist',	'A',	'F',	'0'),
('AMA102',	'Advanced Male Southern Fist',	'A',	'M',	'0'),
('AFA121',	'Advanced Female Straightsword',	'A',	'F',	'0'),
('AMA121',	'Advanced Male Straightsword',	'A',	'M',	'0'),
('AFA122',	'Advanced Female Broadsword',	'A',	'F',	'0'),
('AMA122',	'Advanced Male Broadsword',	'A',	'M',	'0'),
('AFA123',	'Advanced Female Southern Broadsword',	'A',	'F',	'0'),
('AMA123',	'Advanced Male Southern Broadsword',	'A',	'M',	'0'),
('AFA141',	'Advanced Female Spear',	'A',	'F',	'0'),
('AMA141',	'Advanced Male Spear',	'A',	'M',	'0'),
('AFA142',	'Advanced Female Staff',	'A',	'F',	'0'),
('AMA142',	'Advanced Male Staff',	'A',	'M',	'0'),
('AFA143',	'Advanced Female Southern Staff',	'A',	'F',	'0'),
('AMA143',	'Advanced Male Southern Staff',	'A',	'M',	'0'),
('AMF201',	'Advanced Female Traditional Open Barehand',	'A',	'F',	'0'),
('AMA201',	'Advanced Male Traditional Open Barehand',	'A',	'M',	'0'),
('AFA221',	'Advanced Female Traditional Short Weapon',	'A',	'F',	'0'),
('AMA221',	'Advanced Male Traditional Short Weapon',	'A',	'M',	'0'),
('AFA241',	'Advanced Female Traditional Long Weapon',	'A',	'F',	'0'),
('AMA241',	'Advanced Male Traditional Long Weapon',	'A',	'M',	'0'),
('AFA281',	'Advanced Female Traditional Soft Weapon',	'A',	'F',	'0'),
('AMA281',	'Advanced Male Traditional Soft Weapon',	'A',	'M',	'0'),
('AFA181',	'Advanced Female Other Weapon',	'A',	'F',	'0'),
('AMA181',	'Advanced Male Other Weapon',	'A',	'M',	'0'),
('AFA321',	'Advanced Female Taiji 24',	'A',	'F',	'0'),
('AMA321',	'Advanced Male Taiji 24',	'A',	'M',	'0'),
('AFA322',	'Advanced Female Yang',	'A',	'F',	'0'),
('AMA322',	'Advanced Male Yang',	'A',	'M',	'0'),
('AFA323',	'Advanced Female Chen',	'A',	'F',	'0'),
('AMA323',	'Advanced Male Chen',	'A',	'M',	'0'),
('AFA301',	'Advanced Female 42 Fist',	'A',	'F',	'0'),
('AMA301',	'Advanced Male 42 Fist',	'A',	'M',	'0'),
('AFA302',	'Advanced Female 42 Sword',	'A',	'F',	'0'),
('AMA302',	'Advanced Male 42 Sword',	'A',	'M',	'0'),
('AFA341',	'Advanced Female Taiji Weapon',	'A',	'F',	'0'),
('AMA341',	'Advanced Male Taiji Weapon',	'A',	'M',	'0'),
('AFA361',	'Advanced Female Internal Open Barehand',	'A',	'F',	'0'),
('AMA361',	'Advanced Male Internal Open Barehand',	'A',	'M',	'0'),
('AFA381',	'Advanced Female Internal Open Weapon',	'A',	'F',	'0'),
('AMA381',	'Advanced Male Internal Open Weapon',	'A',	'M',	'0'),
('IFA101',	'Intermediate Female Longfist',	'I',	'F',	'0'),
('IMA101',	'Intermediate Male Longfist',	'I',	'M',	'0'),
('IFA102',	'Intermediate Female Southern Fist',	'I',	'F',	'0'),
('IMA102',	'Intermediate Male Southern Fist',	'I',	'M',	'0'),
('IFA121',	'Intermediate Female Straightsword',	'I',	'F',	'0'),
('IMA121',	'Intermediate Male Straightsword',	'I',	'M',	'0'),
('IFA122',	'Intermediate Female Broadsword',	'I',	'F',	'0'),
('IMA122',	'Intermediate Male Broadsword',	'I',	'M',	'0'),
('IFA123',	'Intermediate Female Southern Broadsword',	'I',	'F',	'0'),
('IMA123',	'Intermediate Male Southern Broadsword',	'I',	'M',	'0'),
('IFA141',	'Intermediate Female Spear',	'I',	'F',	'0'),
('IMA141',	'Intermediate Male Spear',	'I',	'M',	'0'),
('IFA142',	'Intermediate Female Staff',	'I',	'F',	'0'),
('IMA142',	'Intermediate Male Staff',	'I',	'M',	'0'),
('IFA143',	'Intermediate Female Southern Staff',	'I',	'F',	'0'),
('IMA143',	'Intermediate Male Southern Staff',	'I',	'M',	'0'),
('IMF201',	'Intermediate Female Traditional Open Barehand',	'I',	'F',	'0'),
('IMA201',	'Intermediate Male Traditional Open Barehand',	'I',	'M',	'0'),
('IFA221',	'Intermediate Female Traditional Short Weapon',	'I',	'F',	'0'),
('IMA221',	'Intermediate Male Traditional Short Weapon',	'I',	'M',	'0'),
('IFA241',	'Intermediate Female Traditional Long Weapon',	'I',	'F',	'0'),
('IMA241',	'Intermediate Male Traditional Long Weapon',	'I',	'M',	'0'),
('IFA281',	'Intermediate Female Traditional Soft Weapon',	'I',	'F',	'0'),
('IMA281',	'Intermediate Male Traditional Soft Weapon',	'I',	'M',	'0'),
('IFA181',	'Intermediate Female Other Weapon',	'I',	'F',	'0'),
('IMA181',	'Intermediate Male Other Weapon',	'I',	'M',	'0'),
('IFA321',	'Intermediate Female Taiji 24',	'I',	'F',	'0'),
('IMA321',	'Intermediate Male Taiji 24',	'I',	'M',	'0'),
('IFA322',	'Intermediate Female Yang',	'I',	'F',	'0'),
('IMA322',	'Intermediate Male Yang',	'I',	'M',	'0'),
('IFA323',	'Intermediate Female Chen',	'I',	'F',	'0'),
('IMA323',	'Intermediate Male Chen',	'I',	'M',	'0'),
('IFA301',	'Intermediate Female 42 Fist',	'I',	'F',	'0'),
('IMA301',	'Intermediate Male 42 Fist',	'I',	'M',	'0'),
('IFA302',	'Intermediate Female 42 Sword',	'I',	'F',	'0'),
('IMA302',	'Intermediate Male 42 Sword',	'I',	'M',	'0'),
('IFA341',	'Intermediate Female Taiji Weapon',	'I',	'F',	'0'),
('IMA341',	'Intermediate Male Taiji Weapon',	'I',	'M',	'0'),
('IFA361',	'Intermediate Female Internal Open Barehand',	'I',	'F',	'0'),
('IMA361',	'Intermediate Male Internal Open Barehand',	'I',	'M',	'0'),
('IFA381',	'Intermediate Female Internal Open Weapon',	'I',	'F',	'0'),
('IMA381',	'Intermediate Male Internal Open Weapon',	'I',	'M',	'0'),
('BFA101',	'Beginner Female Longfist',	'B',	'F',	'0'),
('BMA101',	'Beginner Male Longfist',	'B',	'M',	'0'),
('BFA102',	'Beginner Female Southern Fist',	'B',	'F',	'0'),
('BMA102',	'Beginner Male Southern Fist',	'B',	'M',	'0'),
('BFA121',	'Beginner Female Straightsword',	'B',	'F',	'0'),
('BMA121',	'Beginner Male Straightsword',	'B',	'M',	'0'),
('BFA122',	'Beginner Female Broadsword',	'B',	'F',	'0'),
('BMA122',	'Beginner Male Broadsword',	'B',	'M',	'0'),
('BFA123',	'Beginner Female Southern Broadsword',	'B',	'F',	'0'),
('BMA123',	'Beginner Male Southern Broadsword',	'B',	'M',	'0'),
('BFA141',	'Beginner Female Spear',	'B',	'F',	'0'),
('BMA141',	'Beginner Male Spear',	'B',	'M',	'0'),
('BFA142',	'Beginner Female Staff',	'B',	'F',	'0'),
('BMA142',	'Beginner Male Staff',	'B',	'M',	'0'),
('BFA143',	'Beginner Female Southern Staff',	'B',	'F',	'0'),
('BMA143',	'Beginner Male Southern Staff',	'B',	'M',	'0'),
('BMF201',	'Beginner Female Traditional Open Barehand',	'B',	'F',	'0'),
('BMA201',	'Beginner Male Traditional Open Barehand',	'B',	'M',	'0'),
('BFA221',	'Beginner Female Traditional Short Weapon',	'B',	'F',	'0'),
('BMA221',	'Beginner Male Traditional Short Weapon',	'B',	'M',	'0'),
('BFA241',	'Beginner Female Traditional Long Weapon',	'B',	'F',	'0'),
('BMA241',	'Beginner Male Traditional Long Weapon',	'B',	'M',	'0'),
('BFA281',	'Beginner Female Traditional Soft Weapon',	'B',	'F',	'0'),
('BMA281',	'Beginner Male Traditional Soft Weapon',	'B',	'M',	'0'),
('BFA181',	'Beginner Female Other Weapon',	'B',	'F',	'0'),
('BMA181',	'Beginner Male Other Weapon',	'B',	'M',	'0'),
('BFA321',	'Beginner Female Taiji 24',	'B',	'F',	'0'),
('BMA321',	'Beginner Male Taiji 24',	'B',	'M',	'0'),
('BFA322',	'Beginner Female Yang',	'B',	'F',	'0'),
('BMA322',	'Beginner Male Yang',	'B',	'M',	'0'),
('BFA323',	'Beginner Female Chen',	'B',	'F',	'0'),
('BMA323',	'Beginner Male Chen',	'B',	'M',	'0'),
('BFA301',	'Beginner Female 42 Fist',	'B',	'F',	'0'),
('BMA301',	'Beginner Male 42 Fist',	'B',	'M',	'0'),
('BFA302',	'Beginner Female 42 Sword',	'B',	'F',	'0'),
('BMA302',	'Beginner Male 42 Sword',	'B',	'M',	'0'),
('BFA341',	'Beginner Female Taiji Weapon',	'B',	'F',	'0'),
('BMA341',	'Beginner Male Taiji Weapon',	'B',	'M',	'0'),
('BFA361',	'Beginner Female Internal Open Barehand',	'B',	'F',	'0'),
('BMA361',	'Beginner Male Internal Open Barehand',	'B',	'M',	'0'),
('BFA381',	'Beginner Female Internal Open Weapon',	'B',	'F',	'0'),
('BMA381',	'Beginner Male Internal Open Weapon',	'B',	'M',	'0');

DROP TABLE IF EXISTS "groupset";
CREATE TABLE "public"."groupset" (
    "groupset_id" uuid NOT NULL,
    "comp_year" integer NOT NULL,
    "team_name" character varying(255) NOT NULL,
    "date_created" timestamptz NOT NULL,
    "school_id" uuid NOT NULL,
    CONSTRAINT "groupset_pkey" PRIMARY KEY ("groupset_id")
)
WITH (oids = false);

CREATE INDEX groupset_school_id_aa09da97 ON public.groupset USING btree (school_id);


DROP TABLE IF EXISTS "groupset_members";
CREATE TABLE "public"."groupset_members" (
    "id" bigint DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "date_joined" timestamptz NOT NULL,
    "leader" boolean NOT NULL,
    "groupset_id" uuid NOT NULL,
    "member" uuid NOT NULL,
    CONSTRAINT "groupset_members_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX groupset_members_groupset_id_member_0c9765e3_uniq ON public.groupset_members USING btree (groupset_id, member);

CREATE INDEX groupset_members_groupset_id_c9038c4e ON public.groupset_members USING btree (groupset_id);

CREATE INDEX groupset_members_member_0887578e ON public.groupset_members USING btree (member);


DROP TABLE IF EXISTS "registration";
CREATE TABLE "public"."registration" (
    "id" bigint DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "comp_year" integer NOT NULL,
    "date_created" timestamptz NOT NULL,
    "nandu_str" text,
    "competitor_id" uuid NOT NULL,
    "event_code" character varying(50) NOT NULL,
    CONSTRAINT "registration_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX registration_competitor_id_comp_year_event_code_b6d45ac9_uniq ON public.registration USING btree (competitor_id, comp_year, event_code);

CREATE INDEX registration_competitor_id_009e87d1 ON public.registration USING btree (competitor_id);

CREATE INDEX registration_event_code_b18d579f ON public.registration USING btree (event_code);

CREATE INDEX registration_event_code_b18d579f_like ON public.registration USING btree (event_code varchar_pattern_ops);


DROP TABLE IF EXISTS "settings";
CREATE TABLE "public"."settings" (
    "id" bigint DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "reg_year" integer NOT NULL,
    "early_reg_start" date,
    "early_reg_end" date,
    "reg_start" date NOT NULL,
    "reg_end" date NOT NULL,
    "comp_date" date,
    "contact_email" character varying(254) NOT NULL,
    "created_at" timestamptz NOT NULL,
    "school_id" uuid NOT NULL,
    CONSTRAINT "settings_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX settings_school_id_85cbda11 ON public.settings USING btree (school_id);


DROP TABLE IF EXISTS "token_blacklist_blacklistedtoken";
CREATE TABLE "public"."token_blacklist_blacklistedtoken" (
    "id" bigint DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "blacklisted_at" timestamptz NOT NULL,
    "token_id" bigint NOT NULL,
    CONSTRAINT "token_blacklist_blacklistedtoken_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX token_blacklist_blacklistedtoken_token_id_key ON public.token_blacklist_blacklistedtoken USING btree (token_id);


DROP TABLE IF EXISTS "token_blacklist_outstandingtoken";
CREATE TABLE "public"."token_blacklist_outstandingtoken" (
    "id" bigint DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "token" text NOT NULL,
    "created_at" timestamptz,
    "expires_at" timestamptz NOT NULL,
    "user_id" uuid,
    "jti" character varying(255) NOT NULL,
    CONSTRAINT "token_blacklist_outstandingtoken_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE INDEX token_blacklist_outstandingtoken_user_id_83bc629a ON public.token_blacklist_outstandingtoken USING btree (user_id);

CREATE UNIQUE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq ON public.token_blacklist_outstandingtoken USING btree (jti);

CREATE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like ON public.token_blacklist_outstandingtoken USING btree (jti varchar_pattern_ops);

INSERT INTO "token_blacklist_outstandingtoken" ("id", "token", "created_at", "expires_at", "user_id", "jti") VALUES
(1,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MDc5NTU1NiwiaWF0IjoxNzgwNzA5MTU2LCJqdGkiOiI5ZjI3NDZhYjEyMmU0MzI5OWQ3NTExMDg1NDQyZDdmMiIsInVzZXJfaWQiOiJhMTc1ZWFlMC04ZTRlLTQ1NTctYWEzYi00NTQzNDI1NzQ4M2IifQ.6n6gggx5dBpLZPtAC-VZdvxginXnhk3dyc8ilOv3O_k',	'2026-06-06 01:25:56.354913+00',	'2026-06-07 01:25:56+00',	'a175eae0-8e4e-4557-aa3b-45434257483b',	'9f2746ab122e43299d7511085442d7f2'),
(2,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MDc5NTU2OSwiaWF0IjoxNzgwNzA5MTY5LCJqdGkiOiI5Njc5YTJkYzNkNWM0ZTFmOTExYjk4NzQwMjBjMzE3NCIsInVzZXJfaWQiOiJhMTc1ZWFlMC04ZTRlLTQ1NTctYWEzYi00NTQzNDI1NzQ4M2IifQ.YjQI0RKHtsyt0mSPvNbHvSA3039B9fmsPrj2MQzCv4Y',	'2026-06-06 01:26:09.479085+00',	'2026-06-07 01:26:09+00',	'a175eae0-8e4e-4557-aa3b-45434257483b',	'9679a2dc3d5c4e1f911b9874020c3174'),
(3,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MDc5NTU5MSwiaWF0IjoxNzgwNzA5MTkxLCJqdGkiOiIxOGYxNTdiMjYxY2M0MjYwYTk3NjgyYmQzOWVhZDc1NCIsInVzZXJfaWQiOiJhMTc1ZWFlMC04ZTRlLTQ1NTctYWEzYi00NTQzNDI1NzQ4M2IifQ.-CmSt7twc6V8Qr4pVHGh25H7U4tIVRHjQ3h6vvgD67M',	'2026-06-06 01:26:31.270103+00',	'2026-06-07 01:26:31+00',	'a175eae0-8e4e-4557-aa3b-45434257483b',	'18f157b261cc4260a97682bd39ead754'),
(4,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MDc5NTYwOSwiaWF0IjoxNzgwNzA5MjA5LCJqdGkiOiI3ZWFlMjllZmJkNDM0ZDhkODMzZGRjZWI5NTIwN2FlNyIsInVzZXJfaWQiOiJhMTc1ZWFlMC04ZTRlLTQ1NTctYWEzYi00NTQzNDI1NzQ4M2IifQ.vz2TRAhjcQ_OnelI5HUZHxIAtroQMvz5J5y017Z8zNI',	'2026-06-06 01:26:49.038433+00',	'2026-06-07 01:26:49+00',	'a175eae0-8e4e-4557-aa3b-45434257483b',	'7eae29efbd434d8d833ddceb95207ae7'),
(5,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MDc5NTYxOCwiaWF0IjoxNzgwNzA5MjE4LCJqdGkiOiIzOTQ5NWFjZWJiNWM0NzEwYWI5ZGRjZDY3NzkyMGJmNCIsInVzZXJfaWQiOiJhMTc1ZWFlMC04ZTRlLTQ1NTctYWEzYi00NTQzNDI1NzQ4M2IifQ.-dQLFR_ifyZKOnAmP3Zz51kuwjFM9eI0HYtlvUDdFUk',	'2026-06-06 01:26:58.224606+00',	'2026-06-07 01:26:58+00',	'a175eae0-8e4e-4557-aa3b-45434257483b',	'39495acebb5c4710ab9ddcd677920bf4'),
(6,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTAzMDY2OSwiaWF0IjoxNzgwOTQ0MjY5LCJqdGkiOiI1MmI3ZWVjYjc3ZDA0OTg2YTgzNTVmYTdjZTc2OTM4MyIsInVzZXJfaWQiOiJhMTc1ZWFlMC04ZTRlLTQ1NTctYWEzYi00NTQzNDI1NzQ4M2IifQ.Z4cGpi5O6-xLY78Sw0_XIJRXaUhi7m1fa47W7maz634',	'2026-06-08 18:44:29.363245+00',	'2026-06-09 18:44:29+00',	'a175eae0-8e4e-4557-aa3b-45434257483b',	'52b7eecb77d04986a8355fa7ce769383'),
(69,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NzI3MCwiaWF0IjoxNzgxMDcwODcwLCJqdGkiOiI2MjIzNTU2M2EwYTQ0NTg0YjNmMDA3NGNlNTA2OWRkMiIsInVzZXJfaWQiOiI2OTBiNzIxZi1lNzY5LTQwOWItODc0ZS00NzdiYjI3MDg1Y2MifQ.sY7czbq2GVM_MFk99-_qBkehaZ8yTM5mdiBOOLt915A',	'2026-06-10 05:54:30.498939+00',	'2026-06-11 05:54:30+00',	NULL,	'62235563a0a44584b3f0074ce5069dd2'),
(74,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0Mjk4MiwiaWF0IjoxNzgxNTU2NTgyLCJqdGkiOiI4OWZhYzU0NzQ1NDg0Zjg4OTVjYmY0YmNjM2MxNWZmNyIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.4Hte5o3vg14AWxeaRS_hFF1QPQthjpeYKIjdjnDWpSM',	'2026-06-15 20:49:42.922693+00',	'2026-06-16 20:49:42+00',	NULL,	'89fac54745484f8895cbf4bcc3c15ff7'),
(79,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NDgwNCwiaWF0IjoxNzgxNTU4NDA0LCJqdGkiOiJjOGFiODE2ODA1ODM0Mzk0YjhkODE4NWQ2YjAyZGFhZSIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.XiTrRogiTMd_9vIIohAZRDrnA4PVvvPsW3HWDnatDFo',	'2026-06-15 21:20:04.636081+00',	'2026-06-16 21:20:04+00',	NULL,	'c8ab816805834394b8d8185d6b02daae'),
(84,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NTA2MCwiaWF0IjoxNzgxNTU4NjYwLCJqdGkiOiJiNmJlNzdjYzJhODY0ZjAxYTRlNzE2YmFjMjEzN2RkZCIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.0ej8aqmpaEd3y6gnigDPSJBo6A6ZvIf7-QwWYGDRecI',	'2026-06-15 21:24:20.53944+00',	'2026-06-16 21:24:20+00',	NULL,	'b6be77cc2a864f01a4e716bac2137ddd'),
(89,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0Njg0MSwiaWF0IjoxNzgxNTYwNDQxLCJqdGkiOiJkZGZmOGE5N2VjZmU0NGNjOTZhZmE4M2JlMmRmZjJlYyIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.CNTFBRBQ-ODnaJri3xeL6LajzRsk5KGOv25XH1gJwaw',	'2026-06-15 21:54:01.729737+00',	'2026-06-16 21:54:01+00',	NULL,	'ddff8a97ecfe44cc96afa83be2dff2ec'),
(94,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NzI1NiwiaWF0IjoxNzgxNTYwODU2LCJqdGkiOiIyNTI5ZWM4OThkYzc0NTE1YmJkOTdmNWNmYjcwY2IwZSIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.pqVcnx-5P6NF_e-AhErXHIGzRimlM5OP-7r4T4OMFbc',	'2026-06-15 22:00:56.619677+00',	'2026-06-16 22:00:56+00',	NULL,	'2529ec898dc74515bbd97f5cfb70cb0e'),
(97,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0OTg5NywiaWF0IjoxNzgxNTYzNDk3LCJqdGkiOiJlMDhhOWY2Mzc1NjM0OGU0YjdjOGY5ZGQ4MmFjZjM0NSIsInVzZXJfaWQiOiJlZTFjZDhmNy0xMWVlLTRmYmMtYWM3Ny1hZTY0ZDUzMzBhMTMifQ.tse5MwoPZXOhMla2ni6CsXhY7ky5siPO1WKG3W3Hf4U',	'2026-06-15 22:44:57.109258+00',	'2026-06-16 22:44:57+00',	NULL,	'e08a9f63756348e4b7c8f9dd82acf345'),
(101,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTczMTUyNywiaWF0IjoxNzgxNjQ1MTI3LCJqdGkiOiIyMzdlZDBjOTFhNWY0YjI2OTRhZWMyOGY1MzgxNzJhYyIsInVzZXJfaWQiOiJjODFkYTM4NC1lNDY4LTRiMjMtYWM0ZS0wNjIwZDViNzBjZjgifQ.NkFjJyf1wXA-J3ryS3B0TqAWs_trDrCm_GSEin1VXvI',	'2026-06-16 21:25:27.93172+00',	'2026-06-17 21:25:27+00',	NULL,	'237ed0c91a5f4b2694aec28f538172ac'),
(70,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0MjIyNCwiaWF0IjoxNzgxNTU1ODI0LCJqdGkiOiI3NDI0NGRjNWIwNDk0MGRhYWZmODllMWVkZjc1NDJlMyIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.qJTD53YZSrBkl4Z35VjtbuWPzO1ILTRXEhLn21hQDTY',	'2026-06-15 20:37:04.480828+00',	'2026-06-16 20:37:04+00',	NULL,	'74244dc5b04940daaff89e1edf7542e3'),
(75,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0Mjk5NywiaWF0IjoxNzgxNTU2NTk3LCJqdGkiOiJiYjMyZmI0MzFhMzM0Y2FmODk3MDM4MzA1OWNkMDljOCIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.WoI5WyoNvF5AbJQopbFTv2cXhb4wtArQnKhTm9RLGxw',	'2026-06-15 20:49:57.459711+00',	'2026-06-16 20:49:57+00',	NULL,	'bb32fb431a334caf8970383059cd09c8'),
(80,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NDgxNSwiaWF0IjoxNzgxNTU4NDE1LCJqdGkiOiJiZDliZmQwYjI3ZDY0Yjk0YjcyYTM0MzQ1MTk3N2Q4ZCIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.y1i2VF2iTihQIlPaLBISo-Ix1aEsoMKFwDvQ-gzBOvM',	'2026-06-15 21:20:15.995911+00',	'2026-06-16 21:20:15+00',	NULL,	'bd9bfd0b27d64b94b72a343451977d8d'),
(85,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NTIyMiwiaWF0IjoxNzgxNTU4ODIyLCJqdGkiOiI2NzBiOGMzMWMwMTM0OWNmYTQ1NzdmYWUwNjhjMTAwOCIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.B0RZjxp6z6pCQYRCZHEV58mm9SRfvE-DFZNpR1bkcAU',	'2026-06-15 21:27:02.645165+00',	'2026-06-16 21:27:02+00',	NULL,	'670b8c31c01349cfa4577fae068c1008'),
(90,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0Njg4NiwiaWF0IjoxNzgxNTYwNDg2LCJqdGkiOiI4M2Q5MDdmMTExYjA0NmFiYThkMzQ3YTlmNDljZjg4NyIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.3PwVtAvw1btuJ_jX0uIUVN7jL2RlgMqtOvmsn-zPTvg',	'2026-06-15 21:54:46.427229+00',	'2026-06-16 21:54:46+00',	NULL,	'83d907f111b046aba8d347a9f49cf887'),
(95,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NzQ0MCwiaWF0IjoxNzgxNTYxMDQwLCJqdGkiOiJkMjVjNWY4YjkzYTA0MDk0YmFkMWIzNzZiZmJjZGNhNSIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.dByL8X3wdhd6M0ZXJcNqrgDe9P7v7PdQXg0pL1Kcpo4',	'2026-06-15 22:04:00.396079+00',	'2026-06-16 22:04:00+00',	NULL,	'd25c5f8b93a04094bad1b376bfbcdca5'),
(98,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTcxOTQ4OCwiaWF0IjoxNzgxNjMzMDg4LCJqdGkiOiJjZjdiMWM0OTRhOTI0YjZkYTQ3MzJkNDhiNGU3NjIyNCIsInVzZXJfaWQiOiJjODFkYTM4NC1lNDY4LTRiMjMtYWM0ZS0wNjIwZDViNzBjZjgifQ.3idS9CeXtkYq5_rJSytoHYr4x96ZzeNukEMhs0rkb_4',	'2026-06-16 18:04:48.506701+00',	'2026-06-17 18:04:48+00',	NULL,	'cf7b1c494a924b6da4732d48b4e76224'),
(102,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTczMTc0NSwiaWF0IjoxNzgxNjQ1MzQ1LCJqdGkiOiI1NjI3M2JiMTE1Yzg0YTQwODM3MWY3NDc2ZTQ5ZTZmNSIsInVzZXJfaWQiOiJjODFkYTM4NC1lNDY4LTRiMjMtYWM0ZS0wNjIwZDViNzBjZjgifQ.lUGIt4xAxuX1Sb59N7zK9h00oiRgEMV_ssunhvoSqRc',	'2026-06-16 21:29:05.031893+00',	'2026-06-17 21:29:05+00',	NULL,	'56273bb115c84a408371f7476e49e6f5'),
(105,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTgxNzQ3NSwiaWF0IjoxNzgxNzMxMDc1LCJqdGkiOiJmY2I5NDZmODE2MzU0YTI3YTI5ZTM5MmVjMWRlOTMyNiIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.bh3iQrJUXYdyslarZmbzlZacUmpvpMEq48u-RHSmQKA',	'2026-06-17 21:17:55.076609+00',	'2026-06-18 21:17:55+00',	NULL,	'fcb946f816354a27a29e392ec1de9326'),
(109,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTgzNjgzMCwiaWF0IjoxNzgxNzUwNDMwLCJqdGkiOiIwMmUxYzFkYzQ5MzQ0MDg2OWUyNGZjY2E0MjUzNjM0MCIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.2wvIJCUwbuDDXFIru2p8zhXwt1UeIAX0PmKP89254tc',	'2026-06-18 02:40:30.608877+00',	'2026-06-19 02:40:30+00',	NULL,	'02e1c1dc493440869e24fcca42536340'),
(113,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTg5NDQ0OCwiaWF0IjoxNzgxODA4MDQ4LCJqdGkiOiI2YTEwNzhlMzJiZjQ0MzhiOWI2ZTZhMzRhM2FkZWZiNCIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.z93piQuxkC1BJn26ysBJymV7lI_UTZziyVTVZQZNJ60',	'2026-06-18 18:40:48.81854+00',	'2026-06-19 18:40:48+00',	NULL,	'6a1078e32bf4438b9b6e6a34a3adefb4'),
(117,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTg5NzEwNywiaWF0IjoxNzgxODEwNzA3LCJqdGkiOiI5MTc1NzYyODZmODE0YWU0OWJiZGY1MzlhYjJkYmJlMSIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.QzLlmxvfSlQS0v36hF3sdpM7tFge1Pao6o_59zOpz9I',	'2026-06-18 19:25:07.467395+00',	'2026-06-19 19:25:07+00',	NULL,	'917576286f814ae49bbdf539ab2dbbe1'),
(121,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTkwMDA4MywiaWF0IjoxNzgxODEzNjgzLCJqdGkiOiJhOGI0N2FmNTBjYzM0ZTUxYWFhNzQ0ZDBiMDhiMmY3OCIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.li1CXKAxfHEbmHF_pHHrm7SEz3cMTwwTeJgYSCy-W64',	'2026-06-18 20:14:43.094598+00',	'2026-06-19 20:14:43+00',	NULL,	'a8b47af50cc34e51aaa744d0b08b2f78'),
(125,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTkxNDY1MSwiaWF0IjoxNzgxODI4MjUxLCJqdGkiOiIxZDkxMDgwZGZiMDI0NTQwOWQ4Y2RiNWM4MGU5OTNhZiIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.mL_8OqLtl41IxZeHEil64_JbHSajm0tuywq0FyKCi2c',	'2026-06-19 00:17:31.099984+00',	'2026-06-20 00:17:31+00',	NULL,	'1d91080dfb0245409d8cdb5c80e993af'),
(106,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTgxNzY2NywiaWF0IjoxNzgxNzMxMjY3LCJqdGkiOiI1M2NjZmE0ODQ1MTk0MWM2OTlkMmVhMDZiMDExMWFjYiIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.TIV36AeWlweJvYRdNx2utem-iYxlr5V7qGFxW5EZxDY',	'2026-06-17 21:21:07.956557+00',	'2026-06-18 21:21:07+00',	NULL,	'53ccfa48451941c699d2ea06b0111acb'),
(110,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTgzNzE0MSwiaWF0IjoxNzgxNzUwNzQxLCJqdGkiOiI3ZTAwZDI1MDFlODg0MDZkOWNmODJlMjViNzNjZjJkYiIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.MJY5ms4-bSc8i_j5jqDgi5mZ7kH9Bx7QPKDoZwt-z1s',	'2026-06-18 02:45:41.666607+00',	'2026-06-19 02:45:41+00',	NULL,	'7e00d2501e88406d9cf82e25b73cf2db'),
(71,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0MjQ4NiwiaWF0IjoxNzgxNTU2MDg2LCJqdGkiOiJiNWI4NDk5MDcxNGY0ZGEzOThlYmQwZmI0MjBjN2NjYiIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.gRqhNxBnJSrJ3Xk53ZR1xjKlh2R2Di7dP46UMtU2Gyg',	'2026-06-15 20:41:26.711977+00',	'2026-06-16 20:41:26+00',	NULL,	'b5b84990714f4da398ebd0fb420c7ccb'),
(76,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0MzAwMSwiaWF0IjoxNzgxNTU2NjAxLCJqdGkiOiI5YTgxMTY5NDMyZGQ0Zjg0Yjg1YTY3MmM1MmZmNzA1NCIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.yjL5EavJodgtO53_CMLNLHvHzYYaLdwdq1NVRAp_RUs',	'2026-06-15 20:50:01.730863+00',	'2026-06-16 20:50:01+00',	NULL,	'9a81169432dd4f84b85a672c52ff7054'),
(81,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NDg0OCwiaWF0IjoxNzgxNTU4NDQ4LCJqdGkiOiIyODI4OTFkZjI4Mzg0YzllOTcyYTczY2RkZGM2Nzk0MyIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.a3TUOd95xBnOnhudhX21RlpRdXcKSw8RgVXHGVlY0rM',	'2026-06-15 21:20:48.158574+00',	'2026-06-16 21:20:48+00',	NULL,	'282891df28384c9e972a73cdddc67943'),
(86,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NjA1NiwiaWF0IjoxNzgxNTU5NjU2LCJqdGkiOiIyMTNhNGZmZjlhZTY0YWRkYWM5NzllZTNkODI2NjNkZiIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.p031I5RZignYvet9_fYcEPjP7khVeCso03VekXNOLiY',	'2026-06-15 21:40:56.350078+00',	'2026-06-16 21:40:56+00',	NULL,	'213a4fff9ae64addac979ee3d82663df'),
(91,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NzA4NiwiaWF0IjoxNzgxNTYwNjg2LCJqdGkiOiI1NGZjYTc0MGNjNjk0OTgxYTIwZjYwNjAwY2FhZjhjNiIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.IlUVKAcwJLR00aMCYbXx09FxhgpELNS4ofu7MWxLSjo',	'2026-06-15 21:58:06.001254+00',	'2026-06-16 21:58:06+00',	NULL,	'54fca740cc694981a20f60600caaf8c6'),
(96,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0ODg1NCwiaWF0IjoxNzgxNTYyNDU0LCJqdGkiOiJiNmVhMjg0YTExMDM0NDc4OWVjN2VjZDAxM2IyNDFhYyIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.GrqnBex9WLzN28ALMP7xDntPaZpqEpEUCuBwugf4Bog',	'2026-06-15 22:27:34.948224+00',	'2026-06-16 22:27:34+00',	NULL,	'b6ea284a110344789ec7ecd013b241ac'),
(99,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTcxOTYwNSwiaWF0IjoxNzgxNjMzMjA1LCJqdGkiOiJjZWI0OThlMjAxNWQ0NDYzODg1ZWM5NmIyYzMyNWJjYyIsInVzZXJfaWQiOiJjODFkYTM4NC1lNDY4LTRiMjMtYWM0ZS0wNjIwZDViNzBjZjgifQ.PbUp6_4SWLx5veU1sB-psPXGKPxmqi-c823xfqIP7U8',	'2026-06-16 18:06:45.951298+00',	'2026-06-17 18:06:45+00',	NULL,	'ceb498e2015d4463885ec96b2c325bcc'),
(103,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTczMTk3OCwiaWF0IjoxNzgxNjQ1NTc4LCJqdGkiOiI2NDk0ZWQ3NzAxZGY0M2IzODViYjNlOWIzOWFjZTcxNSIsInVzZXJfaWQiOiJjODFkYTM4NC1lNDY4LTRiMjMtYWM0ZS0wNjIwZDViNzBjZjgifQ.eOPDDp0eudpkH3PuOEszwc4DWxBTl6FRnmj_zfcvilU',	'2026-06-16 21:32:58.741704+00',	'2026-06-17 21:32:58+00',	NULL,	'6494ed7701df43b385bb3e9b39ace715'),
(114,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTg5NDU2MywiaWF0IjoxNzgxODA4MTYzLCJqdGkiOiI1MzgxZjdmN2UwNTU0OWU4ODMzNmFkOTI4ZDU3YjZkZiIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.1LDVghJ4JJGGjLmxFhGMpyhhdfNxzMAvBkFB1FYDnBQ',	'2026-06-18 18:42:43.697638+00',	'2026-06-19 18:42:43+00',	NULL,	'5381f7f7e05549e88336ad928d57b6df'),
(118,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTg5NzE0NCwiaWF0IjoxNzgxODEwNzQ0LCJqdGkiOiJmNjBmODBkOTk1Mzk0MmM0YjM5NGYzYWJjNjgzMTIzYSIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.MH_8XFxbWxggeAeB4uQiBnJM3xs57v43stsJ9mMOtj8',	'2026-06-18 19:25:44.988034+00',	'2026-06-19 19:25:44+00',	NULL,	'f60f80d9953942c4b394f3abc683123a'),
(122,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTkwMDMxMSwiaWF0IjoxNzgxODEzOTExLCJqdGkiOiI5MWEzNTNkOWYyNDI0MTIyODU4YmEzOWU3ZDk1N2MyMCIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.wIKJI-CwPmvHKLZvuVXMRL70ybv7FQMwwlfR4a4jjqE',	'2026-06-18 20:18:31.937115+00',	'2026-06-19 20:18:31+00',	NULL,	'91a353d9f2424122858ba39e7d957c20'),
(107,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTgxODQzMiwiaWF0IjoxNzgxNzMyMDMyLCJqdGkiOiIyNGZhMGYwOGYxMDM0YWNjYmEwZmMwYTlmODVmYjFkNyIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.RJgU_Kwa6EwfnHkWJt6MJOLy7gcYw8rS65b6LR_tomA',	'2026-06-17 21:33:52.532175+00',	'2026-06-18 21:33:52+00',	NULL,	'24fa0f08f1034accba0fc0a9f85fb1d7'),
(111,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTg5MDE3MSwiaWF0IjoxNzgxODAzNzcxLCJqdGkiOiIwYmYxNGYwYzVlY2Y0YzIxOTI4ZTdjNDQ1NTYwYzMzNiIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.pfDeSmyBrLfVNtfyn9wBXUKb_o974PMLVDCjXQX-1eg',	'2026-06-18 17:29:31.07949+00',	'2026-06-19 17:29:31+00',	NULL,	'0bf14f0c5ecf4c21928e7c445560c336'),
(115,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTg5NjA2MywiaWF0IjoxNzgxODA5NjYzLCJqdGkiOiJkOTBhMDU3MDJjMDQ0NGY5YTQ0MGY1MzMyMGNlODE1NCIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.Zl7SaUsUZIeaOOO-Qxwsmi76CVFWTRM6hceSUKadcNA',	'2026-06-18 19:07:43.940872+00',	'2026-06-19 19:07:43+00',	NULL,	'd90a05702c0444f9a440f53320ce8154'),
(119,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTg5ODkwNiwiaWF0IjoxNzgxODEyNTA2LCJqdGkiOiJiYTliZWE3M2NmYTc0ZjJkYjczNWQ0MWY1NzkzMDRmZCIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.aPWpUqrD5WdzWiHc_Ur9QsHBe7znJ3pzMoabFSZ8xTY',	'2026-06-18 19:55:06.841716+00',	'2026-06-19 19:55:06+00',	NULL,	'ba9bea73cfa74f2db735d41f579304fd'),
(123,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTkwMDM4NSwiaWF0IjoxNzgxODEzOTg1LCJqdGkiOiJmZWE5YzVmZjMzNjc0MjEyOWQxMjY1NWU4NGU0N2NhYyIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.9mlCQ6Nmd8eLKbupT9o7TS9N6Y2BD4QflOzi3_-Qans',	'2026-06-18 20:19:45.072995+00',	'2026-06-19 20:19:45+00',	NULL,	'fea9c5ff336742129d12655e84e47cac'),
(72,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0Mjc3NywiaWF0IjoxNzgxNTU2Mzc3LCJqdGkiOiJhYzFhOTY2MWEwNjM0ZThkOGQ5YmEyMzM4N2Q3NjQ3YyIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.l2X7F04D3RkQh4A4KYW-9Z3IEpIxxk-IjgCMwbgQQtI',	'2026-06-15 20:46:17.316327+00',	'2026-06-16 20:46:17+00',	NULL,	'ac1a9661a0634e8d8d9ba23387d7647c'),
(77,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0MzAzMiwiaWF0IjoxNzgxNTU2NjMyLCJqdGkiOiJmMWRjM2VjMGQzMDM0MDQyODY2N2QzMDIyMGQ2NjRhMCIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.cAztfN8CO08iaAgev6WmPEsdkUXMhVA98rXSFNDvQoo',	'2026-06-15 20:50:32.236369+00',	'2026-06-16 20:50:32+00',	NULL,	'f1dc3ec0d30340428667d30220d664a0'),
(82,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NDg2OCwiaWF0IjoxNzgxNTU4NDY4LCJqdGkiOiI4NDcyYWFiZWE5ZDI0Nzk5YWU4NDdmNzA4MzVjNGYyMCIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.dDP3vPsTp6wk4TEnBL1MhYVPj1AiKDWCjEPwpDlpqno',	'2026-06-15 21:21:08.831491+00',	'2026-06-16 21:21:08+00',	NULL,	'8472aabea9d24799ae847f70835c4f20'),
(7,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTEyMTQ3NCwiaWF0IjoxNzgxMDM1MDc0LCJqdGkiOiJlYTg2OWU2ZGYyNTc0ODYyYmI0NjNkZWNjMDYyNmRlZiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.Uh13KtyJtykLYam1nksS_ikj-1_11zvVLehGn4XAVrU',	'2026-06-09 19:57:54.832571+00',	'2026-06-10 19:57:54+00',	NULL,	'ea869e6df2574862bb463decc0626def'),
(8,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTEyMTQ5OCwiaWF0IjoxNzgxMDM1MDk4LCJqdGkiOiI3ZjY2MzgxZTEzZjI0NTQ1YTlkMmFmYTIzMDFlZjllNSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.9xzKNs2HWhU9UWotrPDBw6lx5t3EytkcOvqSXeyHTrI',	'2026-06-09 19:58:18.979493+00',	'2026-06-10 19:58:18+00',	NULL,	'7f66381e13f24545a9d2afa2301ef9e5'),
(9,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTEyMTU1OSwiaWF0IjoxNzgxMDM1MTU5LCJqdGkiOiJlNDIyY2QxMDc1MGY0MTA0YTQyZTgwMjA2MmY3Zjc4OSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.EVgMQpWgtbZOwMVRz0fD4ZYYoF0MqzOmXLQb_K-I77M',	'2026-06-09 19:59:19.58361+00',	'2026-06-10 19:59:19+00',	NULL,	'e422cd10750f4104a42e802062f7f789'),
(10,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTEyMTU3MCwiaWF0IjoxNzgxMDM1MTcwLCJqdGkiOiI1ZjE1YTQxNDg3Yzk0NzQwYmY0NGQzNzFhMWI3YTZlZiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.j93Niz3dD3ohqNrCAHwGrHkQufAvwbx-9G3PDAzSzTM',	'2026-06-09 19:59:30.164952+00',	'2026-06-10 19:59:30+00',	NULL,	'5f15a41487c94740bf44d371a1b7a6ef'),
(11,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTEyMTYwMiwiaWF0IjoxNzgxMDM1MjAyLCJqdGkiOiI5OTZkMTgxOWZiNTQ0NGNkODIyMTExNmZiMzJlYzRmMCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.1t5MEyKZ4sxjvSUwdtbjmVLrqARE7lqfaEJtYeQOLXo',	'2026-06-09 20:00:02.559792+00',	'2026-06-10 20:00:02+00',	NULL,	'996d1819fb5444cd8221116fb32ec4f0'),
(12,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTEyMTYyMywiaWF0IjoxNzgxMDM1MjIzLCJqdGkiOiJjZTRiYjAwMGJjZTk0YzFlYjQ0OWNmNWI1MWM4OWJmNCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.qBZ8qYlW6aNcGSdM9rWLIqzAmv5Oj2GUFATN3B9785c',	'2026-06-09 20:00:23.032147+00',	'2026-06-10 20:00:23+00',	NULL,	'ce4bb000bce94c1eb449cf5b51c89bf4'),
(13,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTEyMTYyNSwiaWF0IjoxNzgxMDM1MjI1LCJqdGkiOiJkN2MzZmNiOTMxYzk0N2IyYmMwM2YxMGE0NzNiNGUzNiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.lyVeaAevR8YmV6Rmcb_M_mXjti2vp6U0DG8l9TdIdUQ',	'2026-06-09 20:00:25.645979+00',	'2026-06-10 20:00:25+00',	NULL,	'd7c3fcb931c947b2bc03f10a473b4e36'),
(14,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTEyMTYzNSwiaWF0IjoxNzgxMDM1MjM1LCJqdGkiOiI2ZTljOWVmY2I5NjU0ZTVjOGMzZmViZDJlMDEyODFkZiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.QhlpGrZYAmAhEQPfjy8KvNIGKFLOGlQRwy47kWK7wOg',	'2026-06-09 20:00:35.940399+00',	'2026-06-10 20:00:35+00',	NULL,	'6e9c9efcb9654e5c8c3febd2e01281df'),
(15,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1MTgxMSwiaWF0IjoxNzgxMDY1NDExLCJqdGkiOiIxNTg3YTQ3NjJlNTc0YWNlOGNjZDcyNTg4MjA2OTI3YSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.ismWRjHAbGymCZjxjtYWlo6LUpaQUkPm5mIVeBqx6FM',	'2026-06-10 04:23:31.130241+00',	'2026-06-11 04:23:31+00',	NULL,	'1587a4762e574ace8ccd72588206927a'),
(16,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1MjI0MCwiaWF0IjoxNzgxMDY1ODQwLCJqdGkiOiI4Y2U5MGUzNTdhNGI0ZDVmODkyZjRkOWUwNmU2ODk0YSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.Ip_ctsO6fW1936Y_Rh5P7foLWi6y5rxpGdIiUWAI2lo',	'2026-06-10 04:30:40.318182+00',	'2026-06-11 04:30:40+00',	NULL,	'8ce90e357a4b4d5f892f4d9e06e6894a'),
(17,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1MjI2NywiaWF0IjoxNzgxMDY1ODY3LCJqdGkiOiJkYzgxODZlZTc3ZWU0N2VmYTE5ZTRhOTRmN2FlODEwZSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.GaxwRey1v1qIja1138gAQjYFdTQyXZs92cgtz75thRE',	'2026-06-10 04:31:07.378579+00',	'2026-06-11 04:31:07+00',	NULL,	'dc8186ee77ee47efa19e4a94f7ae810e'),
(18,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NDYwOSwiaWF0IjoxNzgxMDY4MjA5LCJqdGkiOiI4ODc3MzAwNGE3YTE0ZmI4ODNmZGIyM2M3ZDYwNTc3OSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.WcZ-SB7nSIyJ71L1wc4N_StVVJuCE3bKXrP6_h0vIc8',	'2026-06-10 05:10:09.376265+00',	'2026-06-11 05:10:09+00',	NULL,	'88773004a7a14fb883fdb23c7d605779'),
(19,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NDY4OCwiaWF0IjoxNzgxMDY4Mjg4LCJqdGkiOiJlNzU5ZmQ5MjIzM2M0ZDFiYWZkZGFkMjE0NTg1MjQzNiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.F86oZi4wH5GeOVCkS7DhcXEXd9s-VTbt4Y7KPretzqY',	'2026-06-10 05:11:28.005856+00',	'2026-06-11 05:11:28+00',	NULL,	'e759fd92233c4d1bafddad2145852436'),
(20,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NDc4MiwiaWF0IjoxNzgxMDY4MzgyLCJqdGkiOiIxNTIzYjMwZjBlOGY0MDRjYWE1ZmI2M2Q2ZGRkNjYwOCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.nrGnjrSW1NNK74y0BipW231VT_ufgw-tqO1NanFaOP0',	'2026-06-10 05:13:02.941291+00',	'2026-06-11 05:13:02+00',	NULL,	'1523b30f0e8f404caa5fb63d6ddd6608'),
(21,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NDgxNSwiaWF0IjoxNzgxMDY4NDE1LCJqdGkiOiI1ZDUzOTQ5NGIwZjk0NTljOTZmM2FkNjBkMDgxNDljMyIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.AR4SJ73eaATQi5syWpEMrqin2NcTccQbhv67I8kVAiY',	'2026-06-10 05:13:35.416906+00',	'2026-06-11 05:13:35+00',	NULL,	'5d539494b0f9459c96f3ad60d08149c3'),
(22,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NDg4MCwiaWF0IjoxNzgxMDY4NDgwLCJqdGkiOiI2YTI2OGJmNmE0MzU0YjJkODhmOTQ5OWMwYWRhNjYyYiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.6z3FfMO7Ssgyv1ZjHNKROVPuCl9XVNxF6C56mmGsACA',	'2026-06-10 05:14:40.073381+00',	'2026-06-11 05:14:40+00',	NULL,	'6a268bf6a4354b2d88f9499c0ada662b'),
(23,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NDg5MiwiaWF0IjoxNzgxMDY4NDkyLCJqdGkiOiI3ZWI0NjM0Mjc5OTA0ZGM1ODU2ZDVkNTA0ZmIyMjdlNiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.x1Gj_kfWuvhrvj9HKc0wA4WLZ8zWcMbqDqNo3bMwbh0',	'2026-06-10 05:14:52.292745+00',	'2026-06-11 05:14:52+00',	NULL,	'7eb4634279904dc5856d5d504fb227e6'),
(24,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTAyOCwiaWF0IjoxNzgxMDY4NjI4LCJqdGkiOiIwYzcyYjMzN2M4M2Q0OTE2OTNhZTJhYTE3NWE1ZWVkOCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.fE2bPxa-vq639cp6ZJ744NdxsMGooe2uMaZhaBkJsws',	'2026-06-10 05:17:08.078561+00',	'2026-06-11 05:17:08+00',	NULL,	'0c72b337c83d491693ae2aa175a5eed8'),
(25,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTEyNCwiaWF0IjoxNzgxMDY4NzI0LCJqdGkiOiJmMGQ0ZmU2YmEzMWI0NzM4YmM5NzJkODg1NTFiZDA5YyIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.UiXr2QXhyTMa9ArK4oWrHcnWiFfSvdAJC6TJByLJVKw',	'2026-06-10 05:18:44.568914+00',	'2026-06-11 05:18:44+00',	NULL,	'f0d4fe6ba31b4738bc972d88551bd09c'),
(26,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTI0MiwiaWF0IjoxNzgxMDY4ODQyLCJqdGkiOiI3Njk2Yzk5MDUwYTk0NTg0YTJmMDYxODY0NDlmODY5MSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.FJ2t9ss_mQMKNJpIy5Nx68QQoncnkmO8DOJzwA_YJig',	'2026-06-10 05:20:42.780923+00',	'2026-06-11 05:20:42+00',	NULL,	'7696c99050a94584a2f06186449f8691'),
(27,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTI2MCwiaWF0IjoxNzgxMDY4ODYwLCJqdGkiOiI4NTkwM2YzMDAwZDY0MjIyYmIxYmQ5ZTAyNDNhNDdkNCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.KnQSQexjLGZRoG39wSEk0uiai7D4a3t_RX5mqL9Vsf4',	'2026-06-10 05:21:00.964847+00',	'2026-06-11 05:21:00+00',	NULL,	'85903f3000d64222bb1bd9e0243a47d4'),
(28,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTI3OSwiaWF0IjoxNzgxMDY4ODc5LCJqdGkiOiI3YmNmMDEzMDQyYzA0NmQ4ODM4MDU1NGU1MDI0YzdhZiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.eDC_k4qQgpEQPVaTRzA_gBUn2jnGWq5utMUxa040E_Y',	'2026-06-10 05:21:19.966609+00',	'2026-06-11 05:21:19+00',	NULL,	'7bcf013042c046d88380554e5024c7af'),
(29,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTM1NiwiaWF0IjoxNzgxMDY4OTU2LCJqdGkiOiJjY2NlNzI0MTIwZWE0Nzg1YjMzYzRiY2FhMmFkODMwOSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.boDec5v2bHFEZdp_HMrmYOaAC9WlmTlfrxoyPbnMNq4',	'2026-06-10 05:22:36.140405+00',	'2026-06-11 05:22:36+00',	NULL,	'ccce724120ea4785b33c4bcaa2ad8309'),
(30,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTQxMCwiaWF0IjoxNzgxMDY5MDEwLCJqdGkiOiI1OTgzNGQ4MDdlZWE0NmNlYWRkYjlhMjg4ZmE2YzhjOSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.VLTWraLi-kX3v4P2jgajTK75VxThJWehZnQWmXnTONg',	'2026-06-10 05:23:30.72932+00',	'2026-06-11 05:23:30+00',	NULL,	'59834d807eea46ceaddb9a288fa6c8c9'),
(31,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTUwMiwiaWF0IjoxNzgxMDY5MTAyLCJqdGkiOiI5MWZhOTU5MWUyNDA0OThlYmFiMzZhZjFiMzI1NDQwNyIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.YJX8nAUEsYfyj8WSlFK-H1wBLQTFzcsNqkVOEDaBE0s',	'2026-06-10 05:25:02.346622+00',	'2026-06-11 05:25:02+00',	NULL,	'91fa9591e240498ebab36af1b3254407'),
(32,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTUyMSwiaWF0IjoxNzgxMDY5MTIxLCJqdGkiOiJhNDk4OWRlNDA3Y2Q0NTJjYTFjYzdmOGY1YjEzMTY2MyIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.bbwcS1Wv7r4eAX1a9z9wTHUpSd6dUpsqhGygUk8XCeU',	'2026-06-10 05:25:21.575539+00',	'2026-06-11 05:25:21+00',	NULL,	'a4989de407cd452ca1cc7f8f5b131663'),
(33,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTU3NiwiaWF0IjoxNzgxMDY5MTc2LCJqdGkiOiIyODA0MWYxOWQzYWI0NTU1YmRkZWYwNGE4YTEwZmRmMCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.tk3EkNyA6HaM9oOXcWn6dfBmnGnFvDfyg6sR8iMRqUM',	'2026-06-10 05:26:16.177047+00',	'2026-06-11 05:26:16+00',	NULL,	'28041f19d3ab4555bddef04a8a10fdf0'),
(34,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTU5MywiaWF0IjoxNzgxMDY5MTkzLCJqdGkiOiIxODBmZTc2MmNkZmQ0N2I1ODAxMTM4MTBhOTE3MDYyYyIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.YzXaoY8GQ4hfjUSWPRdbYyhZxot1VShY0h31GCP0ds4',	'2026-06-10 05:26:33.629472+00',	'2026-06-11 05:26:33+00',	NULL,	'180fe762cdfd47b580113810a917062c'),
(35,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTYyMSwiaWF0IjoxNzgxMDY5MjIxLCJqdGkiOiI1MjA5MmQ4ODNlN2U0MWYwOWQ3Yjk5OGJmYmYyNTZiMiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.0Hk1-jHSmhLSu2cKIGNyeQoiiMIbMpTc3SgjH0LJGt8',	'2026-06-10 05:27:01.394664+00',	'2026-06-11 05:27:01+00',	NULL,	'52092d883e7e41f09d7b998bfbf256b2'),
(36,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTY2NiwiaWF0IjoxNzgxMDY5MjY2LCJqdGkiOiJmYTM0OTdhMmEwNmQ0MDY2YmNjYWIxNThiMDVkYmFmMiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.sSxJXjtE-lH_pGfCuxib8qjwk6y0ooVYbL_p0dMPzCg',	'2026-06-10 05:27:46.202625+00',	'2026-06-11 05:27:46+00',	NULL,	'fa3497a2a06d4066bccab158b05dbaf2'),
(37,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTY4NCwiaWF0IjoxNzgxMDY5Mjg0LCJqdGkiOiI3YzQwNDkyMWJiMmU0YWZmOGEwZmRmYWFiZWJmMGFiMiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.29oeAGrDpYAN5M3XGD0yAa7-t6-kgkvxW_-gRBcWdIE',	'2026-06-10 05:28:04.271397+00',	'2026-06-11 05:28:04+00',	NULL,	'7c404921bb2e4aff8a0fdfaabebf0ab2'),
(38,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTY4NywiaWF0IjoxNzgxMDY5Mjg3LCJqdGkiOiI4MGI5MTZiNjJhYzI0MjJjYTMyZDliZTU5MTU4NDQzMyIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.h8hR6JLNUmoqVdkTRel0mbIQ623M9qWBtG50UoFPC2E',	'2026-06-10 05:28:07.142961+00',	'2026-06-11 05:28:07+00',	NULL,	'80b916b62ac2422ca32d9be591584433'),
(39,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTcxNCwiaWF0IjoxNzgxMDY5MzE0LCJqdGkiOiI1ZDBmMzRiYjFhNGM0YTgzYWMxZTIyYTdiZTA3MjUwNCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.TqPnB67dSTQM0hQLaWkJBd6Ba3NiJZAQVkMsEO_5inY',	'2026-06-10 05:28:34.713687+00',	'2026-06-11 05:28:34+00',	NULL,	'5d0f34bb1a4c4a83ac1e22a7be072504'),
(40,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTczMiwiaWF0IjoxNzgxMDY5MzMyLCJqdGkiOiIwYzIyYzU2NDA0MTQ0ZTdiOTNkNzU0MWZjOWUwMTUyMyIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.0u3kRTXVgBLxKjdG-exJ6UY67l19X_-LlBELtDXqq-U',	'2026-06-10 05:28:52.578284+00',	'2026-06-11 05:28:52+00',	NULL,	'0c22c56404144e7b93d7541fc9e01523'),
(41,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTczNywiaWF0IjoxNzgxMDY5MzM3LCJqdGkiOiIzMjI0ZTJmOWU5MjE0YjY5ODA4NTUyYTQyYzYzMGUwYSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.2Ls9rg652tNwvaQjaEJMvrd2ZlfS7ALpZVeyM5Hrjeg',	'2026-06-10 05:28:57.146355+00',	'2026-06-11 05:28:57+00',	NULL,	'3224e2f9e9214b69808552a42c630e0a'),
(42,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTc5OCwiaWF0IjoxNzgxMDY5Mzk4LCJqdGkiOiI3YThmZTE1ZGE4MTA0OTYwYmY1OGU1MjA3MzNkMjI0ZiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.1vkRhj5m9tQaXZfLK0JGiwc5qRcEJ-mi_PeOQka6Lac',	'2026-06-10 05:29:58.691184+00',	'2026-06-11 05:29:58+00',	NULL,	'7a8fe15da8104960bf58e520733d224f'),
(43,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTgzOCwiaWF0IjoxNzgxMDY5NDM4LCJqdGkiOiJhM2FjMDU3OThlMmQ0ZjY1OWI5YWIzMzY1ODAxMzZjNiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.M7oM48E16fINyoslsWtKn9ekjGtIIeU6-DClH9aPCfY',	'2026-06-10 05:30:38.27991+00',	'2026-06-11 05:30:38+00',	NULL,	'a3ac05798e2d4f659b9ab336580136c6'),
(44,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTkzMywiaWF0IjoxNzgxMDY5NTMzLCJqdGkiOiJlZDQ2NjE2OGNhNTk0OTNlOWMxNGZhMDlkZWRkYzZhZiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.YHnBiNB4xWaYKt9480cdeixJPVRLOOESKd9HuB1a9lc',	'2026-06-10 05:32:13.102803+00',	'2026-06-11 05:32:13+00',	NULL,	'ed466168ca59493e9c14fa09deddc6af'),
(45,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTk0NSwiaWF0IjoxNzgxMDY5NTQ1LCJqdGkiOiIyMGNmNjgxZWNiZjU0NzE4ODAzYTU5NGNiMzA5YTJiMSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.DFk-PFTBzoBPPMVmwMyAhc08358EFGadA6qk3YC8VOc',	'2026-06-10 05:32:25.147605+00',	'2026-06-11 05:32:25+00',	NULL,	'20cf681ecbf54718803a594cb309a2b1'),
(46,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTk4MywiaWF0IjoxNzgxMDY5NTgzLCJqdGkiOiJmMzY0NzgxMWFhMmI0ZTVjOTdiZDdmY2FlZDZiNGFlMSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.lhWH36bDwBm_a_OhkPOfpE4aYtPwzFchAn7lw64Aje8',	'2026-06-10 05:33:03.067462+00',	'2026-06-11 05:33:03+00',	NULL,	'f3647811aa2b4e5c97bd7fcaed6b4ae1'),
(47,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NTk5NiwiaWF0IjoxNzgxMDY5NTk2LCJqdGkiOiIwMTQwMTYxYzgxNDE0ZjVmYTgwNGQzZWY0NTE0Zjk3OCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.pAI8mHsy3yYvb5vK9ojIsNqJplYYr_U9UQ7h8pqXkMI',	'2026-06-10 05:33:16.026141+00',	'2026-06-11 05:33:16+00',	NULL,	'0140161c81414f5fa804d3ef4514f978'),
(48,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjAwMSwiaWF0IjoxNzgxMDY5NjAxLCJqdGkiOiIzOGRkYTljOGE4Njg0Zjk2OGIwYTIwNzljZjY2ZjMwNCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.gGADLt5FCn2-8rjsWY4inkoEXawywWcbjX0k4EG0vyc',	'2026-06-10 05:33:21.935311+00',	'2026-06-11 05:33:21+00',	NULL,	'38dda9c8a8684f968b0a2079cf66f304'),
(49,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjAzNCwiaWF0IjoxNzgxMDY5NjM0LCJqdGkiOiJmM2EzMGZmOGYzMzI0MzMwYmYzOTdmNjM1NTQyN2I5ZiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.NWkHqVTUK6W0BafhaHt0rQb-oZURzcGpfHTyVmKSyDs',	'2026-06-10 05:33:54.416317+00',	'2026-06-11 05:33:54+00',	NULL,	'f3a30ff8f3324330bf397f6355427b9f'),
(50,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjA1NiwiaWF0IjoxNzgxMDY5NjU2LCJqdGkiOiI4NDljZTViZTRhOTE0MGNlYWQwODI4Yzg4OGRiMzJhOCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.E3_S15HOnWbLebNehsQXeI7zTe24x6ncnDds-0cbPBQ',	'2026-06-10 05:34:16.951048+00',	'2026-06-11 05:34:16+00',	NULL,	'849ce5be4a9140cead0828c888db32a8'),
(51,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjA2NywiaWF0IjoxNzgxMDY5NjY3LCJqdGkiOiJmYjVhMzUxNzYxMzI0NmIwODIzNTE0MGM1YTBkNmE3ZSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.h3Abtrtu0d5ed1CzdTXyibrOY2J_d9FS7XfuLQKZvQ0',	'2026-06-10 05:34:27.411409+00',	'2026-06-11 05:34:27+00',	NULL,	'fb5a3517613246b08235140c5a0d6a7e'),
(52,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjA5MiwiaWF0IjoxNzgxMDY5NjkyLCJqdGkiOiJjNDEwNjJkNWUxMTA0OTUwOTFkNTkwZGY3ZDNjZTUzMCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.uJgFL9r_u_nRRK3C4XfZFT2gorqeQre0Gr-XaTgHQUc',	'2026-06-10 05:34:52.309535+00',	'2026-06-11 05:34:52+00',	NULL,	'c41062d5e110495091d590df7d3ce530'),
(53,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjEwMywiaWF0IjoxNzgxMDY5NzAzLCJqdGkiOiJlZGU4NjkzNzhlYmU0YTY2YjE3ODkwZjY5NzExNGE3MiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.9qpdEMQpESczPdCEQUZui_8VMV1TTZOdBAT7_2Y-kQg',	'2026-06-10 05:35:03.457321+00',	'2026-06-11 05:35:03+00',	NULL,	'ede869378ebe4a66b17890f697114a72'),
(54,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjEwNywiaWF0IjoxNzgxMDY5NzA3LCJqdGkiOiIwNzQ0YWEwZDgwYTI0YjhkYTBmMzNmMGU2NDljZDVhNyIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.egfvOg8CYvh9YsDXdU5sS2ST7PBd8twRRb-mZYfN6O8',	'2026-06-10 05:35:07.575752+00',	'2026-06-11 05:35:07+00',	NULL,	'0744aa0d80a24b8da0f33f0e649cd5a7'),
(55,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjE0MCwiaWF0IjoxNzgxMDY5NzQwLCJqdGkiOiJjZjY5YzUyMjFhMjg0NjUwOGZmZmE4ZGQ5M2M2MDdkNCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.GERRDdcdIHTLQQWfyuSmviFuLRS13qjSSRR5Vmvxdpc',	'2026-06-10 05:35:40.69895+00',	'2026-06-11 05:35:40+00',	NULL,	'cf69c5221a2846508fffa8dd93c607d4'),
(56,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjE1NywiaWF0IjoxNzgxMDY5NzU3LCJqdGkiOiI0MzNhOWFlOTQ0ZjM0OWJiYTM3NDBmNWQ4OTU4ZDk0ZCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.DaARqhHgit3F5l_3OWEvOBa331P9mgcbXz4_VUsPBiI',	'2026-06-10 05:35:57.229676+00',	'2026-06-11 05:35:57+00',	NULL,	'433a9ae944f349bba3740f5d8958d94d'),
(57,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjE2NSwiaWF0IjoxNzgxMDY5NzY1LCJqdGkiOiIxYjIxYzczODMyYzQ0YzEwOWY3NjRlNzc4NjYwMTVjNiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.RR5yXh4_k0nWF4JHzrhMtSHM1DD1xP1lXuY71_AMNZ8',	'2026-06-10 05:36:05.556197+00',	'2026-06-11 05:36:05+00',	NULL,	'1b21c73832c44c109f764e77866015c6'),
(58,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjE2OSwiaWF0IjoxNzgxMDY5NzY5LCJqdGkiOiIwNmEwMzMwNjdmNmU0NGM5YmI4YTQ3ZTg0YzljZDdjZiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.DVS_m7HHg0b_2WKQVkXn48KzEpFAX8rf3pxO65akZ4w',	'2026-06-10 05:36:09.215535+00',	'2026-06-11 05:36:09+00',	NULL,	'06a033067f6e44c9bb8a47e84c9cd7cf'),
(59,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjIxNSwiaWF0IjoxNzgxMDY5ODE1LCJqdGkiOiJiYTcxZmQyZTUxYjg0MzkwOWNiODQzYzcwNTM5N2RlMiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.1av7hoQdilKu14LhrI7tbSQ_b5Ifd59fzEf2NDKxYxE',	'2026-06-10 05:36:55.674483+00',	'2026-06-11 05:36:55+00',	NULL,	'ba71fd2e51b843909cb843c705397de2'),
(60,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjIyNSwiaWF0IjoxNzgxMDY5ODI1LCJqdGkiOiI0YzQ3MWYyMDg3YTQ0YTUzYjc3MDhjMmYxY2NjMGY2OSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.vbbOjTJgnhsFiL1RRvmoW-0kj0g6OBCdL_nGcJuTpzA',	'2026-06-10 05:37:05.936807+00',	'2026-06-11 05:37:05+00',	NULL,	'4c471f2087a44a53b7708c2f1ccc0f69'),
(61,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjIyOSwiaWF0IjoxNzgxMDY5ODI5LCJqdGkiOiIzM2Q4NmQ2M2MxYzE0NGQ5ODE1NGU5MzNmNTg2M2M5YyIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.lUsdrR-t074495XuvDAY2h7AMlZ0mW1r5fOnFV_j4aU',	'2026-06-10 05:37:09.067227+00',	'2026-06-11 05:37:09+00',	NULL,	'33d86d63c1c144d98154e933f5863c9c'),
(62,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjIzMSwiaWF0IjoxNzgxMDY5ODMxLCJqdGkiOiI4N2NmM2U5ODY2NzM0NTQ3ODFjMWJkZmQxNjI3ZmM2NiIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.fHvXQKEP-_6_1ExXi42dK6ycarFvykLkisdfgVo6aHw',	'2026-06-10 05:37:11.872793+00',	'2026-06-11 05:37:11+00',	NULL,	'87cf3e986673454781c1bdfd1627fc66'),
(63,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjIzNSwiaWF0IjoxNzgxMDY5ODM1LCJqdGkiOiJiODhjY2RlMWNjOGI0ZjAyYWY5NTMyMmRmMTkxNTQ4MCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.C9vZHWMOWbcGvOgKg0KKXK4qbGJNbu2vMS6rDiwG8Zc',	'2026-06-10 05:37:15.872654+00',	'2026-06-11 05:37:15+00',	NULL,	'b88ccde1cc8b4f02af95322df1915480'),
(64,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjMzNiwiaWF0IjoxNzgxMDY5OTM2LCJqdGkiOiI2OWVmNWUxOThkZWY0ZjQ2OTFmNTE0MjhjYWZkMjNhOSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.Nx3zraZcxyTd0cUzrhV3fQ1eXI1XuNTWMsY4OTpMhwg',	'2026-06-10 05:38:56.809467+00',	'2026-06-11 05:38:56+00',	NULL,	'69ef5e198def4f4691f51428cafd23a9'),
(65,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjM0NSwiaWF0IjoxNzgxMDY5OTQ1LCJqdGkiOiJjOGRlODU4Y2ZiYjg0N2NiYjAzODQ2NTkwODAxNjM3YyIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.ESUbH1DN71Zg781DXC0bdzjHylPgoFDNPxyDs_Ebk0A',	'2026-06-10 05:39:05.702703+00',	'2026-06-11 05:39:05+00',	NULL,	'c8de858cfbb847cbb03846590801637c'),
(66,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjM0NywiaWF0IjoxNzgxMDY5OTQ3LCJqdGkiOiIxYTE1Zjc5MWVjNWQ0ODExYjA4OThkNTczMGVkY2U4NSIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.YCRdIaSYNWfKnP7BDrHRBmHqB4Xdpy9NnL6Qp9Lv_8A',	'2026-06-10 05:39:07.718197+00',	'2026-06-11 05:39:07+00',	NULL,	'1a15f791ec5d4811b0898d5730edce85'),
(67,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjM3MSwiaWF0IjoxNzgxMDY5OTcxLCJqdGkiOiIxMDViZWRlYzViOTA0YzI1Yjc4MmIzMWNhNTI0ZTU1OCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.FhQd8Btc_Srqp1WCJhdmI_olZX4bJfZGGzLL61V3Ufs',	'2026-06-10 05:39:31.939415+00',	'2026-06-11 05:39:31+00',	NULL,	'105bedec5b904c25b782b31ca524e558'),
(68,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTE1NjM3NCwiaWF0IjoxNzgxMDY5OTc0LCJqdGkiOiJmNjZhN2NiNmQ3ZDU0Y2M5ODA5ZTI2OTBlYmNhODI0OCIsInVzZXJfaWQiOiJkNzVkZTI3MS1iZjIzLTRkNzItOWVhNS00MTE1YzRmNDA1OGEifQ.fsWCZ9hvH-hBOR5WEqYR-JNi8KYpqZG0qeV3C6Md5bM',	'2026-06-10 05:39:34.233408+00',	'2026-06-11 05:39:34+00',	NULL,	'f66a7cb6d7d54cc9809e2690ebca8248'),
(87,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NjM1MCwiaWF0IjoxNzgxNTU5OTUwLCJqdGkiOiJmMTVjZGQyNjRhNTM0NWIyYWQxZjJjMmJiMzkxNDc1NSIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.UB9QZYIwUZJVhT0L9l6WxUnQwly-ucZkY4aHD4SpWRA',	'2026-06-15 21:45:50.512782+00',	'2026-06-16 21:45:50+00',	NULL,	'f15cdd264a5345b2ad1f2c2bb3914755'),
(92,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NzE5NCwiaWF0IjoxNzgxNTYwNzk0LCJqdGkiOiI5ODU5M2Y4M2U0NWI0NmYxODZkOTk0YTE1YWJmODA5ZSIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.SlC_ZOxavzXuLi4G1NpecAABUfh_uyeySgZj7uRpr_k',	'2026-06-15 21:59:54.836107+00',	'2026-06-16 21:59:54+00',	NULL,	'98593f83e45b46f186d994a15abf809e'),
(73,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0MjkwMCwiaWF0IjoxNzgxNTU2NTAwLCJqdGkiOiJhMTgyZTQxY2UwMDM0YTk2OWU4MmMyMWZmZGEwMTk5ZiIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.Kw-Q25NfgcbhDLWL5uppxcZ8fxnEh2OmLY7OsS7XHRU',	'2026-06-15 20:48:20.87709+00',	'2026-06-16 20:48:20+00',	NULL,	'a182e41ce0034a969e82c21ffda0199f'),
(78,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0Mzc5MiwiaWF0IjoxNzgxNTU3MzkyLCJqdGkiOiI3MTk1NDY4ZmNiZmI0NTMxYWQ1MjIzY2VhNWMyM2UzMCIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.fZTZ8YkSt6lQYxgfRwKWwDYYt1LU6ChRXBXjy1mPVXg',	'2026-06-15 21:03:12.407784+00',	'2026-06-16 21:03:12+00',	NULL,	'7195468fcbfb4531ad5223cea5c23e30'),
(83,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NDk1OSwiaWF0IjoxNzgxNTU4NTU5LCJqdGkiOiJkNWFmZWFkZDE1ZjQ0NjcxYTA0NmViYTI3ZTc5ZDVhYSIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.-k202_LabMnfKI_k0aOEtC5skh6qyfeIdsZTvs47mMU',	'2026-06-15 21:22:39.365386+00',	'2026-06-16 21:22:39+00',	NULL,	'd5afeadd15f44671a046eba27e79d5aa'),
(88,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NjcwOCwiaWF0IjoxNzgxNTYwMzA4LCJqdGkiOiI0N2Q2OWY1ZDk2NjI0MTdlYjZhNTg5ZTE0YmQwZDdkNCIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.ixjMuyj3QdhyU7Oupm7t_7ADynSqG8PD1HRfD7aVO7c',	'2026-06-15 21:51:48.811248+00',	'2026-06-16 21:51:48+00',	NULL,	'47d69f5d9662417eb6a589e14bd0d7d4'),
(93,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTY0NzIzMSwiaWF0IjoxNzgxNTYwODMxLCJqdGkiOiIzMDMxOWJlMmIzYWE0Y2I5OTgzMTU4MzQ2ODA3OGIzMyIsInVzZXJfaWQiOiJiMjAwNWNlNC02OWYwLTQ1YTktOGZhOC03NjgyNDQ4MjU1MDcifQ.P9GOz8t-7vW6svHcJJQOSJzJKzuJqc9Tb6H3NqqxLKY',	'2026-06-15 22:00:31.243225+00',	'2026-06-16 22:00:31+00',	NULL,	'30319be2b3aa4cb99831583468078b33'),
(100,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTcxOTc0NiwiaWF0IjoxNzgxNjMzMzQ2LCJqdGkiOiJmYjUzODFhMzdkYzE0ZTA0ODMxZTJlNmUwMGQ4OTMzZSIsInVzZXJfaWQiOiJjODFkYTM4NC1lNDY4LTRiMjMtYWM0ZS0wNjIwZDViNzBjZjgifQ.S8XqATg3VlvZxHEQ4F4Yw1lS8KgKqpZ_M1ld17SaAGk',	'2026-06-16 18:09:06.737432+00',	'2026-06-17 18:09:06+00',	NULL,	'fb5381a37dc14e04831e2e6e00d8933e'),
(104,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTczNTIxMCwiaWF0IjoxNzgxNjQ4ODEwLCJqdGkiOiI0ZjM3MzIyYWU5N2U0ZTljOTlmMTIxZmY3NGQwNTdmMCIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.gfBtgaDdGCNkbHmObzT2yLLm80Wtd6RUxUTMbq7U65Q',	'2026-06-16 22:26:50.076715+00',	'2026-06-17 22:26:50+00',	NULL,	'4f37322ae97e4e9c99f121ff74d057f0'),
(108,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTgxOTExMCwiaWF0IjoxNzgxNzMyNzEwLCJqdGkiOiI0MGI0ZGJlNmVjNjQ0NGY3YWY0NjI0MDQ5OTQwOGM4OSIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.PD27K5vGa_QwohIqcyY0FO9J2jEcUiY2gmWy6p7KBD8',	'2026-06-17 21:45:10.382491+00',	'2026-06-18 21:45:10+00',	NULL,	'40b4dbe6ec6444f7af46240499408c89'),
(112,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTg5NDE5MSwiaWF0IjoxNzgxODA3NzkxLCJqdGkiOiIxZDAyY2RjOTlkYmQ0MzFlYjBiYmI4ZTQ4OTJlYWRkNSIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.d1aFZxeqCbI2n2CUc_b7SqOsnzU_PG1kIGwtSJEtamU',	'2026-06-18 18:36:31.86157+00',	'2026-06-19 18:36:31+00',	NULL,	'1d02cdc99dbd431eb0bbb8e4892eadd5'),
(116,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTg5NjkwOSwiaWF0IjoxNzgxODEwNTA5LCJqdGkiOiJlNTc0MzAxNzEwMDA0NDY4OGI2ZjA4YmQ3Y2VjNzJjNyIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.oYUHYthFP8KtfQlv-_6p-iFAgawqy3ewUmbJyCmGb6w',	'2026-06-18 19:21:49.900413+00',	'2026-06-19 19:21:49+00',	NULL,	'e5743017100044688b6f08bd7cec72c7'),
(120,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTg5OTk1MCwiaWF0IjoxNzgxODEzNTUwLCJqdGkiOiI2NTczMjFlMGI5YTU0NGJkODc5OTRkNTUzNGExOWRlMyIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.DlIHxLzJyyIwbWH0JAmfZEzCkUALS3iKfSL5Iet7mX4',	'2026-06-18 20:12:30.60246+00',	'2026-06-19 20:12:30+00',	NULL,	'657321e0b9a544bd87994d5534a19de3'),
(124,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTkwMDYwNSwiaWF0IjoxNzgxODE0MjA1LCJqdGkiOiI4ZDk4NzViNWNjYTA0OWRmOGYzODAzMDhiYzcxMmZkYiIsInVzZXJfaWQiOiI3YWE2MGMzNy1iMjIxLTRjYjQtYjM0Yi1kYTI2ZTY5M2U1NGEifQ.zo646gL3VoR2Td2ZAX9z6LVrTLh9_7Jp9_jBDj0_ALQ',	'2026-06-18 20:23:25.789359+00',	'2026-06-19 20:23:25+00',	NULL,	'8d9875b5cca049df8f380308bc712fdb'),
(126,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MTkxODE2NywiaWF0IjoxNzgxODMxNzY3LCJqdGkiOiIzZmI2Yjc4NmZmNmQ0NTkyYTllM2ZhOGUxM2JmYjU0NCIsInVzZXJfaWQiOiIyNzYyZWRhZi00MTVkLTQ3ODktOTRjOS05OTJhMzY4M2ViZWQifQ.PtI9XID8dlbl9YofTNsbivZIIBz7R-_sYmCPWvrUb_M',	'2026-06-19 01:16:07.889952+00',	'2026-06-20 01:16:07+00',	'2762edaf-415d-4789-94c9-992a3683ebed',	'3fb6b786ff6d4592a9e3fa8e13bfb544'),
(127,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc4MjAwNjI4NCwiaWF0IjoxNzgxOTE5ODg0LCJqdGkiOiJmZjU5NjliYzg1OTQ0ZDgxODAzYmZjYzAyOGVlMzY0MSIsInVzZXJfaWQiOiIyNzYyZWRhZi00MTVkLTQ3ODktOTRjOS05OTJhMzY4M2ViZWQifQ.6qOKFoEnwVJnowdhLZqKhStCTI_oEctspc8WPu9HLl0',	'2026-06-20 01:44:44.365027+00',	'2026-06-21 01:44:44+00',	'2762edaf-415d-4789-94c9-992a3683ebed',	'ff5969bc85944d81803bfcc028ee3641');

DROP TABLE IF EXISTS "users";
CREATE TABLE "public"."users" (
    "password" character varying(128) NOT NULL,
    "last_login" timestamptz,
    "is_superuser" boolean NOT NULL,
    "first_name" character varying(150) NOT NULL,
    "last_name" character varying(150) NOT NULL,
    "is_staff" boolean NOT NULL,
    "is_active" boolean NOT NULL,
    "date_joined" timestamptz NOT NULL,
    "user_id" uuid NOT NULL,
    "email" character varying(254) NOT NULL,
    "user_type" character varying(1) NOT NULL,
    "gender" character varying(1),
    "student_type" character varying(1),
    "first_comp" integer,
    "skill_level" character varying(1),
    "grad_date" date,
    "is_competing" boolean NOT NULL,
    "has_paid" boolean NOT NULL,
    "proof_of_reg" boolean NOT NULL,
    "school_id" uuid,
    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
)
WITH (oids = false);

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);

CREATE INDEX users_email_0ea73cca_like ON public.users USING btree (email varchar_pattern_ops);

CREATE INDEX users_school_id_00497666 ON public.users USING btree (school_id);

INSERT INTO "users" ("password", "last_login", "is_superuser", "first_name", "last_name", "is_staff", "is_active", "date_joined", "user_id", "email", "user_type", "gender", "student_type", "first_comp", "skill_level", "grad_date", "is_competing", "has_paid", "proof_of_reg", "school_id") VALUES
('pbkdf2_sha256$1200000$U8loEr6TN0opo2hllfDCZJ$0OtB5qzyaOeTWC3MPx1lTSTA98xGLRvBwqDMgW9miAw=',	NULL,	'0',	'Dilan',	'Kaza',	'0',	'1',	'2026-06-04 00:10:12.851626+00',	'a175eae0-8e4e-4557-aa3b-45434257483b',	'dilankaza@gmail.com',	'C',	'F',	'3',	2020,	'I',	'2028-05-01',	'0',	'0',	'0',	'516d7666-38ab-458b-be51-c959931737af'),
('pbkdf2_sha256$1200000$qdoalrqteKdcwfUByBDpjV$yJAgSj8AJMI3JEO66Nvhz1yHIJpMbSATzLhUpde9ETo=',	'2026-06-16 18:03:55.076721+00',	'1',	'',	'',	'1',	'1',	'2026-06-02 17:54:02.733714+00',	'feb77810-ebbc-40d8-a890-c3aa8d7b2ec4',	'dkaza0001@gmail.com',	'C',	'M',	'4',	2020,	'A',	'2026-05-23',	'0',	'0',	'0',	NULL),
('pbkdf2_sha256$1200000$ZpMBUC4WxxuqkwZHTb9awa$TJjjuByvRgQjriCFNgkBvL4ZbedTEcuPiJqHaa1gPlI=',	NULL,	'0',	'Dilan',	'Kaza',	'0',	'1',	'2026-06-19 01:16:01.246374+00',	'2762edaf-415d-4789-94c9-992a3683ebed',	'dilan2kaza@gmail.com',	'C',	'M',	'4',	2020,	'B',	'2026-05-01',	'0',	'0',	'0',	'd65046bd-757c-4615-a197-67b1a2564b6f');

DROP TABLE IF EXISTS "users_groups";
CREATE TABLE "public"."users_groups" (
    "id" bigint DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "user_id" uuid NOT NULL,
    "group_id" integer NOT NULL,
    CONSTRAINT "users_groups_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX users_groups_user_id_group_id_fc7788e8_uniq ON public.users_groups USING btree (user_id, group_id);

CREATE INDEX users_groups_user_id_f500bee5 ON public.users_groups USING btree (user_id);

CREATE INDEX users_groups_group_id_2f3517aa ON public.users_groups USING btree (group_id);


DROP TABLE IF EXISTS "users_user_permissions";
CREATE TABLE "public"."users_user_permissions" (
    "id" bigint DEFAULT GENERATED ALWAYS AS IDENTITY NOT NULL,
    "user_id" uuid NOT NULL,
    "permission_id" integer NOT NULL,
    CONSTRAINT "users_user_permissions_pkey" PRIMARY KEY ("id")
)
WITH (oids = false);

CREATE UNIQUE INDEX users_user_permissions_user_id_permission_id_3b86cbdf_uniq ON public.users_user_permissions USING btree (user_id, permission_id);

CREATE INDEX users_user_permissions_user_id_92473840 ON public.users_user_permissions USING btree (user_id);

CREATE INDEX users_user_permissions_permission_id_6d08dcd2 ON public.users_user_permissions USING btree (permission_id);


ALTER TABLE ONLY "public"."auth_group_permissions" ADD CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY "public"."auth_group_permissions" ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."auth_permission" ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."authtoken_token" ADD CONSTRAINT "authtoken_token_user_id_35299eff_fk_users_user_id" FOREIGN KEY (user_id) REFERENCES users(user_id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."django_admin_log" ADD CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY "public"."django_admin_log" ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_users_user_id" FOREIGN KEY (user_id) REFERENCES users(user_id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."groupset" ADD CONSTRAINT "groupset_school_id_aa09da97_fk_colleges_college_id" FOREIGN KEY (school_id) REFERENCES colleges(college_id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."groupset_members" ADD CONSTRAINT "groupset_members_groupset_id_c9038c4e_fk_groupset_groupset_id" FOREIGN KEY (groupset_id) REFERENCES groupset(groupset_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY "public"."groupset_members" ADD CONSTRAINT "groupset_members_member_0887578e_fk_users_user_id" FOREIGN KEY (member) REFERENCES users(user_id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."registration" ADD CONSTRAINT "registration_competitor_id_009e87d1_fk_users_user_id" FOREIGN KEY (competitor_id) REFERENCES users(user_id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY "public"."registration" ADD CONSTRAINT "registration_event_code_b18d579f_fk_events_event_code" FOREIGN KEY (event_code) REFERENCES events(event_code) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."settings" ADD CONSTRAINT "settings_school_id_85cbda11_fk_colleges_college_id" FOREIGN KEY (school_id) REFERENCES colleges(college_id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."token_blacklist_blacklistedtoken" ADD CONSTRAINT "token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk" FOREIGN KEY (token_id) REFERENCES token_blacklist_outstandingtoken(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."token_blacklist_outstandingtoken" ADD CONSTRAINT "token_blacklist_outs_user_id_83bc629a_fk_users_use" FOREIGN KEY (user_id) REFERENCES users(user_id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."users" ADD CONSTRAINT "users_school_id_00497666_fk_colleges_college_id" FOREIGN KEY (school_id) REFERENCES colleges(college_id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."users_groups" ADD CONSTRAINT "users_groups_group_id_2f3517aa_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY "public"."users_groups" ADD CONSTRAINT "users_groups_user_id_f500bee5_fk_users_user_id" FOREIGN KEY (user_id) REFERENCES users(user_id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."users_user_permissions" ADD CONSTRAINT "users_user_permissio_permission_id_6d08dcd2_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY "public"."users_user_permissions" ADD CONSTRAINT "users_user_permissions_user_id_92473840_fk_users_user_id" FOREIGN KEY (user_id) REFERENCES users(user_id) DEFERRABLE INITIALLY DEFERRED;

-- 2026-06-20 21:17:00 UTC