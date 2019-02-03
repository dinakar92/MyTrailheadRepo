public class StringArrayTest {
    public static List<String> generateStringArray(Integer arrLength){
        List<String> arr = new List<String>();
        for (Integer i = 0; i < arrLength; i++) {
            arr.add('Test '+i);
            system.debug(arr);
        }
        return arr;
    }
}