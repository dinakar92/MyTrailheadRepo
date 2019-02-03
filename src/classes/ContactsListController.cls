public class ContactsListController {
    private String sortOrder = 'LastName';
    
    public List<Contact> getContacts () {
        List<Contact> results = Database.query('SELECT Id, FirstName, LastName, Title, Email FROM CONTACT ORDER BY '+ sortOrder +' ASC');
        return results;
    }
    
    public void sortByLastName() {
        this.sortOrder = 'LastName';
    }
        
    public void sortByFirstName() {
        this.sortOrder = 'FirstName';
    }
}