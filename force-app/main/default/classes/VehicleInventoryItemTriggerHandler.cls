public class VehicleInventoryItemTriggerHandler {
    public void beforeDML(List <Vehicle_Inventory_Item__c> updateInventory){
        for(Vehicle_Inventory_Item__c vii : updateInventory){
            if(vii.Total_Price__c == null && vii.Purchased_Quantity__c > 0){
                vii.Total_Price__c = vii.Purchased_Quantity__c * vii.Unit_Price__c;
            }
            else if(vii.Unit_Price__c == null && vii.Purchased_Quantity__c > 0){
                vii.Unit_Price__c = vii.Total_Price__c / vii.Purchased_Quantity__c;
            }
        }
    }

}