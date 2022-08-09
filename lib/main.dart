import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'splash%20screen.dart';

// main() {
//  runApp(const MyApp());
// }

enum SingingCharacter { lafayette, jefferson }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get controller => null;
  var r = "";
  var map = <String, dynamic>{};
  String gender = "2";
  String steroid = '1';
  String antivirals = '1';
  String fatigue = '1';
  String malaise = '1';
  String anorexia = '1';
  String liver_big = '1';
  String liver_firm = '1';
  String spleen_palable = '1';
  String spiders = '1';
  String ascites = '1';
  String varices = '1';
  predict() async {
    // map['age'] = '25';
    map['sex'] = gender;
    map['steroid'] = steroid;
    map['antivirals'] = antivirals;
    map['fatigue'] = fatigue;
    map['malaise'] = malaise;
    map['anorexia'] = anorexia;
    map['liver_big'] = liver_big;
    map['liver_firm'] = liver_firm;
    map['spleen_palable'] = spleen_palable;
    map['spiders'] = spiders;
    map['ascites'] = ascites;
    map['varices'] = varices;

    map['bilirubin'] = '5';
    map['alk_phosphate'] = '34';
    map['sgot'] = '34';
    map['albumin'] = '4';
    // map['protime'] = '55';

    final response = await http.post(
      Uri.parse('https://dde2-182-180-56-42.in.ngrok.io/result'),
      body: map,
    );

    print(response.body);
    setState(() {
      r = jsonDecode(response.body)["result"];
    });

    print(map);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Your hepetitis prediction s here',
                ),
                Text(
                  r,
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextFormField(
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    map['age'] = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'age',
                    hintText: 'Enter Age',
                  ),
                ),

                //Gender
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Gender',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                  map['sex'] = gender;
                                });
                              }),
                          const Expanded(
                            child: Text('Male'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                  map['sex'] = gender;
                                });
                              }),
                          const Expanded(
                            child: Text('Female'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //steroid
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'steroid',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: steroid,
                              onChanged: (value) {
                                setState(() {
                                  steroid = value.toString();
                                  map['steroid'] = steroid;
                                });
                              }),
                          Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: steroid,
                              onChanged: (value) {
                                setState(() {
                                  steroid = value.toString();
                                  map['steroid'] = steroid;
                                });
                              }),
                          const Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //antivirals
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'antivirals',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: antivirals,
                              onChanged: (value) {
                                setState(() {
                                  antivirals = value.toString();
                                  map['antivirals'] = antivirals;
                                });
                              }),
                          const Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: antivirals,
                              onChanged: (value) {
                                setState(() {
                                  antivirals = value.toString();
                                  map['antivirals'] = antivirals;
                                });
                              }),
                          const Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //fatigue
                Container(
                  // margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'fatigue',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: fatigue,
                              onChanged: (value) {
                                setState(() {
                                  fatigue = value.toString();
                                  map['fatigue'] = fatigue;
                                });
                              }),
                          const Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: fatigue,
                              onChanged: (value) {
                                setState(() {
                                  fatigue = value.toString();
                                  map['fatigue'] = fatigue;
                                });
                              }),
                          const Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // malaise
                Container(
                  // margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'malaise',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: malaise,
                              onChanged: (value) {
                                setState(() {
                                  malaise = value.toString();
                                  map['malaise'] = malaise;
                                });
                              }),
                          const Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: malaise,
                              onChanged: (value) {
                                setState(() {
                                  malaise = value.toString();
                                  map['malaise'] = malaise;
                                });
                              }),
                          const Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // anorexia
                Container(
                  // margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'anorexia',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: anorexia,
                              onChanged: (value) {
                                setState(() {
                                  anorexia = value.toString();
                                  map['anorexia'] = anorexia;
                                });
                              }),
                          const Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: anorexia,
                              onChanged: (value) {
                                setState(() {
                                  anorexia = value.toString();
                                  map['anorexia'] = anorexia;
                                });
                              }),
                          const Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // liver_big
                Container(
                  // margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'liver_big',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: liver_big,
                              onChanged: (value) {
                                setState(() {
                                  liver_big = value.toString();
                                  map['liver_big'] = liver_big;
                                });
                              }),
                          Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: liver_big,
                              onChanged: (value) {
                                setState(() {
                                  liver_big = value.toString();
                                  map['liver_big'] = liver_big;
                                });
                              }),
                          Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // liver_firm
                Container(
                  // margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                      bottomLeft: const Radius.circular(20),
                      bottomRight: const Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'liver_firm',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: liver_firm,
                              onChanged: (value) {
                                setState(() {
                                  liver_firm = value.toString();
                                  map['liver_firm'] = liver_firm;
                                });
                              }),
                          Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: liver_firm,
                              onChanged: (value) {
                                setState(() {
                                  liver_firm = value.toString();
                                  map['liver_firm'] = liver_firm;
                                });
                              }),
                          const Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // spleen_palable
                Container(
                  // margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'spleen_palable',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: spleen_palable,
                              onChanged: (value) {
                                setState(() {
                                  spleen_palable = value.toString();
                                  map['spleen_palable'] = spleen_palable;
                                });
                              }),
                          Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: spleen_palable,
                              onChanged: (value) {
                                setState(() {
                                  spleen_palable = value.toString();
                                  map['spleen_palable'] = spleen_palable;
                                });
                              }),
                          Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // spiders
                Container(
                  // margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                      bottomLeft: const Radius.circular(20),
                      bottomRight: const Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'spiders',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: spiders,
                              onChanged: (value) {
                                setState(() {
                                  spiders = value.toString();
                                  map['spiders'] = spiders;
                                });
                              }),
                          Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: spiders,
                              onChanged: (value) {
                                setState(() {
                                  spiders = value.toString();
                                  map['spiders'] = spiders;
                                });
                              }),
                          Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ascites
                Container(
                  // margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                      bottomLeft: const Radius.circular(20),
                      bottomRight: const Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'ascites',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: ascites,
                              onChanged: (value) {
                                setState(() {
                                  ascites = value.toString();
                                  map['ascites'] = ascites;
                                });
                              }),
                          Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: ascites,
                              onChanged: (value) {
                                setState(() {
                                  ascites = value.toString();
                                  map['ascites'] = ascites;
                                });
                              }),
                          Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // varices
                Container(
                  // margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                      bottomLeft: const Radius.circular(20),
                      bottomRight: const Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'varices',
                      ),
                      Row(
                        children: [
                          Radio(
                              value: "1",
                              groupValue: varices,
                              onChanged: (value) {
                                setState(() {
                                  varices = value.toString();
                                  map['varices'] = varices;
                                });
                              }),
                          Expanded(
                            child: Text('1'),
                          ),
                          Radio(
                              value: "2",
                              groupValue: varices,
                              onChanged: (value) {
                                setState(() {
                                  varices = value.toString();
                                  map['varices'] = varices;
                                });
                              }),
                          Expanded(
                            child: Text('2'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    map['bilirubin'] = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bilirubin',
                    hintText: 'Enter bilirubin',
                  ),
                ),
                TextFormField(
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    map['alk_phosphate'] = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alk Phosphate',
                    hintText: 'Enter phosphate',
                  ),
                ),
                TextFormField(
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    map['sgot'] = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Sgot',
                    hintText: 'Enter Sgot',
                  ),
                ),
                TextFormField(
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    map['albumin'] = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Albumin',
                    hintText: 'Enter Albumin',
                  ),
                ),
                TextFormField(
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    map['protime'] = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'protime',
                    hintText: 'Enter protime',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            predict();
          }
        },
        tooltip: 'predict',
        child: const Icon(Icons.find_in_page_rounded),
      ),
    );
  }
}
