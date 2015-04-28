import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';
import 'dart:convert';

@CustomTag('user-registration')
class UserRegistration extends PolymerElement {
  @published Users users=new Users();
  static const String USER_BORROWINGS = 'user-borrowings';
  //'polymer-user-borrowings';
  UserRegistration.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement firstName = $['first-name'];
    InputElement lastName = $['last-name'];
    InputElement email = $['email'];
    InputElement privilege = $['privilege'];
    InputElement phone = $['phone'];
    InputElement password = $['password'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (firstName.value.trim() == '') {
      message.text = 'user first name is required; ${message.text}';
      error = true;
    }
    if (lastName.value.trim() == '') {
      message.text = 'user last name is required; ${message.text}';
      error = true;
    }
    if (email.value.trim() == '') {
      message.text = 'user email is required; ${message.text}';
      error = true;
    }
    if (!error) {
      var user = new User();
	    user.firstName = firstName.value;
	    user.lastName = lastName.value;
	    user.email = email.value;
	    user.privilege=privilege.value;
	    user.password=password.value;
	    user.phone=phone.value;
	    loadUsers();
      if (users.add(user)) {
        
       saveUsers(users);
        message.text = 'added';
        users.order();
      } else {
        message.text = 'user email already in use';
      }
    }
  }
  saveUsers(Users users) {
      window.localStorage[USER_BORROWINGS] = JSON.encode(users.toJson());
    }
  loadUsers() {
    users.clear();
      String json = window.localStorage[USER_BORROWINGS];
      if (json == null) {
        
      } else {
        users.fromJson(JSON.decode(json));
      }
      users.order();
    }

}