public with sharing class ClientRestApi {
   	//Public String awt;
    //public string AWBNum;
    		//@future (callout=true)
            public void getAWBDetails(String AWBNum) {
                system.debug('AWBNum '+AWBNum);
               
                //this.awt = AWT;
            system.debug('Get AWB Number Details');
            Http h = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://kasmo-7e-dev-ed.my.salesforce.com/services/apexrest/Shipment__c?AWT__c='+AWBNum);
            req.setMethod('GET');
            req.setHeader('Authorization', 'Bearer 00D5j000008408N!AQwAQKro3vR7eI9ux_TmQpSzTmZQYVg.qusO3VDVyxlBQXqQ42RBfREnW7WhSpMRe9g7zJX111ujX4qjmVgi41GyRT7bI3pn');    
            HttpResponse res = h.send(req);
           // String result = JSON.serialize(res);
            
              //  System.debug('result:'+result);
            system.debug(res.getBody());
                 //Map<String, Object> res1 = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
   				 
                   
       
          System.debug('BODY: '+res.getBody());
           System.debug('STATUS:'+res.getStatus());
           System.debug('STATUS_CODE:'+res.getStatusCode());
                 
          // return res.getBody();
              		
                        
            }
                    
        }