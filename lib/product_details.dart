import 'package:flutter/material.dart';
import 'package:page2/bottom_bar.dart';


class ShopDetail extends StatelessWidget {
  final assetPath, weaponPrice, weaponname;

  ShopDetail({this.assetPath, this.weaponPrice, this.weaponname});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white60,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back,color: Colors.black),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
      title: Text('Shop',style:TextStyle(
          fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black),),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications_none,color: Colors.black),
          onPressed: (){

          },
        ),
      ],
    ),
    body: ListView(
      children: [
      SizedBox(height: 15.0),
        Padding(padding:EdgeInsets.only(left:20.0),
        child: Text('Weapons',
            style:TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,color: Colors.deepOrange)

        ),
        ),
            SizedBox(height: 15.0),
          Hero(
        tag:assetPath,
            child:Image.asset(assetPath,height: 150.0,width: 100.0,fit: BoxFit.contain),

          ),
        SizedBox(height: 20.0),
        Center(
          child: Text(weaponPrice,
              style: TextStyle(

                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(weaponname,
              style: TextStyle(
                  color: Colors.blueGrey,

                  fontSize: 24.0)),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text('is the legendary sword of King Arthur, sometimes also attributed with magical powers ',
                textAlign: TextAlign.center,
                style: TextStyle(

                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9))
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFFF17532)
                ),
                child: Center(
                    child: Text('Buy',
                      style: TextStyle(

                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    )
                )
            )
        )
      ]
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
