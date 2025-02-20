import 'package:flutter/cupertino.dart';
import 'homepage.dart';
void main (){
  runApp(CupertinoApp(
    theme: CupertinoThemeData(
      brightness: Brightness.dark
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool hidePassword = true;
  String error = "";
  bool isLogin(String username, String password){
    if (username == "admin" && password == "123"){
      setState(() {
        _username.text = "";
        _password.text = "";
        error = "";        
      });
      return true;
    }else{
      return false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(child: Column(
        children: [
          SizedBox(height: 200,),
          Row(
            children: [
              Text('Reddit', style: TextStyle(color: CupertinoColors.systemOrange, fontWeight: FontWeight.bold, fontSize: 25),),
            ],
          ),
          SizedBox(height: 20,),
          CupertinoTextField(
            controller: _username,
            placeholder: "Username",
            padding: EdgeInsets.all(13),


          ),
            SizedBox(height: 5,),
            CupertinoTextField(
            controller: _password,
            placeholder: "Password",
            padding: EdgeInsets.all(10),
            obscureText: hidePassword,
            suffix: CupertinoButton(child: Icon(hidePassword? CupertinoIcons.eye_slash : CupertinoIcons.eye, size: 20, color: CupertinoColors.systemOrange,), onPressed: (){
              setState(() {
                hidePassword = !hidePassword;                 
            });


            }),

          ),
          SizedBox(height: 20,),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(

              color: CupertinoColors.systemOrange
            ),
            child: CupertinoButton(child: Text('Login', style: TextStyle(color: CupertinoColors.white),), onPressed: (){
              isLogin(_username.text, _password.text) ?
              
                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> Homepage()))

               : setState (() {
                _password.text = "";
                _username.text = "";
                error = "Incorrect Username or Password";
              });
            }),
          ),
          SizedBox(height: 10,),
          Text("$error", style: TextStyle(color: CupertinoColors.destructiveRed),)
        ],
      )),
    ));
  }
}
