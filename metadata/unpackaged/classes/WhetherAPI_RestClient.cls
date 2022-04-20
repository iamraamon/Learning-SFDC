public class WhetherAPI_RestClient {

@AuraEnabled
public static String fetchWhetherBasedOnCity(String city){
    system.debug(' starting-------------------------------fetchWhetherBasedOnCity  start---------');
    //we need to call rest api
    //http://api.weatherapi.com/v1/current.json?key=4dc38b06a8d4462da5025105221003&q=Bangalore
    //
    String url_api = 'http://api.weatherapi.com/v1/current.json?key=4dc38b06a8d4462da5025105221003&q='+city;
    
    
    Http varHttp = new Http(); //to open browser
    
    
        HttpRequest varReq =  new HttpRequest();  //pasting the url in the browser url and http method is GET
    
    varReq.setEndpoint(url_api);
    varReq.setMethod('GET');
    
    HTTPResponse varRes = varHttp.send(varReq);  // enter
    
    System.debug(varRes.getBody());
    
    system.debug(' starting-------------------------------fetchWhetherBasedOnCity  end---------');
    
return varRes.getBody();
}

}