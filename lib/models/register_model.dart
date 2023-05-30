class RegisterModel {
  late String name;
  late String email;
  late String password;
  late String phone;
  late String uid;

  RegisterModel(
      {required this.email,
      required this.name,
      required this.password,
      required this.phone,
      required this.uid});
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "uid": uid
    };
  }
}
