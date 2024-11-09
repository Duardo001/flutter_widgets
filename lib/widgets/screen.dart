import 'package:flutter/material.dart';

import 'task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue,
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0, //varia de 0 - 1
        duration: const Duration(milliseconds: 850),
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter',
                'assets/images/aprender_flutter.png',
                3),
            Task(
                'Estudar chinês',
                'assets/images/aprender_chines.jpg',
                4),
            Task(
                'Dormir',
                'assets/images/dormir.jpg',
                1),
            Task(
                'Comer',
                'assets/images/comer.jpg',
                1),
            Task(
                'Jogar',
                'assets/images/jogar.jpg',
                5),
            SizedBox(
              height: 63,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
