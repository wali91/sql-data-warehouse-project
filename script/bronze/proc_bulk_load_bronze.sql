CREATE TABLE crm_prod_info_staging
(LIKE crm_prod_info INCLUDING ALL);

copy crm_prod_info_staging
FROM '/var/lib/postgresql/prd_info.csv'
CSV HEADER;

ALTER TABLE crm_prod_info
ADD CONSTRAINT crm_prod_info_prd_id_uk UNIQUE (prd_id);


INSERT INTO crm_prod_info
SELECT *
FROM crm_prod_info_staging
ON CONFLICT (prd_id) DO NOTHING;
