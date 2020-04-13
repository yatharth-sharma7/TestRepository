public class NumberReverse{
    public static Integer funcOfNumberReverse( integer num){
        Integer rev=0, a;
        while(num!=0)
        {
            a = math.mod(num,10);
            rev = (rev*10)+a;
            num = num/10;
            
        }
        system.debug(rev);
        return rev;
    }
}