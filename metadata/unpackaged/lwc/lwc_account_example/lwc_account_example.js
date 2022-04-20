import { LightningElement } from 'lwc';

//JS -- ES1,ES2-----ES6
export default class Lwc_account_example extends LightningElement {
// variables

greeting="Ram";

//mehtods

changeHandlerRam(event) {

  //  alert("Iam in changehandler");
    this.greeting = event.target.value;
}


clickHandlerButton(event){
    alert("Iam in clickHandlerButton"+event.target.value);
    this.greeting = "ram clicked the button";
}

}