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
  final List<String> options1 = ['Opción 1', 'Opción 2'];
  final List<String> options2 = ['Opción A', 'Opción B'];
  String selectedOption1 = 'Opción 1'; // Opción predeterminada
  String selectedOption2 = 'Opción A'; // Opción predeterminada
  late List<Offset> controlPoints;
  late Offset startPoint; // Punto de inicio

  @override
  void initState() {
    super.initState();
    updateControlPoints();
  }

  void updateControlPoints() {
    setState(() {
      if (selectedOption1 == 'Opción 1' && selectedOption2 == 'Opción A') {
        controlPoints = [
          // Puntos para la combinación Opción 1 y Opción A
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
          const Offset(294, 130),

          // Añade más puntos aquí según tu necesidad
        ];
        startPoint = const Offset(190, 180); // Punto de inicio para esta combinación
      } else if (selectedOption1 == 'Opción 1' && selectedOption2 == 'Opción B') {
        controlPoints = [
          // Puntos para la combinación Opción 1 y Opción B
          const Offset(260, 127),  // Ajusta la ubicación del punto de inicio
          const Offset(260, 180),
          const Offset(270, 190),
          // Añade más puntos aquí según tu necesidad
        ];
        startPoint = const Offset(294, 130); // Punto de inicio para esta combinación
      } else if (selectedOption1 == 'Opción 2' && selectedOption2 == 'Opción A') {
        controlPoints = [
          // Puntos para la combinación Opción 2 y Opción A
          const Offset(250, 170),  // Ajusta la ubicación del punto de inicio
          const Offset(260, 180),
          const Offset(270, 190),
        ];
        startPoint = const Offset(150, 160); // Punto de inicio para esta combinación
      } else if (selectedOption1 == 'Opción 2' && selectedOption2 == 'Opción B') {
        controlPoints = [
          // Puntos para la combinación Opción 2 y Opción B
          const Offset(200, 170),
          const Offset(200, 165),
          const Offset(220, 180),
        ];
        startPoint = const Offset(180, 170); // Punto de inicio para esta combinación
      }
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
                      updateControlPoints();
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
                      updateControlPoints();
                    });
                  }
                },
              ),
            ],
          ),
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
          Text("Las opciones con numeros son el inicio y las opciones con letra son el final"),
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

    // Genera la línea curva
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
