-- Table Definitions for Train Passenger Reservation System

-- Table: train_details
CREATE TABLE train_details (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    train_name TEXT NOT NULL,
    train_number TEXT NOT NULL UNIQUE,
    train_source_station TEXT NOT NULL,
    train_destination_station TEXT NOT NULL,
    start_time TEXT NOT NULL, -- Format: HH:mm
    end_time TEXT NOT NULL,   -- Format: HH:mm
    type TEXT CHECK(type IN ('LOCAL', 'MEMU', 'EMU', 'EXPRESS')) NOT NULL,
    availability TEXT NOT NULL
);

-- Table: booking_details
CREATE TABLE booking_details (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    train_id INTEGER NOT NULL,
    passenger_full_name TEXT NOT NULL,
    age INTEGER NOT NULL CHECK(age >= 1 AND age <= 120),
    sex TEXT CHECK(sex IN ('M', 'F')) NOT NULL,
    travel_date DATE NOT NULL,
    boarding_station_name TEXT NOT NULL,
    destination_station_name TEXT NOT NULL,
    coach_name TEXT CHECK(coach_name IN ('S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'S7', 'S8', 'S9', 'S10', 'A1', 'A2', 'A3', 'A4', 'A5', 'B1', 'B2', 'B3', 'B4', 'B5', 'C1', 'C2', 'C3', 'C4', 'C5', 'D1', 'D2', 'D3', 'D4', 'D5')) NOT NULL,
    seat_number INTEGER CHECK(seat_number >= 1 AND seat_number <= 75) NOT NULL,
    booking_status TEXT CHECK(booking_status IN ('CNF', 'WAT', 'CNC')) NOT NULL,
    FOREIGN KEY (train_id) REFERENCES train_details (id)
);


-- Insert Train Details
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Jaipur via Agra EMU', '67316', 'Mumbai', 'Jaipur', '20:52', '02:35', 'LOCAL', ' TW    ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Hyderabad via Gwalior Local', '74238', 'Chennai', 'Hyderabad', '05:34', '05:28', 'MEMU', 'MTWTFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Jaipur via Agra EMU', '17409', 'Hyderabad', 'Jaipur', '23:13', '06:12', 'EMU', 'M      ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Chennai via Agra Express', '34145', 'Hyderabad', 'Chennai', '17:17', '11:55', 'EXPRESS', 'MT  F S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Kolkata via Bhopal EMU', '63178', 'Mumbai', 'Kolkata', '07:33', '12:24', 'EMU', '  W    ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Delhi via Pune MEMU', '69383', 'Bangalore', 'Delhi', '14:15', '03:06', 'EXPRESS', ' T TFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Delhi via Pune Local', '85619', 'Hyderabad', 'Delhi', '15:26', '14:58', 'LOCAL', '     S ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Jaipur via Kanpur MEMU', '56403', 'Chennai', 'Jaipur', '12:58', '03:50', 'MEMU', ' T T   ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Kolkata - Bangalore via Bhopal Local', '57243', 'Kolkata', 'Bangalore', '04:23', '09:20', 'EMU', 'M  TFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Agra - Hyderabad via Agra EMU', '64845', 'Agra', 'Hyderabad', '19:20', '10:52', 'EMU', 'M   FS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Kolkata - Hyderabad via Pune Local', '70056', 'Kolkata', 'Hyderabad', '04:52', '04:59', 'LOCAL', 'MT    S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Jaipur via Vadodara MEMU', '66432', 'Bangalore', 'Jaipur', '15:37', '20:20', 'LOCAL', 'MT  F  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Chennai via Bhopal EMU', '39601', 'Mumbai', 'Chennai', '12:41', '00:03', 'LOCAL', 'M  T  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Kolkata - Delhi via Nagpur Express', '89162', 'Kolkata', 'Delhi', '16:00', '12:13', 'EXPRESS', ' T   SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Bangalore via Pune Express', '57082', 'Chennai', 'Bangalore', '08:29', '09:55', 'EXPRESS', '  W  SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Bangalore via Pune Express', '16454', 'Delhi', 'Bangalore', '23:06', '21:12', 'EMU', 'M WTF  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Jaipur via Lucknow Local', '76537', 'Bangalore', 'Jaipur', '05:22', '10:25', 'EXPRESS', 'M  T SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Agra - Bangalore via Pune Local', '38057', 'Agra', 'Bangalore', '18:08', '04:10', 'EMU', 'MTWT  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Chennai via Kanpur MEMU', '86947', 'Hyderabad', 'Chennai', '07:51', '11:39', 'EXPRESS', '   T SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Jaipur via Vadodara Express', '49578', 'Bangalore', 'Jaipur', '09:04', '02:59', 'EMU', ' T  F S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Kolkata via Lucknow MEMU', '66684', 'Delhi', 'Kolkata', '23:34', '18:45', 'EXPRESS', 'M W F  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Jaipur via Nagpur Express', '67076', 'Mumbai', 'Jaipur', '07:44', '11:03', 'EXPRESS', '  W F S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Mumbai via Vadodara Express', '32906', 'Delhi', 'Mumbai', '02:39', '16:29', 'LOCAL', '     S ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Kolkata via Bhopal Express', '94857', 'Chennai', 'Kolkata', '03:57', '07:23', 'EXPRESS', 'M WTFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Agra - Bangalore via Vadodara Local', '33338', 'Agra', 'Bangalore', '00:20', '19:21', 'EXPRESS', ' TW FS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Agra via Nagpur Express', '12318', 'Chennai', 'Agra', '00:30', '13:53', 'MEMU', 'M  T   ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Chennai via Gwalior Local', '19210', 'Mumbai', 'Chennai', '14:45', '04:17', 'LOCAL', ' T T S ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Delhi via Vadodara Express', '93902', 'Hyderabad', 'Delhi', '09:00', '06:26', 'EXPRESS', 'M W   S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Jaipur - Kolkata via Vadodara Express', '24022', 'Jaipur', 'Kolkata', '00:32', '21:44', 'MEMU', 'M WTFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Kolkata - Bangalore via Gwalior MEMU', '80613', 'Kolkata', 'Bangalore', '20:03', '11:53', 'LOCAL', 'M   FS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Kolkata - Jaipur via Lucknow Express', '66942', 'Kolkata', 'Jaipur', '07:44', '12:15', 'EXPRESS', 'M WTFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Delhi via Vadodara Express', '53350', 'Bangalore', 'Delhi', '20:16', '04:40', 'EXPRESS', 'MT  FS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Hyderabad via Agra Express', '74561', 'Mumbai', 'Hyderabad', '22:54', '17:51', 'EMU', 'MT TF  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Agra via Pune MEMU', '61461', 'Delhi', 'Agra', '00:12', '22:34', 'EXPRESS', 'MTW F S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Kolkata - Agra via Kanpur Local', '13234', 'Kolkata', 'Agra', '11:40', '10:56', 'MEMU', 'MT T SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Bangalore via Vadodara Express', '40130', 'Delhi', 'Bangalore', '05:03', '20:51', 'EXPRESS', '   T  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Delhi via Nagpur MEMU', '56648', 'Mumbai', 'Delhi', '08:51', '21:40', 'EMU', '   T   ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Kolkata via Vadodara Local', '87989', 'Hyderabad', 'Kolkata', '02:18', '04:14', 'EXPRESS', ' T TFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Kolkata via Lucknow Local', '61677', 'Mumbai', 'Kolkata', '03:48', '19:41', 'LOCAL', '     SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Jaipur via Bhopal EMU', '28415', 'Mumbai', 'Jaipur', '12:16', '10:02', 'MEMU', 'M W  S ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Jaipur via Pune Local', '44346', 'Delhi', 'Jaipur', '18:18', '08:53', 'LOCAL', '  W FSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Chennai via Agra Local', '53780', 'Bangalore', 'Chennai', '10:50', '19:46', 'EXPRESS', 'MTWTF  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Agra - Mumbai via Agra MEMU', '32128', 'Agra', 'Mumbai', '23:39', '01:38', 'EMU', 'MT  F  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Jaipur via Agra MEMU', '50871', 'Hyderabad', 'Jaipur', '14:45', '22:42', 'MEMU', '  W FSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Agra - Hyderabad via Kanpur EMU', '90368', 'Agra', 'Hyderabad', '05:53', '04:54', 'MEMU', 'M   F  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Jaipur - Agra via Bhopal Local', '39090', 'Jaipur', 'Agra', '22:47', '16:05', 'EMU', '   TF S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Chennai via Lucknow Local', '32046', 'Hyderabad', 'Chennai', '05:50', '14:00', 'LOCAL', '  W   S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Agra - Chennai via Nagpur Express', '80639', 'Agra', 'Chennai', '03:45', '02:03', 'EMU', 'M  T SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Kolkata via Lucknow Local', '74633', 'Hyderabad', 'Kolkata', '01:13', '08:37', 'EMU', ' T T  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Agra via Nagpur Local', '51463', 'Hyderabad', 'Agra', '12:11', '23:58', 'EMU', '  WT S ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Chennai via Bhopal MEMU', '58610', 'Mumbai', 'Chennai', '05:57', '05:44', 'EMU', 'M W   S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Kolkata - Mumbai via Gwalior MEMU', '48212', 'Kolkata', 'Mumbai', '07:07', '17:41', 'MEMU', 'M WTFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Agra via Lucknow EMU', '83373', 'Chennai', 'Agra', '23:02', '19:09', 'MEMU', 'M     S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Jaipur via Kanpur Express', '23457', 'Bangalore', 'Jaipur', '21:48', '02:27', 'EXPRESS', 'M  T  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Delhi via Bhopal Local', '53188', 'Mumbai', 'Delhi', '20:32', '20:22', 'EXPRESS', '   T  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Kolkata - Mumbai via Nagpur EMU', '81201', 'Kolkata', 'Mumbai', '20:56', '11:12', 'EMU', '     SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Jaipur - Kolkata via Bhopal EMU', '73923', 'Jaipur', 'Kolkata', '11:30', '11:18', 'EXPRESS', 'MTW F S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Delhi via Pune Local', '71700', 'Chennai', 'Delhi', '02:19', '21:27', 'LOCAL', 'MTWTFS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Jaipur via Bhopal EMU', '45848', 'Delhi', 'Jaipur', '10:05', '21:04', 'EXPRESS', 'MTWTFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Bangalore via Kanpur MEMU', '90216', 'Mumbai', 'Bangalore', '04:30', '08:43', 'LOCAL', 'MTW F S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Hyderabad via Agra Express', '81027', 'Bangalore', 'Hyderabad', '12:00', '15:36', 'MEMU', '   TF  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Jaipur via Nagpur Express', '90799', 'Delhi', 'Jaipur', '23:59', '10:40', 'EMU', '  WTF S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Kolkata via Lucknow Local', '32872', 'Chennai', 'Kolkata', '15:02', '03:41', 'EMU', 'M   FS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Kolkata via Bhopal EMU', '39119', 'Delhi', 'Kolkata', '18:40', '15:49', 'LOCAL', ' T TF  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Agra via Lucknow EMU', '61259', 'Delhi', 'Agra', '01:52', '15:23', 'EMU', 'M  T  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Agra via Agra Local', '25819', 'Chennai', 'Agra', '16:12', '03:25', 'EXPRESS', 'M  TFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Jaipur via Pune Local', '96404', 'Bangalore', 'Jaipur', '03:23', '09:02', 'EXPRESS', ' TWT  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Jaipur - Delhi via Vadodara MEMU', '19858', 'Jaipur', 'Delhi', '21:34', '17:14', 'EXPRESS', '      S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Jaipur - Kolkata via Lucknow EMU', '42442', 'Jaipur', 'Kolkata', '09:46', '15:02', 'LOCAL', 'MTWTF S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Agra - Kolkata via Lucknow Local', '47169', 'Agra', 'Kolkata', '03:12', '01:03', 'MEMU', ' T T  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Hyderabad via Agra Local', '81767', 'Bangalore', 'Hyderabad', '02:27', '19:53', 'LOCAL', '  WTFS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Chennai via Nagpur EMU', '45782', 'Hyderabad', 'Chennai', '13:29', '16:53', 'EMU', '  WT  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Jaipur via Gwalior MEMU', '18866', 'Hyderabad', 'Jaipur', '10:23', '21:08', 'MEMU', ' T T  S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Agra - Mumbai via Vadodara EMU', '28059', 'Agra', 'Mumbai', '23:46', '14:06', 'EMU', 'M W    ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Chennai via Bhopal EMU', '95335', 'Hyderabad', 'Chennai', '18:00', '04:28', 'EMU', '   T SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Delhi via Agra Local', '43433', 'Bangalore', 'Delhi', '19:27', '16:03', 'EXPRESS', 'M W  SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Bangalore via Agra MEMU', '46079', 'Delhi', 'Bangalore', '06:08', '21:37', 'EMU', ' T  FSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Delhi via Pune MEMU', '17551', 'Chennai', 'Delhi', '07:42', '09:35', 'MEMU', ' T TF S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Agra - Jaipur via Agra Local', '58911', 'Agra', 'Jaipur', '05:30', '17:32', 'EMU', 'MT TFS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Delhi via Nagpur MEMU', '60717', 'Hyderabad', 'Delhi', '11:52', '23:57', 'MEMU', '     SS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Jaipur via Lucknow Local', '16852', 'Chennai', 'Jaipur', '21:45', '19:51', 'LOCAL', ' TWTFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Delhi via Bhopal Local', '35013', 'Mumbai', 'Delhi', '22:47', '18:02', 'LOCAL', 'M W FSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Hyderabad via Nagpur Express', '61915', 'Bangalore', 'Hyderabad', '10:07', '15:25', 'MEMU', ' TWTFS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Jaipur via Lucknow Express', '91259', 'Hyderabad', 'Jaipur', '22:15', '08:09', 'EMU', 'M W FS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Kolkata - Bangalore via Agra Local', '22824', 'Kolkata', 'Bangalore', '11:42', '15:01', 'EMU', 'MTWTFS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Hyderabad via Kanpur MEMU', '66901', 'Delhi', 'Hyderabad', '03:41', '01:47', 'EMU', 'MT  F S');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Agra via Kanpur Local', '92246', 'Bangalore', 'Agra', '01:28', '23:54', 'EMU', 'M WTFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Delhi via Vadodara MEMU', '14344', 'Hyderabad', 'Delhi', '08:06', '14:15', 'EXPRESS', 'M   FSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Delhi via Gwalior EMU', '66048', 'Hyderabad', 'Delhi', '10:16', '21:57', 'EMU', 'M W    ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Bangalore - Jaipur via Vadodara Express', '46485', 'Bangalore', 'Jaipur', '09:40', '08:19', 'MEMU', '   TF  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Kolkata via Gwalior MEMU', '18728', 'Chennai', 'Kolkata', '09:11', '11:45', 'LOCAL', 'M  TFSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Kolkata via Gwalior EMU', '94299', 'Delhi', 'Kolkata', '01:25', '19:15', 'LOCAL', 'MT     ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Jaipur via Vadodara EMU', '86113', 'Mumbai', 'Jaipur', '13:58', '19:32', 'LOCAL', 'MT  F  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Jaipur - Delhi via Nagpur EMU', '16349', 'Jaipur', 'Delhi', '06:15', '00:14', 'EXPRESS', ' TW    ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Chennai - Mumbai via Kanpur Local', '50439', 'Chennai', 'Mumbai', '14:53', '05:16', 'EXPRESS', 'MT  F  ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Agra via Bhopal Express', '78014', 'Mumbai', 'Agra', '18:50', '20:58', 'LOCAL', ' TW    ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Hyderabad - Delhi via Lucknow Express', '27119', 'Hyderabad', 'Delhi', '03:43', '00:24', 'MEMU', 'M  T   ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Mumbai - Chennai via Nagpur MEMU', '59709', 'Mumbai', 'Chennai', '23:00', '22:27', 'MEMU', 'M W FSS');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Delhi - Hyderabad via Kanpur EMU', '97080', 'Delhi', 'Hyderabad', '13:40', '19:55', 'LOCAL', '   TFS ');
INSERT INTO train_details (train_name, train_number, train_source_station, train_destination_station, start_time, end_time, type, availability)
VALUES ('Jaipur - Chennai via Agra Local', '53248', 'Jaipur', 'Chennai', '18:00', '18:05', 'LOCAL', 'M W    ');

-- Insert Booking Details
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Erika Townsend', 35, 'F', '2024-10-13', 'Bangalore', 'Chennai', 'D5', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Terrance Dixon', 6, 'M', '2024-09-24', 'Hyderabad', 'Chennai', 'C4', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Samantha Walters', 87, 'F', '2025-06-11', 'Hyderabad', 'Agra', 'D2', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Erika Giles', 93, 'F', '2025-03-14', 'Jaipur', 'Mumbai', 'C1', 46, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Dina Jackson', 97, 'F', '2025-06-17', 'Delhi', 'Chennai', 'S4', 63, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Shannon Webster', 94, 'M', '2025-06-14', 'Chennai', 'Agra', 'B5', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Dina Love', 67, 'M', '2024-10-25', 'Delhi', 'Hyderabad', 'S1', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Erika Dixon', 73, 'M', '2024-02-24', 'Mumbai', 'Jaipur', 'C5', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Linda Giles', 112, 'M', '2025-12-27', 'Agra', 'Bangalore', 'C2', 34, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Dina Webster', 41, 'M', '2025-08-30', 'Jaipur', 'Kolkata', 'S10', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Linda Giles', 80, 'M', '2025-12-08', 'Delhi', 'Jaipur', 'C2', 18, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Kelley Delgado', 114, 'F', '2025-03-26', 'Mumbai', 'Delhi', 'C2', 45, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Rogelio Walters', 101, 'F', '2025-02-06', 'Bangalore', 'Jaipur', 'B5', 51, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Dina Brandt', 110, 'M', '2025-03-08', 'Chennai', 'Jaipur', 'C2', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Malcolm Webster', 3, 'M', '2025-03-12', 'Mumbai', 'Mumbai', 'C1', 70, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Rogelio Webster', 24, 'F', '2025-03-25', 'Delhi', 'Agra', 'A3', 41, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Shannon Walters', 5, 'M', '2024-03-15', 'Hyderabad', 'Mumbai', 'A5', 25, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Benjamin Delgado', 65, 'M', '2024-01-29', 'Delhi', 'Kolkata', 'C3', 7, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Samantha Finch', 112, 'M', '2024-01-17', 'Kolkata', 'Mumbai', 'A1', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Samantha Walters', 13, 'M', '2025-11-11', 'Hyderabad', 'Hyderabad', 'C5', 27, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Linda Jackson', 91, 'M', '2025-01-20', 'Bangalore', 'Bangalore', 'C4', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Benjamin Love', 105, 'F', '2024-08-12', 'Kolkata', 'Kolkata', 'C5', 56, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Erika Dixon', 51, 'M', '2025-08-01', 'Jaipur', 'Mumbai', 'C5', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Erika Delgado', 34, 'F', '2025-10-19', 'Agra', 'Delhi', 'S3', 69, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Dina Jackson', 7, 'F', '2024-07-24', 'Kolkata', 'Bangalore', 'A3', 13, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Dina Finch', 45, 'M', '2024-02-27', 'Mumbai', 'Delhi', 'D1', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Erika Delgado', 11, 'F', '2024-08-04', 'Hyderabad', 'Chennai', 'S9', 13, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Samantha Finch', 36, 'M', '2024-12-26', 'Jaipur', 'Hyderabad', 'B1', 75, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Malcolm Walters', 64, 'M', '2024-11-29', 'Chennai', 'Agra', 'C2', 27, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Shannon Jackson', 36, 'M', '2025-06-26', 'Chennai', 'Kolkata', 'C1', 37, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Dina Giles', 12, 'M', '2024-07-21', 'Delhi', 'Chennai', 'D2', 23, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Kelley Love', 3, 'M', '2025-04-01', 'Bangalore', 'Agra', 'S7', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Benjamin Giles', 86, 'F', '2024-09-20', 'Delhi', 'Jaipur', 'B2', 53, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Rogelio Giles', 86, 'M', '2024-02-06', 'Bangalore', 'Hyderabad', 'S3', 7, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Shannon Giles', 88, 'M', '2024-05-28', 'Kolkata', 'Chennai', 'D3', 47, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Dina Townsend', 55, 'F', '2024-06-03', 'Jaipur', 'Kolkata', 'B5', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Dina Jackson', 91, 'M', '2025-06-30', 'Hyderabad', 'Jaipur', 'A3', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Terrance Webster', 6, 'F', '2025-12-03', 'Kolkata', 'Agra', 'S2', 52, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Terrance Jackson', 112, 'F', '2024-12-06', 'Hyderabad', 'Bangalore', 'D4', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Kelley Dixon', 21, 'F', '2024-04-30', 'Hyderabad', 'Bangalore', 'B4', 54, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Rogelio Love', 96, 'M', '2024-06-11', 'Kolkata', 'Hyderabad', 'A4', 30, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Kelley Giles', 99, 'F', '2025-01-11', 'Hyderabad', 'Mumbai', 'S7', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Linda Love', 31, 'M', '2025-07-17', 'Jaipur', 'Mumbai', 'A4', 21, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Rogelio Finch', 41, 'M', '2024-05-26', 'Hyderabad', 'Bangalore', 'C3', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Benjamin Jackson', 46, 'F', '2024-04-04', 'Bangalore', 'Jaipur', 'S8', 40, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Benjamin Webster', 74, 'M', '2024-04-21', 'Mumbai', 'Kolkata', 'A2', 2, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Terrance Walters', 93, 'F', '2025-11-05', 'Agra', 'Kolkata', 'A1', 23, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Rogelio Giles', 64, 'M', '2025-10-17', 'Agra', 'Delhi', 'B4', 47, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Shannon Finch', 24, 'F', '2025-05-01', 'Agra', 'Agra', 'A4', 28, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Samantha Webster', 5, 'F', '2025-04-04', 'Kolkata', 'Hyderabad', 'S4', 70, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Shannon Finch', 57, 'F', '2024-09-02', 'Kolkata', 'Agra', 'S2', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Erika Walters', 95, 'M', '2024-03-17', 'Bangalore', 'Jaipur', 'D2', 38, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Rogelio Dixon', 97, 'M', '2024-01-26', 'Hyderabad', 'Jaipur', 'S5', 57, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Erika Jackson', 65, 'M', '2025-11-20', 'Bangalore', 'Delhi', 'B3', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Malcolm Townsend', 13, 'M', '2025-02-27', 'Jaipur', 'Hyderabad', 'S10', 52, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Malcolm Brandt', 38, 'M', '2025-10-08', 'Mumbai', 'Mumbai', 'D1', 45, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Kelley Delgado', 6, 'M', '2025-11-07', 'Bangalore', 'Agra', 'B3', 28, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Samantha Finch', 69, 'M', '2024-10-17', 'Delhi', 'Jaipur', 'S3', 12, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Terrance Walters', 80, 'F', '2025-12-11', 'Bangalore', 'Mumbai', 'S6', 45, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Erika Giles', 90, 'F', '2025-10-10', 'Jaipur', 'Jaipur', 'S6', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Samantha Finch', 59, 'M', '2024-07-22', 'Chennai', 'Chennai', 'A2', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Rogelio Giles', 96, 'F', '2024-05-20', 'Jaipur', 'Mumbai', 'S7', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Dina Giles', 26, 'M', '2024-08-07', 'Kolkata', 'Delhi', 'S3', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Rogelio Brandt', 96, 'F', '2025-11-27', 'Bangalore', 'Agra', 'C5', 32, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Terrance Brandt', 43, 'M', '2025-11-10', 'Delhi', 'Delhi', 'S7', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Terrance Walters', 69, 'M', '2024-08-19', 'Mumbai', 'Mumbai', 'B3', 11, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Malcolm Brandt', 64, 'M', '2024-01-16', 'Mumbai', 'Chennai', 'A2', 60, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Samantha Webster', 21, 'F', '2025-04-11', 'Delhi', 'Bangalore', 'S5', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Shannon Finch', 118, 'F', '2024-01-17', 'Delhi', 'Jaipur', 'C1', 74, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Erika Delgado', 15, 'F', '2025-04-27', 'Agra', 'Agra', 'A5', 7, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Kelley Love', 15, 'M', '2025-09-11', 'Jaipur', 'Agra', 'S2', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Dina Love', 53, 'M', '2024-07-15', 'Bangalore', 'Jaipur', 'C3', 9, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Malcolm Giles', 114, 'M', '2024-09-02', 'Kolkata', 'Bangalore', 'C2', 45, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Linda Giles', 9, 'M', '2024-09-09', 'Mumbai', 'Delhi', 'S2', 20, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Samantha Brandt', 107, 'F', '2025-03-21', 'Delhi', 'Agra', 'D1', 42, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Benjamin Finch', 93, 'M', '2024-05-31', 'Mumbai', 'Chennai', 'B3', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Benjamin Delgado', 99, 'M', '2025-05-04', 'Mumbai', 'Agra', 'C1', 34, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Linda Jackson', 37, 'F', '2024-06-03', 'Chennai', 'Chennai', 'A5', 41, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Samantha Walters', 83, 'M', '2025-01-01', 'Agra', 'Kolkata', 'B3', 73, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Linda Finch', 37, 'M', '2024-07-23', 'Agra', 'Mumbai', 'D4', 73, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Samantha Delgado', 57, 'M', '2025-12-20', 'Chennai', 'Jaipur', 'B5', 11, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Rogelio Finch', 1, 'M', '2024-03-09', 'Mumbai', 'Bangalore', 'C4', 23, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Linda Delgado', 89, 'F', '2024-09-20', 'Chennai', 'Hyderabad', 'D5', 1, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Shannon Walters', 119, 'F', '2025-12-21', 'Chennai', 'Delhi', 'D3', 50, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Terrance Love', 103, 'M', '2024-05-23', 'Chennai', 'Agra', 'B4', 74, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Dina Giles', 64, 'M', '2025-09-09', 'Delhi', 'Kolkata', 'B4', 29, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Rogelio Love', 47, 'F', '2025-06-23', 'Hyderabad', 'Mumbai', 'C4', 44, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Malcolm Jackson', 94, 'M', '2024-05-28', 'Jaipur', 'Bangalore', 'C1', 11, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Samantha Brandt', 49, 'M', '2025-07-22', 'Delhi', 'Kolkata', 'C5', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Dina Finch', 58, 'F', '2024-01-25', 'Mumbai', 'Bangalore', 'S3', 69, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Kelley Webster', 2, 'M', '2024-06-23', 'Jaipur', 'Mumbai', 'B3', 27, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Malcolm Dixon', 13, 'M', '2025-06-09', 'Bangalore', 'Chennai', 'D5', 13, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Rogelio Brandt', 30, 'M', '2025-02-15', 'Chennai', 'Kolkata', 'C2', 67, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Rogelio Love', 96, 'F', '2025-02-02', 'Hyderabad', 'Kolkata', 'S2', 7, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Rogelio Love', 21, 'F', '2024-12-05', 'Mumbai', 'Kolkata', 'A5', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Terrance Webster', 56, 'M', '2025-09-04', 'Delhi', 'Bangalore', 'D1', 64, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Dina Giles', 17, 'M', '2024-05-30', 'Kolkata', 'Delhi', 'D5', 9, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Terrance Delgado', 102, 'M', '2024-12-11', 'Delhi', 'Bangalore', 'S2', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Dina Townsend', 19, 'F', '2025-04-21', 'Delhi', 'Jaipur', 'S7', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Rogelio Jackson', 109, 'F', '2025-08-03', 'Bangalore', 'Agra', 'S10', 30, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Dina Delgado', 117, 'F', '2025-12-25', 'Delhi', 'Hyderabad', 'S4', 18, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Erika Brandt', 6, 'F', '2025-09-08', 'Delhi', 'Chennai', 'C3', 31, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Benjamin Brandt', 14, 'F', '2024-05-23', 'Jaipur', 'Hyderabad', 'S10', 20, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Kelley Dixon', 3, 'M', '2024-03-07', 'Kolkata', 'Bangalore', 'B1', 40, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Dina Love', 52, 'M', '2025-02-01', 'Chennai', 'Kolkata', 'S4', 12, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Dina Walters', 34, 'M', '2025-06-26', 'Agra', 'Kolkata', 'B1', 69, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Erika Giles', 12, 'F', '2024-01-25', 'Chennai', 'Kolkata', 'S8', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Rogelio Love', 78, 'M', '2025-07-11', 'Hyderabad', 'Hyderabad', 'S6', 3, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Terrance Love', 9, 'F', '2025-09-07', 'Jaipur', 'Mumbai', 'A4', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Kelley Finch', 89, 'M', '2024-10-05', 'Kolkata', 'Hyderabad', 'S8', 43, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Terrance Dixon', 61, 'M', '2024-07-19', 'Bangalore', 'Delhi', 'A1', 28, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Kelley Townsend', 52, 'F', '2024-02-11', 'Mumbai', 'Agra', 'A2', 8, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Malcolm Dixon', 34, 'F', '2025-09-04', 'Chennai', 'Jaipur', 'S7', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Benjamin Delgado', 53, 'F', '2024-04-08', 'Kolkata', 'Kolkata', 'A4', 34, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Malcolm Jackson', 49, 'M', '2025-10-21', 'Agra', 'Chennai', 'C1', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Samantha Delgado', 22, 'M', '2025-11-21', 'Hyderabad', 'Kolkata', 'B1', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Shannon Townsend', 104, 'F', '2025-09-21', 'Agra', 'Delhi', 'A1', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Kelley Giles', 37, 'F', '2025-02-01', 'Agra', 'Mumbai', 'A1', 61, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Terrance Giles', 97, 'M', '2025-12-17', 'Agra', 'Agra', 'C1', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Rogelio Webster', 87, 'M', '2024-06-28', 'Mumbai', 'Kolkata', 'C4', 19, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Linda Brandt', 14, 'M', '2024-05-06', 'Delhi', 'Bangalore', 'A1', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Shannon Giles', 113, 'F', '2025-08-25', 'Delhi', 'Chennai', 'B4', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Samantha Walters', 103, 'M', '2024-03-05', 'Agra', 'Hyderabad', 'A1', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Erika Finch', 99, 'M', '2025-02-19', 'Kolkata', 'Agra', 'S9', 19, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Malcolm Brandt', 107, 'M', '2025-10-08', 'Kolkata', 'Delhi', 'S5', 70, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Kelley Dixon', 65, 'M', '2025-02-22', 'Hyderabad', 'Jaipur', 'C4', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Kelley Dixon', 53, 'M', '2025-10-01', 'Mumbai', 'Hyderabad', 'D3', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Terrance Walters', 110, 'M', '2025-05-13', 'Chennai', 'Jaipur', 'B3', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Shannon Love', 17, 'M', '2025-07-14', 'Mumbai', 'Chennai', 'C3', 55, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Malcolm Giles', 38, 'M', '2025-02-13', 'Bangalore', 'Chennai', 'A1', 22, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Rogelio Finch', 110, 'F', '2024-10-04', 'Bangalore', 'Agra', 'C2', 13, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Shannon Townsend', 62, 'M', '2024-11-26', 'Bangalore', 'Kolkata', 'A2', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Malcolm Love', 69, 'M', '2024-10-02', 'Kolkata', 'Mumbai', 'C3', 75, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Benjamin Love', 119, 'M', '2025-10-31', 'Delhi', 'Delhi', 'C5', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Dina Webster', 10, 'F', '2024-11-17', 'Agra', 'Hyderabad', 'S2', 27, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Benjamin Delgado', 56, 'F', '2025-02-12', 'Mumbai', 'Jaipur', 'A1', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Erika Finch', 46, 'M', '2025-12-24', 'Jaipur', 'Kolkata', 'B5', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Shannon Love', 52, 'M', '2025-04-06', 'Hyderabad', 'Delhi', 'S5', 11, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Terrance Jackson', 25, 'F', '2025-09-14', 'Agra', 'Jaipur', 'S10', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Dina Townsend', 32, 'F', '2025-12-05', 'Chennai', 'Bangalore', 'A2', 53, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Shannon Webster', 59, 'F', '2024-07-06', 'Hyderabad', 'Mumbai', 'S1', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Terrance Giles', 113, 'M', '2025-07-24', 'Bangalore', 'Agra', 'A5', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Malcolm Love', 116, 'F', '2025-03-24', 'Chennai', 'Chennai', 'C1', 72, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Linda Finch', 31, 'M', '2025-01-31', 'Bangalore', 'Jaipur', 'C2', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Dina Townsend', 44, 'M', '2025-02-10', 'Hyderabad', 'Hyderabad', 'C3', 71, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Kelley Townsend', 35, 'M', '2025-12-29', 'Bangalore', 'Agra', 'C1', 4, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Dina Brandt', 49, 'M', '2025-04-07', 'Agra', 'Agra', 'S8', 42, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Shannon Giles', 82, 'M', '2024-06-21', 'Jaipur', 'Delhi', 'B3', 73, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Dina Jackson', 94, 'F', '2025-07-16', 'Bangalore', 'Chennai', 'S10', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Kelley Love', 44, 'M', '2025-10-19', 'Agra', 'Delhi', 'S3', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Dina Giles', 62, 'F', '2024-11-28', 'Agra', 'Kolkata', 'C2', 67, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Shannon Delgado', 32, 'F', '2024-08-19', 'Hyderabad', 'Hyderabad', 'S6', 23, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Erika Brandt', 20, 'M', '2024-12-05', 'Delhi', 'Mumbai', 'S1', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Benjamin Giles', 88, 'F', '2025-03-13', 'Kolkata', 'Agra', 'A3', 8, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Terrance Delgado', 99, 'F', '2024-07-21', 'Mumbai', 'Chennai', 'A2', 54, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Benjamin Jackson', 73, 'M', '2024-05-16', 'Bangalore', 'Agra', 'B3', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Shannon Love', 62, 'F', '2025-03-04', 'Agra', 'Mumbai', 'S1', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Shannon Jackson', 13, 'F', '2025-08-02', 'Agra', 'Jaipur', 'S1', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Dina Delgado', 59, 'M', '2024-04-12', 'Agra', 'Bangalore', 'C4', 50, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Malcolm Love', 70, 'F', '2025-12-30', 'Kolkata', 'Kolkata', 'D4', 39, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Rogelio Brandt', 88, 'M', '2024-06-23', 'Chennai', 'Jaipur', 'C4', 52, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Erika Jackson', 44, 'F', '2024-10-01', 'Chennai', 'Chennai', 'D2', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Erika Love', 86, 'M', '2024-09-18', 'Kolkata', 'Mumbai', 'D1', 12, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Malcolm Walters', 107, 'F', '2025-09-04', 'Kolkata', 'Hyderabad', 'B5', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Linda Delgado', 83, 'M', '2024-02-02', 'Kolkata', 'Bangalore', 'S2', 37, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Shannon Giles', 67, 'M', '2024-08-10', 'Chennai', 'Hyderabad', 'S6', 32, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Shannon Brandt', 6, 'M', '2024-11-26', 'Delhi', 'Mumbai', 'S7', 18, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Rogelio Dixon', 66, 'F', '2025-05-15', 'Jaipur', 'Agra', 'S9', 61, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Samantha Walters', 109, 'F', '2024-04-22', 'Agra', 'Bangalore', 'S4', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Rogelio Walters', 120, 'F', '2025-04-17', 'Bangalore', 'Jaipur', 'C5', 4, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Shannon Dixon', 3, 'F', '2024-01-03', 'Kolkata', 'Mumbai', 'A1', 8, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Malcolm Giles', 48, 'F', '2025-03-22', 'Delhi', 'Chennai', 'D5', 21, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Linda Brandt', 31, 'F', '2025-12-05', 'Agra', 'Hyderabad', 'B5', 46, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Erika Dixon', 19, 'F', '2024-05-26', 'Agra', 'Kolkata', 'B4', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Terrance Jackson', 63, 'F', '2025-01-07', 'Delhi', 'Chennai', 'S3', 38, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Benjamin Townsend', 84, 'M', '2025-05-19', 'Chennai', 'Jaipur', 'D1', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Samantha Jackson', 120, 'F', '2024-04-17', 'Hyderabad', 'Jaipur', 'S5', 25, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Erika Brandt', 118, 'M', '2024-08-07', 'Kolkata', 'Kolkata', 'S2', 72, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Samantha Brandt', 59, 'M', '2024-11-22', 'Kolkata', 'Agra', 'D3', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Dina Dixon', 17, 'M', '2024-05-11', 'Agra', 'Mumbai', 'B3', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Linda Webster', 99, 'F', '2024-09-06', 'Agra', 'Delhi', 'C2', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Samantha Delgado', 63, 'M', '2024-01-03', 'Kolkata', 'Jaipur', 'A4', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Rogelio Brandt', 56, 'F', '2024-08-10', 'Jaipur', 'Agra', 'C2', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Shannon Giles', 14, 'F', '2025-01-27', 'Jaipur', 'Delhi', 'C3', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Linda Brandt', 50, 'M', '2024-02-03', 'Kolkata', 'Hyderabad', 'S4', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Terrance Jackson', 19, 'M', '2025-08-04', 'Chennai', 'Chennai', 'C2', 12, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Malcolm Dixon', 43, 'M', '2024-08-25', 'Delhi', 'Bangalore', 'B3', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Malcolm Delgado', 103, 'F', '2025-12-03', 'Bangalore', 'Bangalore', 'S2', 25, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Malcolm Townsend', 76, 'F', '2025-04-02', 'Jaipur', 'Mumbai', 'S2', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Linda Walters', 37, 'M', '2024-01-18', 'Delhi', 'Hyderabad', 'S9', 60, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Malcolm Love', 23, 'M', '2025-05-09', 'Bangalore', 'Kolkata', 'D1', 22, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Samantha Webster', 58, 'M', '2025-03-05', 'Kolkata', 'Kolkata', 'A5', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Benjamin Dixon', 88, 'F', '2024-02-29', 'Agra', 'Mumbai', 'D4', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Linda Giles', 6, 'M', '2024-01-06', 'Jaipur', 'Agra', 'C1', 4, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Benjamin Dixon', 65, 'F', '2024-11-28', 'Jaipur', 'Kolkata', 'S6', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Rogelio Finch', 60, 'F', '2024-05-13', 'Delhi', 'Bangalore', 'S3', 62, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Shannon Dixon', 89, 'M', '2024-04-09', 'Kolkata', 'Hyderabad', 'A3', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Linda Delgado', 119, 'M', '2024-01-29', 'Mumbai', 'Chennai', 'B1', 18, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Benjamin Jackson', 39, 'F', '2025-06-17', 'Jaipur', 'Jaipur', 'S10', 36, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Shannon Dixon', 21, 'M', '2025-04-17', 'Chennai', 'Agra', 'C5', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Benjamin Walters', 108, 'F', '2025-09-19', 'Bangalore', 'Chennai', 'S3', 47, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Shannon Townsend', 71, 'F', '2025-07-04', 'Kolkata', 'Chennai', 'S3', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Rogelio Brandt', 45, 'F', '2025-04-23', 'Mumbai', 'Delhi', 'A5', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Linda Giles', 61, 'M', '2024-03-14', 'Bangalore', 'Agra', 'D3', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Dina Dixon', 59, 'F', '2024-12-23', 'Jaipur', 'Chennai', 'A5', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Shannon Dixon', 11, 'M', '2025-12-11', 'Hyderabad', 'Mumbai', 'S10', 68, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Dina Webster', 7, 'M', '2025-08-11', 'Hyderabad', 'Agra', 'A2', 74, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Shannon Brandt', 14, 'M', '2025-12-18', 'Kolkata', 'Kolkata', 'B2', 18, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Samantha Jackson', 1, 'F', '2024-10-09', 'Jaipur', 'Delhi', 'C4', 52, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Rogelio Townsend', 66, 'F', '2024-07-28', 'Hyderabad', 'Delhi', 'B1', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Samantha Finch', 36, 'M', '2025-01-02', 'Mumbai', 'Jaipur', 'S9', 66, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Rogelio Webster', 109, 'F', '2024-06-23', 'Chennai', 'Delhi', 'A1', 28, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Malcolm Delgado', 92, 'F', '2025-12-01', 'Chennai', 'Jaipur', 'D3', 70, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Dina Delgado', 28, 'F', '2024-02-20', 'Chennai', 'Bangalore', 'A2', 57, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Linda Dixon', 52, 'M', '2024-04-23', 'Agra', 'Mumbai', 'A1', 28, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Shannon Giles', 67, 'M', '2024-12-21', 'Jaipur', 'Hyderabad', 'D2', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Terrance Dixon', 80, 'M', '2025-05-03', 'Hyderabad', 'Mumbai', 'B1', 54, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Erika Love', 60, 'M', '2024-02-08', 'Bangalore', 'Bangalore', 'A5', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Linda Webster', 24, 'F', '2024-07-11', 'Bangalore', 'Chennai', 'S3', 38, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Dina Giles', 39, 'F', '2025-05-07', 'Kolkata', 'Agra', 'A1', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Linda Dixon', 2, 'M', '2025-08-02', 'Agra', 'Delhi', 'D3', 54, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Dina Walters', 39, 'F', '2024-06-12', 'Chennai', 'Chennai', 'D5', 15, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Erika Brandt', 14, 'F', '2024-01-21', 'Mumbai', 'Delhi', 'A2', 49, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Malcolm Brandt', 29, 'F', '2025-12-31', 'Jaipur', 'Bangalore', 'B4', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Shannon Townsend', 6, 'M', '2024-11-03', 'Kolkata', 'Hyderabad', 'A2', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Terrance Finch', 77, 'M', '2024-08-01', 'Hyderabad', 'Delhi', 'C1', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Shannon Delgado', 99, 'F', '2025-02-09', 'Bangalore', 'Mumbai', 'S10', 6, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Shannon Jackson', 57, 'M', '2025-08-23', 'Mumbai', 'Mumbai', 'S6', 45, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Shannon Delgado', 108, 'F', '2024-07-25', 'Chennai', 'Mumbai', 'S5', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Erika Jackson', 19, 'F', '2024-03-25', 'Chennai', 'Agra', 'B4', 38, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Malcolm Delgado', 115, 'M', '2024-02-14', 'Bangalore', 'Mumbai', 'A1', 13, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Erika Jackson', 63, 'M', '2024-05-24', 'Kolkata', 'Chennai', 'B3', 18, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Terrance Giles', 3, 'F', '2024-11-09', 'Mumbai', 'Hyderabad', 'B2', 53, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Erika Webster', 108, 'M', '2025-04-14', 'Delhi', 'Delhi', 'C3', 28, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Malcolm Walters', 9, 'M', '2025-05-13', 'Jaipur', 'Mumbai', 'C5', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Benjamin Giles', 76, 'M', '2024-12-25', 'Kolkata', 'Hyderabad', 'B2', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Samantha Webster', 106, 'M', '2024-11-23', 'Bangalore', 'Agra', 'D3', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Shannon Giles', 26, 'M', '2025-10-10', 'Kolkata', 'Bangalore', 'S7', 33, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Samantha Townsend', 71, 'M', '2025-11-25', 'Hyderabad', 'Kolkata', 'S2', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Erika Townsend', 109, 'M', '2024-01-03', 'Hyderabad', 'Chennai', 'S8', 7, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Kelley Jackson', 2, 'F', '2025-12-13', 'Kolkata', 'Agra', 'D1', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Shannon Webster', 74, 'F', '2025-07-20', 'Chennai', 'Agra', 'B3', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Terrance Dixon', 86, 'M', '2024-09-23', 'Bangalore', 'Bangalore', 'A3', 52, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Dina Delgado', 88, 'M', '2024-09-01', 'Delhi', 'Chennai', 'D4', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Dina Walters', 107, 'M', '2025-09-12', 'Agra', 'Bangalore', 'D2', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Benjamin Delgado', 85, 'M', '2024-06-01', 'Hyderabad', 'Bangalore', 'S4', 60, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Benjamin Dixon', 70, 'M', '2024-07-07', 'Hyderabad', 'Delhi', 'S9', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Rogelio Delgado', 116, 'M', '2025-04-26', 'Jaipur', 'Kolkata', 'B4', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Kelley Walters', 37, 'F', '2024-09-11', 'Bangalore', 'Hyderabad', 'B4', 30, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Erika Love', 53, 'M', '2025-12-29', 'Jaipur', 'Bangalore', 'D3', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Rogelio Giles', 100, 'M', '2024-12-24', 'Chennai', 'Chennai', 'C2', 31, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Samantha Finch', 53, 'F', '2025-11-06', 'Kolkata', 'Delhi', 'S2', 34, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Linda Delgado', 88, 'M', '2024-10-02', 'Agra', 'Jaipur', 'A1', 37, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Terrance Walters', 69, 'F', '2025-10-28', 'Delhi', 'Mumbai', 'S5', 5, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Terrance Webster', 9, 'M', '2025-11-10', 'Mumbai', 'Mumbai', 'A5', 52, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Terrance Delgado', 85, 'F', '2024-04-02', 'Bangalore', 'Jaipur', 'C3', 69, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Terrance Jackson', 14, 'M', '2025-01-28', 'Delhi', 'Bangalore', 'D4', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Kelley Dixon', 27, 'F', '2024-04-28', 'Hyderabad', 'Bangalore', 'B4', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Shannon Townsend', 48, 'F', '2025-06-28', 'Jaipur', 'Agra', 'S4', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Rogelio Jackson', 57, 'M', '2025-11-18', 'Bangalore', 'Bangalore', 'S9', 55, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Malcolm Finch', 99, 'F', '2024-05-22', 'Bangalore', 'Jaipur', 'A1', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Kelley Love', 12, 'F', '2024-11-09', 'Delhi', 'Mumbai', 'S1', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Terrance Finch', 6, 'F', '2025-07-07', 'Kolkata', 'Kolkata', 'S6', 46, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Shannon Giles', 32, 'M', '2024-10-30', 'Mumbai', 'Delhi', 'A1', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Terrance Webster', 38, 'F', '2025-12-06', 'Chennai', 'Agra', 'D4', 7, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Shannon Giles', 80, 'F', '2025-11-01', 'Kolkata', 'Bangalore', 'D4', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Rogelio Dixon', 45, 'F', '2025-09-30', 'Delhi', 'Bangalore', 'A4', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Kelley Dixon', 92, 'M', '2024-07-03', 'Chennai', 'Jaipur', 'A2', 69, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Rogelio Dixon', 11, 'F', '2025-10-25', 'Hyderabad', 'Delhi', 'D2', 43, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Erika Dixon', 52, 'M', '2025-01-10', 'Jaipur', 'Chennai', 'S10', 20, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Dina Jackson', 44, 'M', '2024-09-17', 'Jaipur', 'Mumbai', 'C1', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Malcolm Webster', 8, 'M', '2024-09-23', 'Mumbai', 'Mumbai', 'S10', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Malcolm Jackson', 82, 'F', '2024-05-31', 'Jaipur', 'Hyderabad', 'C5', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Dina Dixon', 51, 'M', '2025-01-15', 'Bangalore', 'Chennai', 'C2', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Linda Townsend', 8, 'F', '2024-08-18', 'Kolkata', 'Delhi', 'B4', 70, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Terrance Walters', 84, 'F', '2025-04-07', 'Jaipur', 'Bangalore', 'S3', 27, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Kelley Brandt', 48, 'M', '2025-04-25', 'Delhi', 'Kolkata', 'S4', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Malcolm Brandt', 28, 'F', '2024-06-24', 'Bangalore', 'Agra', 'D1', 57, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Shannon Brandt', 114, 'M', '2025-12-28', 'Agra', 'Agra', 'S1', 31, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Rogelio Jackson', 115, 'M', '2024-07-29', 'Hyderabad', 'Hyderabad', 'B4', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Shannon Finch', 108, 'M', '2024-07-25', 'Delhi', 'Chennai', 'B4', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Kelley Delgado', 84, 'F', '2024-02-09', 'Hyderabad', 'Delhi', 'C5', 56, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Dina Delgado', 69, 'M', '2025-08-15', 'Kolkata', 'Jaipur', 'S4', 30, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Kelley Finch', 35, 'M', '2025-05-02', 'Kolkata', 'Kolkata', 'C4', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Samantha Brandt', 112, 'M', '2024-09-02', 'Mumbai', 'Bangalore', 'D2', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Kelley Brandt', 74, 'M', '2025-04-06', 'Hyderabad', 'Chennai', 'S2', 69, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Erika Delgado', 47, 'F', '2024-12-25', 'Bangalore', 'Mumbai', 'C2', 13, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Kelley Walters', 99, 'F', '2024-04-15', 'Jaipur', 'Agra', 'S8', 70, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Shannon Brandt', 53, 'F', '2024-04-03', 'Agra', 'Chennai', 'S1', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Linda Webster', 37, 'F', '2024-05-11', 'Agra', 'Jaipur', 'B1', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Malcolm Giles', 52, 'F', '2024-02-15', 'Agra', 'Bangalore', 'C3', 11, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Linda Walters', 115, 'M', '2024-03-05', 'Hyderabad', 'Jaipur', 'B2', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Dina Delgado', 78, 'M', '2025-07-22', 'Kolkata', 'Mumbai', 'B2', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Erika Jackson', 49, 'F', '2024-07-25', 'Kolkata', 'Kolkata', 'S9', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Erika Love', 13, 'M', '2025-10-04', 'Mumbai', 'Hyderabad', 'S1', 44, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Kelley Walters', 22, 'M', '2025-02-05', 'Kolkata', 'Mumbai', 'A3', 31, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Samantha Delgado', 105, 'M', '2024-08-07', 'Mumbai', 'Hyderabad', 'A2', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Malcolm Finch', 108, 'M', '2025-03-30', 'Jaipur', 'Bangalore', 'A5', 19, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Shannon Jackson', 66, 'M', '2025-03-27', 'Agra', 'Chennai', 'D4', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Kelley Townsend', 9, 'M', '2024-11-20', 'Mumbai', 'Agra', 'S7', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Kelley Dixon', 14, 'F', '2025-10-26', 'Bangalore', 'Jaipur', 'S7', 61, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Terrance Finch', 4, 'M', '2025-03-30', 'Delhi', 'Kolkata', 'A2', 19, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Shannon Jackson', 104, 'M', '2025-06-10', 'Jaipur', 'Jaipur', 'S6', 64, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Benjamin Webster', 52, 'M', '2025-07-23', 'Delhi', 'Bangalore', 'C5', 26, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Shannon Webster', 118, 'M', '2024-08-20', 'Jaipur', 'Agra', 'C3', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Benjamin Love', 104, 'M', '2025-01-10', 'Agra', 'Delhi', 'A2', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Erika Delgado', 78, 'F', '2024-10-23', 'Jaipur', 'Agra', 'B2', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Erika Townsend', 43, 'M', '2024-02-15', 'Delhi', 'Mumbai', 'A1', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Kelley Dixon', 88, 'M', '2024-11-11', 'Bangalore', 'Hyderabad', 'S2', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Erika Love', 40, 'F', '2025-08-18', 'Agra', 'Kolkata', 'C1', 36, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Malcolm Love', 5, 'M', '2025-09-01', 'Kolkata', 'Bangalore', 'S8', 46, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Shannon Webster', 81, 'F', '2024-11-23', 'Delhi', 'Agra', 'B4', 25, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Samantha Dixon', 2, 'M', '2024-11-04', 'Hyderabad', 'Bangalore', 'C3', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Benjamin Finch', 49, 'F', '2025-09-12', 'Kolkata', 'Chennai', 'B4', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Shannon Townsend', 108, 'M', '2024-06-05', 'Bangalore', 'Delhi', 'B1', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Benjamin Love', 21, 'F', '2025-05-21', 'Chennai', 'Hyderabad', 'S1', 29, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Kelley Walters', 57, 'M', '2024-10-02', 'Mumbai', 'Delhi', 'A2', 35, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Linda Giles', 102, 'F', '2025-03-23', 'Kolkata', 'Mumbai', 'B5', 15, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Malcolm Dixon', 86, 'F', '2025-01-08', 'Delhi', 'Jaipur', 'C3', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Samantha Giles', 67, 'M', '2025-02-13', 'Agra', 'Kolkata', 'S3', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Dina Giles', 39, 'M', '2025-06-24', 'Jaipur', 'Bangalore', 'C2', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Terrance Delgado', 110, 'F', '2025-01-29', 'Hyderabad', 'Mumbai', 'S8', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Rogelio Love', 91, 'M', '2025-05-13', 'Jaipur', 'Bangalore', 'D3', 49, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Terrance Brandt', 99, 'F', '2025-04-03', 'Jaipur', 'Bangalore', 'A2', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Dina Dixon', 3, 'M', '2025-08-17', 'Hyderabad', 'Agra', 'B1', 40, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Dina Dixon', 17, 'M', '2024-10-22', 'Delhi', 'Agra', 'D4', 63, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Erika Jackson', 99, 'M', '2024-02-27', 'Bangalore', 'Chennai', 'D3', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Benjamin Brandt', 54, 'M', '2024-03-29', 'Bangalore', 'Jaipur', 'B1', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Dina Brandt', 116, 'M', '2024-03-23', 'Hyderabad', 'Mumbai', 'S10', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Rogelio Giles', 34, 'M', '2025-06-25', 'Bangalore', 'Agra', 'S4', 66, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Dina Delgado', 83, 'F', '2025-01-03', 'Delhi', 'Hyderabad', 'S3', 23, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Terrance Dixon', 108, 'F', '2025-09-10', 'Kolkata', 'Mumbai', 'B4', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Malcolm Dixon', 80, 'F', '2025-03-13', 'Hyderabad', 'Delhi', 'A3', 9, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Linda Delgado', 8, 'M', '2024-09-08', 'Agra', 'Agra', 'S3', 9, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Linda Jackson', 37, 'F', '2025-12-01', 'Chennai', 'Chennai', 'A5', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Dina Brandt', 109, 'F', '2025-10-08', 'Jaipur', 'Jaipur', 'A2', 24, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Linda Delgado', 56, 'F', '2025-12-15', 'Kolkata', 'Hyderabad', 'S8', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Benjamin Giles', 3, 'F', '2024-06-23', 'Mumbai', 'Chennai', 'C2', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Shannon Dixon', 43, 'M', '2025-05-24', 'Delhi', 'Agra', 'D2', 19, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Erika Brandt', 119, 'F', '2024-03-01', 'Mumbai', 'Kolkata', 'A4', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Kelley Dixon', 8, 'F', '2025-10-22', 'Delhi', 'Kolkata', 'B1', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Dina Walters', 113, 'M', '2025-07-17', 'Kolkata', 'Mumbai', 'C3', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Benjamin Giles', 60, 'F', '2025-10-10', 'Chennai', 'Agra', 'B3', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Erika Jackson', 70, 'F', '2024-08-07', 'Delhi', 'Delhi', 'S5', 54, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Terrance Townsend', 94, 'F', '2024-11-24', 'Delhi', 'Bangalore', 'B4', 34, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Linda Love', 2, 'M', '2025-07-07', 'Mumbai', 'Mumbai', 'A4', 52, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Shannon Brandt', 86, 'M', '2025-02-07', 'Mumbai', 'Mumbai', 'B3', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Linda Finch', 93, 'F', '2025-01-21', 'Delhi', 'Delhi', 'S8', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Shannon Jackson', 17, 'F', '2025-09-02', 'Chennai', 'Agra', 'C2', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Benjamin Walters', 8, 'F', '2024-12-17', 'Chennai', 'Hyderabad', 'B2', 37, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Malcolm Brandt', 109, 'M', '2025-12-16', 'Agra', 'Bangalore', 'A5', 44, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Terrance Dixon', 74, 'F', '2024-12-03', 'Jaipur', 'Delhi', 'S10', 30, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Shannon Webster', 29, 'F', '2024-05-18', 'Jaipur', 'Hyderabad', 'B4', 63, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Benjamin Giles', 21, 'F', '2025-05-08', 'Bangalore', 'Bangalore', 'C2', 26, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Rogelio Townsend', 22, 'F', '2025-02-05', 'Jaipur', 'Agra', 'A5', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Kelley Townsend', 65, 'M', '2025-03-28', 'Chennai', 'Kolkata', 'C4', 37, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Shannon Jackson', 13, 'M', '2025-03-24', 'Chennai', 'Delhi', 'S7', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Dina Finch', 2, 'F', '2025-10-26', 'Bangalore', 'Mumbai', 'S7', 11, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Rogelio Webster', 114, 'M', '2024-02-22', 'Agra', 'Delhi', 'D1', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Rogelio Dixon', 76, 'M', '2024-11-21', 'Delhi', 'Hyderabad', 'S7', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Malcolm Townsend', 96, 'F', '2025-09-04', 'Bangalore', 'Hyderabad', 'C4', 45, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Linda Finch', 120, 'F', '2024-11-30', 'Delhi', 'Agra', 'B5', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Rogelio Finch', 100, 'F', '2024-08-20', 'Delhi', 'Kolkata', 'C5', 29, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Malcolm Jackson', 21, 'F', '2024-11-21', 'Jaipur', 'Mumbai', 'S7', 20, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Rogelio Finch', 109, 'F', '2024-08-08', 'Mumbai', 'Mumbai', 'S4', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Rogelio Dixon', 58, 'F', '2025-09-05', 'Mumbai', 'Delhi', 'B2', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Rogelio Webster', 43, 'M', '2024-09-04', 'Mumbai', 'Bangalore', 'A4', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Samantha Finch', 75, 'F', '2025-03-23', 'Agra', 'Bangalore', 'S1', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Terrance Giles', 28, 'M', '2024-01-12', 'Agra', 'Hyderabad', 'D3', 60, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Rogelio Jackson', 71, 'M', '2025-01-20', 'Chennai', 'Jaipur', 'C2', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Kelley Jackson', 101, 'M', '2024-12-27', 'Agra', 'Agra', 'C4', 46, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Terrance Walters', 24, 'F', '2025-11-02', 'Jaipur', 'Kolkata', 'S1', 53, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Kelley Brandt', 62, 'F', '2025-11-28', 'Bangalore', 'Kolkata', 'D4', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Samantha Delgado', 106, 'M', '2024-01-23', 'Agra', 'Mumbai', 'S4', 37, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Erika Webster', 101, 'F', '2025-08-07', 'Kolkata', 'Kolkata', 'S8', 39, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Erika Dixon', 115, 'M', '2024-10-16', 'Hyderabad', 'Jaipur', 'C4', 39, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Shannon Walters', 116, 'M', '2024-09-23', 'Bangalore', 'Agra', 'S2', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Linda Delgado', 66, 'F', '2024-11-19', 'Delhi', 'Hyderabad', 'C2', 47, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Terrance Brandt', 107, 'F', '2025-07-15', 'Agra', 'Delhi', 'D5', 40, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Shannon Finch', 91, 'M', '2025-06-10', 'Jaipur', 'Agra', 'C1', 69, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Dina Delgado', 72, 'M', '2024-06-28', 'Chennai', 'Mumbai', 'C1', 73, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Dina Giles', 68, 'M', '2025-09-28', 'Mumbai', 'Delhi', 'A1', 9, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Dina Giles', 82, 'M', '2025-02-19', 'Jaipur', 'Delhi', 'S3', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Erika Jackson', 115, 'M', '2025-09-24', 'Bangalore', 'Jaipur', 'B4', 40, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Malcolm Brandt', 110, 'M', '2024-07-28', 'Mumbai', 'Agra', 'B3', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Dina Townsend', 16, 'M', '2025-08-20', 'Mumbai', 'Chennai', 'C5', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Terrance Dixon', 33, 'F', '2025-04-16', 'Hyderabad', 'Mumbai', 'B3', 49, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Terrance Giles', 16, 'F', '2025-02-23', 'Kolkata', 'Jaipur', 'C4', 10, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Dina Dixon', 112, 'M', '2025-08-14', 'Delhi', 'Mumbai', 'S7', 16, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Benjamin Dixon', 49, 'F', '2024-08-29', 'Bangalore', 'Bangalore', 'A5', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Samantha Giles', 98, 'F', '2024-02-06', 'Mumbai', 'Delhi', 'D3', 5, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Terrance Walters', 110, 'M', '2024-05-20', 'Mumbai', 'Bangalore', 'C4', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Rogelio Walters', 68, 'M', '2025-06-18', 'Jaipur', 'Chennai', 'B1', 52, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Samantha Jackson', 10, 'M', '2025-05-02', 'Hyderabad', 'Mumbai', 'C2', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Malcolm Finch', 112, 'M', '2025-11-20', 'Agra', 'Hyderabad', 'C3', 69, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Rogelio Giles', 2, 'F', '2024-05-29', 'Chennai', 'Kolkata', 'A1', 46, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Kelley Jackson', 58, 'F', '2024-08-22', 'Agra', 'Chennai', 'A1', 36, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Erika Jackson', 54, 'F', '2025-01-09', 'Kolkata', 'Bangalore', 'B2', 70, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Samantha Webster', 7, 'F', '2024-09-29', 'Agra', 'Bangalore', 'C2', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Linda Jackson', 119, 'F', '2024-01-15', 'Chennai', 'Jaipur', 'B3', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Malcolm Townsend', 99, 'M', '2024-07-11', 'Hyderabad', 'Chennai', 'A4', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Benjamin Giles', 36, 'M', '2024-07-04', 'Mumbai', 'Agra', 'B4', 28, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Dina Love', 62, 'F', '2024-12-25', 'Mumbai', 'Agra', 'S8', 39, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Kelley Delgado', 22, 'M', '2025-02-07', 'Agra', 'Bangalore', 'S2', 52, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Dina Jackson', 92, 'M', '2025-01-01', 'Chennai', 'Chennai', 'D4', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Dina Townsend', 50, 'M', '2024-06-06', 'Jaipur', 'Jaipur', 'S5', 50, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Benjamin Giles', 18, 'M', '2025-09-15', 'Jaipur', 'Agra', 'D3', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Rogelio Giles', 52, 'M', '2024-04-14', 'Hyderabad', 'Chennai', 'D5', 35, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Benjamin Delgado', 113, 'F', '2024-02-14', 'Delhi', 'Agra', 'S4', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Samantha Brandt', 43, 'M', '2024-08-10', 'Mumbai', 'Hyderabad', 'D1', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Samantha Jackson', 100, 'F', '2024-12-25', 'Chennai', 'Chennai', 'B1', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Benjamin Finch', 95, 'F', '2024-05-13', 'Hyderabad', 'Kolkata', 'B4', 11, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Shannon Giles', 67, 'M', '2024-04-03', 'Mumbai', 'Bangalore', 'S8', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Linda Jackson', 10, 'M', '2025-03-14', 'Agra', 'Hyderabad', 'S2', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Malcolm Jackson', 110, 'F', '2024-03-17', 'Bangalore', 'Hyderabad', 'S8', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Samantha Townsend', 120, 'F', '2025-01-08', 'Bangalore', 'Agra', 'S3', 42, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Samantha Giles', 87, 'M', '2025-01-22', 'Jaipur', 'Mumbai', 'C3', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Terrance Giles', 23, 'M', '2025-10-04', 'Delhi', 'Hyderabad', 'S8', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Linda Webster', 23, 'M', '2025-10-23', 'Bangalore', 'Jaipur', 'S8', 12, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Malcolm Jackson', 49, 'M', '2025-05-02', 'Delhi', 'Chennai', 'S6', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Malcolm Finch', 79, 'F', '2025-06-24', 'Jaipur', 'Jaipur', 'S3', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Terrance Walters', 86, 'M', '2025-09-29', 'Mumbai', 'Hyderabad', 'D2', 28, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Dina Townsend', 7, 'F', '2024-07-03', 'Jaipur', 'Delhi', 'A4', 46, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Linda Walters', 83, 'F', '2024-02-06', 'Agra', 'Agra', 'D4', 15, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Dina Walters', 100, 'M', '2024-02-21', 'Jaipur', 'Jaipur', 'S6', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Benjamin Finch', 107, 'M', '2024-06-03', 'Jaipur', 'Mumbai', 'S5', 50, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Benjamin Love', 20, 'F', '2025-12-08', 'Jaipur', 'Kolkata', 'S5', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Dina Giles', 89, 'M', '2025-08-22', 'Mumbai', 'Chennai', 'S4', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Linda Townsend', 61, 'M', '2025-04-29', 'Jaipur', 'Mumbai', 'S9', 4, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Kelley Jackson', 30, 'M', '2025-09-19', 'Jaipur', 'Hyderabad', 'A4', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Erika Finch', 82, 'F', '2025-09-23', 'Delhi', 'Mumbai', 'A4', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Linda Townsend', 5, 'F', '2025-06-16', 'Delhi', 'Bangalore', 'S3', 45, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Malcolm Delgado', 118, 'F', '2024-07-10', 'Kolkata', 'Mumbai', 'S5', 75, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Erika Webster', 56, 'M', '2025-02-06', 'Delhi', 'Kolkata', 'S5', 22, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Linda Webster', 32, 'M', '2024-03-29', 'Jaipur', 'Chennai', 'B2', 42, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Shannon Delgado', 57, 'F', '2025-03-28', 'Mumbai', 'Bangalore', 'D1', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Rogelio Brandt', 107, 'F', '2025-07-06', 'Agra', 'Agra', 'B2', 34, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Rogelio Dixon', 6, 'F', '2024-10-05', 'Delhi', 'Chennai', 'C1', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Linda Walters', 14, 'F', '2025-04-21', 'Delhi', 'Bangalore', 'B1', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Malcolm Delgado', 119, 'F', '2025-03-20', 'Jaipur', 'Jaipur', 'C2', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Benjamin Jackson', 118, 'M', '2025-06-19', 'Chennai', 'Delhi', 'A3', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Terrance Webster', 71, 'F', '2024-05-31', 'Jaipur', 'Mumbai', 'S4', 16, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Kelley Walters', 99, 'F', '2025-04-06', 'Delhi', 'Chennai', 'S6', 5, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Benjamin Love', 72, 'F', '2024-12-14', 'Delhi', 'Agra', 'S8', 6, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Benjamin Love', 37, 'M', '2025-11-21', 'Agra', 'Kolkata', 'C5', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Shannon Webster', 46, 'F', '2025-12-25', 'Delhi', 'Delhi', 'S4', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Terrance Jackson', 108, 'F', '2024-09-03', 'Bangalore', 'Mumbai', 'S5', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Erika Brandt', 43, 'M', '2024-09-12', 'Kolkata', 'Mumbai', 'B1', 67, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Benjamin Brandt', 48, 'M', '2025-05-26', 'Agra', 'Chennai', 'A4', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Samantha Walters', 50, 'F', '2024-03-09', 'Agra', 'Chennai', 'D5', 75, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Erika Walters', 64, 'F', '2025-04-24', 'Delhi', 'Agra', 'B3', 24, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Erika Brandt', 96, 'F', '2025-08-15', 'Delhi', 'Kolkata', 'S1', 32, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Kelley Dixon', 92, 'M', '2025-10-22', 'Agra', 'Agra', 'S4', 70, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Malcolm Love', 13, 'F', '2024-04-19', 'Mumbai', 'Jaipur', 'D3', 12, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Terrance Brandt', 55, 'F', '2024-12-14', 'Chennai', 'Bangalore', 'S9', 39, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Malcolm Webster', 51, 'F', '2025-04-02', 'Kolkata', 'Kolkata', 'D5', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Terrance Walters', 70, 'M', '2025-07-25', 'Kolkata', 'Mumbai', 'C4', 22, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Samantha Brandt', 81, 'F', '2024-04-03', 'Chennai', 'Agra', 'A2', 53, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Erika Delgado', 48, 'M', '2025-04-07', 'Bangalore', 'Agra', 'A4', 72, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Benjamin Brandt', 85, 'M', '2025-05-05', 'Hyderabad', 'Kolkata', 'S8', 49, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Dina Giles', 40, 'F', '2024-06-19', 'Jaipur', 'Hyderabad', 'C5', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Malcolm Walters', 46, 'F', '2025-08-13', 'Mumbai', 'Chennai', 'B1', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Dina Walters', 64, 'F', '2024-06-18', 'Bangalore', 'Agra', 'S5', 44, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Dina Love', 77, 'F', '2025-11-04', 'Agra', 'Hyderabad', 'S5', 37, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Erika Delgado', 31, 'M', '2024-09-10', 'Bangalore', 'Delhi', 'D1', 67, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Kelley Dixon', 91, 'F', '2024-03-17', 'Jaipur', 'Bangalore', 'B2', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Malcolm Delgado', 108, 'M', '2024-03-26', 'Kolkata', 'Agra', 'C5', 31, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Dina Webster', 117, 'M', '2025-01-02', 'Jaipur', 'Chennai', 'S10', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Shannon Delgado', 52, 'M', '2025-04-03', 'Jaipur', 'Hyderabad', 'S4', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Rogelio Webster', 26, 'M', '2024-02-08', 'Jaipur', 'Kolkata', 'D2', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Samantha Delgado', 25, 'F', '2024-07-07', 'Agra', 'Bangalore', 'A1', 27, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Shannon Townsend', 28, 'M', '2024-02-03', 'Kolkata', 'Bangalore', 'S2', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Terrance Giles', 100, 'F', '2025-01-21', 'Agra', 'Hyderabad', 'A5', 3, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Shannon Finch', 93, 'M', '2025-04-10', 'Jaipur', 'Kolkata', 'C5', 74, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Malcolm Walters', 21, 'F', '2024-08-24', 'Jaipur', 'Chennai', 'A4', 26, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Malcolm Webster', 78, 'F', '2025-06-24', 'Hyderabad', 'Hyderabad', 'A1', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Linda Finch', 117, 'F', '2025-06-08', 'Jaipur', 'Hyderabad', 'D5', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Malcolm Dixon', 115, 'F', '2024-12-25', 'Agra', 'Hyderabad', 'C1', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Kelley Love', 33, 'F', '2025-12-10', 'Bangalore', 'Bangalore', 'C2', 46, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Linda Brandt', 34, 'M', '2025-08-16', 'Jaipur', 'Mumbai', 'S7', 75, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Rogelio Finch', 34, 'M', '2025-10-07', 'Kolkata', 'Agra', 'B3', 72, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Kelley Jackson', 87, 'M', '2024-03-01', 'Hyderabad', 'Chennai', 'B5', 49, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Dina Brandt', 84, 'M', '2024-09-22', 'Agra', 'Agra', 'D3', 55, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Rogelio Dixon', 75, 'M', '2025-07-01', 'Chennai', 'Chennai', 'S7', 55, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Linda Walters', 23, 'M', '2025-06-13', 'Agra', 'Agra', 'C3', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Dina Giles', 77, 'M', '2025-07-25', 'Agra', 'Bangalore', 'S1', 26, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Malcolm Finch', 47, 'F', '2025-06-14', 'Jaipur', 'Mumbai', 'D3', 40, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Dina Webster', 110, 'M', '2024-12-14', 'Jaipur', 'Hyderabad', 'B1', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Benjamin Jackson', 54, 'F', '2024-08-18', 'Kolkata', 'Kolkata', 'A5', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Shannon Dixon', 71, 'M', '2025-06-16', 'Delhi', 'Chennai', 'A2', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Malcolm Brandt', 106, 'M', '2024-10-20', 'Hyderabad', 'Hyderabad', 'B3', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Erika Townsend', 9, 'F', '2024-11-26', 'Bangalore', 'Delhi', 'A4', 7, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Shannon Webster', 102, 'M', '2024-05-06', 'Agra', 'Chennai', 'C3', 29, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Dina Brandt', 82, 'F', '2025-02-06', 'Delhi', 'Agra', 'A4', 34, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Rogelio Finch', 75, 'F', '2024-03-21', 'Bangalore', 'Hyderabad', 'B4', 42, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Linda Jackson', 78, 'F', '2025-09-21', 'Bangalore', 'Kolkata', 'D2', 26, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Benjamin Brandt', 42, 'F', '2025-11-15', 'Agra', 'Mumbai', 'A3', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Benjamin Jackson', 35, 'F', '2024-07-20', 'Hyderabad', 'Kolkata', 'S10', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Malcolm Finch', 109, 'F', '2025-06-30', 'Chennai', 'Kolkata', 'S7', 42, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Linda Finch', 109, 'M', '2025-03-10', 'Chennai', 'Bangalore', 'S6', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Kelley Dixon', 9, 'F', '2025-10-25', 'Delhi', 'Jaipur', 'S1', 11, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Shannon Walters', 27, 'F', '2024-07-07', 'Hyderabad', 'Mumbai', 'S5', 13, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Dina Brandt', 33, 'F', '2025-03-02', 'Hyderabad', 'Delhi', 'C2', 57, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Samantha Walters', 62, 'F', '2024-08-30', 'Delhi', 'Kolkata', 'S4', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Kelley Jackson', 97, 'M', '2025-11-07', 'Agra', 'Jaipur', 'A2', 67, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Shannon Dixon', 67, 'F', '2025-08-01', 'Mumbai', 'Delhi', 'S6', 73, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Rogelio Webster', 59, 'M', '2024-12-26', 'Delhi', 'Hyderabad', 'C4', 9, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Benjamin Webster', 20, 'M', '2025-01-30', 'Bangalore', 'Delhi', 'A4', 74, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Erika Webster', 32, 'F', '2025-07-14', 'Bangalore', 'Chennai', 'D2', 27, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Linda Dixon', 18, 'F', '2025-06-26', 'Mumbai', 'Hyderabad', 'D5', 19, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Kelley Giles', 28, 'F', '2025-03-06', 'Mumbai', 'Delhi', 'D2', 20, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Benjamin Jackson', 8, 'F', '2024-06-08', 'Hyderabad', 'Chennai', 'S5', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Malcolm Finch', 19, 'M', '2025-09-27', 'Hyderabad', 'Kolkata', 'C3', 42, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Linda Finch', 46, 'F', '2024-03-18', 'Jaipur', 'Kolkata', 'B5', 46, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Rogelio Finch', 12, 'F', '2025-04-19', 'Delhi', 'Jaipur', 'A1', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Linda Webster', 51, 'F', '2024-08-21', 'Hyderabad', 'Bangalore', 'C4', 1, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Benjamin Giles', 16, 'M', '2024-05-01', 'Delhi', 'Agra', 'B2', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Shannon Brandt', 15, 'M', '2025-03-25', 'Jaipur', 'Chennai', 'S4', 19, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Benjamin Jackson', 4, 'M', '2024-10-02', 'Chennai', 'Jaipur', 'S4', 69, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Linda Delgado', 26, 'F', '2024-07-11', 'Delhi', 'Jaipur', 'D5', 9, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Samantha Delgado', 58, 'F', '2025-12-02', 'Bangalore', 'Kolkata', 'C5', 18, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Dina Giles', 91, 'F', '2024-07-10', 'Bangalore', 'Jaipur', 'S6', 22, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Rogelio Brandt', 37, 'F', '2024-04-22', 'Delhi', 'Bangalore', 'D2', 17, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Samantha Jackson', 86, 'M', '2024-02-27', 'Kolkata', 'Jaipur', 'D2', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Rogelio Walters', 15, 'M', '2025-02-02', 'Delhi', 'Jaipur', 'S1', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Linda Love', 16, 'F', '2024-12-30', 'Delhi', 'Mumbai', 'B3', 9, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Linda Giles', 41, 'F', '2025-07-25', 'Mumbai', 'Mumbai', 'D1', 21, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Rogelio Jackson', 13, 'F', '2025-09-01', 'Mumbai', 'Chennai', 'S7', 1, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Dina Jackson', 61, 'F', '2024-03-19', 'Delhi', 'Hyderabad', 'S4', 25, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Kelley Dixon', 60, 'F', '2024-07-02', 'Hyderabad', 'Mumbai', 'C1', 18, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Erika Townsend', 35, 'F', '2024-01-07', 'Hyderabad', 'Delhi', 'B4', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Benjamin Webster', 119, 'F', '2025-12-16', 'Jaipur', 'Hyderabad', 'D4', 1, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Rogelio Dixon', 118, 'F', '2025-07-01', 'Bangalore', 'Chennai', 'S1', 29, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Samantha Dixon', 64, 'M', '2025-03-22', 'Bangalore', 'Delhi', 'A5', 29, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Malcolm Dixon', 63, 'M', '2024-12-31', 'Delhi', 'Hyderabad', 'S10', 46, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Rogelio Finch', 1, 'F', '2024-01-05', 'Agra', 'Agra', 'B3', 20, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Erika Love', 27, 'F', '2025-02-23', 'Kolkata', 'Delhi', 'B3', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Shannon Walters', 42, 'F', '2025-04-06', 'Delhi', 'Mumbai', 'S5', 38, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Erika Brandt', 66, 'M', '2025-07-11', 'Kolkata', 'Kolkata', 'S5', 28, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Kelley Giles', 95, 'M', '2024-07-30', 'Bangalore', 'Bangalore', 'S7', 52, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Terrance Finch', 6, 'M', '2025-06-17', 'Chennai', 'Kolkata', 'B1', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Shannon Walters', 42, 'M', '2025-11-24', 'Mumbai', 'Jaipur', 'D5', 69, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Terrance Delgado', 13, 'M', '2025-11-08', 'Chennai', 'Bangalore', 'C1', 37, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Terrance Finch', 15, 'M', '2024-03-15', 'Chennai', 'Mumbai', 'C5', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Malcolm Brandt', 23, 'F', '2025-02-08', 'Bangalore', 'Jaipur', 'A3', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Malcolm Jackson', 10, 'F', '2025-09-25', 'Kolkata', 'Delhi', 'C5', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Dina Delgado', 12, 'M', '2024-04-13', 'Delhi', 'Hyderabad', 'A5', 53, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Linda Love', 20, 'M', '2024-03-07', 'Kolkata', 'Bangalore', 'B5', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Shannon Walters', 38, 'F', '2024-02-17', 'Mumbai', 'Mumbai', 'A2', 74, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Terrance Webster', 101, 'F', '2025-09-11', 'Delhi', 'Bangalore', 'S2', 18, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Kelley Finch', 106, 'M', '2024-07-06', 'Hyderabad', 'Jaipur', 'C2', 3, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Linda Walters', 52, 'F', '2025-08-02', 'Chennai', 'Jaipur', 'S5', 73, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Rogelio Townsend', 27, 'F', '2025-03-11', 'Delhi', 'Agra', 'S4', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Dina Finch', 87, 'M', '2025-10-12', 'Chennai', 'Chennai', 'D1', 37, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Shannon Townsend', 78, 'F', '2025-02-25', 'Hyderabad', 'Bangalore', 'C5', 61, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Samantha Finch', 42, 'F', '2024-12-13', 'Bangalore', 'Chennai', 'C3', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Linda Webster', 47, 'F', '2025-08-25', 'Delhi', 'Bangalore', 'A5', 20, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Terrance Finch', 27, 'M', '2024-01-11', 'Mumbai', 'Delhi', 'S7', 69, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Linda Finch', 68, 'M', '2025-09-15', 'Mumbai', 'Mumbai', 'B1', 4, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Erika Love', 72, 'F', '2024-01-11', 'Mumbai', 'Chennai', 'B3', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Shannon Giles', 103, 'M', '2024-06-06', 'Chennai', 'Jaipur', 'C5', 39, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Shannon Love', 29, 'M', '2025-05-14', 'Chennai', 'Kolkata', 'A3', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Linda Love', 24, 'M', '2024-08-20', 'Delhi', 'Delhi', 'B5', 42, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Terrance Webster', 90, 'M', '2025-12-31', 'Delhi', 'Hyderabad', 'D4', 65, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Malcolm Finch', 31, 'M', '2025-11-04', 'Chennai', 'Jaipur', 'C2', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Erika Dixon', 52, 'M', '2024-02-03', 'Chennai', 'Kolkata', 'B3', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Erika Dixon', 70, 'F', '2024-07-20', 'Kolkata', 'Delhi', 'C2', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Samantha Webster', 22, 'M', '2024-08-18', 'Agra', 'Chennai', 'A2', 68, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Linda Giles', 25, 'M', '2024-05-28', 'Bangalore', 'Mumbai', 'B1', 8, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Samantha Delgado', 32, 'M', '2025-07-22', 'Agra', 'Hyderabad', 'S1', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Shannon Giles', 108, 'F', '2025-01-18', 'Bangalore', 'Kolkata', 'S6', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Malcolm Jackson', 31, 'M', '2025-01-10', 'Hyderabad', 'Jaipur', 'D3', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Benjamin Finch', 16, 'F', '2025-12-21', 'Chennai', 'Chennai', 'C3', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Shannon Dixon', 75, 'F', '2024-03-30', 'Kolkata', 'Hyderabad', 'S4', 6, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Linda Jackson', 101, 'M', '2025-01-21', 'Mumbai', 'Agra', 'D5', 20, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Samantha Webster', 115, 'F', '2024-02-23', 'Jaipur', 'Chennai', 'C4', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Erika Jackson', 95, 'M', '2025-02-10', 'Chennai', 'Jaipur', 'D3', 69, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Benjamin Townsend', 69, 'F', '2024-11-27', 'Hyderabad', 'Mumbai', 'A1', 73, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Erika Finch', 92, 'F', '2024-06-09', 'Delhi', 'Delhi', 'D4', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Samantha Finch', 11, 'M', '2024-02-28', 'Delhi', 'Delhi', 'C3', 12, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Shannon Delgado', 84, 'F', '2024-06-15', 'Mumbai', 'Agra', 'A2', 6, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Dina Webster', 41, 'F', '2025-01-09', 'Bangalore', 'Chennai', 'C5', 73, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Linda Townsend', 4, 'M', '2024-05-30', 'Chennai', 'Delhi', 'C2', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Malcolm Love', 35, 'M', '2025-10-29', 'Chennai', 'Bangalore', 'S9', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Linda Giles', 15, 'M', '2024-11-19', 'Jaipur', 'Kolkata', 'C4', 28, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Malcolm Walters', 7, 'F', '2024-02-26', 'Delhi', 'Delhi', 'C4', 6, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Samantha Finch', 113, 'F', '2025-10-29', 'Agra', 'Delhi', 'S1', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Malcolm Brandt', 81, 'F', '2024-06-01', 'Agra', 'Delhi', 'A5', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Terrance Jackson', 39, 'F', '2025-04-18', 'Kolkata', 'Kolkata', 'B2', 69, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Samantha Dixon', 107, 'F', '2024-05-15', 'Bangalore', 'Agra', 'B2', 41, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Erika Dixon', 13, 'M', '2025-03-18', 'Jaipur', 'Delhi', 'S6', 50, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Rogelio Delgado', 117, 'M', '2024-12-03', 'Mumbai', 'Jaipur', 'S7', 64, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Malcolm Delgado', 31, 'M', '2025-04-01', 'Hyderabad', 'Mumbai', 'S5', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Linda Giles', 89, 'F', '2024-10-08', 'Chennai', 'Jaipur', 'D1', 1, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Linda Jackson', 32, 'M', '2025-03-28', 'Jaipur', 'Bangalore', 'C5', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Linda Townsend', 52, 'M', '2024-05-22', 'Kolkata', 'Kolkata', 'S6', 68, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Shannon Walters', 1, 'M', '2024-05-12', 'Hyderabad', 'Kolkata', 'D1', 46, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Terrance Love', 105, 'F', '2025-09-20', 'Kolkata', 'Mumbai', 'D4', 61, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Rogelio Webster', 38, 'M', '2025-04-11', 'Hyderabad', 'Chennai', 'D2', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Linda Brandt', 23, 'F', '2024-12-01', 'Jaipur', 'Delhi', 'C4', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Kelley Brandt', 56, 'F', '2024-12-19', 'Chennai', 'Agra', 'A1', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Benjamin Delgado', 27, 'F', '2025-08-28', 'Mumbai', 'Kolkata', 'S6', 70, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Shannon Giles', 63, 'F', '2025-09-03', 'Mumbai', 'Mumbai', 'D3', 3, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Benjamin Delgado', 20, 'M', '2025-03-08', 'Hyderabad', 'Delhi', 'S2', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Malcolm Giles', 50, 'F', '2024-10-11', 'Chennai', 'Jaipur', 'A3', 56, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Dina Jackson', 72, 'M', '2025-11-13', 'Bangalore', 'Bangalore', 'C5', 50, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Rogelio Jackson', 54, 'F', '2025-12-06', 'Delhi', 'Agra', 'D2', 46, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Erika Dixon', 55, 'M', '2025-01-23', 'Delhi', 'Agra', 'B5', 67, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Erika Finch', 42, 'M', '2024-05-27', 'Delhi', 'Chennai', 'S3', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Rogelio Brandt', 89, 'F', '2025-03-29', 'Kolkata', 'Chennai', 'S3', 55, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Linda Jackson', 13, 'M', '2025-11-11', 'Bangalore', 'Kolkata', 'S1', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Samantha Delgado', 30, 'M', '2025-04-24', 'Mumbai', 'Kolkata', 'D3', 42, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Terrance Finch', 50, 'F', '2025-02-08', 'Agra', 'Delhi', 'S10', 66, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Samantha Jackson', 57, 'F', '2025-03-11', 'Mumbai', 'Bangalore', 'D4', 50, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Linda Townsend', 73, 'F', '2025-04-22', 'Delhi', 'Chennai', 'C5', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Shannon Walters', 1, 'M', '2024-10-21', 'Hyderabad', 'Kolkata', 'D2', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Malcolm Jackson', 46, 'F', '2025-12-14', 'Agra', 'Bangalore', 'A4', 74, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Linda Love', 25, 'F', '2025-03-10', 'Hyderabad', 'Chennai', 'S2', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Erika Jackson', 65, 'F', '2025-02-03', 'Hyderabad', 'Chennai', 'A4', 39, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Benjamin Finch', 49, 'M', '2024-01-12', 'Agra', 'Hyderabad', 'B2', 55, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Dina Dixon', 50, 'M', '2024-02-25', 'Delhi', 'Agra', 'A3', 68, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Rogelio Walters', 82, 'M', '2025-03-21', 'Mumbai', 'Chennai', 'B4', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Linda Love', 117, 'F', '2025-09-20', 'Bangalore', 'Kolkata', 'C5', 33, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Erika Webster', 36, 'F', '2025-02-28', 'Mumbai', 'Bangalore', 'C1', 36, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Terrance Giles', 31, 'F', '2024-06-07', 'Kolkata', 'Jaipur', 'D2', 73, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Shannon Love', 2, 'F', '2025-12-24', 'Chennai', 'Chennai', 'A3', 56, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Terrance Walters', 109, 'F', '2025-06-13', 'Hyderabad', 'Bangalore', 'C3', 73, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Dina Walters', 49, 'F', '2024-03-17', 'Chennai', 'Hyderabad', 'C4', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Linda Jackson', 36, 'M', '2025-06-24', 'Agra', 'Kolkata', 'A1', 38, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Terrance Townsend', 2, 'M', '2024-05-13', 'Delhi', 'Agra', 'C2', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Benjamin Delgado', 74, 'F', '2024-01-20', 'Chennai', 'Jaipur', 'C1', 70, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Kelley Jackson', 89, 'M', '2025-07-31', 'Jaipur', 'Bangalore', 'D2', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Samantha Townsend', 28, 'M', '2024-05-20', 'Kolkata', 'Bangalore', 'S9', 64, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Shannon Jackson', 16, 'M', '2024-07-18', 'Delhi', 'Jaipur', 'C2', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Linda Love', 42, 'M', '2024-11-18', 'Hyderabad', 'Hyderabad', 'B1', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Samantha Brandt', 114, 'M', '2024-04-05', 'Agra', 'Delhi', 'S10', 44, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Terrance Webster', 33, 'F', '2024-09-28', 'Agra', 'Hyderabad', 'C1', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Dina Walters', 40, 'F', '2024-12-30', 'Agra', 'Jaipur', 'S6', 16, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Shannon Walters', 44, 'M', '2024-08-15', 'Bangalore', 'Bangalore', 'D3', 29, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Benjamin Webster', 3, 'F', '2024-09-27', 'Kolkata', 'Bangalore', 'S7', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Benjamin Jackson', 53, 'F', '2024-05-09', 'Jaipur', 'Jaipur', 'C2', 60, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Linda Delgado', 35, 'M', '2025-05-04', 'Delhi', 'Hyderabad', 'C5', 5, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Malcolm Webster', 37, 'F', '2024-08-04', 'Bangalore', 'Agra', 'C2', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Dina Finch', 101, 'M', '2024-06-02', 'Hyderabad', 'Bangalore', 'C2', 45, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Linda Jackson', 30, 'F', '2024-04-06', 'Agra', 'Bangalore', 'B4', 60, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Linda Townsend', 91, 'M', '2024-12-11', 'Bangalore', 'Chennai', 'D4', 64, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Malcolm Webster', 41, 'M', '2024-05-21', 'Kolkata', 'Agra', 'A5', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Malcolm Brandt', 92, 'F', '2025-01-15', 'Hyderabad', 'Chennai', 'B1', 53, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Rogelio Giles', 85, 'M', '2025-07-12', 'Jaipur', 'Agra', 'D2', 9, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Benjamin Love', 69, 'M', '2024-01-25', 'Hyderabad', 'Mumbai', 'C1', 43, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Kelley Delgado', 99, 'F', '2025-07-30', 'Kolkata', 'Chennai', 'B5', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Malcolm Dixon', 26, 'F', '2025-09-24', 'Chennai', 'Chennai', 'S1', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Erika Brandt', 107, 'F', '2025-03-09', 'Chennai', 'Kolkata', 'C4', 27, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Malcolm Walters', 68, 'F', '2025-03-21', 'Agra', 'Jaipur', 'S8', 37, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Linda Webster', 81, 'F', '2024-10-20', 'Agra', 'Jaipur', 'B4', 52, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Erika Brandt', 61, 'M', '2024-09-17', 'Bangalore', 'Delhi', 'S8', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Kelley Delgado', 61, 'M', '2024-08-29', 'Delhi', 'Chennai', 'D3', 31, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Benjamin Dixon', 59, 'M', '2024-06-04', 'Kolkata', 'Kolkata', 'S8', 7, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Linda Jackson', 92, 'F', '2025-04-06', 'Mumbai', 'Kolkata', 'S6', 75, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Rogelio Love', 105, 'M', '2024-05-01', 'Bangalore', 'Delhi', 'S10', 39, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Linda Jackson', 26, 'M', '2024-09-06', 'Hyderabad', 'Jaipur', 'C2', 45, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Terrance Finch', 103, 'F', '2025-11-28', 'Mumbai', 'Agra', 'B2', 67, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Benjamin Love', 113, 'F', '2024-04-11', 'Mumbai', 'Agra', 'A4', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Shannon Finch', 14, 'M', '2024-03-02', 'Hyderabad', 'Kolkata', 'D4', 28, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Benjamin Love', 70, 'M', '2025-11-06', 'Hyderabad', 'Hyderabad', 'C3', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Rogelio Finch', 97, 'F', '2025-12-04', 'Chennai', 'Delhi', 'D1', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Linda Walters', 63, 'M', '2025-09-27', 'Delhi', 'Agra', 'S8', 12, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Benjamin Jackson', 42, 'F', '2024-06-24', 'Jaipur', 'Bangalore', 'B1', 45, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Erika Brandt', 11, 'F', '2024-04-13', 'Agra', 'Chennai', 'D3', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Terrance Walters', 27, 'F', '2024-01-13', 'Chennai', 'Mumbai', 'S10', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Erika Townsend', 101, 'F', '2025-04-02', 'Agra', 'Jaipur', 'D2', 43, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Shannon Townsend', 106, 'F', '2024-01-24', 'Chennai', 'Agra', 'S1', 49, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Rogelio Giles', 20, 'F', '2025-11-10', 'Agra', 'Hyderabad', 'D5', 38, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Kelley Brandt', 110, 'F', '2024-04-14', 'Mumbai', 'Hyderabad', 'S6', 17, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Terrance Townsend', 68, 'F', '2025-12-05', 'Bangalore', 'Mumbai', 'B5', 4, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Rogelio Love', 62, 'M', '2024-09-14', 'Kolkata', 'Mumbai', 'S7', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Samantha Walters', 67, 'M', '2024-05-28', 'Chennai', 'Mumbai', 'D1', 53, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Benjamin Giles', 111, 'F', '2025-11-03', 'Delhi', 'Mumbai', 'C1', 44, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Samantha Giles', 35, 'F', '2025-06-09', 'Hyderabad', 'Jaipur', 'B1', 60, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Shannon Giles', 93, 'F', '2024-11-20', 'Chennai', 'Delhi', 'A4', 42, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Malcolm Webster', 17, 'F', '2024-08-16', 'Delhi', 'Bangalore', 'S3', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Benjamin Love', 83, 'M', '2025-07-01', 'Chennai', 'Mumbai', 'D2', 65, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Terrance Finch', 92, 'M', '2024-08-25', 'Mumbai', 'Kolkata', 'S1', 63, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Kelley Webster', 42, 'F', '2024-10-20', 'Delhi', 'Chennai', 'B1', 39, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Linda Delgado', 36, 'F', '2025-09-16', 'Mumbai', 'Hyderabad', 'B2', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Dina Love', 51, 'F', '2025-01-10', 'Mumbai', 'Agra', 'B1', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Linda Love', 26, 'M', '2024-03-31', 'Agra', 'Delhi', 'S7', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Linda Brandt', 8, 'F', '2025-05-30', 'Hyderabad', 'Mumbai', 'C2', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Rogelio Delgado', 47, 'F', '2024-03-23', 'Mumbai', 'Chennai', 'S7', 55, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Dina Dixon', 23, 'F', '2025-02-14', 'Delhi', 'Chennai', 'A5', 6, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Rogelio Giles', 83, 'M', '2025-03-27', 'Kolkata', 'Hyderabad', 'S6', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Rogelio Delgado', 73, 'F', '2025-12-08', 'Kolkata', 'Hyderabad', 'A2', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Malcolm Giles', 15, 'M', '2025-06-07', 'Chennai', 'Mumbai', 'S3', 66, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Kelley Webster', 44, 'F', '2024-01-01', 'Mumbai', 'Chennai', 'A2', 11, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Erika Walters', 37, 'F', '2025-08-24', 'Kolkata', 'Kolkata', 'B1', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Samantha Dixon', 17, 'F', '2024-09-05', 'Hyderabad', 'Jaipur', 'A3', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Terrance Jackson', 102, 'F', '2024-12-23', 'Jaipur', 'Agra', 'C4', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Linda Delgado', 74, 'M', '2024-11-09', 'Mumbai', 'Mumbai', 'D2', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Malcolm Delgado', 32, 'F', '2025-05-03', 'Jaipur', 'Hyderabad', 'S1', 23, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Benjamin Delgado', 17, 'F', '2025-12-09', 'Bangalore', 'Bangalore', 'D3', 52, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Linda Love', 117, 'M', '2025-12-16', 'Mumbai', 'Jaipur', 'B4', 70, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Kelley Townsend', 71, 'M', '2025-07-01', 'Hyderabad', 'Chennai', 'S1', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Shannon Delgado', 112, 'M', '2025-02-12', 'Hyderabad', 'Jaipur', 'S5', 41, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Rogelio Webster', 115, 'M', '2024-11-14', 'Mumbai', 'Bangalore', 'C3', 44, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Malcolm Townsend', 89, 'M', '2025-03-05', 'Agra', 'Delhi', 'C3', 43, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Erika Brandt', 58, 'F', '2025-12-10', 'Jaipur', 'Delhi', 'S7', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Samantha Love', 112, 'F', '2025-05-29', 'Delhi', 'Delhi', 'D2', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Terrance Dixon', 25, 'M', '2024-02-16', 'Delhi', 'Hyderabad', 'S6', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Terrance Giles', 66, 'F', '2025-12-08', 'Delhi', 'Mumbai', 'C4', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Rogelio Dixon', 80, 'M', '2025-06-20', 'Bangalore', 'Hyderabad', 'C2', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Terrance Brandt', 104, 'M', '2025-12-17', 'Kolkata', 'Bangalore', 'D2', 26, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Benjamin Webster', 92, 'F', '2024-07-20', 'Bangalore', 'Bangalore', 'C4', 66, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Benjamin Townsend', 32, 'M', '2025-12-02', 'Agra', 'Kolkata', 'S3', 27, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Benjamin Love', 43, 'F', '2025-08-29', 'Mumbai', 'Hyderabad', 'D4', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Samantha Townsend', 23, 'F', '2025-02-25', 'Mumbai', 'Chennai', 'B2', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Dina Jackson', 41, 'F', '2024-09-09', 'Agra', 'Jaipur', 'S1', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Kelley Webster', 90, 'M', '2025-06-22', 'Agra', 'Mumbai', 'S4', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Rogelio Webster', 19, 'F', '2024-08-13', 'Kolkata', 'Bangalore', 'C1', 72, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Terrance Finch', 12, 'M', '2024-03-01', 'Agra', 'Chennai', 'S10', 11, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Malcolm Jackson', 26, 'M', '2024-11-08', 'Agra', 'Delhi', 'S6', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Terrance Finch', 40, 'M', '2024-08-08', 'Hyderabad', 'Delhi', 'D5', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Malcolm Giles', 68, 'M', '2024-02-08', 'Kolkata', 'Agra', 'D2', 7, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Linda Finch', 43, 'M', '2025-04-30', 'Delhi', 'Agra', 'A1', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Malcolm Giles', 73, 'M', '2024-03-26', 'Jaipur', 'Hyderabad', 'S1', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Erika Walters', 15, 'F', '2024-08-18', 'Delhi', 'Chennai', 'S2', 25, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Terrance Giles', 59, 'M', '2025-11-12', 'Chennai', 'Mumbai', 'S8', 66, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Rogelio Delgado', 26, 'M', '2024-05-26', 'Agra', 'Hyderabad', 'S3', 50, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Malcolm Townsend', 39, 'M', '2025-10-03', 'Delhi', 'Chennai', 'C1', 31, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Erika Giles', 60, 'M', '2025-02-20', 'Mumbai', 'Kolkata', 'B4', 74, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Benjamin Delgado', 6, 'F', '2024-12-14', 'Chennai', 'Delhi', 'B4', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Linda Walters', 33, 'M', '2024-02-05', 'Agra', 'Delhi', 'C4', 16, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Rogelio Walters', 64, 'M', '2024-12-29', 'Jaipur', 'Mumbai', 'B4', 45, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Linda Finch', 43, 'M', '2024-07-20', 'Mumbai', 'Jaipur', 'D5', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Shannon Walters', 34, 'M', '2024-09-26', 'Delhi', 'Delhi', 'S9', 52, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Kelley Love', 24, 'M', '2025-11-26', 'Agra', 'Kolkata', 'S6', 41, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Malcolm Brandt', 19, 'M', '2024-07-18', 'Chennai', 'Kolkata', 'S1', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Erika Finch', 104, 'F', '2025-03-18', 'Chennai', 'Agra', 'D4', 16, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Rogelio Delgado', 53, 'F', '2024-07-26', 'Kolkata', 'Mumbai', 'D5', 24, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Linda Giles', 19, 'F', '2024-05-19', 'Chennai', 'Hyderabad', 'S7', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Malcolm Love', 101, 'M', '2024-01-04', 'Mumbai', 'Kolkata', 'S4', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Samantha Finch', 29, 'F', '2024-05-23', 'Delhi', 'Bangalore', 'B3', 49, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Malcolm Giles', 20, 'F', '2024-01-08', 'Agra', 'Jaipur', 'A5', 70, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Terrance Brandt', 24, 'F', '2025-05-16', 'Delhi', 'Bangalore', 'B3', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Kelley Webster', 77, 'F', '2025-07-09', 'Chennai', 'Hyderabad', 'S3', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Dina Love', 11, 'F', '2025-11-05', 'Mumbai', 'Delhi', 'B3', 41, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Samantha Brandt', 54, 'F', '2025-11-13', 'Bangalore', 'Hyderabad', 'C1', 61, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Dina Townsend', 116, 'M', '2025-11-24', 'Delhi', 'Kolkata', 'B1', 55, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Benjamin Giles', 90, 'F', '2024-07-26', 'Chennai', 'Kolkata', 'B5', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Dina Townsend', 41, 'M', '2025-07-16', 'Mumbai', 'Agra', 'D2', 49, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Rogelio Finch', 82, 'F', '2024-12-20', 'Agra', 'Bangalore', 'B2', 52, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Dina Love', 85, 'M', '2024-11-19', 'Delhi', 'Kolkata', 'A4', 4, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Benjamin Townsend', 65, 'F', '2025-08-23', 'Kolkata', 'Agra', 'A3', 6, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Shannon Dixon', 39, 'F', '2025-12-22', 'Agra', 'Hyderabad', 'S4', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Erika Townsend', 90, 'M', '2024-06-04', 'Agra', 'Mumbai', 'S8', 35, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Erika Love', 68, 'M', '2025-04-28', 'Chennai', 'Delhi', 'C4', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Shannon Walters', 14, 'M', '2024-03-11', 'Kolkata', 'Mumbai', 'S2', 39, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Terrance Brandt', 36, 'M', '2024-04-16', 'Delhi', 'Bangalore', 'S5', 49, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Kelley Dixon', 96, 'F', '2024-10-26', 'Chennai', 'Delhi', 'C5', 42, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Dina Dixon', 71, 'M', '2025-03-13', 'Chennai', 'Delhi', 'S2', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Malcolm Webster', 62, 'M', '2024-07-18', 'Bangalore', 'Bangalore', 'A4', 46, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Malcolm Brandt', 97, 'M', '2025-09-06', 'Mumbai', 'Mumbai', 'S8', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Shannon Jackson', 6, 'M', '2025-01-06', 'Kolkata', 'Bangalore', 'B1', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Erika Love', 65, 'M', '2025-02-26', 'Chennai', 'Kolkata', 'S10', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Terrance Giles', 75, 'F', '2025-03-19', 'Hyderabad', 'Delhi', 'S5', 61, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Kelley Delgado', 115, 'M', '2024-03-18', 'Agra', 'Kolkata', 'C4', 66, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Erika Finch', 83, 'M', '2025-02-03', 'Hyderabad', 'Agra', 'S8', 69, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Shannon Jackson', 95, 'F', '2025-04-05', 'Chennai', 'Kolkata', 'S8', 43, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Terrance Brandt', 55, 'F', '2025-09-20', 'Jaipur', 'Bangalore', 'C1', 40, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Samantha Townsend', 26, 'M', '2024-06-13', 'Delhi', 'Bangalore', 'C4', 50, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Malcolm Webster', 48, 'F', '2025-05-19', 'Hyderabad', 'Mumbai', 'D4', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Rogelio Brandt', 43, 'M', '2025-03-30', 'Kolkata', 'Chennai', 'S8', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Malcolm Jackson', 21, 'F', '2025-12-30', 'Bangalore', 'Jaipur', 'D2', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Benjamin Townsend', 96, 'M', '2025-10-12', 'Agra', 'Hyderabad', 'D5', 46, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Benjamin Townsend', 89, 'F', '2024-06-10', 'Hyderabad', 'Jaipur', 'C3', 57, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Rogelio Jackson', 62, 'F', '2025-09-24', 'Jaipur', 'Bangalore', 'C5', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Benjamin Finch', 66, 'M', '2025-10-21', 'Jaipur', 'Jaipur', 'D3', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Malcolm Walters', 55, 'F', '2025-09-26', 'Kolkata', 'Bangalore', 'A3', 44, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Dina Love', 112, 'M', '2025-06-13', 'Mumbai', 'Jaipur', 'D3', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Kelley Love', 18, 'M', '2024-04-05', 'Chennai', 'Delhi', 'S3', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Benjamin Giles', 14, 'M', '2024-12-24', 'Jaipur', 'Delhi', 'B2', 31, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Rogelio Brandt', 28, 'F', '2024-01-16', 'Mumbai', 'Bangalore', 'S7', 28, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Kelley Webster', 18, 'M', '2024-03-25', 'Bangalore', 'Jaipur', 'S8', 7, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Linda Walters', 56, 'F', '2025-11-18', 'Agra', 'Agra', 'S3', 9, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Linda Brandt', 34, 'M', '2024-09-23', 'Delhi', 'Kolkata', 'B1', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Benjamin Walters', 116, 'F', '2024-08-20', 'Kolkata', 'Hyderabad', 'C5', 54, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Malcolm Webster', 113, 'F', '2024-09-10', 'Delhi', 'Chennai', 'S7', 56, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Benjamin Jackson', 51, 'F', '2024-05-02', 'Delhi', 'Chennai', 'B3', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Kelley Delgado', 27, 'F', '2024-11-08', 'Jaipur', 'Delhi', 'C2', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Erika Walters', 22, 'M', '2024-02-26', 'Chennai', 'Bangalore', 'D2', 32, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Terrance Giles', 4, 'M', '2025-04-20', 'Mumbai', 'Bangalore', 'D4', 26, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Kelley Dixon', 91, 'F', '2024-05-11', 'Agra', 'Agra', 'S1', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Shannon Brandt', 8, 'M', '2024-12-20', 'Mumbai', 'Bangalore', 'A4', 75, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Rogelio Jackson', 25, 'M', '2025-02-26', 'Chennai', 'Delhi', 'C4', 60, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Linda Finch', 68, 'F', '2025-05-13', 'Delhi', 'Delhi', 'B4', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Malcolm Love', 104, 'M', '2025-01-22', 'Jaipur', 'Kolkata', 'B3', 73, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Benjamin Brandt', 87, 'M', '2024-11-16', 'Bangalore', 'Hyderabad', 'S2', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Shannon Webster', 15, 'M', '2024-10-16', 'Jaipur', 'Jaipur', 'D1', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Samantha Townsend', 21, 'M', '2024-06-10', 'Kolkata', 'Delhi', 'S3', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Terrance Jackson', 38, 'M', '2025-08-22', 'Kolkata', 'Bangalore', 'D5', 65, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Malcolm Webster', 119, 'M', '2024-01-22', 'Delhi', 'Delhi', 'S4', 65, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Malcolm Walters', 108, 'M', '2025-12-28', 'Chennai', 'Jaipur', 'A3', 49, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Kelley Webster', 113, 'M', '2024-08-27', 'Jaipur', 'Chennai', 'B5', 73, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Linda Delgado', 113, 'F', '2025-08-21', 'Jaipur', 'Bangalore', 'S5', 36, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Terrance Finch', 20, 'F', '2024-06-12', 'Mumbai', 'Delhi', 'B1', 45, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Benjamin Webster', 101, 'F', '2024-06-13', 'Hyderabad', 'Hyderabad', 'B4', 52, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Malcolm Jackson', 83, 'F', '2025-03-16', 'Bangalore', 'Kolkata', 'B5', 75, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Erika Walters', 28, 'F', '2025-11-18', 'Chennai', 'Bangalore', 'D2', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Rogelio Walters', 44, 'M', '2024-02-28', 'Hyderabad', 'Agra', 'A3', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Benjamin Love', 13, 'F', '2024-04-03', 'Hyderabad', 'Chennai', 'B4', 12, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Benjamin Giles', 95, 'F', '2024-03-29', 'Chennai', 'Delhi', 'C2', 8, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Terrance Brandt', 46, 'F', '2024-10-22', 'Agra', 'Chennai', 'A4', 74, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Rogelio Walters', 68, 'F', '2024-01-02', 'Mumbai', 'Delhi', 'C3', 19, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Terrance Finch', 20, 'F', '2025-12-26', 'Hyderabad', 'Mumbai', 'S3', 55, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Kelley Dixon', 108, 'M', '2024-04-15', 'Delhi', 'Chennai', 'B4', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Samantha Walters', 98, 'F', '2024-07-19', 'Kolkata', 'Jaipur', 'A5', 47, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Erika Dixon', 56, 'F', '2025-11-05', 'Delhi', 'Chennai', 'S2', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Samantha Delgado', 91, 'F', '2024-08-02', 'Delhi', 'Bangalore', 'S8', 69, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Malcolm Brandt', 47, 'M', '2025-06-25', 'Delhi', 'Mumbai', 'S9', 54, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Samantha Jackson', 13, 'M', '2024-08-29', 'Chennai', 'Jaipur', 'A5', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Samantha Jackson', 9, 'M', '2024-09-23', 'Chennai', 'Chennai', 'S5', 31, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Erika Giles', 96, 'F', '2025-04-03', 'Chennai', 'Chennai', 'D4', 55, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Erika Townsend', 58, 'M', '2025-09-26', 'Jaipur', 'Agra', 'D2', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Rogelio Love', 95, 'M', '2024-02-23', 'Hyderabad', 'Kolkata', 'A5', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Erika Webster', 26, 'F', '2025-06-01', 'Bangalore', 'Jaipur', 'C3', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Dina Dixon', 17, 'F', '2025-05-26', 'Chennai', 'Jaipur', 'S8', 67, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Malcolm Townsend', 54, 'F', '2025-10-21', 'Agra', 'Agra', 'D4', 30, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Dina Love', 94, 'M', '2025-10-26', 'Agra', 'Hyderabad', 'C3', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Samantha Love', 58, 'F', '2024-02-20', 'Chennai', 'Delhi', 'A5', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Benjamin Dixon', 17, 'M', '2024-08-02', 'Bangalore', 'Delhi', 'D1', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Terrance Jackson', 16, 'F', '2024-07-13', 'Bangalore', 'Jaipur', 'D1', 53, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Erika Walters', 54, 'F', '2024-09-27', 'Bangalore', 'Mumbai', 'A1', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Shannon Delgado', 84, 'F', '2025-03-02', 'Jaipur', 'Chennai', 'D3', 66, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Linda Walters', 91, 'F', '2025-12-19', 'Hyderabad', 'Hyderabad', 'S4', 45, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Shannon Jackson', 9, 'M', '2024-10-08', 'Jaipur', 'Kolkata', 'D1', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Rogelio Brandt', 99, 'M', '2025-06-16', 'Mumbai', 'Jaipur', 'D2', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Samantha Delgado', 79, 'M', '2024-08-18', 'Delhi', 'Mumbai', 'D2', 26, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Terrance Love', 67, 'F', '2024-11-08', 'Delhi', 'Kolkata', 'S10', 2, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Rogelio Love', 88, 'F', '2025-07-16', 'Kolkata', 'Agra', 'S5', 6, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Malcolm Townsend', 110, 'M', '2024-04-14', 'Hyderabad', 'Bangalore', 'S4', 27, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Malcolm Brandt', 79, 'F', '2025-01-13', 'Agra', 'Mumbai', 'C4', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Malcolm Finch', 67, 'M', '2025-02-12', 'Delhi', 'Delhi', 'C1', 4, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Malcolm Jackson', 66, 'M', '2025-01-27', 'Agra', 'Hyderabad', 'B4', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Rogelio Delgado', 70, 'M', '2025-08-20', 'Chennai', 'Kolkata', 'S3', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Kelley Delgado', 10, 'F', '2025-02-17', 'Jaipur', 'Mumbai', 'S6', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Shannon Webster', 73, 'M', '2025-10-25', 'Jaipur', 'Kolkata', 'C1', 72, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Erika Dixon', 57, 'M', '2024-11-20', 'Bangalore', 'Chennai', 'A5', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Terrance Giles', 35, 'M', '2024-05-17', 'Delhi', 'Bangalore', 'S4', 52, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Rogelio Townsend', 25, 'M', '2025-04-16', 'Hyderabad', 'Bangalore', 'S8', 5, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Shannon Dixon', 38, 'M', '2025-02-23', 'Kolkata', 'Delhi', 'A5', 4, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Erika Giles', 20, 'F', '2024-10-01', 'Jaipur', 'Mumbai', 'S8', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Samantha Dixon', 46, 'F', '2024-03-24', 'Mumbai', 'Kolkata', 'D4', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Erika Brandt', 35, 'F', '2024-05-20', 'Kolkata', 'Bangalore', 'S6', 29, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Rogelio Webster', 51, 'M', '2024-07-03', 'Jaipur', 'Hyderabad', 'S4', 27, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Erika Walters', 79, 'F', '2024-03-05', 'Kolkata', 'Agra', 'C4', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Rogelio Jackson', 118, 'M', '2024-05-13', 'Chennai', 'Jaipur', 'S6', 13, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Dina Webster', 41, 'M', '2025-09-08', 'Kolkata', 'Jaipur', 'S9', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Benjamin Finch', 119, 'F', '2024-01-26', 'Chennai', 'Agra', 'S6', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Benjamin Walters', 34, 'F', '2025-01-29', 'Kolkata', 'Kolkata', 'A2', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Erika Webster', 57, 'M', '2025-08-26', 'Kolkata', 'Mumbai', 'S10', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Linda Walters', 95, 'M', '2024-02-09', 'Chennai', 'Chennai', 'D3', 28, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Dina Finch', 28, 'M', '2025-04-22', 'Agra', 'Chennai', 'C2', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Benjamin Love', 86, 'M', '2024-04-02', 'Hyderabad', 'Jaipur', 'S7', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Kelley Delgado', 15, 'F', '2024-11-01', 'Chennai', 'Kolkata', 'A3', 70, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Rogelio Dixon', 28, 'F', '2024-04-08', 'Chennai', 'Bangalore', 'S10', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Malcolm Walters', 35, 'F', '2025-12-23', 'Kolkata', 'Jaipur', 'D5', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Benjamin Brandt', 91, 'F', '2025-05-05', 'Kolkata', 'Mumbai', 'A4', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Shannon Giles', 38, 'F', '2025-12-24', 'Mumbai', 'Delhi', 'S8', 56, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Linda Giles', 76, 'M', '2025-11-16', 'Hyderabad', 'Jaipur', 'S2', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Samantha Finch', 74, 'M', '2025-03-06', 'Kolkata', 'Mumbai', 'S4', 69, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Benjamin Townsend', 80, 'M', '2024-12-13', 'Chennai', 'Mumbai', 'C5', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Terrance Townsend', 2, 'F', '2025-01-08', 'Kolkata', 'Agra', 'A3', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Malcolm Delgado', 34, 'F', '2025-12-26', 'Kolkata', 'Bangalore', 'B3', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Samantha Jackson', 58, 'F', '2025-07-17', 'Jaipur', 'Hyderabad', 'C3', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Kelley Webster', 79, 'F', '2025-05-22', 'Delhi', 'Kolkata', 'B3', 18, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Linda Delgado', 62, 'M', '2025-12-06', 'Chennai', 'Mumbai', 'S10', 42, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Benjamin Love', 31, 'F', '2024-08-12', 'Agra', 'Kolkata', 'B2', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Samantha Finch', 19, 'M', '2025-08-05', 'Agra', 'Delhi', 'S1', 50, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Malcolm Townsend', 36, 'M', '2025-01-13', 'Bangalore', 'Bangalore', 'S10', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Dina Townsend', 47, 'M', '2024-07-20', 'Bangalore', 'Mumbai', 'A4', 41, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Samantha Walters', 85, 'M', '2024-04-25', 'Hyderabad', 'Kolkata', 'S4', 45, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Rogelio Giles', 12, 'M', '2024-09-21', 'Agra', 'Hyderabad', 'B3', 57, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Rogelio Townsend', 111, 'M', '2025-10-09', 'Kolkata', 'Mumbai', 'D2', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Dina Townsend', 63, 'M', '2025-04-16', 'Bangalore', 'Bangalore', 'C1', 63, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Terrance Delgado', 10, 'M', '2024-05-29', 'Mumbai', 'Kolkata', 'D5', 57, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Shannon Delgado', 43, 'M', '2024-12-03', 'Mumbai', 'Jaipur', 'B3', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Rogelio Delgado', 1, 'F', '2024-10-06', 'Kolkata', 'Chennai', 'D3', 7, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Rogelio Finch', 111, 'M', '2024-02-03', 'Agra', 'Mumbai', 'D4', 12, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Samantha Townsend', 12, 'F', '2024-03-04', 'Agra', 'Kolkata', 'A2', 42, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Erika Jackson', 19, 'M', '2025-11-15', 'Kolkata', 'Bangalore', 'S2', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Samantha Webster', 64, 'F', '2024-06-01', 'Delhi', 'Chennai', 'D4', 32, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Linda Giles', 115, 'M', '2024-06-30', 'Hyderabad', 'Jaipur', 'C4', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Erika Dixon', 39, 'M', '2025-03-27', 'Jaipur', 'Agra', 'S6', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Shannon Giles', 87, 'F', '2024-12-29', 'Agra', 'Delhi', 'S1', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Linda Giles', 120, 'F', '2024-03-06', 'Jaipur', 'Jaipur', 'B5', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Samantha Dixon', 114, 'F', '2025-03-08', 'Chennai', 'Agra', 'A2', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Malcolm Giles', 58, 'F', '2024-02-10', 'Chennai', 'Mumbai', 'B1', 29, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Malcolm Jackson', 103, 'M', '2025-09-24', 'Mumbai', 'Agra', 'S9', 45, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Benjamin Walters', 97, 'M', '2024-06-29', 'Kolkata', 'Hyderabad', 'C3', 23, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Benjamin Giles', 118, 'M', '2025-12-10', 'Hyderabad', 'Kolkata', 'C5', 45, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Malcolm Love', 20, 'M', '2025-08-31', 'Chennai', 'Mumbai', 'S6', 8, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Benjamin Webster', 114, 'F', '2025-11-21', 'Chennai', 'Bangalore', 'B5', 72, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Malcolm Webster', 65, 'M', '2025-06-13', 'Chennai', 'Delhi', 'S8', 71, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Shannon Finch', 106, 'M', '2025-05-11', 'Mumbai', 'Agra', 'C4', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Samantha Delgado', 49, 'M', '2025-05-05', 'Delhi', 'Delhi', 'A1', 72, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Erika Giles', 49, 'M', '2024-03-26', 'Kolkata', 'Kolkata', 'B4', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Linda Finch', 62, 'M', '2025-06-25', 'Jaipur', 'Kolkata', 'C4', 37, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Linda Townsend', 47, 'M', '2024-06-05', 'Kolkata', 'Agra', 'D2', 29, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Terrance Brandt', 37, 'M', '2024-12-14', 'Chennai', 'Mumbai', 'A2', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Erika Love', 69, 'M', '2024-02-23', 'Delhi', 'Agra', 'C1', 74, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Linda Finch', 72, 'M', '2024-05-10', 'Jaipur', 'Delhi', 'S8', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Linda Townsend', 57, 'M', '2025-02-08', 'Kolkata', 'Kolkata', 'S10', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Samantha Brandt', 33, 'M', '2025-01-14', 'Kolkata', 'Mumbai', 'C4', 65, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Linda Townsend', 119, 'M', '2024-01-18', 'Agra', 'Bangalore', 'D1', 11, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Samantha Dixon', 111, 'M', '2025-11-14', 'Kolkata', 'Bangalore', 'B1', 45, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Shannon Love', 3, 'F', '2025-06-27', 'Mumbai', 'Chennai', 'C2', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Terrance Brandt', 72, 'F', '2024-11-04', 'Jaipur', 'Jaipur', 'A1', 29, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Rogelio Finch', 108, 'M', '2024-08-03', 'Mumbai', 'Jaipur', 'C5', 64, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Dina Love', 15, 'M', '2025-04-05', 'Bangalore', 'Delhi', 'D4', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Terrance Finch', 14, 'M', '2025-08-28', 'Agra', 'Hyderabad', 'S1', 73, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Dina Brandt', 18, 'M', '2024-10-16', 'Chennai', 'Kolkata', 'C5', 44, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Benjamin Giles', 53, 'M', '2024-12-12', 'Kolkata', 'Mumbai', 'A4', 16, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Erika Walters', 46, 'F', '2024-08-06', 'Agra', 'Hyderabad', 'B5', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Terrance Townsend', 62, 'F', '2025-07-11', 'Hyderabad', 'Hyderabad', 'D2', 25, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Rogelio Jackson', 48, 'M', '2024-06-16', 'Hyderabad', 'Kolkata', 'D1', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Linda Brandt', 106, 'F', '2025-03-01', 'Kolkata', 'Delhi', 'C3', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Erika Walters', 102, 'F', '2024-10-28', 'Kolkata', 'Delhi', 'B3', 55, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Erika Jackson', 70, 'F', '2024-08-06', 'Mumbai', 'Kolkata', 'S5', 66, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Linda Townsend', 11, 'F', '2025-03-23', 'Kolkata', 'Mumbai', 'C1', 52, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Kelley Love', 64, 'M', '2025-01-26', 'Agra', 'Kolkata', 'D2', 6, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Dina Finch', 85, 'M', '2025-03-12', 'Chennai', 'Kolkata', 'S5', 43, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Samantha Brandt', 20, 'M', '2024-06-25', 'Agra', 'Jaipur', 'B4', 65, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Erika Jackson', 99, 'F', '2024-09-14', 'Mumbai', 'Chennai', 'D3', 40, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Benjamin Love', 90, 'M', '2024-10-14', 'Mumbai', 'Hyderabad', 'S6', 8, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Shannon Giles', 114, 'M', '2025-08-21', 'Hyderabad', 'Chennai', 'D3', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Linda Delgado', 78, 'M', '2024-09-26', 'Delhi', 'Agra', 'D3', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Erika Brandt', 65, 'F', '2024-06-06', 'Hyderabad', 'Kolkata', 'B1', 36, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Kelley Giles', 13, 'M', '2025-05-29', 'Hyderabad', 'Agra', 'C1', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Linda Delgado', 25, 'M', '2024-11-17', 'Chennai', 'Bangalore', 'B3', 45, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Samantha Jackson', 17, 'F', '2025-06-13', 'Bangalore', 'Bangalore', 'A1', 69, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Erika Brandt', 61, 'F', '2025-11-01', 'Mumbai', 'Agra', 'C2', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Dina Brandt', 46, 'F', '2025-11-23', 'Jaipur', 'Jaipur', 'S9', 71, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Erika Walters', 79, 'F', '2024-04-06', 'Kolkata', 'Bangalore', 'B5', 63, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Erika Jackson', 47, 'F', '2024-10-26', 'Delhi', 'Bangalore', 'A1', 61, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Kelley Walters', 68, 'F', '2024-06-19', 'Kolkata', 'Mumbai', 'B4', 70, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Kelley Finch', 91, 'M', '2024-01-18', 'Kolkata', 'Delhi', 'A4', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Malcolm Love', 67, 'F', '2025-02-26', 'Jaipur', 'Bangalore', 'D2', 15, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Terrance Giles', 1, 'M', '2024-10-19', 'Jaipur', 'Jaipur', 'S5', 73, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Samantha Townsend', 2, 'M', '2025-12-20', 'Mumbai', 'Delhi', 'C2', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Samantha Finch', 120, 'F', '2024-04-04', 'Agra', 'Bangalore', 'C4', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Erika Finch', 26, 'F', '2024-01-05', 'Agra', 'Mumbai', 'D3', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Rogelio Jackson', 64, 'M', '2024-04-16', 'Agra', 'Agra', 'S1', 17, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Erika Walters', 107, 'F', '2025-09-08', 'Bangalore', 'Kolkata', 'A3', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Benjamin Brandt', 65, 'M', '2024-06-24', 'Chennai', 'Delhi', 'C3', 56, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Dina Giles', 29, 'F', '2025-01-14', 'Jaipur', 'Jaipur', 'A3', 23, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Terrance Jackson', 43, 'M', '2025-04-08', 'Bangalore', 'Jaipur', 'A3', 25, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Erika Townsend', 102, 'M', '2024-10-22', 'Mumbai', 'Chennai', 'D3', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Erika Walters', 48, 'F', '2024-04-16', 'Agra', 'Agra', 'S5', 25, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Benjamin Brandt', 38, 'F', '2025-10-25', 'Delhi', 'Hyderabad', 'S2', 65, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Benjamin Delgado', 3, 'M', '2024-12-31', 'Chennai', 'Agra', 'C4', 5, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Terrance Jackson', 36, 'F', '2024-10-29', 'Hyderabad', 'Hyderabad', 'A1', 46, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Kelley Dixon', 88, 'F', '2024-02-15', 'Delhi', 'Kolkata', 'B4', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Malcolm Finch', 3, 'F', '2025-12-22', 'Agra', 'Chennai', 'S3', 53, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Rogelio Brandt', 105, 'F', '2024-10-21', 'Chennai', 'Agra', 'C4', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Kelley Walters', 77, 'M', '2024-05-18', 'Agra', 'Bangalore', 'D4', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Linda Giles', 10, 'M', '2025-11-20', 'Agra', 'Jaipur', 'D2', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Benjamin Webster', 32, 'M', '2025-11-08', 'Chennai', 'Hyderabad', 'S2', 19, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Linda Delgado', 74, 'M', '2024-10-22', 'Bangalore', 'Mumbai', 'D5', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Rogelio Townsend', 57, 'M', '2024-11-10', 'Mumbai', 'Delhi', 'C5', 26, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Benjamin Love', 19, 'F', '2025-05-03', 'Jaipur', 'Chennai', 'A1', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Benjamin Dixon', 9, 'M', '2025-12-04', 'Hyderabad', 'Bangalore', 'S3', 22, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Benjamin Finch', 95, 'F', '2025-11-30', 'Chennai', 'Agra', 'B1', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Linda Brandt', 73, 'F', '2025-09-20', 'Kolkata', 'Delhi', 'S1', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Kelley Dixon', 56, 'M', '2024-03-05', 'Hyderabad', 'Kolkata', 'C1', 72, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Shannon Finch', 79, 'F', '2024-08-28', 'Hyderabad', 'Jaipur', 'S4', 9, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Benjamin Walters', 9, 'M', '2025-02-22', 'Mumbai', 'Delhi', 'D4', 23, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Kelley Love', 8, 'M', '2024-08-06', 'Kolkata', 'Hyderabad', 'C1', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Rogelio Brandt', 98, 'M', '2025-05-11', 'Bangalore', 'Kolkata', 'S10', 24, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Linda Dixon', 102, 'F', '2025-08-06', 'Delhi', 'Kolkata', 'B2', 73, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Kelley Jackson', 73, 'F', '2025-08-30', 'Hyderabad', 'Mumbai', 'C2', 53, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Rogelio Webster', 63, 'F', '2024-01-14', 'Hyderabad', 'Chennai', 'D2', 73, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Samantha Finch', 97, 'M', '2025-07-07', 'Bangalore', 'Kolkata', 'D3', 52, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Malcolm Giles', 28, 'F', '2025-02-17', 'Chennai', 'Chennai', 'A1', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Rogelio Jackson', 83, 'M', '2024-11-25', 'Jaipur', 'Kolkata', 'S9', 7, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Benjamin Giles', 115, 'F', '2024-03-19', 'Agra', 'Chennai', 'S2', 41, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Linda Giles', 37, 'F', '2024-02-02', 'Mumbai', 'Mumbai', 'S9', 50, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Linda Love', 116, 'F', '2024-08-04', 'Jaipur', 'Mumbai', 'B2', 53, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Malcolm Brandt', 112, 'F', '2024-04-04', 'Delhi', 'Bangalore', 'A1', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Erika Delgado', 95, 'M', '2025-03-28', 'Bangalore', 'Agra', 'C3', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Shannon Delgado', 5, 'M', '2025-02-04', 'Jaipur', 'Jaipur', 'S4', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Rogelio Finch', 107, 'F', '2025-08-03', 'Chennai', 'Hyderabad', 'C1', 5, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Benjamin Giles', 59, 'F', '2025-05-24', 'Hyderabad', 'Mumbai', 'S9', 3, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Erika Dixon', 112, 'M', '2024-03-08', 'Jaipur', 'Kolkata', 'C3', 31, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Erika Delgado', 117, 'F', '2024-11-25', 'Hyderabad', 'Agra', 'C5', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Linda Finch', 76, 'F', '2024-04-03', 'Hyderabad', 'Agra', 'A4', 50, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Erika Walters', 5, 'M', '2025-12-20', 'Chennai', 'Jaipur', 'B3', 73, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Terrance Walters', 27, 'M', '2025-02-06', 'Bangalore', 'Kolkata', 'C4', 50, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Linda Webster', 29, 'F', '2025-01-13', 'Chennai', 'Delhi', 'A1', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Kelley Townsend', 41, 'F', '2025-12-25', 'Kolkata', 'Jaipur', 'D4', 49, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Linda Love', 92, 'M', '2025-03-30', 'Delhi', 'Delhi', 'D1', 63, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Linda Finch', 33, 'M', '2025-03-23', 'Agra', 'Mumbai', 'S10', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Erika Brandt', 71, 'F', '2024-05-09', 'Jaipur', 'Agra', 'S7', 62, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Shannon Love', 50, 'M', '2025-02-11', 'Chennai', 'Chennai', 'A1', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Linda Dixon', 114, 'F', '2025-04-01', 'Bangalore', 'Hyderabad', 'A5', 7, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Dina Jackson', 78, 'M', '2024-10-04', 'Delhi', 'Jaipur', 'C4', 57, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Terrance Giles', 68, 'M', '2024-07-13', 'Hyderabad', 'Hyderabad', 'A1', 32, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Dina Jackson', 79, 'F', '2024-09-17', 'Jaipur', 'Kolkata', 'C1', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Erika Jackson', 116, 'F', '2025-12-09', 'Agra', 'Delhi', 'A3', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Kelley Walters', 22, 'M', '2024-12-22', 'Bangalore', 'Chennai', 'B2', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Shannon Giles', 85, 'F', '2025-09-07', 'Jaipur', 'Kolkata', 'S4', 75, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Samantha Townsend', 88, 'F', '2025-05-09', 'Hyderabad', 'Kolkata', 'A1', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Kelley Finch', 4, 'M', '2025-07-06', 'Delhi', 'Mumbai', 'S1', 70, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Rogelio Delgado', 85, 'M', '2024-06-21', 'Kolkata', 'Kolkata', 'S8', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Samantha Townsend', 70, 'M', '2025-11-28', 'Bangalore', 'Bangalore', 'B4', 18, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Kelley Delgado', 37, 'F', '2024-07-26', 'Hyderabad', 'Mumbai', 'S8', 27, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Erika Giles', 8, 'M', '2024-03-10', 'Bangalore', 'Agra', 'S9', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Terrance Townsend', 103, 'M', '2025-09-08', 'Chennai', 'Chennai', 'B2', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Terrance Dixon', 16, 'M', '2024-10-31', 'Bangalore', 'Bangalore', 'D2', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Erika Giles', 99, 'M', '2025-07-25', 'Agra', 'Chennai', 'A1', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Benjamin Finch', 37, 'F', '2025-08-10', 'Hyderabad', 'Chennai', 'S8', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Kelley Giles', 105, 'F', '2024-07-19', 'Delhi', 'Agra', 'A1', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Samantha Jackson', 35, 'M', '2025-10-23', 'Delhi', 'Agra', 'C4', 18, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Shannon Townsend', 52, 'M', '2024-07-26', 'Chennai', 'Chennai', 'C2', 4, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Samantha Jackson', 44, 'M', '2024-06-12', 'Mumbai', 'Chennai', 'B3', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Malcolm Brandt', 64, 'F', '2024-10-07', 'Hyderabad', 'Bangalore', 'B1', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Kelley Love', 81, 'F', '2025-12-10', 'Bangalore', 'Mumbai', 'S10', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Shannon Webster', 104, 'F', '2025-01-03', 'Chennai', 'Chennai', 'D4', 5, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Linda Dixon', 58, 'F', '2024-06-17', 'Mumbai', 'Delhi', 'A1', 42, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Shannon Giles', 87, 'M', '2025-05-20', 'Bangalore', 'Chennai', 'A4', 8, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Shannon Finch', 65, 'F', '2025-10-13', 'Hyderabad', 'Bangalore', 'B5', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Linda Townsend', 40, 'F', '2024-05-11', 'Agra', 'Kolkata', 'A1', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Dina Townsend', 2, 'M', '2025-01-13', 'Jaipur', 'Hyderabad', 'C2', 22, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Shannon Delgado', 45, 'F', '2025-04-04', 'Delhi', 'Jaipur', 'C5', 53, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Linda Finch', 28, 'F', '2025-02-02', 'Chennai', 'Bangalore', 'D1', 25, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Erika Walters', 38, 'M', '2025-03-12', 'Delhi', 'Hyderabad', 'B5', 72, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Rogelio Delgado', 107, 'M', '2024-10-20', 'Chennai', 'Jaipur', 'D5', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Kelley Dixon', 18, 'F', '2025-07-08', 'Jaipur', 'Agra', 'S2', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Kelley Delgado', 115, 'F', '2024-08-14', 'Jaipur', 'Kolkata', 'C3', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Dina Love', 40, 'F', '2024-09-09', 'Chennai', 'Kolkata', 'B3', 57, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Linda Finch', 3, 'F', '2024-04-10', 'Bangalore', 'Jaipur', 'B5', 12, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Samantha Giles', 49, 'M', '2025-08-03', 'Bangalore', 'Bangalore', 'B1', 70, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Samantha Finch', 109, 'M', '2024-09-05', 'Agra', 'Delhi', 'S5', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Terrance Webster', 46, 'M', '2025-04-26', 'Jaipur', 'Jaipur', 'C3', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Dina Giles', 30, 'F', '2025-07-09', 'Chennai', 'Mumbai', 'B3', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Rogelio Giles', 103, 'M', '2024-09-13', 'Mumbai', 'Bangalore', 'B2', 20, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Shannon Webster', 39, 'M', '2025-01-11', 'Hyderabad', 'Chennai', 'D5', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Malcolm Dixon', 104, 'F', '2024-05-26', 'Delhi', 'Mumbai', 'C1', 45, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Kelley Webster', 7, 'F', '2025-06-28', 'Kolkata', 'Bangalore', 'A2', 26, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Malcolm Jackson', 25, 'F', '2024-07-04', 'Agra', 'Kolkata', 'S8', 62, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Kelley Townsend', 74, 'F', '2024-09-02', 'Kolkata', 'Jaipur', 'B5', 61, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Linda Giles', 2, 'F', '2025-04-28', 'Mumbai', 'Agra', 'A3', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Benjamin Love', 56, 'F', '2024-07-15', 'Bangalore', 'Hyderabad', 'S5', 12, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Kelley Finch', 19, 'F', '2025-07-05', 'Hyderabad', 'Mumbai', 'S6', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Kelley Walters', 39, 'F', '2025-04-28', 'Hyderabad', 'Hyderabad', 'C3', 61, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Erika Love', 81, 'F', '2024-10-26', 'Agra', 'Agra', 'A4', 37, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Rogelio Dixon', 36, 'M', '2024-11-30', 'Jaipur', 'Hyderabad', 'B3', 54, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Terrance Giles', 108, 'M', '2025-10-06', 'Chennai', 'Agra', 'D4', 45, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Dina Delgado', 73, 'M', '2025-04-16', 'Chennai', 'Bangalore', 'B4', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Rogelio Townsend', 102, 'F', '2024-12-06', 'Jaipur', 'Kolkata', 'C4', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Dina Townsend', 73, 'F', '2024-09-10', 'Jaipur', 'Agra', 'S6', 32, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Shannon Dixon', 111, 'M', '2024-02-28', 'Kolkata', 'Delhi', 'D5', 27, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Malcolm Delgado', 13, 'F', '2024-09-09', 'Jaipur', 'Jaipur', 'S2', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Rogelio Dixon', 11, 'F', '2024-07-06', 'Kolkata', 'Jaipur', 'B2', 47, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Samantha Webster', 19, 'F', '2024-10-04', 'Hyderabad', 'Hyderabad', 'S7', 29, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Rogelio Brandt', 25, 'F', '2024-07-26', 'Kolkata', 'Mumbai', 'B1', 65, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Dina Love', 112, 'M', '2025-01-28', 'Agra', 'Hyderabad', 'C2', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Malcolm Love', 90, 'F', '2025-03-18', 'Jaipur', 'Delhi', 'D4', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Dina Delgado', 51, 'M', '2024-06-18', 'Chennai', 'Agra', 'B2', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Dina Jackson', 79, 'F', '2025-10-28', 'Hyderabad', 'Hyderabad', 'S6', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Shannon Love', 10, 'M', '2024-08-27', 'Jaipur', 'Hyderabad', 'A4', 47, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Terrance Finch', 49, 'M', '2024-10-20', 'Mumbai', 'Bangalore', 'A1', 42, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Terrance Delgado', 25, 'F', '2024-06-21', 'Chennai', 'Chennai', 'A4', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Dina Finch', 44, 'F', '2025-10-05', 'Kolkata', 'Bangalore', 'D4', 63, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Rogelio Love', 116, 'M', '2024-09-03', 'Chennai', 'Kolkata', 'B1', 25, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Samantha Jackson', 3, 'F', '2025-05-18', 'Delhi', 'Chennai', 'A2', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Linda Giles', 20, 'M', '2024-04-23', 'Hyderabad', 'Delhi', 'S1', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Shannon Dixon', 13, 'F', '2025-12-26', 'Mumbai', 'Agra', 'D5', 40, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Erika Webster', 119, 'F', '2025-06-20', 'Delhi', 'Mumbai', 'B2', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Samantha Walters', 30, 'F', '2025-05-11', 'Jaipur', 'Kolkata', 'C4', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Terrance Townsend', 68, 'M', '2025-07-30', 'Chennai', 'Delhi', 'D2', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Terrance Brandt', 20, 'F', '2024-02-05', 'Delhi', 'Kolkata', 'S5', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Samantha Love', 118, 'M', '2025-01-19', 'Delhi', 'Hyderabad', 'D4', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Rogelio Webster', 71, 'F', '2025-12-06', 'Agra', 'Mumbai', 'C1', 7, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Rogelio Giles', 91, 'M', '2024-04-16', 'Agra', 'Agra', 'S8', 65, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Terrance Jackson', 22, 'F', '2024-05-21', 'Bangalore', 'Kolkata', 'S7', 34, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Terrance Finch', 17, 'F', '2024-08-05', 'Chennai', 'Agra', 'S3', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Malcolm Walters', 9, 'M', '2024-06-24', 'Mumbai', 'Hyderabad', 'B4', 41, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Dina Walters', 90, 'M', '2025-04-03', 'Bangalore', 'Bangalore', 'S3', 24, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Dina Walters', 87, 'M', '2025-06-14', 'Jaipur', 'Jaipur', 'A4', 8, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Shannon Jackson', 36, 'F', '2024-04-23', 'Jaipur', 'Jaipur', 'D1', 17, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Linda Jackson', 99, 'M', '2025-07-18', 'Bangalore', 'Hyderabad', 'A3', 5, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Erika Finch', 67, 'F', '2024-06-18', 'Agra', 'Jaipur', 'S9', 9, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Dina Love', 17, 'M', '2024-12-23', 'Jaipur', 'Bangalore', 'C3', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Kelley Dixon', 90, 'F', '2024-07-13', 'Jaipur', 'Agra', 'S5', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Rogelio Walters', 102, 'F', '2025-08-01', 'Jaipur', 'Jaipur', 'B4', 42, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Samantha Townsend', 83, 'M', '2024-11-06', 'Mumbai', 'Agra', 'A3', 62, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Malcolm Love', 90, 'M', '2025-12-10', 'Hyderabad', 'Chennai', 'B4', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Terrance Walters', 43, 'M', '2025-02-09', 'Chennai', 'Bangalore', 'D3', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Shannon Love', 34, 'F', '2024-05-04', 'Mumbai', 'Mumbai', 'B1', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Samantha Webster', 67, 'M', '2024-07-11', 'Bangalore', 'Mumbai', 'C2', 25, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Kelley Giles', 91, 'M', '2025-06-13', 'Jaipur', 'Jaipur', 'B2', 66, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Kelley Brandt', 116, 'F', '2024-08-30', 'Agra', 'Delhi', 'S1', 71, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Dina Giles', 116, 'M', '2024-07-15', 'Hyderabad', 'Bangalore', 'S8', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Rogelio Love', 104, 'F', '2024-11-18', 'Kolkata', 'Mumbai', 'C3', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Benjamin Finch', 85, 'F', '2024-04-02', 'Kolkata', 'Agra', 'C4', 70, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Benjamin Webster', 48, 'F', '2025-09-04', 'Bangalore', 'Chennai', 'A5', 55, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Erika Brandt', 67, 'F', '2024-10-14', 'Mumbai', 'Hyderabad', 'S6', 56, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Benjamin Finch', 98, 'F', '2024-10-13', 'Agra', 'Agra', 'A3', 52, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Malcolm Townsend', 72, 'M', '2025-02-28', 'Kolkata', 'Bangalore', 'A5', 16, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Terrance Giles', 26, 'F', '2025-12-04', 'Delhi', 'Hyderabad', 'D1', 28, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Malcolm Giles', 37, 'F', '2024-08-11', 'Hyderabad', 'Agra', 'A2', 54, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Malcolm Love', 52, 'F', '2025-11-05', 'Bangalore', 'Agra', 'A4', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Linda Love', 98, 'F', '2024-04-29', 'Kolkata', 'Bangalore', 'C5', 72, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Samantha Brandt', 7, 'M', '2024-10-12', 'Jaipur', 'Kolkata', 'A1', 28, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Malcolm Love', 102, 'M', '2024-01-10', 'Jaipur', 'Kolkata', 'C2', 21, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Benjamin Love', 119, 'F', '2025-02-15', 'Kolkata', 'Delhi', 'B5', 4, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Linda Jackson', 83, 'F', '2025-10-22', 'Delhi', 'Hyderabad', 'B3', 35, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Malcolm Finch', 33, 'M', '2024-03-01', 'Jaipur', 'Jaipur', 'S6', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Dina Giles', 97, 'F', '2025-09-14', 'Kolkata', 'Delhi', 'A3', 52, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Dina Delgado', 103, 'F', '2024-07-04', 'Bangalore', 'Kolkata', 'S4', 31, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Benjamin Love', 114, 'F', '2024-04-30', 'Delhi', 'Hyderabad', 'A5', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Kelley Giles', 15, 'F', '2025-01-15', 'Mumbai', 'Delhi', 'S8', 54, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Erika Love', 10, 'F', '2025-10-12', 'Agra', 'Bangalore', 'D2', 11, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Kelley Delgado', 95, 'M', '2024-06-10', 'Kolkata', 'Delhi', 'B4', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Benjamin Finch', 117, 'F', '2025-02-07', 'Hyderabad', 'Jaipur', 'C5', 10, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Linda Delgado', 10, 'F', '2025-11-05', 'Jaipur', 'Agra', 'A4', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Samantha Finch', 93, 'M', '2025-04-17', 'Agra', 'Delhi', 'S10', 13, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Erika Webster', 114, 'F', '2024-05-30', 'Hyderabad', 'Jaipur', 'S7', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Benjamin Walters', 39, 'M', '2025-08-13', 'Delhi', 'Chennai', 'A5', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Malcolm Walters', 44, 'M', '2025-03-06', 'Mumbai', 'Delhi', 'C2', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Kelley Townsend', 89, 'F', '2025-05-15', 'Delhi', 'Bangalore', 'B4', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Dina Dixon', 53, 'M', '2025-02-02', 'Hyderabad', 'Kolkata', 'B5', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Dina Finch', 60, 'M', '2025-06-01', 'Kolkata', 'Chennai', 'S2', 43, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Shannon Love', 15, 'M', '2025-09-08', 'Chennai', 'Chennai', 'A3', 33, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Samantha Webster', 109, 'F', '2025-07-14', 'Bangalore', 'Hyderabad', 'S6', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Shannon Jackson', 67, 'F', '2025-11-02', 'Hyderabad', 'Agra', 'C5', 47, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Shannon Finch', 45, 'M', '2025-10-25', 'Hyderabad', 'Delhi', 'C2', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Shannon Love', 42, 'M', '2024-02-13', 'Chennai', 'Mumbai', 'B2', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Terrance Finch', 29, 'F', '2025-04-02', 'Delhi', 'Kolkata', 'B4', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Linda Giles', 91, 'M', '2024-04-16', 'Jaipur', 'Jaipur', 'S4', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Terrance Townsend', 27, 'M', '2025-06-14', 'Bangalore', 'Delhi', 'S1', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Dina Townsend', 87, 'M', '2025-09-17', 'Hyderabad', 'Delhi', 'S9', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Rogelio Townsend', 95, 'F', '2025-12-26', 'Kolkata', 'Bangalore', 'S8', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Malcolm Walters', 115, 'F', '2024-08-18', 'Jaipur', 'Bangalore', 'S1', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Malcolm Giles', 9, 'F', '2024-03-15', 'Mumbai', 'Hyderabad', 'C1', 54, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Linda Jackson', 62, 'F', '2024-04-30', 'Jaipur', 'Hyderabad', 'B4', 20, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Dina Love', 105, 'M', '2024-10-11', 'Agra', 'Agra', 'S10', 67, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Erika Finch', 102, 'F', '2025-09-27', 'Bangalore', 'Bangalore', 'D5', 41, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Shannon Brandt', 29, 'F', '2025-09-08', 'Delhi', 'Hyderabad', 'B3', 21, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Kelley Jackson', 1, 'F', '2024-09-11', 'Hyderabad', 'Delhi', 'S9', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Terrance Brandt', 82, 'M', '2025-11-13', 'Chennai', 'Mumbai', 'D1', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Erika Jackson', 99, 'M', '2025-06-09', 'Hyderabad', 'Chennai', 'A3', 41, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Dina Brandt', 16, 'M', '2025-12-28', 'Kolkata', 'Bangalore', 'A2', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Erika Webster', 74, 'F', '2024-09-13', 'Hyderabad', 'Kolkata', 'B4', 32, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Samantha Walters', 58, 'M', '2024-06-27', 'Mumbai', 'Hyderabad', 'C2', 36, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Terrance Delgado', 95, 'M', '2024-11-02', 'Chennai', 'Jaipur', 'C1', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Samantha Delgado', 33, 'F', '2024-08-22', 'Hyderabad', 'Jaipur', 'B3', 27, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Linda Townsend', 31, 'M', '2024-04-22', 'Chennai', 'Agra', 'S3', 46, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Samantha Brandt', 12, 'M', '2024-05-19', 'Kolkata', 'Jaipur', 'C5', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Malcolm Townsend', 109, 'M', '2025-05-22', 'Jaipur', 'Chennai', 'D2', 57, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Terrance Dixon', 4, 'M', '2024-12-22', 'Agra', 'Hyderabad', 'B5', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Rogelio Finch', 118, 'F', '2024-09-14', 'Bangalore', 'Mumbai', 'B4', 69, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Malcolm Finch', 81, 'F', '2025-12-09', 'Kolkata', 'Chennai', 'C1', 67, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Benjamin Dixon', 49, 'F', '2024-05-28', 'Kolkata', 'Mumbai', 'D3', 74, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Terrance Jackson', 109, 'F', '2025-09-14', 'Agra', 'Delhi', 'C3', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Linda Webster', 31, 'F', '2025-04-10', 'Jaipur', 'Jaipur', 'S10', 46, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Erika Brandt', 18, 'F', '2025-07-06', 'Jaipur', 'Chennai', 'B2', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Terrance Brandt', 49, 'F', '2024-01-14', 'Mumbai', 'Mumbai', 'A3', 34, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Erika Townsend', 87, 'M', '2025-06-19', 'Bangalore', 'Bangalore', 'S3', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Benjamin Jackson', 28, 'M', '2025-10-24', 'Hyderabad', 'Jaipur', 'S2', 55, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Benjamin Dixon', 90, 'M', '2024-10-04', 'Kolkata', 'Delhi', 'A1', 74, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Terrance Walters', 78, 'M', '2024-06-26', 'Agra', 'Bangalore', 'A1', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Benjamin Giles', 21, 'F', '2024-10-28', 'Delhi', 'Mumbai', 'C4', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Samantha Walters', 22, 'M', '2025-07-24', 'Chennai', 'Chennai', 'C3', 36, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Dina Love', 91, 'M', '2025-03-22', 'Agra', 'Delhi', 'A5', 65, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Rogelio Brandt', 79, 'M', '2025-04-17', 'Hyderabad', 'Hyderabad', 'B4', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Dina Webster', 22, 'M', '2025-07-15', 'Chennai', 'Agra', 'B2', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Dina Brandt', 69, 'F', '2025-08-12', 'Delhi', 'Chennai', 'A1', 75, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Linda Giles', 68, 'F', '2024-08-16', 'Kolkata', 'Chennai', 'S5', 5, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Benjamin Jackson', 98, 'M', '2025-08-09', 'Chennai', 'Delhi', 'D4', 4, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Samantha Townsend', 94, 'M', '2025-07-21', 'Bangalore', 'Jaipur', 'A3', 57, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Shannon Townsend', 104, 'M', '2024-07-04', 'Kolkata', 'Delhi', 'S6', 5, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Kelley Brandt', 109, 'M', '2025-04-15', 'Chennai', 'Kolkata', 'B1', 53, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Dina Finch', 110, 'F', '2025-03-24', 'Bangalore', 'Mumbai', 'B3', 8, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Linda Love', 78, 'M', '2024-07-29', 'Chennai', 'Delhi', 'B2', 73, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Dina Dixon', 58, 'F', '2025-05-24', 'Mumbai', 'Jaipur', 'A5', 28, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Malcolm Townsend', 36, 'F', '2024-07-10', 'Hyderabad', 'Hyderabad', 'B4', 72, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Dina Townsend', 16, 'F', '2024-04-13', 'Chennai', 'Mumbai', 'S8', 55, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Linda Jackson', 22, 'F', '2025-11-07', 'Bangalore', 'Jaipur', 'A4', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Malcolm Dixon', 90, 'F', '2025-10-13', 'Delhi', 'Bangalore', 'S4', 7, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Kelley Delgado', 4, 'M', '2025-09-13', 'Bangalore', 'Hyderabad', 'A5', 72, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Linda Jackson', 107, 'M', '2025-12-06', 'Mumbai', 'Chennai', 'A3', 28, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Linda Brandt', 102, 'F', '2024-06-29', 'Delhi', 'Kolkata', 'D3', 52, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Kelley Brandt', 24, 'F', '2024-12-05', 'Bangalore', 'Hyderabad', 'S9', 56, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Samantha Love', 56, 'F', '2025-07-15', 'Kolkata', 'Delhi', 'B1', 21, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Shannon Walters', 79, 'M', '2024-10-05', 'Delhi', 'Delhi', 'S2', 12, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Malcolm Webster', 50, 'M', '2025-08-22', 'Mumbai', 'Hyderabad', 'B1', 41, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Benjamin Finch', 25, 'M', '2025-10-18', 'Hyderabad', 'Hyderabad', 'A2', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Dina Love', 104, 'F', '2024-12-20', 'Chennai', 'Chennai', 'S9', 50, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Shannon Walters', 79, 'M', '2024-07-19', 'Agra', 'Kolkata', 'S5', 67, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Dina Jackson', 84, 'F', '2024-07-07', 'Jaipur', 'Bangalore', 'S4', 2, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Malcolm Dixon', 117, 'F', '2024-01-28', 'Jaipur', 'Hyderabad', 'S3', 72, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Malcolm Webster', 59, 'F', '2024-01-12', 'Delhi', 'Hyderabad', 'S7', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Samantha Love', 109, 'M', '2025-11-29', 'Bangalore', 'Kolkata', 'C4', 17, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Linda Townsend', 73, 'F', '2024-06-04', 'Kolkata', 'Delhi', 'S8', 7, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Samantha Dixon', 100, 'F', '2025-01-12', 'Mumbai', 'Delhi', 'S10', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Malcolm Dixon', 45, 'M', '2024-01-13', 'Delhi', 'Hyderabad', 'B3', 4, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Linda Dixon', 103, 'F', '2024-12-08', 'Agra', 'Chennai', 'C3', 75, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Linda Townsend', 113, 'F', '2024-10-12', 'Bangalore', 'Bangalore', 'A1', 41, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Rogelio Giles', 72, 'M', '2025-01-14', 'Chennai', 'Chennai', 'S6', 65, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Terrance Townsend', 22, 'M', '2025-06-09', 'Kolkata', 'Agra', 'S4', 65, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Samantha Webster', 41, 'M', '2025-08-13', 'Agra', 'Jaipur', 'S7', 7, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Benjamin Giles', 35, 'F', '2025-06-30', 'Delhi', 'Hyderabad', 'C3', 29, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Rogelio Walters', 118, 'M', '2025-07-04', 'Bangalore', 'Bangalore', 'C5', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Terrance Delgado', 32, 'M', '2025-07-25', 'Hyderabad', 'Agra', 'C3', 38, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Rogelio Giles', 27, 'F', '2024-03-02', 'Delhi', 'Kolkata', 'B3', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Terrance Dixon', 15, 'M', '2024-12-09', 'Chennai', 'Mumbai', 'C1', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Erika Walters', 19, 'M', '2025-03-28', 'Chennai', 'Kolkata', 'C4', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Terrance Brandt', 115, 'M', '2024-07-02', 'Hyderabad', 'Delhi', 'S10', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Erika Delgado', 108, 'M', '2025-01-22', 'Jaipur', 'Hyderabad', 'B5', 56, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Rogelio Brandt', 48, 'M', '2025-03-21', 'Agra', 'Jaipur', 'A5', 12, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Linda Giles', 118, 'M', '2024-04-05', 'Bangalore', 'Jaipur', 'S5', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Malcolm Delgado', 118, 'F', '2025-12-22', 'Delhi', 'Bangalore', 'A4', 64, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Benjamin Giles', 56, 'M', '2024-03-13', 'Delhi', 'Agra', 'C5', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Erika Dixon', 108, 'F', '2025-04-06', 'Kolkata', 'Bangalore', 'S4', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Samantha Walters', 56, 'M', '2024-03-28', 'Mumbai', 'Mumbai', 'C5', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Benjamin Walters', 3, 'M', '2025-06-22', 'Chennai', 'Delhi', 'C2', 56, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Dina Giles', 72, 'M', '2024-08-12', 'Agra', 'Agra', 'D3', 4, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Erika Jackson', 45, 'M', '2024-03-05', 'Mumbai', 'Delhi', 'B5', 4, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Shannon Brandt', 93, 'F', '2025-08-20', 'Agra', 'Delhi', 'C3', 21, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Linda Jackson', 45, 'M', '2024-02-06', 'Chennai', 'Kolkata', 'A1', 34, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Shannon Delgado', 41, 'M', '2024-12-24', 'Kolkata', 'Agra', 'B2', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Dina Webster', 95, 'F', '2024-06-17', 'Kolkata', 'Delhi', 'D3', 50, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Dina Finch', 103, 'F', '2025-05-14', 'Jaipur', 'Agra', 'S8', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Erika Townsend', 75, 'F', '2024-12-13', 'Delhi', 'Bangalore', 'A3', 10, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Dina Dixon', 92, 'M', '2025-11-09', 'Delhi', 'Agra', 'S6', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Benjamin Walters', 102, 'F', '2025-09-19', 'Kolkata', 'Agra', 'D3', 7, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Malcolm Webster', 63, 'F', '2025-05-28', 'Chennai', 'Mumbai', 'B5', 65, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Dina Brandt', 73, 'F', '2025-03-12', 'Mumbai', 'Bangalore', 'D3', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Malcolm Dixon', 85, 'F', '2025-02-21', 'Agra', 'Kolkata', 'S8', 50, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Kelley Webster', 24, 'F', '2025-12-20', 'Bangalore', 'Bangalore', 'S10', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Linda Walters', 99, 'F', '2025-04-29', 'Hyderabad', 'Delhi', 'S2', 53, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Benjamin Love', 73, 'M', '2024-08-06', 'Agra', 'Hyderabad', 'A3', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Benjamin Webster', 108, 'F', '2025-03-03', 'Kolkata', 'Delhi', 'D3', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Linda Walters', 20, 'M', '2024-12-22', 'Hyderabad', 'Chennai', 'A3', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Dina Walters', 1, 'F', '2024-05-20', 'Bangalore', 'Chennai', 'A4', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Rogelio Webster', 41, 'F', '2024-02-05', 'Bangalore', 'Agra', 'C4', 8, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Rogelio Dixon', 77, 'M', '2024-01-09', 'Delhi', 'Mumbai', 'D5', 66, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Kelley Delgado', 109, 'F', '2024-08-12', 'Delhi', 'Delhi', 'C4', 56, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Malcolm Dixon', 20, 'M', '2024-11-09', 'Kolkata', 'Delhi', 'D3', 2, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Shannon Love', 48, 'M', '2024-03-31', 'Mumbai', 'Jaipur', 'B4', 15, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Rogelio Dixon', 1, 'F', '2024-01-10', 'Delhi', 'Mumbai', 'S10', 38, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Kelley Love', 4, 'F', '2025-03-17', 'Delhi', 'Delhi', 'S4', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Rogelio Love', 78, 'M', '2024-12-04', 'Jaipur', 'Hyderabad', 'S9', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Dina Finch', 110, 'M', '2025-11-15', 'Chennai', 'Kolkata', 'D1', 43, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Kelley Walters', 58, 'M', '2025-12-29', 'Agra', 'Hyderabad', 'C4', 29, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Malcolm Love', 7, 'F', '2024-10-17', 'Bangalore', 'Hyderabad', 'S10', 54, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Erika Finch', 41, 'F', '2024-06-18', 'Delhi', 'Agra', 'B5', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Terrance Dixon', 39, 'F', '2025-10-11', 'Chennai', 'Jaipur', 'C5', 19, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Malcolm Finch', 32, 'M', '2025-09-06', 'Jaipur', 'Bangalore', 'S8', 56, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Kelley Dixon', 13, 'F', '2024-01-25', 'Delhi', 'Mumbai', 'B3', 25, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Shannon Jackson', 68, 'F', '2025-12-01', 'Chennai', 'Agra', 'S6', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Erika Giles', 23, 'M', '2025-12-23', 'Chennai', 'Bangalore', 'A3', 42, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Erika Jackson', 91, 'M', '2024-03-16', 'Delhi', 'Delhi', 'A4', 50, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Benjamin Walters', 4, 'M', '2024-11-17', 'Hyderabad', 'Jaipur', 'C5', 35, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Dina Webster', 120, 'M', '2024-09-28', 'Jaipur', 'Agra', 'D4', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Samantha Walters', 34, 'M', '2025-03-05', 'Bangalore', 'Agra', 'A2', 21, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Malcolm Love', 10, 'F', '2025-10-12', 'Delhi', 'Hyderabad', 'S6', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Dina Giles', 29, 'F', '2025-03-12', 'Mumbai', 'Jaipur', 'S3', 56, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Benjamin Jackson', 90, 'M', '2024-06-11', 'Delhi', 'Kolkata', 'S5', 12, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Shannon Brandt', 16, 'M', '2024-02-01', 'Chennai', 'Delhi', 'S8', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Kelley Jackson', 110, 'F', '2025-08-31', 'Kolkata', 'Bangalore', 'D5', 66, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Kelley Delgado', 120, 'M', '2024-06-27', 'Kolkata', 'Chennai', 'C5', 4, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Linda Walters', 8, 'F', '2025-10-26', 'Chennai', 'Kolkata', 'A2', 43, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Samantha Webster', 39, 'M', '2024-04-25', 'Kolkata', 'Delhi', 'C5', 66, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Benjamin Webster', 87, 'F', '2024-08-21', 'Bangalore', 'Jaipur', 'S2', 74, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Shannon Giles', 37, 'M', '2025-03-29', 'Delhi', 'Mumbai', 'B4', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Benjamin Jackson', 116, 'M', '2024-05-02', 'Bangalore', 'Hyderabad', 'C4', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Malcolm Finch', 114, 'F', '2024-05-28', 'Jaipur', 'Chennai', 'A5', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Malcolm Love', 106, 'F', '2024-06-29', 'Kolkata', 'Jaipur', 'B5', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Malcolm Love', 115, 'M', '2024-08-22', 'Chennai', 'Bangalore', 'B3', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Terrance Love', 6, 'M', '2025-04-02', 'Bangalore', 'Hyderabad', 'C5', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Terrance Delgado', 108, 'M', '2024-01-01', 'Kolkata', 'Chennai', 'S4', 40, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Samantha Webster', 120, 'M', '2025-03-21', 'Delhi', 'Delhi', 'B5', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Linda Love', 75, 'M', '2025-12-24', 'Kolkata', 'Kolkata', 'S4', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Samantha Webster', 93, 'M', '2025-10-28', 'Kolkata', 'Chennai', 'S8', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Kelley Walters', 91, 'F', '2025-06-25', 'Chennai', 'Agra', 'C3', 67, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Terrance Giles', 54, 'M', '2025-08-30', 'Jaipur', 'Jaipur', 'B1', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Rogelio Walters', 118, 'M', '2025-09-22', 'Chennai', 'Hyderabad', 'S4', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Linda Giles', 30, 'M', '2024-05-01', 'Bangalore', 'Agra', 'D5', 74, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Erika Townsend', 106, 'F', '2025-03-24', 'Agra', 'Delhi', 'S8', 44, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Kelley Giles', 106, 'M', '2024-04-26', 'Hyderabad', 'Delhi', 'S6', 18, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Shannon Love', 15, 'M', '2025-04-08', 'Kolkata', 'Bangalore', 'C4', 53, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Shannon Dixon', 47, 'M', '2025-02-10', 'Kolkata', 'Delhi', 'A2', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Malcolm Brandt', 60, 'F', '2025-06-18', 'Kolkata', 'Jaipur', 'C2', 33, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Benjamin Jackson', 2, 'F', '2024-06-12', 'Delhi', 'Delhi', 'B3', 25, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Samantha Finch', 33, 'M', '2024-09-05', 'Chennai', 'Mumbai', 'D3', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Malcolm Walters', 74, 'M', '2024-12-31', 'Bangalore', 'Hyderabad', 'A4', 43, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Benjamin Townsend', 50, 'F', '2024-09-04', 'Hyderabad', 'Kolkata', 'D1', 70, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Malcolm Jackson', 62, 'M', '2025-03-29', 'Chennai', 'Kolkata', 'S7', 67, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Erika Dixon', 44, 'M', '2024-07-21', 'Agra', 'Bangalore', 'D2', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Samantha Jackson', 7, 'F', '2024-01-13', 'Hyderabad', 'Agra', 'S4', 57, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Benjamin Love', 30, 'M', '2025-12-31', 'Hyderabad', 'Bangalore', 'C4', 22, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Kelley Walters', 38, 'F', '2024-03-18', 'Bangalore', 'Agra', 'D4', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Kelley Jackson', 80, 'F', '2025-04-03', 'Hyderabad', 'Chennai', 'S6', 60, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Erika Walters', 72, 'M', '2025-05-19', 'Chennai', 'Bangalore', 'S8', 4, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Samantha Townsend', 60, 'M', '2025-01-19', 'Kolkata', 'Mumbai', 'C4', 60, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Samantha Finch', 84, 'M', '2024-04-24', 'Delhi', 'Kolkata', 'S2', 24, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Samantha Love', 22, 'F', '2025-09-03', 'Mumbai', 'Delhi', 'C5', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Benjamin Webster', 62, 'F', '2024-10-01', 'Jaipur', 'Mumbai', 'C2', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Terrance Brandt', 37, 'F', '2025-02-25', 'Delhi', 'Mumbai', 'C2', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Benjamin Giles', 100, 'M', '2025-08-30', 'Mumbai', 'Bangalore', 'B1', 54, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Linda Jackson', 24, 'F', '2025-07-29', 'Bangalore', 'Agra', 'C3', 39, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Kelley Jackson', 6, 'F', '2025-07-31', 'Bangalore', 'Kolkata', 'C2', 9, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Samantha Dixon', 74, 'M', '2025-07-23', 'Mumbai', 'Kolkata', 'S1', 61, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Samantha Giles', 4, 'M', '2024-08-19', 'Kolkata', 'Mumbai', 'A3', 28, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Samantha Walters', 29, 'F', '2025-08-23', 'Jaipur', 'Agra', 'S6', 34, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Malcolm Giles', 93, 'F', '2024-08-12', 'Delhi', 'Bangalore', 'C5', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Kelley Giles', 40, 'F', '2025-02-10', 'Bangalore', 'Mumbai', 'C1', 6, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Erika Dixon', 72, 'F', '2025-02-26', 'Mumbai', 'Mumbai', 'B3', 65, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Terrance Brandt', 81, 'M', '2025-02-02', 'Kolkata', 'Chennai', 'A5', 17, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Erika Brandt', 114, 'F', '2024-10-11', 'Agra', 'Jaipur', 'S8', 61, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Kelley Walters', 44, 'F', '2025-01-25', 'Bangalore', 'Delhi', 'D2', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Dina Finch', 101, 'F', '2025-01-09', 'Delhi', 'Chennai', 'S7', 30, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Shannon Dixon', 44, 'F', '2025-03-22', 'Delhi', 'Chennai', 'C1', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Linda Dixon', 33, 'F', '2024-10-01', 'Hyderabad', 'Kolkata', 'C1', 68, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Malcolm Giles', 40, 'F', '2025-10-09', 'Agra', 'Kolkata', 'B4', 75, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Erika Giles', 119, 'F', '2024-08-10', 'Mumbai', 'Kolkata', 'S3', 46, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Dina Finch', 53, 'F', '2024-06-20', 'Chennai', 'Kolkata', 'C5', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Erika Delgado', 2, 'F', '2024-06-24', 'Hyderabad', 'Kolkata', 'S8', 9, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Dina Delgado', 80, 'M', '2024-03-23', 'Kolkata', 'Bangalore', 'A3', 4, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Benjamin Townsend', 31, 'F', '2025-11-29', 'Delhi', 'Hyderabad', 'D5', 49, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Linda Jackson', 18, 'M', '2024-10-28', 'Chennai', 'Jaipur', 'B5', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Dina Walters', 17, 'F', '2024-03-04', 'Chennai', 'Kolkata', 'C1', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Shannon Walters', 104, 'M', '2025-06-06', 'Mumbai', 'Bangalore', 'D2', 66, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Dina Giles', 113, 'F', '2025-04-15', 'Delhi', 'Mumbai', 'A3', 12, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Shannon Brandt', 106, 'F', '2024-02-16', 'Jaipur', 'Bangalore', 'S7', 27, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Dina Walters', 60, 'M', '2024-05-03', 'Bangalore', 'Hyderabad', 'C5', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Malcolm Brandt', 97, 'F', '2025-06-02', 'Agra', 'Chennai', 'S10', 41, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Linda Delgado', 90, 'F', '2024-04-15', 'Kolkata', 'Kolkata', 'A3', 73, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Terrance Dixon', 94, 'F', '2024-04-14', 'Delhi', 'Delhi', 'A3', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Benjamin Giles', 42, 'M', '2024-08-14', 'Chennai', 'Kolkata', 'A1', 39, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Samantha Dixon', 100, 'M', '2025-11-20', 'Kolkata', 'Mumbai', 'D5', 3, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Erika Webster', 102, 'M', '2024-11-17', 'Delhi', 'Chennai', 'S5', 29, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Terrance Giles', 33, 'F', '2025-11-09', 'Hyderabad', 'Agra', 'D1', 63, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Dina Giles', 19, 'F', '2025-12-08', 'Kolkata', 'Kolkata', 'S8', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Rogelio Finch', 9, 'F', '2025-04-19', 'Bangalore', 'Jaipur', 'D5', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Samantha Delgado', 99, 'F', '2024-05-06', 'Jaipur', 'Hyderabad', 'A4', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Erika Brandt', 93, 'M', '2025-11-02', 'Bangalore', 'Mumbai', 'A1', 53, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Terrance Walters', 68, 'F', '2025-09-03', 'Kolkata', 'Hyderabad', 'C2', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Dina Delgado', 100, 'M', '2025-07-15', 'Bangalore', 'Chennai', 'C4', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Benjamin Finch', 119, 'M', '2025-06-22', 'Jaipur', 'Kolkata', 'S8', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Shannon Giles', 47, 'F', '2025-06-15', 'Kolkata', 'Kolkata', 'S9', 3, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Rogelio Brandt', 50, 'F', '2024-05-06', 'Kolkata', 'Kolkata', 'B4', 55, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Erika Delgado', 116, 'M', '2024-02-22', 'Agra', 'Jaipur', 'C5', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Malcolm Walters', 30, 'M', '2025-12-27', 'Kolkata', 'Jaipur', 'S9', 49, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Samantha Giles', 70, 'M', '2025-08-18', 'Agra', 'Hyderabad', 'S6', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Shannon Jackson', 58, 'F', '2025-05-04', 'Chennai', 'Jaipur', 'S1', 32, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Benjamin Webster', 69, 'F', '2025-11-10', 'Bangalore', 'Delhi', 'B2', 11, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Kelley Love', 60, 'F', '2024-11-20', 'Hyderabad', 'Mumbai', 'D3', 66, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Dina Giles', 40, 'F', '2024-12-19', 'Mumbai', 'Bangalore', 'B1', 67, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Malcolm Brandt', 37, 'M', '2024-09-15', 'Kolkata', 'Kolkata', 'S10', 9, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Linda Webster', 35, 'F', '2025-05-26', 'Delhi', 'Kolkata', 'S8', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Rogelio Giles', 75, 'M', '2025-06-18', 'Bangalore', 'Chennai', 'C2', 32, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Terrance Jackson', 1, 'F', '2024-01-14', 'Hyderabad', 'Delhi', 'B2', 2, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Kelley Walters', 108, 'M', '2025-09-15', 'Mumbai', 'Jaipur', 'S2', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Erika Jackson', 56, 'M', '2024-03-04', 'Jaipur', 'Bangalore', 'S10', 28, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Benjamin Delgado', 90, 'M', '2025-06-25', 'Chennai', 'Bangalore', 'A4', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Samantha Walters', 29, 'F', '2025-01-27', 'Delhi', 'Delhi', 'B5', 26, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Kelley Love', 119, 'M', '2025-11-29', 'Agra', 'Chennai', 'A5', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Rogelio Delgado', 88, 'M', '2025-03-19', 'Chennai', 'Agra', 'B2', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Samantha Love', 87, 'M', '2025-07-11', 'Jaipur', 'Jaipur', 'S4', 12, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Terrance Walters', 64, 'F', '2025-08-30', 'Kolkata', 'Mumbai', 'S3', 65, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Erika Love', 5, 'F', '2024-12-05', 'Delhi', 'Mumbai', 'D4', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Kelley Brandt', 42, 'F', '2025-08-30', 'Jaipur', 'Bangalore', 'B5', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Linda Giles', 110, 'F', '2025-03-28', 'Delhi', 'Agra', 'C4', 27, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Terrance Townsend', 90, 'M', '2025-07-16', 'Chennai', 'Kolkata', 'S5', 19, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Dina Love', 64, 'F', '2025-07-15', 'Jaipur', 'Chennai', 'A2', 54, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Malcolm Walters', 20, 'F', '2024-10-18', 'Mumbai', 'Hyderabad', 'S9', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Linda Delgado', 106, 'F', '2024-09-12', 'Mumbai', 'Jaipur', 'S6', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Dina Jackson', 92, 'M', '2024-09-08', 'Delhi', 'Delhi', 'S1', 5, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Terrance Love', 41, 'M', '2024-05-02', 'Agra', 'Chennai', 'A4', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Terrance Dixon', 29, 'F', '2025-06-29', 'Mumbai', 'Mumbai', 'D4', 12, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Shannon Dixon', 38, 'F', '2024-11-14', 'Jaipur', 'Kolkata', 'B4', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Linda Dixon', 40, 'M', '2024-01-08', 'Delhi', 'Chennai', 'B2', 66, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Kelley Love', 98, 'M', '2025-07-18', 'Hyderabad', 'Chennai', 'B5', 38, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Rogelio Webster', 63, 'M', '2025-06-11', 'Jaipur', 'Kolkata', 'S2', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Dina Webster', 63, 'F', '2024-11-16', 'Chennai', 'Bangalore', 'A4', 55, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Dina Walters', 91, 'M', '2025-03-14', 'Jaipur', 'Mumbai', 'S6', 4, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Linda Townsend', 84, 'M', '2025-02-24', 'Delhi', 'Bangalore', 'C1', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Erika Love', 78, 'M', '2025-02-27', 'Jaipur', 'Mumbai', 'S8', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Malcolm Giles', 36, 'M', '2025-06-29', 'Chennai', 'Jaipur', 'D2', 66, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Shannon Brandt', 29, 'M', '2024-03-13', 'Chennai', 'Jaipur', 'S2', 57, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Shannon Love', 17, 'F', '2025-09-14', 'Kolkata', 'Delhi', 'A1', 15, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Malcolm Giles', 7, 'F', '2024-03-21', 'Delhi', 'Kolkata', 'D3', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Linda Giles', 95, 'M', '2025-09-25', 'Delhi', 'Mumbai', 'C4', 71, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Dina Finch', 19, 'M', '2024-02-21', 'Bangalore', 'Mumbai', 'S10', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Dina Finch', 40, 'F', '2024-05-24', 'Chennai', 'Mumbai', 'S2', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Linda Finch', 89, 'M', '2025-07-26', 'Hyderabad', 'Bangalore', 'S3', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Linda Townsend', 111, 'F', '2024-12-22', 'Delhi', 'Agra', 'B5', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Samantha Brandt', 26, 'M', '2025-04-16', 'Jaipur', 'Kolkata', 'S2', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Kelley Walters', 43, 'F', '2025-11-07', 'Jaipur', 'Jaipur', 'D1', 34, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Terrance Walters', 73, 'M', '2024-07-27', 'Delhi', 'Delhi', 'A4', 12, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Kelley Walters', 82, 'M', '2024-10-30', 'Delhi', 'Agra', 'S5', 67, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Benjamin Giles', 19, 'F', '2024-07-18', 'Kolkata', 'Jaipur', 'B2', 38, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Kelley Giles', 76, 'F', '2024-05-24', 'Hyderabad', 'Chennai', 'C5', 45, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Benjamin Jackson', 55, 'M', '2024-08-24', 'Mumbai', 'Jaipur', 'S9', 60, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Kelley Dixon', 23, 'M', '2025-09-26', 'Jaipur', 'Kolkata', 'D2', 34, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Erika Webster', 75, 'F', '2024-08-04', 'Kolkata', 'Kolkata', 'S8', 47, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Malcolm Walters', 81, 'F', '2025-08-30', 'Chennai', 'Mumbai', 'S7', 41, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Samantha Giles', 33, 'M', '2024-02-02', 'Bangalore', 'Jaipur', 'A3', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Kelley Jackson', 18, 'M', '2025-06-14', 'Bangalore', 'Mumbai', 'B1', 64, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Malcolm Giles', 102, 'F', '2025-10-01', 'Kolkata', 'Delhi', 'B1', 39, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Dina Finch', 35, 'M', '2025-06-18', 'Mumbai', 'Jaipur', 'D2', 72, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Dina Webster', 73, 'M', '2025-03-05', 'Delhi', 'Jaipur', 'S1', 50, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Kelley Finch', 102, 'M', '2024-12-13', 'Bangalore', 'Chennai', 'B2', 15, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Malcolm Jackson', 81, 'F', '2025-12-11', 'Kolkata', 'Kolkata', 'A5', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Benjamin Walters', 27, 'M', '2024-06-16', 'Kolkata', 'Bangalore', 'B3', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Shannon Webster', 92, 'F', '2024-07-26', 'Mumbai', 'Mumbai', 'C3', 50, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Malcolm Dixon', 55, 'F', '2025-07-31', 'Bangalore', 'Jaipur', 'D1', 57, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Erika Finch', 64, 'M', '2024-03-14', 'Agra', 'Chennai', 'S9', 37, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Terrance Jackson', 102, 'M', '2025-06-13', 'Chennai', 'Delhi', 'S1', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Kelley Finch', 37, 'F', '2025-01-23', 'Bangalore', 'Kolkata', 'S9', 45, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Kelley Walters', 30, 'M', '2024-03-11', 'Jaipur', 'Delhi', 'B1', 41, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Malcolm Jackson', 102, 'F', '2024-09-26', 'Jaipur', 'Delhi', 'S4', 2, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Rogelio Finch', 20, 'M', '2024-09-04', 'Mumbai', 'Hyderabad', 'B4', 42, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Erika Brandt', 48, 'M', '2024-01-27', 'Chennai', 'Chennai', 'B4', 68, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Samantha Giles', 85, 'F', '2025-03-29', 'Kolkata', 'Agra', 'D1', 22, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Samantha Townsend', 39, 'F', '2025-11-14', 'Kolkata', 'Hyderabad', 'C2', 28, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Samantha Walters', 64, 'F', '2024-03-25', 'Mumbai', 'Mumbai', 'S9', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Shannon Finch', 54, 'F', '2025-04-08', 'Bangalore', 'Jaipur', 'D1', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Benjamin Dixon', 97, 'F', '2025-06-14', 'Bangalore', 'Mumbai', 'A1', 50, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Samantha Jackson', 92, 'F', '2025-01-25', 'Jaipur', 'Hyderabad', 'A3', 45, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Erika Townsend', 65, 'M', '2025-10-29', 'Mumbai', 'Mumbai', 'B3', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Erika Walters', 88, 'F', '2025-08-25', 'Agra', 'Kolkata', 'D3', 47, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Erika Walters', 110, 'F', '2025-10-27', 'Mumbai', 'Delhi', 'S1', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Samantha Jackson', 76, 'F', '2024-01-15', 'Agra', 'Delhi', 'D2', 23, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Rogelio Finch', 99, 'F', '2024-06-16', 'Agra', 'Chennai', 'B2', 46, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Malcolm Giles', 71, 'M', '2024-11-09', 'Delhi', 'Mumbai', 'A5', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Rogelio Delgado', 116, 'F', '2024-07-15', 'Agra', 'Mumbai', 'S7', 73, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Linda Finch', 80, 'M', '2025-05-12', 'Kolkata', 'Agra', 'S4', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Dina Jackson', 67, 'F', '2024-05-21', 'Bangalore', 'Chennai', 'S4', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Rogelio Webster', 31, 'M', '2024-12-05', 'Kolkata', 'Agra', 'C1', 37, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Terrance Dixon', 98, 'M', '2025-09-02', 'Chennai', 'Kolkata', 'A1', 55, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Benjamin Walters', 52, 'M', '2024-04-26', 'Hyderabad', 'Chennai', 'C5', 39, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Malcolm Dixon', 113, 'M', '2024-12-11', 'Hyderabad', 'Bangalore', 'S5', 1, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Kelley Giles', 8, 'M', '2025-07-24', 'Agra', 'Hyderabad', 'S8', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Malcolm Finch', 30, 'F', '2024-08-22', 'Kolkata', 'Chennai', 'D5', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Kelley Finch', 79, 'M', '2024-10-25', 'Hyderabad', 'Agra', 'S1', 62, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Terrance Delgado', 73, 'M', '2025-10-08', 'Kolkata', 'Jaipur', 'A5', 70, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Shannon Love', 55, 'F', '2024-11-21', 'Mumbai', 'Delhi', 'D3', 13, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Samantha Brandt', 15, 'F', '2024-11-27', 'Hyderabad', 'Hyderabad', 'D3', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Rogelio Love', 88, 'M', '2025-04-16', 'Jaipur', 'Agra', 'B1', 21, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Rogelio Jackson', 52, 'F', '2024-10-02', 'Chennai', 'Agra', 'S4', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Samantha Webster', 108, 'F', '2025-04-14', 'Bangalore', 'Kolkata', 'C4', 46, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Dina Brandt', 76, 'M', '2024-05-18', 'Agra', 'Chennai', 'C1', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Benjamin Giles', 98, 'F', '2025-07-20', 'Jaipur', 'Agra', 'S10', 67, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Kelley Giles', 57, 'F', '2024-10-05', 'Hyderabad', 'Hyderabad', 'S5', 19, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Terrance Walters', 83, 'M', '2024-12-23', 'Mumbai', 'Chennai', 'S7', 24, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Erika Giles', 41, 'F', '2025-02-24', 'Delhi', 'Hyderabad', 'D3', 61, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Kelley Love', 79, 'F', '2025-09-23', 'Jaipur', 'Mumbai', 'B1', 9, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Benjamin Dixon', 2, 'F', '2024-04-09', 'Kolkata', 'Kolkata', 'C2', 11, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Terrance Finch', 77, 'F', '2025-03-08', 'Chennai', 'Kolkata', 'B2', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Benjamin Giles', 50, 'F', '2025-02-26', 'Delhi', 'Jaipur', 'B2', 65, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Erika Finch', 63, 'F', '2025-09-25', 'Agra', 'Mumbai', 'B1', 56, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Malcolm Love', 8, 'F', '2024-05-13', 'Delhi', 'Mumbai', 'A4', 73, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Dina Townsend', 82, 'M', '2024-06-19', 'Bangalore', 'Kolkata', 'D3', 6, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Malcolm Webster', 34, 'M', '2024-01-21', 'Hyderabad', 'Jaipur', 'S1', 32, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Benjamin Webster', 23, 'F', '2024-12-14', 'Bangalore', 'Agra', 'B3', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Samantha Dixon', 62, 'F', '2025-04-28', 'Kolkata', 'Hyderabad', 'S6', 30, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Malcolm Jackson', 94, 'M', '2025-05-13', 'Agra', 'Jaipur', 'C4', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Terrance Walters', 77, 'M', '2025-07-10', 'Mumbai', 'Hyderabad', 'S6', 42, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Samantha Delgado', 54, 'F', '2024-08-11', 'Mumbai', 'Agra', 'S4', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Terrance Delgado', 15, 'F', '2024-06-10', 'Hyderabad', 'Chennai', 'D2', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Benjamin Brandt', 1, 'F', '2024-05-28', 'Chennai', 'Jaipur', 'B5', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Malcolm Jackson', 89, 'F', '2025-02-16', 'Hyderabad', 'Mumbai', 'S6', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Samantha Finch', 51, 'M', '2024-09-17', 'Agra', 'Kolkata', 'S7', 30, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Linda Webster', 40, 'M', '2025-10-08', 'Delhi', 'Jaipur', 'S9', 42, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Linda Brandt', 76, 'M', '2025-06-03', 'Hyderabad', 'Mumbai', 'A3', 47, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Benjamin Webster', 69, 'M', '2025-06-27', 'Jaipur', 'Hyderabad', 'B4', 73, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Benjamin Dixon', 81, 'M', '2025-12-27', 'Kolkata', 'Delhi', 'S7', 18, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Rogelio Dixon', 8, 'F', '2024-06-14', 'Kolkata', 'Delhi', 'C1', 18, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Rogelio Finch', 77, 'M', '2025-02-19', 'Chennai', 'Jaipur', 'C5', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Samantha Delgado', 84, 'F', '2025-12-26', 'Kolkata', 'Delhi', 'D2', 57, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Kelley Townsend', 33, 'F', '2024-03-13', 'Mumbai', 'Bangalore', 'S4', 6, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Dina Townsend', 31, 'F', '2024-04-28', 'Mumbai', 'Kolkata', 'A5', 31, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Rogelio Townsend', 56, 'M', '2024-09-08', 'Hyderabad', 'Mumbai', 'C2', 75, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Malcolm Dixon', 13, 'F', '2024-10-07', 'Jaipur', 'Delhi', 'C4', 52, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Malcolm Walters', 3, 'M', '2025-12-13', 'Jaipur', 'Jaipur', 'D3', 63, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Samantha Giles', 64, 'M', '2025-05-18', 'Kolkata', 'Bangalore', 'A1', 34, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Erika Townsend', 40, 'M', '2024-10-18', 'Bangalore', 'Kolkata', 'S5', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Rogelio Brandt', 82, 'M', '2024-05-05', 'Mumbai', 'Jaipur', 'B5', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Samantha Townsend', 55, 'M', '2024-02-15', 'Bangalore', 'Hyderabad', 'S9', 49, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Kelley Webster', 83, 'F', '2025-07-10', 'Mumbai', 'Jaipur', 'A1', 61, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Kelley Delgado', 109, 'F', '2024-10-19', 'Jaipur', 'Kolkata', 'D2', 27, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Malcolm Jackson', 72, 'F', '2025-11-19', 'Kolkata', 'Mumbai', 'S8', 60, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Rogelio Townsend', 57, 'F', '2024-09-04', 'Delhi', 'Delhi', 'D3', 26, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Dina Walters', 18, 'M', '2024-04-30', 'Chennai', 'Delhi', 'S2', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Benjamin Dixon', 102, 'F', '2025-05-06', 'Jaipur', 'Chennai', 'B2', 7, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Terrance Townsend', 65, 'M', '2025-04-20', 'Agra', 'Bangalore', 'A3', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Shannon Love', 96, 'F', '2024-09-01', 'Delhi', 'Kolkata', 'C2', 75, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Linda Love', 37, 'M', '2025-04-19', 'Bangalore', 'Kolkata', 'D1', 8, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Erika Delgado', 112, 'M', '2024-04-25', 'Jaipur', 'Jaipur', 'B3', 34, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Shannon Townsend', 68, 'F', '2025-10-21', 'Chennai', 'Delhi', 'D4', 13, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Linda Dixon', 64, 'F', '2024-04-30', 'Kolkata', 'Mumbai', 'D2', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Samantha Giles', 72, 'F', '2025-05-13', 'Chennai', 'Mumbai', 'A5', 42, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Shannon Brandt', 62, 'M', '2024-12-03', 'Jaipur', 'Chennai', 'D3', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Rogelio Brandt', 105, 'M', '2024-10-08', 'Kolkata', 'Kolkata', 'C3', 66, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Shannon Townsend', 72, 'M', '2025-12-19', 'Delhi', 'Kolkata', 'B4', 2, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Benjamin Walters', 89, 'M', '2025-06-24', 'Bangalore', 'Delhi', 'S8', 2, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Dina Giles', 6, 'F', '2024-01-08', 'Mumbai', 'Kolkata', 'B3', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Linda Brandt', 119, 'F', '2024-11-14', 'Bangalore', 'Mumbai', 'B5', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Benjamin Love', 96, 'M', '2025-01-28', 'Delhi', 'Kolkata', 'D1', 28, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Kelley Delgado', 44, 'F', '2025-11-20', 'Kolkata', 'Kolkata', 'D3', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Shannon Dixon', 14, 'M', '2025-06-25', 'Hyderabad', 'Mumbai', 'B2', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Kelley Delgado', 40, 'M', '2024-08-31', 'Chennai', 'Agra', 'S7', 19, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Terrance Townsend', 75, 'F', '2025-08-06', 'Chennai', 'Hyderabad', 'C4', 67, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Dina Finch', 107, 'M', '2024-09-01', 'Mumbai', 'Delhi', 'A3', 27, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Dina Webster', 36, 'F', '2024-01-10', 'Chennai', 'Delhi', 'D3', 69, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Shannon Brandt', 47, 'F', '2024-04-07', 'Delhi', 'Mumbai', 'A1', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Dina Delgado', 58, 'M', '2024-10-29', 'Bangalore', 'Kolkata', 'S4', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Terrance Giles', 54, 'F', '2025-02-20', 'Jaipur', 'Jaipur', 'S1', 75, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Rogelio Jackson', 105, 'F', '2024-11-24', 'Delhi', 'Jaipur', 'S4', 53, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Samantha Finch', 23, 'M', '2025-06-15', 'Kolkata', 'Mumbai', 'D1', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Terrance Webster', 15, 'M', '2024-07-02', 'Bangalore', 'Hyderabad', 'D3', 23, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Erika Love', 33, 'M', '2025-07-11', 'Mumbai', 'Hyderabad', 'S9', 9, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Benjamin Giles', 25, 'M', '2024-02-05', 'Chennai', 'Agra', 'A2', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Benjamin Giles', 6, 'M', '2024-11-09', 'Agra', 'Kolkata', 'B1', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Kelley Jackson', 88, 'M', '2025-01-30', 'Delhi', 'Jaipur', 'B3', 45, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Malcolm Delgado', 40, 'M', '2024-08-09', 'Agra', 'Jaipur', 'S3', 34, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Dina Finch', 115, 'F', '2024-02-13', 'Chennai', 'Kolkata', 'A2', 69, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Malcolm Webster', 76, 'F', '2025-10-11', 'Mumbai', 'Bangalore', 'C2', 15, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (75, 'Samantha Delgado', 84, 'M', '2024-06-15', 'Kolkata', 'Jaipur', 'A5', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Benjamin Delgado', 65, 'M', '2025-11-08', 'Bangalore', 'Chennai', 'A1', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Erika Walters', 25, 'F', '2025-09-23', 'Jaipur', 'Mumbai', 'D3', 44, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Terrance Jackson', 43, 'M', '2025-12-28', 'Kolkata', 'Chennai', 'B4', 71, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Erika Webster', 37, 'M', '2024-10-08', 'Delhi', 'Chennai', 'B2', 25, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Erika Delgado', 87, 'F', '2024-02-28', 'Chennai', 'Delhi', 'S4', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Benjamin Delgado', 10, 'M', '2024-07-22', 'Jaipur', 'Kolkata', 'D4', 43, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Erika Finch', 33, 'F', '2024-06-26', 'Hyderabad', 'Kolkata', 'D3', 53, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Terrance Dixon', 37, 'M', '2025-01-04', 'Delhi', 'Agra', 'D5', 66, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Dina Walters', 18, 'M', '2024-06-30', 'Mumbai', 'Agra', 'A5', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Erika Dixon', 111, 'F', '2024-04-14', 'Delhi', 'Kolkata', 'D4', 73, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Benjamin Finch', 56, 'F', '2024-06-01', 'Kolkata', 'Jaipur', 'A1', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Terrance Webster', 10, 'F', '2025-04-01', 'Chennai', 'Jaipur', 'S7', 24, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Linda Delgado', 66, 'F', '2024-11-26', 'Hyderabad', 'Kolkata', 'D4', 54, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Erika Giles', 33, 'M', '2025-04-29', 'Kolkata', 'Jaipur', 'C1', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Rogelio Finch', 69, 'F', '2025-06-03', 'Mumbai', 'Hyderabad', 'A5', 20, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Linda Finch', 107, 'M', '2025-11-25', 'Delhi', 'Delhi', 'D4', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Samantha Dixon', 120, 'F', '2025-05-12', 'Hyderabad', 'Agra', 'D1', 25, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Benjamin Jackson', 60, 'M', '2024-05-16', 'Agra', 'Chennai', 'D4', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Terrance Delgado', 70, 'M', '2025-07-07', 'Jaipur', 'Bangalore', 'A1', 75, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Samantha Walters', 28, 'F', '2025-06-23', 'Bangalore', 'Chennai', 'B5', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Linda Dixon', 85, 'M', '2024-10-05', 'Bangalore', 'Chennai', 'S4', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Erika Townsend', 52, 'M', '2024-02-13', 'Mumbai', 'Bangalore', 'A2', 41, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Erika Giles', 78, 'M', '2024-07-01', 'Delhi', 'Bangalore', 'A5', 57, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Dina Walters', 77, 'M', '2025-03-06', 'Jaipur', 'Mumbai', 'B4', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Shannon Love', 51, 'M', '2025-05-03', 'Delhi', 'Jaipur', 'A4', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Samantha Delgado', 38, 'F', '2025-02-22', 'Jaipur', 'Bangalore', 'C1', 54, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Terrance Delgado', 60, 'M', '2025-04-10', 'Hyderabad', 'Jaipur', 'A5', 45, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Kelley Dixon', 91, 'M', '2024-06-04', 'Delhi', 'Mumbai', 'A3', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Linda Brandt', 43, 'F', '2024-08-03', 'Mumbai', 'Chennai', 'B4', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Malcolm Jackson', 60, 'M', '2024-11-23', 'Agra', 'Bangalore', 'S4', 21, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Rogelio Dixon', 64, 'M', '2024-04-02', 'Mumbai', 'Chennai', 'S6', 3, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Malcolm Brandt', 36, 'M', '2024-04-02', 'Jaipur', 'Hyderabad', 'D1', 50, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Erika Dixon', 65, 'F', '2025-05-22', 'Jaipur', 'Hyderabad', 'D1', 50, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Samantha Townsend', 42, 'F', '2025-06-21', 'Mumbai', 'Delhi', 'B2', 67, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Terrance Finch', 6, 'F', '2024-07-20', 'Kolkata', 'Delhi', 'B2', 64, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Benjamin Townsend', 18, 'F', '2024-12-17', 'Jaipur', 'Hyderabad', 'S5', 28, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Dina Townsend', 12, 'M', '2025-06-24', 'Hyderabad', 'Hyderabad', 'S3', 8, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Benjamin Giles', 23, 'F', '2025-03-22', 'Jaipur', 'Jaipur', 'D3', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Erika Dixon', 26, 'M', '2025-09-09', 'Kolkata', 'Hyderabad', 'C4', 18, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Kelley Jackson', 8, 'M', '2024-02-23', 'Jaipur', 'Chennai', 'D1', 65, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Samantha Jackson', 107, 'M', '2024-06-30', 'Mumbai', 'Jaipur', 'C1', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Samantha Finch', 71, 'M', '2025-09-23', 'Hyderabad', 'Delhi', 'A2', 8, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Rogelio Brandt', 101, 'F', '2024-12-11', 'Agra', 'Hyderabad', 'S8', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Terrance Webster', 54, 'M', '2025-10-16', 'Agra', 'Kolkata', 'C2', 49, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Rogelio Finch', 54, 'M', '2024-06-10', 'Delhi', 'Delhi', 'B4', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Samantha Delgado', 31, 'F', '2025-05-05', 'Hyderabad', 'Jaipur', 'S4', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Benjamin Love', 86, 'F', '2025-11-30', 'Hyderabad', 'Chennai', 'S1', 61, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Samantha Delgado', 50, 'M', '2025-01-05', 'Agra', 'Jaipur', 'A2', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Linda Webster', 64, 'M', '2025-08-09', 'Chennai', 'Bangalore', 'S1', 15, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Benjamin Delgado', 45, 'M', '2024-05-30', 'Kolkata', 'Mumbai', 'D4', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Dina Love', 13, 'F', '2025-01-21', 'Bangalore', 'Bangalore', 'S9', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Shannon Townsend', 52, 'F', '2024-12-12', 'Delhi', 'Agra', 'S2', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Samantha Townsend', 5, 'M', '2024-03-31', 'Jaipur', 'Hyderabad', 'S4', 1, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Benjamin Finch', 85, 'M', '2025-10-20', 'Jaipur', 'Mumbai', 'C2', 65, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Dina Webster', 45, 'M', '2024-10-20', 'Hyderabad', 'Hyderabad', 'S1', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Rogelio Delgado', 77, 'F', '2024-05-11', 'Hyderabad', 'Delhi', 'B5', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Rogelio Giles', 99, 'F', '2025-02-10', 'Bangalore', 'Hyderabad', 'S5', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Erika Delgado', 79, 'M', '2025-04-24', 'Mumbai', 'Hyderabad', 'S7', 74, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Erika Giles', 105, 'F', '2025-01-17', 'Delhi', 'Chennai', 'S6', 24, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Benjamin Giles', 25, 'M', '2024-05-16', 'Agra', 'Mumbai', 'S3', 25, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Benjamin Love', 90, 'F', '2025-06-01', 'Delhi', 'Kolkata', 'D1', 75, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Benjamin Dixon', 34, 'M', '2024-06-04', 'Bangalore', 'Delhi', 'C2', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Benjamin Townsend', 10, 'F', '2025-01-28', 'Chennai', 'Agra', 'S6', 52, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Kelley Delgado', 94, 'M', '2025-02-13', 'Jaipur', 'Bangalore', 'B3', 52, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Terrance Dixon', 32, 'F', '2024-06-06', 'Hyderabad', 'Kolkata', 'C2', 65, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Terrance Dixon', 69, 'F', '2024-04-30', 'Chennai', 'Hyderabad', 'S1', 70, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Linda Walters', 107, 'M', '2024-05-03', 'Delhi', 'Agra', 'D3', 31, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Benjamin Dixon', 71, 'M', '2024-06-15', 'Hyderabad', 'Agra', 'B3', 21, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Dina Finch', 34, 'M', '2024-07-29', 'Jaipur', 'Jaipur', 'B2', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Linda Finch', 70, 'M', '2024-01-11', 'Chennai', 'Chennai', 'B3', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Dina Brandt', 76, 'F', '2025-11-11', 'Chennai', 'Chennai', 'B4', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Dina Giles', 53, 'F', '2025-10-27', 'Mumbai', 'Jaipur', 'D3', 39, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Erika Townsend', 91, 'F', '2025-05-18', 'Kolkata', 'Delhi', 'S2', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Kelley Brandt', 12, 'F', '2024-09-17', 'Kolkata', 'Chennai', 'B3', 34, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Erika Love', 12, 'F', '2025-01-05', 'Delhi', 'Jaipur', 'S1', 61, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Rogelio Townsend', 104, 'M', '2025-03-11', 'Mumbai', 'Hyderabad', 'S3', 34, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Erika Finch', 63, 'M', '2025-08-04', 'Hyderabad', 'Kolkata', 'S4', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Rogelio Love', 10, 'M', '2024-06-26', 'Chennai', 'Kolkata', 'B1', 55, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Dina Jackson', 15, 'M', '2024-07-17', 'Bangalore', 'Agra', 'S6', 60, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Terrance Jackson', 59, 'M', '2024-12-08', 'Agra', 'Jaipur', 'S1', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Shannon Finch', 26, 'M', '2024-07-31', 'Bangalore', 'Agra', 'D4', 51, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Shannon Townsend', 3, 'M', '2024-02-22', 'Hyderabad', 'Bangalore', 'B2', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Malcolm Delgado', 39, 'M', '2025-04-02', 'Agra', 'Chennai', 'S10', 16, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Rogelio Dixon', 59, 'M', '2025-08-21', 'Mumbai', 'Jaipur', 'C3', 66, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Malcolm Townsend', 118, 'F', '2025-12-21', 'Hyderabad', 'Agra', 'C5', 70, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Rogelio Jackson', 48, 'F', '2025-04-11', 'Delhi', 'Mumbai', 'C1', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Linda Love', 115, 'F', '2024-10-06', 'Bangalore', 'Chennai', 'S9', 67, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Samantha Delgado', 70, 'F', '2024-08-25', 'Mumbai', 'Kolkata', 'D1', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Erika Finch', 25, 'M', '2024-12-06', 'Jaipur', 'Mumbai', 'D5', 18, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Samantha Love', 73, 'M', '2024-11-01', 'Jaipur', 'Agra', 'A4', 11, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Benjamin Love', 87, 'F', '2024-10-01', 'Delhi', 'Mumbai', 'S3', 27, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Kelley Webster', 119, 'F', '2025-01-05', 'Mumbai', 'Jaipur', 'D5', 12, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Benjamin Finch', 29, 'M', '2024-01-28', 'Hyderabad', 'Agra', 'D2', 28, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Linda Webster', 105, 'F', '2024-03-11', 'Mumbai', 'Delhi', 'B4', 54, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Linda Giles', 42, 'F', '2025-09-02', 'Jaipur', 'Hyderabad', 'C2', 6, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Linda Finch', 100, 'F', '2024-01-11', 'Jaipur', 'Chennai', 'C4', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Rogelio Webster', 51, 'F', '2024-09-27', 'Chennai', 'Hyderabad', 'A5', 34, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Shannon Dixon', 116, 'F', '2024-03-11', 'Chennai', 'Agra', 'S8', 18, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Benjamin Finch', 89, 'M', '2024-09-27', 'Delhi', 'Hyderabad', 'C4', 17, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Malcolm Finch', 95, 'M', '2024-08-14', 'Kolkata', 'Agra', 'C5', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Shannon Brandt', 68, 'F', '2025-12-26', 'Agra', 'Jaipur', 'B5', 15, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Erika Love', 46, 'M', '2025-11-02', 'Bangalore', 'Hyderabad', 'S1', 21, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Dina Delgado', 34, 'M', '2024-11-29', 'Agra', 'Chennai', 'B3', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Erika Webster', 83, 'F', '2024-10-13', 'Agra', 'Agra', 'S8', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Terrance Walters', 107, 'F', '2024-10-20', 'Mumbai', 'Jaipur', 'B2', 7, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (23, 'Kelley Delgado', 36, 'F', '2025-01-26', 'Delhi', 'Agra', 'B1', 70, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Samantha Giles', 58, 'M', '2025-11-09', 'Kolkata', 'Delhi', 'D4', 4, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Kelley Townsend', 105, 'F', '2024-05-24', 'Chennai', 'Delhi', 'D5', 61, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (59, 'Malcolm Love', 23, 'M', '2024-05-20', 'Mumbai', 'Mumbai', 'A3', 7, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Shannon Giles', 106, 'M', '2025-01-04', 'Chennai', 'Hyderabad', 'S2', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (5, 'Terrance Jackson', 73, 'M', '2024-06-12', 'Chennai', 'Mumbai', 'S6', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Samantha Webster', 101, 'F', '2025-10-28', 'Jaipur', 'Bangalore', 'A4', 71, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Dina Giles', 12, 'M', '2024-05-01', 'Kolkata', 'Jaipur', 'B4', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Linda Brandt', 72, 'F', '2024-05-18', 'Agra', 'Agra', 'S9', 30, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Shannon Giles', 113, 'M', '2024-09-01', 'Delhi', 'Delhi', 'D4', 44, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Dina Townsend', 57, 'M', '2024-01-07', 'Bangalore', 'Delhi', 'C4', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Dina Walters', 75, 'M', '2024-05-11', 'Agra', 'Hyderabad', 'S6', 12, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Malcolm Brandt', 39, 'M', '2025-12-22', 'Kolkata', 'Hyderabad', 'S8', 61, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Erika Jackson', 81, 'F', '2025-10-06', 'Jaipur', 'Bangalore', 'S1', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Malcolm Walters', 24, 'M', '2024-05-24', 'Hyderabad', 'Hyderabad', 'D5', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Kelley Jackson', 4, 'M', '2024-08-07', 'Bangalore', 'Mumbai', 'S1', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Rogelio Brandt', 62, 'M', '2024-08-29', 'Chennai', 'Hyderabad', 'D3', 45, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Rogelio Finch', 86, 'M', '2025-07-22', 'Kolkata', 'Mumbai', 'D2', 34, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Linda Brandt', 89, 'M', '2025-11-03', 'Chennai', 'Jaipur', 'A5', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Samantha Walters', 43, 'M', '2024-07-12', 'Hyderabad', 'Kolkata', 'D2', 70, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Samantha Finch', 35, 'M', '2025-12-14', 'Mumbai', 'Agra', 'B4', 57, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Linda Finch', 96, 'M', '2025-12-23', 'Jaipur', 'Bangalore', 'A5', 72, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Shannon Brandt', 15, 'F', '2025-05-05', 'Agra', 'Jaipur', 'S6', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Erika Brandt', 86, 'M', '2025-04-15', 'Hyderabad', 'Chennai', 'C2', 11, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Terrance Dixon', 112, 'F', '2025-05-20', 'Delhi', 'Hyderabad', 'D4', 40, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Dina Jackson', 95, 'M', '2025-04-21', 'Jaipur', 'Agra', 'S8', 60, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Erika Jackson', 85, 'F', '2025-09-30', 'Hyderabad', 'Hyderabad', 'C5', 18, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Erika Walters', 77, 'F', '2025-03-28', 'Hyderabad', 'Delhi', 'C2', 21, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Shannon Webster', 2, 'F', '2025-03-20', 'Bangalore', 'Mumbai', 'S5', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (49, 'Shannon Webster', 59, 'F', '2024-11-15', 'Agra', 'Delhi', 'A4', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Kelley Walters', 95, 'F', '2025-01-03', 'Chennai', 'Mumbai', 'A1', 2, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Dina Dixon', 72, 'F', '2024-10-30', 'Jaipur', 'Kolkata', 'B5', 33, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Shannon Finch', 27, 'F', '2025-07-17', 'Kolkata', 'Delhi', 'D2', 17, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Dina Finch', 88, 'M', '2025-08-14', 'Agra', 'Chennai', 'S4', 31, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Malcolm Delgado', 43, 'F', '2025-04-18', 'Kolkata', 'Chennai', 'D1', 11, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Kelley Townsend', 61, 'M', '2024-04-18', 'Chennai', 'Delhi', 'S4', 21, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Dina Giles', 27, 'F', '2025-04-09', 'Mumbai', 'Chennai', 'S3', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Erika Love', 95, 'M', '2024-03-27', 'Chennai', 'Kolkata', 'A3', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Benjamin Brandt', 111, 'F', '2025-05-05', 'Hyderabad', 'Agra', 'S8', 9, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Terrance Delgado', 82, 'F', '2025-12-19', 'Mumbai', 'Bangalore', 'A2', 25, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Benjamin Giles', 117, 'F', '2025-11-11', 'Agra', 'Mumbai', 'C3', 41, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Kelley Finch', 24, 'F', '2024-10-29', 'Bangalore', 'Chennai', 'S6', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Linda Dixon', 33, 'M', '2024-02-13', 'Delhi', 'Delhi', 'A2', 64, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Terrance Delgado', 48, 'F', '2024-04-05', 'Agra', 'Kolkata', 'A5', 38, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Samantha Townsend', 106, 'F', '2025-10-21', 'Kolkata', 'Delhi', 'S7', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Terrance Love', 30, 'M', '2024-05-20', 'Agra', 'Hyderabad', 'B2', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Terrance Finch', 51, 'M', '2025-03-01', 'Jaipur', 'Kolkata', 'C5', 28, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Shannon Giles', 25, 'F', '2025-02-08', 'Chennai', 'Agra', 'S1', 67, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Samantha Webster', 41, 'F', '2024-10-20', 'Mumbai', 'Bangalore', 'D3', 70, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Rogelio Walters', 115, 'F', '2025-03-01', 'Agra', 'Agra', 'D2', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Kelley Townsend', 52, 'M', '2025-11-15', 'Agra', 'Mumbai', 'C1', 4, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Linda Brandt', 56, 'M', '2025-08-19', 'Mumbai', 'Bangalore', 'B3', 54, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Shannon Love', 54, 'M', '2025-07-01', 'Mumbai', 'Jaipur', 'D4', 52, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (60, 'Shannon Delgado', 115, 'F', '2024-02-23', 'Hyderabad', 'Delhi', 'C3', 24, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Malcolm Delgado', 2, 'M', '2025-10-21', 'Delhi', 'Agra', 'S8', 30, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Samantha Dixon', 63, 'F', '2025-02-14', 'Bangalore', 'Delhi', 'S9', 64, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Terrance Giles', 48, 'M', '2024-12-29', 'Agra', 'Bangalore', 'C2', 45, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Malcolm Walters', 41, 'M', '2025-10-27', 'Delhi', 'Agra', 'D2', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Erika Love', 61, 'F', '2025-04-21', 'Bangalore', 'Kolkata', 'S1', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Terrance Brandt', 94, 'M', '2025-07-06', 'Delhi', 'Delhi', 'C2', 1, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Terrance Dixon', 55, 'M', '2024-04-17', 'Delhi', 'Agra', 'S8', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Dina Brandt', 83, 'M', '2024-08-01', 'Bangalore', 'Chennai', 'S7', 61, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Shannon Giles', 114, 'F', '2024-03-13', 'Jaipur', 'Kolkata', 'C5', 36, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Dina Giles', 40, 'M', '2025-09-26', 'Delhi', 'Mumbai', 'B2', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Samantha Webster', 97, 'M', '2024-11-06', 'Delhi', 'Hyderabad', 'D3', 36, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Linda Delgado', 23, 'M', '2025-10-09', 'Delhi', 'Kolkata', 'D2', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Rogelio Townsend', 68, 'F', '2024-11-19', 'Hyderabad', 'Mumbai', 'B5', 37, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (15, 'Samantha Delgado', 118, 'F', '2025-03-31', 'Delhi', 'Mumbai', 'D1', 55, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Rogelio Brandt', 26, 'F', '2024-04-30', 'Hyderabad', 'Kolkata', 'C5', 3, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Erika Giles', 70, 'M', '2025-10-15', 'Bangalore', 'Agra', 'C1', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Malcolm Love', 62, 'F', '2024-03-22', 'Mumbai', 'Bangalore', 'A5', 66, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Dina Delgado', 45, 'M', '2025-10-29', 'Jaipur', 'Bangalore', 'B3', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Kelley Delgado', 119, 'M', '2025-07-14', 'Jaipur', 'Kolkata', 'D2', 3, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Rogelio Finch', 27, 'M', '2024-10-19', 'Kolkata', 'Hyderabad', 'C1', 24, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Benjamin Finch', 16, 'M', '2024-05-30', 'Kolkata', 'Jaipur', 'C5', 40, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Benjamin Delgado', 28, 'M', '2025-07-13', 'Chennai', 'Kolkata', 'A4', 19, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (88, 'Terrance Love', 48, 'M', '2025-03-30', 'Delhi', 'Agra', 'S1', 24, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Dina Giles', 94, 'M', '2024-01-25', 'Hyderabad', 'Jaipur', 'D1', 63, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Shannon Townsend', 90, 'F', '2024-05-01', 'Bangalore', 'Mumbai', 'D3', 71, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Shannon Walters', 8, 'F', '2025-04-23', 'Hyderabad', 'Delhi', 'D1', 69, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Shannon Dixon', 103, 'F', '2025-02-08', 'Delhi', 'Mumbai', 'S8', 39, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Benjamin Webster', 35, 'F', '2025-11-12', 'Agra', 'Chennai', 'A1', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Terrance Townsend', 1, 'F', '2024-11-19', 'Agra', 'Agra', 'A1', 64, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Dina Dixon', 33, 'F', '2024-08-15', 'Delhi', 'Hyderabad', 'C5', 40, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Benjamin Dixon', 56, 'F', '2024-02-21', 'Delhi', 'Mumbai', 'D3', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Benjamin Townsend', 11, 'F', '2024-05-12', 'Kolkata', 'Kolkata', 'C3', 29, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Terrance Webster', 117, 'M', '2024-07-07', 'Jaipur', 'Agra', 'C1', 55, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (72, 'Rogelio Jackson', 100, 'F', '2024-03-26', 'Chennai', 'Delhi', 'S10', 12, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Benjamin Delgado', 108, 'F', '2024-09-22', 'Mumbai', 'Jaipur', 'C5', 43, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Linda Love', 103, 'M', '2024-12-09', 'Chennai', 'Mumbai', 'S10', 47, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Kelley Webster', 49, 'F', '2024-11-09', 'Kolkata', 'Chennai', 'B4', 21, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Erika Finch', 41, 'F', '2025-11-09', 'Delhi', 'Chennai', 'A5', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Rogelio Brandt', 46, 'M', '2025-05-30', 'Hyderabad', 'Delhi', 'S6', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (21, 'Benjamin Delgado', 35, 'F', '2025-08-20', 'Jaipur', 'Chennai', 'S10', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Kelley Finch', 55, 'M', '2025-09-04', 'Bangalore', 'Mumbai', 'S9', 21, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (28, 'Terrance Jackson', 19, 'M', '2024-05-30', 'Jaipur', 'Agra', 'C1', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Samantha Love', 84, 'M', '2024-02-09', 'Hyderabad', 'Kolkata', 'C1', 33, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Malcolm Giles', 93, 'M', '2025-10-20', 'Delhi', 'Bangalore', 'S5', 59, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Linda Delgado', 110, 'M', '2024-12-13', 'Chennai', 'Jaipur', 'S6', 61, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Dina Walters', 103, 'F', '2024-01-19', 'Chennai', 'Bangalore', 'B4', 8, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Dina Webster', 115, 'M', '2025-09-26', 'Jaipur', 'Delhi', 'C4', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Dina Webster', 90, 'M', '2024-12-09', 'Kolkata', 'Kolkata', 'S5', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Rogelio Townsend', 90, 'F', '2024-09-04', 'Chennai', 'Chennai', 'B1', 32, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Shannon Walters', 21, 'F', '2025-02-24', 'Mumbai', 'Agra', 'B2', 37, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Dina Brandt', 11, 'F', '2024-09-07', 'Kolkata', 'Bangalore', 'B4', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Shannon Dixon', 77, 'M', '2025-07-10', 'Delhi', 'Kolkata', 'C4', 69, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Rogelio Webster', 82, 'F', '2025-05-09', 'Jaipur', 'Kolkata', 'A5', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Rogelio Delgado', 72, 'F', '2025-11-21', 'Delhi', 'Hyderabad', 'B4', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Terrance Love', 120, 'M', '2024-12-26', 'Mumbai', 'Jaipur', 'S6', 9, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Shannon Giles', 50, 'M', '2025-10-29', 'Delhi', 'Mumbai', 'D5', 12, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Dina Jackson', 25, 'M', '2025-03-08', 'Kolkata', 'Hyderabad', 'S6', 44, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Kelley Delgado', 89, 'F', '2024-07-04', 'Agra', 'Delhi', 'A5', 54, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Terrance Townsend', 13, 'M', '2025-07-02', 'Kolkata', 'Bangalore', 'A4', 5, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Erika Walters', 40, 'M', '2024-11-23', 'Mumbai', 'Delhi', 'A2', 49, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Dina Dixon', 24, 'M', '2025-05-21', 'Chennai', 'Hyderabad', 'S5', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Erika Giles', 21, 'M', '2024-11-26', 'Bangalore', 'Kolkata', 'B5', 30, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Shannon Walters', 80, 'M', '2024-03-13', 'Hyderabad', 'Chennai', 'A5', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Rogelio Giles', 20, 'M', '2025-07-08', 'Agra', 'Jaipur', 'S1', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Kelley Webster', 70, 'M', '2025-04-18', 'Kolkata', 'Bangalore', 'B4', 24, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Erika Delgado', 101, 'F', '2024-07-20', 'Agra', 'Kolkata', 'S2', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Samantha Brandt', 54, 'F', '2025-03-16', 'Chennai', 'Jaipur', 'B1', 74, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (57, 'Shannon Webster', 9, 'M', '2025-10-05', 'Chennai', 'Delhi', 'C1', 68, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (52, 'Linda Dixon', 83, 'M', '2025-12-30', 'Chennai', 'Jaipur', 'B3', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Terrance Giles', 11, 'M', '2024-01-30', 'Chennai', 'Jaipur', 'D4', 42, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Dina Love', 65, 'M', '2025-08-20', 'Mumbai', 'Delhi', 'D2', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Terrance Townsend', 115, 'F', '2024-04-02', 'Kolkata', 'Hyderabad', 'A1', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Samantha Jackson', 109, 'M', '2025-02-20', 'Bangalore', 'Mumbai', 'C2', 46, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Linda Webster', 98, 'M', '2025-05-19', 'Mumbai', 'Agra', 'B5', 67, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Dina Townsend', 106, 'F', '2024-10-10', 'Jaipur', 'Chennai', 'B4', 31, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Benjamin Finch', 110, 'M', '2025-06-18', 'Agra', 'Chennai', 'C4', 12, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Dina Walters', 86, 'M', '2025-04-26', 'Mumbai', 'Kolkata', 'S2', 65, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Kelley Brandt', 11, 'F', '2025-03-23', 'Chennai', 'Agra', 'B5', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Malcolm Dixon', 116, 'M', '2024-07-16', 'Chennai', 'Jaipur', 'S4', 73, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Erika Brandt', 106, 'M', '2024-12-06', 'Hyderabad', 'Bangalore', 'B4', 15, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Linda Townsend', 73, 'F', '2024-04-03', 'Delhi', 'Delhi', 'S9', 33, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Kelley Giles', 11, 'F', '2025-01-01', 'Delhi', 'Kolkata', 'D3', 20, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Rogelio Giles', 1, 'M', '2025-10-26', 'Hyderabad', 'Kolkata', 'S3', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Shannon Finch', 19, 'M', '2025-01-15', 'Jaipur', 'Agra', 'S5', 11, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Dina Dixon', 68, 'M', '2024-09-24', 'Delhi', 'Hyderabad', 'A1', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Malcolm Delgado', 106, 'M', '2024-10-13', 'Bangalore', 'Delhi', 'B1', 57, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Terrance Webster', 46, 'M', '2025-08-28', 'Delhi', 'Chennai', 'S1', 19, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Malcolm Webster', 14, 'M', '2025-07-06', 'Jaipur', 'Kolkata', 'D2', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Erika Dixon', 60, 'M', '2024-05-23', 'Delhi', 'Jaipur', 'S2', 6, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Linda Townsend', 32, 'F', '2025-12-29', 'Kolkata', 'Kolkata', 'S1', 37, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Dina Dixon', 98, 'F', '2024-05-25', 'Bangalore', 'Jaipur', 'A5', 67, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Rogelio Townsend', 80, 'M', '2024-11-14', 'Delhi', 'Chennai', 'D2', 31, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (99, 'Linda Brandt', 117, 'M', '2025-07-18', 'Jaipur', 'Kolkata', 'B2', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Rogelio Delgado', 86, 'M', '2024-05-27', 'Hyderabad', 'Bangalore', 'A2', 35, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Samantha Love', 40, 'F', '2024-07-01', 'Hyderabad', 'Jaipur', 'D1', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Malcolm Walters', 96, 'F', '2025-10-11', 'Mumbai', 'Kolkata', 'B4', 15, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Kelley Jackson', 11, 'F', '2024-07-08', 'Kolkata', 'Mumbai', 'B5', 21, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Benjamin Brandt', 116, 'F', '2025-08-31', 'Bangalore', 'Hyderabad', 'B1', 16, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Erika Brandt', 51, 'M', '2024-05-15', 'Kolkata', 'Mumbai', 'A3', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Kelley Finch', 27, 'F', '2024-12-07', 'Delhi', 'Kolkata', 'D3', 41, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Dina Townsend', 16, 'M', '2024-07-01', 'Agra', 'Bangalore', 'C1', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (77, 'Shannon Townsend', 97, 'F', '2025-08-27', 'Kolkata', 'Chennai', 'S7', 29, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Rogelio Townsend', 14, 'F', '2024-05-17', 'Chennai', 'Bangalore', 'D5', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Dina Jackson', 92, 'M', '2025-08-08', 'Mumbai', 'Bangalore', 'S10', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Erika Townsend', 106, 'M', '2024-03-04', 'Mumbai', 'Agra', 'A3', 42, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Rogelio Dixon', 89, 'F', '2025-10-03', 'Jaipur', 'Kolkata', 'S1', 61, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Kelley Dixon', 79, 'M', '2024-12-20', 'Bangalore', 'Mumbai', 'C4', 27, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Samantha Townsend', 28, 'F', '2024-03-04', 'Kolkata', 'Jaipur', 'S8', 20, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Kelley Townsend', 4, 'M', '2024-02-08', 'Bangalore', 'Chennai', 'S10', 69, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Samantha Townsend', 30, 'F', '2025-08-15', 'Delhi', 'Jaipur', 'A2', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Dina Townsend', 72, 'M', '2024-06-16', 'Jaipur', 'Kolkata', 'S5', 45, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Samantha Brandt', 102, 'M', '2024-05-08', 'Delhi', 'Delhi', 'B1', 11, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Terrance Townsend', 105, 'F', '2025-10-03', 'Bangalore', 'Chennai', 'C5', 5, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Malcolm Delgado', 10, 'M', '2025-06-25', 'Mumbai', 'Jaipur', 'B2', 40, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Terrance Giles', 80, 'F', '2025-04-14', 'Mumbai', 'Kolkata', 'D5', 25, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Erika Brandt', 18, 'M', '2024-09-30', 'Delhi', 'Kolkata', 'C4', 19, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Malcolm Love', 80, 'F', '2025-04-30', 'Hyderabad', 'Jaipur', 'C5', 54, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Terrance Walters', 19, 'M', '2025-04-20', 'Jaipur', 'Jaipur', 'S2', 39, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Shannon Brandt', 53, 'M', '2024-06-09', 'Delhi', 'Bangalore', 'S4', 70, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Rogelio Jackson', 80, 'F', '2024-09-02', 'Delhi', 'Mumbai', 'C2', 41, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (100, 'Dina Webster', 107, 'M', '2024-08-02', 'Hyderabad', 'Delhi', 'S10', 22, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Malcolm Dixon', 59, 'M', '2025-05-21', 'Jaipur', 'Mumbai', 'C3', 25, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Erika Dixon', 47, 'F', '2024-07-15', 'Kolkata', 'Mumbai', 'S5', 8, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Terrance Finch', 65, 'F', '2024-02-10', 'Jaipur', 'Hyderabad', 'A3', 61, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Terrance Walters', 88, 'F', '2025-07-31', 'Delhi', 'Chennai', 'A1', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Kelley Walters', 62, 'F', '2025-01-24', 'Hyderabad', 'Mumbai', 'S6', 15, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Malcolm Finch', 56, 'M', '2025-04-29', 'Chennai', 'Agra', 'B1', 31, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Linda Walters', 61, 'F', '2025-02-25', 'Kolkata', 'Bangalore', 'B3', 71, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Malcolm Jackson', 118, 'M', '2025-09-01', 'Chennai', 'Delhi', 'B3', 72, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Erika Townsend', 93, 'F', '2025-02-24', 'Kolkata', 'Kolkata', 'C2', 11, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Terrance Giles', 81, 'M', '2024-02-26', 'Bangalore', 'Bangalore', 'D4', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Linda Love', 69, 'F', '2024-09-28', 'Hyderabad', 'Bangalore', 'C2', 75, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (93, 'Dina Townsend', 18, 'F', '2025-10-30', 'Bangalore', 'Bangalore', 'C4', 34, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Erika Jackson', 61, 'F', '2024-12-29', 'Chennai', 'Kolkata', 'A1', 34, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Erika Love', 44, 'M', '2025-01-03', 'Delhi', 'Kolkata', 'C2', 11, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Erika Delgado', 54, 'M', '2025-06-05', 'Hyderabad', 'Agra', 'S5', 52, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Linda Webster', 103, 'M', '2024-11-10', 'Jaipur', 'Delhi', 'S4', 57, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Samantha Walters', 100, 'M', '2025-02-13', 'Jaipur', 'Jaipur', 'B5', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Terrance Dixon', 40, 'F', '2025-03-31', 'Mumbai', 'Delhi', 'S4', 11, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Kelley Walters', 28, 'F', '2025-12-09', 'Delhi', 'Bangalore', 'A5', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Benjamin Brandt', 119, 'M', '2024-06-05', 'Kolkata', 'Agra', 'A5', 46, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Erika Delgado', 90, 'F', '2024-09-22', 'Mumbai', 'Hyderabad', 'C2', 38, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Rogelio Love', 80, 'F', '2025-12-14', 'Kolkata', 'Bangalore', 'C1', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Dina Delgado', 10, 'F', '2024-06-11', 'Kolkata', 'Jaipur', 'B2', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Malcolm Webster', 25, 'M', '2025-10-05', 'Bangalore', 'Kolkata', 'B5', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (69, 'Terrance Delgado', 90, 'F', '2024-04-17', 'Mumbai', 'Bangalore', 'S6', 31, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Terrance Giles', 74, 'M', '2025-06-15', 'Bangalore', 'Kolkata', 'S6', 62, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Rogelio Finch', 54, 'M', '2025-12-18', 'Jaipur', 'Jaipur', 'B4', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Samantha Brandt', 53, 'M', '2024-10-19', 'Chennai', 'Agra', 'A5', 58, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Shannon Webster', 94, 'F', '2024-08-02', 'Delhi', 'Agra', 'C2', 44, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Linda Townsend', 109, 'M', '2024-11-21', 'Jaipur', 'Kolkata', 'A4', 30, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Shannon Finch', 33, 'F', '2024-09-23', 'Delhi', 'Jaipur', 'S7', 42, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (85, 'Rogelio Delgado', 59, 'F', '2025-09-03', 'Agra', 'Agra', 'A5', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Benjamin Jackson', 69, 'F', '2025-05-22', 'Jaipur', 'Bangalore', 'S4', 13, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Shannon Love', 98, 'M', '2025-01-01', 'Jaipur', 'Delhi', 'C5', 26, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (97, 'Kelley Walters', 49, 'F', '2024-05-09', 'Mumbai', 'Mumbai', 'D4', 37, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Erika Walters', 38, 'M', '2025-03-12', 'Agra', 'Kolkata', 'C5', 38, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Malcolm Love', 100, 'M', '2024-12-15', 'Agra', 'Delhi', 'B2', 36, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Malcolm Townsend', 41, 'M', '2025-04-05', 'Agra', 'Jaipur', 'S3', 63, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Kelley Finch', 14, 'F', '2024-06-26', 'Chennai', 'Bangalore', 'A3', 62, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Rogelio Giles', 107, 'M', '2025-07-18', 'Jaipur', 'Kolkata', 'S2', 43, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Erika Webster', 101, 'M', '2025-10-29', 'Agra', 'Mumbai', 'B5', 27, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Rogelio Townsend', 54, 'F', '2025-12-19', 'Jaipur', 'Hyderabad', 'S8', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (56, 'Terrance Finch', 59, 'F', '2025-06-27', 'Mumbai', 'Delhi', 'C4', 2, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Kelley Jackson', 14, 'F', '2024-06-03', 'Bangalore', 'Kolkata', 'S7', 30, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Samantha Delgado', 53, 'M', '2025-01-09', 'Kolkata', 'Delhi', 'B2', 60, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Malcolm Jackson', 104, 'M', '2024-11-25', 'Bangalore', 'Kolkata', 'S2', 25, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Benjamin Delgado', 33, 'M', '2025-08-25', 'Bangalore', 'Jaipur', 'S4', 46, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Samantha Giles', 85, 'M', '2024-02-14', 'Bangalore', 'Jaipur', 'S3', 34, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Kelley Delgado', 21, 'F', '2025-08-19', 'Jaipur', 'Bangalore', 'S1', 7, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Dina Brandt', 70, 'M', '2025-03-31', 'Bangalore', 'Hyderabad', 'A3', 30, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (39, 'Samantha Jackson', 46, 'M', '2025-12-23', 'Bangalore', 'Bangalore', 'C2', 11, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (22, 'Malcolm Giles', 44, 'F', '2025-07-26', 'Delhi', 'Delhi', 'C5', 56, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Kelley Brandt', 17, 'F', '2025-03-25', 'Jaipur', 'Kolkata', 'C2', 69, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Malcolm Webster', 60, 'F', '2025-12-07', 'Hyderabad', 'Hyderabad', 'D4', 30, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Dina Finch', 16, 'F', '2024-12-25', 'Delhi', 'Kolkata', 'C2', 75, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Terrance Webster', 7, 'M', '2025-10-13', 'Agra', 'Jaipur', 'S10', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Erika Jackson', 108, 'F', '2025-08-22', 'Jaipur', 'Hyderabad', 'A4', 11, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Erika Dixon', 50, 'M', '2024-08-08', 'Hyderabad', 'Kolkata', 'D4', 33, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Linda Walters', 97, 'F', '2025-12-02', 'Chennai', 'Jaipur', 'S10', 35, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (91, 'Terrance Delgado', 99, 'M', '2025-02-18', 'Mumbai', 'Bangalore', 'S3', 41, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Benjamin Delgado', 19, 'F', '2024-09-15', 'Bangalore', 'Mumbai', 'B1', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Terrance Dixon', 19, 'F', '2025-03-08', 'Jaipur', 'Kolkata', 'S4', 71, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Kelley Walters', 109, 'F', '2025-12-02', 'Mumbai', 'Delhi', 'D1', 61, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (83, 'Shannon Dixon', 120, 'F', '2024-12-21', 'Chennai', 'Kolkata', 'C4', 39, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (27, 'Kelley Walters', 66, 'F', '2024-06-03', 'Chennai', 'Bangalore', 'S7', 60, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Terrance Giles', 9, 'F', '2025-05-29', 'Hyderabad', 'Chennai', 'C4', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (42, 'Dina Finch', 64, 'F', '2025-03-25', 'Kolkata', 'Jaipur', 'S1', 41, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Shannon Webster', 71, 'F', '2024-10-20', 'Kolkata', 'Kolkata', 'C3', 5, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Malcolm Dixon', 75, 'M', '2025-06-18', 'Mumbai', 'Hyderabad', 'S10', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (29, 'Benjamin Walters', 38, 'M', '2025-10-30', 'Delhi', 'Kolkata', 'A1', 64, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (78, 'Kelley Walters', 13, 'F', '2024-09-12', 'Bangalore', 'Agra', 'A3', 32, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Rogelio Walters', 120, 'M', '2024-05-11', 'Jaipur', 'Chennai', 'S7', 17, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Dina Delgado', 53, 'F', '2025-02-03', 'Hyderabad', 'Jaipur', 'A4', 25, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (68, 'Benjamin Finch', 34, 'M', '2025-08-23', 'Delhi', 'Delhi', 'S5', 36, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Shannon Townsend', 85, 'M', '2025-07-05', 'Kolkata', 'Delhi', 'B3', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (43, 'Samantha Jackson', 39, 'F', '2024-04-04', 'Kolkata', 'Agra', 'D3', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Malcolm Brandt', 17, 'M', '2024-10-11', 'Bangalore', 'Jaipur', 'D4', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Linda Brandt', 110, 'F', '2025-04-24', 'Jaipur', 'Mumbai', 'S5', 74, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Kelley Jackson', 26, 'F', '2024-08-27', 'Hyderabad', 'Chennai', 'S4', 1, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Linda Walters', 86, 'M', '2024-02-25', 'Chennai', 'Agra', 'D1', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Terrance Love', 60, 'F', '2025-12-24', 'Agra', 'Hyderabad', 'A4', 68, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (80, 'Dina Jackson', 105, 'F', '2025-07-24', 'Agra', 'Chennai', 'D5', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Shannon Love', 117, 'M', '2025-03-02', 'Kolkata', 'Mumbai', 'D3', 66, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (47, 'Samantha Giles', 115, 'F', '2024-12-13', 'Bangalore', 'Delhi', 'A5', 47, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Erika Finch', 91, 'F', '2025-03-05', 'Delhi', 'Mumbai', 'A3', 28, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (73, 'Benjamin Finch', 62, 'F', '2024-06-02', 'Kolkata', 'Jaipur', 'A2', 66, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (36, 'Benjamin Brandt', 17, 'M', '2024-12-28', 'Kolkata', 'Kolkata', 'S10', 70, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (94, 'Malcolm Jackson', 24, 'F', '2025-09-14', 'Bangalore', 'Chennai', 'A4', 22, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (13, 'Terrance Walters', 7, 'F', '2025-09-20', 'Bangalore', 'Kolkata', 'D5', 10, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Dina Brandt', 92, 'M', '2024-08-12', 'Kolkata', 'Delhi', 'A3', 19, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Malcolm Jackson', 52, 'M', '2024-11-10', 'Delhi', 'Jaipur', 'B5', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (90, 'Samantha Webster', 63, 'M', '2024-05-03', 'Chennai', 'Chennai', 'C4', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Erika Love', 8, 'M', '2025-09-23', 'Bangalore', 'Mumbai', 'C4', 38, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (31, 'Benjamin Townsend', 85, 'M', '2024-07-28', 'Hyderabad', 'Chennai', 'S10', 10, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (38, 'Terrance Love', 36, 'M', '2024-12-15', 'Delhi', 'Mumbai', 'S5', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (58, 'Benjamin Webster', 87, 'F', '2024-11-11', 'Mumbai', 'Hyderabad', 'B2', 31, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Dina Dixon', 73, 'M', '2025-06-15', 'Chennai', 'Jaipur', 'S2', 1, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Benjamin Walters', 68, 'M', '2024-06-18', 'Hyderabad', 'Agra', 'C5', 20, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Shannon Finch', 83, 'M', '2024-07-19', 'Jaipur', 'Delhi', 'B3', 60, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Erika Brandt', 53, 'F', '2025-09-06', 'Mumbai', 'Hyderabad', 'S4', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Malcolm Delgado', 59, 'M', '2024-08-23', 'Bangalore', 'Mumbai', 'B5', 71, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (55, 'Rogelio Giles', 19, 'M', '2025-08-09', 'Kolkata', 'Delhi', 'D1', 51, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (2, 'Linda Webster', 100, 'F', '2025-10-28', 'Kolkata', 'Bangalore', 'S3', 68, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (71, 'Terrance Finch', 70, 'M', '2024-01-29', 'Agra', 'Bangalore', 'A2', 10, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Malcolm Jackson', 100, 'F', '2024-07-28', 'Bangalore', 'Jaipur', 'S9', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Samantha Webster', 25, 'M', '2025-07-15', 'Hyderabad', 'Chennai', 'C4', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Samantha Dixon', 99, 'F', '2025-08-08', 'Agra', 'Agra', 'A3', 43, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Dina Giles', 18, 'M', '2024-08-19', 'Jaipur', 'Mumbai', 'B2', 12, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (20, 'Malcolm Love', 98, 'F', '2024-02-28', 'Bangalore', 'Agra', 'D1', 5, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (18, 'Samantha Webster', 91, 'F', '2024-09-18', 'Hyderabad', 'Chennai', 'S7', 15, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Linda Love', 92, 'M', '2025-04-01', 'Bangalore', 'Hyderabad', 'A1', 67, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (37, 'Terrance Jackson', 98, 'F', '2025-02-22', 'Bangalore', 'Kolkata', 'C3', 2, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (40, 'Samantha Townsend', 79, 'F', '2025-09-29', 'Agra', 'Agra', 'S5', 50, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (92, 'Rogelio Jackson', 112, 'M', '2025-12-19', 'Bangalore', 'Hyderabad', 'C4', 33, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Erika Dixon', 51, 'F', '2024-02-02', 'Chennai', 'Hyderabad', 'S4', 43, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Shannon Brandt', 55, 'F', '2025-07-06', 'Delhi', 'Bangalore', 'B5', 19, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Shannon Giles', 36, 'F', '2025-04-04', 'Chennai', 'Delhi', 'S5', 9, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (35, 'Linda Townsend', 78, 'M', '2025-09-09', 'Mumbai', 'Agra', 'A3', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Erika Townsend', 17, 'F', '2025-04-11', 'Jaipur', 'Jaipur', 'D4', 7, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Erika Delgado', 53, 'F', '2025-11-23', 'Agra', 'Bangalore', 'C4', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (95, 'Samantha Delgado', 116, 'F', '2024-09-02', 'Mumbai', 'Mumbai', 'B1', 68, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Kelley Delgado', 20, 'M', '2024-06-19', 'Mumbai', 'Delhi', 'D4', 73, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Benjamin Walters', 120, 'M', '2025-09-10', 'Delhi', 'Chennai', 'B2', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (89, 'Dina Jackson', 68, 'M', '2025-07-01', 'Bangalore', 'Delhi', 'C3', 74, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Linda Walters', 119, 'M', '2024-03-02', 'Bangalore', 'Delhi', 'S1', 72, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Rogelio Love', 74, 'M', '2024-08-15', 'Hyderabad', 'Hyderabad', 'S10', 30, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (61, 'Samantha Giles', 35, 'M', '2025-06-09', 'Kolkata', 'Agra', 'A3', 39, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (81, 'Dina Walters', 105, 'M', '2024-05-23', 'Agra', 'Mumbai', 'S9', 35, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Samantha Brandt', 103, 'M', '2024-11-10', 'Kolkata', 'Mumbai', 'S5', 9, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (30, 'Kelley Webster', 117, 'F', '2025-01-10', 'Hyderabad', 'Hyderabad', 'C5', 19, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (50, 'Benjamin Townsend', 60, 'M', '2025-05-08', 'Jaipur', 'Kolkata', 'A4', 73, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (76, 'Terrance Dixon', 50, 'M', '2024-12-22', 'Kolkata', 'Bangalore', 'A4', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (70, 'Samantha Webster', 101, 'F', '2024-11-20', 'Delhi', 'Delhi', 'S4', 31, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (12, 'Rogelio Delgado', 25, 'M', '2024-07-28', 'Jaipur', 'Hyderabad', 'A4', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Benjamin Giles', 96, 'F', '2025-05-04', 'Delhi', 'Delhi', 'S10', 44, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Rogelio Finch', 41, 'M', '2024-03-27', 'Agra', 'Agra', 'S5', 38, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (7, 'Benjamin Dixon', 60, 'M', '2024-02-10', 'Mumbai', 'Chennai', 'A4', 7, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Kelley Webster', 37, 'M', '2024-05-11', 'Bangalore', 'Agra', 'D4', 32, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (67, 'Terrance Dixon', 53, 'F', '2024-11-09', 'Chennai', 'Mumbai', 'S8', 72, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (19, 'Malcolm Townsend', 78, 'F', '2024-10-08', 'Hyderabad', 'Jaipur', 'B5', 38, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (17, 'Shannon Love', 29, 'M', '2024-03-30', 'Kolkata', 'Kolkata', 'A2', 53, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (25, 'Benjamin Walters', 40, 'F', '2025-03-29', 'Kolkata', 'Mumbai', 'C2', 35, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (64, 'Malcolm Walters', 13, 'M', '2024-06-28', 'Agra', 'Kolkata', 'S3', 15, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (33, 'Shannon Giles', 48, 'F', '2025-06-20', 'Chennai', 'Jaipur', 'D4', 20, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Kelley Brandt', 95, 'M', '2025-01-16', 'Mumbai', 'Chennai', 'S10', 1, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (48, 'Kelley Jackson', 34, 'M', '2025-07-10', 'Hyderabad', 'Jaipur', 'S1', 13, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Rogelio Giles', 53, 'M', '2025-02-01', 'Bangalore', 'Kolkata', 'B1', 4, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (24, 'Benjamin Webster', 55, 'M', '2025-11-19', 'Kolkata', 'Jaipur', 'C2', 9, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Shannon Dixon', 63, 'F', '2025-01-18', 'Kolkata', 'Kolkata', 'B4', 8, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Shannon Walters', 29, 'F', '2025-10-16', 'Mumbai', 'Delhi', 'D4', 49, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Erika Townsend', 15, 'M', '2024-03-23', 'Mumbai', 'Hyderabad', 'D1', 1, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (10, 'Erika Giles', 58, 'F', '2025-03-25', 'Delhi', 'Hyderabad', 'D2', 71, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (32, 'Dina Finch', 11, 'F', '2024-08-18', 'Hyderabad', 'Agra', 'B4', 14, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (4, 'Dina Brandt', 34, 'F', '2024-01-13', 'Mumbai', 'Kolkata', 'D5', 44, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (62, 'Terrance Walters', 77, 'M', '2025-10-01', 'Bangalore', 'Delhi', 'A2', 61, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (74, 'Samantha Finch', 11, 'M', '2024-05-11', 'Agra', 'Kolkata', 'D5', 42, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Terrance Finch', 22, 'M', '2024-04-06', 'Hyderabad', 'Jaipur', 'D1', 58, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (96, 'Dina Dixon', 104, 'F', '2024-08-13', 'Mumbai', 'Kolkata', 'D1', 14, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (82, 'Malcolm Giles', 24, 'F', '2024-10-05', 'Chennai', 'Mumbai', 'C2', 23, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (84, 'Kelley Delgado', 35, 'F', '2025-10-19', 'Hyderabad', 'Mumbai', 'B2', 62, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Terrance Delgado', 35, 'M', '2024-12-10', 'Kolkata', 'Hyderabad', 'A5', 13, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (79, 'Rogelio Walters', 2, 'M', '2025-07-22', 'Mumbai', 'Bangalore', 'A4', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (6, 'Kelley Jackson', 40, 'F', '2024-12-09', 'Kolkata', 'Chennai', 'D4', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Samantha Brandt', 26, 'M', '2025-09-24', 'Delhi', 'Delhi', 'B2', 59, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (98, 'Malcolm Finch', 105, 'F', '2025-01-17', 'Mumbai', 'Bangalore', 'S9', 58, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (14, 'Rogelio Townsend', 99, 'F', '2025-05-05', 'Delhi', 'Chennai', 'D4', 23, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Dina Dixon', 69, 'M', '2024-03-07', 'Kolkata', 'Chennai', 'B4', 26, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (9, 'Benjamin Jackson', 31, 'F', '2024-11-12', 'Mumbai', 'Mumbai', 'C2', 13, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (66, 'Dina Dixon', 81, 'M', '2025-05-25', 'Jaipur', 'Chennai', 'B3', 64, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Erika Townsend', 11, 'F', '2025-05-16', 'Delhi', 'Agra', 'B1', 55, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (86, 'Kelley Dixon', 118, 'M', '2024-06-17', 'Chennai', 'Agra', 'A4', 51, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (26, 'Kelley Finch', 4, 'M', '2025-10-08', 'Bangalore', 'Agra', 'C2', 48, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (54, 'Kelley Dixon', 1, 'F', '2025-10-14', 'Chennai', 'Mumbai', 'C3', 66, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (3, 'Malcolm Delgado', 46, 'M', '2024-11-21', 'Bangalore', 'Delhi', 'S10', 49, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (45, 'Terrance Jackson', 75, 'M', '2024-02-26', 'Agra', 'Kolkata', 'C3', 7, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (53, 'Linda Giles', 88, 'F', '2024-09-29', 'Chennai', 'Mumbai', 'C3', 48, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (51, 'Shannon Walters', 73, 'M', '2025-06-17', 'Bangalore', 'Agra', 'C3', 14, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (44, 'Malcolm Brandt', 104, 'M', '2025-05-14', 'Bangalore', 'Kolkata', 'D5', 20, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (8, 'Benjamin Giles', 61, 'M', '2024-04-13', 'Jaipur', 'Agra', 'S1', 16, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (34, 'Dina Love', 19, 'F', '2025-11-02', 'Hyderabad', 'Bangalore', 'B4', 48, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (87, 'Malcolm Delgado', 111, 'M', '2025-08-08', 'Mumbai', 'Agra', 'B2', 31, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (1, 'Erika Townsend', 66, 'F', '2025-02-22', 'Kolkata', 'Chennai', 'A1', 59, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (65, 'Kelley Jackson', 33, 'F', '2024-07-25', 'Mumbai', 'Chennai', 'S3', 21, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (41, 'Malcolm Giles', 73, 'M', '2024-11-27', 'Mumbai', 'Bangalore', 'C5', 2, 'WAT');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (46, 'Samantha Delgado', 111, 'M', '2024-09-23', 'Kolkata', 'Delhi', 'D3', 65, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (11, 'Erika Delgado', 110, 'F', '2025-02-07', 'Agra', 'Delhi', 'A4', 4, 'CNF');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (16, 'Shannon Walters', 109, 'M', '2024-08-20', 'Hyderabad', 'Agra', 'D4', 21, 'CNC');
INSERT INTO booking_details (train_id, passenger_full_name, age, sex, travel_date, boarding_station_name, destination_station_name, coach_name, seat_number, booking_status)
VALUES (63, 'Malcolm Dixon', 70, 'F', '2024-05-16', 'Bangalore', 'Agra', 'S4', 60, 'WAT');
