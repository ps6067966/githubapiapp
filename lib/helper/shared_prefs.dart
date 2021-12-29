import 'dart:convert';

import 'package:githubapi/helper/prefs.dart';
import 'package:githubapi/model/github_model.dart';

class MySharedPrefrences {
  static List<GitHubModel?>? getGitHubData() {
    String? githubdata = Prefs.getString("githubdata");
    if (githubdata == null) {
      return null;
    } else {
      var data = jsonDecode(Prefs.getString("githubdata") ?? "");
      return (data as List).map((x) => GitHubModel.fromJson(x)).toList();
    }
  }

  static setGitHubData(List<dynamic> value) async {
    var githubData = jsonEncode(value);

    Prefs.setString("githubdata", githubData);
  }
}
