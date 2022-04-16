trigger AccountTrigger on Account (before update, after update) {
    if(trigger.isBefore){
        AccountTriggerHandler.validateAccountNumber(Trigger.new);
    }
    if(trigger.isAfter){
        AccountTriggerHandler.createOpportunityOrTask(Trigger.new);
    }
}