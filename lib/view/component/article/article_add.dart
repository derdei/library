import 'dart:html';
import 'dart:convert';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';

@CustomTag('article-add')
class ArticleAdd extends PolymerElement {
  @published Articles articles=new Articles();
  static final String ARTICLE_BORROWINGS='articles-borrowings';

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
	    //loadArticles();
      if (articles.add(article)) {
        saveArticles(articles);
        message.text = 'added';
        articles.order();
      } else {
        message.text = 'article name already in use';
      }
    }
  }
  saveArticles(Articles articles) {
       window.localStorage[ARTICLE_BORROWINGS] = JSON.encode(articles.toJson());
     }
   loadArticles() {
       String json = window.localStorage[ARTICLE_BORROWINGS];
       if (json == null) {
         
       } else {
         articles.fromJson(JSON.decode(json));
       }
       articles.order();
     }

}