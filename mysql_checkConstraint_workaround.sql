DELIMITER $$
CREATE TRIGGER check_EVENTPLANLINE_insert BEFORE INSERT ON EVENTPLANLINE FOR EACH ROW  
BEGIN  
    DECLARE dummy,baddata INT;
    SET baddata = 0;
    IF NEW.TIMESTART >= NEW.TIMEEND THEN
        SET baddata = 1;
    END IF;
    IF baddata = 1 THEN
        SELECT CONCAT('Cannot insert, check if values conform to constraints')  
        INTO dummy FROM information_schema.tables;
    END IF;
END; $$

CREATE TRIGGER check_EVENTPLANLINE_update BEFORE UPDATE ON EVENTPLANLINE FOR EACH ROW
BEGIN
    DECLARE dummy,baddata INT;
    SET baddata = 0;
    IF NEW.TIMESTART >= NEW.TIMEEND THEN
        SET baddata = 1;
    END IF;
    IF baddata = 1 THEN
        SELECT CONCAT('Cannot update, check if values conform to constraints')  
        INTO dummy FROM information_schema.tables;
    END IF;
END; $$ 
DELIMITER ;
