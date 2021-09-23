/**
 * @author ercarval - topi
 */
public with sharing class ClearLeadLocationBatch implements Database.Batchable<SObject> {
   

    String query = 'SELECT Id, Street, PostalCode, City, Country FROM Lead Where Longitude = null ';
    
    LeadRepository repository;
    
    public ClearLeadLocationBatch() {
        repository = new LeadRepository();
    }

    public Database.QueryLocator start(Database.BatchableContext context){
        System.debug( 'ClearLeadLocationBatch Start ');
        return Database.getQueryLocator(query);
    }
  
    public void execute(Database.BatchableContext context, List<SObject> scope){
        
        System.debug( 'Executing ClearLeadLocationBatch ');

        List<Lead> leads = (List<Lead>) scope;  
        
        System.debug( 'Process [ ' + leads.size() + '] ');

        Integer i = 0;
        
        for (Lead lead : leads) {
            lead.Longitude = -46.633308;
            lead.Latitude = -23.550520;
        }

        repository.save(leads);

    }
  
    public void finish(Database.BatchableContext context){
        System.debug( 'ClearLeadLocationBatch FINISH ');
    }

    public static void start () {

        Database.executeBatch(new ClearLeadLocationBatch(), 3);

    }


}
