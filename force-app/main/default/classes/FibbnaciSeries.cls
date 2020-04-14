public class FibbnaciSeries{
    public static integer funcOfFibbnaciSeries(integer num){
        Integer i,a=0,b=1,c;
        system.debug(a);
        system.debug(b);
        for(i=0;i<num;i++)
        {
            c=a+b;
            a=b;
            b=c;
            system.debug(c);    
        }
        return b;
    }
}