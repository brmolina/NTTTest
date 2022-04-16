public class CreateNewOpportunity {
    public static Opportunity createNewOpportunityFromAccount(Account acc) {
        Opportunity opp = new Opportunity();
        opp.AccountId = acc.Id;
        opp.Name = acc.Name+' - opp Parceiro';
        opp.CloseDate = Date.today() + 30;
        opp.StageName = 'Qualification';
        return opp;
    }   
}
