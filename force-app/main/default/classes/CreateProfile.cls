public class CreateProfile{
    public static integer funcOfCreateProfile( Profile prof){
        
        //Profile prof = new Profile(); 
        //prof = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        integer i=0;
        User newUser = new User();
        newUser.Alias = 'Hokage';
        newUser.EmailEncodingKey = 'UTF-8';
        newUser.LanguageLocaleKey = 'en_US';
        newUser.FirstName = 'Naruto';
        newUser.LastName = 'Uzumaki';
        newUser.Email = 'yathart.sharma@cloudanalogy.com';
        newUser.LocaleSidKey = 'en_US';
        newUser.ProfileId = prof.Id;
        newUser.TimeZoneSidKey = 'GMT';
        newUser.UserName = 'hibuyatharth.sharma7110@cnbloudanalogy.com';
        newUser.UserPermissionsOfflineUser = TRUE;
        newUser.UserPermissionsMarketingUser = TRUE;
        i++;
        INSERT newUser;
        return  i;
    }
}