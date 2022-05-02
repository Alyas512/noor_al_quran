

import 'package:flutter/material.dart';
import 'package:noor_al_quran/questions.dart';
import 'package:noor_al_quran/test.dart';

class Alsora extends StatelessWidget {
  final String aya;
  final String questionsanswer;
  const Alsora({Key key, this.aya,this.questionsanswer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noor Al Quran"),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
       children: [
            Text(aya) ,
           TextButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => Questions(questionssrting: questionsanswer,)));
           },
               child: Text("Quastions")
           )
    ],

      ),
        ),
      )
    );
  }
}
