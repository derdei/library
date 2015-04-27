part of library;

class Article extends ConceptEntity<Article> {
  String _title;
  String description;
  Borrowings borrowings = new Borrowings(); // internal relationship

  String get title => _title;
  set title(String title) {
    _title = title;
    if (code == null) {
      code = titleCode;
    }
  }

  String get titleCode => title.replaceAll(' ', '-');

  Article newEntity() => new Article();

  String toString() {
    return '  {\n'
           '    code: ${code}\n'
           '    tile: ${title}\n'
           '    description: ${description}\n'
           '  }\n';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    entityMap['code'] = code;
    entityMap['title'] = title;
    entityMap['description'] = description;
    entityMap['borrowings'] = borrowings.toJson();
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    code = entityMap['code'];
    title = entityMap['title'];
    description = entityMap['description'];
    try {
      borrowings.fromJson(entityMap['borrowings']);
      borrowings.forEach((borrowing) {borrowing.article = this;});
    } catch(exception, stackTrace) {
      print("empty for this!");
      
    }
    
   
  }
}

class Articles extends ConceptEntities<Article> {
  Articles newEntities() => new Articles();
  Article newEntity() => new Article();
}

