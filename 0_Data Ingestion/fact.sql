-- Table: public.fact

-- DROP TABLE IF EXISTS public.fact;

CREATE TABLE IF NOT EXISTS public.fact
(
    mkt_tag character varying(255) COLLATE pg_catalog."default" NOT NULL,
    prod_tag character varying(255) COLLATE pg_catalog."default" NOT NULL,
    per_tag character varying(255) COLLATE pg_catalog."default" NOT NULL,
    units integer,
    volume integer,
    value integer,
    acv_distribution_w integer,
    numeric_distribution_w integer,
    weight_distribution_w integer,
    base_units integer,
    base_units_any_promo integer,
    base_units_no_promo integer,
    base_units_feat_and_display integer,
    base_units_display_only integer,
    base_units_feature_only integer,
    base_units_unsupported integer,
    base_units_total_multibuy integer,
    base_units_feature_or_display integer,
    base_volume integer,
    base_volume_any_promo integer,
    base_volume_no_promo integer,
    base_volume_feat_and_display integer,
    base_volume_display_only integer,
    base_volume_feature_only integer,
    base_volume_unsupported integer,
    base_volume_total_multibuy integer,
    base_volume_feature_or_display integer,
    base_value integer,
    base_value_any_promo integer,
    base_value_no_promo integer,
    base_value_feat_and_display integer,
    base_value_display_only integer,
    base_value_feature_only integer,
    base_value_unsupported integer,
    base_value_total_multibuy integer,
    base_value_feature_or_display integer,
    numeric_distribution integer,
    weight_distr integer,
    acv_distribution integer,
    stores_in_universe integer,
    units_c_any_promo integer,
    units_c_no_promo integer,
    units_c_feat_and_display integer,
    units_c_display_only integer,
    units_c_feature_only integer,
    units_c_unsupported integer,
    units_c_total_multibuy integer,
    units_c_feature_or_display integer,
    volume_c_any_promo integer,
    volume_c_no_promo integer,
    volume_c_feat_and_display integer,
    volume_c_display_only integer,
    volume_c_feature_only integer,
    volume_c_unsupported integer,
    volume_c_total_multibuy integer,
    volume_c_feature_or_display integer,
    value_c_any_promo integer,
    value_c_no_promo integer,
    value_c_feat_and_display integer,
    value_c_display_only integer,
    value_c_feature_only integer,
    value_c_unsupported integer,
    value_c_total_multibuy integer,
    value_c_feature_or_display integer,
    acv_distribution_c_any_promo integer,
    acv_distribution_c_feat_and_display integer,
    acv_distribution_c_display_only integer,
    acv_distribution_c_feature_only integer,
    acv_distribution_c_unsupported integer,
    acv_distribution_c_total_multibuy integer,
    acv_distribution_c_feature_or_display integer,
    numeric_distribution_w_c_any_promo integer,
    numeric_distribution_w_c_feat_and_display integer,
    numeric_distribution_w_c_display_only integer,
    numeric_distribution_w_c_feature_only integer,
    numeric_distribution_w_c_unsupported integer,
    numeric_distribution_w_c_total_multibuy integer,
    numeric_distribution_w_c_feature_or_display integer,
    weight_distribution_c_any_promo integer,
    weight_distribution_c_feat_and_display integer,
    weight_distribution_c_display_only integer,
    weight_distribution_c_feature_only integer,
    weight_distribution_c_unsupported integer,
    weight_distribution_c_total_multibuy integer,
    weight_distribution_c_feature_or_display integer,
    tdp_w integer,
    tdp_w_any_promo integer,
    tdp_w_no_promo integer,
    tdp_w_feat_and_display integer,
    tdp_w_display_only integer,
    tdp_w_feature_only integer,
    tdp_w_unsupported integer,
    tdp_w_total_multibuy integer,
    tdp_w_feature_or_display integer,
    tdp integer,
    tdp_any_promo integer,
    tdp_no_promo integer,
    tdp_feat_and_display integer,
    tdp_display_only integer,
    tdp_feature_only integer,
    tdp_unsupported integer,
    tdp_total_multibuy integer,
    tdp_feature_or_display integer,
    sales_eq2 integer,
    sales_eq2_cau_any_promo integer,
    ac_weight_average_number_sku_w integer,
    ac_weight_average_number_sku_w_display_only integer,
    ac_weight_average_number_sku_w_feature_only integer,
    price_per_eq integer,
    total_acv_distribution_points__w integer,
    total_acv_distribution_points__w_any_promo integer,
    total_acv_distribution_points__w_no_promo integer,
    total_acv_distribution_points__w_feat_and_display integer,
    total_acv_distribution_points__w_display_only integer,
    total_acv_distribution_points__w_feature_only integer,
    total_acv_distribution_points__w_unsupported integer,
    total_acv_distribution_points__w_total_multibuy integer,
    total_acv_distribution_points__w_feature_or_display integer,
    total_acv_distribution_points integer,
    total_acv_distribution_points_any_promo integer,
    total_acv_distribution_points_no_promo integer,
    total_acv_distribution_points_feat_and_display integer,
    total_acv_distribution_points_display_only integer,
    total_acv_distribution_points_feature_only integer,
    total_acv_distribution_points_unsupported integer,
    total_acv_distribution_points_total_multibuy integer,
    total_acv_distribution_points_feature_or_display integer,
    CONSTRAINT fact_pkey PRIMARY KEY (mkt_tag, prod_tag, per_tag),
    CONSTRAINT fact_fk_mkt FOREIGN KEY (mkt_tag)
        REFERENCES public.dim_mkt (tag) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fact_fk_per FOREIGN KEY (per_tag)
        REFERENCES public.dim_per (tag) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fact_fk_prod FOREIGN KEY (prod_tag)
        REFERENCES public.dim_prod (tag) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.fact
    OWNER to postgres;