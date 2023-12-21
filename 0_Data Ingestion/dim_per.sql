-- Table: public.dim_per

-- DROP TABLE IF EXISTS public.dim_per;

CREATE TABLE IF NOT EXISTS public.dim_per
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
    CONSTRAINT dim_per_pkey PRIMARY KEY (tag),
    CONSTRAINT per_parentag FOREIGN KEY (parent_tag)
        REFERENCES public.dim_per (tag) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_per
    OWNER to postgres;