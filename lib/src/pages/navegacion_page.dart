import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('Notification Page',
              style: TextStyle(color: Colors.white)),
        ),
        floatingActionButton: const BotonFlotante(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        //FaIcon(FontAwesomeIcons.bell)
        const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone), label: 'bone'),
        BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                const FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: BounceInDown(
                    from: 10,
                    animate: (numero > 0) ? true : false,
                    child: Bounce(
                      controller: (controller) =>
                          Provider.of<_NotificationModel>(context)
                              ._bounceController = controller,
                      from: 10,
                      child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                              color: Colors.redAccent, shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: Text('$numero',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 7,
                                  fontWeight: FontWeight.w600))),
                    ),
                  ),
                  // child: Icon(Icons.brightness_1,
                  //     size: 8, color: Colors.redAccent),
                )
              ],
            ),
            label: 'Notification'),
        const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog), label: 'My dog'),
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: const FaIcon(FontAwesomeIcons.play, color: Colors.white),
      onPressed: () {
        final notiModel =
            Provider.of<_NotificationModel>(context, listen: false);

        int numero = notiModel.numero;
        numero++;
        notiModel.numero = numero;

        if (numero >= 2) {
          final controller = notiModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => _numero;
  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;
  set bounceController(AnimationController controller) {
    _bounceController = controller;
    notifyListeners();
  }
}
