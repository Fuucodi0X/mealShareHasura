alter table "public"."likes" alter column "creaed_at" set default now();
alter table "public"."likes" rename column "creaed_at" to "created_at";
