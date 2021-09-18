/**
 * @author ercarval - topi
 */
public class AccountFilter {

    public List<Account> filterNotEmptyDocumentNumber ( List<Account> accounts ) {

        List<Account> filteredAccountsWithDocument = new List<Account>();

        for (Account account : accounts) {
            
            if ( String.isNotEmpty(account.DocumentNumber__c) ) {
                filteredAccountsWithDocument.add(account);
            }
    
        }

        return filteredAccountsWithDocument;

    }

    public List<Account> filterWithValidDocumentNumber ( List<Account> accounts ) {
        
        List<Account> filteredAccounts = new List<Account>();

        for (Account account : filterNotEmptyDocumentNumber (accounts) ) {
            
            if ( !account.hasErrors() ) {
                filteredAccounts.add(account);
            }
    
        }

        return filteredAccounts;
        
    }


}
