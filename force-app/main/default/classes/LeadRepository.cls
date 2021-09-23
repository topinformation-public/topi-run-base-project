/**
 * @author ercarval - topi
 */
public virtual class LeadRepository extends AbstractRepository {

    virtual
    public Lead findById (String leadId) {

        return [ SELECT Id, FirstName, LastName, Company
                    , PostalCode                     
                    FROM Lead 
                    WHERE Id = :leadId ];

    }

    public List<Lead> findByPendingCompleteAddress () {
        return [ SELECT Id, PostalCode, PendingCompleteAddress__c                     
                    FROM Lead 
                    WHERE PendingCompleteAddress__c = true];
    }

}
