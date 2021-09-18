/**
 * @author ercarval - topi
 */
public virtual class ContactRepository extends AbstractRepository {

    virtual
    public List<Contact> findByAccountId (String accountId) {
        return [SELECT  Id, FirstName, LastName, Email, Phone, AccountId
            FROM Contact 
            WHERE AccountId = :accountId];
    }

}
