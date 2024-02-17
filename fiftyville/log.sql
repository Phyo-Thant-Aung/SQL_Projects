--Keep a log of any SQL queries you execute as you solve the mystery.
-- to read the crime scene report: SELECT * FROM crime_scene_reports WHERE year = 2021 AND month = 07 AND day = 28 AND street = "Humphrey Street";
---crime_scene_reports ID = 295
-- to read the interview transcripts: SELECT * FROM interviews WHERE year = 2021 AND month = 07 AND day = 28 ORDER BY id;
--- TAXI after 10 mins of theft (time of theft: 10:15 AM)
--- ATM on Leggett Street in the morning
--- Earliest flight out of Fiftyville on 29/07/2021, purchased on 28/07/2021
-- To view security footage (entrance): SELECT * FROM bakery_security_logs WHERE year = 2021 AND month = 07 AND day = 28 AND hour <= 10 AND minute <= 15 AND activity = "entrance" ORDER BY id;
-- To view security footage (exit): SELECT * FROM bakery_security_logs WHERE year = 2021 AND month = 07 AND day = 28 AND hour = 10 AND minute >= 15 AND minute <= 25 AND activity = "exit" ORDER BY id;
-- To check ATM transactions on Leggett Street: SELECT * from atm_transactions WHERE year = 2021 AND month = 07 AND day = 28 AND atm_location = "Leggett Street" AND transaction_type = "withdraw";
-- To find out the people who made these transactions: SELECT DISTINCT(name), license_plate, passport_number FROM people, bank_accounts, atm_transactions WHERE bank_accounts.person_id = people.id AND bank_accounts.account_number IN (SELECT account_number from atm_transactions WHERE year = 2021 AND month = 07 AND day = 28 AND atm_location = "Leggett Street" AND transaction_type = "withdraw");
--- plate match: Bruce-94KL13X (exit = 10:18), Diana-322W7JE(exit = 10:21), Iman-L93JTIZ (exit = 10:21), Luca-4328GD8 (exit = 10:19),
-- Check phone calls: SELECT * FROM phone_calls WHERE year = 2021 AND month = 07 AND day = 28 AND duration <= 60;
-- Check 4 suspects phone calls: SELECT name, phone_number FROM people WHERE license_plate = "94KL13X"; repeat for other 4
--- Bruce = (367) 555-5533, Diana = (770) 555-1861, Iman = (829) 555-5269, Luca = (389) 555-5198
--- Check these against the phone calls made: Bruce and Diana made these calls
-- Check possible accomplice name: SELECT name FROM people WHERE phone_number = "(375) 555-8161";
                                -- SELECT name FROM people WHERE phone_number = "(725) 555-3243";
--- Robhin & Phillip
-- check flights again: SELECT * FROM flights, passengers, airports WHERE passengers.passport_number = 8496433585 AND flights.origin_airport_id = airports.id AND flights.origin_airport_id = 8 AND flights.year = 2021 AND flights.month = 07 AND flights.day = 29 ORDER BY hour;
--- 3 early flights out of Fiftyville to 4 (LaGuardia Airport - New York City), ID: 11,36,48
-- check Bruce and Diana passport numbers: SELECT name, passport_number FROM people WHERE name in ("Bruce", "Diana");
--- Bruce: 5773159633, Diana: 3592750733
-- check if Bruce or Diana took those flights: SELECT passport_number FROM flights, passengers WHERE flights.id = passengers.flight_id AND passengers.flight_id IN ("11", "36", "48") AND passengers.passport_number IN ("3592750733", "5773159633");
--- OMG ITS A MATCH - BRUCEEEEEEEEEE and ROBINNNNNNNNNNN
--- BATMAN