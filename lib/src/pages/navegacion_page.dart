import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar( 
          title: const Text('Notifications Page'),
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        ),
          floatingActionButton: BotonFlotante(),
          bottomNavigationBar: BottomNavigation(),
         ),
    );
  }
}

class BotonFlotante extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      onPressed: (){
        final notiModel = Provider.of<_NotificationModel>(context, listen: false);

        int numeroOnPressed = notiModel.numero;
        numeroOnPressed++;
        notiModel.numero = numeroOnPressed;

        if (numeroOnPressed >= 2) {
          final controller = notiModel.bounceController;
          controller.forward(from: 0.0);
        }
      }
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final int numeroNotificaciones = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone), 
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack( 
            children: [ 
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                //child: Icon(Icons.brightness_1, size: 8, color: Colors.pink)
                child: BounceInDown(
                  from: 10,
                  animate: (numeroNotificaciones > 0) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                    child: Container( 
                      child: Text('$numeroNotificaciones', style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.bold)),
                      alignment: Alignment.center,
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration( 
                        color: Colors.pink,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
              )
            ],
          ) 
        ),
        BottomNavigationBarItem(
          label: 'Mi perro',
          icon: FaIcon(FontAwesomeIcons.dog), 
        ),
      ]
    );
  }
}

class _NotificationModel extends ChangeNotifier {

  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => _numero;

  set numero (int valor) {
    _numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;

  set bounceController (AnimationController controller) {
    _bounceController = controller;
  }
}



