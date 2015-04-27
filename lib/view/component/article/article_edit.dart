import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';
import 'article_table.dart';

@CustomTag('article-edit')
class ArticleEdit extends PolymerElement {
  @published Articles articles;
  @published Article article;

  ArticleEdit.created() : super.created();

  update(Event e, var detail, Node target) {
    var polymerApp = querySelector('#polymer-app');
    ArticleTable articleTable =
        polymerApp.shadowRoot.querySelector('#article-table');
    articleTable.showEdit = false;
    polymerApp.saveData();
    window.location.reload();
  }
}