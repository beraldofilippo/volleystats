class Category {
  String id;
  String name;

  static String ID_ALL = "id_all";
  static String NAME_ALL = "All";

  Category(this.id, this.name);

  Category.fromJson(Map<String, dynamic> json)
      : id  = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
      };
}