import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';
import 'borrowing_table.dart';

@CustomTag('borrowing-edit')
class BorrowingEdit extends PolymerElement {
  @published Borrowing borrowing;

  BorrowingEdit.created() : super.created();

  update(Event e, var detail, Node target) {
    var polymerApp = querySelector('#polymer-app');
    var productTable = polymerApp.shadowRoot.querySelector('#project-table');
    BorrowingTable borrowingTable = productTable.shadowRoot.querySelector('#borrowing-table');
    borrowingTable.showEdit = false;
    polymerApp.saveData();
    window.location.reload();
  }
}

