import '../modules/chat_page.dart';
import 'package:flutter/material.dart';

import '../bottom_bar.dart';

class ChatPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButton: FloatingActionButton(onPressed: (){},
      backgroundColor: Colors.deepOrange,
      child: Icon(Icons.home),

    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomBar(),

    body:MainChat(),

  );


  }

  }

