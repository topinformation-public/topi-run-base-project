/**
 * @author ercarval - topi
 */
@RestResource (urlMapping = '/api/account')
global with sharing class AccountCtrl {

    public static AccountRepository repository;

    static {
        repository = new AccountRepository();    
    }
    
    @HttpPost
    global static void create (AccountRequest request) {                      
        
        RestResponse response =  RestContext.response;
        response.statusCode = 200;
        response.headers.put('Content-Type', 'application/json');
        Savepoint savepoint = Database.setSavePoint();
        try {

            repository.save(request.account);
            
            repository.saveRelated(request.contacts, request.account.Id, 'AccountId');

            response.responseBody = Blob.valueOf( JSON.serialize(request) );

        } catch (RepositoryException e) {
            throw e;
        } catch (Exception e) {
            Database.rollback(savepoint);            
            response.statusCode = 400;
            response.responseBody = Blob.valueOf( '{ "error" : " ' + e.getMessage() + '"  }' );
        }
              
       
    }


    @HttpPut
    global static Account change (Account account) {
        repository.save(account);
        return account;
    }

    @HttpGet
    global static Account get () {

        RestRequest request = RestContext.request;

        String accountId = request.params.get('accountId');

        List<Account> accounts = repository.findById(accountId);
        
        return accounts.isEmpty() ? null : accounts.get(0);

    }




}
