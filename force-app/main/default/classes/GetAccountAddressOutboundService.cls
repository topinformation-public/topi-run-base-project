/**
 * @author ercarval - topi
 */
public class GetAccountAddressOutboundService {
    
    AccountAddressTransformer transformer;

    GetViaCepAddressOutboundService service;
    
    public GetAccountAddressOutboundService() {
        transformer = new AccountAddressTransformer();
        service = new GetViaCepAddressOutboundService();
    }

    public Account findAddressByAccountZipCode ( Account account ) {

        ViaCepZipCodeAddressRespose response =  service.getViaCepAddress (account.BillingPostalCode);

        return transformer.toAccount(response,account);

    }

    // 4 test injection
    public void setService (GetViaCepAddressOutboundService service) {
        this.service = service;
    }


}
