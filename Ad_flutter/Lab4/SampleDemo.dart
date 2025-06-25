import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab4/dialogs.dart';

class SampleDemo extends StatelessWidget {
  const SampleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sample Demo"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        DialogBox();
      }),
    );
  }
}
