/**
 * @author ercarval - topi
 */
public class AccountEnricher {

    public List<Account> enrich ( List<Account> accounts ) {

        for (Account account : accounts) {
            withFormattedDocumentNumber(account);   
        }

        return accounts;
    }

    private Account withFormattedDocumentNumber (Account account) {

        BrazilianDocument document = new BrazilianDocument(account.DocumentNumber__c);

        if ( document.isCpf() ) {
            account.DocumentNumber__c = document.getFormattedCpf();
        } else {
            account.DocumentNumber__c = document.getFormattedCnpj();
        }

        return  account;
    } 

}
