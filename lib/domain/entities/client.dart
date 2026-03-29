class Client {
  int? id;
  String name;
  String phone;
  String? secondPhone;
  String tag;
  String? notes;
  DateTime createdAt;

  Client({
    this.id,
    required this.name,
    required this.phone,
    this.secondPhone,
    required this.tag,
    this.notes,
    required this.createdAt,
  });
}
