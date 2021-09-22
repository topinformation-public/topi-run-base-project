/**
 *
 * Provide Formatter for Brazilian Documents
 * @author ercarval - topi
 */
public class BrazilianDocumentFormatter {

    public class InvalidInputException extends Exception {}

    public String formatCPF(String plainText) {

        if ( String.isEmpty(plainText)) return null;

        if (plainText.length() != 11) throw new InvalidInputException('CPF should have length 11');

        return plainText.substring(0, 3) + '.' + plainText.substring(3, 6) + '.' + plainText.substring(6, 9) + '-' + plainText.substring(9, 11);
    }

    public String formatCNPJ(String plainText) {

        if ( String.isEmpty(plainText)) return null;

        if (plainText.length() != 14) throw new InvalidInputException('CNPJ should have length 14');

        return plainText.substring(0, 2) + '.' + plainText.substring(2, 5) + '.' + plainText.substring(5, 8) + '/' + plainText.substring(8, 12) + '-' + plainText.substring(12, 14);
    }
}