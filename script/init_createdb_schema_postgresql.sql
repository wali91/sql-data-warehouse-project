/*
=============================================================
Create Database and Schemas (PostgreSQL)
=============================================================
Script Purpose:
    - Drop database datawarehouse if exists
    - Create database datawarehouse
    - Create schemas: bronze, silver, gold

WARNING:
    THIS SCRIPT WILL DELETE THE DATABASE IF IT EXISTS
=============================================================
*/

-- ===========================================================
-- STEP 1: Pastikan berada di database postgres
-- ===========================================================
\c postgres

-- ===========================================================
-- STEP 2: Terminate active connections
-- ===========================================================
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'datawarehouse'
  AND pid <> pg_backend_pid();

-- ===========================================================
-- STEP 3: Drop & Create Database
-- ===========================================================
DROP DATABASE IF EXISTS datawarehouse;
CREATE DATABASE datawarehouse;

-- ===========================================================
-- STEP 4: Connect to new database
-- ===========================================================
\c datawarehouse

-- ===========================================================
-- STEP 5: Create Schemas
-- ===========================================================
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
