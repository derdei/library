part of library;

class User extends ConceptEntity<User> {
  String lastName;
  String firstName;
  String phone;
  String _email;
  String password;
  String privilege;
  
  Borrowings borrowings = new Borrowings(); // external relationship

  String get email => _email;
  set email(String email) {
    _email = email;
    if (code == null) {
      code = email;
    }
  }

  String get name => '${lastName}, ${firstName}';
  String get emailCode => email.replaceAll('.', '-').replaceAll('@', '-');

  User newEntity() => new User();

  String toString() {
    return '  {\n'
           '    code: ${code}\n'
           '    firstName: ${firstName}\n'
           '    lastName: ${lastName}\n'
           '    phone: ${phone}\n'
           '    email: ${email}\n'
           '    password: ${password}\n'
           '    privilege: ${privilege}\n'
           '  }\n';
  }

  
 
  
  /**
   * Compares two users based on last names, then on first names.
   * If the result is less than 0 then the first member is less than the second,
   * if it is equal to 0 they are equal and
   * if the result is greater than 0 then the first is greater than the second.
   */
  int compareTo(User user) {
    if (lastName != null && firstName != null) {
      int comparison = lastName.compareTo(user.lastName);
      if (comparison == 0) {
        comparison = firstName.compareTo(user.firstName);
      }
      return comparison;
    }
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = new Map<String, Object>();
    entityMap['code'] = code;
    entityMap['lastName'] = lastName;
    entityMap['firstName'] = firstName;
    entityMap['phone'] = phone;
    entityMap['email'] = email;
    entityMap['password'] = password;
    entityMap['privilege'] = privilege;
    entityMap['borrowings'] = borrowings.toJson();


    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    code = entityMap['code'];
    lastName = entityMap['lastName'];
    firstName = entityMap['firstName'];
    phone = entityMap['phone'];
    email = entityMap['email'];
    password = entityMap['password'];
    privilege = entityMap['privilege'];
   
    try {
          borrowings.fromJson(entityMap['borrowings']);
          borrowings.forEach((borrowing) {borrowing.user = this;});
        } catch(exception, stackTrace) {
          print("empty for user!");
          
        }
  }
}

class Users extends ConceptEntities<User> {
  Users newEntities() => new Users();
  User newEntity() => new User();
 
  User findLogin(String email, String password) {
    var users = new Users();
      for (var user in users) {
        if ((user.email == email)&&(user.password == password))
        return user;
      }
      return null;
    }
}

