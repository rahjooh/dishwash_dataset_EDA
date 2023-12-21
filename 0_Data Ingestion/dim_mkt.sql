-- Table: public.dim_mkt

-- DROP TABLE IF EXISTS public.dim_mkt;

CREATE TABLE IF NOT EXISTS public.dim_mkt
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
    CONSTRAINT dim_mkt_pkey PRIMARY KEY (tag),
    CONSTRAINT mkt_parenttag FOREIGN KEY (parent_tag)
        REFERENCES public.dim_mkt (tag) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_mkt
    OWNER to postgres;