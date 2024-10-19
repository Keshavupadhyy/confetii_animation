import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confetti Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConfettiScreen(),
    );
  }
}

class ConfettiScreen extends StatefulWidget {
  const ConfettiScreen({Key? key}) : super(key: key);

  @override
  _ConfettiScreenState createState() => _ConfettiScreenState();
}

class _ConfettiScreenState extends State<ConfettiScreen> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startConfetti() {
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confetti Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _startConfetti,
              child: const Text('Show Confetti'),
            ),
            const SizedBox(height: 20),
            ConfettiWidget(
              confettiController: _controller,
              blastDirection: 3.14 / 2, // 90 degrees
              emissionFrequency: 0.1,
              numberOfParticles: 20,
              gravity: 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
