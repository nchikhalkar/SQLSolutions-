--Populate Property Address Data

select *
from Arboratestoredataforsql
order by ParcelID

----If a parcelid has an address and anothere parcelid does not have and address 
--then we can populated by using firstparcelid address by using self join


select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull( a.PropertyAddress,b.PropertyAddress)
from Arboratestoredataforsql a
join Arboratestoredataforsql b
on a.ParcelID = b.ParcelID
and a.UniqueID <> b.UniqueID
where a.PropertyAddress is null
 
-------------------------------------------------------------------------------
--Saperating address into induvidual columns (Address, City, State) by using substring

select PropertyAddress
from Arboratestoredataforsql

 
select 
substring(PropertyAddress,1, charindex(',',PropertyAddress) -1) As Address
, substring(PropertyAddress,charindex(',',PropertyAddress) +1 , len(PropertyAddress)) As Address
from Arboratestoredataforsql
 
--Added New Columns into the table

Alter table Arboratestoredataforsql
add PropertySplitAddr varchar(255);

update Arboratestoredataforsql
set PropertySplitAddr = substring(PropertyAddress,1, charindex(',',PropertyAddress) -1)

Alter table Arboratestoredataforsql
add PropertySplitCity varchar(255);

update Arboratestoredataforsql
set PropertySplitCity = substring(PropertyAddress,charindex(',',PropertyAddress) +1 , len(PropertyAddress))
select *
from Arboratestoredataforsql

 
--Saperating owners address into induvidual columns (Address, City, State) by using sql parsename function
select 
parsename(replace(OwnerAddress, ',', '.'), 3)
,parsename(replace(OwnerAddress, ',', '.'), 2)
,parsename(replace(OwnerAddress, ',', '.'), 1)

from Arboratestoredataforsql

 
--Added New Columns into the table
 Alter table Arboratestoredataforsql
add OwnerSplitAddr varchar(255);

update Arboratestoredataforsql
set OwnerSplitAddr = parsename(replace(OwnerAddress, ',', '.'), 3)

Alter table Arboratestoredataforsql
add OwnerSplitCity varchar(255);

update Arboratestoredataforsql
set OwnerSplitCity = parsename(replace(OwnerAddress, ',', '.'), 2)

Alter table Arboratestoredataforsql
add OwnerSplitState varchar(255);

update Arboratestoredataforsql
set OwnerSplitState = parsename(replace(OwnerAddress, ',', '.'), 1)
select *
from Arboratestoredataforsql

 
--------------------------------------------------------------------------------------------------
--Remove Duplicates by using window functions
finding out duplicate rows

with rownumcte as(
select *,
row_number() over(
    partition by ParcelID,
	PropertyAddress,
	SaleDate,
	SalePrice,
	LegalReference
	order by
	  UniqueID
	  ) rownum
from Arboratestoredataforsql
)
select *
from rownumcte
where rownum > 1
order by PropertyAddress
 
with rownumcte as(
select *,
row_number() over(
    partition by ParcelID,
	PropertyAddress,
	SaleDate,
	SalePrice,
	LegalReference
	order by
	  UniqueID
	  ) rownum
from Arboratestoredataforsql
)
delete
from rownumcte
where rownum > 1
 
--------------------------------------------------------------------------------

--Delete unused column
select *
from Arboratestoredataforsql

alter table Arboratestoredataforsql
drop column OwnerAddress, TaxDistrict, PropertyAddress


