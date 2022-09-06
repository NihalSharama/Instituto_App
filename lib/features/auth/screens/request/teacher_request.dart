import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instituto/features/auth/screens/request/student_request_to_teacher.dart';

class TeacherRequest extends StatefulWidget {
  const TeacherRequest({Key? key}) : super(key: key);

  @override
  State<TeacherRequest> createState() => _TeacherRequestState();
}

class _TeacherRequestState extends State<TeacherRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: -5,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/back_button_icon.svg '),
        ),
        title: const Text(
          "Teacher\'s Request",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: StudentRequestToTeacher(),
    );
  }
}
