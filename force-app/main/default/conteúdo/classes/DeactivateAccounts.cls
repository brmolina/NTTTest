public with sharing class DeactivateAccounts implements
Database.Batchable<sObject>, Database.Stateful, Schedulable{
    // instance member to retain state across transactions
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        Date menosNoventa = Date.today() - 90;
        return Database.getQueryLocator(
            [SELECT Id, Inativa__c FROM Account WHERE Inativa__c = false]
        );
    }
     
    
    public void execute(Database.BatchableContext bc, List<Account> scope){
        // process each batch of records
        Date oldOpp = System.today()-120;
        List<AggregateResult> oppList = new List<AggregateResult>([SELECT Count(AccountId) FROM Opportunity WHERE AccountId IN :SCOPE AND ((CloseDate >=:oldOpp AND StageName != 'Closed Won')OR StageName != 'Negotiation/Review') GROUP BY CloseDate,StageName HAVING COUNT(AccountId) =0 AND ((CloseDate >=:oldOpp AND StageName = 'Closed Won')OR StageName != 'Negotiation/Review') ]);
        Date oldTask = System.today()-90;
        List<AggregateResult> taskList = new List<AggregateResult>([SELECT Count(WhatId) FROM Task WHERE WhatId IN :SCOPE AND ActivityDate < :oldTask GROUP BY ActivityDate HAVING COUNT(WhatId) =0 AND ActivityDate > :oldTask]);
        
        for (Account account : scope) {
            for(AggregateResult a: oppList){
                for(AggregateResult t: taskList){
                    if(account.Id == a.Id && account.Id == t.Id){
                        account.Inativa__c = true;
                    }
                }
            }
        }
        update scope;
    }
    
    public void execute(SchedulableContext sc){
        Database.executeBatch(new DeactivateAccounts());
    }

    public void finish(Database.BatchableContext bc){

    }

    public static Set<String> schedule(String nomeSchedule){
       
        Set<String> ids = new Set<String>();
        DeactivateAccounts schedule = new DeactivateAccounts();
        String sch = '0 0 0/6 ? * MON,TUE,WED,THU,FRI *';
        String jobId = System.schedule(nomeSchedule, sch, schedule);
        ids.add(jobId);
       
        return ids;
    }

    // para agendar, executar no annonimous window
    //DeactivateAccounts.schedule('Desativar Contas');
} 

