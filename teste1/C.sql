DELETE FROM STREAM
WHERE StreamDate >= '2018-02-01'
AND StreamDate < '2018-03-01'
AND Charge < 6;

-- DELETE FROM STREAM
-- WHERE YEAR(StreamDate) = 2018
-- AND MONTH(StreamDate) = 02
-- AND Charge < 6;
