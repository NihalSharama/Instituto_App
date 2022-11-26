import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instituto/models/chat_model.dart';
import 'package:instituto/models/dashboard_model.dart';

class ChatScreenShowController extends GetxController {
  var chatScreenShowDetails = Rxn<ChatScreenShowModel>();

  featchChatScreenShowDetails(String id) {
    chatScreenShowDetails.value = ChatScreenShowModel(
        image: "assets/images/maths.png",
        name: "ADITYA PASWAN",
        batch: "SUPER 30",
        topic: "QUANTAM PHYSICS",
        description:
            "Hello Sir Please Ek Bitch Mere Paas Bhi De Do Yaha Bitch Ki Bohat Kami Hai");
  }
}
