/**
 * @autor ercarval - topi
 */
public virtual class AccountRepository extends AbstractRepository {
    
    virtual
    public List<Account> findById (String id) {
        return  findByIds ( new List<String>{id});
    }

    virtual
    public List<Account> findByIds (List<String> ids) {
        return [ SELECT Id, AccountNumber , AccountSource, Active__c, AnnualRevenue
                , BillingAddress, BillingCity, BillingCountry, BillingGeocodeAccuracy
                , BillingLatitude, BillingLongitude
                , BillingPostalCode, BillingState, BillingStreet 
                FROM Account
                WHERE Id IN : ids ];
    }

    virtual
    public List<Account> findByBillingCountry (String billingCountry) {
        return [ SELECT Id, AccountNumber , AccountSource, Active__c, AnnualRevenue
                , BillingAddress, BillingCity, BillingCountry, BillingGeocodeAccuracy
                , BillingLatitude, BillingLongitude
                , BillingPostalCode, BillingState, BillingStreet 
                FROM Account
                WHERE BillingCountry =:billingCountry ];
    }

    virtual
    override
    public List<SObject> save(List<SObject> entities) {
        return super.save(entities);
    }

}
