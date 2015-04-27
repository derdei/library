import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:library/library.dart';
import 'user_table.dart';

@CustomTag('user-edit')
class UserEdit extends PolymerElement {
  @published Users users;
  @published User user;

  UserEdit.created() : super.created();

  update(Event e, var detail, Node target) {
    var polymerApp = querySelector('#polymer-app');
    UserTable userTable =
        polymerApp.shadowRoot.querySelector('#user-table');
    userTable.showEdit = false;
    polymerApp.saveData();
    window.location.reload();
  }
}