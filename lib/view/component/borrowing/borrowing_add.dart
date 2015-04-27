import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';

@CustomTag('borrowing-add')
class BorrowingAdd extends PolymerElement {
  @published Article article;
  @published Borrowings borrowings;
  Users users = BorrowingsModel.one().users;

  BorrowingAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement description = $['description'];
    SelectElement userLookup = $['user-lookup'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (!error) {
      var borrowing = new Borrowing();
      borrowing.article = article;
      String code = userLookup.value;
      borrowing.user = users.find(code);
      borrowing.description = description.value;
      // article.borrowings internal; user.borrowings external
      if (borrowings.add(borrowing) && borrowing.user.borrowings.add(borrowing)) {
        message.text = 'added';
        borrowings.order();
      } else {
        message.text = 'borrowing with the same article and user already exists';
      }
    }
  }

}

