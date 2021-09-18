/**
 * @author: ercarval - topi
 */
public class BrazilianDocument {

    public BrazilianDocumentValidator validator;
    public BrazilianDocumentFormatter formatter;

    public String document;

    public BrazilianDocument() {
        validator = new BrazilianDocumentValidator();
        formatter = new BrazilianDocumentFormatter();
    }

    public BrazilianDocument(String document) {
        this();
        this.document = document.remove('.').remove('-').remove('/');
    }

    public boolean isValid () {
        return isCpf ()  || isCnpj();
    }

    public boolean isCpf () {

        if (String.isEmpty(this.document)) return false;
        
        return validator.isCpf (document);
    }

    public boolean isCnpj () {

        if (String.isEmpty(this.document)) return false;

        return validator.isCNPJ (this.document);
    }

    public String getFormattedCnpj () {
        return formatter.formatCNPJ(this.document);
    }

    public String getFormattedCpf () {
        return formatter.formatCPF(this.document);
    }

}