import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/features/presentation/jurnal_screen/jurnal_manager.dart';

class Jurnalvoice extends StatefulWidget {
  const Jurnalvoice({super.key});

  @override
  State<Jurnalvoice> createState() => _JurnalvoiceState();
}

class _JurnalvoiceState extends State<Jurnalvoice> {
  bool _isRecording = false;
  List<double> _waveformData = List.filled(20, 0.2); // Static waveform data

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;

      // If recording is stopped, reset waveform
      if (!_isRecording) {
        _waveformData = List.filled(20, 0.2);
      } else {
        // Start waveform animation when recording starts
        _animateWaveform();
      }
    });
  }

  void _animateWaveform() {
    if (!_isRecording) return;

    setState(() {
      for (int i = 0; i < _waveformData.length; i++) {
        _waveformData[i] =
            0.2 + (0.8 * (DateTime.now().millisecondsSinceEpoch % 100) / 100);
      }
    });

    Future.delayed(const Duration(milliseconds: 100), _animateWaveform);
  }

  void _cancelRecording() {
    setState(() {
      _isRecording = false;
      _waveformData = List.filled(20, 0.2); // Reset waveform
    });

    // Simply pop the screen without saving
    Navigator.pop(context);
  }

  void _saveRecording() {
    // Update the journal saved state when save button is pressed
    final journalProvider =
        Provider.of<JournalSaveProvider>(context, listen: false);
    journalProvider.saveJournal();

    // Navigate back to the main screen which will show JurnalManager
    Navigator.pushNamed(context, '/main');
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
                children: [
                  const SizedBox(height: 100), // Space for back button
                  const Text(
                    "Biarkan kami Mendengarkanmu",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nutino",
                      color: Color(0xFF193A63),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Rekaman 1",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nutino",
                      color: Color(0xFF193A63),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Time indicator when recording
                  if (_isRecording)
                    const Text(
                      '00:00',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Nutino",
                        color: Colors.grey,
                      ),
                    ),
                  const Spacer(),

                  // Waveform visualization
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        _waveformData.length,
                        (index) => Container(
                          width: 10,
                          height: 60 * _waveformData[index],
                          decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Microphone button
                  GestureDetector(
                    onTap: _toggleRecording,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1A3E6E),
                      ),
                      child: Icon(
                        _isRecording ? Icons.stop : Icons.mic,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Bottom action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Cancel button
                      GestureDetector(
                        onTap: _cancelRecording,
                        child: Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _isRecording
                                ? const Color(0xFFEA4335)
                                : Colors.grey,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Confirm/save button
                      GestureDetector(
                        onTap: _saveRecording,
                        child: Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _isRecording
                                ? const Color(0xFF9BB167)
                                : Colors.grey,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),

              // Back button
              Positioned(
                top: 20,
                left: 20,
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
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
