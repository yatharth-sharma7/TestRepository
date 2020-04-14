@isTest
public class HelperClassTestExampleTest {
@isTest
    static void testCalculator()
    {
        HelperClassTestExample mc = new HelperClassTestExample();
        System.assertEquals(9, mc.addition(2, 3, 4));
        System.assertEquals(0, mc.minus(7, 4, 3));
        System.assertEquals(18, mc.multiply(3, 6, 1));
         System.assertEquals(3, mc.mod(3, 6));
       
    }
}