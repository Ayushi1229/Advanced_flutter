import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'item_controller.dart';
import 'item_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RxList with Dialog Input',
      home: Scaffold(
        appBar: AppBar(title: Text('RxList with Add Dialog')),
        body: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(item.name),
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
            )
          ],
        ),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    final TextEditingController inputController = TextEditingController();

    Get.defaultDialog(
      title: 'Enter Item Name',
      content: Column(
        children: [
          TextField(
            controller: inputController,
            decoration: InputDecoration(
              hintText: 'e.g. Mango',
            ),
          ),
        ],
      ),
      textConfirm: 'Add',
      textCancel: 'Cancel',
      onConfirm: () {
        final name = inputController.text;
        if (name.trim().isNotEmpty) {
          Get.find<ItemController>().addItem(name);
          Get.back(); // Close the dialog
        }
      },
      onCancel: () {},
    );
  }
}
