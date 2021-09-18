/**
 * @author: ercarval - TOPi
 */
@isTest
private class BrazilianDocumentTest {

    @isTest
    static void itShouldCreateNewInstance() {

        BrazilianDocument brazilianDocumentOther = new BrazilianDocument('93320424000114');

        System.assert ( brazilianDocumentOther.isValid ());
        System.assert ( !brazilianDocumentOther.isCpf ());
        System.assert ( brazilianDocumentOther.isCnpj ());
        System.assert ( brazilianDocumentOther.getFormattedCnpj () == '93.320.424/0001-14');
        System.assert ( new BrazilianDocument('47352574034').getFormattedCpf () == '473.525.740-34');

    }

}