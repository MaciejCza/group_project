import 'dart:math' as math;
import 'package:flutter/material.dart';

double result = 225;
const Color kBeeColor = Color(0xffF1B102);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  int counter = 0;
  TextEditingController controller = TextEditingController();

  BorderRadius kWaterDropBorder = const BorderRadius.only(
    topLeft: Radius.circular(200.0),
    topRight: Radius.elliptical(20.0, -200),
    bottomRight: Radius.elliptical(200.0, 240),
    bottomLeft: Radius.circular(200.0),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget? widget) {
    return Center(
      child: Transform.rotate(
        angle: -math.pi / 4,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: kWaterDropBorder,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Transform.rotate(
                  angle: math.pi / 4,
                  origin: const Offset(-30, 10),
                  child: CustomPaint(
                    painter: WavePainter(controller: _controller, waves: 2, waveAmplitude: 35),
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(border: Border.all(color: Colors.blue.shade200, width: 8.0), borderRadius: kWaterDropBorder),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 5.0), borderRadius: kWaterDropBorder),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: _buildAnimation,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Text(
                    '$counter / 10',
                    style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildWaterButton(() {
                if (counter > 0) {
                  setState(() {
                    result += 25;
                  });
                  counter--;
                }
              }, '-', 0.8, 35.0, 18.0, 2.0),
              buildWaterButton(() {
                if (counter <= 9) {
                  setState(() {
                    result -= 25;
                  });
                  counter++;
                }
              }, '+', 1, 30.0, 15.0, 5.0),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildWaterButton(GestureTapCallback function, String text, double opacity, double fontSize, double horizontal, double vertical) {
    return GestureDetector(
        onTap: function,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), border: Border.all(color: kBeeColor, width: 2)),
          child: Text(text, style: TextStyle(fontSize: fontSize, color: kBeeColor.withOpacity(opacity))),
        ));
  }
}

class WavePainter extends CustomPainter {
  late final Animation<double> position;
  final Animation<double> controller;
  final int waves;
  final double waveAmplitude;

  int get waveSegments => 2 * waves - 1;

  WavePainter({required this.controller, required this.waves, required this.waveAmplitude}) {
    position = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.linear)).animate(controller);
  }

  void drawWave(Path path, int wave, size) {
    double waveWidth = size.width / waveSegments;
    double waveMinHeight = result; //start

    double x1 = wave * waveWidth + waveWidth * 0.11;
    // Minimum and maximum height points of the waves.
    double y1 = waveMinHeight + (wave.isOdd ? -waveAmplitude : waveAmplitude);

    double x2 = x1 + waveWidth / 2;
    double y2 = waveMinHeight;

    path.quadraticBezierTo(x1, y1, x2, y2);
    if (wave <= waveSegments) {
      drawWave(path, wave + 1, size);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..color = Colors.lightBlue.shade200
      ..style = PaintingStyle.fill;

    Paint paint2 = Paint()
      ..color = Colors.lightBlue.shade400
      ..style = PaintingStyle.fill;

    // Draw the waves
    Path path1 = Path()..moveTo(1, size.height);
    Path path2 = Path()..moveTo(0, size.height);
    drawWave(path1, 0, size);
    drawWave(path2, 0, size);

    // Draw lines to the bottom corners of the size/screen with account for one extra wave.
    double waveWidth1 = (size.width / waveSegments) / 2;
    double waveWidth2 = (size.width / waveSegments);
    path1
      ..lineTo(size.width + waveWidth1, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, size.height / 2)
      ..close();
    path2
      ..lineTo(size.width + waveWidth2, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, size.height / 2)
      ..close();

    // Animate sideways one wave length, so it repeats cleanly.
    Path shiftedPath1 = path1.shift(Offset(position.value * waveWidth1, 1));
    Path shiftedPath2 = path2.shift(Offset(-position.value * waveWidth2, 0));

    canvas.drawPath(shiftedPath1, paint1);
    canvas.drawPath(shiftedPath2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}