-- Drop the database if it exists and create a new one
DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;

-- Connect to the new database
\c outer_space

-- Create the tables
CREATE TABLE galaxies (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE planets (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    orbits_around TEXT NOT NULL,
    galaxy_id INTEGER,
    FOREIGN KEY (galaxy_id) REFERENCES galaxies(id) ON DELETE CASCADE
);

CREATE TABLE moons (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    planet_id INTEGER,
    galaxy_id INTEGER,
    FOREIGN KEY (planet_id) REFERENCES planets(id) ON DELETE CASCADE,
    FOREIGN KEY (galaxy_id) REFERENCES galaxies(id) ON DELETE CASCADE
);

-- Insert galaxy information
INSERT INTO galaxies (name) VALUES
  ('Milky Way'),
  ('Proxima Centauri');

-- Insert planet information
INSERT INTO planets (name, orbital_period_in_years, orbits_around, galaxy_id) VALUES
  ('Earth', 1.00, 'The Sun', 1),  -- Milky Way
  ('Mars', 1.88, 'The Sun', 1),   -- Milky Way
  ('Venus', 0.62, 'The Sun', 1),  -- Milky Way
  ('Neptune', 164.8, 'The Sun', 1), -- Milky Way
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 2), -- Proxima Centauri
  ('Gliese 876 b', 0.23, 'Gliese 876', 1); -- Milky Way

-- Insert moon information
INSERT INTO moons (name, planet_id, galaxy_id) VALUES
  ('The Moon', 1, 1),  -- Moon of Earth
  ('Phobos', 2, 1),    -- Moon of Mars
  ('Deimos', 2, 1),    -- Moon of Mars
  ('Naiad', 4, 1),     -- Moon of Neptune
  ('Thalassa', 4, 1),  -- Moon of Neptune
  ('Despina', 4, 1),   -- Moon of Neptune
  ('Galatea', 4, 1),   -- Moon of Neptune
  ('Larissa', 4, 1),   -- Moon of Neptune
  ('S/2004 N 1', 4, 1),-- Moon of Neptune
  ('Proteus', 4, 1),   -- Moon of Neptune
  ('Triton', 4, 1),    -- Moon of Neptune
  ('Nereid', 4, 1),    -- Moon of Neptune
  ('Halimede', 4, 1),   -- Moon of Neptune
  ('Sao', 4, 1),       -- Moon of Neptune
  ('Laomedeia', 4, 1), -- Moon of Neptune
  ('Psamathe', 4, 1),  -- Moon of Neptune
  ('Neso', 4, 1);      -- Moon of Neptune