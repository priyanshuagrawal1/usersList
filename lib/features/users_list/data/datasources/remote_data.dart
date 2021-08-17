import 'package:http/http.dart' as http;
import 'package:newproject/features/users_list/data/models/users_model.dart';
import 'dart:convert';

import 'package:newproject/features/users_list/domain/entities/user.dart';

class GetData {
  static Future<List<User>> fetchData() async {
    final url = Uri.parse('https://randomuser.me/api/?results=50');
    final response = await http.get(url);

    final userdataList = json.decode(response.body);
    final usersList = UserModel.getUsersList(userdataList['results']);
    return usersList;
  }
}
