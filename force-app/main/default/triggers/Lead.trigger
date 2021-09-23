/**
 * @author ercarval - topi
 */
trigger Lead on Lead (after insert, after update) {

    new LeadTH().run();

}