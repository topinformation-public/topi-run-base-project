/**
 * @author ercarval - topi
 */
@isTest
public class AccountCtrlTest {

    @isTest
    public static void givenRequestAccountWhenPostToServerThenCreateAnAccount () {
               
        Account account = AccountCtrl.create( AccountFixtureFactory.newAccount() );

        System.assert(account.Id != null);

    }


    @isTest
    public static void givenCreatedAccountWhenPustToServerThenChangeAnAccount () {
               
        Account accontToChange = AccountFixtureFactory.createAccount();
        
        accontToChange.Name = 'Teste do Bisso';

        Account account = AccountCtrl.change(accontToChange);

        System.assertEquals(accontToChange.Id, account.Id);
        System.assertEquals(accontToChange.Name, account.Name);

    }


    @isTest
    public static void givenValidAccountIdWhenGetAccountThenReturnAccountWithAddress () {
               
        Account expectedAccount = AccountFixtureFactory.createAccount();
        
        RestContext.request = new RestRequest();
        RestContext.request.params.put ('accountId',  expectedAccount.Id);

        Account account = AccountCtrl.get();

        System.assertEquals(expectedAccount.Id, account.Id);
        System.assertEquals(expectedAccount.Name, account.Name);

    }


}
