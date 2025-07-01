import 'package:get/get.dart';

class DataController extends GetxController {
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[
    {'id': 1, 'name': 'Apple'},
    {'id': 2, 'name': 'Banana'},
  ].obs;

  int _idCounter = 3;

  void addItem(String name) {
    if (name.trim().isNotEmpty) {
      items.add({'id': _idCounter++, 'name': name.trim()});
    }
  }

  void updateItem(int id, String newName) {
    final index = items.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      items[index]['name'] = newName.trim();
      items.refresh();
    }
  }

  void deleteItem(int id) {
    items.removeWhere((item) => item['id'] == id);
  }
}
