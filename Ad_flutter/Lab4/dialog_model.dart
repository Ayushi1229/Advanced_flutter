import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab4/SampleDemo.dart';
import 'package:get/get.dart';

class DialogModel {
  void showDialogBox() {
    Get.defaultDialog(
      title: "This is dialog box",
      middleText: "This is sub-text",
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () => Get.to(const SampleDemo()),
      onCancel: () => Get.back(),
      backgroundColor: Colors.tealAccent,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
      radius: 10,
    );
  }

  void showSnackbar() {
    Get.snackbar(
      "Snackbar Demo",
      "This is your snackbar",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.lightBlueAccent,
    );
  }

  void showBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 300,
        width: 350,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.teal),
                  SizedBox(width: 10),
                  Text(
                    "This is a bottom sheet",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
