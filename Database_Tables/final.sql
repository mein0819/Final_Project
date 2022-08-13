CREATE TABLE HVI_data (
	"Date" DATE NOT NULL,
	"City" VARCHAR NOT NULL,
	"State" VARCHAR NOT NULL,
	"HVI" DECIMAL,
	"%Change_HVI" DECIMAL
);

CREATE TABLE Rent_data (
	"Date" DATE NOT NULL,
	"City" VARCHAR NOT NULL,
	"State" VARCHAR NOT NULL,
	"Avg_Rent" DECIMAL,
	"%Change_Rent" DECIMAL
);

CREATE TABLE List_Price (
	"Date" DATE NOT NULL,
	"City" VARCHAR NOT NULL,
	"State" VARCHAR NOT NULL,
	"Avg_List_Price" DECIMAL,
	"%Change_LP" DECIMAL
);

CREATE TABLE Sale_data (
	"Date" DATE NOT NULL,
	"City" VARCHAR NOT NULL,
	"State" VARCHAR NOT NULL,
	"Avg_Sale_Price" DECIMAL,
	"%Change_SP" DECIMAL
);

SELECT * FROM hvi_data

SELECT
L."Date", L."City", L."State", L."Avg_List_Price", L."%Change_LP",
s."Avg_Sale_Price", s."%Change_SP",
h."HVI", h."%Change_HVI",
r."Avg_Rent", r."%Change_Rent"
INTO
housing_data
FROM
hvi_data h
JOIN
list_price L
ON
L."Date"=h."Date" AND
L."City"=h."City" AND
L."State"=h."State"
JOIN
sale_data s
ON
s."Date"=h."Date" AND
s."City"=h."City" AND
s."State"=h."State"
JOIN
rent_data r
ON
r."Date"=h."Date" AND
r."City"=h."City" AND
r."State"=h."State"
