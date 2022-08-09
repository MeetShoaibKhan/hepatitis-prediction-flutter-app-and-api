import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'database.dart';
import 'main.dart';
import 'splash%20screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
      home: const SplashScreen()
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Text(
              'Fill Form',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                labelStyle: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                hintText: 'Enter your name',
                // prefixIcon: Icon(
                //   Icons.person,
                //   color: Colors.black,
                // ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter your Password',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Colors.blue,
                onPressed: () async {
                   Fluttertoast.showToast(msg: 'Sucessfully  ', toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.red,textColor: Colors.white,gravity: ToastGravity.CENTER);

                  DataBaseClass.addData(

                      nameController.text, passwordController.text);
                  Navigator.push( context,MaterialPageRoute(builder: (context)=>const HomePage() ),);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: const Text(
                  'Button',
                  style: TextStyle(fontSize: 15),

                ),
              ),
            ),
          ])
        // Thisrailing comma makes auto-formatting nicer for build methods.
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
