class UserModel {
  final int? id;
  final String? email;
  final String? name;
  final String? role;
  final String?avatar;
  final String? password;

  UserModel({
     this.avatar,
     this.email,
     this.id,
     this.name,
     this.role,
     this.password,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      avatar: json['avatar'],
      email: json['email'],
      id: json['id'],
      name: json['name'],
      role: json['role'],
    //   password: json['password']
    );
  }
  Map<String, dynamic> toJson(){
    return{
        "email":email,
        "password":password
    };
  }
}
