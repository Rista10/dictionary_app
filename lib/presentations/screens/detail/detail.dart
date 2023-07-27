import 'package:dictionary/data/model/word_response.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final WordResponse wordResponse;
  
  const DetailScreen( {super.key, required this.wordResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Dictionary app',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),

    body: Container(
      padding: const EdgeInsets.all(32.0),
      width:double.infinity,
      child: Column(children: [
        Text(
          "${wordResponse.word}"
        ),
        SizedBox(height: 16,),
        
      ]),
    ),
    );
  }
}