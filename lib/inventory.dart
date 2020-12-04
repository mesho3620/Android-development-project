import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class Inv extends StatefulWidget {
  @override
  _InvState createState() => _InvState();
}

class _InvState extends State<Inv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: Icon(Icons.arrow_back,color: Colors.white),
    onPressed: () {
      Navigator.of(context).pop();
    }),
        backgroundColor: Colors.deepOrange,
        centerTitle:true ,
        title: Text("Inventory"),
        actions: <Widget>[
          FlatButton(
              child: Icon(Icons.delete,color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.deepOrange,
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white24,
                indicatorColor: Colors.black,
                tabs: <Widget>[Tab(text:"Weapons",),Tab(text: "Armors",),Tab(text: "Pets", )],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16.0),
                    child: Text("Filter",style: TextStyle(color: Colors.black),)
                ),
                IconButton(icon:Icon(Icons.filter_list_alt,color: Colors.deepOrange
                ),
                  onPressed: (){},
                ),

              ],
            ),

            Expanded(
              child: ListView.builder(
                itemBuilder: (_,index) => item(),
                itemCount: 10,
              ),
            )
          ],
        ),
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

class item extends StatelessWidget {
  const item({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                 image: NetworkImage("https://www.easypuck.co.uk/image/data/TPS/shaft/jcsw-36012.jpg"),
                 fit:BoxFit.cover,

              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 8.0,),
          Column(
            children: [

              Text("stick",
                style: TextStyle(fontSize: 20,color: Colors.orange,fontWeight: FontWeight.bold,),
              ),
              Text("100 Gold",
                style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                height: 30.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(20)
                ),
                onPressed: (){},
                child: Text("Equip"),
              )
            ],
          )
        ],

      ),

    );
  }
}
