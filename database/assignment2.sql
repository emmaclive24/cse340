/* =====================================================
   TASK 1 – QUERY 1
   Insert Tony Stark into the account table
   account_id and account_type handled automatically
   ===================================================== */

INSERT INTO account (
  account_firstname,
  account_lastname,
  account_email,
  account_password
)
VALUES (
  'Tony',
  'Stark',
  'tony@starkent.com',
  'Iam1ronM@n'
);


/* =====================================================
   TASK 1 – QUERY 2
   Update Tony Stark account_type to Admin
   Uses PRIMARY KEY via subquery
   ===================================================== */

UPDATE account
SET account_type = 'Admin'
WHERE account_id = (
  SELECT account_id
  FROM account
  WHERE account_email = 'tony@starkent.com'
);


/* =====================================================
   TASK 1 – QUERY 3
   Delete Tony Stark record
   Uses PRIMARY KEY via subquery
   ===================================================== */

DELETE FROM account
WHERE account_id = (
  SELECT account_id
  FROM account
  WHERE account_email = 'tony@starkent.com'
);


/* =====================================================
   TASK 1 – QUERY 4
   Update GM Hummer description
   Uses PostgreSQL REPLACE (no retyping description)
   ===================================================== */

UPDATE inventory
SET inv_description = REPLACE(
  inv_description,
  'small interiors',
  'a huge interior'
)
WHERE inv_id = (
  SELECT inv_id
  FROM inventory
  WHERE inv_make = 'GM'
    AND inv_model = 'Hummer'
);


/* =====================================================
   TASK 1 – QUERY 5
   INNER JOIN: inventory + classification
   Select Sport category vehicles
   ===================================================== */

SELECT
  i.inv_make,
  i.inv_model,
  c.classification_name
FROM inventory i
INNER JOIN classification c
  ON i.classification_id = c.classification_id
WHERE c.classification_name = 'Sport';


/* =====================================================
   TASK 1 – QUERY 6
   Update image paths to include /vehicles
   Single UPDATE query
   ===================================================== */

UPDATE inventory
SET
  inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
  inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');
