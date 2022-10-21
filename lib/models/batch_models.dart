class MessageModel {
  late String id;
  late String text;
  late String from;

  MessageModel(this.id, this.text, this.from);
}

class BatchDetailsModel {
  late String id;
  late String batchName;
  late String teacherName;
  late String timing;
  late String subject;
  late String grade;
  late List<MessageModel> messages;
  late List documents;
  late List notices;

  BatchDetailsModel(this.id, this.batchName, this.teacherName, this.timing,
      this.subject, this.grade, this.messages, this.documents, this.notices);
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
