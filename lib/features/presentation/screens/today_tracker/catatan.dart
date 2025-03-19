import 'package:flutter/material.dart';

class Catatan extends StatefulWidget {
  const Catatan({super.key});

  @override
  State<Catatan> createState() => _CatatanState();
}

class _CatatanState extends State<Catatan> {
  int selectedLevel = 5; // Default selected level
  final TextEditingController _messageController = TextEditingController();
  int _characterCount = 0;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_updateCharacterCount);
  }

  void _updateCharacterCount() {
    setState(() {
      _characterCount = _messageController.text.length;
    });
  }

  @override
  void dispose() {
    _messageController.removeListener(_updateCharacterCount);
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const Text(
                    'Catatan',
                    style: TextStyle(
                      color: Color(0xFF193A63),
                      fontFamily: "Nunito",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        // Konten utama
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Pertanyaan
                            const Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                'Bagaimana kamu melihat hari ini',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF193A63),
                                  fontFamily: "Nunito",
                                  height: 1.3,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  'lib/assets/images/catatan/anxiety_catatan.png',
                                  width: 236, // Sesuaikan ukuran jika perlu
                                  height: 280,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                            Stack(
                              children: [
                                Container(
                                  height: 168,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.5),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: TextField(
                                    controller: _messageController,
                                    decoration: InputDecoration(
                                      hintText: 'Ketik pesan disini',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 16),
                                      border: InputBorder.none,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    maxLines: 5,
                                    maxLength: 100,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                  ),
                                ),
                                Positioned(
                                  right: 16,
                                  bottom: 8,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.book,
                                        size: 16,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "$_characterCount/100",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 80),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Tombol Selanjutnya
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/main');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF355A89),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Set Mood',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFF4D160),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
