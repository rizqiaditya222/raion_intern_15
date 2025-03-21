import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/jurnal_model.dart';

class JournalRepository {
  final FirebaseFirestore _firestore;

  JournalRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> saveJournal(String userId, JournalModel journal) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('journals')
          .doc(journal.id)
          .set(journal.toJson());
    } catch (e) {
      throw Exception("Gagal menyimpan jurnal: $e");
    }
  }

  Future<void> updateJournal(String userId, JournalModel journal) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('journals')
          .doc(journal.id)
          .update(journal.toJson());
    } catch (e) {
      throw Exception("Gagal memperbarui jurnal: $e");
    }
  }

  Future<List<JournalModel>> getJournalHistory(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('journals')
          .orderBy('date', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => JournalModel.fromJson(
        doc.data() as Map<String, dynamic>,
        doc.id,
      ))
          .toList();
    } catch (e) {
      throw Exception("Gagal mengambil data jurnal: $e");
    }
  }
}
