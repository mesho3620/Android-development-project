import 'package:flutter/material.dart';
import 'modules/main_page.dart';
import 'inventory.dart';
import 'shop.dart';
import 'settings.dart';


class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return new  BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.shopping_cart_outlined,
                    color: Colors.deepOrange,
                  ),
                  onPressed: (){
                    // Navigator.pop(context,Inv());
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Shop()));
                  }),


              IconButton(
                  icon: Icon(Icons.inventory,
                    color: Colors.deepOrange,
                  ),
                  onPressed: (){
                    // Navigator.pop(context,Inv());
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Inv()));
                  }),



              IconButton(
          icon: Icon(Icons.chat,
            color: Colors.deepOrange,
          ),
          onPressed: (){
            // Navigator.pop(context,Inv());
            Navigator.push(context, MaterialPageRoute(builder: (context) =>ChatPage()));
          }),


      IconButton(
      icon: Icon(Icons.settings,
      color: Colors.deepOrange,
      ),
      onPressed: (){
      // Navigator.pop(context,Inv());
      Navigator.push(context, MaterialPageRoute(builder: (context) =>GeneralSettings()));
      }),

            ],


          ),
        );

    }

    //------------------------------------------------------------------------------
    /*
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)),
                color: Colors.white),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.shopping_cart_outlined,
                                  color: Colors.deepOrange,
                                ),
                                onPressed: (){
                                  // Navigator.pop(context,Inv());
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Shop()));
                                }),


                            IconButton(
                                icon: Icon(Icons.inventory,
                              color: Colors.deepOrange,
                                ),
                                onPressed: (){
                                  // Navigator.pop(context,Inv());
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Inv()));
                                })
                                ])),




                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.chat_rounded,
                              color: Colors.deepOrange,
                            ),
                            Icon(
                              Icons.settings,
                              color: Colors.deepOrange,
                            )
                          ])),
                ])
        )

    );
  */}

