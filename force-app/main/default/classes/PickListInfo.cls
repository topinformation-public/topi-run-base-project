/**
 * @author ercarval - topi
 */
public class PickListInfo {

    @AuraEnabled
    public String label;

    @AuraEnabled
    public String value;

    public PickListInfo() {
    }

    public PickListInfo(String label, String value) {
        this.label = label;
        this.value = value;
    }

}
