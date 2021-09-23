/**
 * @author ercarval - topi
 */
public class CompleteLeadAddresJob implements Schedulable {
    
    LeadRepository repository;

    GetLeadAddressPublisher publisher;

    public CompleteLeadAddresJob() {
        publisher = new GetLeadAddressPublisher();
        repository = new LeadRepository();
    }

    public void execute (SchedulableContext context) {

        List<Lead> leads = repository.findByPendingCompleteAddress ();

        if (leads.isEmpty()) return;

        publisher.publish(leads);
        
    
    }

    public static void start () {
        System.schedule('CompleteLeadAddress', '0 32 21 * * ?', new CompleteLeadAddresJob());
    }

}
