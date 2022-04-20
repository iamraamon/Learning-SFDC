public with sharing class LWC_My_First_Web_Component {
    public LWC_My_First_Web_Component() {

    }


    @AuraEnabled
    public static  List<Contact>  getAllContacts(){

                  List<Contact>  totalList= [select Id,Name,title from contact];


                  return totalList;

    }
}