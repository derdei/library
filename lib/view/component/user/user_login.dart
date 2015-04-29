import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';
import 'dart:convert';
@CustomTag('user-login')
class UserLogin extends PolymerElement {
  @published Users users=new Users();
  Articles articles=new Articles();
  @published String email2;
  @published bool connected=false;
  @published bool showArticleAdmin=false;
static BorrowingsModel borrowingsModel;
  static const String USER_BORROWINGS = 'user-borrowings';
  @observable bool showLoginbool = false;
  UserLogin.created() : super.created(){
  
  }

  signin(Event e, var detail, Node target) {

    InputElement email = $['email'];
    InputElement password = $['password'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (email.value.trim() == '') {
      message.text = 'user email is required; ${message.text}';
      error = true;
    }
    if (password.value.trim() == '') {
      message.text = 'user password is required; ${message.text}';
      error = true;
    }
 
    if (!error) {
      var user = new User();
      users=new library_model().loaderUsers();
              
      try{
       
                     user=users.find(email.value);
              if((email.value == user.email)&&(password.value == user.password)){
                if(user.privilege != 'guest'){
                  print("toto");
                  showArticleAdmin=true;
                  showLoginbool=false;
                  connected=true;

                }else{
                  message.text = 'You are logged in';
                             showLoginbool=true;
                             email2=email.value;
                             connected=true;
                }     
                
              }
               else {
                message.text = 'login/password wrong!';
                
              } }catch(Exception , StackTrace ){
                
                message.text = 'this account does not exist';
      }
    }
    }
  signup(){
    window.location.replace("registration.html");
  }
  
  
  }