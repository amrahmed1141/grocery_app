
class UserModel {
  final String id;
  final String name;
  final String email;
  UserModel({required this.id, required this.name, required this.email});
 
 //// convet map to dart code to fetch data from firestore 
   factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['Id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
  ///  convert dart user to map to save and update it to firestore

   Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'name': name,
      'email': email,
    };
  }

}
