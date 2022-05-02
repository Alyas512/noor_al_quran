import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String questionssrting ;
  const Questions({Key key, this.questionssrting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> result ;
    result = questionssrting.split('س/');
    return Scaffold(
      appBar: AppBar(
        title: Text("Questions"),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: ListView.builder(
            itemCount: result.length,
            itemBuilder: (context , i){
              return  
                ListTile(title: Text(result[i]));
            })
      ),
    );
  }
}
