import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate_do'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [ 
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TwitterPage())); 
            }, 
          ),

          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => Pagina1Page()));
            }, 
          ),
        ],
      ),

      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          child: FaIcon(FontAwesomeIcons.play),
          onPressed:  (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavegacionPage()));            
          }
        ),
      ),

      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            ElasticIn(
              delay: Duration(milliseconds: 1200),
              child: Icon(Icons.new_releases, color: Colors.teal, size: 40,)),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text('Titulo', style: TextStyle( fontSize: 40, fontWeight: FontWeight.w200))
            ),
            FadeInDown(
              delay: Duration(milliseconds: 1000),
              child: Text('Soy un texto pequeño', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400))
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container( 
                width: 250,
                height: 2,
                color: Colors.teal
              ),
            )
          ],
        ),
      )
   );
  }
}