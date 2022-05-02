import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noor_al_quran/alsora.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  // List soralist = [];


  // getData() async{
  //   var responsebody = await sora.get();
  //   responsebody.docs.forEach((element) {
  //     setState(() {
  //       soralist.add(element.data());
  //     });
  //   });
  // }

  // getData() async{
  //   DocumentReference nameofsora = FirebaseFirestore.instance.collection("alsora").doc("سورة الحمد ");
  //    await nameofsora.get().then((value){
  //      print(value.data());
  //      print("==============================");
  //    });
  // }
  
     // addData() async{
     //   CollectionReference sora = FirebaseFirestore.instance.collection("alsora");
     //   sora.doc("سورة الفلق").set({
     //     "السورة" : "قل اعوذ برب الفلق من شر ما خلق"
     //   });
     // }

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }


  final CollectionReference sora = FirebaseFirestore.instance.collection("alsora");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body:FutureBuilder(
          future: sora.get(),
          builder: (context , snapshot){
            String soraname;
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.docs.length ,
                  itemBuilder: (context , i){
                    soraname =snapshot.data.docs[i].data()['name'];
                    String ayaofsora =snapshot.data.docs[i].data()['السورة'];
                    String quesionsandanswer = snapshot.data.docs[i].data()['qu&answer'];
                      return
                        // Text("${snapshot.data.docs[i].data()['name']}");
                        Card(
                          child: ListTile(
                            title: Text("${soraname}"),
                            onTap:() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Alsora(aya: ayaofsora,questionsanswer: quesionsandanswer,)));
                            }
                          ),
                        );

                  });
            }
            if (snapshot.hasError){
              return Text("Error..");
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Text("Loading...");
            }

          },
        )




    //     soralist.isEmpty || soralist == null ? Text("Loading....") : ListView.builder(
    //         itemCount: soralist.length,
    //         itemBuilder: (context , i){
    //         return ListTile(
    //           title: Text("${soralist[i]['name']}"),
    //           subtitle: Text("${soralist[i]['السورة']}"),
    //         );
    // }
    //     )
        );
  }
}

