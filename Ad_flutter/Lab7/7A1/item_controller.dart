import 'package:get/get.dart';
import 'item_model.dart';

class ItemController extends GetxController {
  RxList<ItemModel> items = <ItemModel>[
    ItemModel(name: 'Apple'),
    ItemModel(name: 'Banana'),
    ItemModel(name: 'Orange'),
  ].obs;

  void addItem(String name) {
    if (name.trim().isNotEmpty) {
      items.add(ItemModel(name: name.trim()));
    }
  }
}
