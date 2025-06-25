import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'SampleDemo.dart';
class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dialog Box Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.defaultDialog(
                title: "This is dialog box",
                middleText: "This is sub-text",
                textConfirm: "Yes",
                textCancel: "No",
                onConfirm: ()=> Get.to(SampleDemo()),
                onCancel: ()=> Get.back(),
                backgroundColor: Colors.tealAccent,
                confirmTextColor: Colors.white,
                buttonColor: Colors.black,
                radius: 10,
              );
            }, 
            child: Text("Click here to see dialog box.")),
            ElevatedButton(onPressed: (){
              Get.snackbar("Snackbar Demo", "This is your snackbar",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.lightBlueAccent,
              );
            }, child: Text("Click here to see the Snackbar")),
            ElevatedButton(onPressed: (){
              Get.bottomSheet(
                Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)
                    )
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text('Create', style:TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),
                      Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.document_scanner, color: Colors.blueAccent),
                          ),
                          SizedBox(width: 10),
                          Text('Document'),
                        ],
                      ),
                      Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.contact_page, color: Colors.green),
                          ),
                          SizedBox(width: 10),
                          Text('Spreadsheet'),
                        ],
                      ),
                      Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.folder,color:Colors.pink),
                          ),
                          SizedBox(width: 10),
                          Text('Folder'),
                        ],
                      ),
                      Divider(),
                      Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.camera_alt, color:Colors.black),
                          ),
                          SizedBox(width:10),
                          Text('Use Camera'),
                        ],
                      ),
                      Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.cloud_upload, color:Colors.black),
                          ),
                          SizedBox(width:10),
                          Text('Upload Photos or Videos'),
                        ],
                      ),
                    ],
                  )
                )
              );
            }, child: Text('Click to see Bottom Sheet'))
          ],
        ),
      ),
      
    );
  }
}
