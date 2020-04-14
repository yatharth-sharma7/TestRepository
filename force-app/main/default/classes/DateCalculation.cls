public with sharing class DateCalculation {
    public static Integer funcOfDateCalc(Datetime myDate,Datetime myDate2)
    {
        //Datetime myDate = Datetime.newInstance(2008, 12, 1, 12, 30, 2);
        //Datetime myDate2 = Datetime.newInstance(2009, 12, 1, 12, 30, 2);
        
        Integer StartYear= myDate.year();
        Integer StartMonth= myDate.month();
        Integer StartDay= myDate.day();
        Integer StartHours= myDate.hour();
        Integer StartMin= myDate.minute();
        Integer StartSeconds= myDate.second();
        
        Integer EndYear= myDate2.year();
        Integer EndMonth= myDate2.month();
        Integer EndDay= myDate2.day();
        Integer EndHours= myDate2.hour();
        Integer EndMin= myDate2.minute();
        Integer EndSeconds= myDate2.second();
        
        Integer DYear= EndYear-StartYear;
        Integer DMonth= EndMonth-StartMonth;
        Integer DDay= EndDay-StartDay;
        Integer DHours= EndHours-StartHours;
        Integer DMin= EndMin-StartMin;
        Integer DSeconds= EndSeconds-StartSeconds; 
        Date d1=myDate.date();
        Date d2=myDate2.date();
        Integer difference = d1.daysBetween(d2);
        
        system.debug('diiferne = **\n'+Dyear+'Year '+DMonth+'Months '+DDay+'Days '+DHours+'Hours '+DMin+'Minutes '+DSeconds+'Seconds ');
        system.debug(Difference);
        return difference;
    }
}