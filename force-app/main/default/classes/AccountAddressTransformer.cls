/**
 * @author ercarval - topi
 */
public class AccountAddressTransformer {   

    public Account toAccount (ViaCepZipCodeAddressRespose response, Account account) {

        account.BillingCity = response.localidade;
        account.BillingStreet = response.logradouro + ' ' + response.complemento;
        account.BillingState = response.uf;
        account.BillingPostalCode = response.cep;
        account.BillingCountry = 'Brasil';

        return account;

    }

}
