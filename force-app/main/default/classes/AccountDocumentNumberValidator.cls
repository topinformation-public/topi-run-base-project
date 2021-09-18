/**
 * @author ercarval - topi
 */
public class AccountDocumentNumberValidator {

    BrazilianDocumentValidator documentValidator;

    public AccountDocumentNumberValidator() {
        documentValidator = new BrazilianDocumentValidator();
    }

    public void validate (List<Account> accounts) {

        for (Account account : accounts ) {

            if ( isValid (account.DocumentNumber__c) ) {
                account.DocumentNumber__c.addError('Numero do Documento inválido');
            }

        }

    }

    private Boolean isValid ( String document ) {
        return documentValidator.isCPF( document )
                    || documentValidator.isCNPJ(document);
    }

}
