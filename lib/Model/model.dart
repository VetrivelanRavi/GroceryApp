class Model {
  String? name;
  String? category;
  double? price;
  String? image;
  void Function()? onPressed;

  Model({this.name, this.category, this.price, this.image, this.onPressed});

  Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
