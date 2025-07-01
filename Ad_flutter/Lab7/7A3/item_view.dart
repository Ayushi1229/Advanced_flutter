import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'item_model.dart';
import 'item_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RxList Add/Delete Example',
      home: Scaffold(
        appBar: AppBar(title: Text('RxList Add/Delete')),
        body: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.deleteItem(index),
                    ),
                  );
                },
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () => _showAddItemDialog(context),
                child: Text('Add New Item'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    final TextEditingController inputController = TextEditingController();

    Get.defaultDialog(
      title: 'Enter Item Name',
      content: TextField(
        controller: inputController,
        decoration: InputDecoration(hintText: 'e.g. Mango'),
      ),
      textConfirm: 'Add',
      textCancel: 'Cancel',
      onConfirm: () {
        controller.addItem(inputController.text);
        Get.back();
      },
      onCancel: () {},
    );
  }
}
