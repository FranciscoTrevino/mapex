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
  final List<String> options1 = ['Savanna Hall', 'Wieland Zone', 'World of Wildlife Theater'];
  final List<String> options2 = ['Restaurante', 'Baños', 'Souvenirs'];
  final List<String> options3 = ['Ninguna', 'Zona 1c'];
  String selectedOption1 = 'Savanna Hall';
  String selectedOption2 = 'Restaurante';
  String selectedOption3 = 'Ninguna';
  late List<Offset> controlPoints;
  late Offset startPoint;
  bool drawOffsets = false;

  @override
  void initState() {
    super.initState();
    updateControlPoints();
  }

  void updateControlPoints() {
    setState(() {
      if (selectedOption1 == 'Savanna Hall') {
        controlPoints = [
          const Offset(173, 330),
          const Offset(173, 330),
          const Offset(170, 320),
          const Offset(170, 320),
          if (selectedOption2 == 'Restaurante') ...[
            const Offset(166, 308),
            const Offset(130, 290),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(110, 250),
          ],
          if (selectedOption2 == 'Baños') ...[
            const Offset(166, 308),
            const Offset(130, 290),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(122, 242),
          ],
          if (selectedOption3 != 'Ninguna' && selectedOption3 == 'Zona 1c') ...[
            const Offset(290, 127),
            const Offset(290, 127),
            const Offset(290, 110),
            const Offset(284, 107),
            const Offset(279, 104),
            const Offset(277, 100),
            const Offset(277, 100),
            const Offset(294, 83),
          ],
          if (selectedOption2 == 'Souvenirs') ...[
            const Offset(166, 312),
            const Offset(206, 304),
            const Offset(206, 300),
            const Offset(206, 300),
            const Offset(206, 300),
            const Offset(246, 344),
          ],
        ];
        startPoint = (selectedOption1 == 'Savanna Hall') ? const Offset(160, 355) : const Offset(160, 355);
      } else if (selectedOption1 == 'Wieland Zone') {
        controlPoints = [
          if (selectedOption2 == 'Restaurante') ...[
            const Offset(294, 230),
            const Offset(310, 216),
            const Offset(313, 196),
            const Offset(313, 196),
            const Offset(313, 186),
            const Offset(313, 186),
            const Offset(290, 166),
            const Offset(275, 151),
            const Offset(275, 136),
          ],
          if (selectedOption2 == 'Baños') ...[
            const Offset(274, 242),
            const Offset(276, 252),
            const Offset(290, 263),
          ],
          if (selectedOption2 == 'Souvenirs') ...[
            const Offset(294, 230),
            const Offset(310, 216),
            const Offset(313, 196),
            const Offset(313, 196),
            const Offset(313, 186),
            const Offset(313, 186),
            const Offset(290, 166),
            const Offset(252, 115),
            const Offset(252, 115),
            const Offset(252, 115),
            const Offset(250, 140),
            const Offset(248, 138),
            const Offset(248, 138),
            const Offset(245, 135),
            const Offset(240, 135),


          ],
        ];
        startPoint = (selectedOption1 == 'Wieland Zone') ? const Offset(294, 247) : const Offset(294, 247);
      } else if (selectedOption1 == 'World of Wildlife Theater') {
        controlPoints = [
          if (selectedOption2 == 'Restaurante') ...[
            const Offset(205, 210),
            const Offset(200, 220),
            const Offset(190, 230),
          ],
          if (selectedOption2 == 'Baños') ...[
            const Offset(210, 190),
            const Offset(277, 120),
          ],
          if (selectedOption2 == 'Souvenirs') ...[
            const Offset(210, 190),
            const Offset(225, 170),
            const Offset(225, 140),
            const Offset(225, 140),
            const Offset(230, 135),
            const Offset(235, 130),
            const Offset(238, 132),
          ],
        ];
        startPoint = (selectedOption3 == 'Ninguna') ? const Offset(200, 190) : const Offset(200, 190);
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
          Expanded(
            child: Stack(
              children: <Widget>[
                Image.asset('assets/mapa.jpg'),
                if (drawOffsets)
                  CustomPaint(
                    painter: RoutePainter(controlPoints, startPoint),
                  ),
              ],
            ),
          ),
          Column(
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
                      drawOffsets = false; // Resetear el dibujo al cambiar las opciones
                    });
                  }
                },
              ),
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
                      drawOffsets = false; // Resetear el dibujo al cambiar las opciones
                    });
                  }
                },
              ),
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
                      drawOffsets = false; // Resetear el dibujo al cambiar las opciones
                    });
                  }
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                drawOffsets = true; // Activar el dibujo al presionar el botón
              });
            },
            child: const Text('Dibujar Offset'),
          ),
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
