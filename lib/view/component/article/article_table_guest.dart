import 'dart:html';
import 'package:library/library.dart';
import 'package:polymer/polymer.dart';
import 'dart:convert';

@CustomTag('article-table-guest')
class ArticleTableGuest extends PolymerElement {
  @published Articles articles=new library_model().loaderArticles();
  @published String email_guest;
  @published Users users=new library_model().loaderUsers();
  @published bool connected;
  static final String ARTICLE_BORROWINGS='articles-borrowings';
  Article article=new Article();
  @observable bool showAdd = false;
  @observable bool showEdit = false;
  @observable bool showBorrowings = false;
  @published Borrowings borrowings=new Borrowings();

 
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
    articles=new library_model().loaderArticles();
    String code = target.attributes['code'];
  
    print(code);
    article = articles.find(code);
    print(article.author);
    print (email_guest);
    users=new Users();
    users=new library_model().loaderUsers();
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
        
        
        if (borrowings.add(borrowing) && borrowing.user.borrowings.add(borrowing)) {
          article.borrowings.add(borrowing);
          user.borrowings.add(borrowing);
          
                          
          message.text = 'borrowed';
          borrowings.order();
         new library_model().saveArticles(articles);
         new library_model().saveUsers(users);
          //saveBorrowings(borrowings);
        } else {
          message.text = 'borrowing with the same article and user already exists';
        }
      }
  }


  showArticleBorrowings(Event e, var detail, Element target) {
    articles=new library_model().loaderArticles();
   
    new library_model().saveArticles(articles);
             new library_model().saveUsers(users);
             
 
  }
  
  showArticles() {
    articles=new library_model().loaderArticles();
    
    
    
  }
  
  
  

   
}

