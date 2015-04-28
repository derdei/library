import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';
import 'dart:convert';

@CustomTag('show-borrowing')
class ShowBorrowing extends PolymerElement {
  @published Borrowings borrowings=new Borrowings();
  @published String email_guest;
  @published Users users=new Users();
   
  static const String USER_BORROWINGS = 'user-borrowings';
  @observable User user;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showBorrowings = false;

  ShowBorrowing.created() : super.created();

  show(Event e, var detail, Element target) {
    loadUsers();
    print("appuyé");
    print(email_guest);
    // code = target.attributes['code'];
    //ButtonElement borrowingsButton = target;
   
      showBorrowings = true;
      user = users.find(email_guest);
      user.borrowings.internalList = toObservable(user.borrowings.internalList);
     
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