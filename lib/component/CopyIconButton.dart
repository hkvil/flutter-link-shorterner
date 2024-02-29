import 'package:flutter/material.dart';
import 'helper.dart';

class CopyIconButton extends StatelessWidget {
  const CopyIconButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        copyToClipboard(text, context);
      },
      icon: const Icon(Icons.copy),
    );
  }
}
