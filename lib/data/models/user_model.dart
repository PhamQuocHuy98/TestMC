abstract class BaseUserModel {
  Map<String, dynamic> toJson();
}

class UserModel implements BaseUserModel {
  String? id;

  String email = '';
  String? password;
  UserModel({
    this.id = '',
    this.email = '',
    this.password,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['user']['id'];

    email = json['user']["email"]?.toString().toLowerCase() ?? '';
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null || id != '') data['id'] = id;

    data["email"] = email.toLowerCase();
    if (password != null && password!.isNotEmpty) data["password"] = password;

    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
