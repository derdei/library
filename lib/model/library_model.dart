part of library;

 class library_model{
   BorrowingsModel borrowings;
  static Articles articles =new Articles();
  static Users users =new Users();
  static final String ARTICLE_BORROWINGS='articles-borrowings';
  static const String USER_BORROWINGS = 'user-borrowings';
 
 
  
   init_users() {
       var user1 = new User();
       user1.firstName = 'Zidane';
       user1.lastName = 'Zinedine';
       user1.email = 'guest';
       user1.phone = '+1581-888-9999';
       user1.privilege = 'guest';
       user1.password = 'guest';
       users.add(user1);

       var user2 = new User();
       user2.firstName = 'Dzenan';
       user2.lastName = 'Balbaert';
       user2.email = 'admin';
       user2.phone = '+1581-111-2222';
       user2.privilege = 'admin';
       user2.password = 'admin';
       users.add(user2);
saveUsers(users);
       
     }
   
   init_articles() {
         var article1 = new Article();
         article1.title = 'coach';
         article1.category = 'Livre';
         article1.author = 'Archer Jeff';
         article1.quantity = 5;
         articles.add(article1);
         var article2 = new Article();
                article2.title = 'perserance';
                article2.category = 'CD';
                article2.author = 'Bouchard Nelson';
                article2.quantity = 10;
                articles.add(article2);
                saveArticles(articles);}
   loadArticles() {
     articles.clear();
         String json = window.localStorage[ARTICLE_BORROWINGS];
         if (json == null) {
           init_articles();
         } else {
           articles.fromJson(JSON.decode(json));
         }
         articles.order();
       }
   
   
  
   
   loadUsers() {
     users.clear();
         String json = window.localStorage[USER_BORROWINGS];
         if (json == null) {
          
           init_users();
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
    
   Users loaderUsers(){
     loadUsers();
     return users;
   }
   Articles loaderArticles(){
        loadArticles();
        return articles;
      }
 }
 
  
  


