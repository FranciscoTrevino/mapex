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

class RouteMap extends StatefulWidget {
  @override
  _RouteMapState createState() => _RouteMapState();
}

class _RouteMapState extends State<RouteMap> {
  final List<String> options1 = ['Zona 1a', 'Zona 2a'];
  final List<String> options2 = ['Zona 1b', 'Zona 2b'];
  final List<String> options3 = ['Ninguna', 'Zona 1c', 'Zona 2c']; // Tercer Dropdown con opciones extendidas
  String selectedOption1 = 'Zona 1a'; // Opción predeterminada
  String selectedOption2 = 'Zona 1b'; // Opción predeterminada
  String selectedOption3 = 'Ninguna'; // Opación predeterminada para el tercer Dropdown
  late List<Offset> controlPoints;
  late Offset startPoint; // Punto de inicio

  @override
  void initState() {
    super.initState();
    updateControlPoints();
  }

  void updateControlPoints() {
    setState(() {
      if(selectedOption2 != 'Ninguna') {
      if (selectedOption1 == 'Zona 1a') {
        controlPoints = [
          // Puntos para la combinación Opción 1 y Opción A
          const Offset(173, 330),
          const Offset(173, 330),
          const Offset(170, 320),
          const Offset(170, 320),


            if (selectedOption2 == 'Zona 1b') ...[
              const Offset(166, 308),
              const Offset(130, 290),
              const Offset(123, 270),
              const Offset(123, 270),
              const Offset(123, 270),
              const Offset(110, 250),
            ],

            if (selectedOption2 == 'Zona 2b') ...[
              const Offset(207, 307),
            ],


      if (selectedOption3 != 'Ninguna') ...[
      // Agrega puntos adicionales si se elige algo en el tercer Dropdown
        if (selectedOption3 == 'Zona 1c') ...[
        const Offset(290, 127),
        const Offset(290, 127),
        const Offset(290, 110),
        const Offset(284, 107),
        const Offset(279, 104),
        const Offset(277, 100),
        const Offset(277, 100),
        const Offset(294, 83),
        ],
      ],

      ];
        startPoint = (selectedOption3 == 'Ninguna') ? Offset(160, 355) : Offset(160, 355);
      } }else if (selectedOption1 == 'Zona 1a' && selectedOption2 == 'Zona 2b') {
        controlPoints = [
          // Puntos para la combinación Zona 1a y Zona 2b
          const Offset(260, 127),
          const Offset(260, 180),
          const Offset(270, 190),
        ];
        startPoint = (selectedOption3 == 'Ninguna') ? Offset(294, 130) : Offset(294, 130);
      }
      // Agrega más combinaciones y ajusta las coordenadas de acuerdo a tus necesidades
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trazar Rutas en una Imagen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                // Imagen de fondo (puedes usar AssetImage o NetworkImage)
                Image.asset('assets/mapa.jpg'),

                // Ejemplo de trazar una ruta desde el punto de inicio
                CustomPaint(
                  painter: RoutePainter(controlPoints, startPoint),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: selectedOption1,
                items: options1.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedOption1 = newValue;
                    });
                  }
                },
              ),
              SizedBox(width: 16.0),
              DropdownButton<String>(
                value: selectedOption2,
                items: options2.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedOption2 = newValue;
                    });
                  }
                },
              ),
              SizedBox(width: 16.0),
              DropdownButton<String>(
                value: selectedOption3,
                items: options3.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selectedOption3 = newValue;
                    });
                  }
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              updateControlPoints();
            },
            child: Text('Dibujar Offset'),
          ),
          Text("Las opciones con números son el inicio y las opciones con letras son el final"),
        ],
      ),
    );
  }
}

class RoutePainter extends CustomPainter {
  final List<Offset> controlPoints;
  final Offset startPoint;

  RoutePainter(this.controlPoints, this.startPoint);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);  // Punto de inicio

    for (double t = 0.0; t <= 1.0; t += 0.01) {
      final point = _getPointOnCurve(controlPoints, t);
      path.lineTo(point.dx, point.dy);
    }

    canvas.drawPath(path, paint);
  }

  Offset _getPointOnCurve(List<Offset> controlPoints, double t) {
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
