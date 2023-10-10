import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const name = 'Snackbar_screen';

  void showCustomSnackbar(BuildContext context) {
    // Esto sirve para cada vez que pulsemos el snakbar oculte el anterior y no pete
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Hola mundo'),
      // Pone el boton de ok y al presionar se oculta
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    ));
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        // Esto nos obliga a pulsar cualquier boton para cerrar la aplicacion
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('¿Estas seguro?'),
              content: const Text(
                  'Et qui aute consectetur amet anim id ut pariatur officia eiusmod exercitation qui.'),
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('Cancelar'),
                ),
                FilledButton(onPressed: () {}, child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Snackbars y dialogos'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Pariatur exercitation do sunt eiusmod adipisicing. Cupidatat eu qui sint amet qui et magna dolore occaecat. Velit aliqua deserunt nostrud sint commodo nisi ut deserunt est eu incididunt incididunt tempor. Esse laborum sint fugiat id eu minim et consequat laborum ad consequat. Id aute consequat fugiat et do duis eiusmod veniam sit officia quis in cillum nulla.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar diálogo'))
          ],
        )),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => showCustomSnackbar(context),
            label: const Text('Mostrar Snackbar'),
            icon: const Icon(Icons.remove_red_eye_outlined)));
  }
}
