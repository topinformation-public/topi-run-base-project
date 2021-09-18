/**
 * @author ercarval - topi
 */
@isTest
public class ContactFixtureFactory {
    
    // new<SObject>
    // create<SObject>(....)
    // create<SObject>(<SObject> entinty)

    public static Contact newContact (Account account, String lastName) {
        return new Contact (AccountId = account.Id,
                            LastName = lastName);
    }

    public static Contact createContact (Account account, String lastName) {
        return createContact (newContact(account, lastName));
    }

    public static Contact createContact (Contact contact) {
        insert contact;
        return contact;
    }


    public static Map<String,SObject> integratedScenario () {

        Map<String,SObject> records = new Map<String,SObject>();

        Account account = AccountFixtureFactory.createAccount();

        records.put('account', account);

        Contact contact = ContactFixtureFactory.createContact( account, 'Bisso Contact');

        records.put('contact', contact);

        return records;

    }   

}
