# Test Data Readme File

## Scripts
### Import

sfdx force:data:tree:import -u sfdxMotorHead -p test-data/motor-data-plan.json

### Export
#### Account
sfdx force:data:tree:export -u DevHub -q "SELECT Id, Name, Type, RecordTypeId, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, Phone, AccountNumber, Website, Industry, Ownership, Description, Rating, Site, AccountSource, YearStarted, Service_Phone__c FROM Account WHERE RecordType.Name = 'Vehicle Service Center'" -x motor-data -d test-data -p

#### Vehicle with Inventory and Maintenance
sfdx force:data:tree:export -u DevHub -q "SELECT Id, Name, APR__c, Acquisition_Date__c, Acquisition_Type__c, Drivetrain__c, Engine__c, Exterior_Color__c, Interior_Color__c, Make__c, Model__c, Options__c, Packages__c, Purchase_Price__c, Specifications__c, Term__c, Transmission__c, VIN__c, Year__c,(SELECT Id, Name, RecordTypeId, Consumable_Quantity_Available__c, Description__c, Estimated_Delivery_Date__c, Manufacturer__c, Model__c, On_hand_Quantity__c, Order_Number__c, ProductLink__c, Purchase_Date__c, Purchased_Quantity__c, Reseller__c, Status__c, Total_Price__c, Type__c, Unit_Price__c, Vehicle__c FROM Inventory_Items__r),(SELECT Id, Name, RecordTypeId, Vehicle__c, Date_Completed__c, Issue__c, Labor__c, Parts__c, Service_Center__c, Taxes_and_Surcharges__c, Work_Completed__c, Work_Type__c FROM Vehicle_Maintenances__r) FROM Vehicle__c" -x motor-data -d test-data -p

#### Warehouse Collections with Inventory
sfdx force:data:tree:export -u DevHub -q "SELECT Id, Name,(SELECT Id, Name, RecordTypeId, Collection__c, Consumable_Quantity_Available__c, Description__c, Estimated_Delivery_Date__c, Manufacturer__c, Model__c, On_hand_Quantity__c, Order_Number__c, ProductLink__c, Purchase_Date__c, Purchased_Quantity__c, Reseller__c, Status__c, Type__c, Unit_Price__c FROM Inventory_Items__r) FROM Warehouse__c" -x motor-data -d test-data -p

### Queries
#### Accounts
SELECT Id, Name, Type, RecordTypeId, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, Phone, AccountNumber, Website, Industry, Ownership, Description, Rating, Site, AccountSource, YearStarted, Service_Phone__c FROM Account WHERE RecordType.Name = 'Vehicle Service Center'

#### Vehicles
SELECT Id, Name, APR__c, Acquisition_Date__c, Acquisition_Type__c, Drivetrain__c, Engine__c, Exterior_Color__c, Interior_Color__c, Make__c, Model__c, Options__c, Packages__c, Purchase_Price__c, Specifications__c, Term__c, Transmission__c, VIN__c, Year__c FROM Vehicle__c


#### Vehicle Inventory Items
When writing export scripts at the parent (Vehicle and Warehouse) you should get all the data.

SELECT Id, Name, RecordTypeId, Collection__c, Consumable_Quantity_Available__c, Description__c, Estimated_Delivery_Date__c, Manufacturer__c, Model__c, On_hand_Quantity__c, Order_Number__c, ProductLink__c, Purchase_Date__c, Purchased_Quantity__c, Reseller__c, Status__c, Type__c, Unit_Price__c FROM Vehicle_Inventory_Item__c

#### Job Resource
Do not query, just build file, the name is autonumbered and is just a junction object.