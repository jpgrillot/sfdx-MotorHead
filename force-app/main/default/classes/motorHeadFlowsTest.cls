//**********************************************************************************//
//	This test class tests the following flows part of the Motorhead App				//
//	jobResourceTriggeringFlow - runs when Job_Resource__c record is created/updated	//
//	vehicleMaintenanceCalculateFlow - calculates Cost for vehicleMaintenance		//
//**********************************************************************************//	
@isTest
public class motorHeadFlowsTest {
    
    // Constants
    // Final Value of the Vehicle Maintenance
    static final decimal TOTAL_COST = 4203.20;
        
    @TestSetup
    static void testMotorHeadData(){
        //Create Vehicle__c
        Vehicle__c testSUV = new Vehicle__c(Name='G-Wagen',Make__c='Mercedes-Benz',Model__c='G550',Year__c='2021');
        insert testSUV;
        
        //Create Vehicle_Maintenance__c record
        Vehicle_Maintenance__c testJob = new Vehicle_Maintenance__c(Name='New Shoes', RecordTypeId=Schema.SObjectType.Vehicle_Maintenance__c.getRecordTypeInfosByName().get('DIY').getRecordTypeId(), Vehicle__c=testSUV.Id,Work_Type__c='Mechanical',Issue__c='Daddy needs new shoes');
        insert testJob;
        
        // Create a Tire record
        Vehicle_Inventory_Item__c testTire = new Vehicle_Inventory_Item__c(Name='275-55 Tires',Vehicle__c=testSUV.Id, RecordTypeId=Schema.SObjectType.Vehicle_Inventory_Item__c.getRecordTypeInfosByName().get('Part').getRecordTypeId(),Description__c='275/55R19 SUV Tires',Manufacturer__c='Pirelli', Model__c='Scorpion AS Plus',Status__c='Stocked',Unit_Price__c=300.80,Type__c='Mechanical System');
        insert testTire;
        
        // Create a Wheel record
        Vehicle_Inventory_Item__c testWheel = new Vehicle_Inventory_Item__c(Name='19" AMG Wheels',Vehicle__c=testSUV.Id, RecordTypeId=Schema.SObjectType.Vehicle_Inventory_Item__c.getRecordTypeInfosByName().get('Part').getRecordTypeId(),Description__c='19" AMG Wheels',Manufacturer__c='AMG', Model__c='Twin 5 Spoke',Status__c='Stocked',Unit_Price__c=750,Type__c='Mechanical System');
        insert testWheel;
        
    }
    // Test adding Resources to a Job
    @isTest
    public static void insertJobResourceRecords(){
        
        List<Vehicle_Maintenance__c> maintenances = [SELECT Id, Name, Vehicle__c FROM Vehicle_Maintenance__c];
        //Vehicle_Maintenance__c maintenance = maintenances[0];
        List<Vehicle_Inventory_Item__c> toys = [SELECT Id, Vehicle__c,Unit_Price__c FROM Vehicle_Inventory_Item__c];
        // Test Creating Job Resource
        Test.startTest();
        
        List<Job_Resource__c> resources = new List<Job_Resource__c>();
        for(Vehicle_Inventory_Item__c toy : toys){
            resources.add(new Job_Resource__c(Vehicle_Maintenance__c=maintenances[0].Id, Inventory_Item__c=toy.Id, Required_Quantity__c=4));
        }
        insert resources;
        
        
        // Validate Vehicle_Maintenance__c cost update
        System.assertEquals(TOTAL_COST, [SELECT Id, Parts__c FROM Vehicle_Maintenance__c].Parts__c, 'Part cost should equal the TOTAL_COST constant defined in the test class');
        
        Test.stopTest();     
    }
    
    
}