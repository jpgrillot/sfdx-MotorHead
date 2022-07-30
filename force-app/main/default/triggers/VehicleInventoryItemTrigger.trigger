trigger VehicleInventoryItemTrigger on Vehicle_Inventory_Item__c (before insert, before update) {
    VehicleInventoryItemTriggerHandler viHandler = new VehicleInventoryItemTriggerHandler();

    if ((Trigger.isInsert || Trigger.isUpdate) && Trigger.isBefore){
        viHandler.beforeDML(Trigger.new);
    }
}