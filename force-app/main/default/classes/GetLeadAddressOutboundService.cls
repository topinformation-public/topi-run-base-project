/**
 * @author ercarval - topi
 */
public class GetLeadAddressOutboundService {

    LeadAddressTransformer transformer;

    GetViaCepAddressOutboundService outboundService;

    LeadRepository repository;

    public GetLeadAddressOutboundService() {
        repository = new LeadRepository();
        transformer = new LeadAddressTransformer();
        outboundService = new GetViaCepAddressOutboundService();
    }

    public Lead getLeadAddress ( Id leadId ) {

        return getLeadAddress (  repository.findById (leadId) );

    }

    public Lead getLeadAddress ( Lead lead ) {

        ViaCepZipCodeAddressRespose response =
                                    outboundService.getViaCepAddress(lead.PostalCode);

        transformer.toLead(response, lead);                                    

        repository.save(lead);

        return lead;
    }

}
