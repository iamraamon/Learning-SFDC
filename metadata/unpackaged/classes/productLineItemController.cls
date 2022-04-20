public class productLineItemController {
    
   /* public static void afterInsert(list<Product_Line_Item__c> newList){
        
        //system.debug('number of trans'+Trigger.new.size());
        list<Product_Line_Item__c> updateProdList = new list<Product_Line_Item__c>();
        for (Product_Line_Item__c cl: newList) {
            list<case> caselist = [select id, Product_Line_Item__c from case where id =: cl.caseId__c];
                cl.Case__c = cl.id;
                updateProdList.add(cl);
            system.debug('id is'+cl.caseId__c);
        }
        insert updateProdList; 
        
    }  */
}