import 'package:instituto/models/alerts_models.dart';
import 'package:instituto/models/batch_models.dart';

class UserModel {
  late String id;
  late String firstname;
  late String lastname;
  late String? selectedInstitute;
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
}

class UserInstituteModel {
  late String id;
  late String name;
  late List<BatchDetailsModel> batches;
  late List<NotificationModel> notifications;
  late List recentChats;
  late List? teachers;
  late List<NoticeModel>? requests;

  UserInstituteModel(this.id, this.name, this.batches, this.notifications,
      this.recentChats, this.requests, this.teachers);
}

// user_controller --> user(userModel) --> selectedInstitute(InstituteModel) 
// --> all userdata specifcly of institute(batches, notification, chats...)