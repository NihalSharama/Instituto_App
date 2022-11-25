class MessageModel {
  late String id;
  late String text;
  late String from;

  MessageModel(this.id, this.text, this.from);
}

class SelectedBatchDetailsModel {
  late String instituteCode;
  late String id;
  late String batchCode;
  late String batchName;
  late String teacherName;
  late String subject;
  late String grade;
  late List messages;
  late List documents;
  late List notices;
  late List students;
  late List blacklistStudents;

  SelectedBatchDetailsModel(
      this.instituteCode,
      this.id,
      this.batchCode,
      this.batchName,
      this.teacherName,
      this.subject,
      this.grade,
      this.messages,
      this.documents,
      this.notices,
      this.students,
      this.blacklistStudents);
}

class NoticeModel {
  late String id;
  late String title;
  late String description;
  late String from;
  late DateTime timestamp;
  late String? file;

  NoticeModel(this.id, this.title, this.description, this.from, this.timestamp,
      this.file);
}

class DocumentModel {
  late String id;
  late String text;
  late String file;
  late String from;
  late DateTime timestamp;

  DocumentModel(this.id, this.text, this.from, this.timestamp, this.file);
}
