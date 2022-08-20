CREATE TABLE HVI_data (
	"Date" DATE NOT NULL,
	"City" VARCHAR NOT NULL,
	"State" VARCHAR NOT NULL,
	"SizeRank" INT,
	"HVI" DECIMAL,
	"%Change_HVI" DECIMAL
);

CREATE TABLE Rent_data (
	"Date" DATE NOT NULL,
	"City" VARCHAR NOT NULL,
	"State" VARCHAR NOT NULL,
	"SizeRank" INT,
	"Avg_Rent" DECIMAL,
	"%Change_Rent" DECIMAL
);

CREATE TABLE List_Price (
	"Date" DATE NOT NULL,
	"City" VARCHAR NOT NULL,
	"State" VARCHAR NOT NULL,
	"SizeRank" INT,
	"Avg_List_Price" DECIMAL,
	"%Change_LP" DECIMAL
);

CREATE TABLE Sale_data (
	"Date" DATE NOT NULL,
	"City" VARCHAR NOT NULL,
	"State" VARCHAR NOT NULL,
	"SizeRank" INT,
	"Avg_Sale_Price" DECIMAL,
	"%Change_SP" DECIMAL
);

CREATE TABLE new_listings (
	"Date" DATE NOT NULL,
	"City" VARCHAR NOT NULL,
	"State" VARCHAR NOT NULL,
	"SizeRank" INT,
	"New_Listings" DECIMAL
);

CREATE TABLE sale_inv (
	"Date" DATE NOT NULL,
	"City" VARCHAR NOT NULL,
	"State" VARCHAR NOT NULL,
	"SizeRank" INT,
	"ForSale_Inv" DECIMAL
);

SELECT * FROM housing_data
SELECT count(*) FROM housing_data
SELECT "Date", "City", "State", COUNT(*) FROM housing_data
GROUP BY "Date", "City","State" HAVING COUNT(*) > 1

SELECT
i."Date", i."City", i."State", i."SizeRank", i."ForSale_Inv",
n."New_Listings",
l."Avg_List_Price", l."%Change_LP",
s."Avg_Sale_Price", s."%Change_SP",
h."HVI", h."%Change_HVI",
r."Avg_Rent", r."%Change_Rent"
INTO
housing_data
FROM
hvi_data h
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
JOIN
list_price l
ON
l."Date"=h."Date" AND
l."City"=h."City" AND
l."State"=h."State"
JOIN
sale_inv i
ON
i."Date"=h."Date" AND
i."City"=h."City" AND
i."State"=h."State"
JOIN
new_listings n
ON
n."Date"=h."Date" AND
n."City"=h."City" AND
n."State"=h."State"