import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';

@CustomTag('article-table')
class ArticleTable extends PolymerElement {
  @published Articles articles;
  Article article;
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showBorrowings = false;

  ArticleTable.created() : super.created();

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
    article = articles.find(code);
    showEdit = true;
  }

  delete(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    article = articles.find(code);
    for (var borrowing in article.borrowings) {
      borrowing.user.borrowings.remove(borrowing); // external
    }
    articles.remove(article); // internal
    showBorrowings = false;
  }

  showProjectTasks(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    ButtonElement borrowingsButton = target;
    if (!showBorrowings && borrowingsButton.text == 'Show') {
      showBorrowings = true;
      article = articles.find(code);
      article.borrowings.internalList = toObservable(article.borrowings.internalList);
      article.borrowings.order();
      borrowingsButton.text = 'Hide';
    } else if (showBorrowings && borrowingsButton.text == 'Hide') {
      showBorrowings = false;
      borrowingsButton.text = 'Show';
    }
  }
}