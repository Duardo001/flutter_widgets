import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int maestria = 0;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: color),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black26),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              //impede do texto da tarefa explodir no container
                              style: const TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            )),
                        Difficulty(levelDifficulty: widget.dificuldade)
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                            if (nivel == (widget.dificuldade * 10)) {
                              nivel = 0;
                              maestria += 10;
                            } else if (maestria == 50) {
                              maestria = 0;
                            }

                            switch (maestria) {
                              case 10:
                                color = const Color.fromARGB(255, 98, 224, 151);
                                break;
                              case 20:
                                color =
                                    const Color.fromARGB(255, 233, 101, 238);
                                break;
                              case 30:
                                color = const Color.fromARGB(255, 236, 104, 52);
                                break;
                              case 40:
                                color = const Color.fromARGB(255, 223, 141, 34);
                                break;
                              case 50:
                                const Color.fromARGB(255, 194, 197, 35);
                                break;
                              default:
                                color = Colors.blue;
                            }
                            // print('Esse é o nivel $nivel');
                            // print('Esse é a maestria $maestria');
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              color: Colors.white,
                            ),
                            Text(
                              'Up',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(241, 170, 205, 252),
                        value: (widget.dificuldade > 0)
                            ? (nivel / widget.dificuldade) / 10
                            : (1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nível $nivel',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

// cod para ter cor aleatória
// import 'dart:math' as math;
// color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

