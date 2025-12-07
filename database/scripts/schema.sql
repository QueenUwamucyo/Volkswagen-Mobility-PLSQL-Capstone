CREATE TABLE Customers (
  customer_id NUMBER PRIMARY KEY,
  name VARCHAR2(100),
  email VARCHAR2(100),
  phone VARCHAR2(30),
  membership_type VARCHAR2(20)
);

CREATE TABLE Vehicles (
  vehicle_id NUMBER PRIMARY KEY,
  model VARCHAR2(100),
  plate_number VARCHAR2(20),
  status VARCHAR2(20)
);

CREATE TABLE Drivers (
  driver_id NUMBER PRIMARY KEY,
  name VARCHAR2(100),
  license_number VARCHAR2(50)
);

CREATE TABLE Trips (
  trip_id NUMBER PRIMARY KEY,
  vehicle_id NUMBER REFERENCES Vehicles(vehicle_id),
  driver_id NUMBER REFERENCES Drivers(driver_id),
  customer_id NUMBER REFERENCES Customers(customer_id),
  start_time DATE,
  end_time DATE,
  distance_km NUMBER,
  fare NUMBER
);

CREATE TABLE Payments (
  payment_id NUMBER PRIMARY KEY,
  trip_id NUMBER REFERENCES Trips(trip_id),
  amount NUMBER,
  payment_method VARCHAR2(20),
  timestamp DATE
);

CREATE TABLE Maintenance (
  maint_id NUMBER PRIMARY KEY,
  vehicle_id NUMBER REFERENCES Vehicles(vehicle_id),
  service_date DATE,
  cost NUMBER,
  details VARCHAR2(200)
);

CREATE SEQUENCE trips_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE payments_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE maint_seq START WITH 1 INCREMENT BY 1;
