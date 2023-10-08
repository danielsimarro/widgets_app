import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: appMenuItems.length,
        itemBuilder: (context, int index) {
          final menu = appMenuItems[index];
          return _CustomListTitle(menu: menu);
        });
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menu,
  });

  final MenuItem menu;

  @override
  Widget build(BuildContext context) {
    // Obtenemos el color primario de nuestra app, que la especificamos en el AppTheme
    final colors = Theme.of(context).colorScheme;
    return ListTile(
        leading: Icon(
          menu.icon,
          color: colors.primary,
        ),
        trailing: Icon(
          Icons.arrow_back_ios_rounded,
          color: colors.primary,
        ),
        title: (Text(menu.title)),
        subtitle: Text(menu.subTitle),
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => const ButtonsScreen(),
          //   ),
          // );
          // Navigator.pushNamed(context, menu.link);
          // Con el go router para llevar al link solo hay que hacer esto:
          context.push(menu.link);
        });
  }
}
