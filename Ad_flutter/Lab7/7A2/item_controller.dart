import 'package:get/get.dart';
import 'item_model.dart';

class ItemController extends GetxController {
  RxList<ItemModel> items = <ItemModel>[
    ItemModel(name: 'Apple'),
    ItemModel(name: 'Banana'),
    ItemModel(name: 'Orange'),
  ].obs;

  void toggleFavorite(int index) {
    items[index].isFavorite.value = !items[index].isFavorite.value;
  }
}
