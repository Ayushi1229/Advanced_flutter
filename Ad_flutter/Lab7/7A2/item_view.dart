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
      title: 'RxList with Favorite Icon',
      home: Scaffold(
        appBar: AppBar(title: Text('Favorite Items')),
        body: Obx(() => ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            final item = controller.items[index];

            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(item.name),
              trailing: Obx(() => IconButton(
                icon: Icon(
                  item.isFavorite.value
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: item.isFavorite.value ? Colors.red : Colors.grey,
                ),
                onPressed: () => controller.toggleFavorite(index),
              )),
            );
          },
        )),
      ),
    );
  }
}
