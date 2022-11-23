import 'package:instituto/models/alerts_models.dart';
import 'package:instituto/models/batch_models.dart';

class UserModel {
  late String id;
  late String firstname;
  late String lastname;
  late List? selectedInstitute;
  late List? institutes;
  late String role;

  UserModel(
    this.id,
    this.firstname,
    this.lastname,
    this.selectedInstitute,
    this.institutes,
    this.role,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        json["id"],
        json["firstname"],
        json["lastname"],
        json["selectedInstitute"],
        json["institutes"],
        json["role"],
      );
}


// user_controller --> user(userModel) --> selectedInstitute(InstituteModel) 
// --> all userdata specifcly of institute(batches, notification, chats...)