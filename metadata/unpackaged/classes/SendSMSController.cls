public class SendSMSController {

    @AuraEnabled
    public static String sendSMS(String id,String messageTextInput){
        
        
        return 'Succesfully SMS Sent';
    }
}