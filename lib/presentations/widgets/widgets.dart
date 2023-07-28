
import 'package:dictionary/data/model/word_response.dart';
import 'package:flutter/material.dart';

getLoadingWidget() {
  return const Center(child: CircularProgressIndicator());
}

getErrorWidget(String message) {
  return Center(child: Text(message));
}

WordDetail(List<WordResponse> wordResponse) {
  WordResponse wordResult = wordResponse[0];
  int index = wordResult.meanings!.length;
  meaningcard(Meaning meaning) {
    return Card(
      color: const Color.fromARGB(255, 232, 231, 231),
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${meaning.partOfSpeech}",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      width: 80,
                      child: Text("Definition: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1))),
                  Expanded(
                      child: Text(
                          meaning.definitions![0].definition.toString()))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      width: 80,
                      child: Text("Example: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1))),
                  Expanded(
                      child:
                          Text(meaning.definitions![0].example.toString()))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Container(
          height: 115,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 2, 65, 116),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 8, 5),
              child: Text(
                "${wordResult.word}".toUpperCase(),
                style: const TextStyle(
                    fontSize: 25, color: Colors.white, letterSpacing: 2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                      text: "Phonetic : ",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w300)),
                  TextSpan(
                    text: '${wordResult.phonetic}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ]),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: index,
            itemBuilder: (context, index) {
              return meaningcard(wordResult.meanings![index]);
            })
      ],
    ),
  );
}
