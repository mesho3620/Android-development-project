import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/chat.dart';
import '../model/chat_users.dart';
import 'package:flutter/material.dart';
class MainChat extends StatefulWidget{
  @override
  _MainChatState createState() => _MainChatState();
}
//feha chat wa search wl new returned userlist feha name wa text wa time wa picture

class _MainChatState extends State<MainChat> {
  // List<ChatUsers> chatUsers=[
  //   ChatUsers(name:"Adham", secText: "project android ", image: "images/1.jpg", time: "Now"),
  //   ChatUsers(name:"ahmed", secText: "MIu  ", image: "images/2.jpg", time: "2 seconds later"),
  //   ChatUsers(name:"karim", secText: "1 two 3 ", image: "images/3.jpg", time: "hour"),
  //   ChatUsers(name:"tamer", secText: "kind of  ", image: "images/2.jpg", time: "hour"),
  //   ChatUsers(name:"john", secText: "yes ", image: "images/3.jpg", time: "2 hours"),
  //   ChatUsers(name:"alaa", secText: "sure ", image: "images/1.jpg", time: "3 hours"),
  //   ChatUsers(name:"sarah", secText: "lol :) ", image: "images/2.jpg", time: "month"),
  //   ChatUsers(name:"janna", secText: "no", image: "images/3.jpg", time: "23 march"),
  // ];

   List<ChatUsers> mydata;



   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: _buildBody(context),
     );
   }

   Widget _buildBody(BuildContext context) {
     return StreamBuilder<QuerySnapshot>(
       stream: Firestore.instance.collection('Contacts').snapshots(),
       builder: (context, snapshot) {
         if (!snapshot.hasData) {
           return LinearProgressIndicator();
         } else {
           int index=0;
           List<ChatUsers> contact = snapshot.data.documents
               .map((documentSnapshot) =>ChatUsers.fromMap(documentSnapshot.data,snapshot.data.documents[index++].documentID))
               .toList();


          // QuerySnapshot doc= Firestore.instance.collection('Contacts').snapshots();
          // List<DocumentSnapshot> x=doc.then((value) => value.documents.toList());




           // Firestore.instance.collection('Contacts').snapshots().forEach((QuerySnapshot d){ print(d.documents[index].documentID);print(index);index=index+1;});
           return _buildPage(context, contact);
           // return Text(task.toString());
         }
       },
     );
   }

   Widget _buildPage(BuildContext context, List<ChatUsers> contactdata) {
     mydata = contactdata;
     // _generateData(mydata);
     return Padding(
       padding: EdgeInsets.all(8.0),
       child: Container(
           child: Column(
             children: <Widget>[
           SafeArea(
           child: Padding(padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:<Widget>[ Text("Chat",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                 Container(
                   padding: EdgeInsets.only(left: 8.0,right: 8.0,top:2.0,bottom: 2.0),
                   height: 30,
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                     color: Colors.pink.shade50,),

                   child: Row(
                     children: <Widget>[
                       Icon(Icons.add,color: Colors.deepOrange,size: 20,),
                       SizedBox(width: 2.0,),
                       Text("New",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0,),),
                       Container(

                         height:30.0,


                       ),


                     ],
                   ),
                 )
               ],
             )
         )
       ),
         Padding(
           padding:EdgeInsets.only(left:16.0,right:16.0,top:16.0),
           child:TextField(
             decoration: InputDecoration(
                 hintText: "Search..",
                 hintStyle:TextStyle(color:Colors.grey.shade400,),
                 prefixIcon:Icon(Icons.search_rounded,size: 20.0,color: Colors.grey.shade400,),
                 filled: true,
                 fillColor: Colors.grey.shade200,
                 contentPadding:EdgeInsets.all(8.0),
                 enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(30),
                     borderSide: BorderSide(
                         color: Colors.grey.shade100
                     ))
             ),
           ),
         ),
         ListView.builder(
           itemCount: mydata.length,
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
           itemBuilder: (context,index){
             return UserList(
               text:mydata[index].name ,
               ID: mydata[index].ID,
               secText: mydata[index].secText,
               image: mydata[index].image,
               time: mydata[index].time,
               isread:(index == 0 || index == 3 )? true:false,
             );
           },
         )
         ],
           ),

       ),
     );
   }

//   @override
//   Widget build(BuildContext context) {
// return Scaffold(
//
//   body: SingleChildScrollView(
//     physics: BouncingScrollPhysics(),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SafeArea(
//           child: Padding(padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children:<Widget>[ Text("Chat",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
//               Container(
//                 padding: EdgeInsets.only(left: 8.0,right: 8.0,top:2.0,bottom: 2.0),
//                 height: 30,
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
//                   color: Colors.pink.shade50,),
//
//                 child: Row(
//                   children: <Widget>[
//                     Icon(Icons.add,color: Colors.deepOrange,size: 20,),
//                     SizedBox(width: 2.0,),
//                     Text("New",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0,),),
//                     Container(
//
//                     height:30.0,
//
//
//                       ),
//
//
//                   ],
//                 ),
//               )
//               ],
//             )
//             )
//             ),
//         Padding(
//           padding:EdgeInsets.only(left:16.0,right:16.0,top:16.0),
//         child:TextField(
//           decoration: InputDecoration(
//             hintText: "Search..",
//             hintStyle:TextStyle(color:Colors.grey.shade400,),
//             prefixIcon:Icon(Icons.search_rounded,size: 20.0,color: Colors.grey.shade400,),
//             filled: true,
//             fillColor: Colors.grey.shade200,
//             contentPadding:EdgeInsets.all(8.0),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: BorderSide(
//                     color: Colors.grey.shade100
//     ))
//             ),
//           ),
//         ),
//         ListView.builder(
//           itemCount: chatUsers.length,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context,index){
//             return UserList(
//               text:chatUsers[index].name ,
//               secText: chatUsers[index].secText,
//               image: chatUsers[index].image,
//               time: chatUsers[index].time,
//               isread:(index == 0 || index == 3 )? true:false,
//             );
//           },
//         )
//           ]
//     ),
//
// ),
//         );
//
//   }
}
