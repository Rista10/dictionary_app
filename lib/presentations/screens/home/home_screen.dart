import 'package:dictionary/business_logic/bloc/cubit/dictionary_cubit.dart';
import 'package:dictionary/presentations/screens/list/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    getLoadingWidget() {
      return Center(child: CircularProgressIndicator());
    }

    getErrorWidget(String message) {
      return Center(child: Text(message));
    }

    getNoWordSearchWidget() {
      return Column(
        children: [
          Center(
              child:
                  Image.asset('assets/home_img.jpg', width: 300, height: 300)),
          Text('Search any words you want quickly'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: cubit.queryController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                fillColor: Color.fromARGB(255, 230, 229, 229),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 200,
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.blue)),
                onPressed: () {
                  cubit.getWordsSearched();
                },
                child: Text('Search', style: TextStyle(color: Colors.white))),
          )
        ],
      );
    }

    print("Current state: ${cubit.state}");
    return BlocListener<DictionaryCubit, DictionaryState>(
      listener: (context, state) {
        if(state is WordSearched){Navigator.push(context, MaterialPageRoute(builder: ((context) => ListScreen(words: state.words))));}
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Dictionary app',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: cubit.state is WordSearching
              ? getLoadingWidget()
              : cubit.state is ErrorState
                  ? getErrorWidget("There is some error")
                  : cubit.state is NoWordSearch
                      ? getNoWordSearchWidget()
                      : Container()),
    );
  }
}
