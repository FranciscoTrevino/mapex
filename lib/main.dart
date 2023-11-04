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
  final List<String> options1 = ['Animales', 'Opción 2'];
  final List<String> options2 = ['Restaurante', 'Opción B'];
  final List<String> options3 = ['Ninguna', 'Evento 1', 'Opción Y']; // Tercer Dropdown con opciones extendidas
  String selectedOption1 = 'Animales'; // Opción predeterminada
  String selectedOption2 = 'Restaurante'; // Opción predeterminada
  String selectedOption3 = 'Ninguna'; // Opción predeterminada para el tercer Dropdown
  late List<Offset> controlPoints;
  late Offset startPoint; // Punto de inicio

  @override
  void initState() {
    super.initState();
    updateControlPoints();
  }

  void updateControlPoints() {
    setState(() {
      if (selectedOption1 == 'Animales' && selectedOption2 == 'Restaurante') {
        controlPoints = [
          // Puntos para la combinación Opción 1 y Opción A
          const Offset(165, 110),
          const Offset(167, 115),
          const Offset(180, 101),
          const Offset(185, 90),
          const Offset(230, 120),
          const Offset(230, 120),
          const Offset(230, 120),
          const Offset(245, 120),
          const Offset(245, 112),
          const Offset(245, 112),
          const Offset(260, 125),
          const Offset(260, 128),
          const Offset(260, 128),
          const Offset(290, 127),


          if (selectedOption3 != 'Ninguna') ...[
            // Agrega puntos adicionales si se elige algo en el tercer Dropdown
            const Offset(280, 162),
            const Offset(290, 162),
            const Offset(300, 162),
          ],
        ];
        startPoint = (selectedOption3 == 'Ninguna') ? Offset(160, 105) : Offset(190, 180);
      } else if (selectedOption1 == 'Animales' && selectedOption2 == 'Opción B') {
        controlPoints = [
          // Puntos para la combinación Opción 1 y Opción B
          const Offset(260, 127),
          const Offset(260, 180),
          const Offset(270, 190),
          if (selectedOption3 != 'Ninguna' && selectedOption3 == 'Evento 1') ...[
            const Offset(280, 190),
            const Offset(290, 190),
            const Offset(300, 190),
          ],
          if (selectedOption3 != 'Ninguna' && selectedOption3 == 'Opción Y') ...[
            const Offset(290, 190),
            const Offset(300, 190),
            const Offset(320, 190),
          ]
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
                      updateControlPoints();
                    });
                  }
                },
              ),
            ],
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
