import 'package:flutter/material.dart';
import 'package:bottomNavigationBar0905/material_banner.dart';
import 'package:bottomNavigationBar0905/simple_form.dart';
import 'url_launcher.dart';
import 'validators_form.dart';
import 'video_player.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  int _paginaSelecionada = 0;

  // final List<Widget> _paginas = [
  //   SimpleForm(),
  //   ValidatorsForm(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: IndexedStack(
        index: _paginaSelecionada,
        children: [
          SimpleForm(),
          ValidatorsForm(),
          VideoPlayerPageComponent(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amberAccent,
        backgroundColor: Colors.blue,
        currentIndex: _paginaSelecionada,
        onTap: (int novoIndice){
          setState(() {
            _paginaSelecionada = novoIndice;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted_outlined), label: 'Formulário simples'),
          BottomNavigationBarItem(icon: Icon(Icons.format_color_text_rounded), label: 'Formulário com Validação'),
          BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: 'Video Player'),
        ],
      ),
    );
  }
}
