// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {
  late String id;
  late String name;
  late String Institute;
  late List subject;
  late String Class;
  ProfileModel({
    required this.id,
    required this.name,
    required this.Institute,
    required this.subject,
    required this.Class,
  });
}

class TeacherProfileModel {
  late String id;
  late String name;
  late String Institute;
  late List subject;
  late List Class;
  TeacherProfileModel({
    required this.id,
    required this.name,
    required this.Institute,
    required this.subject,
    required this.Class,
  });
}
