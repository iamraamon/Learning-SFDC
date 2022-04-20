@RestResource(urlMapping='/KasmoAccount/*')
global class KasmoRestAPI {

    
     @HttpGet
    global static List<Account> getRecord() {
        // Add your code
        // 
       
        List<Account> lstAcc = [select Id,Name,phone from Account];
        
        return lstAcc;
    }
    
}