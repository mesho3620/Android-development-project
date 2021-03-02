import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../components/chat_bar.dart';
import '../components/chat_bb.dart';
import '../model/chat_menu_item.dart';
import '../model/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ChatDetailsPage extends StatefulWidget {
   String id;
   ChatDetailsPage(@required this.id);
  @override
  _ChatDetailsPageState createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  List<ChatMessage> chatMessage = [
    ChatMessage(message: "project at 10 am ", type: true, time: DateTime.parse("2019-07-19 08:40:23")),
    ChatMessage(message: "10 am ?", type: false, time: DateTime.parse("2019-07-19 08:40:23")),
    ChatMessage(message: "yes ", type: true, time: DateTime.parse("2019-07-19 08:40:23")),
    ChatMessage(message: "ok ", type: false, time: DateTime.parse("2019-07-19 08:40:23")),
    ChatMessage(message: "oh ", type: true, time: DateTime.parse("2019-07-19 08:40:23")),
    ChatMessage(message: "oh ", type: false, time: DateTime.parse("2019-07-19 08:40:23")),
  ];

  List<ChatMessage> mydata;

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
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Contacts').document(widget.id).collection('Chat').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<ChatMessage> contact = snapshot.data.documents
              .map((documentSnapshot) => ChatMessage.fromMap(documentSnapshot.data))
              .toList();

          return _buildPage(context, contact);
        }
      },
    );
  }

  Widget _buildPage(BuildContext context, List<ChatMessage> contactdata) {
    mydata = contactdata;
    // _generateData(mydata);
    return Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: mydata.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics:
              NeverScrollableScrollPhysics(), //avoid scrolling the list
              itemBuilder: (context, index) {
                return Chatbb(
                  chatMessage: mydata[index],
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


    );
  }


/*
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
  }*/
}
