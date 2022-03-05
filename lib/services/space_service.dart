import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cozycation/models/space_model.dart';

class SpaceService extends ChangeNotifier {
  getSpaceService() async {
    var result = await http
        .get(Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces'));

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<SpaceModel> spaces =
          data.map((e) => SpaceModel.fromJson(e)).toList();
      return spaces;
    } else {
      return <SpaceModel>[];
    }
  }
}
