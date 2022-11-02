import 'package:get/get.dart';

import '../models/profile_models.dart';

class ProfileController extends GetxController {
  var profileDetails = Rxn<ProfileModel>();

  featchProfileDetails(String id) {
    profileDetails.value = ProfileModel(
        Class: '11th',
        Institute: 'Success Point',
        id: '1',
        name: 'Aditya Paswan',
        subject: 'Physics Chemistry Maths');
  }
}
