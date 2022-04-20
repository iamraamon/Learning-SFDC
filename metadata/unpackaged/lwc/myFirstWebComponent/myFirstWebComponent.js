import { LightningElement ,track} from 'lwc';

import getAllContacts  from '@salesforce/apex/LWC_My_First_Web_Component.getAllContacts'

export default class MyFirstWebComponent extends LightningElement {


    greeting ="ram";

   @track contacts=[
      {
          "Id":"1",
          "Name":"Ram",
          "Title":"Mr."

      } ,
      {
        "Id":"2",
        "Name":"Uma",
        "Title":"Ms."

      }


   ];

   @track contactsFromApex ;

   handleGetContacts(){
    getAllContacts()
    .then(result =>{
        this.contactsFromApex = result;
    })
    .catch(error =>{
        this.errorMsg = error;
    })
}

}