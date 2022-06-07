import 'package:flutter/material.dart';

class YourInfoScreen extends StatelessWidget {
  const YourInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Your Info",
        ),
      ),
      body: const Center(
        child: Text('Your Info Page'),
      ),
    );
  }
}
