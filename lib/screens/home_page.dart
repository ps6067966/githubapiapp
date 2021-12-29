import 'package:flutter/material.dart';
import 'package:githubapi/api/api_services.dart';
import 'package:githubapi/constant/colors.dart';
import 'package:githubapi/helper/shared_prefs.dart';
import 'package:githubapi/model/github_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GitHubModel?>? gitHubModelList = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _getGithubData();
    });
  }

  Future<List<GitHubModel>?>? _getGithubData() async {
    await ApiServices.getAllGithub();
    gitHubModelList = MySharedPrefrences.getGitHubData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Jake's Git"),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    title: Text(gitHubModelList?[index]?.name ?? "Hello"),
                    subtitle: Column(
                      children: [
                        Text(gitHubModelList?[index]?.description ?? "Hello"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "<>${gitHubModelList?[index]?.language ?? "Hello"}"),
                            Text(
                                "Bug:${gitHubModelList?[index]?.openIssuesCount ?? "Hello"}"),
                            Text(
                                "😄${gitHubModelList?[index]?.openIssuesCount ?? "Hello"}"),
                          ],
                        )
                      ],
                    ),
                    isThreeLine: true,
                    leading: const Icon(
                      Icons.book,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ],
              ),
          itemCount: gitHubModelList?.length ?? 0),
    ));
  }
}
