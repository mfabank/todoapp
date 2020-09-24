import 'package:flutter/material.dart';

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
  List gorevListesi = [];
  List sureListesi = [];
  String yazi;
  String sure;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Yapılacaklar Listesi"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        width: 1000,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String value) {
                            yazi=value;
                          },
                          maxLength: 50,
                          cursorColor: Colors.deepPurpleAccent,
                        ),
                      ),
                      Container(
                        width: 1000,
                        child: TextFormField(
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
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top:25),
                  child: FlatButton(
                    child: Icon(Icons.arrow_forward,size: 50,),
                    onPressed: () {
                      setState(() {
                        gorevListesi.add(yazi);
                        sureListesi.add(sure);
                        print(gorevListesi);
                        print(sureListesi);
                      });
                    }
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: gorevListesi.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(gorevListesi[index]),
                  subtitle: Text(sureListesi[index].toString()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
