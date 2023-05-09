import 'package:flutter/material.dart';

class MaterialBannerPage extends StatefulWidget {
  const MaterialBannerPage({Key? key}) : super(key: key);

  @override
  State<MaterialBannerPage> createState() => _MaterialBannerPageState();
}

class _MaterialBannerPageState extends State<MaterialBannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Aba destinada para o Material Banner')
        ],
      ),
    );
  }
}
