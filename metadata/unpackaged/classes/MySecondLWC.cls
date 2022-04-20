global with sharing class MySecondLWC {
public MySecondLWC() {

}

@AuraEnabled
public static  List<Account> getAllAccounts(){

List<Account>  allAccs = [select Id,Name from Account];

return allAccs;
}


@AuraEnabled(cacheable=true)
global static List<Account> getAccountListForDataTable() {
return [SELECT Id, Name, Type, Rating,
        Phone, Website, AnnualRevenue
    FROM Account];
}



@AuraEnabled(cacheable=false)
public static List<CustomAccount> getAccountListForDataTableCustom() {

List<CustomAccount> lstAccApp = new List<CustomAccount>();
for(Account acc :  [SELECT Id, Name, Type, Rating, Phone, Website, AnnualRevenue FROM Account]){
lstAccApp.add(new CustomAccount(acc));
}
return lstAccApp;


}


public class CustomAccount{
public CustomAccount(Account acc){
    this.Name = acc.Name;
    this.Id = acc.Id;
    this.Website = acc.website;
    this.Phone = acc.phone;
    this.Type = acc.Type;
    this.Rating = acc.Rating;
    this.AnnualRevenue = acc.AnnualRevenue;
}
@AuraEnabled public String Name;
@AuraEnabled public String Id;
@AuraEnabled public String Website;
@AuraEnabled public String Phone;
@AuraEnabled public String Type;
@AuraEnabled public String Rating;
@AuraEnabled public Decimal AnnualRevenue;
}


}