import 'package:flutter/material.dart';

class PaginationButtons extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool isPreviousEnabled;
  final bool isNextEnabled;

  const PaginationButtons({
    Key? key,
    required this.onPrevious,
    required this.onNext,
    this.isPreviousEnabled = true,
    this.isNextEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous Button
          ElevatedButton.icon(
            onPressed: isPreviousEnabled ? onPrevious : null,
            icon: const Icon(Icons.arrow_back),
            label: const Text("Previous"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.pink[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),

          // Next Button
          ElevatedButton.icon(
            onPressed: isNextEnabled ? onNext : null,
            icon: const Text("Next"),
            label: const Icon(Icons.arrow_forward),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.pink[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}


class ViewMoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEnabled;

  const ViewMoreButton({
    Key? key,
    required this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.pink[100],
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        shadowColor: Colors.pinkAccent.withOpacity(0.5),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      child: const Text("View More"),
    );
  }
}
