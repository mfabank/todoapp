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
  String yazi;
  String sure;
  List gorevListem = [];
  List sureListem = [];
  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

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
            margin: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Flexible(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          width: 4000,
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return "Lütfen bu alanı boş bırakmayınız";
                              }
                            },
                            onSaved: (input) => yazi = input,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              labelText: "Başlık",
                              labelStyle:
                                  TextStyle(color: Colors.deepPurpleAccent),
                              isDense: true,
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.deepPurpleAccent,
                              ),
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
                          width: 4000,
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return "Lütfen bu alanı boş bırakmayınız";
                              }
                            },
                            onSaved: (input) => sure = input,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              labelText: "Detay",
                              labelStyle:
                                  TextStyle(color: Colors.deepPurpleAccent),
                              isDense: true,
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.deepPurpleAccent,
                              ),
                              hintText: "Görev detayı",
                            ),
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String value) {
                              sure = value;
                            },
                            maxLength: 50,
                            cursorColor: Colors.deepPurpleAccent,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25),
                  child: FlatButton(
                      child: Icon(
                        Icons.post_add,
                        size: 50,
                        color: Colors.deepPurpleAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          girisYap();
                        });
                      }),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: gorevListem.length,
              itemBuilder: (context, index) {
                final silinecekMetin = gorevListem[index];
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  resizeDuration: Duration(seconds: 1),
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.deepPurpleAccent,
                    child: Icon(Icons.edit),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Icon(Icons.delete),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      gorevListem.removeAt(index);
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("$silinecekMetin silindi")));
                    } else if (direction == DismissDirection.startToEnd) {}
                  },
                  child: ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(gorevListem[index]),
                    subtitle: Text(sureListem[index]),
                    dense: true,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  girisYap() {
    final form = _formkey.currentState;

    if (form.validate()) {
      gorevListem.add(yazi);
      sureListem.add(sure);
      form.save();
    }
  }
}
