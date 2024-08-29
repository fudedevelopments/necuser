import 'dart:convert';

class Eventmodel {
  final List<String> eventimage;
  final String eventname;
  final String eventdetails;
  final String registerurl;
  final String date;
  final String eventlocation;
  Eventmodel({
    required this.eventimage,
    required this.eventname,
    required this.eventdetails,
    required this.registerurl,
    required this.date,
    required this.eventlocation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eventimage': eventimage,
      'eventname': eventname,
      'eventdetails': eventdetails,
      'registerurl': registerurl,
      'date': date,
      'eventlocation': eventlocation,
    };
  }

  factory Eventmodel.fromMap(Map<String, dynamic> map) {
    return Eventmodel(
      eventimage: List<String>.from(map['eventimage']),
      eventname: map['eventname'] as String,
      eventdetails: map['eventdetails'] as String,
      registerurl: map['registerurl'] as String,
      date: (map['date'] as String).toString(),
      eventlocation: map['eventlocation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Eventmodel.fromJson(String source) => Eventmodel.fromMap(json.decode(source) as Map<String, dynamic>);
}
