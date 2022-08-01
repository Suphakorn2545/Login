import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: '6350110018'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final myController_user = TextEditingController();
  final myController_pwd = TextEditingController();

  @override
  void dispose(){
    //clean up the controller when the widget is disposed.
    myController_user.dispose();
    myController_pwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.redAccent[100],
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.white70,
                  child: Icon(
                    Icons.insert_photo_outlined,
                    size: 180,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        "Row child 1",
                      style:TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    Text(
                        "Row child 2",
                        style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Text(
                        "Row child 3",
                        style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  "This is column",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: myController_user,
                  decoration: InputDecoration(
                    hintText: "Username",
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 30),
                child: TextField(
                  controller: myController_pwd,
                  decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      onPrimary: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      myController_user.clear();
                      myController_pwd.clear();
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      onPrimary: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => displayToast(),
                    child: Text("Login"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }//end build

void displayToast(){
    String username = myController_user.text;
    String password = myController_pwd.text;

    Fluttertoast.showToast(
        msg: 'Your username : $username \nYour password : $password',
        toastLength: Toast.LENGTH_SHORT,
    );
}
}//end class
