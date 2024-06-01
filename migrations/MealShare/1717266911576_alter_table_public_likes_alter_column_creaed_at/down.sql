alter table "public"."likes" rename column "created_at" to "creaed_at";
ALTER TABLE "public"."likes" ALTER COLUMN "creaed_at" drop default;
