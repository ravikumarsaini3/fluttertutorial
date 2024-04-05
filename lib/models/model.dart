// ignore_for_file: public_member_api_docs, sort_constructors_first

class catalogModel {
  static List<Item> items = [];
}

class Item {
  String image;
  num id;
  String name;
  num price;

  Item({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
  });
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        image: map['image'],
        id: map["id"],
        name: map["name"],
        price: map["price"]);
  }

  toMap() => {"id": id, "name": name, "price": price, "image": image};
}
