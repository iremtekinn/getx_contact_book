import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_contact_book/controller/app_data.dart';
import 'package:getx_contact_book/pages/addcontactscreen.dart';

import '../model/contact_model.dart';

class HomeScreen extends StatelessWidget {
  //const HomeScreen({super.key});
  AppData appData =Get.put(AppData(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Expanded(
            child:Obx(() => ListView.builder(itemBuilder: (ctx,i){
              ContactModel model =appData.contacts.value[i];
              return Container(
                
                margin: EdgeInsets.only(bottom:10),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(model.name),
                  subtitle: Text(model.phone),
                  trailing: IconButton(
                    onPressed: (){
                      appData.deleteContact(model);
                    },
                    icon: Icon(Icons.delete,color:Colors.red),),
                ),
              );
            },itemCount: appData.contacts.value.length,),)
            ),
            MaterialButton(onPressed: () {
              Get.to(()=>AddContactScreen());
            },child: Text("Add Contact",style: TextStyle(color:Colors.white),),color: Colors.blue,minWidth: 300,)
        ],
      )
    );
  }
}