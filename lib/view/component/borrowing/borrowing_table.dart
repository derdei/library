import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';

@CustomTag('borrowing-table')
class BorrowingTable extends PolymerElement {
  @published User user;
  @published Article article;
  @published Borrowings borrowings;
  Borrowing borrowing;
  @observable bool showAdd = false;
  @observable bool showEdit = false;

  BorrowingTable.created() : super.created();

  attached() {
    super.attached();
    if (article != null) borrowings = article.borrowings;
    if (user != null) borrowings = user.borrowings;
    borrowings.internalList = toObservable(borrowings.internalList);
    
       
      
  }

  show(Event e, var detail, Node target) {
   
    
    ButtonElement showAddButton = $['show-add'];
    if (article == null && showAddButton.text == 'Add by Article') {
      showAddButton.hidden = true;
    } else if (article == null) {
      showAddButton.text = 'Add by Article';
    } else if (showAddButton.text == 'Show Add') {
      showAdd = true;
      showAddButton.text = 'Hide Add';
    } else {
      showAdd = false;
      showAddButton.text = 'Show Add';
    }
  }

  edit(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    borrowing = borrowings.find(code);
    showEdit = true;
  }

  delete(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    borrowing = borrowings.find(code);
    borrowing.article.borrowings.remove(borrowing);  // internal
    borrowing.user.borrowings.remove(borrowing); // external
  }
}