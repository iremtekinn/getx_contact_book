import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/contact_model.dart';

class AppData extends GetxController{
  var contacts =[].obs;

  addContact(ContactModel contact){
    contacts.add(contact);
    Get.back();
  }

  deleteContact(ContactModel contact){
    contacts.remove(contact);
  }
}