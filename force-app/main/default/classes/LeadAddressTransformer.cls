public class LeadAddressTransformer {
    

    public Lead toLead (ViaCepZipCodeAddressRespose response, Lead lead) {
        
        lead.City = response.localidade;
        lead.Street = response.logradouro + ' ' + response.complemento;
        lead.State = response.uf;
        lead.Country = 'Brasil';

        return lead;

    }

}
