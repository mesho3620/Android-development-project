import 'package:chat11/components/chat_bar.dart';
import 'package:chat11/components/chat_bb.dart';
import 'package:chat11/model/chat_menu_item.dart';
import 'package:chat11/modules/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Messagetype {
  Sender,
  Receiver,
}

class ChatDetailsPage extends StatefulWidget {
  @override
  _ChatDetailsPageState createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  List<ChatMessage> chatMessage = [
    ChatMessage(message: "project at 10 am ", type: Messagetype.Receiver),
    ChatMessage(message: "10 am ?", type: Messagetype.Sender),
    ChatMessage(message: "yes ", type: Messagetype.Receiver),
    ChatMessage(message: "ok ", type: Messagetype.Sender),
    ChatMessage(message: "oh ", type: Messagetype.Receiver),
  ];
  List<ChatMenuItems> menuItem = [
    ChatMenuItems(
        text: "Photo and video", icons: Icons.image, color: Colors.orange),
    ChatMenuItems(
        text: "Documents", icons: Icons.file_copy_rounded, color: Colors.blue),
    ChatMenuItems(
        text: "Contact", icons: Icons.contact_phone, color: Colors.purple),
    ChatMenuItems(text: "Location", icons: Icons.map, color: Colors.red),
  ];
  void showModel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(19),
                    topLeft: Radius.circular(19))),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 4,
                    width: 50,
                    color: Colors.grey,
                  ),
                ),
                ListView.builder(
                  itemCount: menuItem.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(top: 9, bottom: 9),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: menuItem[index].color.shade200),
                          height: 40,
                          width: 40,
                          child: Icon(
                            menuItem[index].icons,
                            size: 19,
                          ),
                        ),
                        title: Text(menuItem[index].text),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ChatBar(),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: chatMessage.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics:
                  NeverScrollableScrollPhysics(), //avoid scrolling the list
              itemBuilder: (context, index) {
                return Chatbb(
                  chatMessage: chatMessage[index],
                );
              },
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 16, bottom: 10),
                  height: 80.0,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showModel();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(31.0),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                        //widegt that expands child of row or collamn to fit the spaces
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Type Message",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none, //typing area
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    padding: EdgeInsets.only(right: 25, bottom: 60),
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.blue,
                    )))
          ],
        ));
  }
}
