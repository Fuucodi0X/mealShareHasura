CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "frist_name" varchar(100) NOT NULL,
  "last_name" varchar(100),
  "email" varchar(200) UNIQUE,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp,
  "last_seen" timestamp
);

CREATE TABLE "recipes" (
  "id" serial PRIMARY KEY,
  "user_id" serial,
  "title" text NOT NULL,
  "description" text NOT NULL,
  "category" varchar(100),
  "created_at" timestamp NOT NULL,
  "update_at" timestamp
);

CREATE TABLE "steps" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "step_num" serial,
  "instruction" text NOT NULL,
  "duration" interval NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp
);

CREATE TABLE "ingredients" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "ingredient" text NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp
);

CREATE TABLE "reviews" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "user_id" serial,
  "rating" int NOT NULL,
  "comment" text,
  "created_at" timestamp NOT NULL,
  "update_at" timestamp
);

CREATE TABLE "likes" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "user_id" serial,
  "creaed_at" timestamp NOT NULL
);

CREATE TABLE "bookmarks" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "user_id" serial,
  "created_at" timestamp NOT NULL
);

CREATE TABLE "follow" (
  "id" serial PRIMARY KEY,
  "followed_user" serial,
  "following_user" serial,
  "creaed_at" timestamp NOT NULL
);

CREATE TABLE "user_images" (
  "id" serial PRIMARY KEY,
  "user_id" serial,
  "user_img" text NOT NULL,
  "created_at" timestamp NOT NULL
);

CREATE TABLE "recipe_images" (
  "id" serial PRIMARY KEY,
  "recipe_id" serial,
  "thumbnail" text NOT NULL,
  "ingredient_img" text,
  "created_at" timestamp NOT NULL
);

CREATE TABLE "step_images" (
  "id" serial PRIMARY KEY,
  "step_id" serial,
  "step_img" text NOT NULL,
  "created_at" timestamp NOT NULL
);

ALTER TABLE "recipes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "steps" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "ingredients" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "bookmarks" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "bookmarks" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "follow" ADD FOREIGN KEY ("followed_user") REFERENCES "users" ("id");

ALTER TABLE "follow" ADD FOREIGN KEY ("following_user") REFERENCES "users" ("id");

ALTER TABLE "user_images" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "recipe_images" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipes" ("id");

ALTER TABLE "step_images" ADD FOREIGN KEY ("step_id") REFERENCES "steps" ("id");
