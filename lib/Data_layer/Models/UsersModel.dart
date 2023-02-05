class UserModel {
  late String email;
  late String password;
  late String Phone;
  late String name;
  late String Country;

  UserModel({
    required this.name,
    required this.email,
    required this.Phone,
    required this.password,
    required this.Country,
  });

  UserModel.FromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    Phone = json['Phone'];
    password = json['password'];
    Country = json['Country'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name ,
      'email': email ,
      'Phone': Phone ,
      'password': password ,
      'Country': Country ,
  };
  }
}
