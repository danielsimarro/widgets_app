import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  static const name = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                value: Transportation.car,
                title: const Text('Coche'),
                subtitle: const Text('Viajar por coche'),
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.car;
                    })),
            RadioListTile(
                value: Transportation.submarine,
                title: const Text('Submarino'),
                subtitle: const Text('Viajar por submarine'),
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.submarine;
                    })),
            RadioListTile(
                value: Transportation.plane,
                title: const Text('Avion'),
                subtitle: const Text('Viajar por avion'),
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.plane;
                    })),
            RadioListTile(
                value: Transportation.boat,
                title: const Text('Barco'),
                subtitle: const Text('Viajar por Barco'),
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.boat;
                    }))
          ],
        ),
        CheckboxListTile(
            title: const Text('¿Desatuno?'),
            value: wantsBreakfast,
            onChanged: ((value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                }))),
        CheckboxListTile(
            title: const Text('Almuerzo?'),
            value: wantsLunch,
            onChanged: ((value) => setState(() {
                  wantsLunch = !wantsLunch;
                }))),
        CheckboxListTile(
            title: const Text('Cena?'),
            value: wantsDinner,
            onChanged: ((value) => setState(() {
                  wantsDinner = !wantsDinner;
                })))
      ],
    );
  }
}
