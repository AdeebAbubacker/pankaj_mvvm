import 'package:flutter/material.dart';

class RedSubmitButton extends StatelessWidget {
  const RedSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Red color
          padding: const EdgeInsets.symmetric(
              vertical: 16), // Adjust padding as needed
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8), // Adjust border radius as needed
          ),
        ),
        child: const Text(
          'SUBMIT',
          style: TextStyle(
            fontSize: 16, // Adjust font size as needed
            fontWeight: FontWeight.bold,
            color: Colors.white, // Text color
          ),
        ),
      ),
    );
  }
}
