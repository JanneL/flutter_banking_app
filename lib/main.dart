
import 'src/themes.dart';
import 'src/accounts.dart';
import 'package:flutter/material.dart';
import 'account_detail_view.dart';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;


void main() => runApp(Pivo3());

class Pivo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tilit',
      theme: defaultTheme,
      home: MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
     
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.blue, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Tilit",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: 
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).backgroundColor),
          child:
        FutureBuilder<AccountsList>(                  
            future: fetchAccounts(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
                print('SNAPSHOT DATA: ');
                print(snapshot.data);
              return snapshot.hasData
                  ? FundsListing(accounts: snapshot.data.accounts)
                  : Center(child: CircularProgressIndicator());
              },
            ),
      ),
       bottomNavigationBar: BottomNavigationBar(
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.account_balance),
           title: new Text('Tilit'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.sentiment_satisfied),
           title: new Text('Sijoitukset'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         )
       ],
     ),
      ),
    );
  }


}

class FundsListing extends StatelessWidget {
  final List<Account> accounts;
  

  FundsListing({Key key, this.accounts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
   
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
      return  new Card(
          color: Theme.of(context).primaryColor,
          child: new Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          new ListTile(
            trailing: const Icon(Icons.arrow_right, color: Colors.white),
            title: Text(accounts[index].name, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white)),
            subtitle: Text(accounts[index].balance.toString(), style: TextStyle(fontSize: 40, color: Colors.white)),
            
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountScreen(account: accounts[index]),
                ),
              );
            },
          ),
        ],
          ),
);
      },
    );
    
  }
}
