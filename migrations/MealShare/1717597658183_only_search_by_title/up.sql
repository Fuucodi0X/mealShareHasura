CREATE OR REPLACE FUNCTION public.search_recipes(search text)
 RETURNS SETOF recipes
 LANGUAGE sql
 STABLE
AS $function$
  SELECT *
  FROM recipes
  WHERE
    title ILIKE ('%' || search || '%')
$function$;
