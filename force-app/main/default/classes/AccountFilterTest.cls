/**
 * @author ercarval - topi
 */
@isTest
public class AccountFilterTest {

    @isTest
    public static void givenAccountWithDocumentWhenFilterThenReturnSubListOnlyWithNotEmptyDocumentNumber () {

        List<Account> accounts = new List<Account> {
             new Account(DocumentNumber__c = '123')
            , new Account(Name = 'Bisso', DocumentNumber__c = '')
            , new Account(Name = 'BissoLino')
        };

        AccountFilter filter = new AccountFilter();

        List<Account> filteredAccounts = 
                            filter.filterNotEmptyDocumentNumber(accounts);
        
        System.assert( !filteredAccounts.isEmpty() );
        System.assertEquals( 1 , filteredAccounts.size());
        System.assertEquals( '123' , filteredAccounts.get(0).DocumentNumber__c );
    }

}
