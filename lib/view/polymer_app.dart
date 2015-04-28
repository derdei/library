import 'dart:html';
import 'dart:convert';
import 'package:polymer/polymer.dart';
import '../library.dart';

@CustomTag('polymer-app')
class PolymerApp extends PolymerElement {
<<<<<<< HEAD
  static const String USER_BORROWINGS = 'p-u-b-3';
  //'polymer-user-borrowings';
  static const String ARTICLE_BORROWINGS = 'polymer-article-borrowings';
=======
  static const String USER_BORROWINGS = 'polymer-user-borrowings';
  static const String ARTICLE_BORROWINGS = 'articles';
>>>>>>> f7c44c29576f490c5cad77976f80a225ba6c1488

  BorrowingsModel borrowingsModel;
  @observable Users users;
  @observable Articles articles;

  PolymerApp.created() : super.created() {
    // using singleton (one object only) pattern http://en.wikipedia.org/wiki/Singleton_pattern
    borrowingsModel = BorrowingsModel.one();
    users = borrowingsModel.users;
    articles = borrowingsModel.articles;
    //borrowingsModel.init(); // comment load to reinit
    load();
    //borrowingsModel.display();
    users.internalList = toObservable(users.internalList);
articles.internalList = toObservable(articles.internalList);
  }

  loadUsers() {
    String json = window.localStorage[USER_BORROWINGS];
    if (json == null) {
      //borrowingsModel.init();
    } else {
      users.fromJson(JSON.decode(json));
    }
    users.order();
  }

  loadArticles() {
    String json = window.localStorage[ARTICLE_BORROWINGS];
    if (json != null) {
      try {
        //articles.fromJson(JSON.decode(json));
          } catch(exception, stackTrace) {
            print("empty for this!");
            
          }
    }
    articles.order();
  }

  load() {
    loadUsers();
    loadArticles();
  }

  saveUsers() {
    window.localStorage[USER_BORROWINGS] = JSON.encode(users.toJson());
  }

  saveArticles() {
    window.localStorage[ARTICLE_BORROWINGS] = JSON.encode(articles.toJson());
  }

  save(Event e, var detail, Node target) {
    saveData();
  }

  saveData() {
    saveUsers();
    saveArticles();
  }
}