// ignore_for_file: public_member_api_docs, sort_constructors_first

class catalogModel {
  static List<Item> items = [
    Item(
      id: 1,
      image:
          "https://guesseu.scene7.com/is/image/GuessEU/FLGLO4FAL12-BEIBR?wid=700&amp;fmt=jpeg&amp;qlt=80&amp;op_sharpen=0&amp;op_usm=1.0,1.0,5,0&amp;iccEmbed=0",
      name: "CHECK PRINT SHIRT",
      price: 110,
    ),
  ];
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
