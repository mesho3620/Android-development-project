import 'package:flutter/material.dart';

class ChatUsers {

  String name;
  String ID;
  String secText;
  String image;
  String time;
  ChatUsers(
      {
        this.ID,
      this.name,
      @required this.secText,
      @required this.image,
      @required this.time});

  ChatUsers.fromMap(Map<String, dynamic> map,String id)
      : assert(map['name'] != null),
        assert(map['secText'] != null),
      assert(map['image'] != null),
        assert(map['time'] != null),

      name = map['name'],
        ID = id,
        secText = map['secText'],
      image=map['image'],
        time=map['time'];

  @override
  String toString() => "Record<$name:$ID:$secText:$image:$time>";
}
