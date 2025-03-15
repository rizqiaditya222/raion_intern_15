import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class TestManager {
  // Show the test selection dialog
  static void showTestSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Pilih test yang kamu butuhkan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nunito",
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Test option 1: Positive Mental Health
                _buildTestOption(
                  context,
                  icon: Icons.sentiment_satisfied_alt_rounded,
                  label: 'Test kesehatan mental positif',
                  route: '/testpostif',
                  color: Color(0xFF193A63),
                ),
                const SizedBox(height: 12),
                // Test option 2: Negative Mental Health
                _buildTestOption(
                  context,
                  icon: Icons.sentiment_dissatisfied_rounded,
                  label: 'Test kesehatan mental negatif',
                  route: '/testnegatif',
                  color: Color(0xFF193A63),
                ),
                const SizedBox(height: 12),
                // Test option 3: Lifestyle Health
                _buildTestOption(
                  context,
                  icon: Icons.self_improvement_rounded,
                  label: 'Test kesehatan gaya hidup',
                  route: '/testhidup',
                  color: Color(0xFF193A63),
                ),
                const SizedBox(height: 16),
                // Close button
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Tutup',
                    style: TextStyle(
                      color: primary[90],
                      fontSize: 16,
                      fontFamily: "Nunito",
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build a test option button
  static Widget _buildTestOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        // Close the dialog first, then navigate to the selected test
        Navigator.of(context).pop(); // Close the dialog
        Navigator.pushNamed(context, route); // Navigate to the test route
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: color.withOpacity(0.5), width: 1),
        ),
        child: Row(
          children: [
            // Icon on the left
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            // Test label
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Arrow icon
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: color,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
