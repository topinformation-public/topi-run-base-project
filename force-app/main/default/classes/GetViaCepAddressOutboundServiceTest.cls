/**
 * @author ercarval - topi
 */
@isTest
public class GetViaCepAddressOutboundServiceTest {

    @isTest
    public static void givenValidZipCodeWhenGetViaCepAddressThenReturnCompleteAddress () {

        String expectedResponsePayload = '{ "cep": "12220-000", "logradouro": "Avenida Presidente Juscelino Kubitschek", "complemento": "de 6001/6002 ao fim", "bairro": "Vila Industrial", "localidade": "São José dos Campos", "uf": "SP", "ibge": "3549904", "gia": "6452", "ddd": "12", "siafi": "7099" }';

        ViaCepZipCodeAddressRespose expectedResponse = (ViaCepZipCodeAddressRespose) 
                                                   JSON.deserialize(expectedResponsePayload, 
                                                        ViaCepZipCodeAddressRespose.class);       

        GetViaCepAddressOutboundService service = new GetViaCepAddressOutboundService();

        Test.setMock(HttpCalloutMock.class, new ViaCepZipCodeAddressHttpMock(expectedResponsePayload));

        Test.startTest();

        ViaCepZipCodeAddressRespose response = service.getViaCepAddress('12220000');

        Test.stopTest();

        System.assertEquals(expectedResponse.bairro, response.bairro);
        System.assertEquals(expectedResponse.cep, response.cep);
        System.assertEquals(expectedResponse.logradouro, response.logradouro);
        System.assertEquals(expectedResponse.ibge, response.ibge);

    }

    public class ViaCepZipCodeAddressHttpMock implements HttpCalloutMock {
        
        String payload;
        
        public ViaCepZipCodeAddressHttpMock (String payload) {
            this.payload = payload;
        }

        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setBody(payload);
            return response;
        }
    }

}
