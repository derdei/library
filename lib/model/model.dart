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
    article1.title = 'Learning Dart by Articles';
    article1.category = 'A book about Dart by Dzenan and Ivo';
    articles.add(article1);

    var user1 = new User();
    user1.firstName = 'Dzenan';
    user1.lastName = 'Ridjanovic';
    user1.email = 'dzenanr@gmail.com';
    users.add(user1);

    var user2 = new User();
    user2.firstName = 'Ivo';
    user2.lastName = 'Balbaert';
    user2.email = 'ivo.balbaert@telenet.be';
    users.add(user2);

    var borrowing1 = new Borrowing();
    borrowing1.article = article1;
    borrowing1.user = user1;
    borrowing1.description = 'develop articles';
    article1.borrowings.add(borrowing1);
    user1.borrowings.add(borrowing1);

    var borrowing2 = new Borrowing();
    borrowing2.article = article1;
    borrowing2.user = user2;
    borrowing2.description = 'write about articles';
    article1.borrowings.add(borrowing2);
    user2.borrowings.add(borrowing2);

    var article2 = new Article();
    article2.title = 'On Dart';
    article2.author = 'A web site for On Dart Education';
    articles.add(article2);

    var borrowing3 = new Borrowing();
    borrowing3.article = article2;
    borrowing3.user = user1;
    borrowing3.description = 'prepare courses On Dart';
    article2.borrowings.add(borrowing3);
    user1.borrowings.add(borrowing3);
  }

  display() {
    print('===========');
    print('Borrowings Model');
    print('===========');
    for (var article in articles) {
      print('  Article');
      print('  -------');
      print(article.toString());
      print('    Borrowings');
      print('    -----');
      for (var borrowing in article.borrowings) {
        print(borrowing.toString());
      }
    }
    print('===========');
    for (var user in users) {
      print('  User');
      print('  --------');
      print(user.toString());
      print('    Borrowings');
      print('    -----');
      for (var borrowing in user.borrowings) {
        print(borrowing.toString());
      }
    }
    print(
      '=========== =========== =========== '
      '=========== =========== =========== '
    );
  }
}



