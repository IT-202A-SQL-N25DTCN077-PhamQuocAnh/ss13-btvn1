USE RikkeiClinicDB;

DELIMITER //

CREATE TRIGGER PreventPastAppointments
BEFORE UPDATE ON Appointments
FOR EACH ROW
BEGIN

    -- Lỗi logic: đang lấy ngày cũ ra so sánh với hiện tại thay vì kiểm tra ngày mới
    -- IF OLD.appointment_date < NOW() THEN
    IF OLD.appointment_date < NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Lỗi: Không thể đặt lịch khám vào thời điểm trong quá khứ!';
    END IF;

END //

DELIMITER ;

DROP TRIGGER IF EXISTS PreventPastAppointments;

DELIMITER $$
CREATE TRIGGER PreventPastAppointments
BEFORE UPDATE ON Appointments
FOR EACH ROW
BEGIN
	IF NEW.appointment_date < NOW() THEN 
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Lỗi: Không thể đặt lịch khám vào thời điểm trong quá khứ!';
    END IF;
END $$

DELIMITER ;

UPDATE Appointments
SET appointment_date = '2026-12-20 09:00:00'
WHERE appointment_id = 104;

-- Kết quả mong đợi:
-- Cập nhật thành công


-- Test case 2: Update sang ngày quá khứ => Phải báo lỗi
UPDATE Appointments
SET appointment_date = '2020-01-01 09:00:00'
WHERE appointment_id = 104;

-- Kết quả mong đợi:
-- Lỗi: Không thể đặt lịch khám vào thời điểm trong quá khứ!