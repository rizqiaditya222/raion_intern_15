import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/features/presentation/jurnal_screen/jurnal_screen.dart';
import 'package:raion_intern_15/features/presentation/jurnal_screen/jurnalblank.dart';

// Provider to manage journal state
class JournalSaveProvider extends ChangeNotifier {
  bool _journalSaved = false;

  bool get journalSaved => _journalSaved;

  void saveJournal() {
    _journalSaved = true;
    notifyListeners();
  }

  void resetJournalState() {
    _journalSaved = false;
    notifyListeners();
  }
}

// Journal Manager widget that decides which screen to show
class JurnalManager extends StatelessWidget {
  const JurnalManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final journalProvider = Provider.of<JournalSaveProvider>(context);

    // If journal was saved, show the journal screen with entries
    // Otherwise show the blank journal screen
    return journalProvider.journalSaved
        ? const JurnalScreen()
        : const Jurnalblank();
  }
}
