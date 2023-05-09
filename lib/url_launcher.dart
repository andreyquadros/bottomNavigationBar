import 'package:flutter/material.dart';

class UrlLauncherPage extends StatefulWidget {
  const UrlLauncherPage({Key? key}) : super(key: key);

  @override
  State<UrlLauncherPage> createState() => _UrlLauncherPageState();
}

class _UrlLauncherPageState extends State<UrlLauncherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Aba destinada para o URL Launcher')
        ],
      ),
    );
  }
}
