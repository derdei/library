import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';

@CustomTag('user-table')
class UserTable extends PolymerElement {
  @published Users users;
  User user;
  @published bool hide_forms=false;
  @observable bool showRegistrationbool = false;
  @observable bool showLoginbool = false;
  @observable bool showEdit = false;
  @observable bool showBorrowings = false;

  UserTable.created() : super.created();
  
  showRegistration(Event e, var detail, Node target) {
    ButtonElement showAddButton = $['show-registration'];
    if (showAddButton.text == 'Show registration') {
      showRegistrationbool = true;
      showLoginbool=false;
      showAddButton.text = 'Show Login';
    } else {
      showRegistrationbool = false;
      showLoginbool=true;
      showAddButton.text = 'Show registration';
    }
    if(hide_forms){
        showRegistrationbool=false;
        showLoginbool=false;
        print("heewllljmljk");
      }
    
  }


  
 
}