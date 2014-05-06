global class AAA{
    private final Position__c merchant_location;
    public AAA(ApexPages.StandardController controller){
        this.merchant_location=(Position__c)controller.getRecord();
        //Account[] accs = [select id, TextAreaTest__c from account limit 1];        
    }

    public pageReference saveGeoCodes(){
        string id = System.CurrentPageReference().getParameters().get('id');
        Position__c ob = [select Latitude__c, Longitude__c from Position__c where id=:id];
        string lat = System.CurrentPageReference().getParameters().get('lati');
        string lng = System.CurrentPageReference().getParameters().get('long');
        ob.Latitude__c = lat;
        ob.Longitude__c = lng;

        //merchant_location.Latitude__c = lat;
        //merchant_location.Longitude__c = lng;

        System.debug('LATI : '+ lat);
        System.debug('LNG : '+ lng);
        //update merchant_location;
        update ob;
        return null;
    }
    
    public pageReference saveGeos(string id, string lat, string lng){
        Position__c ob = [select Latitude__c, Longitude__c from Position__c where id=:id];
        ob.Latitude__c = lat;
        ob.Longitude__c = lng;
        System.debug('LATI : '+ lat);
        System.debug('LNG : '+ lng);
        //update ob;
        return null;
    }    
}