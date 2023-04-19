import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import '../pages/cart_page.dart';
import '../pages/home.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();

  _pages = [
    ScreenHiddenDrawer(ItemHiddenMenu(
      name:'HOME',
    baseStyle: const TextStyle(fontWeight: FontWeight.w600),
    selectedStyle: const TextStyle(fontWeight: FontWeight.w800,  color: Colors.white),
     colorLineSelected: Colors.deepPurple,
    ),
        const HomePage ()),
    ScreenHiddenDrawer(ItemHiddenMenu(
      name:'CART',
      baseStyle: const TextStyle(fontWeight: FontWeight.w600),
      selectedStyle: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
      colorLineSelected: Colors.deepPurple,

    ),
        const CartPage()),


  ];
  }
  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.deepPurple.shade200,
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 40,
      contentCornerRadius: 20,


    );
  }
}
