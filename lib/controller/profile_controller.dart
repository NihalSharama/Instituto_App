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
        subject: ["Maths", "Physics", "Chemistry"]);
  }
}

class TeacherProfileController extends GetxController {
  var teacherprofileDetails = Rxn<TeacherProfileModel>();

  featchTeacherProfileDetails(String id) {
    teacherprofileDetails.value = TeacherProfileModel(
        Class: ["CLASS11TH", "CLASS 12TH"],
        Institute: 'RKM CLASSES',
        id: '1',
        name: 'ADITYA PASWAN',
        subject: ["Maths", "Physics", "Chemistry"]);
  }
}
