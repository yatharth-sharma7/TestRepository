@isTest
public class ExampleHelperClassTest {
	@isTest
    static void testCalculator()
    {
        ExampleHelperForTestClass mc = new ExampleHelperForTestClass();
        System.assertEquals(5, mc.add(2, 3));
        System.assertEquals(3, mc.minus(7, 4));
        System.assertEquals(18, mc.multiply(3, 6));
       
    }
}