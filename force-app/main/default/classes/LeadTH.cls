/**
 * @author ercarval - topi
 */
public with sharing class LeadTH extends TriggerHandler {

    List<Lead> newLeads;

    Map<Id, Lead> oldLeads;

    LeadFilter filter;

    public LeadTH() {
        this ( (List<Lead>) Trigger.new, (Map<Id, Lead>) Trigger.oldMap );
    }

    public LeadTH(List<Lead> newLeads, Map<Id, Lead> oldLeads) {
        this.newLeads = newLeads;
        this.oldLeads = oldLeads;
        this.filter = new LeadFilter();
    }

    override
    public void afterInsert() {
        publishGetLeadAddress();
    }

    override
    public void afterUpdate() {
        publishGetLeadAddress();
    }

    public void publishGetLeadAddress() {

        List<Lead> leads = this.filter.filterChangedPostalCode(newLeads, oldLeads);

        // chamar o meu publicador !!!
        GetLeadAddressPublisher publisher = new GetLeadAddressPublisher();
        publisher.publish(leads);
  
    }

}
