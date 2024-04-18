import 'package:installitaion_class_datatype_variable_theme_route/models/model.dart';

class cartmodel {
  static final cattModel = cartmodel._internal();
  cartmodel._internal();

  factory cartmodel() => cattModel;

  late catalogModel _catalog;
  final List<int> _itemsids = [];
  catalogModel get catalog => _catalog;

  set catalog(catalogModel newcatalog) {
    _catalog = newcatalog;
  }

  List<Item> get items => _itemsids.map((id) => _catalog.getByiId(id)).toList();
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void additem(Item item) {
    _itemsids.add(item.id);
  }

  void removeitem(Item item) {
    _itemsids.remove(item.id);
  }
}
