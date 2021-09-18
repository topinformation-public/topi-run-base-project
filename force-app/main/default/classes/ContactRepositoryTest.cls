/**
 * @author ercarval - topi
 */
@isTest
public class ContactRepositoryTest {

    @isTest
    public static void givenCreateAccountWithContactsWhenFindContactsByAccountThenReturnListOfContacts () {
        
        Map<String,SObject> records = ContactFixtureFactory.integratedScenario();

        Contact contact = (Contact) records.get('contact');

        Account account = (Account) records.get('account');

        Test.startTest();

        ContactRepository repository = new ContactRepository();
        
        List<Contact> contacts = repository.findByAccountId(account.Id);

        Test.stopTest();

        System.assert(!contacts.isEmpty());

        System.assertEquals( account.Id , contacts.get(0).AccountId);


    }

}
