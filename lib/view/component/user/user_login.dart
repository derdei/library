import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';
import 'dart:convert';
@CustomTag('user-login')
class UserLogin extends PolymerElement {
  @published Users users=new Users();
  @published String email2;
  @published bool connected=false;
  static const String USER_BORROWINGS = 'user-borrowings';
  @observable bool showLoginbool = false;
  UserLogin.created() : super.created();

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
      
       //user = users.findLogin(email.value,password.value);
      try{
        loadUsers();
        user=users.find(email.value);   
              if((email.value == user.email)&&(password.value == user.password)){
                message.text = 'login is ok';
                //Map<String, int> scores = {'email': email.value};
                showLoginbool=true;
                email2=email.value;
                connected=true;
                
                
              }
               else {
                message.text = 'login is not ok';
                
              } }catch(Exception , StackTrace ){
                
                message.text = 'this account does not exist';
                    
      }
    }
    }
  signup(){
    window.location.replace("registration.html");
  }
  
  loadUsers() {
     String json = window.localStorage[USER_BORROWINGS];
     if (json == null) {
       //borrowingsModel.init();
     } else {
       users.fromJson(JSON.decode(json));
     }
     users.order();
   }

  }