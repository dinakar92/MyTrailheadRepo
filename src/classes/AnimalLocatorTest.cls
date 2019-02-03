@isTest
private class AnimalLocatorTest {
	@isTest
    static void testMethod1 () {
    	Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        string result=AnimalLocator.getAnimalNameById(3);
        System.assertEquals(result, 'dog');
        
    }
}