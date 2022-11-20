import 'package:get/get.dart';
import 'package:instituto/common/utils/toaster_message.dart';
import 'package:instituto/features/home/services/home_services.dart';

class SubjectChipModel {
  late String id;
  late String name;

  SubjectChipModel(this.id, this.name);
}

class HomeController extends GetxController {
  onCreateSubjects(List<SubjectChipModel> subjects) async {
    try {
      subjects.forEach((SubjectChipModel subject) async {
        await HomeServices.createSubject(subject.name);
      });

      toasterSuccessMsg('Subjects Created Successfully');
    } catch (_) {
      return;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
