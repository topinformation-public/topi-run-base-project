import { api, LightningElement, track } from 'lwc';
import findCities from '@salesforce/apex/CityCtrl.findCities'; 


export default class City extends LightningElement {

    @api
    get cityState () {
        return this._state;
    }
    
    set cityState (value) {
        this._state = value;
        this.findCities();
    }

    @api 
    get cityCode () {
        return this._cityCode;
    }

    set cityCode (value) {
        this._cityCode = value;
    }

    @track
    cities = [];
    
    connectedCallback () {
        console.log('City Created');
    }

    findCities () {
        
        findCities ({state: this.cityState }).then (result => {
            this.cities = result;
        }).catch (error => {
            console.log (error);
        });

    }

    handleSelected (event) {
        this.cityCode = event.track.value;      
        publishCitySelected();  
    }

    publishCitySelected () {
        const event = new CustomEvent('selected', {detail: this.cityCode});
        this.dispatchEvent (event);
    }




}