-- 1. Insert a new record into the account table
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

-- 2. Modify the Tony Stark record to change the account_type to 'Admin'
UPDATE account
SET account_type = 'Admin'
WHERE account_id = (
  SELECT account_id
  FROM account
  WHERE account_email = 'tony@starkent.com'
);

-- 3. Delete the Tony Stark record from the database
DELETE FROM account
WHERE account_id = (
  SELECT account_id
  FROM account
  WHERE account_email = 'tony@starkent.com'
);

-- 4. Modify the "GM Hummer" description using PostgreSQL REPLACE
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

-- 5. Use an INNER JOIN to select make, model, and classification name
--    for inventory items in the "Sport" category
SELECT
  i.inv_make,
  i.inv_model,
  c.classification_name
FROM inventory i
INNER JOIN classification c
  ON i.classification_id = c.classification_id
WHERE c.classification_name = 'Sport';

-- 6. Update all inventory image paths to include '/vehicles'
UPDATE inventory
SET
  inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
  inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');
