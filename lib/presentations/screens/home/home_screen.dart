import 'package:dictionary/business_logic/bloc/cubit/dictionary_cubit.dart';
import 'package:dictionary/presentations/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit=context.watch<DictionaryCubit>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Dictionary app',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 2, 65, 116),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: Text('Search any words you want quickly'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16,0),
              child: TextField(
                controller: cubit.queryController,
                decoration: InputDecoration(
                  suffixIcon:
                      IconButton(onPressed: () {
                        cubit.getWordsSearched();
                      }, icon: const Icon(Icons.search)),
                  fillColor: const Color.fromARGB(255, 230, 229, 229),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
             BlocBuilder<DictionaryCubit, DictionaryState>(
                  builder: (context, state) {
                    if (state is NoWordSearch) {
                      return Container();
                    } else if (state is WordSearching) {
                      return getLoadingWidget();
                    } else if(state is ErrorState){
                      return getErrorWidget("There is some issue");
                    }else if (state is WordSearched){
                      return WordDetail(state.words);
                    }else {return Container();}
                    }),
          ],
        ));

  }
}
