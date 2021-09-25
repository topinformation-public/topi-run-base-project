import { api, LightningElement, track } from 'lwc';
import findAddressByZipCode from '@salesforce/apex/ZipCodeCtrl.findAddressByZipCode';

export default class ZipCodeAddress
                     extends LightningElement {

    @api 
    label;

    @track 
    address = {}

    @api
    get zipCode () {
        return this._zipCode;
    }

    set zipCode (zipCode) {
        this._zipCode = zipCode;
    }


    @api
    get required () {
        return this._required;
    }

    set required (required) {
        this._required = required === "true";
    }

    constructor () {
        super();
        console.log ('.....ZipCodeAddress Created');
    }

    connectedCallback () {
        this.required = false;
        console.log ('.....ZipCodeAddress Connected');
    }


    renderedCallback () {        
        console.log ('.....ZipCodeAddress Rendered');
    }


    disconnectedCallback () {        
        console.log ('.....ZipCodeAddress Disconnected');
    }

    @api
    isValid () {
        
        const component = this.template.querySelector('lightning-input');

        if ( component.checkValidity() ) {
            component.reportValidity();
            return false;
        }

        return true;
    }

    handleChange (event) {        
        this.zipCode = event.target.value;

        this.findAddress ();
    }

    findAddress () {
        
        findAddressByZipCode({zipCode : this.zipCode}).then (result => {
            this.address = result;
        }).catch (error => {
            console.log(error);
        });

    }

}