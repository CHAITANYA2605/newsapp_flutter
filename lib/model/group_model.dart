class GroupModel {
  String name;
  String admin;
  List<String> users;
  List<dynamic> messages; // You can define a message structure later

  GroupModel({
    required this.name,
    required this.admin,
    required this.users,
    required this.messages,
  });

  // from map
  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      name: map['name'],
      admin: map['admin'],
      users: List<String>.from(map['users']),
      messages: List<dynamic>.from(map['messages']),
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "admin": admin,
      "users": users,
      "messages": messages,
    };
  }
}
