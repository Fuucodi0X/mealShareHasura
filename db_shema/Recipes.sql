-- Creating tables and relaiton for mealshare (init project)

CREATE TABLE "recipes" (
  "id" serial PRIMARY KEY,
  "user_id" serial,
  "title" text,
  "description" text,
  "img" text,
  "category" varchar(100),
  "created_at" timestamp,
  "update_at" timestamp
);

CREATE TABLE "steps" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "step_num" int,
  "instruction" text,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "ingredients" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "ingredient" text,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "frist_name" varchar(100),
  "last_name" varchar(100),
  "created_at" timestamp,
  "updated_at" timestamp,
  "last_seen" timestamp
);

CREATE TABLE "bookmarks" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "user_id" serial,
  "created_at" timestamp
);

CREATE TABLE "follows" (
  "id" serial PRIMARY KEY,
  "followed_user" serial,
  "following_user" serial,
  "creaed_at" timestamp
);

CREATE TABLE "likes" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "user_id" serial,
  "creaed_at" timestamp
);

CREATE TABLE "reviews" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "user_id" serial,
  "rating" int,
  "comment" text,
  "creaed_at" timestamp,
  "update_at" timestamp
);

ALTER TABLE "recipes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "steps" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "ingredients" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "bookmarks" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "bookmarks" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("followed_user") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("following_user") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");


-- Adding emali to user with unique constrain (forgot to add it in the init)
ALTER TABLE "users" ADD "email" varchar(200) UNIQUE;

-- Adding time field for each steps

ALTER TABLE "steps" ADD "duration" INTERVAL NOT NULL;