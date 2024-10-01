import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallpaper/model/people_model.dart';
import 'package:wallpaper/model/user_model.dart';


class UserServices {
  String _baseUrl = "https://randomuser.me/api/";


  /// AI made Model Class & used it's fromJson function
  Future<PeopleModel?> fetchPeopleData(int numberOfUser) async {
    try {
      final url = "${_baseUrl}?results=${numberOfUser}";
      final response = await http.get(Uri.parse(url));
      // See in the console and Debug the response
      print("API Response: ${response.body}");
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return PeopleModel.fromJson(data);
      } else {
        print("Failed to load data");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  /// Hand Made Model Class without Using fromMap function
  Future<List<UserModel>> fetchUserData(int numberOfUser) async {
    List<UserModel> allUsers = [];
    try{
      final url = "${_baseUrl}?results=${numberOfUser}";
      final response = await http.get(Uri.parse(url));
      final allData = jsonDecode(response.body);
      final List data = allData["results"];

      for (var i in data) {
        UserModel user = UserModel(
          title: i["name"]["title"],
          firstName: i["name"]["first"],
          lastName: i["name"]["last"],
          gender: i["gender"],
          country: i["location"]["country"],
        );
        allUsers.add(user);
      }
      return allUsers;
    }catch(e){
      print(e);
      return[];
    }
  }
}
