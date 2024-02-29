import 'package:flutter/material.dart';
import 'package:learn_provider_1/component/CopyIconButton.dart';

class CopyableTextField extends StatelessWidget {
  final TextEditingController tfController;
  const CopyableTextField({super.key, required this.tfController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Enter Link to Shorten Here...',
        suffixIcon: CopyIconButton(
          text: tfController.text,
        ),
      ),
      controller: tfController,
    );
  }
}
