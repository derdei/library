import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';

@CustomTag('user-add')
class UserAdd extends PolymerElement {
  @published Users users;

  UserAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement firstName = $['first-name'];
    InputElement lastName = $['last-name'];
    InputElement email = $['email'];
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
      if (users.add(user)) {
        message.text = 'added';
        users.order();
      } else {
        message.text = 'user email already in use';
      }
    }
  }
}