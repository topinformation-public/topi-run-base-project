/**
 * @author ercarval - topi
 */
public class ZipCodeAddress {

    @AuraEnabled    
    public String street;

    @AuraEnabled
    public String streetNumber;

    @AuraEnabled
    public String streetAditionalInfo;

    @AuraEnabled
    public String state;
    
    @AuraEnabled
    public String city;
    
    @AuraEnabled
    public String country;

    @AuraEnabled
    public String zipCode;

    public ZipCodeAddress() {

    }
}
