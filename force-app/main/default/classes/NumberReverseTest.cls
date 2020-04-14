@isTest
public  class NumberReverseTest {
    @isTest
    public static void funOfNumberReverseTest() {
     //integer a = NumberReverse.funcofNumberReverse(1234);
        System.AssertEquals(4321,NumberReverse.funcofNumberReverse(1234));
    }
    @isTest
    public static void funOfNumberReverseTest1() {
    System.AssertEquals(17654321,NumberReverse.funcofNumberReverse(12345671));
    }
    @isTest
    public static void funOfNumberReverseTest2() {
        System.AssertEquals(123321,NumberReverse.funcofNumberReverse(123321));
    }
}