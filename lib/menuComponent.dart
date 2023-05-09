import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

class MenuComponent extends StatefulWidget {
  const MenuComponent({Key? key}) : super(key: key);

  @override
  State<MenuComponent> createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  String _colorName = 'No';
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      alignment: Alignment.bottomRight,
      backgroundWidget: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 28),
            children: <TextSpan>[
              TextSpan(text: ' button is clicked.'),
            ],
          ),
        ),
      ),
      toggleButtonColor: Colors.black,
      items: [
        CircularMenuItem(
          enableBadge: true,
          badgeColor: Colors.amber,
          badgeRadius: 15,
          badgeTextColor: Colors.white,
          badgeRightOffet: 0,
          badgeTopOffet: 0,
          onTap: () {
            print('badge on circular menu item');
          },
          icon: Icons.home,
          color: Colors.teal,
        ),
        CircularMenuItem(
          enableBadge: true,
          badgeColor: Colors.red,
          badgeRadius: 15,
          badgeTextColor: Colors.white,
          badgeRightOffet: 0,
          badgeTopOffet: 0,
          onTap: () {
            print('badge on circular menu item');
          },
          icon: Icons.home,
          color: Colors.teal,
        ),
      ],
    );
  }
}
