import { LightningElement,track,api } from 'lwc';

import  fetchWhetherBasedOnCity    from '@salesforce/apex/WhetherAPI_RestClient.fetchWhetherBasedOnCity';

export default class Lwc_small_wether_comp extends LightningElement {

    @api  search_city ;

    @track errorMsg;
  @track  whetherResult ;

  @track whetherResultObj ;

  @track resultCityName;
  @track resultTemp;
  @track resultImage;

  handleSearch(){
      alert("Iam in handle search");

   //   this.search_city="London";




   fetchWhetherBasedOnCity({ city : this.search_city}) .then(result =>{
      this.whetherResult = result;

      console.log("fetchWhetherBasedOnCity----",this.whetherResult);

     this. whetherResultObj = JSON.parse(this.whetherResult);

     console.log("----JSON Obj--",    this. whetherResultObj.location.name);

     this.resultCityName = this. whetherResultObj.location.name;
     this.resultImage = this.whetherResultObj.current.condition.icon;
     this.resultTemp = this. whetherResultObj.current.temp_c;
  })
  .catch(error =>{
      this.errorMsg = error;
  })


  }


  handleCity(evt){

      this.search_city=evt.target.value;

      console.log(this.search_city);
    //  console.log(evt.detail);
  }
}