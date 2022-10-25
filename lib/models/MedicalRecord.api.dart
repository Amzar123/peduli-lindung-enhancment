import 'dart:convert';
import 'package:health_app/models/MedicalRecords.dart';
import 'package:http/http.dart' as http;

class MedicalRecordApi {

  static Future<List<MedicalRecord>> getMedical() async {
    var uri = Uri.https('https://yummly2.p.rapidapi.com/feeds/list', '/feeds/list', {
      'limit': '18',
      'start': '8',
      'tag': 'list.recipe.popular'
    });

    final responses = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'ba4fd1d5ecmsh98f2b721795b82bp101024jsn033aca05e82b',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true'
    });

    Map data = jsonDecode(responses.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return MedicalRecord.medicalFromSnapshot(_temp);
  }
}