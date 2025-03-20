import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/mood_model.dart';

class MoodRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveMood(String userId, MoodModel mood) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('moods')
          .add(mood.toJson());
    } catch (e) {
      throw Exception("Gagal menyimpan mood: $e");
    }
  }

  Future<List<MoodModel>> getMoodHistory(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('moods')
          .orderBy('date', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => MoodModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Gagal mengambil data mood: $e");
    }
  }
}
