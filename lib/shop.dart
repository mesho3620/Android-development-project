import 'package:flutter/material.dart';
import 'package:page2/bottom_bar.dart';
import 'package:page2/weapons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3,vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white60,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black),
          onPressed: (){},
        ),
        title: Text('Shop',style:TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black),),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications_none,color: Colors.black),
          onPressed: (){},
        ),
      ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left:19.0),
        children: <Widget>[
          SizedBox(height: 35.0,),
          Text('Category',style:TextStyle(
            fontWeight: FontWeight.bold,fontSize: 40.0,color: Colors.blueGrey
          )),
          SizedBox(height: 16.0),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Colors.cyan,
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            tabs: [
              Tab(
                child: Text('Weapons',
                style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent))
              ),

              Tab(
                  child: Text('Armor',
                    style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent))
              ),
              Tab(
                  child: Text('Pets',
                    style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent))
              ),

            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height- 30,
            width: double.infinity,
            child:TabBarView(
              controller: _tabController,
              children: [
                weapons(),
                weapons(),
                weapons(),

              ],
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor: Colors.deepOrange,
        child: Icon(Icons.home),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
