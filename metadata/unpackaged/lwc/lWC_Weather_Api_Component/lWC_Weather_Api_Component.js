import { LightningElement,track } from 'lwc';

export default class LWC_Weather_Api_Component extends LightningElement {


    @track  search_city ;

    handleSearch(){
        alert("Iam in handle search");

     //   this.search_city="London";
    }


    handleCity(evt){

        this.search_city=evt.target.value;

        console.log(this.search_city);
        console.log(evt.detail);
    }

}