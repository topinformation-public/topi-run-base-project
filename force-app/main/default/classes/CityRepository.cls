/**
 * @author ercarval - topi
 */
public virtual class CityRepository extends AbstractRepository {

    public List<City__c> findByState ( String state ) {

        return [ SELECT Name, Name__c  FROM City__c
                    WHERE State__c = :state
                    ORDER BY Name__c ];
    }

}
