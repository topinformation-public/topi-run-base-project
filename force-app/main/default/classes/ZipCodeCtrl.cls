/**
 * @author ercarval - topi
 */
public with sharing class ZipCodeCtrl {
    
    public static GetViaCepAddressOutboundService service;

    static {
        service = new GetViaCepAddressOutboundService();
    }


    /**
     * Para que um método possa ser invocado por um componente
     * lightning é necessário que ele esteja anotado com 
     * @AuraEnabled
     * 
     * Outro ponto é que a classe que será utilizada pelo
     * componente deve ter os seus atributos notados como 
     * @AuraEnabled
     */
    @AuraEnabled        
    public static ZipCodeAddress findAddressByZipCode (String zipCode) {

        ZipCodeAddressTransformer transformer = new ZipCodeAddressTransformer ();
        zipCode = zipCode.remove('.').remove('-');
        return transformer.toAddress(service.getViaCepAddress(zipCode));
    }

}
