CREATE TABLE MedicalEquipmentSuppliers (
ProviderID INTEGER PRIMARY KEY, 
AcceptsAssignment BOOLEAN,
ParticipationBeginDate DATE, 
BusinessName VARCHAR(100),
PracticeName VARCHAR(100), 
PracticeAddress1 VARCHAR(100), 
PracticeAddress2 VARCHAR(100),
PracticeCity VARCHAR(100), 
PracticeState VARCHAR(100), 
PracticeZipCode VARCHAR(100),
TelephoneNumber VARCHAR(100), 
SpecialtiesList VARCHAR(65535), 
ProviderTypeList VARCHAR(65535), 
SuppliesList VARCHAR(65535), 	 
Latitude NUMERIC, 
Longitude NUMERIC, 
IsContractedForCBA BOOLEAN
);

COPY MedicalEquipmentSuppliers
FROM '/Users/Celest/Desktop/MedicalEquipmentSuppliers.csv'
WITH (FORMAT CSV, HEADER);

SELECT * FROM MedicalEquipmentSuppliers;

CREATE TABLE CBPSuppliersProductsCarried (
ProviderID INTEGER, 
CBA VARCHAR(5), 
ProductCategoryCode VARCHAR(3),
HCPCSCode VARCHAR(5), 
Manufacturer VARCHAR(255), 
ProductName VARCHAR(255)
);

COPY cbpsuppliersproductscarried
FROM '/Users/Celest/Desktop/CBPSuppliersProductsCarried.csv'
WITH (FORMAT CSV, HEADER);

SELECT * FROM cbpsuppliersproductscarried;

ALTER TABLE cbpsuppliersproductscarried 
ADD CONSTRAINT providerID FOREIGN KEY (providerid) 
REFERENCES medicalequipmentsuppliers(providerid);

-- How many practices are in each state?

SELECT practicestate, COUNT(*) AS number_of_practices
FROM MedicalEquipmentSuppliers
GROUP BY practicestate
ORDER BY COUNT(*) DESC;

-- Which businesses are most prevalent across the U.S?

SELECT DISTINCT(businessname), COUNT(*)
FROM MedicalEquipmentSuppliers
GROUP BY DISTINCT(businessname)
ORDER BY COUNT(*) DESC;
