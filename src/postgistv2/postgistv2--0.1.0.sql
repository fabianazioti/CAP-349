--
-- Complain if script is sourced in psql, rather than via CREATE EXTENSION
--
\echo Use "CREATE EXTENSION postgistv2" to load this file. \quit


----------------------------------------
----------------------------------------
-- Introduces the trajectory_elem Data Type --
----------------------------------------
----------------------------------------

/*DROP TYPE IF EXISTS trajectory_elem;
CREATE TYPE trajectory_elem;*/

--
-- trajectory_elem Input/Output Functions
--


CREATE OR REPLACE FUNCTION trajectory_elem(geometry)
    RETURNS cstring
    AS 'MODULE_PATHNAME', 'trajectory_elem'
    LANGUAGE C IMMUTABLE STRICT;
