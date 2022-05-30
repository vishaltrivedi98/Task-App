class Packages {
  int? id;
  String? packageName;
  int? price;
  String? description;

  Packages({this.id, this.packageName, this.price, this.description});

  static Packages fromJson(Map<String, dynamic> json) {
    return Packages(
      id: json['id'],
      packageName: json['package_name'],
      price: json['price'],
      description: json['description'],
    );
  }
}
