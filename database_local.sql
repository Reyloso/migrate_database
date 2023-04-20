/*
 Navicat Premium Data Transfer

 Source Server         : migrate_database_local
 Source Server Type    : PostgreSQL
 Source Server Version : 140003 (140003)
 Source Host           : localhost:5432
 Source Catalog        : main_database
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140003 (140003)
 File Encoding         : 65001

 Date: 19/04/2023 20:02:08
*/


-- ----------------------------
-- Sequence structure for Databases_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Databases_id_seq";
CREATE SEQUENCE "public"."Databases_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Invoices_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Invoices_id_seq";
CREATE SEQUENCE "public"."Invoices_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Migratelogs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."Migratelogs_id_seq";
CREATE SEQUENCE "public"."Migratelogs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Databases
-- ----------------------------
DROP TABLE IF EXISTS "public"."Databases";
CREATE TABLE "public"."Databases" (
  "id" int4 NOT NULL DEFAULT nextval('"Databases_id_seq"'::regclass),
  "database_engine" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "database_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "database_username" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "database_password" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "database_host" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "database_port" int4 NOT NULL,
  "extraction_query" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" bool NOT NULL DEFAULT true,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of Databases
-- ----------------------------
INSERT INTO "public"."Databases" VALUES (1, 'postgres', 'invoice_database', 'postgres', 'm1gr@t3D@tabs3', 'localhost', 5432, 'SELECT  iv."InvoiceId", iv."CustomerId", concat(cu."FirstName",'' '',cu."LastName") as "CustomerName", iv."BillingCity", iv."BillingCountry", iv."BillingAddress", round(iv."Total"*0.19,2) as "InvoiceTax", iv."Total" as "InvoiceTotal", count(ivl."Quantity") as "InvoiceProductQuantity", iv."InvoiceDate" FROM "Invoice"  iv INNER JOIN "Customer" cu ON cu."CustomerId" = iv."CustomerId" INNER JOIN "InvoiceLine" ivl on iv."InvoiceId" = ivl."InvoiceId" GROUP BY iv."InvoiceId", "CustomerName"', 't', '2023-04-20 00:08:11.141+00', '2023-04-20 00:08:11.141+00', NULL);

-- ----------------------------
-- Table structure for Invoices
-- ----------------------------
DROP TABLE IF EXISTS "public"."Invoices";
CREATE TABLE "public"."Invoices" (
  "id" int4 NOT NULL DEFAULT nextval('"Invoices_id_seq"'::regclass),
  "InvoiceId" int4 NOT NULL,
  "CustomerId" int4 NOT NULL,
  "CustomerName" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "BillingCity" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "BillingCountry" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "BillingAddress" text COLLATE "pg_catalog"."default" NOT NULL,
  "InvoiceTax" float8 NOT NULL,
  "InvoiceTotal" float8 NOT NULL,
  "InvoiceProductQuantity" int4 NOT NULL,
  "InvoiceDate" timestamptz(6) NOT NULL,
  "created_at" timestamptz(6) NOT NULL,
  "updated_at" timestamptz(6),
  "deleted_at" timestamptz(6)
)
;

-- ----------------------------
-- Records of Invoices
-- ----------------------------
INSERT INTO "public"."Invoices" VALUES (1, 49, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 0.38, 1.98, 2, '2009-08-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (2, 101, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 1.13, 5.94, 6, '2010-03-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (3, 320, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 2.63, 13.86, 14, '2012-11-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (4, 159, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 2.63, 13.86, 14, '2010-11-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (5, 145, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 2.63, 13.86, 14, '2010-09-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (6, 125, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 0.19, 0.99, 1, '2010-06-30 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (7, 247, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 0.75, 3.96, 4, '2011-12-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (8, 251, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 0.19, 0.99, 1, '2012-01-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (9, 35, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 0.38, 1.98, 2, '2009-06-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (10, 202, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 0.38, 1.99, 1, '2011-06-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (11, 240, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 0.75, 3.96, 4, '2011-11-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (12, 196, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 0.38, 1.98, 2, '2011-05-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (13, 253, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 0.38, 1.98, 2, '2012-01-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (14, 59, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 1.13, 5.94, 6, '2009-09-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (15, 363, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 0.19, 0.99, 1, '2013-05-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (16, 218, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 0.38, 1.98, 2, '2011-08-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (17, 409, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 1.13, 5.94, 6, '2013-12-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (18, 241, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 1.13, 5.94, 6, '2011-11-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (19, 308, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 0.76, 3.98, 2, '2012-09-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (20, 272, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 0.19, 0.99, 1, '2012-04-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (21, 359, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 0.75, 3.96, 4, '2013-05-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (22, 343, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 0.38, 1.98, 2, '2013-02-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (23, 195, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 0.19, 0.99, 1, '2011-05-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (24, 344, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 0.38, 1.98, 2, '2013-02-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (25, 221, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 1.69, 8.91, 9, '2011-08-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (26, 405, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 0.19, 0.99, 1, '2013-11-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (27, 112, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 0.38, 1.98, 2, '2010-05-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (28, 90, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 0.19, 0.99, 1, '2010-01-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (29, 361, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 1.69, 8.91, 9, '2013-05-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (30, 219, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 0.75, 3.96, 4, '2011-08-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (31, 283, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 1.13, 5.94, 6, '2012-05-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (32, 142, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 0.75, 3.96, 4, '2010-09-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (33, 259, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 0.38, 1.98, 2, '2012-02-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (34, 280, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 0.38, 1.98, 2, '2012-05-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (35, 394, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 0.75, 3.96, 4, '2013-10-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (36, 404, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 4.91, 25.86, 14, '2013-11-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (37, 128, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 0.75, 3.96, 4, '2010-07-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (38, 107, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 0.75, 3.96, 4, '2010-04-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (39, 370, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 0.19, 0.99, 1, '2013-06-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (40, 303, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 0.75, 3.96, 4, '2012-08-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (41, 171, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 1.13, 5.94, 6, '2011-01-17 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (42, 216, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 0.19, 0.99, 1, '2011-08-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (43, 245, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 0.38, 1.98, 2, '2011-12-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (44, 205, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 1.51, 7.96, 4, '2011-06-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (45, 33, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 2.63, 13.86, 14, '2009-05-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (46, 183, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 0.38, 1.98, 2, '2011-03-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (47, 366, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 0.75, 3.96, 4, '2013-06-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (48, 8, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 0.38, 1.98, 2, '2009-02-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (49, 12, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 2.63, 13.86, 14, '2009-02-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (50, 55, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 0.19, 0.99, 1, '2009-08-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (51, 265, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 0.19, 0.99, 1, '2012-03-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (52, 246, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 0.38, 1.98, 2, '2011-12-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (53, 45, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 1.13, 5.94, 6, '2009-07-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (54, 37, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 0.75, 3.96, 4, '2009-06-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (55, 156, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 0.75, 3.96, 4, '2010-11-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (56, 167, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 0.19, 0.99, 1, '2011-01-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (57, 395, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 1.13, 5.94, 6, '2013-10-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (58, 62, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 0.19, 0.99, 1, '2009-09-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (59, 309, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 0.76, 3.98, 2, '2012-09-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (60, 220, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 1.13, 5.94, 6, '2011-08-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (61, 325, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 1.13, 5.94, 6, '2012-11-29 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (62, 106, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 0.38, 1.98, 2, '2010-04-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (63, 222, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 2.63, 13.86, 14, '2011-08-30 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (64, 150, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 1.13, 5.94, 6, '2010-10-16 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (65, 193, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 2.83, 14.91, 9, '2011-04-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (66, 268, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 0.75, 3.96, 4, '2012-03-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (67, 302, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 0.38, 1.98, 2, '2012-08-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (68, 329, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 0.38, 1.98, 2, '2012-12-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (69, 66, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 1.13, 5.94, 6, '2009-10-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (70, 318, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 1.13, 5.94, 6, '2012-10-29 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (71, 122, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 1.13, 5.94, 6, '2010-06-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (72, 54, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 2.63, 13.86, 14, '2009-08-16 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (73, 28, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 0.38, 1.98, 2, '2009-05-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (74, 188, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 0.19, 0.99, 1, '2011-04-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (75, 47, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 2.63, 13.86, 14, '2009-07-16 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (76, 296, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 0.75, 3.96, 4, '2012-07-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (77, 58, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 0.75, 3.96, 4, '2009-09-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (78, 52, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 1.13, 5.94, 6, '2009-08-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (79, 319, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 1.69, 8.91, 9, '2012-11-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (80, 185, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 1.13, 5.94, 6, '2011-03-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (81, 88, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 3.4, 17.91, 9, '2010-01-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (82, 352, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 0.75, 3.96, 4, '2013-04-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (83, 350, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 0.38, 1.98, 2, '2013-03-31 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (84, 400, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 0.38, 1.98, 2, '2013-11-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (85, 22, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 0.38, 1.98, 2, '2009-04-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (86, 70, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 0.38, 1.98, 2, '2009-11-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (87, 295, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 0.38, 1.98, 2, '2012-07-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (88, 407, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 0.38, 1.98, 2, '2013-12-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (89, 392, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 0.38, 1.98, 2, '2013-10-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (90, 403, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 1.69, 8.91, 9, '2013-11-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (91, 144, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 1.69, 8.91, 9, '2010-09-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (92, 138, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 2.63, 13.86, 14, '2010-08-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (93, 168, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 0.38, 1.98, 2, '2011-01-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (94, 152, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 2.63, 13.86, 14, '2010-10-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (95, 271, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 2.63, 13.86, 14, '2012-04-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (96, 348, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 2.63, 13.86, 14, '2013-03-10 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (97, 214, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 1.69, 8.91, 9, '2011-07-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (98, 160, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 0.19, 0.99, 1, '2010-12-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (99, 228, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 1.69, 8.91, 9, '2011-09-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (100, 375, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 1.69, 8.91, 9, '2013-07-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (101, 369, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 2.63, 13.86, 14, '2013-06-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (102, 371, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 0.38, 1.98, 2, '2013-07-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (103, 311, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 2.27, 11.94, 6, '2012-09-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (104, 340, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 1.69, 8.91, 9, '2013-02-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (105, 315, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 0.38, 1.98, 2, '2012-10-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (106, 181, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 0.19, 0.99, 1, '2011-03-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (107, 307, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 0.38, 1.99, 1, '2012-09-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (108, 127, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 0.38, 1.98, 2, '2010-07-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (109, 26, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 2.63, 13.86, 14, '2009-04-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (110, 151, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 1.69, 8.91, 9, '2010-10-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (111, 353, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 1.13, 5.94, 6, '2013-04-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (112, 3, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 1.13, 5.94, 6, '2009-01-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (113, 372, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 0.38, 1.98, 2, '2013-07-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (114, 19, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 2.63, 13.86, 14, '2009-03-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (115, 140, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 0.38, 1.98, 2, '2010-09-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (116, 249, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 1.69, 8.91, 9, '2011-12-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (117, 43, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 0.38, 1.98, 2, '2009-07-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (118, 200, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 1.69, 8.91, 9, '2011-05-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (119, 27, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 0.19, 0.99, 1, '2009-04-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (120, 116, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 1.69, 8.91, 9, '2010-05-17 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (121, 297, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 1.13, 5.94, 6, '2012-07-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (122, 163, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 0.75, 3.96, 4, '2010-12-16 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (123, 165, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 1.69, 8.91, 9, '2010-12-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (124, 285, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 2.63, 13.86, 14, '2012-06-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (125, 326, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 1.69, 8.91, 9, '2012-12-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (126, 234, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 1.13, 5.94, 6, '2011-10-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (127, 406, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 0.38, 1.98, 2, '2013-12-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (128, 208, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 3.01, 15.86, 14, '2011-06-29 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (129, 388, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 1.13, 5.94, 6, '2013-09-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (130, 314, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 0.19, 0.99, 1, '2012-10-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (131, 21, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 0.38, 1.98, 2, '2009-04-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (132, 114, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 0.75, 3.96, 4, '2010-05-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (133, 333, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 1.69, 8.91, 9, '2013-01-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (134, 330, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 0.38, 1.98, 2, '2012-12-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (135, 113, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 0.38, 1.98, 2, '2010-05-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (136, 412, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 0.38, 1.99, 1, '2013-12-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (137, 224, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 0.38, 1.98, 2, '2011-09-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (138, 178, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 1.13, 5.94, 6, '2011-02-17 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (139, 277, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 1.69, 8.91, 9, '2012-04-29 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (140, 180, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 2.63, 13.86, 14, '2011-02-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (141, 98, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 0.76, 3.98, 2, '2010-03-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (142, 324, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 0.75, 3.96, 4, '2012-11-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (143, 267, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 0.38, 1.98, 2, '2012-03-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (144, 13, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 0.19, 0.99, 1, '2009-02-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (145, 182, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 0.38, 1.98, 2, '2011-03-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (146, 328, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 0.19, 0.99, 1, '2012-12-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (147, 385, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 0.38, 1.98, 2, '2013-09-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (148, 189, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 0.38, 1.98, 2, '2011-04-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (149, 191, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 0.75, 3.96, 4, '2011-04-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (150, 1, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 0.38, 1.98, 2, '2009-01-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (151, 115, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 1.13, 5.94, 6, '2010-05-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (152, 399, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 0.38, 1.98, 2, '2013-11-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (153, 51, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 0.75, 3.96, 4, '2009-08-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (154, 91, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 0.38, 1.98, 2, '2010-02-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (155, 118, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 0.19, 0.99, 1, '2010-05-30 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (156, 276, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 1.13, 5.94, 6, '2012-04-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (157, 186, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 1.69, 8.91, 9, '2011-03-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (158, 380, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 0.75, 3.96, 4, '2013-08-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (159, 339, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 1.13, 5.94, 6, '2013-01-30 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (160, 89, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 3.58, 18.86, 14, '2010-01-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (161, 323, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 0.38, 1.98, 2, '2012-11-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (162, 76, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 0.19, 0.99, 1, '2009-11-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (163, 61, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 2.63, 13.86, 14, '2009-09-16 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (164, 300, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 0.19, 0.99, 1, '2012-08-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (165, 109, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 1.69, 8.91, 9, '2010-04-16 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (166, 255, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 1.13, 5.94, 6, '2012-01-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (167, 238, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 0.38, 1.98, 2, '2011-11-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (168, 382, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 1.69, 8.91, 9, '2013-08-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (169, 347, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 1.69, 8.91, 9, '2013-03-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (170, 137, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 1.69, 8.91, 9, '2010-08-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (171, 126, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 0.38, 1.98, 2, '2010-07-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (172, 166, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 2.63, 13.86, 14, '2010-12-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (173, 368, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 1.69, 8.91, 9, '2013-06-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (174, 231, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 0.38, 1.98, 2, '2011-10-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (175, 79, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 0.75, 3.96, 4, '2009-12-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (176, 111, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 0.19, 0.99, 1, '2010-04-29 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (177, 331, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 0.75, 3.96, 4, '2012-12-29 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (178, 398, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 0.19, 0.99, 1, '2013-10-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (179, 384, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 0.19, 0.99, 1, '2013-08-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (180, 7, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 0.38, 1.98, 2, '2009-02-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (181, 146, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 0.19, 0.99, 1, '2010-10-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (182, 334, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 2.63, 13.86, 14, '2013-01-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (183, 141, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 0.38, 1.98, 2, '2010-09-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (184, 201, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 3.58, 18.86, 14, '2011-05-29 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (185, 120, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 0.38, 1.98, 2, '2010-06-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (186, 373, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 0.75, 3.96, 4, '2013-07-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (187, 257, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 2.63, 13.86, 14, '2012-02-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (188, 346, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 1.13, 5.94, 6, '2013-03-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (189, 383, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 2.63, 13.86, 14, '2013-08-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (190, 23, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 0.75, 3.96, 4, '2009-04-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (191, 77, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 0.38, 1.98, 2, '2009-12-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (192, 244, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 0.19, 0.99, 1, '2011-12-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (193, 252, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 0.38, 1.98, 2, '2012-01-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (194, 139, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 0.19, 0.99, 1, '2010-08-31 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (195, 29, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 0.38, 1.98, 2, '2009-05-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (196, 291, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 1.69, 8.91, 9, '2012-06-30 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (197, 174, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 0.19, 0.99, 1, '2011-02-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (198, 10, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 1.13, 5.94, 6, '2009-02-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (199, 75, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 2.63, 13.86, 14, '2009-11-17 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (200, 85, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 0.38, 1.98, 2, '2010-01-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (201, 391, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 0.19, 0.99, 1, '2013-09-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (202, 408, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 0.75, 3.96, 4, '2013-12-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (203, 358, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 0.38, 1.98, 2, '2013-05-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (204, 170, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 0.75, 3.96, 4, '2011-01-16 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (205, 335, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 0.19, 0.99, 1, '2013-01-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (206, 78, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 0.38, 1.98, 2, '2009-12-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (207, 158, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 1.69, 8.91, 9, '2010-11-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (208, 15, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 0.38, 1.98, 2, '2009-03-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (209, 387, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 0.75, 3.96, 4, '2013-09-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (210, 396, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 1.69, 8.91, 9, '2013-10-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (211, 256, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 1.69, 8.91, 9, '2012-01-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (212, 39, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 1.69, 8.91, 9, '2009-06-10 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (213, 232, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 0.38, 1.98, 2, '2011-10-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (214, 134, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 0.38, 1.98, 2, '2010-08-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (215, 263, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 1.69, 8.91, 9, '2012-02-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (216, 34, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 0.19, 0.99, 1, '2009-05-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (217, 82, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 2.63, 13.86, 14, '2009-12-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (218, 17, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 1.13, 5.94, 6, '2009-03-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (219, 298, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 2.07, 10.91, 9, '2012-07-31 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (220, 80, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 1.13, 5.94, 6, '2009-12-10 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (221, 67, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 1.69, 8.91, 9, '2009-10-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (222, 294, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 0.38, 1.98, 2, '2012-07-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (223, 379, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 0.38, 1.98, 2, '2013-08-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (224, 96, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 4.15, 21.86, 14, '2010-02-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (225, 172, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 1.69, 8.91, 9, '2011-01-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (226, 227, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 1.13, 5.94, 6, '2011-09-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (227, 378, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 0.38, 1.98, 2, '2013-08-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (228, 260, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 0.38, 1.98, 2, '2012-02-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (229, 351, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 0.38, 1.98, 2, '2013-03-31 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (230, 217, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 0.38, 1.98, 2, '2011-08-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (231, 321, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 0.19, 0.99, 1, '2012-11-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (232, 190, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 0.38, 1.98, 2, '2011-04-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (233, 356, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 0.19, 0.99, 1, '2013-04-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (234, 262, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 1.13, 5.94, 6, '2012-02-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (235, 230, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 0.19, 0.99, 1, '2011-10-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (236, 239, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 0.38, 1.98, 2, '2011-11-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (237, 24, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 1.13, 5.94, 6, '2009-04-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (238, 72, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 0.75, 3.96, 4, '2009-11-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (239, 389, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 1.69, 8.91, 9, '2013-09-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (240, 132, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 0.19, 0.99, 1, '2010-07-31 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (241, 60, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 1.69, 8.91, 9, '2009-09-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (242, 149, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 0.75, 3.96, 4, '2010-10-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (243, 129, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 1.13, 5.94, 6, '2010-07-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (244, 95, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 1.69, 8.91, 9, '2010-02-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (245, 211, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 0.38, 1.98, 2, '2011-07-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (246, 69, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 0.19, 0.99, 1, '2009-10-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (247, 229, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 2.63, 13.86, 14, '2011-09-30 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (248, 336, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 0.38, 1.98, 2, '2013-01-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (249, 155, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 0.38, 1.98, 2, '2010-11-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (250, 18, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 1.69, 8.91, 9, '2009-03-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (251, 337, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 0.38, 1.98, 2, '2013-01-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (252, 117, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 2.63, 13.86, 14, '2010-05-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (253, 364, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 0.38, 1.98, 2, '2013-06-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (254, 243, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 2.63, 13.86, 14, '2011-12-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (255, 349, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 0.19, 0.99, 1, '2013-03-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (256, 266, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 0.38, 1.98, 2, '2012-03-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (257, 135, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 0.75, 3.96, 4, '2010-08-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (258, 207, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 1.69, 8.91, 9, '2011-06-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (259, 288, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 0.38, 1.98, 2, '2012-06-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (260, 136, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 1.13, 5.94, 6, '2010-08-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (261, 381, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 1.13, 5.94, 6, '2013-08-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (262, 56, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 0.38, 1.98, 2, '2009-09-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (263, 154, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 0.38, 1.98, 2, '2010-11-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (264, 97, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 0.38, 1.99, 1, '2010-02-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (265, 282, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 0.75, 3.96, 4, '2012-05-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (266, 9, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 0.75, 3.96, 4, '2009-02-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (267, 235, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 1.69, 8.91, 9, '2011-10-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (268, 40, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 2.63, 13.86, 14, '2009-06-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (269, 71, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 0.38, 1.98, 2, '2009-11-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (270, 293, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 0.19, 0.99, 1, '2012-07-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (271, 83, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 0.19, 0.99, 1, '2009-12-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (272, 360, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 1.13, 5.94, 6, '2013-05-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (273, 377, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 0.19, 0.99, 1, '2013-07-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (274, 236, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 2.63, 13.86, 14, '2011-10-31 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (275, 46, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 1.69, 8.91, 9, '2009-07-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (276, 338, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 0.75, 3.96, 4, '2013-01-29 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (277, 197, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 0.38, 1.98, 2, '2011-05-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (278, 310, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 1.51, 7.96, 4, '2012-09-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (279, 264, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 2.63, 13.86, 14, '2012-03-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (280, 198, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 0.75, 3.96, 4, '2011-05-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (281, 93, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 0.75, 3.96, 4, '2010-02-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (282, 124, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 2.63, 13.86, 14, '2010-06-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (283, 313, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 3.2, 16.86, 14, '2012-10-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (284, 357, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 0.38, 1.98, 2, '2013-05-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (285, 292, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 2.63, 13.86, 14, '2012-07-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (286, 119, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 0.38, 1.98, 2, '2010-06-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (287, 105, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 0.38, 1.98, 2, '2010-04-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (288, 397, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 2.63, 13.86, 14, '2013-10-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (289, 386, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 0.38, 1.98, 2, '2013-09-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (290, 261, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 0.75, 3.96, 4, '2012-02-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (291, 11, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 1.69, 8.91, 9, '2009-02-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (292, 355, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 2.63, 13.86, 14, '2013-04-10 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (293, 367, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 1.13, 5.94, 6, '2013-06-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (294, 248, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 1.13, 5.94, 6, '2011-12-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (295, 57, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 0.38, 1.98, 2, '2009-09-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (296, 73, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 1.13, 5.94, 6, '2009-11-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (297, 278, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 2.63, 13.86, 14, '2012-05-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (298, 362, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 2.63, 13.86, 14, '2013-05-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (299, 147, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 0.38, 1.98, 2, '2010-10-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (300, 411, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 2.63, 13.86, 14, '2013-12-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (301, 31, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 1.13, 5.94, 6, '2009-05-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (302, 312, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 2.07, 10.91, 9, '2012-10-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (303, 100, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 0.75, 3.96, 4, '2010-03-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (304, 68, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 2.63, 13.86, 14, '2009-10-17 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (305, 44, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 0.75, 3.96, 4, '2009-07-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (306, 5, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 2.63, 13.86, 14, '2009-01-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (307, 289, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 0.75, 3.96, 4, '2012-06-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (308, 94, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 1.13, 5.94, 6, '2010-02-10 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (309, 2, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 0.75, 3.96, 4, '2009-01-02 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (310, 86, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 0.75, 3.96, 4, '2010-01-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (311, 206, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 1.7, 8.94, 6, '2011-06-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (312, 242, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 1.69, 8.91, 9, '2011-11-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (313, 175, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 0.38, 1.98, 2, '2011-02-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (314, 286, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 0.19, 0.99, 1, '2012-06-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (315, 305, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 1.69, 8.91, 9, '2012-08-31 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (316, 317, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 0.75, 3.96, 4, '2012-10-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (317, 169, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 0.38, 1.98, 2, '2011-01-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (318, 345, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 0.75, 3.96, 4, '2013-03-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (319, 87, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 1.32, 6.94, 6, '2010-01-10 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (320, 332, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 1.13, 5.94, 6, '2012-12-30 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (321, 301, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 0.38, 1.98, 2, '2012-08-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (322, 157, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 1.13, 5.94, 6, '2010-11-16 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (323, 162, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 0.38, 1.98, 2, '2010-12-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (324, 131, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 2.63, 13.86, 14, '2010-07-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (325, 65, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 0.75, 3.96, 4, '2009-10-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (326, 121, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 0.75, 3.96, 4, '2010-06-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (327, 84, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 0.38, 1.98, 2, '2010-01-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (328, 53, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 1.69, 8.91, 9, '2009-08-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (329, 274, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 0.38, 1.98, 2, '2012-04-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (330, 104, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 0.19, 0.99, 1, '2010-03-29 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (331, 64, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 0.38, 1.98, 2, '2009-10-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (332, 273, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 0.38, 1.98, 2, '2012-04-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (333, 102, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 1.88, 9.91, 9, '2010-03-16 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (334, 204, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 0.76, 3.98, 2, '2011-06-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (335, 410, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 1.69, 8.91, 9, '2013-12-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (336, 164, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 1.13, 5.94, 6, '2010-12-17 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (337, 4, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 1.69, 8.91, 9, '2009-01-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (338, 32, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 1.69, 8.91, 9, '2009-05-10 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (339, 250, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 2.63, 13.86, 14, '2012-01-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (340, 275, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 0.75, 3.96, 4, '2012-04-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (341, 63, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 0.38, 1.98, 2, '2009-10-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (342, 210, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 0.38, 1.98, 2, '2011-07-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (343, 74, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 1.69, 8.91, 9, '2009-11-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (344, 306, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 3.2, 16.86, 14, '2012-09-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (345, 212, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 0.75, 3.96, 4, '2011-07-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (346, 287, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 0.38, 1.98, 2, '2012-06-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (347, 130, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 1.69, 8.91, 9, '2010-07-18 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (348, 270, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 1.69, 8.91, 9, '2012-03-29 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (349, 237, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 0.19, 0.99, 1, '2011-11-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (350, 36, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 0.38, 1.98, 2, '2009-06-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (351, 50, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 0.38, 1.98, 2, '2009-08-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (352, 213, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 1.13, 5.94, 6, '2011-07-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (353, 42, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 0.38, 1.98, 2, '2009-07-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (354, 401, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 0.75, 3.96, 4, '2013-11-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (355, 133, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 0.38, 1.98, 2, '2010-08-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (356, 103, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 3.01, 15.86, 14, '2010-03-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (357, 365, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 0.38, 1.98, 2, '2013-06-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (358, 161, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 0.38, 1.98, 2, '2010-12-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (359, 209, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 0.19, 0.99, 1, '2011-07-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (360, 92, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 0.38, 1.98, 2, '2010-02-08 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (361, 233, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 0.75, 3.96, 4, '2011-10-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (362, 215, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 2.63, 13.86, 14, '2011-07-30 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (363, 192, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 1.13, 5.94, 6, '2011-04-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (364, 203, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 0.57, 2.98, 2, '2011-06-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (365, 226, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 0.75, 3.96, 4, '2011-09-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (366, 99, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 0.76, 3.98, 2, '2010-03-11 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (367, 81, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 1.69, 8.91, 9, '2009-12-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (368, 194, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 4.15, 21.86, 14, '2011-04-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (369, 173, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 2.63, 13.86, 14, '2011-01-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (370, 20, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 0.19, 0.99, 1, '2009-03-22 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (371, 354, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 1.69, 8.91, 9, '2013-04-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (372, 290, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 1.13, 5.94, 6, '2012-06-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (373, 376, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 2.63, 13.86, 14, '2013-07-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (374, 123, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 1.69, 8.91, 9, '2010-06-17 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (375, 225, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 0.38, 1.98, 2, '2011-09-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (376, 342, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 0.19, 0.99, 1, '2013-02-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (377, 284, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 1.69, 8.91, 9, '2012-05-30 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (378, 6, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 0.19, 0.99, 1, '2009-01-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (379, 30, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 0.75, 3.96, 4, '2009-05-06 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (380, 177, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 0.75, 3.96, 4, '2011-02-16 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (381, 148, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 0.38, 1.98, 2, '2010-10-14 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (382, 279, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 0.19, 0.99, 1, '2012-05-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (383, 110, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 2.63, 13.86, 14, '2010-04-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (384, 41, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 0.19, 0.99, 1, '2009-06-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (385, 14, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 0.38, 1.98, 2, '2009-03-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (386, 304, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 1.13, 5.94, 6, '2012-08-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (387, 108, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 1.13, 5.94, 6, '2010-04-13 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (388, 48, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 0.19, 0.99, 1, '2009-07-24 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (389, 254, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 0.75, 3.96, 4, '2012-01-23 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (390, 299, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 4.53, 23.86, 14, '2012-08-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (391, 143, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 1.13, 5.94, 6, '2010-09-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (392, 199, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 1.13, 5.94, 6, '2011-05-21 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (393, 153, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 0.19, 0.99, 1, '2010-11-01 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (394, 179, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 1.69, 8.91, 9, '2011-02-20 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (395, 322, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 0.38, 1.98, 2, '2012-11-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (396, 402, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 1.13, 5.94, 6, '2013-11-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (397, 258, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 0.19, 0.99, 1, '2012-02-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (398, 341, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 2.63, 13.86, 14, '2013-02-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (399, 393, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 0.38, 1.98, 2, '2013-10-03 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (400, 281, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 0.38, 1.98, 2, '2012-05-25 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (401, 187, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 2.63, 13.86, 14, '2011-03-28 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (402, 316, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 0.38, 1.98, 2, '2012-10-27 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (403, 25, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 1.69, 8.91, 9, '2009-04-09 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (404, 184, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 0.75, 3.96, 4, '2011-03-19 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (405, 176, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 0.38, 1.98, 2, '2011-02-15 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (406, 38, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 1.13, 5.94, 6, '2009-06-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (407, 223, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 0.19, 0.99, 1, '2011-09-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (408, 269, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 1.13, 5.94, 6, '2012-03-26 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (409, 327, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 2.63, 13.86, 14, '2012-12-07 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (410, 390, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 2.63, 13.86, 14, '2013-09-12 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (411, 374, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 1.13, 5.94, 6, '2013-07-04 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (412, 16, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 0.75, 3.96, 4, '2009-03-05 05:00:00+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:30:08.489+00', '2023-04-20 00:32:15.547+00');
INSERT INTO "public"."Invoices" VALUES (413, 49, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 0.38, 1.98, 2, '2009-08-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (414, 101, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 1.13, 5.94, 6, '2010-03-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (415, 320, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 2.63, 13.86, 14, '2012-11-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (416, 159, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 2.63, 13.86, 14, '2010-11-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (417, 145, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 2.63, 13.86, 14, '2010-09-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (418, 125, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 0.19, 0.99, 1, '2010-06-30 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (419, 247, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 0.75, 3.96, 4, '2011-12-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (420, 251, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 0.19, 0.99, 1, '2012-01-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (421, 35, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 0.38, 1.98, 2, '2009-06-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (422, 202, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 0.38, 1.99, 1, '2011-06-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (423, 240, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 0.75, 3.96, 4, '2011-11-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (424, 196, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 0.38, 1.98, 2, '2011-05-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (425, 253, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 0.38, 1.98, 2, '2012-01-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (426, 59, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 1.13, 5.94, 6, '2009-09-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (427, 363, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 0.19, 0.99, 1, '2013-05-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (428, 218, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 0.38, 1.98, 2, '2011-08-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (429, 409, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 1.13, 5.94, 6, '2013-12-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (430, 241, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 1.13, 5.94, 6, '2011-11-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (431, 308, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 0.76, 3.98, 2, '2012-09-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (432, 272, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 0.19, 0.99, 1, '2012-04-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (433, 359, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 0.75, 3.96, 4, '2013-05-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (434, 343, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 0.38, 1.98, 2, '2013-02-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (435, 195, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 0.19, 0.99, 1, '2011-05-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (436, 344, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 0.38, 1.98, 2, '2013-02-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (437, 221, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 1.69, 8.91, 9, '2011-08-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (438, 405, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 0.19, 0.99, 1, '2013-11-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (439, 112, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 0.38, 1.98, 2, '2010-05-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (440, 90, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 0.19, 0.99, 1, '2010-01-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (441, 361, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 1.69, 8.91, 9, '2013-05-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (442, 219, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 0.75, 3.96, 4, '2011-08-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (443, 283, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 1.13, 5.94, 6, '2012-05-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (444, 142, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 0.75, 3.96, 4, '2010-09-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (445, 259, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 0.38, 1.98, 2, '2012-02-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (446, 280, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 0.38, 1.98, 2, '2012-05-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (447, 394, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 0.75, 3.96, 4, '2013-10-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (448, 404, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 4.91, 25.86, 14, '2013-11-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (449, 128, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 0.75, 3.96, 4, '2010-07-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (450, 107, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 0.75, 3.96, 4, '2010-04-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (451, 370, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 0.19, 0.99, 1, '2013-06-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (452, 303, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 0.75, 3.96, 4, '2012-08-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (453, 171, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 1.13, 5.94, 6, '2011-01-17 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (454, 216, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 0.19, 0.99, 1, '2011-08-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (455, 245, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 0.38, 1.98, 2, '2011-12-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (456, 205, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 1.51, 7.96, 4, '2011-06-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (457, 33, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 2.63, 13.86, 14, '2009-05-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (458, 183, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 0.38, 1.98, 2, '2011-03-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (459, 366, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 0.75, 3.96, 4, '2013-06-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (460, 8, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 0.38, 1.98, 2, '2009-02-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (461, 12, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 2.63, 13.86, 14, '2009-02-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (462, 55, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 0.19, 0.99, 1, '2009-08-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (463, 265, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 0.19, 0.99, 1, '2012-03-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (464, 246, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 0.38, 1.98, 2, '2011-12-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (465, 45, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 1.13, 5.94, 6, '2009-07-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (466, 37, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 0.75, 3.96, 4, '2009-06-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (467, 156, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 0.75, 3.96, 4, '2010-11-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (468, 167, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 0.19, 0.99, 1, '2011-01-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (469, 395, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 1.13, 5.94, 6, '2013-10-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (470, 62, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 0.19, 0.99, 1, '2009-09-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (471, 309, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 0.76, 3.98, 2, '2012-09-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (472, 220, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 1.13, 5.94, 6, '2011-08-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (473, 325, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 1.13, 5.94, 6, '2012-11-29 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (474, 106, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 0.38, 1.98, 2, '2010-04-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (475, 222, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 2.63, 13.86, 14, '2011-08-30 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (476, 150, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 1.13, 5.94, 6, '2010-10-16 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (477, 193, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 2.83, 14.91, 9, '2011-04-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (478, 268, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 0.75, 3.96, 4, '2012-03-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (479, 302, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 0.38, 1.98, 2, '2012-08-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (480, 329, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 0.38, 1.98, 2, '2012-12-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (481, 66, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 1.13, 5.94, 6, '2009-10-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (482, 318, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 1.13, 5.94, 6, '2012-10-29 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (483, 122, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 1.13, 5.94, 6, '2010-06-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (484, 54, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 2.63, 13.86, 14, '2009-08-16 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (485, 28, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 0.38, 1.98, 2, '2009-05-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (486, 188, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 0.19, 0.99, 1, '2011-04-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (487, 47, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 2.63, 13.86, 14, '2009-07-16 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (488, 296, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 0.75, 3.96, 4, '2012-07-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (489, 58, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 0.75, 3.96, 4, '2009-09-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (490, 52, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 1.13, 5.94, 6, '2009-08-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (491, 319, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 1.69, 8.91, 9, '2012-11-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (492, 185, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 1.13, 5.94, 6, '2011-03-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (493, 88, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 3.4, 17.91, 9, '2010-01-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (494, 352, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 0.75, 3.96, 4, '2013-04-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (495, 350, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 0.38, 1.98, 2, '2013-03-31 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (496, 400, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 0.38, 1.98, 2, '2013-11-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (497, 22, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 0.38, 1.98, 2, '2009-04-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (498, 70, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 0.38, 1.98, 2, '2009-11-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (499, 295, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 0.38, 1.98, 2, '2012-07-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (500, 407, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 0.38, 1.98, 2, '2013-12-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (501, 392, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 0.38, 1.98, 2, '2013-10-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (502, 403, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 1.69, 8.91, 9, '2013-11-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (503, 144, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 1.69, 8.91, 9, '2010-09-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (504, 138, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 2.63, 13.86, 14, '2010-08-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (505, 168, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 0.38, 1.98, 2, '2011-01-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (506, 152, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 2.63, 13.86, 14, '2010-10-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (507, 271, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 2.63, 13.86, 14, '2012-04-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (508, 348, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 2.63, 13.86, 14, '2013-03-10 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (509, 214, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 1.69, 8.91, 9, '2011-07-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (510, 160, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 0.19, 0.99, 1, '2010-12-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (511, 228, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 1.69, 8.91, 9, '2011-09-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (512, 375, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 1.69, 8.91, 9, '2013-07-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (513, 369, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 2.63, 13.86, 14, '2013-06-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (514, 371, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 0.38, 1.98, 2, '2013-07-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (515, 311, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 2.27, 11.94, 6, '2012-09-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (516, 340, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 1.69, 8.91, 9, '2013-02-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (517, 315, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 0.38, 1.98, 2, '2012-10-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (518, 181, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 0.19, 0.99, 1, '2011-03-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (519, 307, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 0.38, 1.99, 1, '2012-09-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (520, 127, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 0.38, 1.98, 2, '2010-07-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (521, 26, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 2.63, 13.86, 14, '2009-04-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (522, 151, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 1.69, 8.91, 9, '2010-10-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (523, 353, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 1.13, 5.94, 6, '2013-04-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (524, 3, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 1.13, 5.94, 6, '2009-01-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (525, 372, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 0.38, 1.98, 2, '2013-07-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (526, 19, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 2.63, 13.86, 14, '2009-03-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (527, 140, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 0.38, 1.98, 2, '2010-09-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (528, 249, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 1.69, 8.91, 9, '2011-12-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (529, 43, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 0.38, 1.98, 2, '2009-07-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (530, 200, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 1.69, 8.91, 9, '2011-05-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (531, 27, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 0.19, 0.99, 1, '2009-04-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (532, 116, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 1.69, 8.91, 9, '2010-05-17 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (533, 297, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 1.13, 5.94, 6, '2012-07-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (534, 163, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 0.75, 3.96, 4, '2010-12-16 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (535, 165, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 1.69, 8.91, 9, '2010-12-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (536, 285, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 2.63, 13.86, 14, '2012-06-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (537, 326, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 1.69, 8.91, 9, '2012-12-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (538, 234, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 1.13, 5.94, 6, '2011-10-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (539, 406, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 0.38, 1.98, 2, '2013-12-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (540, 208, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 3.01, 15.86, 14, '2011-06-29 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (541, 388, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 1.13, 5.94, 6, '2013-09-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (542, 314, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 0.19, 0.99, 1, '2012-10-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (543, 21, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 0.38, 1.98, 2, '2009-04-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (544, 114, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 0.75, 3.96, 4, '2010-05-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (545, 333, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 1.69, 8.91, 9, '2013-01-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (546, 330, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 0.38, 1.98, 2, '2012-12-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (547, 113, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 0.38, 1.98, 2, '2010-05-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (548, 412, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 0.38, 1.99, 1, '2013-12-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (549, 224, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 0.38, 1.98, 2, '2011-09-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (550, 178, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 1.13, 5.94, 6, '2011-02-17 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (551, 277, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 1.69, 8.91, 9, '2012-04-29 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (552, 180, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 2.63, 13.86, 14, '2011-02-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (553, 98, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 0.76, 3.98, 2, '2010-03-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (554, 324, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 0.75, 3.96, 4, '2012-11-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (555, 267, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 0.38, 1.98, 2, '2012-03-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (556, 13, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 0.19, 0.99, 1, '2009-02-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (557, 182, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 0.38, 1.98, 2, '2011-03-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (558, 328, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 0.19, 0.99, 1, '2012-12-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (559, 385, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 0.38, 1.98, 2, '2013-09-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (560, 189, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 0.38, 1.98, 2, '2011-04-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (561, 191, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 0.75, 3.96, 4, '2011-04-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (562, 1, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 0.38, 1.98, 2, '2009-01-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (563, 115, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 1.13, 5.94, 6, '2010-05-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (564, 399, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 0.38, 1.98, 2, '2013-11-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (565, 51, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 0.75, 3.96, 4, '2009-08-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (566, 91, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 0.38, 1.98, 2, '2010-02-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (567, 118, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 0.19, 0.99, 1, '2010-05-30 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (568, 276, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 1.13, 5.94, 6, '2012-04-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (569, 186, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 1.69, 8.91, 9, '2011-03-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (570, 380, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 0.75, 3.96, 4, '2013-08-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (571, 339, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 1.13, 5.94, 6, '2013-01-30 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (572, 89, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 3.58, 18.86, 14, '2010-01-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (573, 323, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 0.38, 1.98, 2, '2012-11-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (574, 76, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 0.19, 0.99, 1, '2009-11-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (575, 61, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 2.63, 13.86, 14, '2009-09-16 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (576, 300, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 0.19, 0.99, 1, '2012-08-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (577, 109, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 1.69, 8.91, 9, '2010-04-16 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (578, 255, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 1.13, 5.94, 6, '2012-01-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (579, 238, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 0.38, 1.98, 2, '2011-11-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (580, 382, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 1.69, 8.91, 9, '2013-08-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (581, 347, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 1.69, 8.91, 9, '2013-03-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (582, 137, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 1.69, 8.91, 9, '2010-08-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (583, 126, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 0.38, 1.98, 2, '2010-07-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (584, 166, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 2.63, 13.86, 14, '2010-12-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (585, 368, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 1.69, 8.91, 9, '2013-06-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (586, 231, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 0.38, 1.98, 2, '2011-10-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (587, 79, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 0.75, 3.96, 4, '2009-12-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (588, 111, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 0.19, 0.99, 1, '2010-04-29 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (589, 331, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 0.75, 3.96, 4, '2012-12-29 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (590, 398, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 0.19, 0.99, 1, '2013-10-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (591, 384, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 0.19, 0.99, 1, '2013-08-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (592, 7, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 0.38, 1.98, 2, '2009-02-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (593, 146, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 0.19, 0.99, 1, '2010-10-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (594, 334, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 2.63, 13.86, 14, '2013-01-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (595, 141, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 0.38, 1.98, 2, '2010-09-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (596, 201, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 3.58, 18.86, 14, '2011-05-29 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (597, 120, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 0.38, 1.98, 2, '2010-06-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (598, 373, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 0.75, 3.96, 4, '2013-07-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (599, 257, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 2.63, 13.86, 14, '2012-02-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (600, 346, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 1.13, 5.94, 6, '2013-03-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (601, 383, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 2.63, 13.86, 14, '2013-08-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (602, 23, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 0.75, 3.96, 4, '2009-04-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (603, 77, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 0.38, 1.98, 2, '2009-12-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (604, 244, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 0.19, 0.99, 1, '2011-12-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (605, 252, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 0.38, 1.98, 2, '2012-01-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (606, 139, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 0.19, 0.99, 1, '2010-08-31 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (607, 29, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 0.38, 1.98, 2, '2009-05-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (608, 291, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 1.69, 8.91, 9, '2012-06-30 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (609, 174, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 0.19, 0.99, 1, '2011-02-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (610, 10, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 1.13, 5.94, 6, '2009-02-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (611, 75, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 2.63, 13.86, 14, '2009-11-17 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (612, 85, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 0.38, 1.98, 2, '2010-01-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (613, 391, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 0.19, 0.99, 1, '2013-09-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (614, 408, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 0.75, 3.96, 4, '2013-12-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (615, 358, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 0.38, 1.98, 2, '2013-05-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (616, 170, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 0.75, 3.96, 4, '2011-01-16 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (617, 335, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 0.19, 0.99, 1, '2013-01-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (618, 78, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 0.38, 1.98, 2, '2009-12-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (619, 158, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 1.69, 8.91, 9, '2010-11-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (620, 15, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 0.38, 1.98, 2, '2009-03-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (621, 387, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 0.75, 3.96, 4, '2013-09-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (622, 396, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 1.69, 8.91, 9, '2013-10-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (623, 256, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 1.69, 8.91, 9, '2012-01-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (624, 39, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 1.69, 8.91, 9, '2009-06-10 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (625, 232, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 0.38, 1.98, 2, '2011-10-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (626, 134, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 0.38, 1.98, 2, '2010-08-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (627, 263, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 1.69, 8.91, 9, '2012-02-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (628, 34, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 0.19, 0.99, 1, '2009-05-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (629, 82, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 2.63, 13.86, 14, '2009-12-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (630, 17, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 1.13, 5.94, 6, '2009-03-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (631, 298, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 2.07, 10.91, 9, '2012-07-31 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (632, 80, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 1.13, 5.94, 6, '2009-12-10 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (633, 67, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 1.69, 8.91, 9, '2009-10-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (634, 294, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 0.38, 1.98, 2, '2012-07-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (635, 379, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 0.38, 1.98, 2, '2013-08-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (636, 96, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 4.15, 21.86, 14, '2010-02-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (637, 172, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 1.69, 8.91, 9, '2011-01-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (638, 227, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 1.13, 5.94, 6, '2011-09-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (639, 378, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 0.38, 1.98, 2, '2013-08-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (640, 260, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 0.38, 1.98, 2, '2012-02-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (641, 351, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 0.38, 1.98, 2, '2013-03-31 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (642, 217, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 0.38, 1.98, 2, '2011-08-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (643, 321, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 0.19, 0.99, 1, '2012-11-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (644, 190, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 0.38, 1.98, 2, '2011-04-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (645, 356, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 0.19, 0.99, 1, '2013-04-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (646, 262, 57, 'Luis Rojas', 'Santiago', 'Chile', 'Calle Lira, 198', 1.13, 5.94, 6, '2012-02-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (647, 230, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 0.19, 0.99, 1, '2011-10-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (648, 239, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 0.38, 1.98, 2, '2011-11-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (649, 24, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 1.13, 5.94, 6, '2009-04-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (650, 72, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 0.75, 3.96, 4, '2009-11-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (651, 389, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 1.69, 8.91, 9, '2013-09-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (652, 132, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 0.19, 0.99, 1, '2010-07-31 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (653, 60, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 1.69, 8.91, 9, '2009-09-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (654, 149, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 0.75, 3.96, 4, '2010-10-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (655, 129, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 1.13, 5.94, 6, '2010-07-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (656, 95, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 1.69, 8.91, 9, '2010-02-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (657, 211, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 0.38, 1.98, 2, '2011-07-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (658, 69, 25, 'Victor Stevens', 'Madison', 'USA', '319 N. Frances Street', 0.19, 0.99, 1, '2009-10-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (659, 229, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 2.63, 13.86, 14, '2011-09-30 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (660, 336, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 0.38, 1.98, 2, '2013-01-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (661, 155, 12, 'Roberto Almeida', 'Rio de Janeiro', 'Brazil', 'Praça Pio X, 119', 0.38, 1.98, 2, '2010-11-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (662, 18, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 1.69, 8.91, 9, '2009-03-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (663, 337, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 0.38, 1.98, 2, '2013-01-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (664, 117, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 2.63, 13.86, 14, '2010-05-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (665, 364, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 0.38, 1.98, 2, '2013-06-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (666, 243, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 2.63, 13.86, 14, '2011-12-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (667, 349, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 0.19, 0.99, 1, '2013-03-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (668, 266, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 0.38, 1.98, 2, '2012-03-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (669, 135, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 0.75, 3.96, 4, '2010-08-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (670, 207, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 1.69, 8.91, 9, '2011-06-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (671, 288, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 0.38, 1.98, 2, '2012-06-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (672, 136, 22, 'Heather Leacock', 'Orlando', 'USA', '120 S Orange Ave', 1.13, 5.94, 6, '2010-08-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (673, 381, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 1.13, 5.94, 6, '2013-08-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (674, 56, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 0.38, 1.98, 2, '2009-09-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (675, 154, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 0.38, 1.98, 2, '2010-11-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (676, 97, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 0.38, 1.99, 1, '2010-02-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (677, 282, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 0.75, 3.96, 4, '2012-05-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (678, 9, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 0.75, 3.96, 4, '2009-02-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (679, 235, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 1.69, 8.91, 9, '2011-10-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (680, 40, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 2.63, 13.86, 14, '2009-06-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (681, 71, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 0.38, 1.98, 2, '2009-11-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (682, 293, 2, 'Leonie Köhler', 'Stuttgart', 'Germany', 'Theodor-Heuss-Straße 34', 0.19, 0.99, 1, '2012-07-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (683, 83, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 0.19, 0.99, 1, '2009-12-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (684, 360, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 1.13, 5.94, 6, '2013-05-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (685, 377, 45, 'Ladislav Kovács', 'Budapest', 'Hungary', 'Erzsébet krt. 58.', 0.19, 0.99, 1, '2013-07-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (686, 236, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 2.63, 13.86, 14, '2011-10-31 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (687, 46, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 1.69, 8.91, 9, '2009-07-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (688, 338, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 0.75, 3.96, 4, '2013-01-29 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (689, 197, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 0.38, 1.98, 2, '2011-05-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (690, 310, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 1.51, 7.96, 4, '2012-09-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (691, 264, 13, 'Fernanda Ramos', 'Brasília', 'Brazil', 'Qe 7 Bloco G', 2.63, 13.86, 14, '2012-03-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (692, 198, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 0.75, 3.96, 4, '2011-05-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (693, 93, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 0.75, 3.96, 4, '2010-02-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (694, 124, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 2.63, 13.86, 14, '2010-06-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (695, 313, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 3.2, 16.86, 14, '2012-10-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (696, 357, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 0.38, 1.98, 2, '2013-05-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (697, 292, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 2.63, 13.86, 14, '2012-07-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (698, 119, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 0.38, 1.98, 2, '2010-06-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (699, 105, 39, 'Camille Bernard', 'Paris', 'France', '4, Rue Milton', 0.38, 1.98, 2, '2010-04-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (700, 397, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 2.63, 13.86, 14, '2013-10-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (701, 386, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 0.38, 1.98, 2, '2013-09-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (702, 261, 53, 'Phil Hughes', 'London', 'United Kingdom', '113 Lupus St', 0.75, 3.96, 4, '2012-02-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (703, 11, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 1.69, 8.91, 9, '2009-02-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (704, 355, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 2.63, 13.86, 14, '2013-04-10 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (705, 367, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 1.13, 5.94, 6, '2013-06-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (706, 248, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 1.13, 5.94, 6, '2011-12-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (707, 57, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 0.38, 1.98, 2, '2009-09-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (708, 73, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 1.13, 5.94, 6, '2009-11-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (709, 278, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 2.63, 13.86, 14, '2012-05-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (710, 362, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 2.63, 13.86, 14, '2013-05-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (711, 147, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 0.38, 1.98, 2, '2010-10-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (712, 411, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 2.63, 13.86, 14, '2013-12-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (713, 31, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 1.13, 5.94, 6, '2009-05-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (714, 312, 34, 'João Fernandes', 'Lisbon', 'Portugal', 'Rua da Assunção 53', 2.07, 10.91, 9, '2012-10-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (715, 100, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 0.75, 3.96, 4, '2010-03-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (716, 68, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 2.63, 13.86, 14, '2009-10-17 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (717, 44, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 0.75, 3.96, 4, '2009-07-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (718, 5, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 2.63, 13.86, 14, '2009-01-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (719, 289, 28, 'Julia Barnett', 'Salt Lake City', 'USA', '302 S 700 E', 0.75, 3.96, 4, '2012-06-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (720, 94, 30, 'Edward Francis', 'Ottawa', 'Canada', '230 Elgin Street', 1.13, 5.94, 6, '2010-02-10 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (721, 2, 4, 'Bjørn Hansen', 'Oslo', 'Norway', 'Ullevålsveien 14', 0.75, 3.96, 4, '2009-01-02 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (722, 86, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 0.75, 3.96, 4, '2010-01-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (723, 206, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 1.7, 8.94, 6, '2011-06-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (724, 242, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 1.69, 8.91, 9, '2011-11-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (725, 175, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 0.38, 1.98, 2, '2011-02-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (726, 286, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 0.19, 0.99, 1, '2012-06-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (727, 305, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 1.69, 8.91, 9, '2012-08-31 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (728, 317, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 0.75, 3.96, 4, '2012-10-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (729, 169, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 0.38, 1.98, 2, '2011-01-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (730, 345, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 0.75, 3.96, 4, '2013-03-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (731, 87, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 1.32, 6.94, 6, '2010-01-10 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (732, 332, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 1.13, 5.94, 6, '2012-12-30 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (733, 301, 41, 'Marc Dubois', 'Lyon', 'France', '11, Place Bellecour', 0.38, 1.98, 2, '2012-08-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (734, 157, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 1.13, 5.94, 6, '2010-11-16 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (735, 162, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 0.38, 1.98, 2, '2010-12-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (736, 131, 58, 'Manoj Pareek', 'Delhi', 'India', '12,Community Centre', 2.63, 13.86, 14, '2010-07-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (737, 65, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 0.75, 3.96, 4, '2009-10-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (738, 121, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 0.75, 3.96, 4, '2010-06-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (739, 84, 43, 'Isabelle Mercier', 'Dijon', 'France', '68, Rue Jouvence', 0.38, 1.98, 2, '2010-01-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (740, 53, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 1.69, 8.91, 9, '2009-08-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (741, 274, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 0.38, 1.98, 2, '2012-04-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (742, 104, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 0.19, 0.99, 1, '2010-03-29 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (743, 64, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 0.38, 1.98, 2, '2009-10-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (744, 273, 7, 'Astrid Gruber', 'Vienne', 'Austria', 'Rotenturmstraße 4, 1010 Innere Stadt', 0.38, 1.98, 2, '2012-04-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (745, 102, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 1.88, 9.91, 9, '2010-03-16 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (746, 204, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 0.76, 3.98, 2, '2011-06-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (747, 410, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 1.69, 8.91, 9, '2013-12-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (748, 164, 56, 'Diego Gutiérrez', 'Buenos Aires', 'Argentina', '307 Macacha Güemes', 1.13, 5.94, 6, '2010-12-17 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (749, 4, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 1.69, 8.91, 9, '2009-01-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (750, 32, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 1.69, 8.91, 9, '2009-05-10 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (751, 250, 55, 'Mark Taylor', 'Sidney', 'Australia', '421 Bourke Street', 2.63, 13.86, 14, '2012-01-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (752, 275, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 0.75, 3.96, 4, '2012-04-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (753, 63, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 0.38, 1.98, 2, '2009-10-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (754, 210, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 0.38, 1.98, 2, '2011-07-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (755, 74, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 1.69, 8.91, 9, '2009-11-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (756, 306, 5, 'Frantiek Wichterlová', 'Prague', 'Czech Republic', 'Klanova 9/506', 3.2, 16.86, 14, '2012-09-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (757, 212, 23, 'John Gordon', 'Boston', 'USA', '69 Salem Street', 0.75, 3.96, 4, '2011-07-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (758, 287, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 0.38, 1.98, 2, '2012-06-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (759, 130, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 1.69, 8.91, 9, '2010-07-18 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (760, 270, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 1.69, 8.91, 9, '2012-03-29 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (761, 237, 52, 'Emma Jones', 'London', 'United Kingdom', '202 Hoxton Street', 0.19, 0.99, 1, '2011-11-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (762, 36, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 0.38, 1.98, 2, '2009-06-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (763, 50, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 0.38, 1.98, 2, '2009-08-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (764, 213, 27, 'Patrick Gray', 'Tucson', 'USA', '1033 N Park Ave', 1.13, 5.94, 6, '2011-07-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (765, 42, 51, 'Joakim Johansson', 'Stockholm', 'Sweden', 'Celsiusg. 9', 0.38, 1.98, 2, '2009-07-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (766, 401, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 0.75, 3.96, 4, '2013-11-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (767, 133, 14, 'Mark Philips', 'Edmonton', 'Canada', '8210 111 ST NW', 0.38, 1.98, 2, '2010-08-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (768, 103, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 3.01, 15.86, 14, '2010-03-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (769, 365, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 0.38, 1.98, 2, '2013-06-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (770, 161, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 0.38, 1.98, 2, '2010-12-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (771, 209, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 0.19, 0.99, 1, '2011-07-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (772, 92, 24, 'Frank Ralston', 'Chicago', 'USA', '162 E Superior Street', 0.38, 1.98, 2, '2010-02-08 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (773, 233, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 0.75, 3.96, 4, '2011-10-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (774, 215, 42, 'Wyatt Girard', 'Bordeaux', 'France', '9, Place Louis Barthou', 2.63, 13.86, 14, '2011-07-30 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (775, 192, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 1.13, 5.94, 6, '2011-04-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (776, 203, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 0.57, 2.98, 2, '2011-06-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (777, 226, 40, 'Dominique Lefebvre', 'Paris', 'France', '8, Rue Hanovre', 0.75, 3.96, 4, '2011-09-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (778, 99, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 0.76, 3.98, 2, '2010-03-11 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (779, 81, 19, 'Tim Goyer', 'Cupertino', 'USA', '1 Infinite Loop', 1.69, 8.91, 9, '2009-12-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (780, 194, 46, 'Hugh O''Reilly', 'Dublin', 'Ireland', '3 Chatham Street', 4.15, 21.86, 14, '2011-04-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (781, 173, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 2.63, 13.86, 14, '2011-01-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (782, 20, 54, 'Steve Murray', 'Edinburgh', 'United Kingdom', '110 Raeburn Pl', 0.19, 0.99, 1, '2009-03-22 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (783, 354, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 1.69, 8.91, 9, '2013-04-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (784, 290, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 1.13, 5.94, 6, '2012-06-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (785, 376, 31, 'Martha Silk', 'Halifax', 'Canada', '194A Chain Lake Drive', 2.63, 13.86, 14, '2013-07-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (786, 123, 11, 'Alexandre Rocha', 'São Paulo', 'Brazil', 'Av. Paulista, 2022', 1.69, 8.91, 9, '2010-06-17 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (787, 225, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 0.38, 1.98, 2, '2011-09-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (788, 342, 32, 'Aaron Mitchell', 'Winnipeg', 'Canada', '696 Osborne Street', 0.19, 0.99, 1, '2013-02-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (789, 284, 59, 'Puja Srivastava', 'Bangalore', 'India', '3,Raj Bhavan Road', 1.69, 8.91, 9, '2012-05-30 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (790, 6, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 0.19, 0.99, 1, '2009-01-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (791, 30, 38, 'Niklas Schröder', 'Berlin', 'Germany', 'Barbarossastraße 19', 0.75, 3.96, 4, '2009-05-06 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (792, 177, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 0.75, 3.96, 4, '2011-02-16 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (793, 148, 33, 'Ellie Sullivan', 'Yellowknife', 'Canada', '5112 48 Street', 0.38, 1.98, 2, '2010-10-14 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (794, 279, 44, 'Terhi Hämäläinen', 'Helsinki', 'Finland', 'Porthaninkatu 9', 0.19, 0.99, 1, '2012-05-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (795, 110, 3, 'François Tremblay', 'Montréal', 'Canada', '1498 rue Bélanger', 2.63, 13.86, 14, '2010-04-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (796, 41, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 0.19, 0.99, 1, '2009-06-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (797, 14, 17, 'Jack Smith', 'Redmond', 'USA', '1 Microsoft Way', 0.38, 1.98, 2, '2009-03-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (798, 304, 49, 'Stanislaw Wójcik', 'Warsaw', 'Poland', 'Ordynacka 10', 1.13, 5.94, 6, '2012-08-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (799, 108, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 1.13, 5.94, 6, '2010-04-13 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (800, 48, 29, 'Robert Brown', 'Toronto', 'Canada', '796 Dundas Street West', 0.19, 0.99, 1, '2009-07-24 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (801, 254, 15, 'Jennifer Peterson', 'Vancouver', 'Canada', '700 W Pender Street', 0.75, 3.96, 4, '2012-01-23 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (802, 299, 26, 'Richard Cunningham', 'Fort Worth', 'USA', '2211 W Berry Street', 4.53, 23.86, 14, '2012-08-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (803, 143, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 1.13, 5.94, 6, '2010-09-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (804, 199, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 1.13, 5.94, 6, '2011-05-21 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (805, 153, 9, 'Kara Nielsen', 'Copenhagen', 'Denmark', 'Sønder Boulevard 51', 0.19, 0.99, 1, '2010-11-01 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (806, 179, 20, 'Dan Miller', 'Mountain View', 'USA', '541 Del Medio Avenue', 1.69, 8.91, 9, '2011-02-20 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (807, 322, 37, 'Fynn Zimmermann', 'Frankfurt', 'Germany', 'Berger Straße 10', 0.38, 1.98, 2, '2012-11-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (808, 402, 50, 'Enrique Muñoz', 'Madrid', 'Spain', 'C/ San Bernardo 85', 1.13, 5.94, 6, '2013-11-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (809, 258, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 0.19, 0.99, 1, '2012-02-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (810, 341, 18, 'Michelle Brooks', 'New York', 'USA', '627 Broadway', 2.63, 13.86, 14, '2013-02-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (811, 393, 6, 'Helena Holý', 'Prague', 'Czech Republic', 'Rilská 3174/6', 0.38, 1.98, 2, '2013-10-03 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (812, 281, 47, 'Lucas Mancini', 'Rome', 'Italy', 'Via Degli Scipioni, 43', 0.38, 1.98, 2, '2012-05-25 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (813, 187, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 2.63, 13.86, 14, '2011-03-28 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (814, 316, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 0.38, 1.98, 2, '2012-10-27 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (815, 25, 10, 'Eduardo Martins', 'São Paulo', 'Brazil', 'Rua Dr. Falcão Filho, 155', 1.69, 8.91, 9, '2009-04-09 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (816, 184, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 0.75, 3.96, 4, '2011-03-19 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (817, 176, 8, 'Daan Peeters', 'Brussels', 'Belgium', 'Grétrystraat 63', 0.38, 1.98, 2, '2011-02-15 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (818, 38, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 1.13, 5.94, 6, '2009-06-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (819, 223, 35, 'Madalena Sampaio', 'Porto', 'Portugal', 'Rua dos Campeões Europeus de Viena, 4350', 0.19, 0.99, 1, '2011-09-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (820, 269, 36, 'Hannah Schneider', 'Berlin', 'Germany', 'Tauentzienstraße 8', 1.13, 5.94, 6, '2012-03-26 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (821, 327, 1, 'Luís Gonçalves', 'São José dos Campos', 'Brazil', 'Av. Brigadeiro Faria Lima, 2170', 2.63, 13.86, 14, '2012-12-07 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (822, 390, 48, 'Johannes Van der Berg', 'Amsterdam', 'Netherlands', 'Lijnbaansgracht 120bg', 2.63, 13.86, 14, '2013-09-12 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (823, 374, 16, 'Frank Harris', 'Mountain View', 'USA', '1600 Amphitheatre Parkway', 1.13, 5.94, 6, '2013-07-04 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);
INSERT INTO "public"."Invoices" VALUES (824, 16, 21, 'Kathy Chase', 'Reno', 'USA', '801 W 4th Street', 0.75, 3.96, 4, '2009-03-05 05:00:00+00', '2023-04-20 00:32:15.606+00', '2023-04-20 00:32:15.606+00', NULL);

-- ----------------------------
-- Table structure for Migratelogs
-- ----------------------------
DROP TABLE IF EXISTS "public"."Migratelogs";
CREATE TABLE "public"."Migratelogs" (
  "id" int4 NOT NULL DEFAULT nextval('"Migratelogs_id_seq"'::regclass),
  "database" json NOT NULL,
  "created_at" timestamptz(6) NOT NULL
)
;

-- ----------------------------
-- Records of Migratelogs
-- ----------------------------

-- ----------------------------
-- Table structure for SequelizeMeta
-- ----------------------------
DROP TABLE IF EXISTS "public"."SequelizeMeta";
CREATE TABLE "public"."SequelizeMeta" (
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of SequelizeMeta
-- ----------------------------
INSERT INTO "public"."SequelizeMeta" VALUES ('20230419231307-create-databases.js');
INSERT INTO "public"."SequelizeMeta" VALUES ('20230419012952-create_invoice.js');
INSERT INTO "public"."SequelizeMeta" VALUES ('20230419231319-create-migrare-log.js');

-- ----------------------------
-- Function structure for uuid_generate_v1
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v1"();
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v1"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v1'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v1mc
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v1mc"();
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v1mc"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v1mc'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v3
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v3"("namespace" uuid, "name" text);
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v3"("namespace" uuid, "name" text)
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v3'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v4
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v4"();
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v4"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v4'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v5
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v5"("namespace" uuid, "name" text);
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v5"("namespace" uuid, "name" text)
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v5'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_nil
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_nil"();
CREATE OR REPLACE FUNCTION "public"."uuid_nil"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_nil'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_dns
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_dns"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_dns"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_dns'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_oid
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_oid"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_oid"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_oid'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_url
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_url"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_url"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_url'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_x500
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_x500"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_x500"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_x500'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Databases_id_seq"
OWNED BY "public"."Databases"."id";
SELECT setval('"public"."Databases_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Invoices_id_seq"
OWNED BY "public"."Invoices"."id";
SELECT setval('"public"."Invoices_id_seq"', 824, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."Migratelogs_id_seq"
OWNED BY "public"."Migratelogs"."id";
SELECT setval('"public"."Migratelogs_id_seq"', 1, false);

-- ----------------------------
-- Primary Key structure for table Databases
-- ----------------------------
ALTER TABLE "public"."Databases" ADD CONSTRAINT "Databases_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Invoices
-- ----------------------------
ALTER TABLE "public"."Invoices" ADD CONSTRAINT "Invoices_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table Migratelogs
-- ----------------------------
ALTER TABLE "public"."Migratelogs" ADD CONSTRAINT "Migratelogs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table SequelizeMeta
-- ----------------------------
ALTER TABLE "public"."SequelizeMeta" ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY ("name");
