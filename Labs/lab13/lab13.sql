.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color="blue" AND pet="dog"
  ;

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color="blue" AND pet="dog"
  ;


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students GROUP BY smallest HAVING count(*)=1
  ;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students AS a, students AS b
  WHERE a.pet = b.pet AND a.song = b.song AND a.time < b.time
  ;


CREATE TABLE sevens AS
  SELECT a.seven FROM students AS a, numbers AS b
  WHERE a.number=7 AND b."7" = "True" AND a.time = b.time
  ;


CREATE TABLE average_prices AS
  SELECT category AS category, AVG(MSRP) AS average_price
  FROM products
  GROUP BY category
  ;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price)
  FROM inventory
  GROUP BY item
  ;

CREATE TABLE helper1 AS
  SELECT store AS store, item AS item, MIN(price) AS min_price
  FROM inventory
  GROUP BY item
  ;

CREATE TABLE helper2 AS
  SELECT name AS name, MIN(MSRP/rating) AS divide
  FROM products
  GROUP BY category
  ;

CREATE TABLE shopping_list AS
  SELECT item, store
  FROM helper1, helper2
  WHERE item = name
  ;

CREATE TABLE helper3 AS
  SELECT item AS item, store AS store
  FROM helper1, helper2
  WHERE item = name
  ;

CREATE TABLE total_bandwidth AS
  SELECT SUM(Mbs)
  FROM shopping_list AS a, stores AS b
  WHERE a.store = b.store
  ;

