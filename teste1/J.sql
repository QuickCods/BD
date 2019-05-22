DROP FUNCTION IF EXISTS validateCustomer;
DELIMITER $

CREATE FUNCTION validateCustomer(customer_id INT)
RETURNS TEXT

BEGIN

  DECLARE active TINYINT;
  DECLARE activity DATETIME;

  SELECT CUSTOMER.Active INTO active
  FROM CUSTOMER
  WHERE CUSTOMER.CustomerId = customer_id;
  SELECT STREAM.StreamDate INTO activity
  FROM STREAM
  WHERE STREAM.CustomerId = customer_id
  ORDER BY STREAM.StreamDate DESC LIMIT 1;

  IF (active IS NULL)
  THEN
    return "DOES NOT EXIST";
  ELSEIF (active = 0)
  THEN
    IF (YEAR(activity) >= 2018)
    THEN
      return "ACTIVATE";
    END IF;
  ELSEIF (active = 1)
  THEN
    IF (activity IS NULL OR YEAR(activity) < 2018)
    THEN
      return "DEACTIVATE";
    END IF;
  END IF;

  return "OK";
END$

DELIMITER ;
