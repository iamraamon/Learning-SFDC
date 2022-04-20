public class LC_Student_Controller {
    
    
    @AuraEnabled
    public static  Student__c createStudent(String name ,String address ,String contactPhone,String email,String city){
        
        System.debug('======================Start================LC_Student_Controller==============Iam in createStudent method');
        
        
        System.debug('**name----:'+name);
        System.debug('**address----:'+address);
        System.debug('**contactPhone----:'+contactPhone);
        System.debug('**email----:'+email);
        System.debug('**city----:'+city);
        
        Student__c  s1 = new Student__c() ;
        
        s1.Name = name;
        s1.Address__c=address;
        // s1.Contact_No__c=String.valueOf( contactPhone);
        s1.Contact_No__c= contactPhone;
        s1.Student_EMail__c=email;
        s1.City__c=city;
        
        
        insert s1;
        
        System.debug('======================End================LC_Student_Controller==============Iam in createStudent method');
        return s1;
    }
    
    @AuraEnabled
    public static List<Student__c  >  retrieveAllStudentRecords(){
        
        List<Student__c  >   sL1 = [select Id,Name,address__C ,Contact_No__c,city__c,Student_Id__c,Student_EMail__c from Student__c];
        
        return sL1;
    }
}