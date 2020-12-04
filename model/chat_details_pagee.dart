import 'package:chat11/components/chat_bar.dart';
import 'package:chat11/components/chat_bb.dart';
import 'package:chat11/modules/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Messagetype{
Sender,
Receiver,
}
class ChatDetailsPage extends StatelessWidget{
  List<ChatMessage> chatMessage=[
    ChatMessage(message: "project at 10 am ",type: Messagetype.Receiver),
    ChatMessage(message: "10 am ?",type: Messagetype.Sender),
    ChatMessage(message: "yes ",type: Messagetype.Receiver),
    ChatMessage(message: "ok ",type: Messagetype.Sender),
    ChatMessage(message: "oh ",type: Messagetype.Receiver),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatBar(),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: chatMessage.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),//avoid scrolling the list
            itemBuilder: (context, index){
              return Chatbb(
                chatMessage:chatMessage[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left:16,bottom: 10),
              height: 80.0,
              width: double.infinity,
              color: Colors.white,
              child:Row(
              children: <Widget>[Container(
                height:40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(31.0),

                ),
                child: Icon(Icons.add,color: Colors.white,size: 20.0,),
              ),
                SizedBox(width: 16.0,),
                Expanded(//widegt that expands child of row or collamn to fit the spaces
                  child: TextField(

                  decoration: InputDecoration(
                    hintText: "Type Message",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,//typing area
                  ),
                  ),
                )
              ],
              ),
          )
          ),
          Align(
            alignment: Alignment.bottomRight,
            child:Container(padding:EdgeInsets.only(right: 25,bottom: 60),
            child:FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.send,color: Colors.white,),
              backgroundColor:Colors.blue,
            )
          )
          )
        ],
      )


    );
  }
}