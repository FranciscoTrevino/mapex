/*
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: kIsWeb ? WebMapPage() : AndroidiOSMapPage(),
    );
  }
}

class WebMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa en la Web"),
      ),
      // Agregar aquí el mapa para la web.
    );
  }
}

class AndroidiOSMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa en Android/iOS"),
      ),
      // Agregar aquí el mapa para Android e iOS.
    );
  }
}*/

/*
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapWebView(),
    );
  }
}

class MapWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Ejemplo'),
      ),
      body: const WebView(
        initialUrl: 'https://www.google.com/maps', // URL de Google Maps u otro servicio de mapas
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}*/

/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapsPage(),
    );
  }
}

class MapsPage extends StatelessWidget {
  static String id = 'maps_page';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerCashVolt(),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButtonDrawer(
                onPressed: () {
                  final scaffoldState = _scaffoldKey.currentState;
                  if (scaffoldState != null) {
                    scaffoldState.openDrawer();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerCashVolt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define el contenido de tu cajón (drawer) aquí
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Opción 1'),
            onTap: () {
              // Acción al hacer clic en la opción 1
            },
          ),
          ListTile(
            title: Text('Opción 2'),
            onTap: () {
              // Acción al hacer clic en la opción 2
            },
          ),
        ],
      ),
    );
  }
}

class IconButtonDrawer extends StatelessWidget {
  final VoidCallback onPressed;

  IconButtonDrawer({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.menu),
    );
  }
}
*/



import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RouteMap(),
    );
  }
}

class RouteMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trazar Rutas en una Imagen'),
      ),
      body: Stack(
        children: <Widget>[
          // Imagen de fondo (puedes usar AssetImage o NetworkImage)
          Image.asset('assets/mapa.jpg'),

          // Ejemplo de trazar una ruta desde el punto (100, 150)
          CustomPaint(
            painter: RoutePainter(),
          ),
        ],
      ),
    );
  }
}

class RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke  // Establece el estilo de dibujo en línea
      ..strokeWidth = 3.0;

    final path = Path();
    path.moveTo(190, 180);  // Punto de inicio

    // En esta parte es donde cambias los puntos por donde pasa la línea
    final List<Offset> controlPoints = [
      const Offset(200, 170),
      const Offset(200, 165),
      const Offset(220, 180),
      const Offset(220, 185),
      const Offset(230, 170),
      const Offset(232, 160),
      const Offset(240, 160),
      const Offset(250, 160),
      const Offset(260, 162),
      const Offset(270, 162),
      const Offset(280, 164),
      const Offset(284, 164.5),
      const Offset(287, 162),
      const Offset(288, 162),
      const Offset(289, 161),
      const Offset(290, 161),
      const Offset(292, 157),
      const Offset(294, 154),
      const Offset(294, 151),
      const Offset(294, 147),
      const Offset(294, 137),

    ];

    // Genera la línea curva
    for (double t = 0.0; t <= 1.0; t += 0.01) {
      final point = _getPointOnCurve(controlPoints, t);
      path.lineTo(point.dx, point.dy);
    }

    canvas.drawPath(path, paint);
  }

  Offset _getPointOnCurve(List<Offset> controlPoints, double t) {
    // Calcula el punto en la curva de Bezier utilizando los puntos de control
    final x = _bezierPoint(t, controlPoints.map((p) => p.dx).toList());
    final y = _bezierPoint(t, controlPoints.map((p) => p.dy).toList());
    return Offset(x, y);
  }

  double _bezierPoint(double t, List<double> points) {
    final n = points.length - 1;
    double result = 0.0;
    for (int i = 0; i <= n; i++) {
      final binomial = _binomialCoefficient(n, i);
      result +=
          binomial * pow(1 - t, n - i) * pow(t, i) * points[i];
    }
    return result;
  }

  int _binomialCoefficient(int n, int k) {
    return _factorial(n) ~/ (_factorial(k) * _factorial(n - k));
  }

  int _factorial(int n) {
    if (n <= 1) return 1;
    return n * _factorial(n - 1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
