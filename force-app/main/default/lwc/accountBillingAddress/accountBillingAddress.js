import { LightningElement } from 'lwc';

const STATES = [ {label:'MG',value:'MG'} ,  {label:'RJ',value:'RJ'}];

export default class AccountBillingAddress extends LightningElement {

    zipCode;
    street;
    streetNumber;
    streetAditionalInfo;
    city;
    staty;

    constructor() {
        super();
        console.log ('AccountBillingAddress Created ....');
    }

    connectedCallback () {
        console.log ('AccountBillingAddress Connected ....');
        this.zipCode = '12.220-000';
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


}