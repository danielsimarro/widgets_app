import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    // Este es el watch del contador
    final clickCounter = ref.watch(counterProvider);
    // Este es el watch del mode dark o light
    final isDarkmode = ref.watch(isDarkmodeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Magic'),
        actions: [
          IconButton(
              icon: (isDarkmode
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.dark_mode_outlined)),
              onPressed: () {
                /*(ref.read(isDarkmodeProvider)
                    ? ref.read(isDarkmodeProvider.notifier).state = false
                    : ref.read(isDarkmodeProvider.notifier).state = true);*/
                    // Le asignamos el contrario al que tiene
                ref
                    .read(isDarkmodeProvider.notifier)
                    .update((isDark) => !isDark);
              })
        ],
      ),
      body: Center(
          child: Text(
        'Valor: $clickCounter',
        style: Theme.of(context).textTheme.titleLarge,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Para cambiar el estado del provider hacemos esto, primero leemos y luego sumamos
          ref.read(counterProvider.notifier).state++;
        },
        backgroundColor: color.primary,
        child: const Icon(
          Icons.add, // Icono de círculo
          size: 36.0, // Tamaño del icono
          color: Colors.white, // Color del icono
        ),
      ),
    );
  }
}
