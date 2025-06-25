import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab4/dialog_controller.dart';

class DialogBox extends StatelessWidget {
  DialogBox({super.key});
  final DialogController controller = DialogController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dialog Box Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.handleDialogBox,
              child: const Text("Click here to see dialog box."),
            ),
            ElevatedButton(
              onPressed: controller.handleSnackbar,
              child: const Text("Click here to see the Snackbar"),
            ),
            ElevatedButton(
              onPressed: controller.handleBottomSheet,
              child: const Text("Click here to see BottomSheet"),
            ),
          ],
        ),
      ),
    );
  }
}
