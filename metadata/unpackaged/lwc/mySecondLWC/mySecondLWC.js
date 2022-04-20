import { LightningElement ,track,api } from 'lwc';

import  getAllAccounts    from '@salesforce/apex/MySecondLWC.getAllAccounts' ;

import  getAccountListForDataTable    from '@salesforce/apex/MySecondLWC.getAccountListForDataTable' ;

import  getAccountListForDataTableCustom    from '@salesforce/apex/MySecondLWC.getAccountListForDataTableCustom' ;

//ES1 ES6
export default class MySecondLWC extends LightningElement {



    //on load ...c/lwc_02_22_form
    //on click of button 
//@ --  decorattors    @track , @api, @wire

@track  accountsFromApex;
@track   errorMsg;

@track  accountsFromApexDatatable;

@track columns = [{
    label: 'Account name',
    fieldName: 'Name',
    type: 'text',
    sortable: true
},
{
    label: 'Type',
    fieldName: 'Type',
    type: 'text',
    sortable: true
},
{
    label: 'Annual Revenue',
    fieldName: 'AnnualRevenue',
    type: 'Currency',
    sortable: true
},
{
    label: 'Phone',
    fieldName: 'Phone',
    type: 'phone',
    sortable: true
},
{
    label: 'Website',
    fieldName: 'Website',
    type: 'url',
    sortable: true
},
{
    label: 'Rating',
    fieldName: 'Rating',
    type: 'test',
    sortable: true
}
];


    onClickHandleButtonKarthik(){

        alert("Iam in onClickHandleButton");

        getAllAccounts() .then(result =>{
            this.accountsFromApex = result;

            console.log("accountsFromApex----",this.accountsFromApex);
        })
        .catch(error =>{
            this.errorMsg = error;
        })

    }


    @api recordsData=[];

    onClickHandleButtonKarthikDataTable(){
        alert("Iam in onClickHandleButtonKarthikDataTable");
    

        getAccountListForDataTable() .then(result =>{

           // this.recordsData = JSON.parse(result.data);

            console.log("recordsData---result-",result);

            this.accountsFromApexDatatable = result;

            console.log("accountsFromApexDatatable----",this.accountsFromApexDatatable);

            console.log("accountsFromApexDatatable--stringify--",JSON.stringify(this.accountsFromApexDatatable));

            this.recordsData =result;


            console.log("accountsFromApexDatatable--recordsData--",this.recordsData);

            console.log("accountsFromApexDatatable-recordsData-stringify--",JSON.stringify(this.recordsData));


        })
        .catch(error =>{
            this.errorMsg = error;
        })
    }

    
}