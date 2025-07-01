import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RxList<Map> CRUD Example',
      home: Scaffold(
        appBar: AppBar(title: Text('RxList<Map> CRUD')),
        body: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return ListTile(
                    title: Text(item['name']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            _showEditDialog(context, item['id'], item['name']);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            controller.deleteItem(item['id']);
                          },
                        ),
                      ],
                    ),
                  );
                },
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () => _showAddDialog(context),
                child: Text('Add Item'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final TextEditingController inputController = TextEditingController();

    Get.defaultDialog(
      title: 'Add Item',
      content: TextField(
        controller: inputController,
        decoration: InputDecoration(hintText: 'Enter item name'),
      ),
      textConfirm: 'Add',
      textCancel: 'Cancel',
      onConfirm: () {
        controller.addItem(inputController.text);
        Get.back();
      },
    );
  }

  void _showEditDialog(BuildContext context, int id, String currentName) {
    final TextEditingController editController =
    TextEditingController(text: currentName);

    Get.defaultDialog(
      title: 'Edit Item',
      content: TextField(
        controller: editController,
        decoration: InputDecoration(hintText: 'Edit item name'),
      ),
      textConfirm: 'Update',
      textCancel: 'Cancel',
      onConfirm: () {
        controller.updateItem(id, editController.text);
        Get.back();
      },
    );
  }
}
