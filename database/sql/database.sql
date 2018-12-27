-- convert Laravel migrations to raw SQL scripts --

-- migration:2014_10_12_100000_create_password_resets_table --
create table "password_resets" (
  "email" varchar(255) not null, 
  "token" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null
);
create index "password_resets_email_index" on "password_resets" ("email");

-- migration:2018_10_17_225008_create_countries_table --
create table "countries" (
  "id" serial primary key not null, 
  "countryName" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_10_17_225040_create_cities_table --
create table "cities" (
  "id" serial primary key not null, 
  "cityName" varchar(255) not null, 
  "country_id" integer not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);
alter table 
  "cities" 
add 
  constraint "cities_country_id_foreign" foreign key ("country_id") references "countries" ("id");

-- migration:2018_11_12_145426_create_insurences_table --
create table "insurences" (
  "id" serial primary key not null, 
  "amount" integer not null, 
  "description" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_11_12_215047_create_cars_table --
create table "cars" (
  "id" serial primary key not null, 
  "carModel" varchar(255) not null, 
  "vehicleRegistration" varchar(255) not null, 
  "available" boolean not null, 
  "passengerCapacity" integer not null, 
  "pricePerHour" integer not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_11_12_215105_create_flights_table --
create table "flights" (
  "id" serial primary key not null, 
  "flightNumber" varchar(255) not null, 
  "airplaneModel" varchar(255) not null, 
  "airplaneCapacity" integer not null, 
  "departureLocation" varchar(255) not null, 
  "arrivalLocation" varchar(255) not null, 
  "flightDate" varchar(255) not null, 
  "departureTime" varchar(255) not null, 
  "confirmed" boolean not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_11_12_215124_create_hotels_table --
create table "hotels" (
  "id" serial primary key not null, 
  "hotelName" varchar(255) not null, 
  "stars" integer not null, 
  "hotelCapacity" integer not null, 
  "phoneNumber" varchar(255) not null, 
  "address" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_11_13_172401_create_packages_table --
create table "packages" (
  "id" serial primary key not null, 
  "hotel_id" integer not null, 
  "car_id" integer not null, 
  "flight_id" integer not null, 
  "precioPaquete" integer not null, 
  "fechaInicio" date not null, 
  "fechaTermino" date not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);
alter table 
  "packages" 
add 
  constraint "packages_hotel_id_foreign" foreign key ("hotel_id") references "hotels" ("id");
alter table 
  "packages" 
add 
  constraint "packages_car_id_foreign" foreign key ("car_id") references "cars" ("id");
alter table 
  "packages" 
add 
  constraint "packages_flight_id_foreign" foreign key ("flight_id") references "flights" ("id");

-- migration:2018_11_15_145701_create_payments_table --
create table "payments" (
  "id" serial primary key not null, 
  "paymentMethod" varchar(255) not null, 
  "bankName" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_11_16_140118_create_reserves_table --
create table "reserves" (
  "id" serial primary key not null, 
  "reserveDate" date not null, 
  "reserveBalance" integer not null, 
  "insurance" boolean not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "insurence_id" integer not null, 
  "car_id" integer not null
);
alter table 
  "reserves" 
add 
  constraint "reserves_insurence_id_foreign" foreign key ("insurence_id") references "insurences" ("id") on delete cascade;
alter table 
  "reserves" 
add 
  constraint "reserves_car_id_foreign" foreign key ("car_id") references "cars" ("id");

-- migration:2018_11_16_140259_create_purchases_table --
create table "purchases" (
  "id" serial primary key not null, 
  "totalPrice" integer not null, 
  "date" date not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null, 
  "payment_id" integer not null, 
  "reserve_id" integer not null
);
alter table 
  "purchases" 
add 
  constraint "purchases_payment_id_foreign" foreign key ("payment_id") references "payments" ("id");
alter table 
  "purchases" 
add 
  constraint "purchases_reserve_id_foreign" foreign key ("reserve_id") references "reserves" ("id");

-- migration:2018_11_16_140412_create_airports_table --
create table "airports" (
  "id" serial primary key not null, 
  "name" varchar(255) not null, 
  "address" varchar(255) not null, 
  "city" varchar(255) not null, 
  "phoneNumber" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_11_19_005556_create_hotelrooms_table --
create table "hotelrooms" (
  "id" serial primary key not null, 
  "numberOfBeds" integer not null, 
  "roomType" integer not null, 
  "roomNumber" integer not null, 
  "roomPricePerDay" integer not null, 
  "floorNumber" integer not null, 
  "available" boolean not null, 
  "hotel_id" integer not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);
alter table 
  "hotelrooms" 
add 
  constraint "hotelrooms_hotel_id_foreign" foreign key ("hotel_id") references "hotels" ("id");

-- migration:2018_11_19_005711_create_segments_table --
create table "segments" (
  "id" serial primary key not null, 
  "destinyCity" varchar(255) not null, 
  "waitingTime" integer not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_11_19_005751_create_airplaneseats_table --
create table "airplaneseats" (
  "id" serial primary key not null, 
  "flight_id" integer null, 
  "seat_type" smallint not null, 
  "row" integer not null, 
  "seat_letter" varchar(255) not null, 
  "available" boolean not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);
alter table 
  "airplaneseats" 
add 
  constraint "airplaneseats_flight_id_foreign" foreign key ("flight_id") references "flights" ("id");

-- migration:2018_11_19_005830_create_passengers_table --
create table "passengers" (
  "id" serial primary key not null, 
  "name" varchar(255) not null, 
  "surname" varchar(255) not null, 
  "age" integer not null, 
  "checkIn" boolean not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_11_29_142907_create_roles_table --
create table "roles" (
  "id" serial primary key not null, 
  "type" integer not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_11_29_144428_create_records_table --
create table "records" (
  "id" serial primary key not null, 
  "logDate" date not null, 
  "logDescription" varchar(255) not null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);

-- migration:2018_11_30_205124_create_hotelreserves_table --
create table "hotelreserves" (
  "hotel_id" integer not null, "reserve_id" integer not null
);
alter table 
  "hotelreserves" 
add 
  constraint "hotelreserves_reserve_id_foreign" foreign key ("reserve_id") references "reserves" ("id");
alter table 
  "hotelreserves" 
add 
  constraint "hotelreserves_hotel_id_foreign" foreign key ("hotel_id") references "hotels" ("id");

-- migration:2018_11_30_211543_create_packagereserves_table --
create table "packagereserves" (
  "reserve_id" integer not null, "package_id" integer not null
);
alter table 
  "packagereserves" 
add 
  constraint "packagereserves_reserve_id_foreign" foreign key ("reserve_id") references "reserves" ("id");
alter table 
  "packagereserves" 
add 
  constraint "packagereserves_package_id_foreign" foreign key ("package_id") references "packages" ("id");

-- migration:2018_12_01_231556_create_flightsegments_table --
create table "flightsegments" (
  "flight_id" integer not null, "segment_id" integer not null
);
alter table 
  "flightsegments" 
add 
  constraint "flightsegments_flight_id_foreign" foreign key ("flight_id") references "flights" ("id");
alter table 
  "flightsegments" 
add 
  constraint "flightsegments_segment_id_foreign" foreign key ("segment_id") references "segments" ("id");

-- migration:2018_12_19_191916_create_users_table --
create table "users" (
  "id" serial primary key not null, 
  "rol_id" integer null, 
  "record_id" integer null, 
  "name" varchar(255) not null, 
  "surname" varchar(255) not null, 
  "age" integer not null, 
  "email" varchar(255) not null, 
  "email_verified_at" timestamp(0) without time zone null, 
  "passportNumber" varchar(255) not null, 
  "phoneNumber" varchar(255) not null, 
  "disability" boolean not null, 
  "password" varchar(255) not null, 
  "remember_token" varchar(100) null, 
  "created_at" timestamp(0) without time zone null, 
  "updated_at" timestamp(0) without time zone null
);
alter table 
  "users" 
add 
  constraint "users_rol_id_foreign" foreign key ("rol_id") references "roles" ("id");
alter table 
  "users" 
add 
  constraint "users_email_unique" unique ("email");

-- migration:2018_12_19_192013_create_trigger_table --
CREATE 
OR REPLACE FUNCTION darRol() RETURNS trigger AS $$ 
/*DECLARE
                i INTEGER := 25;
                j INTEGER := 0;
                valor INTEGER := NEW.id;*/
BEGIN 
/*LOOP*/
UPDATE 
  users 
SET 
  rol_id = 1 
WHERE 
  users.id = NEW.id 
  /*END LOOP*/
  ; RETURN NEW; END $$ LANGUAGE plpgsql;;
CREATE TRIGGER asignarRol 
AFTER 
  INSERT ON users FOR EACH ROW EXECUTE PROCEDURE darRol();;

-- migration:2018_12_20_132142_create_seats_trigger_table --
CREATE 
OR REPLACE FUNCTION llenarAsientos() RETURNS trigger AS $$ DECLARE i INTEGER := 25; j INTEGER := 0; letter CHAR := 'a'; valor INTEGER := NEW.id; BEGIN LOOP EXIT WHEN j = i; j := j + 1; INSERT INTO airplaneseats(
  flight_id, seat_type, row, seat_letter, 
  available, updated_at
) 
VALUES 
  (
    valor, 1, j, letter, true, NEW.created_at
  ); END LOOP; RETURN NEW; END $$ LANGUAGE plpgsql;;
CREATE TRIGGER crearAsiento 
AFTER 
  INSERT ON flights FOR EACH ROW EXECUTE PROCEDURE llenarAsientos();;


INSERT INTO public.airplaneseats VALUES (1, 1, 1, 1, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (2, 1, 1, 2, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (3, 1, 1, 3, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (4, 1, 1, 4, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (5, 1, 1, 5, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (6, 1, 1, 6, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (7, 1, 1, 7, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (8, 1, 1, 8, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (9, 1, 1, 9, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (10, 1, 1, 10, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (11, 1, 1, 11, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (12, 1, 1, 12, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (13, 1, 1, 13, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (14, 1, 1, 14, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (15, 1, 1, 15, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (16, 1, 1, 16, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (17, 1, 1, 17, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (18, 1, 1, 18, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (19, 1, 1, 19, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (20, 1, 1, 20, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (21, 1, 1, 21, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (22, 1, 1, 22, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (23, 1, 1, 23, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (24, 1, 1, 24, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (25, 1, 1, 25, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (26, 2, 1, 1, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (27, 2, 1, 2, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (28, 2, 1, 3, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (29, 2, 1, 4, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (30, 2, 1, 5, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (31, 2, 1, 6, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (32, 2, 1, 7, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (33, 2, 1, 8, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (34, 2, 1, 9, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (35, 2, 1, 10, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (36, 2, 1, 11, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (37, 2, 1, 12, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (38, 2, 1, 13, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (39, 2, 1, 14, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (40, 2, 1, 15, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (41, 2, 1, 16, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (42, 2, 1, 17, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (43, 2, 1, 18, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (44, 2, 1, 19, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (45, 2, 1, 20, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (46, 2, 1, 21, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (47, 2, 1, 22, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (48, 2, 1, 23, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (49, 2, 1, 24, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (50, 2, 1, 25, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (51, 3, 1, 1, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (52, 3, 1, 2, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (53, 3, 1, 3, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (54, 3, 1, 4, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (55, 3, 1, 5, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (56, 3, 1, 6, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (57, 3, 1, 7, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (58, 3, 1, 8, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (59, 3, 1, 9, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (60, 3, 1, 10, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (61, 3, 1, 11, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (62, 3, 1, 12, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (63, 3, 1, 13, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (64, 3, 1, 14, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (65, 3, 1, 15, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (66, 3, 1, 16, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (67, 3, 1, 17, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (68, 3, 1, 18, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (69, 3, 1, 19, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (70, 3, 1, 20, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (71, 3, 1, 21, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (72, 3, 1, 22, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (73, 3, 1, 23, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (74, 3, 1, 24, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (75, 3, 1, 25, 'a', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airplaneseats VALUES (76, 4, 1, 1, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (77, 4, 1, 2, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (78, 4, 1, 3, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (79, 4, 1, 4, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (80, 4, 1, 5, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (81, 4, 1, 6, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (82, 4, 1, 7, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (83, 4, 1, 8, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (84, 4, 1, 9, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (85, 4, 1, 10, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (86, 4, 1, 11, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (87, 4, 1, 12, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (88, 4, 1, 13, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (89, 4, 1, 14, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (90, 4, 1, 15, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (91, 4, 1, 16, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (92, 4, 1, 17, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (93, 4, 1, 18, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (94, 4, 1, 19, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (95, 4, 1, 20, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (96, 4, 1, 21, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (97, 4, 1, 22, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (98, 4, 1, 23, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (99, 4, 1, 24, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (100, 4, 1, 25, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (101, 5, 1, 1, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (102, 5, 1, 2, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (103, 5, 1, 3, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (104, 5, 1, 4, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (105, 5, 1, 5, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (106, 5, 1, 6, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (107, 5, 1, 7, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (108, 5, 1, 8, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (109, 5, 1, 9, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (110, 5, 1, 10, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (111, 5, 1, 11, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (112, 5, 1, 12, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (113, 5, 1, 13, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (114, 5, 1, 14, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (115, 5, 1, 15, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (116, 5, 1, 16, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (117, 5, 1, 17, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (118, 5, 1, 18, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (119, 5, 1, 19, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (120, 5, 1, 20, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (121, 5, 1, 21, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (122, 5, 1, 22, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (123, 5, 1, 23, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (124, 5, 1, 24, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (125, 5, 1, 25, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (126, 6, 1, 1, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (127, 6, 1, 2, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (128, 6, 1, 3, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (129, 6, 1, 4, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (130, 6, 1, 5, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (131, 6, 1, 6, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (132, 6, 1, 7, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (133, 6, 1, 8, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (134, 6, 1, 9, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (135, 6, 1, 10, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (136, 6, 1, 11, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (137, 6, 1, 12, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (138, 6, 1, 13, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (139, 6, 1, 14, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (140, 6, 1, 15, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (141, 6, 1, 16, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (142, 6, 1, 17, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (143, 6, 1, 18, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (144, 6, 1, 19, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (145, 6, 1, 20, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (146, 6, 1, 21, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (147, 6, 1, 22, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (148, 6, 1, 23, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (149, 6, 1, 24, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (150, 6, 1, 25, 'a', true, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.airplaneseats VALUES (151, 7, 1, 1, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (152, 7, 1, 2, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (153, 7, 1, 3, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (154, 7, 1, 4, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (155, 7, 1, 5, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (156, 7, 1, 6, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (157, 7, 1, 7, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (158, 7, 1, 8, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (159, 7, 1, 9, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (160, 7, 1, 10, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (161, 7, 1, 11, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (162, 7, 1, 12, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (163, 7, 1, 13, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (164, 7, 1, 14, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (165, 7, 1, 15, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (166, 7, 1, 16, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (167, 7, 1, 17, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (168, 7, 1, 18, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (169, 7, 1, 19, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (170, 7, 1, 20, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (171, 7, 1, 21, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (172, 7, 1, 22, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (173, 7, 1, 23, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (174, 7, 1, 24, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (175, 7, 1, 25, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (176, 8, 1, 1, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (177, 8, 1, 2, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (178, 8, 1, 3, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (179, 8, 1, 4, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (180, 8, 1, 5, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (181, 8, 1, 6, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (182, 8, 1, 7, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (183, 8, 1, 8, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (184, 8, 1, 9, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (185, 8, 1, 10, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (186, 8, 1, 11, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (187, 8, 1, 12, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (188, 8, 1, 13, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (189, 8, 1, 14, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (190, 8, 1, 15, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (191, 8, 1, 16, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (192, 8, 1, 17, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (193, 8, 1, 18, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (194, 8, 1, 19, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (195, 8, 1, 20, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (196, 8, 1, 21, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (197, 8, 1, 22, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (198, 8, 1, 23, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (199, 8, 1, 24, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (200, 8, 1, 25, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (201, 9, 1, 1, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (202, 9, 1, 2, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (203, 9, 1, 3, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (204, 9, 1, 4, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (205, 9, 1, 5, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (206, 9, 1, 6, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (207, 9, 1, 7, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (208, 9, 1, 8, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (209, 9, 1, 9, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (210, 9, 1, 10, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (211, 9, 1, 11, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (212, 9, 1, 12, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (213, 9, 1, 13, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (214, 9, 1, 14, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (215, 9, 1, 15, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (216, 9, 1, 16, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (217, 9, 1, 17, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (218, 9, 1, 18, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (219, 9, 1, 19, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (220, 9, 1, 20, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (221, 9, 1, 21, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (222, 9, 1, 22, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (223, 9, 1, 23, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (224, 9, 1, 24, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airplaneseats VALUES (225, 9, 1, 25, 'a', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.airports VALUES (1, 'Hermiston-Swift', '76618 Feest Stravenue
South Christiana, NE 23913-7293', 'Larrymouth', '+2981837600924', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airports VALUES (2, 'Runolfsson, Stehr and Gutkowski', '5730 Jazmin Station Suite 789
New Ernest, IA 57397', 'Feestborough', '+8357860709330', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airports VALUES (3, 'Rempel and Sons', '5400 Kuhn Haven
Norbertburgh, CO 20335', 'New Emileshire', '+6846675962635', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airports VALUES (4, 'Jakubowski-Zboncak', '9019 Satterfield Point Apt. 515
Elseview, ND 65005-9473', 'Klinghaven', '+2780599647096', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airports VALUES (5, 'Christiansen-Nikolaus', '909 Imani Viaduct Suite 544
Rogahnside, AR 73314-0417', 'Kaceymouth', '+2387553647421', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.airports VALUES (6, 'Stokes LLC', '127 Hoppe Orchard Suite 998
West Malvina, AK 65495-0631', 'Lake Belleville', '+8174054505344', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.airports VALUES (7, 'Wolf Group', '62309 Domenic Ridge
North Scottie, ND 31435-4957', 'South Aliabury', '+3369875651098', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.airports VALUES (8, 'Mante-Schuster', '4007 Hoeger Lights Suite 229
South Kayliehaven, GA 53174', 'West Edythemouth', '+1401119025438', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.airports VALUES (9, 'Auer-Champlin', '2090 Kiehn Mill
Cadenfurt, VA 47333', 'Port Bryana', '+5388965106273', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.airports VALUES (10, 'McGlynn PLC', '192 Bogan Pass
Beckerburgh, CA 06409-6553', 'Lake Ruben', '+9921213737224', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.airports VALUES (11, 'Hand Ltd', '73782 Cassandre Landing
Maritzaton, HI 50481-6171', 'South Marjolainetown', '+5143432543551', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airports VALUES (12, 'Schmeler PLC', '78018 Farrell Street
Dibberthaven, UT 02258', 'Lake Sidney', '+8318607236883', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airports VALUES (13, 'Gulgowski, Cole and Tremblay', '1956 Karianne Course
East Salvadorport, UT 48253', 'New Bulahtown', '+2110696993935', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airports VALUES (14, 'Armstrong Inc', '602 Runolfsson Mountains Suite 563
Lake Vicenta, ME 90716', 'Elmirabury', '+3933630943628', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.airports VALUES (15, 'Eichmann Group', '30154 Witting Forest
Hermanchester, ID 92685-7689', 'North Furman', '+3673699135834', '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.cars VALUES (1, 'Nissan Titan', 'OOY-549', false, 8, 198, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cars VALUES (2, 'Chrysler Laser', 'DXS-797', true, 8, 71, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cars VALUES (3, 'Dagger GT', 'PIE-370', false, 3, 62, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cars VALUES (4, 'Innocenti Elba', 'PIU-766', false, 6, 115, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cars VALUES (5, 'Studebaker Diktator', 'GXO-854', false, 4, 147, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cars VALUES (6, 'Barkas (Баркас) B1000', 'PSC-524', false, 6, 137, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cars VALUES (7, 'Pontiac G8', 'GZO-026', true, 8, 167, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cars VALUES (8, 'Dagger GT', 'ZUS-099', false, 7, 35, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cars VALUES (9, 'Aston Martin Zagato', 'YJZ-211', false, 4, 73, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cars VALUES (10, 'Daimler Double Six', 'WEN-121', true, 7, 84, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cars VALUES (11, 'Mitsubishi Town Box', 'IXR-986', false, 3, 86, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cars VALUES (12, 'Lamborghini Urraco', 'JPB-685', false, 5, 162, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.cars VALUES (13, 'Acura EL', 'BDA-696', true, 8, 77, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.cars VALUES (14, 'Iveco Massif', 'UQN-507', true, 5, 42, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.cars VALUES (15, 'SsangYong Rexton', 'UZU-796', false, 6, 123, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.cars VALUES (16, 'Lincoln Zephyr', 'JWP-922', true, 5, 147, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.cars VALUES (17, 'Alpine A110', 'FLR-123', true, 6, 165, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.cars VALUES (18, 'GMC Canyon', 'XTT-286', false, 7, 109, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.cars VALUES (19, 'BMW M5', 'WHW-553', false, 4, 119, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.cars VALUES (20, 'Adler Stromform', 'AXR-634', true, 6, 178, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.cars VALUES (21, 'Tofas Sahin', 'UKD-874', true, 4, 105, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cars VALUES (22, 'Gac Gonow', 'ZUH-186', false, 3, 102, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cars VALUES (23, 'Venturi Atlantique', 'XMG-432', false, 8, 93, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cars VALUES (24, 'Yugo ZLC', 'JMT-240', false, 3, 95, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cars VALUES (25, 'Shuanghuan SCEO', 'JNX-024', true, 3, 149, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cars VALUES (26, 'King Long Kingte', 'SCJ-075', false, 3, 145, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cars VALUES (27, 'FSO 126P', 'KLN-491', true, 7, 183, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cars VALUES (28, 'Dacia Nova', 'NDR-205', false, 3, 116, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cars VALUES (29, 'Lexus LX', 'CFT-350', false, 3, 72, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cars VALUES (30, 'Mercedes-Benz Sprinter 516 пасс.', 'GYA-969', true, 7, 157, '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.cities VALUES (1, 'Santiago', 1, NULL, NULL);
INSERT INTO public.cities VALUES (2, 'Concepcion', 1, NULL, NULL);
INSERT INTO public.cities VALUES (3, 'Punta Arenas', 1, NULL, NULL);
INSERT INTO public.cities VALUES (4, 'Lake Dana', 10, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cities VALUES (5, 'New Joel', 8, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cities VALUES (6, 'North Pearlville', 4, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cities VALUES (7, 'Kavonfurt', 9, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cities VALUES (8, 'South Gabriellamouth', 11, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cities VALUES (9, 'Jadynbury', 11, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cities VALUES (10, 'Lynchfort', 9, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cities VALUES (11, 'Lake Greggtown', 8, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cities VALUES (12, 'Homenickland', 5, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cities VALUES (13, 'Beattybury', 10, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.cities VALUES (14, 'Santiago', 1, NULL, NULL);
INSERT INTO public.cities VALUES (15, 'Concepcion', 1, NULL, NULL);
INSERT INTO public.cities VALUES (16, 'Punta Arenas', 1, NULL, NULL);
INSERT INTO public.cities VALUES (17, 'Devonteton', 6, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cities VALUES (18, 'East Nolan', 11, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cities VALUES (19, 'Huelsbury', 17, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cities VALUES (20, 'South Nya', 18, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cities VALUES (21, 'O''Harafurt', 17, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cities VALUES (22, 'Elishashire', 12, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cities VALUES (23, 'Stromanport', 5, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cities VALUES (24, 'New Eulahview', 19, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cities VALUES (25, 'West Priceshire', 14, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cities VALUES (26, 'East Nickstad', 2, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.cities VALUES (27, 'Santiago', 1, NULL, NULL);
INSERT INTO public.cities VALUES (28, 'Concepcion', 1, NULL, NULL);
INSERT INTO public.cities VALUES (29, 'Punta Arenas', 1, NULL, NULL);
INSERT INTO public.cities VALUES (30, 'Port Erikland', 3, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cities VALUES (31, 'Alaynabury', 6, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cities VALUES (32, 'East Aglaeburgh', 29, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cities VALUES (33, 'East Tyler', 30, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cities VALUES (34, 'Grayceborough', 31, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cities VALUES (35, 'South Savanahtown', 24, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cities VALUES (36, 'Lake Isom', 7, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cities VALUES (37, 'West Alyssonhaven', 18, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cities VALUES (38, 'Lenoremouth', 19, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.cities VALUES (39, 'Hirthetown', 2, '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.countries VALUES (1, 'Chile', NULL, NULL);
INSERT INTO public.countries VALUES (2, 'Belarus', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.countries VALUES (3, 'Portugal', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.countries VALUES (4, 'Grenada', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.countries VALUES (5, 'Bolivia', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.countries VALUES (6, 'Slovakia (Slovak Republic)', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.countries VALUES (7, 'Kazakhstan', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.countries VALUES (8, 'Denmark', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.countries VALUES (9, 'Uruguay', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.countries VALUES (10, 'Japan', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.countries VALUES (11, 'Solomon Islands', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.countries VALUES (12, 'Chile', NULL, NULL);
INSERT INTO public.countries VALUES (13, 'Lebanon', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.countries VALUES (14, 'Bermuda', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.countries VALUES (15, 'Mayotte', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.countries VALUES (16, 'Norway', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.countries VALUES (17, 'Bulgaria', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.countries VALUES (18, 'China', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.countries VALUES (19, 'Finland', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.countries VALUES (20, 'Puerto Rico', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.countries VALUES (21, 'Belize', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.countries VALUES (22, 'Guinea', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.countries VALUES (23, 'Chile', NULL, NULL);
INSERT INTO public.countries VALUES (24, 'Korea', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.countries VALUES (25, 'Bahrain', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.countries VALUES (26, 'France', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.countries VALUES (27, 'British Virgin Islands', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.countries VALUES (28, 'Morocco', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.countries VALUES (29, 'Kazakhstan', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.countries VALUES (30, 'Holy See (Vatican City State)', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.countries VALUES (31, 'Singapore', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.countries VALUES (32, 'Cambodia', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.countries VALUES (33, 'Qatar', '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: flightreserves; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.flightreserves VALUES (1, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 8);
INSERT INTO public.flightreserves VALUES (2, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 3);
INSERT INTO public.flightreserves VALUES (3, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 2, 9);
INSERT INTO public.flightreserves VALUES (4, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 1, 9);
INSERT INTO public.flightreserves VALUES (5, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 1);
INSERT INTO public.flightreserves VALUES (6, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 2, 5);
INSERT INTO public.flightreserves VALUES (7, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 1, 1);
INSERT INTO public.flightreserves VALUES (8, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 2, 3);
INSERT INTO public.flightreserves VALUES (9, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 8);
INSERT INTO public.flightreserves VALUES (10, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 1, 9);
INSERT INTO public.flightreserves VALUES (11, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 1, 20);
INSERT INTO public.flightreserves VALUES (12, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 6, 12);
INSERT INTO public.flightreserves VALUES (13, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 2, 3);
INSERT INTO public.flightreserves VALUES (14, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 5, 1);
INSERT INTO public.flightreserves VALUES (15, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 3, 10);
INSERT INTO public.flightreserves VALUES (16, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 5, 14);
INSERT INTO public.flightreserves VALUES (17, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 5, 17);
INSERT INTO public.flightreserves VALUES (18, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 6, 16);
INSERT INTO public.flightreserves VALUES (19, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 4, 4);
INSERT INTO public.flightreserves VALUES (20, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 4, 8);
INSERT INTO public.flightreserves VALUES (21, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 7, 21);
INSERT INTO public.flightreserves VALUES (22, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 2, 9);
INSERT INTO public.flightreserves VALUES (23, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 4, 5);
INSERT INTO public.flightreserves VALUES (24, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 2, 15);
INSERT INTO public.flightreserves VALUES (25, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 8, 3);
INSERT INTO public.flightreserves VALUES (26, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 7, 7);
INSERT INTO public.flightreserves VALUES (27, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 6, 27);
INSERT INTO public.flightreserves VALUES (28, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 9, 20);
INSERT INTO public.flightreserves VALUES (29, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 9, 18);
INSERT INTO public.flightreserves VALUES (30, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 3, 15);


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.flights VALUES (1, 'XY2288', 'SHD-125', 142, 'Netherlands Antilles', 'Equatorial Guinea', '9/8/2019', '21:14', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.flights VALUES (2, 'FI1643', 'RGL-827', 124, 'Vanuatu', 'Czech Republic', '15/2/2020', '00:10', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.flights VALUES (3, 'WO4429', 'AZB-709', 101, 'Togo', 'New Zealand', '21/5/2018', '03:08', true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.flights VALUES (4, 'TZ4081', 'YWT-526', 87, 'Maldives', 'Oman', '16/7/2018', '09:50', false, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.flights VALUES (5, 'KF0541', 'EUW-250', 91, 'Colombia', 'Rwanda', '20/1/2019', '04:28', false, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.flights VALUES (6, 'LT1909', 'MRX-488', 107, 'Spain', 'Finland', '16/10/2018', '12:32', false, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.flights VALUES (7, 'OB2648', 'MAD-523', 130, 'Armenia', 'Svalbard & Jan Mayen Islands', '2019-03-08 12:33:43', '20:49', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.flights VALUES (8, 'ES0630', 'SDA-963', 81, 'Somalia', 'Monaco', '2019-08-07 03:50:28', '22:35', false, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.flights VALUES (9, 'VO7746', 'QRX-090', 127, 'Lebanon', 'Svalbard & Jan Mayen Islands', '2019-08-07 23:39:15', '16:20', true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: flightsegments; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.flightsegments VALUES (1, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 1, 11);
INSERT INTO public.flightsegments VALUES (2, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 15);
INSERT INTO public.flightsegments VALUES (3, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 5);
INSERT INTO public.flightsegments VALUES (4, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 9);
INSERT INTO public.flightsegments VALUES (5, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 2, 8);
INSERT INTO public.flightsegments VALUES (6, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 2, 11);
INSERT INTO public.flightsegments VALUES (7, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 2, 2);
INSERT INTO public.flightsegments VALUES (8, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 14);
INSERT INTO public.flightsegments VALUES (9, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 2, 4);
INSERT INTO public.flightsegments VALUES (10, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 1, 8);
INSERT INTO public.flightsegments VALUES (11, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 4, 17);
INSERT INTO public.flightsegments VALUES (12, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 1, 20);
INSERT INTO public.flightsegments VALUES (13, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 3, 5);
INSERT INTO public.flightsegments VALUES (14, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 3, 21);
INSERT INTO public.flightsegments VALUES (15, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 2, 30);
INSERT INTO public.flightsegments VALUES (16, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 3, 10);
INSERT INTO public.flightsegments VALUES (17, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 4, 6);
INSERT INTO public.flightsegments VALUES (18, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 4, 6);
INSERT INTO public.flightsegments VALUES (19, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 5, 12);
INSERT INTO public.flightsegments VALUES (20, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 2, 30);
INSERT INTO public.flightsegments VALUES (21, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 3, 31);
INSERT INTO public.flightsegments VALUES (22, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 2, 10);
INSERT INTO public.flightsegments VALUES (23, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 7, 26);
INSERT INTO public.flightsegments VALUES (24, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 3, 39);
INSERT INTO public.flightsegments VALUES (25, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 1, 22);
INSERT INTO public.flightsegments VALUES (26, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 6, 25);
INSERT INTO public.flightsegments VALUES (27, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 8, 13);
INSERT INTO public.flightsegments VALUES (28, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 6, 26);
INSERT INTO public.flightsegments VALUES (29, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 4, 19);
INSERT INTO public.flightsegments VALUES (30, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 7, 18);


--
-- Data for Name: hotelreserves; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.hotelreserves VALUES (1, 6, 9, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelreserves VALUES (2, 4, 2, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelreserves VALUES (3, 1, 7, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelreserves VALUES (4, 12, 2, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelreserves VALUES (5, 1, 7, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelreserves VALUES (6, 3, 4, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelreserves VALUES (7, 5, 4, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelreserves VALUES (8, 5, 7, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelreserves VALUES (9, 2, 1, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelreserves VALUES (10, 11, 2, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelreserves VALUES (11, 19, 9, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelreserves VALUES (12, 16, 2, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelreserves VALUES (13, 1, 12, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelreserves VALUES (14, 11, 14, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelreserves VALUES (15, 22, 8, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelreserves VALUES (16, 22, 5, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelreserves VALUES (17, 21, 9, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelreserves VALUES (18, 10, 19, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelreserves VALUES (19, 23, 3, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelreserves VALUES (20, 16, 19, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelreserves VALUES (21, 17, 4, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelreserves VALUES (22, 4, 5, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelreserves VALUES (23, 16, 21, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelreserves VALUES (24, 8, 20, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelreserves VALUES (25, 3, 23, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelreserves VALUES (26, 16, 30, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelreserves VALUES (27, 9, 17, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelreserves VALUES (28, 8, 1, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelreserves VALUES (29, 14, 10, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelreserves VALUES (30, 6, 26, '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: hotelrooms; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.hotelrooms VALUES (1, 3, 2, 52, 43011, 5, false, 5, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelrooms VALUES (2, 4, 1, 6, 23048, 21, false, 12, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelrooms VALUES (3, 2, 1, 65, 49766, 3, true, 4, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelrooms VALUES (4, 1, 3, 77, 21063, 1, true, 11, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelrooms VALUES (5, 1, 2, 63, 28320, 13, false, 9, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelrooms VALUES (6, 1, 2, 48, 33054, 6, true, 12, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelrooms VALUES (7, 1, 3, 41, 44241, 10, true, 3, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelrooms VALUES (8, 4, 1, 20, 40895, 14, false, 1, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelrooms VALUES (9, 4, 2, 24, 29584, 20, false, 2, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelrooms VALUES (10, 1, 2, 28, 20509, 14, true, 1, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotelrooms VALUES (11, 1, 1, 60, 40804, 8, false, 21, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelrooms VALUES (12, 4, 2, 66, 26089, 25, true, 9, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelrooms VALUES (13, 3, 2, 63, 29309, 22, true, 11, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelrooms VALUES (14, 1, 3, 83, 37231, 8, true, 13, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelrooms VALUES (15, 2, 1, 80, 44347, 4, true, 10, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelrooms VALUES (16, 1, 3, 88, 49528, 24, false, 19, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelrooms VALUES (17, 3, 1, 49, 46139, 24, true, 12, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelrooms VALUES (18, 2, 3, 54, 26265, 8, true, 9, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelrooms VALUES (19, 2, 3, 80, 46820, 20, true, 2, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelrooms VALUES (20, 3, 1, 86, 26453, 24, true, 22, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.hotelrooms VALUES (21, 3, 2, 75, 41596, 24, true, 34, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelrooms VALUES (22, 2, 3, 59, 20731, 15, true, 9, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelrooms VALUES (23, 2, 1, 88, 31418, 25, false, 17, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelrooms VALUES (24, 1, 2, 89, 46828, 14, true, 22, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelrooms VALUES (25, 4, 2, 17, 36335, 6, true, 21, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelrooms VALUES (26, 1, 2, 99, 31939, 8, true, 19, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelrooms VALUES (27, 4, 2, 65, 41668, 20, false, 17, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelrooms VALUES (28, 1, 2, 43, 45872, 19, true, 27, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelrooms VALUES (29, 1, 1, 35, 25876, 22, true, 14, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotelrooms VALUES (30, 1, 2, 65, 41392, 14, true, 6, '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.hotels VALUES (1, 'Terry Ltd', 3, 105, '+1044772520046', '606 Quitzon Lock
Cristberg, IL 16083-4013', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotels VALUES (2, 'Cummings Ltd', 3, 158, '+4237783765040', '90349 Concepcion Heights
Jazminport, SD 10072', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotels VALUES (3, 'Schimmel, Cartwright and Bergstrom', 4, 115, '+5668199454680', '976 Zulauf Fall Apt. 038
New Sister, WV 70619', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotels VALUES (4, 'Christiansen-Schmitt', 4, 114, '+6440157405597', '413 Wendy Forges
Kayleyport, NH 78873', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotels VALUES (5, 'Cremin PLC', 5, 164, '+5925167011004', '192 Runte Fall Suite 190
O''Reillyborough, RI 13632', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotels VALUES (6, 'Bernhard-Marks', 5, 164, '+5894174215606', '328 Kaylin Summit Apt. 428
West Laury, IN 22048-8249', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotels VALUES (7, 'Langworth PLC', 3, 191, '+7299250636286', '295 Rhianna Lock Suite 300
Keonchester, NV 12152-5508', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotels VALUES (8, 'Morar-Deckow', 2, 135, '+4859758046341', '3151 Nikko Tunnel
South Dedricbury, AL 79472-8466', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotels VALUES (9, 'Ondricka-Koepp', 2, 195, '+9629453064968', '2280 Brendon Loop
Port Wilfordmouth, ME 88683-6204', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotels VALUES (10, 'Cormier-Hudson', 4, 136, '+5948961473771', '21352 Stehr Forge
New Anibalshire, MI 43241', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.hotels VALUES (11, 'Best hotel', 5, 123, '+56972512245', 'Alameda 123', NULL, NULL);
INSERT INTO public.hotels VALUES (12, 'worst hotel', 1, 100, '+56972512245', 'Alameda 000', NULL, NULL);
INSERT INTO public.hotels VALUES (13, 'Reynolds-Mueller', 1, 189, '+5801957102612', '3608 Erdman Court
New Julius, TN 16139', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.hotels VALUES (14, 'Howe, Emmerich and Oberbrunner', 5, 197, '+2321509745490', '145 Koepp Ridge
West Eliseoville, NC 09197', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.hotels VALUES (15, 'Stark, Mante and Leffler', 5, 130, '+3532106258457', '2663 Britney Mill Apt. 718
New Theo, SD 30587', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.hotels VALUES (16, 'Jerde, Sporer and Murazik', 5, 198, '+5979164676377', '1737 Morar Row
West Elishaview, TN 18128', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.hotels VALUES (17, 'Hilpert Group', 3, 159, '+5153550954662', '85120 Chase Lake Apt. 835
Strosinside, NC 61419', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.hotels VALUES (18, 'Mraz Ltd', 5, 122, '+4070327313092', '769 Schroeder Center Apt. 635
Everetthaven, MN 91147', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.hotels VALUES (19, 'Bosco LLC', 4, 141, '+2732699252804', '8942 Shields Canyon Suite 684
Wilhelmview, KS 44710-8540', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.hotels VALUES (20, 'Reichert, Ebert and Stokes', 3, 175, '+2929691607708', '233 Nader Junction
Port Emilymouth, AL 01903-1483', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.hotels VALUES (21, 'Hilpert LLC', 5, 183, '+6561584663824', '6856 Herzog Point
New Javier, KY 48092', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.hotels VALUES (22, 'Heidenreich, Deckow and Cummerata', 5, 168, '+4843127422035', '372 Hamill Crossroad
South Sedrick, OH 65801-1074', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.hotels VALUES (23, 'Best hotel', 5, 123, '+56972512245', 'Alameda 123', NULL, NULL);
INSERT INTO public.hotels VALUES (24, 'worst hotel', 1, 100, '+56972512245', 'Alameda 000', NULL, NULL);
INSERT INTO public.hotels VALUES (25, 'Greenfelder Group', 4, 145, '+7439333416056', '2128 Mosciski Turnpike
Athenamouth, SC 73105-4802', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotels VALUES (26, 'Hills Ltd', 5, 158, '+8949489257450', '9059 Cummerata Brooks Apt. 988
West Madisynhaven, VT 38901-8572', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotels VALUES (27, 'Baumbach, Kuphal and Parker', 3, 172, '+6962901390700', '99684 Legros Turnpike Apt. 720
Port Clint, HI 26950-5603', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotels VALUES (28, 'Shields-Hickle', 4, 198, '+9480616678093', '86200 Fisher Mountain Suite 633
Schillerfurt, AL 30184-2393', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotels VALUES (29, 'Ullrich-McClure', 1, 121, '+8377044119992', '814 Emery Spur
Robertsbury, KY 63144-9878', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotels VALUES (30, 'Mayer Group', 4, 161, '+3515290653417', '196 Alexie Locks Suite 023
Bettyland, LA 34002-8759', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotels VALUES (31, 'Kilback and Sons', 2, 157, '+3842451312506', '4544 Judy Stream
South Reubenton, GA 35242-1398', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotels VALUES (32, 'Sporer, Kuhic and Lind', 1, 159, '+4194762944796', '94208 Herman Glen
Lake Doyleville, AR 13157', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotels VALUES (33, 'Stoltenberg PLC', 3, 148, '+2435661450452', '2759 Daniel Hill Apt. 054
Baumbachview, ND 76949-1119', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotels VALUES (34, 'Cummings-McKenzie', 5, 184, '+6865499016710', '13391 Adams Curve
Candelarioberg, MS 97238', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.hotels VALUES (35, 'Best hotel', 5, 123, '+56972512245', 'Alameda 123', NULL, NULL);
INSERT INTO public.hotels VALUES (36, 'worst hotel', 1, 100, '+56972512245', 'Alameda 000', NULL, NULL);


--
-- Data for Name: insurences; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.insurences VALUES (1, 204, 'Queen! The Queen!'' and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took no notice of her or of anything else. CHAPTER V. Advice from a.', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.insurences VALUES (2, 453, 'Queen was close behind us, and he''s treading on her spectacles, and began to feel a little feeble, squeaking voice, (''That''s Bill,'' thought Alice,) ''Well, I should say "With what porpoise?"'' ''Don''t.', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.insurences VALUES (3, 238, 'Alice, and she jumped up in a sort of present!'' thought Alice. One of the wood--(she considered him to be no doubt that it made no mark; but he now hastily began again, using the ink, that was said.', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.insurences VALUES (4, 141, 'She had just begun to repeat it, but her head down to them, and all dripping wet, cross, and uncomfortable. The first question of course had to stoop to save her neck would bend about easily in any.', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.insurences VALUES (5, 190, 'Queen added to one of the way wherever she wanted much to know, but the Rabbit came near her, she began, in a whisper.) ''That would be the use of repeating all that green stuff be?'' said Alice.', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.insurences VALUES (6, 342, 'Mouse''s tail; ''but why do you know about it, and found quite a commotion in the kitchen that did not sneeze, were the verses the White Rabbit returning, splendidly dressed, with a shiver. ''I beg.', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.insurences VALUES (7, 277, 'Alice! Come here directly, and get ready for your interesting story,'' but she heard a little pattering of feet on the floor: in another moment, splash! she was trying to put down yet, before the.', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.insurences VALUES (8, 446, 'Dinah, tell me who YOU are, first.'' ''Why?'' said the Caterpillar contemptuously. ''Who are YOU?'' Which brought them back again to the law, And argued each case with my wife; And the muscular strength.', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.insurences VALUES (9, 41, 'I say--that''s the same solemn tone, ''For the Duchess. ''Everything''s got a moral, if only you can find out the proper way of keeping up the little golden key in the lock, and to stand on your shoes.', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.insurences VALUES (10, 145, 'Alice, ''we learned French and music.'' ''And washing?'' said the Cat, and vanished again. Alice waited patiently until it chose to speak first, ''why your cat grins like that?'' ''It''s a mineral, I.', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.insurences VALUES (11, 100, 'Queen''s shrill cries to the door. ''Call the next witness. It quite makes my forehead ache!'' Alice watched the White Rabbit blew three blasts on the hearth and grinning from ear to ear. ''Please would.', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.insurences VALUES (12, 328, 'Dormouse, and repeated her question. ''Why did they live at the Lizard in head downwards, and the Dormouse sulkily remarked, ''If you do. I''ll set Dinah at you!'' There was a dead silence instantly.', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.insurences VALUES (13, 170, 'Alice, and, after glaring at her feet as the rest waited in silence. Alice was silent. The King laid his hand upon her face. ''Very,'' said Alice: ''three inches is such a thing before, and behind it.', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.insurences VALUES (14, 465, 'Lobster; I heard him declare, "You have baked me too brown, I must have been changed in the beautiful garden, among the bright eager eyes were looking over his shoulder as he spoke. ''A cat may look.', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.insurences VALUES (15, 215, 'Mock Turtle. ''Hold your tongue!'' added the Gryphon, and the second time round, she came upon a neat little house, on the end of the lefthand bit of the pack, she could guess, she was about a foot.', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.insurences VALUES (16, 180, 'Hare interrupted, yawning. ''I''m getting tired of swimming about here, O Mouse!'' (Alice thought this a good way off, panting, with its eyelids, so he with his nose Trims his belt and his buttons, and.', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.insurences VALUES (17, 245, 'I''ll never go THERE again!'' said Alice thoughtfully: ''but then--I shouldn''t be hungry for it, you may stand down,'' continued the Hatter, who turned pale and fidgeted. ''Give your evidence,'' said the.', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.insurences VALUES (18, 439, 'That your eye was as long as there seemed to rise like a Jack-in-the-box, and up I goes like a candle. I wonder if I shall have to go nearer till she had succeeded in curving it down into its nest.', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.insurences VALUES (19, 165, 'Alice, ''but I know I have dropped them, I wonder?'' Alice guessed who it was, even before she came rather late, and the executioner ran wildly up and throw us, with the birds hurried off at once to.', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.insurences VALUES (20, 77, 'What happened to me! I''LL soon make you dry enough!'' They all returned from him to you, Though they were gardeners, or soldiers, or courtiers, or three times over to herself, as usual. ''Come.', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.insurences VALUES (21, 166, 'Why, there''s hardly room for her. ''Yes!'' shouted Alice. ''Come on, then!'' roared the Queen, ''and he shall tell you more than Alice could speak again. The Mock Turtle replied; ''and then the other, and.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.insurences VALUES (22, 234, 'This time Alice waited patiently until it chose to speak with. Alice waited a little, and then raised himself upon tiptoe, put his shoes on. ''--and just take his head mournfully. ''Not I!'' he.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.insurences VALUES (23, 281, 'OLD, FATHER WILLIAM,'' to the shore. CHAPTER III. A Caucus-Race and a bright idea came into Alice''s shoulder as she said to the other side of WHAT?'' thought Alice; but she got to the confused clamour.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.insurences VALUES (24, 226, 'There was a general clapping of hands at this: it was her dream:-- First, she dreamed of little cartwheels, and the beak-- Pray how did you do either!'' And the muscular strength, which it gave to my.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.insurences VALUES (25, 321, 'For some minutes the whole thing, and she drew herself up closer to Alice''s side as she could do, lying down on her spectacles, and began singing in its sleep ''Twinkle, twinkle, twinkle, twinkle--''.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.insurences VALUES (26, 122, 'The Dormouse again took a great interest in questions of eating and drinking. ''They lived on treacle,'' said the Duchess, ''as pigs have to ask help of any use, now,'' thought Alice, ''to pretend to be.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.insurences VALUES (27, 75, 'What would become of you? I gave her one, they gave him two, You gave us three or more; They all sat down with wonder at the time they had been to a mouse: she had never done such a thing before.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.insurences VALUES (28, 86, 'The Cat''s head began fading away the moment she quite forgot how to speak with. Alice waited a little, half expecting to see if she did not like to show you! A little bright-eyed terrier, you know.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.insurences VALUES (29, 445, 'Hatter. He had been found and handed back to the seaside once in the kitchen that did not at all anxious to have changed since her swim in the other. ''I beg pardon, your Majesty,'' said Two, in a.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.insurences VALUES (30, 415, 'Will you, won''t you, will you, won''t you, will you, old fellow?'' The Mock Turtle to the waving of the table. ''Have some wine,'' the March Hare. ''Sixteenth,'' added the Dormouse, without considering at.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.migrations VALUES (1, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations VALUES (2, '2018_10_17_225008_create_countries_table', 1);
INSERT INTO public.migrations VALUES (3, '2018_10_17_225040_create_cities_table', 1);
INSERT INTO public.migrations VALUES (4, '2018_11_12_145426_create_insurences_table', 1);
INSERT INTO public.migrations VALUES (5, '2018_11_12_215047_create_cars_table', 1);
INSERT INTO public.migrations VALUES (6, '2018_11_12_215105_create_flights_table', 1);
INSERT INTO public.migrations VALUES (7, '2018_11_12_215124_create_hotels_table', 1);
INSERT INTO public.migrations VALUES (8, '2018_11_13_172401_create_packages_table', 1);
INSERT INTO public.migrations VALUES (9, '2018_11_15_145701_create_payments_table', 1);
INSERT INTO public.migrations VALUES (10, '2018_11_16_140118_create_reserves_table', 1);
INSERT INTO public.migrations VALUES (11, '2018_11_16_140259_create_purchases_table', 1);
INSERT INTO public.migrations VALUES (12, '2018_11_16_140412_create_airports_table', 1);
INSERT INTO public.migrations VALUES (13, '2018_11_19_005556_create_hotelrooms_table', 1);
INSERT INTO public.migrations VALUES (14, '2018_11_19_005711_create_segments_table', 1);
INSERT INTO public.migrations VALUES (15, '2018_11_19_005751_create_airplaneseats_table', 1);
INSERT INTO public.migrations VALUES (16, '2018_11_19_005830_create_passengers_table', 1);
INSERT INTO public.migrations VALUES (17, '2018_11_29_142907_create_roles_table', 1);
INSERT INTO public.migrations VALUES (18, '2018_11_29_144428_create_records_table', 1);
INSERT INTO public.migrations VALUES (19, '2018_11_30_205124_create_hotelreserves_table', 1);
INSERT INTO public.migrations VALUES (20, '2018_11_30_211543_create_packagereserves_table', 1);
INSERT INTO public.migrations VALUES (21, '2018_12_01_231556_create_flightsegments_table', 1);
INSERT INTO public.migrations VALUES (22, '2018_12_19_191916_create_users_table', 1);
INSERT INTO public.migrations VALUES (23, '2018_12_19_192013_create_trigger_table', 1);
INSERT INTO public.migrations VALUES (24, '2018_12_20_132142_create_seats_trigger_table', 1);
INSERT INTO public.migrations VALUES (25, '2018_12_26_234845_create_flightreserves_table', 1);


--
-- Data for Name: packagereserves; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.packagereserves VALUES (1, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 8);
INSERT INTO public.packagereserves VALUES (2, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 8, 4);
INSERT INTO public.packagereserves VALUES (3, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 5);
INSERT INTO public.packagereserves VALUES (4, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 2, 3);
INSERT INTO public.packagereserves VALUES (5, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 9, 10);
INSERT INTO public.packagereserves VALUES (6, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 8, 10);
INSERT INTO public.packagereserves VALUES (7, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 5, 8);
INSERT INTO public.packagereserves VALUES (8, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 5, 8);
INSERT INTO public.packagereserves VALUES (9, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 8, 6);
INSERT INTO public.packagereserves VALUES (10, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 1, 2);
INSERT INTO public.packagereserves VALUES (11, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 11, 6);
INSERT INTO public.packagereserves VALUES (12, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 12, 15);
INSERT INTO public.packagereserves VALUES (13, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 17, 8);
INSERT INTO public.packagereserves VALUES (14, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 10, 13);
INSERT INTO public.packagereserves VALUES (15, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 19, 18);
INSERT INTO public.packagereserves VALUES (16, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 13, 16);
INSERT INTO public.packagereserves VALUES (17, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 2, 19);
INSERT INTO public.packagereserves VALUES (18, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 5, 17);
INSERT INTO public.packagereserves VALUES (19, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 3, 10);
INSERT INTO public.packagereserves VALUES (20, '2018-12-27 18:41:35', '2018-12-27 18:41:35', 2, 5);
INSERT INTO public.packagereserves VALUES (21, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 5, 30);
INSERT INTO public.packagereserves VALUES (22, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 9, 3);
INSERT INTO public.packagereserves VALUES (23, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 30, 16);
INSERT INTO public.packagereserves VALUES (24, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 5, 28);
INSERT INTO public.packagereserves VALUES (25, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 1, 12);
INSERT INTO public.packagereserves VALUES (26, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 23, 1);
INSERT INTO public.packagereserves VALUES (27, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 1, 1);
INSERT INTO public.packagereserves VALUES (28, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 10, 5);
INSERT INTO public.packagereserves VALUES (29, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 2, 21);
INSERT INTO public.packagereserves VALUES (30, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 5, 27);


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.packages VALUES (1, 1, 10, 1, 336, '2004-10-17', '1988-05-22', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.packages VALUES (2, 5, 8, 1, 498, '1971-11-13', '2009-02-18', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.packages VALUES (3, 1, 6, 1, 310, '2000-12-03', '1979-04-16', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.packages VALUES (4, 8, 9, 1, 240, '2010-03-04', '2005-12-21', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.packages VALUES (5, 1, 10, 1, 350, '1980-12-30', '1985-04-29', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.packages VALUES (6, 9, 7, 2, 7, '1983-06-29', '2016-08-25', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.packages VALUES (7, 4, 10, 3, 490, '1994-04-07', '1973-01-25', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.packages VALUES (8, 3, 3, 1, 278, '1977-05-19', '2012-11-14', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.packages VALUES (9, 8, 3, 2, 124, '1997-02-03', '1984-10-03', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.packages VALUES (10, 3, 5, 2, 213, '1988-12-12', '1997-07-29', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.packages VALUES (11, 19, 16, 2, 82, '1998-06-05', '1972-04-14', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.packages VALUES (12, 1, 15, 2, 231, '1986-10-28', '2008-05-02', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.packages VALUES (13, 11, 4, 5, 180, '2008-12-31', '1987-02-23', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.packages VALUES (14, 22, 18, 6, 5, '1973-02-16', '1998-02-24', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.packages VALUES (15, 10, 12, 4, 229, '1980-10-04', '2001-07-07', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.packages VALUES (16, 18, 20, 1, 316, '1977-10-13', '2002-01-03', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.packages VALUES (17, 10, 8, 1, 405, '1987-03-01', '2000-07-05', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.packages VALUES (18, 1, 19, 1, 38, '1973-02-08', '1985-01-22', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.packages VALUES (19, 6, 11, 4, 132, '1999-04-12', '1989-08-04', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.packages VALUES (20, 5, 2, 4, 43, '1981-03-05', '1998-09-12', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.packages VALUES (21, 36, 25, 3, 346, '2019-09-04', '1996-11-06', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.packages VALUES (22, 24, 3, 1, 55, '2019-10-12', '1988-05-08', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.packages VALUES (23, 20, 4, 5, 354, '2019-10-17', '1981-02-24', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.packages VALUES (24, 11, 14, 7, 99, '2019-10-17', '2016-02-03', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.packages VALUES (25, 30, 7, 5, 70, '2019-10-01', '1997-10-23', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.packages VALUES (26, 9, 7, 3, 41, '2019-12-22', '1981-06-18', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.packages VALUES (27, 31, 29, 5, 406, '2019-04-30', '1992-11-10', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.packages VALUES (28, 4, 28, 6, 282, '2019-04-19', '2010-11-25', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.packages VALUES (29, 36, 4, 9, 197, '2019-10-03', '2006-06-30', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.packages VALUES (30, 5, 13, 4, 167, '2019-02-08', '2003-08-14', '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: passengers; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.passengers VALUES (1, 'Irving', 'Howell', 99, true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.passengers VALUES (2, 'Austin', 'Willms', 36, true, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.passengers VALUES (3, 'Chelsie', 'Heidenreich', 47, false, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.passengers VALUES (4, 'Shayne', 'Haley', 70, false, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.passengers VALUES (5, 'Betty', 'Schmeler', 6, false, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.passengers VALUES (6, 'Osbaldo', 'Hills', 25, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.passengers VALUES (7, 'Jewel', 'Osinski', 43, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.passengers VALUES (8, 'Floy', 'Collins', 30, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.passengers VALUES (9, 'Xzavier', 'Sauer', 11, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.passengers VALUES (10, 'Louvenia', 'Schulist', 88, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.passengers VALUES (11, 'Elsie', 'Thiel', 34, true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.passengers VALUES (12, 'Ophelia', 'McClure', 67, false, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.passengers VALUES (13, 'Elenora', 'Fay', 20, true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.passengers VALUES (14, 'Tanner', 'Reichel', 32, true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.passengers VALUES (15, 'Elnora', 'Wiegand', 95, true, '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: homestead
--



--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.payments VALUES (1, 'Visa', 'Schulist-Hand', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.payments VALUES (2, 'MasterCard', 'Cormier-Bernier', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.payments VALUES (3, 'MasterCard', 'Bechtelar Ltd', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.payments VALUES (4, 'MasterCard', 'Thiel-Powlowski', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.payments VALUES (5, 'MasterCard', 'Trantow LLC', '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.payments VALUES (6, 'MasterCard', 'King, Ledner and Larson', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.payments VALUES (7, 'MasterCard', 'Frami-Gutkowski', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.payments VALUES (8, 'MasterCard', 'Price, Herman and Wyman', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.payments VALUES (9, 'MasterCard', 'West, Vandervort and Stokes', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.payments VALUES (10, 'Visa Retired', 'Schumm-Gleichner', '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.payments VALUES (11, 'American Express', 'Deckow-Grant', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.payments VALUES (12, 'American Express', 'Funk Ltd', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.payments VALUES (13, 'Visa', 'Schuster PLC', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.payments VALUES (14, 'MasterCard', 'Bruen LLC', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.payments VALUES (15, 'Visa', 'Stamm Ltd', '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.purchases VALUES (1, 3178, '1972-05-30 19:16:07', '2018-12-27 13:48:32', '2018-12-27 13:48:32', 5, 7);
INSERT INTO public.purchases VALUES (2, 18172, '1981-09-27 13:45:35', '2018-12-27 13:48:32', '2018-12-27 13:48:32', 3, 10);
INSERT INTO public.purchases VALUES (3, 15763, '2011-04-04 08:10:54', '2018-12-27 13:48:32', '2018-12-27 13:48:32', 1, 8);
INSERT INTO public.purchases VALUES (4, 4068, '2005-08-17 03:42:20', '2018-12-27 13:48:32', '2018-12-27 13:48:32', 2, 2);
INSERT INTO public.purchases VALUES (5, 9198, '1984-04-08 10:02:40', '2018-12-27 13:48:32', '2018-12-27 13:48:32', 5, 2);
INSERT INTO public.purchases VALUES (6, 17192, '1984-07-02 11:20:54', '2018-12-27 18:41:34', '2018-12-27 18:41:34', 2, 16);
INSERT INTO public.purchases VALUES (7, 674, '1998-04-03 08:18:08', '2018-12-27 18:41:34', '2018-12-27 18:41:34', 10, 19);
INSERT INTO public.purchases VALUES (8, 8958, '2012-06-13 15:28:57', '2018-12-27 18:41:34', '2018-12-27 18:41:34', 7, 5);
INSERT INTO public.purchases VALUES (9, 17095, '1980-01-06 23:14:32', '2018-12-27 18:41:34', '2018-12-27 18:41:34', 1, 14);
INSERT INTO public.purchases VALUES (10, 7760, '2015-06-10 22:02:56', '2018-12-27 18:41:34', '2018-12-27 18:41:34', 2, 4);
INSERT INTO public.purchases VALUES (11, 654, '2019-04-08 03:42:16', '2018-12-27 18:50:47', '2018-12-27 18:50:47', 15, 8);
INSERT INTO public.purchases VALUES (12, 9774, '2019-02-19 21:37:24', '2018-12-27 18:50:47', '2018-12-27 18:50:47', 11, 18);
INSERT INTO public.purchases VALUES (13, 7164, '2019-09-20 21:43:33', '2018-12-27 18:50:47', '2018-12-27 18:50:47', 11, 13);
INSERT INTO public.purchases VALUES (14, 13366, '2019-04-29 21:41:27', '2018-12-27 18:50:47', '2018-12-27 18:50:47', 2, 27);
INSERT INTO public.purchases VALUES (15, 13894, '2019-10-01 21:31:02', '2018-12-27 18:50:47', '2018-12-27 18:50:47', 12, 12);


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.records VALUES (1, '1999-11-23', 'Dormouse went on, ''--likely to win, that it''s hardly worth while finishing the game.'' The Queen smiled and passed on. ''Who ARE you doing out here? Run home this moment, and fetch me a pair of boots.', '2018-12-27 13:48:31', '2018-12-27 13:48:31');
INSERT INTO public.records VALUES (2, '1995-11-26', 'Lory, with a pair of boots every Christmas.'' And she began again: ''Ou est ma chatte?'' which was the first figure!'' said the Gryphon. ''I''ve forgotten the little passage: and THEN--she found herself.', '2018-12-27 13:48:31', '2018-12-27 13:48:31');
INSERT INTO public.records VALUES (3, '2006-02-11', 'Quick, now!'' And Alice was silent. The King turned pale, and shut his eyes.--''Tell her about the crumbs,'' said the Cat. ''I don''t see any wine,'' she remarked. ''It tells the day of the wood--(she.', '2018-12-27 13:48:31', '2018-12-27 13:48:31');
INSERT INTO public.records VALUES (4, '2009-02-27', 'I shall fall right THROUGH the earth! How funny it''ll seem to come out among the bright flower-beds and the baby joined):-- ''Wow! wow! wow!'' ''Here! you may SIT down,'' the King very decidedly, and.', '2018-12-27 13:48:31', '2018-12-27 13:48:31');
INSERT INTO public.records VALUES (5, '2010-02-13', 'I should like to be lost, as she ran. ''How surprised he''ll be when he sneezes; For he can EVEN finish, if he had come to the Knave. The Knave shook his head off outside,'' the Queen merely remarking.', '2018-12-27 13:48:31', '2018-12-27 13:48:31');
INSERT INTO public.records VALUES (6, '1981-06-07', 'Eaglet. ''I don''t think it''s at all for any of them. However, on the top of her head to feel which way it was only sobbing,'' she thought, ''it''s sure to make ONE respectable person!'' Soon her eye fell.', '2018-12-27 18:41:32', '2018-12-27 18:41:32');
INSERT INTO public.records VALUES (7, '2009-12-18', 'Rabbit began. Alice gave a sudden burst of tears, until there was a child,'' said the Caterpillar. Alice folded her hands, wondering if anything would EVER happen in a coaxing tone, and added ''It.', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.records VALUES (8, '2014-04-19', 'How puzzling all these changes are! I''m never sure what I''m going to shrink any further: she felt that she tipped over the fire, and at once to eat or drink under the door; so either way I''ll get.', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.records VALUES (9, '2001-10-23', 'Alice did not dare to laugh; and, as there was a body to cut it off from: that he had taken his watch out of the words ''DRINK ME,'' but nevertheless she uncorked it and put back into the garden, and.', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.records VALUES (10, '2002-09-05', 'Duchess. An invitation from the change: and Alice rather unwillingly took the watch and looked at it again: but he now hastily began again, using the ink, that was trickling down his cheeks, he went.', '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.records VALUES (11, '2019-09-27', 'So Bill''s got to the three gardeners, but she could guess, she was exactly one a-piece all round. (It was this last remark. ''Of course they were'', said the Dormouse, without considering at all know.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.records VALUES (12, '2019-04-16', 'Which way?'', holding her hand again, and said, ''So you think you''re changed, do you?'' ''I''m afraid I can''t understand it myself to begin at HIS time of life. The King''s argument was, that her neck.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.records VALUES (13, '2019-08-27', 'COULD he turn them out again. That''s all.'' ''Thank you,'' said Alice, who had got so much into the garden door. Poor Alice! It was opened by another footman in livery came running out of sight: ''but.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.records VALUES (14, '2019-12-10', 'Alice began to get us dry would be the use of this rope--Will the roof of the water, and seemed not to be a queer thing, to be beheaded!'' ''What for?'' said Alice. ''Well, I hardly know--No more, thank.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.records VALUES (15, '2019-07-20', 'While the Owl and the constant heavy sobbing of the deepest contempt. ''I''ve seen a rabbit with either a waistcoat-pocket, or a serpent?'' ''It matters a good deal frightened by this time, sat down a.', '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: reserves; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.reserves VALUES (1, '2009-10-05', 14211, true, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 6, 7);
INSERT INTO public.reserves VALUES (2, '1984-04-20', 11895, false, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 7, 9);
INSERT INTO public.reserves VALUES (3, '1989-05-08', 16225, false, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 1, 7);
INSERT INTO public.reserves VALUES (4, '1981-04-09', 6806, false, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 5, 2);
INSERT INTO public.reserves VALUES (5, '1989-02-03', 16011, true, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 9, 6);
INSERT INTO public.reserves VALUES (6, '1978-05-04', 2865, false, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 1, 8);
INSERT INTO public.reserves VALUES (7, '2008-04-28', 10127, false, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 6, 7);
INSERT INTO public.reserves VALUES (8, '1989-02-19', 13472, false, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 5, 8);
INSERT INTO public.reserves VALUES (9, '2012-01-27', 5237, true, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 9, 3);
INSERT INTO public.reserves VALUES (10, '1992-07-13', 16051, true, '2018-12-27 13:48:32', '2018-12-27 13:48:32', 5, 10);
INSERT INTO public.reserves VALUES (11, '2016-03-16', 18478, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 11, 16);
INSERT INTO public.reserves VALUES (12, '2009-06-08', 7951, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 15, 2);
INSERT INTO public.reserves VALUES (13, '1997-04-17', 10652, false, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 12, 7);
INSERT INTO public.reserves VALUES (14, '1986-07-31', 9411, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 11, 17);
INSERT INTO public.reserves VALUES (15, '2017-05-29', 7172, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 11, 13);
INSERT INTO public.reserves VALUES (16, '1971-12-13', 7892, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 9, 18);
INSERT INTO public.reserves VALUES (17, '2012-09-16', 10588, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 4, 1);
INSERT INTO public.reserves VALUES (18, '1971-04-02', 4876, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 6, 20);
INSERT INTO public.reserves VALUES (19, '2017-04-15', 536, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 8, 9);
INSERT INTO public.reserves VALUES (20, '1993-01-08', 12629, true, '2018-12-27 18:41:34', '2018-12-27 18:41:34', 20, 1);
INSERT INTO public.reserves VALUES (21, '2019-07-30', 6078, false, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 19, 15);
INSERT INTO public.reserves VALUES (22, '2019-08-10', 16120, true, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 5, 8);
INSERT INTO public.reserves VALUES (23, '2019-06-12', 4505, false, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 25, 3);
INSERT INTO public.reserves VALUES (24, '2019-12-13', 5896, false, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 29, 5);
INSERT INTO public.reserves VALUES (25, '2019-10-07', 14232, false, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 10, 29);
INSERT INTO public.reserves VALUES (26, '2019-03-20', 3030, false, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 1, 11);
INSERT INTO public.reserves VALUES (27, '2019-08-25', 15108, true, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 20, 9);
INSERT INTO public.reserves VALUES (28, '2019-11-30', 16601, false, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 12, 1);
INSERT INTO public.reserves VALUES (29, '2019-10-24', 514, true, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 23, 20);
INSERT INTO public.reserves VALUES (30, '2019-11-30', 11126, true, '2018-12-27 18:50:47', '2018-12-27 18:50:47', 4, 22);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.roles VALUES (1, 1, NULL, NULL);
INSERT INTO public.roles VALUES (2, 1, NULL, NULL);
INSERT INTO public.roles VALUES (3, 1, NULL, NULL);


--
-- Data for Name: segments; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.segments VALUES (1, 'Madelynstad', 54, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (2, 'Sophieview', 34, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (3, 'Ashtynfurt', 87, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (4, 'New Ottilieville', 42, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (5, 'Nealport', 52, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (6, 'Hirthemouth', 65, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (7, 'Johnstonbury', 21, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (8, 'Huelville', 31, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (9, 'Fredericshire', 99, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (10, 'Jaylanport', 20, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (11, 'Lake Alisatown', 62, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (12, 'New Benton', 75, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (13, 'Florianbury', 13, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (14, 'Bartolettihaven', 42, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (15, 'South Arlie', 89, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.segments VALUES (16, 'South Enid', 33, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (17, 'Santiagotown', 89, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (18, 'Catalinabury', 76, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (19, 'Schmittfort', 40, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (20, 'West Cleo', 76, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (21, 'Port Omer', 32, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (22, 'West Deangeloport', 14, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (23, 'Jayport', 53, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (24, 'New Alexieton', 42, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (25, 'Port Coralie', 53, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (26, 'Pabloside', 46, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (27, 'Labadieton', 88, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (28, 'Micahberg', 22, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (29, 'Funkmouth', 62, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (30, 'West Douglasbury', 21, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.segments VALUES (31, 'South Santafurt', 88, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (32, 'Paucekland', 95, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (33, 'Markburgh', 64, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (34, 'East Earlenefort', 57, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (35, 'Baumbachfurt', 73, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (36, 'Russelton', 92, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (37, 'Osinskiberg', 33, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (38, 'South Ethel', 53, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (39, 'Katlynnmouth', 25, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (40, 'Lake Camdenborough', 55, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (41, 'Raventon', 82, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (42, 'Lake Katrine', 70, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (43, 'Lake Alleneland', 74, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (44, 'Camilashire', 82, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.segments VALUES (45, 'South Unique', 97, '2018-12-27 18:50:47', '2018-12-27 18:50:47');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: homestead
--

INSERT INTO public.users VALUES (1, 1, 2, 'Constance Mayert', 'Schneider', 73, 'dayna06@example.com', NULL, '25', '11', false, 'WHAT?'' thought Alice; ''but a grin without a grin,'' thought Alice; ''I must go by the Hatter, ''or you''ll be telling me next that you never tasted an egg!'' ''I HAVE tasted eggs, certainly,'' said Alice.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (2, 1, 5, 'Dr. Christ Terry', 'Walker', 12, 'nicole32@example.net', NULL, '71', '64', true, 'HERE.'' ''But then,'' thought Alice, ''and why it is to find that the meeting adjourn, for the Dormouse,'' thought Alice; but she stopped hastily, for the pool of tears which she had somehow fallen into.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (3, 1, 5, 'Sarina Harvey', 'Jakubowski', 24, 'cummings.cordia@example.org', NULL, '75', '91', false, 'Said the mouse doesn''t get out." Only I don''t put my arm round your waist,'' the Duchess and the White Rabbit read out, at the house, quite forgetting in the pool a little glass table. ''Now, I''ll.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (4, 1, 5, 'Ron Hand', 'Ratke', 23, 'ferne.smith@example.net', NULL, '35', '65', false, 'Mind now!'' The poor little thing howled so, that Alice had not gone (We know it to make the arches. The chief difficulty Alice found at first was moderate. But the snail replied "Too far, too far!".', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (5, 1, 5, 'Lelia Johns', 'Runte', 49, 'ggrant@example.net', NULL, '60', '58', true, 'Mock Turtle, ''they--you''ve seen them, of course?'' ''Yes,'' said Alice sharply, for she had been wandering, when a cry of ''The trial''s beginning!'' was heard in the lap of her childhood: and how she.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (6, 1, 4, 'Dillon Cronin', 'Boyer', 35, 'clifford99@example.com', NULL, '71', '56', false, 'How brave they''ll all think me at home! Why, I wouldn''t be so proud as all that.'' ''Well, it''s got no sorrow, you know. Please, Ma''am, is this New Zealand or Australia?'' (and she tried to fancy to.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (7, 1, 5, 'Prof. Melvina Huel Sr.', 'Parker', 72, 'ova80@example.com', NULL, '24', '40', false, 'And yet I wish I hadn''t cried so much!'' said Alice, ''I''ve often seen a cat without a grin,'' thought Alice; but she was in a tone of great dismay, and began bowing to the King, looking round the.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (8, 1, 4, 'Valentina Doyle', 'Doyle', 56, 'howell.allan@example.com', NULL, '65', '5', false, 'Cheshire Cat sitting on a little of the right-hand bit to try the effect: the next witness. It quite makes my forehead ache!'' Alice watched the White Rabbit as he spoke, and the choking of the court.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (9, 1, 1, 'Maudie Kozey', 'Ritchie', 60, 'vern74@example.net', NULL, '90', '22', true, 'It was all about, and called out, ''First witness!'' The first thing I''ve got to see if there are, nobody attends to them--and you''ve no idea what a long time together.'' ''Which is just the case with.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (10, 1, 4, 'Rosella Swift I', 'Kuhlman', 77, 'sabina.frami@example.com', NULL, '71', '32', true, 'VERY nearly at the bottom of a tree in front of the evening, beautiful Soup! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop!.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (11, 1, 4, 'Jillian Crooks', 'Bechtelar', 34, 'stefan84@example.net', NULL, '88', '32', true, 'Queen. An invitation from the time when she had got its head impatiently, and walked two and two, as the doubled-up soldiers were silent, and looked very uncomfortable. The moment Alice appeared.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (12, 1, 1, 'Ceasar Aufderhar II', 'Stamm', 1, 'roberts.gwendolyn@example.net', NULL, '22', '38', false, 'Bill,'' thought Alice,) ''Well, I hardly know--No more, thank ye; I''m better now--but I''m a deal too far off to other parts of the party went back for a dunce? Go on!'' ''I''m a poor man, your Majesty,''.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (13, 1, 4, 'Reyna Pacocha', 'Bradtke', 34, 'uhowell@example.net', NULL, '43', '1', false, 'The table was a dead silence. Alice was silent. The King laid his hand upon her knee, and the Panther were sharing a pie--'' [later editions continued as follows The Panther took pie-crust, and.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (14, 1, 1, 'Prof. Hudson Reilly', 'Fay', 20, 'natalia36@example.org', NULL, '52', '45', true, 'King. ''I can''t explain MYSELF, I''m afraid, but you might do something better with the time,'' she said, ''than waste it in less than no time to hear it say, as it turned a corner, ''Oh my ears and the.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (15, 1, 4, 'Mr. Bennie Grimes', 'Zulauf', 56, 'fhoeger@example.org', NULL, '78', '45', false, 'Alice sadly. ''Hand it over afterwards, it occurred to her daughter ''Ah, my dear! I shall have to ask any more if you''d like it very nice, (it had, in fact, a sort of mixed flavour of cherry-tart.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (16, 1, 2, 'Ivory Beer', 'Volkman', 40, 'haleigh91@example.org', NULL, '38', '10', false, 'Alice had no pictures or conversations?'' So she began thinking over other children she knew the right thing to nurse--and she''s such a curious feeling!'' said Alice; ''it''s laid for a little timidly.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (17, 1, 2, 'Sabrina O''Keefe', 'Lehner', 45, 'willms.alexys@example.net', NULL, '57', '86', true, 'Even the Duchess said to the jury, and the whole pack rose up into hers--she could hear the very middle of the house, and wondering what to uglify is, you ARE a simpleton.'' Alice did not much.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (18, 1, 1, 'Mrs. Angelita Pouros II', 'Smitham', 30, 'brando.lockman@example.net', NULL, '60', '54', true, 'Alice did not much surprised at her as hard as he wore his crown over the verses to himself: ''"WE KNOW IT TO BE TRUE--" that''s the jury, in a dreamy sort of life! I do hope it''ll make me grow large.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (19, 1, 2, 'Berry Schoen', 'Graham', 12, 'dovie16@example.net', NULL, '22', '13', true, 'And yet I don''t take this young lady to see its meaning. ''And just as well. The twelve jurors were writing down ''stupid things!'' on their backs was the White Rabbit hurried by--the frightened Mouse.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (20, 1, 5, 'Randi Yundt', 'Fahey', 51, 'kirlin.fanny@example.net', NULL, '17', '46', false, 'First it marked out a box of comfits, (luckily the salt water had not gone far before they saw her, they hurried back to the door, and the arm that was linked into hers began to feel a little.', NULL, '2018-12-27 13:48:32', '2018-12-27 13:48:32');
INSERT INTO public.users VALUES (21, 1, 7, 'Rickie Mueller', 'Olson', 56, 'grady.ernesto@example.com', NULL, '90', '71', false, 'Do cats eat bats? Do cats eat bats?'' and sometimes, ''Do bats eat cats?'' for, you see, Alice had never left off writing on his spectacles and looked at it again: but he would not stoop? Soup of the.', NULL, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.users VALUES (22, 1, 5, 'Prof. Luisa O''Reilly III', 'Schulist', 58, 'martina.nicolas@example.com', NULL, '52', '80', false, 'Gryphon never learnt it.'' ''Hadn''t time,'' said the Hatter, it woke up again as quickly as she could, and soon found out a race-course, in a tone of great surprise. ''Of course it is,'' said the.', NULL, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.users VALUES (23, 1, 4, 'Mr. Arnaldo Marvin', 'Swaniawski', 86, 'herzog.rhoda@example.com', NULL, '53', '85', true, 'I''ve been changed for Mabel! I''ll try and repeat "''TIS THE VOICE OF THE SLUGGARD,"'' said the King: ''however, it may kiss my hand if it had VERY long claws and a fan! Quick, now!'' And Alice was very.', NULL, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.users VALUES (24, 1, 7, 'Dr. Clay Kuhlman', 'Buckridge', 57, 'zstanton@example.org', NULL, '42', '33', false, 'Queen said to the beginning again?'' Alice ventured to taste it, and then all the rest of the month, and doesn''t tell what o''clock it is!'' ''Why should it?'' muttered the Hatter. ''Stolen!'' the King was.', NULL, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.users VALUES (25, 1, 4, 'Miss Bette Gleichner III', 'McDermott', 45, 'juana53@example.net', NULL, '69', '77', false, 'Some of the Queen in front of them, with her head!'' Alice glanced rather anxiously at the time they had settled down in a game of croquet she was talking. ''How CAN I have ordered''; and she grew no.', NULL, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.users VALUES (26, 1, 10, 'Maureen Sawayn', 'Greenholt', 33, 'urolfson@example.com', NULL, '52', '54', false, 'Alice, ''and why it is all the things I used to read fairy-tales, I fancied that kind of rule, ''and vinegar that makes them so often, of course you know about this business?'' the King say in a.', NULL, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.users VALUES (27, 1, 2, 'Keven Renner IV', 'Stamm', 59, 'edward96@example.org', NULL, '69', '95', true, 'King was the first question, you know.'' He was an old crab, HE was.'' ''I never thought about it,'' said Alice to herself. ''Of the mushroom,'' said the Mock Turtle. ''No, no! The adventures first,'' said.', NULL, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.users VALUES (28, 1, 5, 'Kennedy Gulgowski DVM', 'Parisian', 79, 'qrogahn@example.org', NULL, '100', '77', true, 'In another moment down went Alice like the Queen?'' said the Dodo could not remember ever having seen such a dreadful time.'' So Alice got up very carefully, remarking, ''I really must be getting home.', NULL, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.users VALUES (29, 1, 5, 'Ruth Greenfelder', 'Bergnaum', 7, 'heller.kaitlin@example.com', NULL, '72', '29', false, 'NOT, being made entirely of cardboard.) ''All right, so far,'' said the Lory. Alice replied eagerly, for she thought, and it put the Dormouse indignantly. However, he consented to go nearer till she.', NULL, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.users VALUES (30, 1, 9, 'Malinda Ryan', 'Johnston', 75, 'kutch.mario@example.com', NULL, '67', '25', false, 'THE.', NULL, '2018-12-27 18:41:33', '2018-12-27 18:41:33');
INSERT INTO public.users VALUES (31, 1, 10, 'Jed Torphy', 'Buckridge', 42, 'oda.effertz@example.net', NULL, '13', '64', true, 'I begin, please your Majesty!'' the Duchess was VERY ugly; and secondly, because she was nine feet high. ''I wish you wouldn''t have come here.'' Alice didn''t think that very few little girls eat eggs.', NULL, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.users VALUES (32, 1, 5, 'Aubrey Corwin', 'Toy', 29, 'alford57@example.com', NULL, '96', '88', true, 'Very soon the Rabbit came near her, she began, in rather a handsome pig, I think.'' And she squeezed herself up and repeat "''TIS THE VOICE OF THE SLUGGARD,"'' said the Hatter. ''Does YOUR watch tell.', NULL, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.users VALUES (33, 1, 5, 'Alvena Waelchi', 'O''Connell', 78, 'leannon.taylor@example.com', NULL, '70', '76', false, 'It did so indeed, and much sooner than she had hurt the poor animal''s feelings. ''I quite forgot how to speak with. Alice waited till the eyes appeared, and then hurried on, Alice started to her full.', NULL, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.users VALUES (34, 1, 4, 'Lavada Zieme', 'Dickinson', 33, 'bbeatty@example.net', NULL, '98', '92', true, 'Time as well be at school at once.'' However, she got up, and there stood the Queen till she fancied she heard a little shaking among the distant green leaves. As there seemed to be executed for.', NULL, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.users VALUES (35, 1, 3, 'Prof. Hilton Rowe MD', 'Nicolas', 62, 'renee.huels@example.org', NULL, '65', '13', true, 'Alice. ''Then you should say "With what porpoise?"'' ''Don''t you mean "purpose"?'' said Alice. ''Well, then,'' the Gryphon at the door--I do wish they WOULD go with the other: he came trotting along in a.', NULL, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.users VALUES (36, 1, 9, 'Isabelle Shields', 'Nienow', 56, 'vcrona@example.org', NULL, '10', '44', false, 'Turtle.'' These words were followed by a row of lamps hanging from the roof. There were doors all round the rosetree; for, you see, Miss, we''re doing our best, afore she comes, to--'' At this the.', NULL, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.users VALUES (37, 1, 8, 'Prof. Kylie Watsica', 'Labadie', 26, 'mosciski.brisa@example.com', NULL, '56', '32', false, 'LITTLE larger, sir, if you hold it too long; and that in some book, but I hadn''t to bring tears into her eyes--and still as she was going to be, from one minute to another! However, I''ve got to the.', NULL, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.users VALUES (38, 1, 1, 'Ms. Antoinette Yost I', 'Fritsch', 63, 'ofeest@example.org', NULL, '87', '64', false, 'I can remember feeling a little glass box that was said, and went on just as well as if it makes me grow large again, for she was as long as you say it.'' ''That''s nothing to what I should think!''.', NULL, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.users VALUES (39, 1, 5, 'Cordia Mayer', 'Bednar', 43, 'sschmeler@example.org', NULL, '48', '84', true, 'Alice said to the jury, and the poor child, ''for I never understood what it might injure the brain; But, now that I''m doubtful about the crumbs,'' said the Cat; and this was not easy to know when the.', NULL, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.users VALUES (40, 1, 5, 'Margret Mraz', 'Russel', 78, 'cmccullough@example.net', NULL, '31', '24', true, 'Hatter went on in a large kitchen, which was a large fan in the same when I was going to leave off being arches to do it.'' (And, as you might catch a bad cold if she had someone to listen to her.', NULL, '2018-12-27 18:41:34', '2018-12-27 18:41:34');
INSERT INTO public.users VALUES (41, 1, 3, 'Delia D''Amore', 'Nader', 45, 'amir74@example.net', NULL, '50', '79', false, 'As she said to live. ''I''ve seen a cat without a great hurry, muttering to itself ''The Duchess! The Duchess! Oh my fur and whiskers! She''ll get me executed, as sure as ferrets are ferrets! Where CAN.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (42, 1, 7, 'Martina Davis', 'Boyer', 13, 'maiya82@example.com', NULL, '31', '13', false, 'I ever heard!'' ''Yes, I think I should think it would all come wrong, and she went nearer to make out who was sitting on a three-legged stool in the last few minutes, and began talking again.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (43, 1, 1, 'Miss Juliet Mraz', 'Upton', 62, 'schumm.dallas@example.com', NULL, '98', '65', false, 'Duchess: ''flamingoes and mustard both bite. And the moral of that is--"Be what you mean,'' said Alice. ''Off with her head!'' Alice glanced rather anxiously at the other, and growing sometimes taller.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (44, 1, 15, 'Karson Jakubowski DVM', 'Waelchi', 14, 'vwilliamson@example.com', NULL, '3', '28', true, 'How puzzling all these strange Adventures of hers would, in the last words out loud, and the blades of grass, but she remembered that she was appealed to by all three to settle the question, and.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (45, 1, 5, 'Haley Paucek', 'Dibbert', 29, 'kevin55@example.org', NULL, '59', '75', true, 'SWIM--" you can''t think! And oh, I wish I hadn''t drunk quite so much!'' Alas! it was written to nobody, which isn''t usual, you know.'' ''I don''t see how he did it,) he did it,) he did not like to be.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (46, 1, 13, 'Eloise Schaden', 'Macejkovic', 95, 'wyman41@example.net', NULL, '52', '77', true, 'I suppose you''ll be telling me next that you think you might do something better with the glass table and the pattern on their faces, and the arm that was lying under the circumstances. There was.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (47, 1, 14, 'Marilou Baumbach', 'Senger', 45, 'merle.cruickshank@example.com', NULL, '87', '64', true, 'King. The next thing was to eat her up in spite of all this time. ''I want a clean cup,'' interrupted the Gryphon. ''We can do no more, whatever happens. What WILL become of me? They''re dreadfully fond.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (48, 1, 2, 'Deondre Reynolds', 'Larson', 33, 'xborer@example.com', NULL, '28', '54', true, 'However, at last it sat down at her feet in a louder tone. ''ARE you to offer it,'' said the Duck. ''Found IT,'' the Mouse was bristling all over, and both the hedgehogs were out of breath, and till the.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (49, 1, 8, 'Prof. Emerald Blanda PhD', 'Tromp', 7, 'hayes.omer@example.com', NULL, '22', '18', false, 'But she went on. ''We had the dish as its share of the moment she quite forgot you didn''t like cats.'' ''Not like cats!'' cried the Gryphon, with a sudden leap out of the shepherd boy--and the sneeze of.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (50, 1, 2, 'Donavon Grant', 'Keebler', 63, 'antwon.brown@example.net', NULL, '93', '62', true, 'Queen: so she set to work very carefully, remarking, ''I really must be the use of a treacle-well--eh, stupid?'' ''But they were lying round the rosetree; for, you see, as well as she fell very slowly.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (51, 1, 8, 'Adela Nader', 'Smith', 37, 'freida24@example.net', NULL, '35', '67', true, 'These were the verses to himself: ''"WE KNOW IT TO BE TRUE--" that''s the jury, and the baby at her for a good many voices all talking at once, she found to be no doubt that it felt quite unhappy at.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (52, 1, 7, 'Katlyn Kris', 'Hayes', 58, 'leslie37@example.com', NULL, '4', '5', true, 'And I declare it''s too bad, that it was quite a conversation of it appeared. ''I don''t think--'' ''Then you keep moving round, I suppose?'' said Alice. ''Why, you don''t know what it was: she was saying.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (53, 1, 4, 'Dr. Jettie Daniel', 'Friesen', 25, 'jed28@example.net', NULL, '42', '56', true, 'Caucus-Race and a large one, but the Dodo could not make out what it was: at first was in livery: otherwise, judging by his garden."'' Alice did not like the right distance--but then I wonder what.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (54, 1, 3, 'Randy Hackett IV', 'Luettgen', 19, 'macy39@example.org', NULL, '84', '97', false, 'So she stood still where she was, and waited. When the Mouse had changed his mind, and was beating her violently with its eyelids, so he did,'' said the Caterpillar. ''Well, perhaps not,'' said the.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (55, 1, 15, 'Macy Williamson', 'Carter', 6, 'zarmstrong@example.com', NULL, '21', '71', false, 'I suppose, by being drowned in my kitchen AT ALL. Soup does very well as the soldiers did. After these came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (56, 1, 5, 'Prof. Philip Ziemann', 'Conn', 8, 'qcarroll@example.net', NULL, '44', '31', false, 'AND WASHING--extra."'' ''You couldn''t have wanted it much,'' said the Mouse. ''Of course,'' the Gryphon said to the Knave of Hearts, she made her so savage when they liked, and left foot, so as to size,''.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (57, 1, 13, 'Moises Macejkovic', 'Stehr', 35, 'libbie92@example.net', NULL, '61', '5', true, 'Who in the distance, screaming with passion. She had not gone much farther before she gave her answer. ''They''re done with blacking, I believe.'' ''Boots and shoes under the sea,'' the Gryphon said to.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (58, 1, 10, 'Ms. Ruthie Gutkowski PhD', 'VonRueden', 97, 'giovanny43@example.com', NULL, '48', '81', false, 'Alice, in a long, low hall, which was full of smoke from one of the words ''DRINK ME,'' but nevertheless she uncorked it and put back into the wood to listen. The Fish-Footman began by producing from.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (59, 1, 5, 'Jarred Macejkovic IV', 'White', 88, 'jdaniel@example.org', NULL, '48', '92', false, 'Rabbit coming to look over their slates; ''but it sounds uncommon nonsense.'' Alice said nothing; she had brought herself down to them, and just as well go back, and barking hoarsely all the children.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');
INSERT INTO public.users VALUES (60, 1, 9, 'Miss Reina Lind V', 'Keebler', 33, 'qdickens@example.org', NULL, '30', '33', false, 'No room!'' they cried out when they met in the air, I''m afraid, but you might catch a bat, and that''s all the time they had at the White Rabbit interrupted: ''UNimportant, your Majesty means, of.', NULL, '2018-12-27 18:50:47', '2018-12-27 18:50:47');

