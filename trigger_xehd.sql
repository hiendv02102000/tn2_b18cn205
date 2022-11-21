CREATE DEFINER = CURRENT_USER TRIGGER `tn2`.`tblxehopdong205_BEFORE_INSERT` BEFORE INSERT ON `tblxehopdong205` FOR EACH ROW
BEGIN
	
	if new.ngayBatDau > new.ngayKetThuc or new.ngayBatDau < now() then
		rollback;
	end if;
SELECT 
    @a = id
FROM
    `tn2`.`tblxehopdong205`
WHERE
    (ngayBatDau > new.ngayBatDau
        AND ngayKetThuc < new.ngayBatDau)
        OR (ngayKetThuc > new.ngayBatDau
        AND ngayKetThuc < new.ngayKetThuc)
LIMIT 1;
     if @a >0 then 
		rollback;
	end if;
END