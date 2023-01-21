import 'package:flutter/material.dart';
import 'package:web_request/api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final numberController = TextEditingController();

  String resultText = 'Type Number and Press to get Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Methods'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the number',
                ),
                controller: numberController,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                child: const Text('Get Results'),
                onPressed: () async {
                  final number = numberController.text;
                  final result = await getNumberFact(number: number);
                  print(result.text);
                  setState(() {
                    resultText = result.text ?? 'No text found';
                  });
                },
              ),
              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}
