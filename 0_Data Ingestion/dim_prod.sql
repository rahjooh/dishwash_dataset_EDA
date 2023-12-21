-- Table: public.dim_prod

-- DROP TABLE IF EXISTS public.dim_prod;

CREATE TABLE IF NOT EXISTS public.dim_prod
(
    tag character varying(40) COLLATE pg_catalog."default" NOT NULL,
    short character varying(40) COLLATE pg_catalog."default",
    "long" character varying(80) COLLATE pg_catalog."default",
    display_order integer,
    parent_tag character varying(40) COLLATE pg_catalog."default",
    hier_num integer,
    hier_name character varying(80) COLLATE pg_catalog."default",
    hier_level_num integer,
    hier_level_name character varying(80) COLLATE pg_catalog."default",
    dishwasher_products_by_sector_of_fabric_care_level_0 character varying(20) COLLATE pg_catalog."default",
    sector_of_fabric_care character varying(20) COLLATE pg_catalog."default",
    trading_company character varying(40) COLLATE pg_catalog."default",
    brand character varying(80) COLLATE pg_catalog."default",
    product_property_form character varying(40) COLLATE pg_catalog."default",
    weight_volume character varying(20) COLLATE pg_catalog."default",
    colour_fragrance_of_household character varying(40) COLLATE pg_catalog."default",
    base_number_in_multipack character varying(20) COLLATE pg_catalog."default",
    all_special_offers character varying(20) COLLATE pg_catalog."default",
    custom_brand_1 character varying(80) COLLATE pg_catalog."default",
    dishwasher_products_by_trading_company_level_0 character varying(20) COLLATE pg_catalog."default",
    fragrance character varying(20) COLLATE pg_catalog."default",
    product_range character varying(20) COLLATE pg_catalog."default",
    custom_brand_2 character varying(80) COLLATE pg_catalog."default",
    dishwasher_products_by_product_property_form_level_0 character varying(20) COLLATE pg_catalog."default",
    packaging_property_form character varying(20) COLLATE pg_catalog."default",
    dishwasher_products_by_sector_of_fabric_care_1_level_0 character varying(20) COLLATE pg_catalog."default",
    number_in_pack character varying(20) COLLATE pg_catalog."default",
    csa_reckitt_benckiser_sub_sc character varying(20) COLLATE pg_catalog."default",
    dishwasher_products_by_csa_reckitt_benckiser_sub_sc_level_0 character varying(20) COLLATE pg_catalog."default",
    dishwasher_products_by_sector_by_premium_level_0 character varying(20) COLLATE pg_catalog."default",
    global_price_segment character varying(20) COLLATE pg_catalog."default",
    global_size_range character varying(40) COLLATE pg_catalog."default",
    additives_by_trading_company_level_0 character varying(20) COLLATE pg_catalog."default",
    dishwasher_products_by_summary_size_by_sector_level_0 character varying(20) COLLATE pg_catalog."default",
    rb_summary_size_range character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT dim_prod_pkey PRIMARY KEY (tag),
    CONSTRAINT prod_parentag FOREIGN KEY (parent_tag)
        REFERENCES public.dim_prod (tag) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_prod
    OWNER to postgres;