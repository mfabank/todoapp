import 'package:flutter/material.dart';
import 'package:todoapp/models/gorevler.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String yazi;
  String sure;
  List <Gorevler> gorevler = [Gorevler("", "")];
  List gorevListem = [];
  List sureListem = [];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Yapılacaklar Listesi"),
        centerTitle: true,
        elevation: 15,
        shadowColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:20),
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 1000,
                        child: TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                            icon: Icon(Icons.remove,color: Colors.deepPurpleAccent,),
                            hintText: "Görev başlığı",
                          ),
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String value) {
                            yazi = value;
                          },
                          maxLength: 50,
                          cursorColor: Colors.deepPurpleAccent,
                        ),
                      ),
                      Container(
                        width: 1000,
                        child: TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                            icon: Icon(Icons.remove,color: Colors.deepPurpleAccent,),
                            hintText: "Görev detayı",
                          ),
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String value) {
                            sure=value;
                          },
                          maxLength: 50,
                          cursorColor: Colors.deepPurpleAccent,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],

                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top:25),
                  child: FlatButton(
                    child: Icon(Icons.post_add,size: 50,color: Colors.deepPurpleAccent,),
                    onPressed: () {
                      setState(() {
                        gorevListem.add(yazi);
                        sureListem.add(sure);
                      });
                    }
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: gorevListem.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.calendar_today),
                    title: Text(gorevListem[index]),
                    subtitle: Text(sureListem[index]),
                  dense: true,
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
