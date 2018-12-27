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
