CREATE OR REPLACE PACKAGE mobility_pkg AS
  FUNCTION calculate_fare(p_distance NUMBER) RETURN NUMBER;
  FUNCTION check_vehicle_available(p_vehicle_id NUMBER) RETURN NUMBER;
  FUNCTION customer_discount(p_customer_id NUMBER) RETURN NUMBER;

  PROCEDURE add_trip(
    p_vehicle_id IN NUMBER,
    p_driver_id IN NUMBER,
    p_customer_id IN NUMBER,
    p_distance_km IN NUMBER
  );

  PROCEDURE record_payment(
    p_trip_id IN NUMBER,
    p_method IN VARCHAR2
  );

  PROCEDURE record_maintenance(
    p_vehicle_id IN NUMBER,
    p_cost IN NUMBER,
    p_details IN VARCHAR2
  );
END mobility_pkg;
/
