/*
 * Trigger on the Vehicle_Inventory_Item__c for before insert and before update
 */
trigger VehicleInventoryItemTrigger on Vehicle_Inventory_Item__c (before insert, before update) {
    VehicleInventoryItemTriggerHandler viHandler = new VehicleInventoryItemTriggerHandler();
    // Call the Trigger Handler beforeDML method for before insert or before update
    if ((Trigger.isInsert || Trigger.isUpdate) && Trigger.isBefore){
        viHandler.beforeDML(Trigger.new);
    }
}