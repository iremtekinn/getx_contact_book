import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_contact_book/model/contact_model.dart';

import '../controller/app_data.dart';

class AddContactScreen extends StatelessWidget {
 // const AddContactScreen({super.key});
 TextEditingController  nameController=TextEditingController();
 TextEditingController  phoneController=TextEditingController();

 AppData appData =Get.find<AppData>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Add Contact"),),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your name'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your mobile number'
            ),
          ),
          const SizedBox(height: 10,),
          MaterialButton(onPressed: (){
            ContactModel model =ContactModel(
              phone:phoneController.text,
              name:nameController.text);
              appData.addContact(model);
          },
          child: Text("Add"),color:Colors.blue,minWidth:300)
        ],
      ),
      )
    );
  }
}