import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spirograph Pattern',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Spirograph Pattern'),
          actions: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  'assets/image.jpg',
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
            )
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SpirographDemo(),
        ),
      ),
    );
  }
}

class SpirographDemo extends StatefulWidget {
  const SpirographDemo({super.key});

  @override
  _SpirographDemoState createState() => _SpirographDemoState();
}

class _SpirographDemoState extends State<SpirographDemo> {
  double _R = 100.0;
  double _r = 30.0;
  double _d = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomPaint(
            painter: SpirographPainter(R: _R, r: _r, d: _d),
            child: const Center(),
          ),
        ),
        Slider(
          min: 50,
          max: 150,
          divisions: 100,
          label: 'R: ${_R.toStringAsFixed(1)}',
          value: _R,
          onChanged: (value) {
            setState(() {
              _R = value;
            });
          },
        ),
        Slider(
          min: 10,
          max: 50,
          divisions: 40,
          label: 'r: ${_r.toStringAsFixed(1)}',
          value: _r,
          onChanged: (value) {
            setState(() {
              _r = value;
            });
          },
        ),
        Slider(
          min: 10,
          max: 100,
          divisions: 90,
          label: 'd: ${_d.toStringAsFixed(1)}',
          value: _d,
          onChanged: (value) {
            setState(() {
              _d = value;
            });
          },
        ),
      ],
    );
  }
}

class SpirographPainter extends CustomPainter {
  final double R;
  final double r;
  final double d;

  SpirographPainter({required this.R, required this.r, required this.d});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final width = size.width;
    final height = size.height;
    final centerX = width / 2;
    final centerY = height / 2;

    final path = Path();

    for (double t = 0; t < 2 * pi * r / gcd(R, r); t += 0.01) {
      final x = centerX + (R - r) * cos(t) + d * cos((R - r) / r * t);
      final y = centerY + (R - r) * sin(t) - d * sin((R - r) / r * t);
      if (t == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  double gcd(double a, double b) {
    while (b != 0) {
      double temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  @override
  bool shouldRepaint(SpirographPainter oldDelegate) {
    return oldDelegate.R != R || oldDelegate.r != r || oldDelegate.d != d;
  }
}