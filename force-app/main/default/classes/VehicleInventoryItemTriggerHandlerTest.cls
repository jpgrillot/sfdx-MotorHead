@isTest
public class VehicleInventoryItemTriggerHandlerTest {
    // Constants
    // Unit Price
    static FINAL decimal unitPrice = 4.00;
    static FINAL decimal totalPrice = 60.00;
    
    @TestSetup
    static void testWarehouse(){
        Warehouse__c testWarehouse = new Warehouse__c(Name='Detailing Towels');
        insert testWarehouse;
    }
    @isTest
    public static void testEmptyUnitCost(){
        List <Warehouse__c> wh = [SELECT Id, Name FROM Warehouse__c];
        
        Test.startTest();
        Id toolRT = Schema.SObjectType.Vehicle_Inventory_Item__c.getRecordTypeInfosByName().get('Tool').getRecordTypeId();
        Vehicle_Inventory_Item__c testTowel = new Vehicle_Inventory_Item__c(Name='Red Buffing Towels',Collection__c=wh[0].Id,RecordTypeId=toolRT,Manufacturer__c='AMMO NYC',Model__c='12RMF',Order_Number__c='ANYC1001',Purchase_Date__c=system.today(),Reseller__c='AMMO NYC',Status__c='Ordered',Type__c='Detailing',Purchased_Quantity__c=12,Total_Price__c=48);
        insert testTowel;
        System.assertEquals(unitPrice, [SELECT Id, Unit_Price__c FROM Vehicle_Inventory_Item__c].Unit_Price__c, 'Unit Price should be 4');
        Test.stopTest();
    }
    @isTest
    public static void testEmptyTotalCost(){
        List <Warehouse__c> tcwh = [SELECT Id, Name FROM Warehouse__c];
        
        Test.startTest();
        Id toolRT = Schema.SObjectType.Vehicle_Inventory_Item__c.getRecordTypeInfosByName().get('Tool').getRecordTypeId();
        Vehicle_Inventory_Item__c testTowelUnit = new Vehicle_Inventory_Item__c(Name='Red Buffing Towels',Collection__c=tcwh[0].Id,RecordTypeId=toolRT,Manufacturer__c='AMMO NYC',Model__c='12RMF',Order_Number__c='ANYC1001',Purchase_Date__c=system.today(),Reseller__c='AMMO NYC',Status__c='Ordered',Type__c='Detailing',Purchased_Quantity__c=12,Unit_Price__c=5);
        insert testTowelUnit;
        System.assertEquals(totalPrice, [SELECT Id, Total_Price__c FROM Vehicle_Inventory_Item__c].Total_Price__c, 'Total Price should be '+totalPrice);
        Test.stopTest();
    }

}