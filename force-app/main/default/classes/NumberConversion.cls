public class NumberConversion{
    public static integer functionOfNumberConversion(string a, string b){
       // string a='100101';
	    //string b='0101101';
		integer a1=integer.valueOf(a);
		integer b1=integer.valueOf(b);  
        
        double n1=b2d(a1);
        double n2=b2d(b1);
        
        integer n3 = integer.valueOf(n1+n2);
        
        double ans=d2b(n3);
        
        system.debug(integer.valueof(ans)); 
        return integer.valueof(ans);     
    }
    public static double b2d(integer num)					//BINARY TO DECIMAL CONVERSION
    {
         double dec=0,i=0,rem;
        while(num!=0)
        {
            rem=math.mod(num,10);
            num=num/10;
            dec= dec + rem * math.pow(2,i);
            ++i;
        }
        return dec;
    }
    
    public static double d2b(integer num)					//DECIMAL TO BINARY CONVERSION
    {
       double bin = 0,rem,i=1,step =1;
        while(num!=0)
        {
            rem=math.mod(num,2);
            num=num/2;
            bin = bin+(rem*i);
            i=i*10;
        }
        
        return bin;
    }
    
}