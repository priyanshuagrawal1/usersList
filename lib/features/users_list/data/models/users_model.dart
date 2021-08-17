import 'package:newproject/features/users_list/domain/entities/user.dart';

class UserModel extends User {
  final String? id;
  final String? name;
  final String? picture;
  final String? username;
  final String? email;
  final String? dob;
  final String? gender;
  final String? location;
  final String? country;
  const UserModel(
      {this.id,
      this.name,
      this.picture,
      this.gender,
      this.location,
      this.username,
      this.email,
      this.dob,
      this.country});

  static List<User> getUsersList(dynamic json) {
    List<User>? list = [];
    final users = json.forEach((userdata) {
      final user = User(
        dob: userdata['dob']['date'].toString().substring(0, 10),
        email: userdata['email'],
        gender: userdata['gender'],
        id: userdata['id']['value'],
        location:
            '${userdata['location']['street']['number']},${userdata['location']['street']['name']},${userdata['location']['city']},${userdata['location']['state']},${userdata['location']['country']}',
        name:
            '${userdata['name']['title']} ${userdata['name']['first']} ${userdata['name']['last']}',
        picture: userdata['picture']['large'],
        username: userdata['login']['username'],
        country: userdata['location']['country'],
      );
      list.add(user);
    });
    return list;
  }
}
