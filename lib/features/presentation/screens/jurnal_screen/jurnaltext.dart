import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../../../data/models/jurnal_model.dart';
import '../../provider/jurnal_provider.dart';

class Jurnaltext extends StatefulWidget {
  final JournalModel? journal;

  const Jurnaltext({super.key, this.journal});

  @override
  State<Jurnaltext> createState() => _JurnaltextState();
}

class _JurnaltextState extends State<Jurnaltext> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.journal?.title ?? "");
    _contentController = TextEditingController(text: widget.journal?.content ?? "");
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 50),
                        Text(
                          widget.journal == null ? "Jurnal Baru" : "Edit Jurnal",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: _saveJournal,
                          child: const Text("Simpan", style: TextStyle(fontSize: 16, color: Colors.grey)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _titleController,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: "Tambahkan Judul",
                      border: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: TextField(
                      controller: _contentController,
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        hintText: "Tulis jurnalmu di sini...",
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _saveJournal() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final journalProvider = Provider.of<JournalProvider>(context, listen: false);

    final user = authProvider.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Gagal menyimpan jurnal. Pengguna tidak ditemukan.")),
      );
      return;
    }

    final newJournal = JournalModel(
      id: widget.journal?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text,
      content: _contentController.text,
      date: DateTime.now(),
    );

    if (widget.journal == null) {
      // Jika jurnal baru, tambahkan ke daftar jurnal
      journalProvider.simpanJournal(user.id, newJournal);
    } else {
      // Jika jurnal sudah ada, update jurnal yang ada
      journalProvider.updateJournal(user.id, newJournal);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Jurnal berhasil disimpan!")),
    );

    Navigator.pop(context);
  }
}

