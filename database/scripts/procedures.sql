CREATE OR REPLACE PROCEDURE create_trip(
  p_vehicle IN NUMBER,
  p_driver IN NUMBER,
  p_customer IN NUMBER,
  p_distance IN NUMBER,
  p_id OUT NUMBER
) AS
BEGIN
  p_id := trips_seq.NEXTVAL;

  INSERT INTO Trips(trip_id, vehicle_id, driver_id, customer_id, start_time, distance_km)
  VALUES (p_id, p_vehicle, p_driver, p_customer, SYSDATE, p_distance);

  COMMIT;
END;
/
  
CREATE OR REPLACE PROCEDURE close_trip(
  p_id IN NUMBER
) AS
  v_fare NUMBER;
BEGIN
  SELECT distance_km * 680 INTO v_fare
  FROM Trips WHERE trip_id = p_id;

  UPDATE Trips
  SET end_time = SYSDATE,
      fare = v_fare
  WHERE trip_id = p_id;

  INSERT INTO Payments(payment_id, trip_id, amount, payment_method, timestamp)
  VALUES (payments_seq.NEXTVAL, p_id, v_fare, 'Card', SYSDATE);

  COMMIT;
END;
/
