import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';

@CustomTag('user-table')
class UserTable extends PolymerElement {
  @published Users users;
  User user;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showBorrowings = false;

  UserTable.created() : super.created();

  show(Event e, var detail, Node target) {
    ButtonElement showAddButton = $['show-add'];
    if (showAddButton.text == 'Show Add') {
      showAdd = true;
      showAddButton.text = 'Hide Add';
    } else {
      showAdd = false;
      showAddButton.text = 'Show Add';
    }
  }

  edit(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    user = users.find(code);
    showEdit = true;
  }

  delete(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    user = users.find(code);
    for (var borrowing in user.borrowings) {
      borrowing.project.borrowings.remove(borrowing); // internal
    }
    users.remove(user); // external
    showBorrowings = false;
  }

  showUserBorrowings(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    ButtonElement borrowingsButton = target;
    if (!showBorrowings && borrowingsButton.text == 'Show') {
      showBorrowings = true;
      user = users.find(code);
      user.borrowings.internalList = toObservable(user.borrowings.internalList);
      user.borrowings.order();
      borrowingsButton.text = 'Hide';
    } else if (showBorrowings && borrowingsButton.text == 'Hide') {
      showBorrowings = false;
      borrowingsButton.text = 'Show';
    }
  }
}