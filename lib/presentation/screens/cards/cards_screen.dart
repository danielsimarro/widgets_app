import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevated': 0.0, 'label': 'Elevation 0'},
  {'elevated': 1.0, 'label': 'Elevation 1'},
  {'elevated': 2.0, 'label': 'Elevation 2'},
  {'elevated': 3.0, 'label': 'Elevation 3'},
  {'elevated': 4.0, 'label': 'Elevation 4'},
  {'elevated': 5.0, 'label': 'Elevation 5'}
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const String name = 'cards_sceen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Vamo sa barrer todas las tarjetas de arriva, pasarlos por el map y tener el card que son los datos
          ...cards.map(
            (card) =>
                _CardType1(elevation: card['elevated'], label: card['label']),
          ),
          ...cards.map(
            (card) =>
                _CardType2(elevation: card['elevated'], label: card['label']),
          ),
          ...cards.map(
            (card) =>
                _CardType3(elevation: card['elevated'], label: card['label']),
          ),
          ...cards.map(
            (card) =>
                _CardType4(elevation: card['elevated'], label: card['label']),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  const _CardType4({required this.label, required this.elevation});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20))),
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              )),
        ],
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  const _CardType3({required this.label, required this.elevation});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surface,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - filled'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  const _CardType2({required this.label, required this.elevation});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: colors.primary)),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  const _CardType1({required this.label, required this.elevation});

  final String label;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}
