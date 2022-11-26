// ignore_for_file: public_member_api_docs, sort_constructors_first
class TeacherRankingModel {
  late String teacherName;
  late double ranking;
  late int salary;
  late int totalStudent;
  TeacherRankingModel({
    required this.teacherName,
    required this.ranking,
    required this.salary,
    required this.totalStudent,
  });
}

class StoriesModel {
  late List images;
  late List name;
  late List title;
  StoriesModel({
    required this.images,
    required this.name,
    required this.title,
  });
}
