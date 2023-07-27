import 'package:dictionary/data/model/word_response.dart';
import 'package:dictionary/presentations/screens/detail/detail.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
   final List<WordResponse> words;
  const ListScreen({super.key, required this.words});

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

        body:ListView.separated(
          itemBuilder: (context,index)=>ListTile(
            title: Text("${index+1}.${words[index].word}"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(wordResponse: words[index],)));
            },
          ), 
          separatorBuilder: (context,index)=>Divider(
            color: Colors.grey,
          ), 
          itemCount: words.length)
    );
  }
}