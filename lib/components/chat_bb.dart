import '../modules/chat_details_pagee.dart';
import 'package:intl/intl.dart';
import '../model/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chatbb extends StatefulWidget{
  ChatMessage chatMessage;
  Chatbb({@required this.chatMessage});
  @override
  _ChatbbState createState() => _ChatbbState();
}
//differenciate between sender and reciever
class _ChatbbState extends State<Chatbb> {

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    return Container(
      padding: EdgeInsets.only(left:16.0,right: 16.0,top: 10.0,bottom: 10),
      child: Align(
        alignment: (widget.chatMessage.type?Alignment.topLeft:Alignment.topRight),//telling u where is the sender and reciever
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.chatMessage.type?Colors.blue:Colors.grey),//law type bt3ha reciever ykon blue else gray
          ),
          padding: EdgeInsets.all(16.0),

          child: Text(widget.chatMessage.message),
        ),
      ),
      );
  }
}