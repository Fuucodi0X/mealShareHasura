-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- CREATE OR REPLACE FUNCTION search_recipes(search text)
-- RETURNS SETOF recipes AS $$
--   SELECT *
--   FROM recipes
--   WHERE
--     title ILIKE ('%' || search || '%')
--     OR description ILIKE ('%' || search || '%')
-- $$ LANGUAGE sql STABLE;
