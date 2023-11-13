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
  final List<String> options1 = ['Savanna Hall', 'Wieland Zone', 'World of Wildlife Theater', 'Ford Pavilion', 'Flamingo Plaza', 'Amy´s Tree Theater', 'Gorilla Deck'];
  final List<String> options2 = ['Restaurante', 'Baños', 'Savanna Hall', 'Wieland Zone', 'World of Wildlife Theater', 'Ford Pavilion', 'Flamingo Plaza', 'Amy´s Tree Theater', 'Gorilla Deck'];
  String selectedOption1 = 'Savanna Hall';
  String selectedOption2 = 'Restaurante';
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

      if (selectedOption1 == selectedOption2){
        controlPoints = [
          startPoint = const Offset(0, 0)
        ];
      } else

      if (selectedOption1 == 'Savanna Hall') {
        controlPoints = [
          const Offset(173, 330),
          const Offset(173, 330),
          const Offset(170, 320),
          const Offset(165, 315),
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


          if (selectedOption2 == 'Wieland Zone') ...[
            const Offset(166, 312),
            const Offset(206, 304),
            const Offset(226, 300),
            const Offset(226, 300),
            const Offset(190, 260),
            const Offset(205, 215),
            const Offset(205, 215),
            const Offset(210, 200),
            const Offset(210, 200),
            const Offset(225, 240),
            const Offset(225, 240),
            const Offset(225, 248),
            const Offset(225, 248),
            const Offset(250, 230),
            const Offset(250, 230),
            const Offset(300, 250),
          ],

          if (selectedOption2 == 'World of Wildlife Theater') ...[
            const Offset(166, 312),
            const Offset(206, 304),
            const Offset(226, 300),
            const Offset(226, 300),
            const Offset(190, 260),
            const Offset(205, 185),
          ],

          if (selectedOption2 == 'Ford Pavilion') ...[
            const Offset(166, 312),
            const Offset(206, 304),
            const Offset(226, 300),
            const Offset(226, 300),
            const Offset(190, 260),
            const Offset(190, 260),
            const Offset(205, 230),
            const Offset(205, 200),
            const Offset(205, 200),
            const Offset(220, 170),
            const Offset(230, 160),
            const Offset(250, 150),
            const Offset(260, 140),
            const Offset(260, 140),
            const Offset(290, 140),
          ],

          if(selectedOption2 == 'Flamingo Plaza') ...[
            const Offset(166, 312),
            const Offset(206, 290),
            const Offset(206, 290),
            const Offset(230, 328),
          ],

          if (selectedOption2 == 'Amy´s Tree Theater') ...[
            const Offset(166, 308),
            const Offset(130, 290),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(130, 205),
          ],

          if (selectedOption2 == 'Gorilla Deck') ...[
            const Offset(166, 308),
            const Offset(130, 290),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(126, 210),
            const Offset(126, 210),
            const Offset(110, 190),
            const Offset(110, 190),
            const Offset(123, 180),
            const Offset(123, 170),
            const Offset(95, 170),
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


          if (selectedOption2 == 'Savanna Hall') ...[
            const Offset(300, 250),
            const Offset(250, 230),
            const Offset(250, 230),
            const Offset(225, 248),
            const Offset(225, 248),
            const Offset(225, 240),
            const Offset(225, 240),
            const Offset(210, 200),
            const Offset(210, 200),
            const Offset(205, 215),
            const Offset(205, 215),
            const Offset(190, 260),
            const Offset(226, 300),
            const Offset(226, 300),
            const Offset(206, 304),
            const Offset(166, 312),
            const Offset(165, 315),
            const Offset(170, 320),
            const Offset(173, 330),
            const Offset(173, 330),
            const Offset(160, 355)
          ],
          if (selectedOption2 == 'World of Wildlife Theater') ...[
            const Offset(294, 230),
            const Offset(310, 216),
            const Offset(313, 196),
            const Offset(313, 196),
            const Offset(313, 186),
            const Offset(313, 186),
            const Offset(290, 166),
            const Offset(275, 151),
            const Offset(257, 133),
            const Offset(257, 133),
            const Offset(247, 153),
            const Offset(197, 193),
          ],
          if (selectedOption2 == 'Ford Pavilion') ...[
            const Offset(294, 230),
            const Offset(310, 216),
            const Offset(313, 196),
            const Offset(303, 196),
            const Offset(313, 186),
            const Offset(313, 186),
            const Offset(280, 166),
            const Offset(295, 160),

          ],
          if (selectedOption2 == 'Flamingo Plaza') ...[
            const Offset(294, 247),
            const Offset(274, 242),
            const Offset(276, 252),
            const Offset(276, 263),
            const Offset(256, 268),
            const Offset(246, 272),
            const Offset(246, 272),
            const Offset(228, 292),
            const Offset(228, 302),
            const Offset(228, 312),
            const Offset(288, 310),
            const Offset(288, 310),
            const Offset(228, 340),
          ],
          if (selectedOption2 == 'Amy´s Tree Theater') ...[
            const Offset(294, 230),
            const Offset(310, 216),
            const Offset(313, 196),
            const Offset(333, 196),
            const Offset(283, 166),
            const Offset(283, 166),
            const Offset(270, 90),
            const Offset(270, 90),
            const Offset(225, 210),
            const Offset(225, 210),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(205, 105),
            const Offset(190, 105),
            const Offset(190, 125),
            const Offset(160, 130),
            const Offset(150, 150),
            const Offset(120, 160),
            const Offset(105, 160),
            const Offset(130, 220),
          ],
          if (selectedOption2 == 'Gorilla Deck') ...[
            const Offset(294, 230),
            const Offset(310, 216),
            const Offset(313, 196),
            const Offset(333, 196),
            const Offset(283, 166),
            const Offset(283, 166),
            const Offset(270, 90),
            const Offset(270, 90),
            const Offset(225, 210),
            const Offset(225, 210),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(205, 105),
            const Offset(190, 105),
            const Offset(190, 125),
            const Offset(160, 130),
            const Offset(150, 150),
            const Offset(120, 160),
            const Offset(120, 160),
            const Offset(100, 180),
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
            const Offset(254, 110),
          ],

          if (selectedOption2 == 'Savanna Hall') ...[
            const Offset(205, 185),
            const Offset(190, 260),
            const Offset(226, 300),
            const Offset(226, 300),
            const Offset(206, 304),
            const Offset(166, 312),
            const Offset(165, 315),
            const Offset(170, 320),
            const Offset(173, 330),
            const Offset(173, 330),
            const Offset(160, 355),
            ],
          if (selectedOption2 == 'Wieland Zone') ...[
            const Offset(197, 193),
            const Offset(247, 153),
            const Offset(257, 133),
            const Offset(257, 133),
            const Offset(275, 151),
            const Offset(290, 166),
            const Offset(313, 186),
            const Offset(313, 186),
            const Offset(313, 196),
            const Offset(313, 196),
            const Offset(310, 216),
            const Offset(274, 230),
            const Offset(294, 247),
          ],
          if (selectedOption2 == 'Ford Pavilion') ...[
            const Offset(197, 193),
            const Offset(247, 153),
            const Offset(257, 133),
            const Offset(257, 133),
            const Offset(275, 151),
            const Offset(290, 151),
          ],
          if (selectedOption2 == 'Flamingo Plaza') ...[
            const Offset(205, 185),
            const Offset(190, 260),
            const Offset(226, 300),
            const Offset(206, 300),
            const Offset(206, 300),
            const Offset(226, 330),
          ],
          if (selectedOption2 == 'Amy´s Tree Theater') ...[
            const Offset(205, 185),
            const Offset(190, 260),
            const Offset(226, 300),
            const Offset(226, 300),
            const Offset(206, 304),
            const Offset(166, 312),
            const Offset(165, 315),
            const Offset(166, 308),
            const Offset(130, 290),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(130, 205),
          ],
          if (selectedOption2 == 'Gorilla Deck') ...[
            const Offset(205, 185),
            const Offset(190, 260),
            const Offset(226, 300),
            const Offset(226, 300),
            const Offset(206, 304),
            const Offset(166, 312),
            const Offset(165, 315),
            const Offset(166, 308),
            const Offset(130, 290),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(130, 205),
            const Offset(126, 210),
            const Offset(110, 190),
            const Offset(110, 190),
            const Offset(123, 180),
            const Offset(123, 170),
            const Offset(95, 170),
          ],

        ];
        startPoint = (selectedOption1 == 'World of Wildlife Theater') ? const Offset(200, 190) : const Offset(200, 190);

      } else if (selectedOption1 == 'Ford Pavilion'){
        controlPoints = [
          if (selectedOption2 == 'Restaurante') ...[
            const Offset(290, 120)
          ],
          if (selectedOption2 == 'Baños') ...[
            const Offset(256, 111)
          ],

          if (selectedOption2 == 'Savanna Hall') ...[
            const Offset(290, 140),
            const Offset(260, 140),
            const Offset(260, 140),
            const Offset(250, 150),
            const Offset(230, 160),
            const Offset(220, 170),
            const Offset(205, 200),
            const Offset(205, 200),
            const Offset(205, 230),
            const Offset(190, 260),
            const Offset(190, 260),
            const Offset(226, 300),
            const Offset(226, 300),
            const Offset(206, 304),
            const Offset(166, 312),
            const Offset(165, 315),
            const Offset(170, 320),
            const Offset(173, 330),
            const Offset(173, 330),
            const Offset(160, 355),
          ],
          if (selectedOption2 == 'Wieland Zone') ...[
            const Offset(295, 160),
            const Offset(280, 166),
            const Offset(313, 186),
            const Offset(313, 186),
            const Offset(303, 196),
            const Offset(313, 196),
            const Offset(310, 216),
            const Offset(274, 230),
            const Offset(294, 247)
          ],
          if (selectedOption2 == 'World of Wildlife Theater') ...[
            const Offset(290, 140),
            const Offset(275, 151),
            const Offset(257, 133),
            const Offset(257, 133),
            const Offset(247, 153),
            const Offset(197, 193),
          ],
          if (selectedOption2 == 'Flamingo Plaza') ...[
            const Offset(290, 140),
            const Offset(260, 140),
            const Offset(260, 140),
            const Offset(250, 150),
            const Offset(230, 160),
            const Offset(220, 170),
            const Offset(205, 200),
            const Offset(205, 200),
            const Offset(205, 230),
            const Offset(190, 260),
            const Offset(190, 260),
            const Offset(226, 300),
            const Offset(196, 300),
            const Offset(236, 330),
          ],
          if (selectedOption2 == 'Amy´s Tree Theater') ...[
            const Offset(290, 151),
            const Offset(275, 151),
            const Offset(257, 133),
            const Offset(257, 133),
            const Offset(237, 153),
            const Offset(197, 193),
            const Offset(185, 185),
            const Offset(190, 260),
            const Offset(236, 310),
            const Offset(226, 315),
            const Offset(206, 324),
            const Offset(166, 322),
            const Offset(165, 325),
            const Offset(166, 318),
            const Offset(130, 290),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(130, 205),
          ],
          if (selectedOption2 == 'Gorilla Deck') ...[
            const Offset(283, 146),
            const Offset(270, 130),
            const Offset(270, 90),
            const Offset(225, 210),
            const Offset(225, 210),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(205, 105),
            const Offset(190, 105),
            const Offset(190, 125),
            const Offset(160, 130),
            const Offset(150, 150),
            const Offset(120, 160),
            const Offset(120, 160),
            const Offset(100, 180),
          ],

        ];
        startPoint = (selectedOption1 == 'Ford Pavilion') ? const Offset(290, 140) : const Offset (290, 140);

      } else if (selectedOption1 == 'Flamingo Plaza'){
        controlPoints = [
          if (selectedOption2 == 'Restaurante') ...[
            const Offset(226, 330),
            const Offset(206, 300),
            const Offset(206, 300),
            const Offset(226, 300),
            const Offset(190, 260),
            const Offset(195, 230),
          ],
          if (selectedOption2 == 'Baños') ...[
            const Offset(260, 328),
          ],

          if (selectedOption2 == 'Savanna Hall') ...[
            const Offset(230, 328),
            const Offset(206, 290),
            const Offset(206, 290),
            const Offset(166, 312),
            const Offset(165, 315),
            const Offset(170, 320),
            const Offset(173, 330),
            const Offset(173, 330),
            const Offset(160, 355),
          ],
          if (selectedOption2 == 'Wieland Zone') ...[
            const Offset(228, 330),
            const Offset(288, 310),
            const Offset(288, 310),
            const Offset(228, 312),
            const Offset(228, 302),
            const Offset(228, 292),
            const Offset(246, 272),
            const Offset(246, 272),
            const Offset(256, 268),
            const Offset(276, 263),
            const Offset(276, 252),
            const Offset(274, 242),
            const Offset(294, 247),
          ],
          if (selectedOption2 == 'World of Wildlife Theater') ...[
            const Offset(226, 330),
            const Offset(206, 300),
            const Offset(206, 300),
            const Offset(226, 300),
            const Offset(190, 260),
            const Offset(205, 185),
          ],
          if (selectedOption2 == 'Ford Pavilion') ...[
            const Offset(236, 330),
            const Offset(196, 300),
            const Offset(226, 300),
            const Offset(190, 260),
            const Offset(190, 260),
            const Offset(205, 230),
            const Offset(205, 200),
            const Offset(205, 200),
            const Offset(220, 170),
            const Offset(230, 160),
            const Offset(250, 150),
            const Offset(260, 140),
            const Offset(260, 140),
            const Offset(290, 140),

          ],
          if (selectedOption2 == 'Amy´s Tree Theater') ...[
            const Offset(230, 328),
            const Offset(206, 290),
            const Offset(206, 290),
            const Offset(166, 322),
            const Offset(166, 318),
            const Offset(130, 300),
            const Offset(123, 280),
            const Offset(123, 280),
            const Offset(123, 270),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(130, 205),
          ],
          if (selectedOption2 == 'Gorilla Deck') ...[
            const Offset(230, 328),
            const Offset(206, 290),
            const Offset(206, 290),
            const Offset(166, 322),
            const Offset(166, 318),
            const Offset(130, 300),
            const Offset(123, 280),
            const Offset(123, 280),
            const Offset(123, 270),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(130, 205),
            const Offset(110, 190),
            const Offset(110, 190),
            const Offset(123, 180),
            const Offset(123, 170),
            const Offset(95, 170),
          ],

        ];
        startPoint = (selectedOption1 == 'Flamingo Plaza') ? const Offset(230, 328) : const Offset(230, 328);

      } else if (selectedOption1 == 'Amy´s Tree Theater'){
        controlPoints = [
          if (selectedOption2 == 'Restaurante') ...[
            const Offset(130, 205),
            const Offset(108, 250),
            const Offset(108, 250),

          ],
          if (selectedOption2 == 'Baños') ...[
            const Offset(130, 205),
            const Offset(117, 240),
            const Offset(127, 245),
          ],

          if (selectedOption2 == 'Savanna Hall') ...[
            const Offset(130, 205),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(130, 290),
            const Offset(166, 308),
            const Offset(165, 315),
            const Offset(170, 320),
            const Offset(173, 330),
            const Offset(173, 330),
            const Offset(160, 355),
          ],
          if (selectedOption2 == 'Wieland Zone') ...[
            const Offset(120, 205),
            const Offset(120, 160),
            const Offset(150, 150),
            const Offset(160, 130),
            const Offset(190, 125),
            const Offset(190, 105),
            const Offset(205, 105),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(225, 210),
            const Offset(270, 90),
            const Offset(270, 90),
            const Offset(283, 166),
            const Offset(283, 166),
            const Offset(333, 196),
            const Offset(313, 196),
            const Offset(310, 216),
            const Offset(274, 230),
            const Offset(294, 247),
          ],
          if (selectedOption2 == 'World of Wildlife Theater') ...[
            const Offset(130, 205),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(130, 290),
            const Offset(166, 308),
            const Offset(165, 315),
            const Offset(166, 312),
            const Offset(206, 304),
            const Offset(226, 300),
            const Offset(226, 300),
            const Offset(190, 260),
            const Offset(205, 185),

          ],
          if (selectedOption2 == 'Ford Pavilion') ...[
            const Offset(130, 205),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(130, 290),
            const Offset(166, 318),
            const Offset(165, 325),
            const Offset(166, 322),
            const Offset(206, 324),
            const Offset(226, 315),
            const Offset(236, 310),
            const Offset(190, 260),
            const Offset(185, 185),
            const Offset(197, 193),
            const Offset(237, 153),
            const Offset(257, 133),
            const Offset(257, 133),
            const Offset(275, 151),
            const Offset(290, 151),

          ],
          if (selectedOption2 == 'Flamingo Plaza') ...[
            const Offset(130, 205),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(123, 270),
            const Offset(123, 280),
            const Offset(123, 280),
            const Offset(130, 300),
            const Offset(166, 318),
            const Offset(166, 322),
            const Offset(206, 290),
            const Offset(206, 290),
            const Offset(230, 328),
          ],
          if (selectedOption2 == 'Gorilla Deck') ...[
            const Offset(120, 215),
            const Offset(120, 160),
            const Offset(100, 170),
          ],

        ];
        startPoint = (selectedOption1 == 'Amy´s Tree Theater') ? const Offset(130, 205) : const Offset (130, 205);

      } else if (selectedOption1 == 'Gorilla Deck'){
        controlPoints = [
          if (selectedOption2 == 'Restaurante') ...[
            const Offset(123, 170),
            const Offset(123, 180),
            const Offset(110, 190),
            const Offset(110, 190),
            const Offset(126, 210),
            const Offset(126, 210),
            const Offset(110, 250),
          ],
          if (selectedOption2 == 'Baños') ...[
            const Offset(123, 170),
            const Offset(123, 180),
            const Offset(110, 190),
            const Offset(110, 190),
            const Offset(126, 210),
            const Offset(126, 210),
            const Offset(126, 240),
          ],

          if (selectedOption2 == 'Savanna Hall') ...[
            const Offset(95, 170),
            const Offset(123, 170),
            const Offset(123, 180),
            const Offset(110, 190),
            const Offset(110, 190),
            const Offset(126, 210),
            const Offset(126, 210),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(130, 290),
            const Offset(166, 308),
            const Offset(165, 315),
            const Offset(170, 320),
            const Offset(173, 330),
            const Offset(173, 330),
            const Offset(160, 355),
          ],
          if (selectedOption2 == 'Wieland Zone') ...[
            const Offset(120, 180),
            const Offset(120, 160),
            const Offset(120, 160),
            const Offset(150, 150),
            const Offset(160, 130),
            const Offset(190, 125),
            const Offset(190, 105),
            const Offset(205, 105),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(225, 210),
            const Offset(270, 90),
            const Offset(270, 90),
            const Offset(283, 166),
            const Offset(283, 166),
            const Offset(333, 196),
            const Offset(310, 216),
            const Offset(274, 230),
            const Offset(294, 247),

          ],
          if (selectedOption2 == 'World of Wildlife Theater') ...[
            const Offset(95, 170),
            const Offset(123, 170),
            const Offset(123, 180),
            const Offset(110, 190),
            const Offset(110, 190),
            const Offset(126, 210),
            const Offset(130, 205),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(123, 270),
            const Offset(130, 290),
            const Offset(166, 308),
            const Offset(165, 315),
            const Offset(166, 312),
            const Offset(206, 304),
            const Offset(226, 300),
            const Offset(226, 300),
            const Offset(190, 260),
            const Offset(205, 175),

          ],
          if (selectedOption2 == 'Ford Pavilion') ...[

            const Offset(100, 180),
            const Offset(120, 160),
            const Offset(120, 160),
            const Offset(150, 150),
            const Offset(160, 130),
            const Offset(190, 125),
            const Offset(190, 105),
            const Offset(205, 105),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(225, 135),
            const Offset(225, 210),
            const Offset(225, 210),
            const Offset(270, 90),
            const Offset(270, 130),
            const Offset(283, 146),
          ],
          if (selectedOption2 == 'Flamingo Plaza') ...[
            const Offset(95, 170),
            const Offset(123, 170),
            const Offset(123, 180),
            const Offset(110, 190),
            const Offset(110, 190),
            const Offset(130, 205),
            const Offset(110, 250),
            const Offset(110, 250),
            const Offset(123, 270),
            const Offset(123, 280),
            const Offset(123, 280),
            const Offset(130, 300),
            const Offset(166, 318),
            const Offset(166, 322),
            const Offset(206, 290),
            const Offset(206, 290),
            const Offset(230, 328),

          ],
          if (selectedOption2 == 'Amy´s Tree Theater') ...[
            const Offset(100, 170),
            const Offset(120, 160),
            const Offset(120, 215),
            const Offset(115, 215),
            const Offset(115, 215),
            const Offset(130, 210),
          ],
        ];
        startPoint = (selectedOption1 == 'Gorilla Deck') ? const Offset(95, 170) : const Offset (95, 170);

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

            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (selectedOption1 == selectedOption2) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return const AlertDialog(
                          title: Text('ERROR'),
                          content: Text('No se puede seleccionar dos opciones iguales \n\nPresione fuera de este recuadro para cerrar'),

                        );
                      }

                  );
                }
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
      ..color = Colors.black
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
