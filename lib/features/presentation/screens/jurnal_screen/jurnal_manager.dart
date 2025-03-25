import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/features/presentation/screens/jurnal_screen/jurnal_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/jurnal_screen/jurnalblank.dart';

import '../../provider/auth_provider.dart';
import '../../provider/jurnal_provider.dart';

class JurnalManager extends StatelessWidget {
  const JurnalManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = authProvider.currentUser;
    final journalProvider = Provider.of<JournalProvider>(context);

    if (user == null) {
      return const Jurnalblank();
    }

    return FutureBuilder(
      future: journalProvider.fetchJournalHistory(user.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return journalProvider.journalHistory.isNotEmpty
            ? const JurnalScreen()
            : const Jurnalblank();
      },
    );
  }
}
