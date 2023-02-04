-- MEDICAL CENTER SCHEMA DESIGN. I VERIFIED THESE ALL WORKED IN MY TERMINAL. 

CREATE DATABASE medical_center:

\c medical_center


CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    dr_name TEXT,
    specialty TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE sickness (
    id SERIAL PRIMARY KEY,
    diagnoses TEXT,
    symptoms TEXT,
    recovery_time TEXT
);

CREATE TABLE schedule (
    time_slot SERIAL,
    patient_id INT REFERENCES patients,
    dr_id INT REFERENCES doctor,
    sickness INT REFERENCES sickness
);


CREATE DATABASE craigslist:

\c craigslist

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name TEXT,
    first_name TEXT,
    last_name TEXT,
    region TEXT
)


CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    categories TEXT,
    user_name TEXT REFERENCES users,
    region TEXT REFERENCES users
);

CREATE DATABASE soccer:

\c soccer

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    team TEXT,
    goals_scored INT
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team TEXT,
    home_team_score INT,
    home_team_win BOOLEAN,
    away_team TEXT,
    away_team_score INT,
    away_team_win BOOLEAN,
    ref TEXT,
    match_date DATE
);

CREATE TABLE league (
    team_id SERIAL PRIMARY KEY,
    team_name TEXT,
    goals_scored INT REFERENCES players,
    games_won INT REFERENCES matches,
    games_lost INT REFERENCES matches,
    ranks INT REFERENCES matches
);