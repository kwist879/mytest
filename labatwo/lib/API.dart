import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'dart:async';


class JsonAPI{

  static const String MainURL = 'https://raw.githubusercontent.com/wesleywerner/ancient-tech/02decf875616dd9692b31658d92e64a20d99f816/src/data/techs.ruleset.json';
  String imageURL = 'https://raw.githubusercontent.com/wesleywerner/ancient-tech/02decf875616dd9692b31658d92e64a20d99f816/src/images/tech/';

  Future <ListData> getData() async {
    try {
          final response = await http.get(MainURL);
          if(response.statusCode == 200)
          return ListData.fromJson(json.decode(response.body));
          else throw Exception('failed to load');
    }
    catch (e) {
      throw Exception(e.toString());
    }
  }
}

class ListData{
final List<Data> data;
ListData({this.data});


factory ListData.fromJson(List<dynamic> parsedJson){
  List<Data> data = new List<Data>();
  for(var i in parsedJson.map((i)=>Data.fromJson(i))){
    if(i.graphic != null){
      data.add(i);
    }
  }
  //print(data.map((f) => print(f.graphic)));
  return new ListData(data: data);
}


}

@JsonSerializable(nullable: false)
class Data{
String helptext;
String graphic;
String name;
String req1;
String req2;
String flags;

Data({this.flags, this.graphic, this.name, this.req1, this.req2, this.helptext});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      flags: json['flags'],
      helptext: json['helptext'],
      graphic: json['graphic'],
      name: json['name'],
      req1: json['req1'],
      req2: json['req2']
    );   
  }
}
