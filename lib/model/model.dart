part of library;

class BorrowingsModel extends ConceptModel {
  static const String ARTICLE = 'Article';
  static const String USER = 'User';

  static BorrowingsModel borrowingsModel;

  String jsonDirPath;

  BorrowingsModel.private();

  static BorrowingsModel one() {
    if (borrowingsModel == null) {
      borrowingsModel = new BorrowingsModel.private();
    }
    return borrowingsModel;
  }

  Map<String, ConceptEntities> newEntries() {
    var map = new Map<String, ConceptEntities>();
    var articles = new Articles();
    map[ARTICLE] = articles;
    var users = new Users();
    map[USER] = users;
    return map;
  }

  Articles get articles => getEntry(ARTICLE);
  Users get users => getEntry(USER);

  init() {
    var article1 = new Article();
    article1.title = 'Être son propre coach : choisir sa vie';
    article1.category = 'Livre';
    article1.author = 'Archer Jeff';
    article1.quantity = 5;

    
    articles.add(article1);

    var user1 = new User();
    user1.firstName = 'Zidane';
    user1.lastName = 'Zinedine';
    user1.email = 'zidane@gmail.com';
    user1.phone = '+1581-888-9999';
    user1.privilege = 'Guest';
    user1.password = 'Guest';
    users.add(user1);

    var user2 = new User();
    user2.firstName = 'Dzenan';
    user2.lastName = 'Balbaert';
    user2.email = 'd.balbaert@orange.fr';
    user2.phone = '+1581-111-2222';
    user2.privilege = 'Admin';
    user2.password = 'Admin';
    users.add(user2);

    var article2 = new Article();
    article2.title = 'La persévérance, clé de la réussite de sa vie';
    article2.category = 'CD';
    article2.author = 'Bouchard Nelson';
    article2.quantity = 10;
    articles.add(article2);
  }
}


