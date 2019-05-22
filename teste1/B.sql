SELECT n1.Name, n2.Name
FROM DEPARTMENT n1, STAFF n2
where n1.manager = n2.StaffId
order by n1.Name;
