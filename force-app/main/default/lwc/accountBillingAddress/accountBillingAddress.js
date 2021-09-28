import { LightningElement, track, wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import  BILLING_STATE  from '@salesforce/schema/Account.BillingState__c';
const STATES = [ {label:'MG',value:'MG'} ,  {label:'RJ',value:'RJ'}, {label:'SP',value:'SP'}];

export default class AccountBillingAddress extends LightningElement {

    zipCode;
    street;
    streetNumber;
    streetAditionalInfo;
    city;

    @track
    state;

    constructor() {
        super();
        console.log ('AccountBillingAddress Created ....');
    }

    connectedCallback () {
        console.log ('AccountBillingAddress Connected ....');
        this.zipCode = '12220-000';
    }

    renderedCallback () {
        console.log ('AccountBillingAddress Rendered ....');
    }

    disconnectedCallback () {
        console.log ('AccountBillingAddress Disconected ....');
    }
    
    get states () {
        return STATES;
    }

    handleSave (event) {
        if (!this.isValid()) return;
        console.log ('Salvando a criança');
    }

    isValid () {

        const component = this.template.querySelector('c-zip-code-address');

        console.log ( component.isValid() );

    }


    handleChange (event) {
        this[event.target.name] = event.target.value;     
    }

    handleAddressFound (event) {
        console.log ( JSON.stringify (event.detail) );
        this.zipCode = event.detail.zipCode;
        this.street = event.detail.street;
        this.streetAditionalInfo = event.detail.streetAditionalInfo;
        this.city = event.detail.city;
        this.state = event.detail.state;

    }

    @wire(getPicklistValues, { recordTypeId: '012000000000000AAA', fieldApiName: BILLING_STATE }) 
    getStates ({error, data}) {
        console.log (data);
        console.log(error);
    }

    handleSelectedCity (event) {
        this.city = event.detail.cityCode;
    }

}