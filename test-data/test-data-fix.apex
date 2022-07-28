// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// Set Accounts to Vehicle Service Center Record Type
Id recordTypeIdAccount = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Vehicle Service Center').getRecordTypeId();

List<Account> servicers = [SELECT Id, RecordTypeId, Service_Phone__c FROM Account WHERE Service_Phone__c != null];

for(Account servicer : servicers){
    servicer.RecordTypeId = recordTypeIdAccount;
}
update servicers;

// Set Installed Items as accessories
Id accessoryRecordType = Schema.SObjectType.Vehicle_Inventory_Item__c.getRecordTypeInfosByName().get('Accessory').getRecordTypeId();

List<Vehicle_Inventory_Item__c> accessories = [SELECT Id, RecordTypeId, Vehicle__c FROM Vehicle_Inventory_Item__c WHERE Vehicle__c != null];

for(Vehicle_Inventory_Item__c accessory : accessories){
    accessory.RecordTypeId = accessoryRecordType;
}
update accessories;

// Set Tool Inventory Items
Id toolRecordType = Schema.SObjectType.Vehicle_Inventory_Item__c.getRecordTypeInfosByName().get('Tool').getRecordTypeId();

List<Vehicle_Inventory_Item__c> tools = [SELECT Id, RecordTypeId, Collection__c FROM Vehicle_Inventory_Item__c WHERE Collection__r.Name = 'Detailing Tools'];

for(Vehicle_Inventory_Item__c tool : tools){
    tool.RecordTypeId = toolRecordType;
}
update tools;

// Set Consumable Inventory Items
Id consumableRecordType = Schema.SObjectType.Vehicle_Inventory_Item__c.getRecordTypeInfosByName().get('Consumable').getRecordTypeId();

List<Vehicle_Inventory_Item__c> consumables = [SELECT Id, RecordTypeId, Collection__c FROM Vehicle_Inventory_Item__c WHERE Collection__r.Name = 'Glass Cleaners' OR Collection__r.Name = 'Paint Protection'];

for(Vehicle_Inventory_Item__c consumable : consumables){
    consumable.RecordTypeId = consumableRecordType;
}
update consumables;
