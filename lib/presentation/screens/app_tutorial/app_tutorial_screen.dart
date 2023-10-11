import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Estos son los tres slides
class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slide = <SlideInfo>[
  SlideInfo('Busca la comida', 'Laboris duis Lorem cillum in.',
      'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Culpa id voluptate elit qui velit.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfrute la comida',
      'Cupidatat ex aliqua do eiusmod occaecat sint sint aute fugiat aliqua ipsum.',
      'assets/images/3.png')
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const name = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slide.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  // Cada vez que mandemos un listener hay que mandar el dispos
  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            // Controler
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slide
                .map((sliedeData) => _Slide(
                    title: sliedeData.title,
                    caption: sliedeData.caption,
                    imageUrl: sliedeData.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Saltar'),
                onPressed: () => context.pop(),
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                      child: const Text('Empezar'),
                      onPressed: () => context.pop(),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(
                title,
                style: titleStyle,
              ),
              const SizedBox(height: 20),
              Text(
                caption,
                style: captionStyle,
              )
            ],
          ),
        ));
  }
}
