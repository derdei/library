import 'dart:html';
import 'dart:convert';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';

@CustomTag('article-add')
class ArticleAdd extends PolymerElement {
  @published Articles articles;
  

  ArticleAdd.created() : super.created();

  add(Event e, var detail, Node target) {
    InputElement title = $['title'];
    InputElement author = $['author'];
    InputElement category = $['category'];
    InputElement quantity = $['quantity'];
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
	    article.author = author.value;
	    article.category = category.value;
	    article.quantity = int.parse(quantity.value);
	    articles=new library_model().loaderArticles();
      if (articles.add(article)) {
        
        new library_model().saveArticles(articles);
        message.text = 'added';
        articles.order();
      } else {
        message.text = 'article name already in use';
      }
    }
  }
 
   
}