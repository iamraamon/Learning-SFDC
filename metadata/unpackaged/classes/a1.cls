public class a1 {

   
    
    public class a1Wrapper{
        
        public Integer contactsCount {get;set;}
        
        public String userName {set; get;}
        
        
    }
    
    
    
    public List<a1Wrapper>  finalResult =new  List<a1Wrapper>();
    
    public AggregateResult[] aggregateResultList {get;set;}
    
    
    public  List<a1Wrapper>  getFinalResult (){
         
        //Contact[]  aggrArray = [Select Id,createdById from Contact ];
        
        aggregateResultList = [select count(ID) , CreatedById from contact group by CreatedById];
        
      // finalResult =new  List<a1Wrapper>();
      
       System.debug('=========================aggregateResultList=========================='+aggregateResultList.size());
        
        for(AggregateResult aggr : aggregateResultList){
            
            Integer contactsTotal = (Integer)aggr.get('expr0');
            
            String createdUserId = (String)aggr.get('createdbyId');
            
        //  List<User> userResult =  [select Id, Name from User where Id=:contactsTotal];
            
            a1Wrapper  a1w = new a1Wrapper();
            
            a1w.contactsCount = contactsTotal;
            a1w.userName=createdUserId;
            
            
            finalResult.add(a1w);
        }
        
        System.debug('==================================================='+finalResult.size());
        return finalResult;
    }
    
    
    
    
      public List<a1Wrapper>  finalResultWithUserName =new  List<a1Wrapper>();
    
    
    
     public  List<a1Wrapper>  getFinalResultWithUserName (){
         
        //Contact[]  aggrArray = [Select Id,createdById from Contact ];
        
        aggregateResultList = [select count(ID) , CreatedById from contact group by CreatedById];
        
      // finalResult =new  List<a1Wrapper>();
      
       System.debug('=========================aggregateResultList=========================='+aggregateResultList.size());
        
        for(AggregateResult aggr : aggregateResultList){
            
            Integer contactsTotal = (Integer)aggr.get('expr0');
            
            String createdUserId = (String)aggr.get('createdbyId');
            
          List<User> userResult =  [select Id, Name from User where Id=:createdUserId];
            
            a1Wrapper  a1w = new a1Wrapper();
            
            a1w.contactsCount = contactsTotal;
            a1w.userName=userResult[0].Name;
            
            
            finalResultWithUserName.add(a1w);
        }
        
        System.debug('============================finalResultWithUserName======================='+finalResultWithUserName.size());
        return finalResultWithUserName;
    }
    
    
     
    
    List<Contact> con = [Select Id,name,CreatedById from Contact ];
    
    public List<Contact> getcon(){
        return con;
    }
    
}