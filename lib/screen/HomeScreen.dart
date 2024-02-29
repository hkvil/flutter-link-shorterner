import 'package:flutter/material.dart';
import 'package:learn_provider_1/component/CopyableTextField.dart';
import 'package:learn_provider_1/component/ShortenButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tfController = TextEditingController();

  @override
  void dispose() {
    tfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CopyableTextField(
            tfController: tfController,
          ),
          ShortenButton(tfController: tfController),
        ],
      ),
    );
  }
}
