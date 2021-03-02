
import 'package:flutter/cupertino.dart';

//sender wl receiver
class ChatMessage{
String message;
bool type;
DateTime time;
ChatMessage({@required this.message ,@required this.type,@required this.time });
String getYear()
{
  return time.year.toString();
}

String getMonth()
{
  return time.month.toString();
}

String getDay()
{
  return time.day.toString();
}

String getHour()
{
  return time.hour.toString();
}

String getMinute()
{
  return time.minute.toString();
}

ChatMessage.fromMap(Map<String, dynamic> map)
    : assert(map['message'] != null),
      assert(map['type'] != null),
      assert(map['time'] != null),

//Timestamp time;
// DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch)
//      time=DateTime.fromMillisecondsSinceEpoch(map['time'] * 1000);

      message = map['message'],
      type = map['type'],
      time=map['time'].toDate();
@override
String toString() => "Record<$message:$type:$time>";

}