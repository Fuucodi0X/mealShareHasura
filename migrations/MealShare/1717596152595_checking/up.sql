CREATE OR REPLACE FUNCTION search_recipes(search text)
RETURNS SETOF recipes AS $$
  SELECT *
  FROM recipes
  WHERE
    title ILIKE ('%' || search || '%')
    OR description ILIKE ('%' || search || '%')
$$ LANGUAGE sql STABLE;
