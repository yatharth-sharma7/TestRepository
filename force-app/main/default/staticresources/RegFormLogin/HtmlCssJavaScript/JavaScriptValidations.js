function Validation(email,password){
    if(email.value != "yatharth.sharma@cloudanalogy.com"||password.value != "abcdefgh1234"){
        alert("Wrong Email Or Password");
        email.placeholder='nabc';
        return email.placeholder;
    }
    else{
        open("Welcome.html");
    }
}
