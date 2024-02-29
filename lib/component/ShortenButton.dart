import 'package:flutter/material.dart';
import 'package:learn_provider_1/database/DatabaseService.dart';
import 'package:learn_provider_1/provider/LinkProvider.dart';
import 'package:provider/provider.dart';

class ShortenButton extends StatelessWidget {
  const ShortenButton({
    super.key,
    required this.tfController,
  });

  final TextEditingController tfController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        onPressed: () {
          Provider.of<LinkProvider>(context, listen: false)
              .shorten(tfController.text)
              .then((result) => {
                    Provider.of<DatabaseService>(context, listen: false)
                        .insert(result, tfController.text),
                    tfController.text = result
                  });
        },
        child: const Text("Shorten"),
      ),
    );
  }
}
