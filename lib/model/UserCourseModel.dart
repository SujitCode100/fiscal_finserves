class UserCourseModel {
  late final int id;
  late final String name;
  late final String userId;
  late final int videono;

  UserCourseModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.videono,
  });

  UserCourseModel.fromMap(Map<String, dynamic> result)
      : id = result["id"],
        name = result["name"],
        userId = result["userId"],
        videono = result["videono"];
  Map<String, Object> toMap() {
    return {
      'name': name,
      'userId': userId,
      'videono': videono
    };
  }
}
