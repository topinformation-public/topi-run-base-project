/**
 * @author ercarval - topi
 */
@isTest(seeAllData = true)
public class AccountRepositoryTest {
    
    @isTest
    public static void givenValidAccountWhenSaveThenReturnAccountWithId () {

        AccountRepository repository = new AccountRepository();
        
        Test.startTest();

        List<Account> accounts = repository.save( new List<Account> { AccountFixtureFactory.newAccount() } );

        Test.stopTest();
        
        System.assert(accounts != null);
        System.assert(!accounts.isEmpty());
        System.assertEquals( 1 , accounts.size());
        
        System.assert( accounts.get(0).Id != null );
        

    }
    

    @isTest
    public static void givenCreatedAccountWhenFindByIdThenReturnStoredAccount () {

        Account account = AccountFixtureFactory.createAccount();

        AccountRepository repository = new AccountRepository();

        Test.startTest();

        List<Account> accounts = repository.findById( account.Id );        

        Test.stopTest();

        System.assert(!accounts.isEmpty());

        System.assertEquals( 1 , accounts.size());
        
        Account storedAccount = accounts.get(0);
        
        System.assertEquals( account.Id, storedAccount.Id );      
        System.assert( storedAccount.BillingCity != null );

    }

}
