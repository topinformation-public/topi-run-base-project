/**
 * @author ercarval - topi
 */
public class CityCtrl {

    public static CityRepository repository;

    static {
        repository = new CityRepository();
    }

    @AuraEnabled(cacheable=true)    
    public static List<PickListInfo> findCities (String state) {

        List<City__c> cities = repository.findByState(state);

        return new PickListInfoBuilder().toPickList(cities, 'Name__c', 'Name');

    }

}
