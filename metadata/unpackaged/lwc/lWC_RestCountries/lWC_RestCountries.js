import { LightningElement ,track} from 'lwc';

const columns = [
{ label: 'Name', fieldName: 'name' },
{ label: 'capital', fieldName: 'capital' },
{ label: 'currency', fieldName: 'currency' },
{type: "button", typeAttributes: {
    label: 'View',
    name: 'View',
    title: 'View',
    disabled: false,
    value: 'view',
    iconPosition: 'left'
}},


];

export default class LWC_RestCountries extends LightningElement {






@track repos;
@track countriesdata;
columns = columns;
handleRowAction(event) {
    
    const row = event.detail.row;
    alert(JSON.stringify(row));
}
async connectedCallback() {
        
    let endPoint = "https://restcountries.com/v3.1/all";
    fetch(endPoint, {
        method: "GET"
    })
        .then((response) => response.json()) 
        .then((repos) => {
        this.repos = repos;
        //alert(repos.length);
        //alert(JSON.stringify(repos));
        var countries = [];
        
        this.repos.forEach(function(el) {
            var  name_ = el.name.official;
            var currency = el.currencies;
            var capital = el.capital;

            if (capital && capital != undefined && currency && currency != undefined) {
                countries.push({"name": name_, "currency": Object.keys(currency)[0], "capital": capital[0]});
            }
        })
this.countriesdata=countries;
        console.log(countries);


        
        });
        
    
    }
    

}