@isTest
public class NumberConversionTest {
    @isTest
    public static Void funOfNumberConversionTest() {
        integer x =NumberConversion.functionOfNumberConversion('100101', '0101101');
        system.assertEquals(1010010,x);
    }
    @isTest
     public static Void funOfNumberConversionTest1() {
        integer x =NumberConversion.functionOfNumberConversion('1111', '0000');
        system.assertEquals(1111,x);
    }
}