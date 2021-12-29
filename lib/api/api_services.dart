import 'dart:developer';
import 'package:githubapi/helper/shared_prefs.dart';
import 'package:githubapi/model/github_model.dart';

import 'api_constant.dart';

class ApiServices {
  static Future<List<GitHubModel?>?> getAllGithub() async {
    try {
      var response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        
       log(response.data.toString());
        MySharedPrefrences.setGitHubData(response.data);
      }
    } catch (e) {
      log("$e");
    }
  }
}
