public with sharing class AccountTriggerHandler {

    public static void validateAccountNumber(List<Account> accountList) {
        Id parceiroRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Parceiro').getRecordTypeId();

        Id consumidorFinalRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Consumidor Final').getRecordTypeId();

        System.debug('before update parceiroRecordTypeId => '+parceiroRecordTypeId);
        System.debug('before update consumidorFinalRecordTypeId => '+consumidorFinalRecordTypeId);

        for(Account acc : accountList){
            if(Utils.validaCPF(acc.AccountNumber)){
                acc.Type = 'CPF';
                acc.RecordTypeId = consumidorFinalRecordTypeId;
            }
            else if(Utils.validaCNPJ(acc.AccountNumber)){
                acc.Type = 'CNPJ';
                acc.RecordTypeId = parceiroRecordTypeId;
            }
            else{
                acc.addError('Número do cliente é inválido');
            }
        }
    }
    public static void createOpportunityOrTask(List<Account> accountList) {

        Id parceiroRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Parceiro').getRecordTypeId();

        Id consumidorFinalRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Consumidor Final').getRecordTypeId();

        System.debug('after update parceiroRecordTypeId => '+parceiroRecordTypeId);
        System.debug('after update consumidorFinalRecordTypeId => '+consumidorFinalRecordTypeId);

        List<Task> taskList = new List<Task>();
        List<Opportunity> opportunityList = new List<Opportunity>();

        for(Account acc : accountList){
            if(acc.RecordTypeId == consumidorFinalRecordTypeId){
                System.debug('antes de entrar no consumidor final');
                Task t =  CreateNewTask.createNewTaskFromAccount(acc);
                taskList.add(t);
            }
            if(acc.RecordTypeId == parceiroRecordTypeId){
                Opportunity opp = CreateNewOpportunity.createNewOpportunityFromAccount(acc);
                opportunityList.add(opp);
            }
        }
        if(taskList != null){
            insert taskList;
        }
        if(opportunityList != null){
            insert opportunityList;
        }
    }
}
