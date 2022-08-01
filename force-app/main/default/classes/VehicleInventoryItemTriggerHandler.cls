/*
 * Apex Trigger Handler Class for  Vehicle_Inventory_Item__c
 * Trigger updates the Total Cost or Unit Cost based on whichever value is empty
*/ 
public class VehicleInventoryItemTriggerHandler {
    // Method for before trigger calls
    public void beforeDML(List <Vehicle_Inventory_Item__c> updateInventory){
        // Loop throught the Inventory Item records
        for(Vehicle_Inventory_Item__c vii : updateInventory){
            // If the Total price is empty, populate it based on the unit price times the quantity
            if(vii.Total_Price__c == null && vii.Purchased_Quantity__c > 0){
                vii.Total_Price__c = vii.Purchased_Quantity__c * vii.Unit_Price__c;
            }
            // IF the Unit price is empty, populate it with the total price divided by the quantity
            else if(vii.Unit_Price__c == null && vii.Purchased_Quantity__c > 0){
                vii.Unit_Price__c = vii.Total_Price__c / vii.Purchased_Quantity__c;
            }
        }
    }
    // DML is not need for a trigger
}