/**
 * @author ercarval - topi
 */
public virtual class GetViaCepAddressOutboundService {
    
    virtual
    public ViaCepZipCodeAddressRespose getViaCepAddress (String zipCode) {

        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setEndpoint('https://viacep.com.br/ws/' + zipCode + '/json/');
        Http http = new Http();

        HttpResponse response =  http.send(request);

        System.debug('Status Code ' + response.getStatusCode());
        System.debug('Headers Key ' + response.getHeaderKeys());
        System.debug('Body ' + response.getBody());

        ViaCepZipCodeAddressRespose address = (ViaCepZipCodeAddressRespose) 
                                                JSON.deserialize(response.getBody()
                                                , ViaCepZipCodeAddressRespose.class);


    
        return address;

    }

}
