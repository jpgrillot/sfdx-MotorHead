/*
 * Apex Test class for VehicleInventoryItemTriggerHandler
*/ 
@isTest
public class VehicleInventoryItemTriggerHandlerTest {
    // Constants
    // Unit Price and Total Price test results expected
    static FINAL decimal unitPrice = 4.00;
    static FINAL decimal totalPrice = 60.00;
    
    // Set up a test Warehouse record
    @TestSetup
    static void testWarehouse(){
        Warehouse__c testWarehouse = new Warehouse__c(Name='Detailing Towels');
        insert testWarehouse;
    }

    // Test behavior when the Unit cost is empty
    @isTest
    public static void testEmptyUnitCost(){
        // Query the Warehouse record
        List <Warehouse__c> wh = [SELECT Id, Name FROM Warehouse__c];
        
        Test.startTest();
        // Get the Id for the Tool record type for Vehicle_Inventory_Item__c
        Id toolRT = Schema.SObjectType.Vehicle_Inventory_Item__c.getRecordTypeInfosByName().get('Tool').getRecordTypeId();
        // Create a test inventory item record with a quantity and total price
        Vehicle_Inventory_Item__c testTowel = new Vehicle_Inventory_Item__c(Name='Red Buffing Towels',Collection__c=wh[0].Id,RecordTypeId=toolRT,Manufacturer__c='AMMO NYC',Model__c='12RMF',Order_Number__c='ANYC1001',Purchase_Date__c=system.today(),Reseller__c='AMMO NYC',Status__c='Ordered',Type__c='Detailing',Purchased_Quantity__c=12,Total_Price__c=48);
        insert testTowel;
        // Check to see if the Unit price was calculated
        System.assertEquals(unitPrice, [SELECT Id, Unit_Price__c FROM Vehicle_Inventory_Item__c].Unit_Price__c, 'Unit Price should be 4');
        Test.stopTest();
    }

    // Test behavior when the Total Cost is empty
    @isTest
    public static void testEmptyTotalCost(){
        // Query the warehouse record
        List <Warehouse__c> tcwh = [SELECT Id, Name FROM Warehouse__c];
        
        Test.startTest();
        // Get the Id for the Tool record type for Vehicle_Inventory_Item__c
        Id toolRT = Schema.SObjectType.Vehicle_Inventory_Item__c.getRecordTypeInfosByName().get('Tool').getRecordTypeId();
        // Create a test inventory item record with a quantity and unit price
        Vehicle_Inventory_Item__c testTowelUnit = new Vehicle_Inventory_Item__c(Name='Red Buffing Towels',Collection__c=tcwh[0].Id,RecordTypeId=toolRT,Manufacturer__c='AMMO NYC',Model__c='12RMF',Order_Number__c='ANYC1001',Purchase_Date__c=system.today(),Reseller__c='AMMO NYC',Status__c='Ordered',Type__c='Detailing',Purchased_Quantity__c=12,Unit_Price__c=5);
        insert testTowelUnit;
        // Check to see if the Total price was calculated
        System.assertEquals(totalPrice, [SELECT Id, Total_Price__c FROM Vehicle_Inventory_Item__c].Total_Price__c, 'Total Price should be '+totalPrice);
        Test.stopTest();
    }

}