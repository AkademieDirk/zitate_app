import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  textAlign: TextAlign.center,
                  "HI do not think white America is committed to granting equality to the American Negro. This is a passionately racist country it will continue to be so in the foreseeable future."),
              TextButton(onPressed: () {}, child: const Text("Text im Button")),
            ],
          ),
        ),
      ),
    );
  }
}
