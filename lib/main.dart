import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

void main() {
  runApp(const MainApp());
}

Future<List<dynamic>> getQuote() async {
  final Uri uri = Uri.https("api.api-ninjas.com", "/v1/quotes");
  final headers = {"X-Api-Key": "tn/NzdwIhYvvODdidg44/Q==WaiKKWqcBteD6lRP"};
//! Hier habe ich gelernt das ich den Header auch übergeben muss bei der Get abfrage
  final http.Response response = await http.get(uri, headers: headers);
  if (response.statusCode == 200) {
    final String data = response.body;

    final List<dynamic> decodedJson = jsonDecode(data);

    return decodedJson;
  } else {
    throw Exception("Fehler : Die Serverantwort war nicht 200");
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  void getRandomQuote() async {
    final List<dynamic> zitat = await getQuote();
    final String randomZitat = zitat[0]["quote"];
    String quote = "";
    int index = 0;
    setState(() {
      quote = randomZitat;
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: getQuote(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return (const CircularProgressIndicator());

                    if (snapshot.hasError) {
                      return Text(" Fehler : ${snapshot.error}");
                    }
                    if (snapshot.hasData) {
                      final String randomZitat = snapshot.data![0]["quote"];
                      return Text(
                        randomZitat,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      );
                    }
                    return const Text(" ist null");
                  }),
              TextButton(
                  onPressed: () {
                    getRandomQuote();
                  },
                  child: const Text("Text im Button")),
            ],
          ),
        ),
      ),
    );
  }
}
