import { LightningElement, track } from 'lwc';  
 import saveRecord from '@salesforce/apex/ContactController.saveContact';  
 import saveContactWithPLI from '@salesforce/apex/ContactController.saveContactWithPLI'; 
 
 import { NavigationMixin } from 'lightning/navigation';  
 import { ShowToastEvent } from 'lightning/platformShowToastEvent';  
 const MAX_FILE_SIZE = 100000000; //10mb  
 import QTY_FIELD from '@salesforce/schema/Product_Line_Item__c.Qty_Of_Packages__c';
import DES_FIELD from '@salesforce/schema/Product_Line_Item__c.Item_Description__c';
import ITEM_FIELD from '@salesforce/schema/Product_Line_Item__c.Item__c';
import AMOUNT_FIELD from '@salesforce/schema/Product_Line_Item__c.Claim_Amount__c';
 export default class NewRecordWithFileUpload extends NavigationMixin(LightningElement) {  
   @track name;  
   @track phone;  
   @track email;  
   @track description;  
   uploadedFiles = []; file; fileContents; fileReader; content; fileName  
   onNameChange(event) {  
     this.name = event.detail.value;  
   }  
   onPhoneChange(event) {  
     this.phone = event.detail.value;  
   }  
   onEmailChange(event) {  
     this.email = event.detail.value;  
   }  
   onDescriptionChange(event) {  
     this.description = event.detail.value;  
   }  
   onFileUpload(event) {  
     if (event.target.files.length > 0) {  
       this.uploadedFiles = event.target.files;  
       this.fileName = event.target.files[0].name;  
       this.file = this.uploadedFiles[0];  
       if (this.file.size > this.MAX_FILE_SIZE) {  
         alert("File Size Can not exceed" + MAX_FILE_SIZE);  
       }  
     }  
   }  
   saveContact() {  
     this.fileReader = new FileReader();  
     this.fileReader.onloadend = (() => {  
       this.fileContents = this.fileReader.result;  
       let base64 = 'base64,';  
       this.content = this.fileContents.indexOf(base64) + base64.length;  
       this.fileContents = this.fileContents.substring(this.content);  
       this.saveRecord();  
     });  
     this.fileReader.readAsDataURL(this.file);  
   }  
   saveRecord() {  
     var con = {  
       'sobjectType': 'Contact',  
       'LastName': this.name,  
       'Email': this.email,  
       'Phone': this.phone,  
       'Description': this.description  
     }  
     saveRecord({  
       contactRec: con,  
       file: encodeURIComponent(this.fileContents),  
       fileName: this.fileName  
     })  
       .then(conId => {  
         if (conId) {  
           this.dispatchEvent(  
             new ShowToastEvent({  
               title: 'Success',  
               variant: 'success',  
               message: 'Contact Successfully created',  
             }),  
           );  
           this[NavigationMixin.Navigate]({  
             type: 'standard__recordPage',  
             attributes: {  
               recordId: conId,  
               objectApiName: 'Contact',  
               actionName: 'view'  
             },  
           });  
         }  
       }).catch(error => {  
         console.log('error ', error);  
       });  
   }  


   @track productList = []; 
   @track index       = 0;
   
   @track qtyValue    = QTY_FIELD;
   @track desValue    = DES_FIELD;
   @track itemValue   = ITEM_FIELD ;
   @track amountValue = AMOUNT_FIELD ;
   isLoaded = false;
 @track page =1;

   pro = {
      
    Qty_Of_Packages__c : this.qtyValue,
    Item_Description__c : this.itemValue,
    Item__c : this.desValue,
    Claim_Amount__c : this.amountValue,
    key : ""
}

addRow(){
    this.index++;

    var i = this.index;
    this.pro.key = i;
    this.productList.push(JSON.parse(JSON.stringify(this.pro)));
    
}



removeRow(event){
  alert("iam in delete");
        
  this.isLoaded = true;
  var selectedRow = event.currentTarget;
  var key = selectedRow.dataset.id;
  if(this.productList.length>1){
      this.productList.splice(key, 1);
      this.index--;
      this.isLoaded = false;
  }else if(this.productList.length == 1){
      this.productList = [];
      this.index = 0;
      this.isLoaded = false;
  }
} 

handleQtyChange(event) {
  var selectedRow = event.currentTarget;
  var key = selectedRow.dataset.id;
  var productVar = this.productList[key];
  this.productList[key].Qty_Of_Packages__c = event.target.value;
}

handleItemChange(event) {

  var selectedRow = event.currentTarget;
  var key = selectedRow.dataset.id;
  var productVar = this.productList[key];
  this.productList[key].Item__c = event.target.value;
}

handleDesChange(event) {

  var selectedRow = event.currentTarget;
  var key = selectedRow.dataset.id;
  var productVar = this.productList[key];
  this.productList[key].Item_Description__c = event.target.value;
}

handleAmountChange(event) {
  
  var selectedRow = event.currentTarget;
  var key = selectedRow.dataset.id;
  var productVar = this.productList[key];
  this.productList[key].Claim_Amount__c = event.target.value;
}



saveContactWithPLI() {  
  this.fileReader = new FileReader();  
  this.fileReader.onloadend = (() => {  
    this.fileContents = this.fileReader.result;  
    let base64 = 'base64,';  
    this.content = this.fileContents.indexOf(base64) + base64.length;  
    this.fileContents = this.fileContents.substring(this.content);  
    this.saveContactWithPLI();  
  });  
  this.fileReader.readAsDataURL(this.file);  
}  
saveContactWithPLI() {  
  var con = {  
    'sobjectType': 'Contact',  
    'LastName': this.name,  
    'Email': this.email,  
    'Phone': this.phone,  
    'Description': this.description  
  }  
  saveContactWithPLI({  
    contactRec: con,  
    file: encodeURIComponent(this.fileContents),  
    fileName: this.fileName  ,
    plis: this.productList
  })  
    .then(conId => {  
      if (conId) {  
        this.dispatchEvent(  
          new ShowToastEvent({  
            title: 'Success',  
            variant: 'success',  
            message: 'Contact Successfully created',  
          }),  
        );  
        this[NavigationMixin.Navigate]({  
          type: 'standard__recordPage',  
          attributes: {  
            recordId: conId,  
            objectApiName: 'Contact',  
            actionName: 'view'  
          },  
        });  
      }  
    }).catch(error => {  
      console.log('error ', error);  
    });  
}  


 }