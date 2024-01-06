class PurchaseCourseModel {
  late final int id;
  late final String name;
  late final String userId;

  PurchaseCourseModel({
    required this.id,
    required this.name,
    required this.userId,
  });

  PurchaseCourseModel.fromMap(Map<String, dynamic> result)
      : id = result["id"],
        name = result["name"],
        userId = result["userId"];
  Map<String, Object> toMap() {
    return {
      'name': name,
      'userId': userId,
    };
  }
}
