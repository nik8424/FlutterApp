import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

//catalog feild
class CartModel {
  late CatalogModel _catalog;
//collection if IDs - store ids if each item
  final List<int> _itemIds = [];

//get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    // ignore: unnecessary_null_comparison
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items by ids
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//get total price
  // num get totalprice =>
  //     items.fold(0, (total, current) => total + current.price);

}

class AddMutation extends VxMutation<MyStore> {
  late final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  late final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
