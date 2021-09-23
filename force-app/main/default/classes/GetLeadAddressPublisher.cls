public class GetLeadAddressPublisher {
    
    public static GetLeadAddressOutboundService addressOutboundService;
    
    static {
        addressOutboundService = new GetLeadAddressOutboundService();
    }

    public GetLeadAddressPublisher () {
    }

    public void publish (List<Lead> leads) {

        for  ( Lead lead : leads ) {
            //GetLeadAddressPublisher.publish(lead.Id);
            System.enqueueJob( new QueuedGetLeadAddressOutbound(new Lead(
                										  Id= lead.Id
            											, PostalCode= lead.PostalCode )) );
        }

    }

    @future(callout=true)
    public static void publish (Id leadId) {
        addressOutboundService.getLeadAddress(leadId);
    }

    public class QueuedGetLeadAddressOutbound implements Queueable, Database.AllowsCallouts {

        Lead lead;

        GetLeadAddressOutboundService addressOutboundService;

        public QueuedGetLeadAddressOutbound (Lead lead) {
            this.lead = lead;
            this.addressOutboundService = new GetLeadAddressOutboundService();
        }

        public void execute (QueueableContext context) {
            addressOutboundService.getLeadAddress(lead);
        }

    } 


}