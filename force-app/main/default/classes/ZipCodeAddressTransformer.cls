/**
 * @author ercarval - topi
 */
public class ZipCodeAddressTransformer {

    public ZipCodeAddress toAddress ( ViaCepZipCodeAddressRespose response ) {

        ZipCodeAddress address = new ZipCodeAddress();

        address.street = response.logradouro;
        address.streetAditionalInfo = response.complemento;
        address.zipCode = response.cep;
        address.city = response.localidade;
        address.state = response.uf;

        return address;
    }

}
