@isTest
public with sharing class AccountTriggerTest {
    @testSetup
    static void createData(){

        Id parceiroRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Parceiro').getRecordTypeId();
        Id consumidorFinalRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Consumidor Final').getRecordTypeId();

        List<Account> accountList = new List<Account>();
        for(Integer i = 0; i < 5; i++){
            accountList.add(new Account(Name= 'TestAccount '+i, 
                                        AccountNumber = '12345678901',
                                        recordTypeId = parceiroRecordTypeId,
                                        Type = 'CNPJ'));
        }
        insert accountList;
    }
    @isTest
    public static void validateCPF(){
        List<Account> accountList = [SELECT Id, Name, AccountNumber FROM Account];
        for(Account acc: accountList){
            acc.AccountNumber = '12345678901';
        }
    }
    @isTest
    public static void validateCnpj(){
        List<Account> accountList = [SELECT Id, Name, AccountNumber FROM Account];
        for(Account acc: accountList){
            acc.AccountNumber = '12345678901234';
        }
    }
    @isTest
    public static void validateInvalidInput(){
        List<Account> accountList = [SELECT Id, Name, AccountNumber FROM Account];
        for(Account acc: accountList){
            acc.AccountNumber = '12345678';
        }
    }
}