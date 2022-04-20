public class LCCovidMain {

     @AuraEnabled
    public static  List<Object>   retrieveAllCountries () {
        //https://restcountries.eu/rest/v2/all
        //enter
        //result
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.covid19api.com/countries');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
         List<Object>  results = null;
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
             results = ( List<Object> ) JSON.deserializeUntyped(response.getBody());
            
            system.debug(results);
            // Cast the values in the 'animals' key as a list
        /*    List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) {
                System.debug(animal);
            } */
        }
        
        return results;
        
    }
    
      @AuraEnabled
    public static Object  retrieveCountryInfoByCode (String countryCode) {
      
        //enter  https://api.covid19api.com/country/IN
        //result
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.covid19api.com/country/'+countryCode);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
         Object  results=null;
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
               results = ( Object ) JSON.deserializeUntyped(response.getBody());
            
            system.debug(results);
            
        //    system.debug(' Country Name :'+results.name);
            // Cast the values in the 'animals' key as a list
        /*    List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for (Object animal: animals) {
                System.debug(animal);
            } */
        }
        
        return results;
    }

}