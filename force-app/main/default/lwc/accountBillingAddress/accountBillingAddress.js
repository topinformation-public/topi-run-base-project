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
    }

    get states () {
        return STATES;
    }





}