import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';
import 'dart:convert';

@CustomTag('article-table-guest')
class ArticleTableGuest extends PolymerElement {
  @published Articles articles;
  @published String email_guest;
  @published Users users;
  @published bool connected;
  static final String ARTICLE_BORROWINGS='articles-borrowings';
  Article article=new Article();
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showBorrowings = false;
  @published Borrowings borrowings=new Borrowings();
  static const String USER_BORROWINGS = 'user-borrowings';
  
  ArticleTableGuest.created() : super.created();


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

  borrow(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    article = articles.find(code);
    
    users=new Users();
    loadUsers();
    User user=new User();
   // InputElement description = $['description'];
     user=users.find(email_guest);
      Element message = $['message'];
      var error = false;
      message.text = '';
      if (!error) {
        var borrowing = new Borrowing();
        borrowing.article = article;
        
        borrowing.user = users.find(email_guest);
        borrowing.description = 'decrir';
        //loadBorrowings();
        // article.borrowings internal; user.borrowings external
        if (borrowings.add(borrowing) && borrowing.user.borrowings.add(borrowing)) {
          //article.borrowings.add(borrowing);
          user.borrowings.add(borrowing);
          
                          for(var b in user.borrowings)
                          print(b);
          message.text = 'borrowed';
          borrowings.order();
         //// saveArticles(articles);
          saveUsers(users);
          //saveBorrowings(borrowings);
        } else {
          message.text = 'borrowing with the same article and user already exists';
        }
      }
  }

  delete(Event e, var detail, Element target) {
    String code = target.attributes['code'];
    loadArticles();
    article = articles.find(code);
    for (var borrowing in article.borrowings) {
      borrowing.user.borrowings.remove(borrowing); // external
    }
    articles.remove(article); // internal
    showBorrowings = false;
  }

  showArticleBorrowings(Event e, var detail, Element target) {
    loadArticles();
    print("guest");
        print(email_guest);
        print(connected);
    
 
  }
  
  showArticles() {
    loadArticles();
    print("guest");
    print(email_guest);
    
    
    
  }
  loadArticles() {
    articles=new Articles();
      String json = window.localStorage[ARTICLE_BORROWINGS];
      if (json == null) {
        
      } else {
        articles.fromJson(JSON.decode(json));
      }
      articles.order();
    }
  loadBorrowings() {
      borrowings.clear();
        String json = window.localStorage['borrowings'];
        if (json == null) {
          
        } else {
          borrowings.fromJson(JSON.decode(json));
        }
        
      }
  loadUsers() {
        String json = window.localStorage[USER_BORROWINGS];
        if (json == null) {
          
        } else {
          users.fromJson(JSON.decode(json));
        }
        users.order();
      }
  saveArticles(Articles articles) {
        window.localStorage[ARTICLE_BORROWINGS] = JSON.encode(articles.toJson());
      }
  saveUsers(Users users) {
       window.localStorage[USER_BORROWINGS] = JSON.encode(users.toJson());
     }
   
}
saveBorrowings(Borrowings borrowings) {
       window.localStorage['borrowings'] = JSON.encode(borrowings.toJson());
     }
 
