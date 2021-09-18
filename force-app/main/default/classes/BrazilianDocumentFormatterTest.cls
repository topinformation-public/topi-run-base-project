/**
 * @author ercarval - topi
 */
@isTest
public class BrazilianDocumentFormatterTest {

    @isTest
    private static void itShouldFormatCPF() {
        String validCpf = '12345678901';
        String invalidCpfTooLong = '1234567890123';
        String invalidCpfTooShort = '123456789';

        Test.startTest();

        BrazilianDocumentFormatter formatter = new BrazilianDocumentFormatter();

        System.assert(formatter.formatCPF(validCpf) == '123.456.789-01', 'Wrong format');

        try {
            formatter.formatCPF(invalidCpfTooLong);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'CPF should have length 11');
        }

        try {
            formatter.formatCPF(invalidCpfTooShort);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'CPF should have length 11');
        }

        Test.stopTest();
    }

    @isTest
    private static void givenInvalidDocumentWhenFormattedThenShouldThrowInvalidInputException() {

        String invalidCpfTooLong = '1234567890123';
        String invalidCpfTooShort = '123456789';

        String invalidCnpjTooLong = '123456789012345';
        String invalidCnpjTooShort = '12345678901';


        Test.startTest();

        BrazilianDocumentFormatter formatter = new BrazilianDocumentFormatter();

        try {
            formatter.formatCPF(invalidCpfTooLong);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'CPF should have length 11');
        }


        try {

            formatter.formatCPF(invalidCpfTooShort);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'CPF should have length 11');
        }


        try {

            formatter.formatCNPJ(invalidCnpjTooShort);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'CNPJ should have length 14');
        }

        try {
            formatter.formatCNPJ(invalidCnpjTooLong);
            System.assert(false, 'It should throw exception');
        } catch (BrazilianDocumentFormatter.InvalidInputException ex) {
            System.assert(ex.getMessage() == 'CNPJ should have length 14');
        }

        Test.stopTest();
    }

}