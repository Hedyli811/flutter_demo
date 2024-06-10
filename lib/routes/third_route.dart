import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:flutter/widgets.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  //create a list to store json
  List _pets = [];

  // create a method to read from local json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/pets.json');
    final data = json.decode(response);
    setState(() {
      _pets = data['pets'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton(
                  child: const Text('read local json'),
                  onPressed: () => readJson(),
                ),
              ),
              _pets.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: _pets.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                    '${_pets[index]['id']} : ${_pets[index]['type']} has ${_pets[index]['legs']}'),
                                subtitle: Text('"${_pets[index]['comment']}"'),
                              ),
                            );
                          }),
                    )
                  : const Text('press the button to see pets')
            ]),
      ),
    );
  }
}
