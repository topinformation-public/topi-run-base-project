@isTest
public class GetAccountAddressOutboundServiceTest {

    @isTest
    public static void fullMockedTest() {   

        String expectedResponse = '{ "cep": "12220-000", "logradouro": "Avenida Presidente Juscelino Kubitschek", "complemento": "de 6001/6002 ao fim", "bairro": "Vila Industrial", "localidade": "São José dos Campos", "uf": "SP", "ibge": "3549904", "gia": "6452", "ddd": "12", "siafi": "7099" }';

        GetAccountAddressOutboundService service = new GetAccountAddressOutboundService();
        service.setService(new GetViaCepAddressOutboundServiceMock(expectedResponse));

        Account account = service.findAddressByAccountZipCode(new Account (BillingPostalCode = '12312391'));
        System.assertEquals('12220-000', account.BillingPostalCode);
        System.assertEquals('Avenida Presidente Juscelino Kubitschek', account.BillingStreet);
        System.assertEquals('Brasil', account.BillingCountry); // 

    }


    public class GetViaCepAddressOutboundServiceMock extends GetViaCepAddressOutboundService {

        String payload;

        public GetViaCepAddressOutboundServiceMock (String payload) {
            this.payload = payload;
        }

        override
        public ViaCepZipCodeAddressRespose getViaCepAddress(String zipCode) {
            return (ViaCepZipCodeAddressRespose) JSON.deserialize(payload
                                                , ViaCepZipCodeAddressRespose.class);
        }
        
    }




}
