import 'package:flutter/cupertino.dart';
import 'main.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Reddit', style: TextStyle(color: CupertinoColors.systemOrange, fontSize: 20, fontWeight: FontWeight.bold),),
        trailing: CupertinoButton(child: Icon(CupertinoIcons.settings, color: CupertinoColors.systemOrange,), onPressed: (){
          showCupertinoDialog(context: context, builder: (context){
            return CupertinoAlertDialog(
              title: Text('Logout'),
              content: Text('Are you sure?'),
              actions: [
                CupertinoButton(child: Text("Yes"), onPressed: (){
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=> MyApp()));
                }),
                CupertinoButton(child: Text("No", style: TextStyle(color: CupertinoColors.destructiveRed),), onPressed: (){
                  Navigator.pop(context);
                })
              ],
            );
          });
        }),
      ),
       child: Center(
        child: Text(
          'HELLO SIR. GOODMORNING  :)',
          style: TextStyle(color: CupertinoColors.white, fontSize: 20),
        ),
      ),
    );
  }
}