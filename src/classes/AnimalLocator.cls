public class AnimalLocator {
    public static String getAnimalNameById (Integer p) {
        Map<String, Object> animal = new Map<String, Object>();
        HTTP http = new HTTP();
        HTTPRequest request = new HTTPRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+p);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
        	Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            animal = (Map<String, Object>)results.get('animal');
        }
        return (String)animal.get('name');
    }
}