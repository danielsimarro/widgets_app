import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Con esto obtenemos el tamaño del notch y determinar si tiene notch
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
        //Este nos dice el index que esta seleccionado y con el destinated lo cambiamos
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

          // Esto nos sirve para cuando pulsemos vallamos a la otra pantalla
          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          // Al querer hacer referencia a las propiedades del skafful hayq ue escribir widget delante
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
            child: const Text('Main'),
          ),
          ...appMenuItems
              .sublist(0, 3)
              .map((item) => NavigationDrawerDestination(
                    icon: Icon(item.icon),
                    label: Text(item.title),
                  )),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
              child: Text('Main Options')),
          ...appMenuItems.sublist(3).map((item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ))
        ]);
  }
}
