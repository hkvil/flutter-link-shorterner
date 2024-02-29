import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyableTextField extends StatelessWidget {
  final TextEditingController tfController;
  const CopyableTextField({super.key, required this.tfController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Enter Link to Shorten Here...',
        suffixIcon: IconButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: tfController.text));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Copied to Clipboard"),
              ),
            );
          },
          icon: const Icon(Icons.copy),
        ),
      ),
      controller: tfController,
    );
  }
}
