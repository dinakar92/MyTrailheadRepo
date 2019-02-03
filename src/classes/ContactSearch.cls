public class ContactSearch {
    public static List<Contact> searchForContacts (String ln , String postcode) {
        List<Contact> conList = [SELECT ID, Name FROM Contact WHERE LastName =: ln AND MailingPostalCode =: postcode];
        System.debug(conList);
        return conList;
    }
}