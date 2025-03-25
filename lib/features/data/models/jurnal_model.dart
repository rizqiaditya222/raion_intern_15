
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/jurnal.dart';

class JournalModel extends JournalEntity {
  JournalModel({
    required super.id,
    required super.title,
    required super.content,
    required super.date,
  });

  factory JournalModel.fromJson(Map<String, dynamic> json, String id) {
    return JournalModel(
      id: id,
      title: json['title'],
      content: json['content'],
      date: (json['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'date': Timestamp.fromDate(date),
    };
  }
}
