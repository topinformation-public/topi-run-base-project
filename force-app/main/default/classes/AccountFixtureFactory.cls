/**
 * @author ercarval - topi
 */
@isTest
public class AccountFixtureFactory {

    public static Account newAccount ( String name, String billingCountry ) {
        return new Account (Name = name
                        , DocumentNumber__c = '12312312878'
                        , BillingCity = 'Sao Jose dos Campos'
                        , BillingCountry =  billingCountry);
    }

    public static Account newAccount () {
        return newAccount('Bisso', 'Brasil');
    }

    public static Account createAccount () {
        return createAccount ( newAccount() );
    }
    
    public static Account createAccount ( String name, String billingCountry ) {
        return createAccount ( newAccount(name, billingCountry) );
    }

    public static Account createAccount (Account account) {
        insert account;
        return account;
    }

}
