/**
 * @author ercarval - topi
 * 
 * Quase sempre ter esses comportamentos
 * 
 * Filtrar
 * Validação 
 * Enriquecer
 * Integração Sistêmica
 */




public with sharing class AccountTH extends TriggerHandler {

    List<Account> newAccounts;

    Map<Id,Account> oldAccounts;

    AccountFilter filter;

    AccountDocumentNumberValidator documentValidator;

    AccountEnricher enricher;

    public AccountTH() {
        this( (List<Account>) Trigger.new 
            , (Map<Id,Account>) Trigger.oldMap );
    } 

    public AccountTH(List<Account> newAccounts, Map<Id,Account> oldAccounts) {
        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;
        this.filter = new AccountFilter();
        this.documentValidator = new AccountDocumentNumberValidator();
        this.enricher = new AccountEnricher();
    }

    override
    public void beforeUpdate() {

        validateDocumentNumber ();

        enrichAccounts();
        
    }

    public void validateDocumentNumber () {

        List<Account> filteredAccountWithDocumentNumber =
                             filter.filterNotEmptyDocumentNumber(newAccounts);

        documentValidator.validate(newAccounts);

    }

    public void enrichAccounts () {
        this.enricher.enrich( 
            this.filter.filterWithValidDocumentNumber (newAccounts) );
    }

    override
    public void afterUpdate() {

    }



}
