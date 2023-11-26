import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatefulWidget {
  const Pagina2Page({super.key});

  @override
  State<Pagina2Page> createState() => _Pagina2PageState();
}

class _Pagina2PageState extends State<Pagina2Page> {
  late AnimationController bounceController;
  bool animate = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BounceInDown(
          animate: true,
          controller: (controller) => bounceController = controller,
          child: const Square(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            //  bounceController.forward();
            // bounceController
            //   ..reset()
            //   ..forward();

            await bounceController.reverse();
            await bounceController.forward();

            await bounceController.reverse();
            await bounceController.forward();
          },
          child: const Icon(Icons.play_arrow_outlined)),
    );
  }
}

class Square extends StatelessWidget {
  const Square({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      color: Colors.blue,
    );
  }
}
