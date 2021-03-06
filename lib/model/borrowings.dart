part of library;

class Borrowing extends ConceptEntity<Borrowing> {
  Article _article;
  User _user;
  String dateReturn='2015-04-28';
  String dateBorrow='2015-05-02';
  
  Article get article => _article;
  set article(Article article) {
    _article = article;
    if (code == null && user != null) {
      code = '${article.code}-${user.code}';
    }
  }

  User get user => _user;
  set user(User user) {
    _user = user;
    if (code == null && article != null) {
      code = '${article.code}-${user.code}';
    }
  }

  Borrowing newEntity() => new Borrowing();

  

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    
   try{entityMap['code'] = code;
    entityMap['article'] = article.code;
    entityMap['user'] = user.code;
    entityMap['dateReturn'] =dateReturn ;
    entityMap['dateBorrow'] = dateBorrow;

   }catch(Exception,Startack){
        print ("code nul");
      }
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    code = entityMap['code'];
   
    try {
      user=entityMap['user'];
      article=entityMap['article'];
      // Article --< Borrowing is internal; User --< Borrowing is external
      dateBorrow = entityMap['dateBorrow'];
      dateReturn = entityMap['dateReturn'];

        } catch(exception, stackTrace) {
          print("user not found!");
          
        }

  }
}

class Borrowings extends ConceptEntities<Borrowing> {
  Borrowings newEntities() => new Borrowings();
  Borrowing newEntity() => new Borrowing();
}

