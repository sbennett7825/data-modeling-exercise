DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passenger (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE airlines (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE routes (
    id SERIAL PRIMARY KEY,
    from_city INTEGER,
    to_city INTEGER,
    FOREIGN KEY (from_city) REFERENCES cities(id) ON DELETE CASCADE,
    FOREIGN KEY (to_city) REFERENCES cities(id) ON DELETE CASCADE
);

CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    route_id INTEGER,
    airline_id INTEGER,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    FOREIGN KEY (route_id) REFERENCES routes(id) ON DELETE CASCADE,
    FOREIGN KEY (airline_id) REFERENCES airlines(id) ON DELETE CASCADE
);

CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    passenger_id INTEGER,
    flight_id INTEGER,
    seat TEXT NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES passenger(id) ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(id) ON DELETE CASCADE
);

INSERT INTO countries (name) VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities (name, country_id) VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Tokyo', 2),
  ('London', 3),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('Paris', 4),
  ('Casablanca', 5),
  ('Dubai', 6),
  ('Beijing', 7),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('Sao Paolo', 8),
  ('Santiago', 9);

INSERT INTO airlines (name) VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO routes (from_city, to_city) VALUES
  (1, 2),  -- Washington DC to Seattle
  (3, 4),  -- Tokyo to London
  (5, 6),  -- Los Angeles to Las Vegas
  (7, 8),  -- Paris to Casablanca
  (9, 10); -- Dubai to Beijing

INSERT INTO flights (route_id, airline_id, departure, arrival) VALUES
  (1, 1, '2018-04-08 09:00:00', '2018-04-08 12:00:00'),  -- Flight from Washington DC to Seattle
  (2, 2, '2018-12-19 12:45:00', '2018-12-19 16:15:00'),  -- Flight from Tokyo to London
  (3, 3, '2018-01-02 07:00:00', '2018-01-02 08:03:00'),  -- Flight from Los Angeles to Las Vegas
  (4, 4, '2018-08-01 18:30:00', '2018-08-01 21:50:00'),  -- Flight from Paris to Casablanca
  (5, 5, '2018-10-31 01:15:00', '2018-10-31 12:55:00');  -- Flight from Dubai to Beijing

INSERT INTO passenger (first_name, last_name) VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Cory', 'Squibbes');

INSERT INTO tickets (passenger_id, flight_id, seat) VALUES
  (1, 1, '33B'),  -- Jennifer Finch on Flight 1
  (2, 2, '8A'),   -- Thadeus Gathercoal on Flight 2
  (3, 3, '12F'),  -- Sonja Pauley on Flight 3
  (1, 4, '20A'),  -- Jennifer Finch on Flight 4
  (4, 5, '23D');  -- Waneta Skeleton on Flight 5