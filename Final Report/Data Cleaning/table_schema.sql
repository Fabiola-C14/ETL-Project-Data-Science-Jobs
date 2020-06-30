-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/70tpaP
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "company" (
    "company" varchar   NOT NULL,
    "company_id" varchar   NOT NULL,
    CONSTRAINT "pk_company" PRIMARY KEY (
        "company_id"
     )
);

CREATE TABLE "company_salary" (
    "location" varchar   NOT NULL,
    "company" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    "salary" varchar   NOT NULL,
    "city" varchar   NOT NULL,
    "company_id" varchar   NOT NULL,
    "index" int   NOT NULL,
    CONSTRAINT "pk_company_salary" PRIMARY KEY (
        "index"
     )
);

CREATE TABLE "company_rating" (
    "company" varchar   NOT NULL,
    "star" varchar   NOT NULL,
    CONSTRAINT "pk_company_rating" PRIMARY KEY (
        "company"
     )
);

CREATE TABLE "housing" (
    "Asking_Price" float   NOT NULL,
    "Street" varchar   NOT NULL,
    "City" varchar   NOT NULL,
    CONSTRAINT "pk_housing" PRIMARY KEY (
        "Street"
     )
);

CREATE TABLE "city" (
    "city" varchar   NOT NULL,
    CONSTRAINT "pk_city" PRIMARY KEY (
        "city"
     )
);

ALTER TABLE "company" ADD CONSTRAINT "fk_company_company" FOREIGN KEY("company")
REFERENCES "company_rating" ("company");

ALTER TABLE "company_salary" ADD CONSTRAINT "fk_company_salary_city" FOREIGN KEY("city")
REFERENCES "city" ("city");

ALTER TABLE "company_salary" ADD CONSTRAINT "fk_company_salary_company_id" FOREIGN KEY("company_id")
REFERENCES "company" ("company_id");

ALTER TABLE "housing" ADD CONSTRAINT "fk_housing_City" FOREIGN KEY("City")
REFERENCES "city" ("city");

