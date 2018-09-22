import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TurismoTFG',
      theme: new ThemeData(primaryColor: Color(0xFF760F31)),
      home: new MyHomePage(),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', 'ES')
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            centerTitle: true,
            title: Image.asset('assets/logo_gf_color.png',
              color: Colors.brown,),
            bottom: TabBar(
              tabs: [
                Tab(icon: Text("Experiencias")),
                Tab(icon: Text("Monumentos")),
              ],
              indicatorWeight: 2.0,
              indicatorColor: Colors.white,
            ),
            actions: <Widget>[
              PopupMenuButton(
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  new PopupMenuItem<String>(
                      child: const Text('Sobre nosotros'),
                      value: 'Sobre nosotros'),
                  new PopupMenuItem<String>(
                      child: const Text('Contacto'), value: 'Contacto'),
                  new PopupMenuItem<String>(
                      child: const Text('Salir'), value: 'Salir'),
                ],
                onSelected: (String item) {
                  switch (item) {
                    case 'Sobre nosotros':
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: true,
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (BuildContext context, _, __) {
                           // return SobreNosotros();
                          },
                          //Transición con el efecto de aparición (Fade)
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return new FadeTransition(
                              opacity: new Tween<double>(
                                begin: 0.0,
                                end: 1.0,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Interval(
                                    0.00,
                                    0.50,
                                    curve: Curves.linear,
                                  ),
                                ),
                              ),
                              child: child,
                            );
                          }));
                      break;
                    case 'Contacto':
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: true,
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (BuildContext context, _, __) {
                   //         return Contacto();
                          },
                          //Transición con el efecto de aparición (Fade)
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return new FadeTransition(
                              opacity: new Tween<double>(
                                begin: 0.0,
                                end: 1.0,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Interval(
                                    0.00,
                                    0.50,
                                    curve: Curves.linear,
                                  ),
                                ),
                              ),
                              child: child,
                            );
                          }));
                      break;
                    case 'Salir':
                      exit(0);
                      break;
                  }
                },
              )
            ],
          ),
          body: TabBarView(
            children: [
              Icon(Icons.explore),
             // ListaExperiencias(),
              Icon(Icons.directions_transit)
            ],
          ),
        ));
  }
}
