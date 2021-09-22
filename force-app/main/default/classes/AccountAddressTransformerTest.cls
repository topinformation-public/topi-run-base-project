/**
 * @author ercarval - topi
 */
@isTest
public class AccountAddressTransformerTest {
    
    
    @isTest
    public static void givenReceivedViaCepAddressWhenTransformToAccountThenMappingBillingAddressWithServiceData () {

        Account account = AccountFixtureFactory.newAccount();
        account.BillingPostalCode = '12312312';

        String responsePayload = '{ "cep": "12220-000", "logradouro": "Avenida Presidente Juscelino Kubitschek", "complemento": "de 6001/6002 ao fim", "bairro": "Vila Industrial", "localidade": "São José dos Campos", "uf": "SP", "ibge": "3549904", "gia": "6452", "ddd": "12", "siafi": "7099" }';

        ViaCepZipCodeAddressRespose response = (ViaCepZipCodeAddressRespose) JSON.deserialize(responsePayload
                                                        , ViaCepZipCodeAddressRespose.class);        

        AccountAddressTransformer transformer = new AccountAddressTransformer ();

        Account transformedAccount = transformer.toAccount(response, account);

        System.assertEquals(response.cep, account.BillingPostalCode);
        System.assertEquals('Brasil', account.BillingCountry); // 

    }

}
