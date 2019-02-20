import 'package:flutter/material.dart';
import 'src/accounts.dart';


class AccountScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final Account account;
  
  // In the constructor, require a Todo
  AccountScreen({Key key, @required this.account}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text(account.name, style: TextStyle(color: Colors.white)),
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              topArea(),
            ],
          ),
        ),
    );
  }


Card topArea() => Card(
        margin: EdgeInsets.all(10.0),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Container(
            decoration: BoxDecoration(   
            color:Color.fromRGBO(33,206,153, 1),
            ),
            child: Column(
              children: <Widget>[
                Center(
                  child: 
                    Text("Saldo",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(account.balance.toString() + r"€ ", style: TextStyle(color: Colors.white, fontSize: 40.0)), 
                  ),
                ),
               
              ],
            )),
      );




}