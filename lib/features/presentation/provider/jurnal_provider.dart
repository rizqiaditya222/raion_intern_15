import 'package:flutter/material.dart';
import '../../data/models/jurnal_model.dart';
import '../../data/repositories/jurnal_repository.dart';

class JournalProvider extends ChangeNotifier {
  final JournalRepository _journalRepository;
  List<JournalModel> _journalHistory = [];

  JournalProvider({required JournalRepository journalRepository})
      : _journalRepository = journalRepository;

  List<JournalModel> get journalHistory => _journalHistory;

  Future<void> simpanJournal(String userId, JournalModel journal) async {
    await _journalRepository.saveJournal(userId, journal);
    _journalHistory.insert(0, journal);
    notifyListeners();
  }

  Future<void> updateJournal(String userId, JournalModel journal) async {
    await _journalRepository.updateJournal(userId, journal);
    int index = _journalHistory.indexWhere((j) => j.id == journal.id);
    if (index != -1) {
      _journalHistory[index] = journal;
      notifyListeners();
    }
  }

  Future<void> fetchJournalHistory(String userId) async {
    _journalHistory = await _journalRepository.getJournalHistory(userId);
    notifyListeners();
  }
}
