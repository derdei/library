import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';

@CustomTag('article-add')
class ArticleAdd extends PolymerElement {
  @published Articles articles;

  ArticleAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement title = $['title'];
    InputElement description = $['description'];
    Element message = $['message'];
    var error = false;
    message.text = '';
    if (title.value.trim() == '') {
      message.text = 'article title is required; ${message.text}';
      error = true;
    }
    if (!error) {
      var article = new Article();
	    article.title = title.value;
	    article.description = description.value;
      if (articles.add(article)) {
        message.text = 'added';
        articles.order();
      } else {
        message.text = 'article name already in use';
      }
    }
  }
}