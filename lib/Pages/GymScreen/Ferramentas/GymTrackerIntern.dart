import 'dart:async';

import 'package:bee_flutter/Commons/Colors.dart';
import 'package:bee_flutter/Pages/GymScreen/models/modelFichaExercicio.dart';
import 'package:bee_flutter/Pages/GymScreen/models/modelSerie.dart';
import 'package:bee_flutter/Pages/GymScreen/models/modelTreino.dart';
import 'package:bee_flutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GymTrackerIntern extends StatefulWidget {
  final Function(modelSerie serie, int indexExercicio) adicionarSerie;
  modelFichaExercicio exercicio;
  int indexExercicio;
  GymTrackerIntern(
      {Key? key,
      required this.indexExercicio,
      required this.adicionarSerie,
      required this.exercicio})
      : super(key: key);

  @override
  _GymTrackerInternState createState() {
    return _GymTrackerInternState();
  }
}

class _GymTrackerInternState extends State<GymTrackerIntern> {
  int seriesExecutadas = 0;
  bool isDescanso = false;
  int timer = 0;
  bool manterRepeticoes = false;
  bool manterCarga = false;
  late StreamSubscription<int> subscription;
  bool readyToDescansar = false;
  TextEditingController repeticoesController = TextEditingController();
  TextEditingController CargaController = TextEditingController();

  @override
  void initState() {
    getExerciciosFeitos();
    super.initState();
  }

  void checkReadyToDescansar() {
    if (repeticoesController.text.isNotEmpty &&
        CargaController.text.isNotEmpty &&
        !isDescanso) {
      setState(() {
        readyToDescansar = true;
      });
    } else {
      setState(() {
        readyToDescansar = false;
      });
    }
  }

  void getExerciciosFeitos() {
    setState(() {
      seriesExecutadas = widget.exercicio.historicoDeSeries.length;
    });
  }

  void descansar() {
    setState(() {
      isDescanso = true;
      countdown(widget.exercicio.segundosDeDescanso);
    });
  }

  void countdown(int valorInicial) {
    Stream<int> stream =
        Stream.periodic(Duration(seconds: 1), (index) => index);

    int contador = valorInicial;

    subscription = stream.listen((event) {
      contador--;
      if (contador == 0) {
        exitCountdown();
      } else {
        setState(() {
          timer = contador;
        });
      }
    });
  }

  void exitCountdown() {
    setState(() {
      isDescanso = false;
    });
    subscription.cancel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Material(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: widthScreen! * 0.9,
              maxHeight: heightScreen! * 0.9,
            ),
            decoration: BoxDecoration(
              color: mainBranco,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                    ),
                    Text(
                      widget.exercicio.exercicio.nomeExercicio,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.exercicio.exercicio.descricaoExercicio,
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      height: 10,
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListView.builder(
                            itemCount: widget.exercicio.numeroDeSeries,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: seriesExecutadas == index
                                        ? Colors.yellow
                                        : seriesExecutadas > index
                                            ? Colors.green
                                            : Colors.red,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDescanso ? Colors.red : Colors.green),
                        child: Center(
                            child: Text(
                          isDescanso
                              ? "${timer}"
                              : "${seriesExecutadas}/${widget.exercicio.numeroDeSeries}",
                          style: TextStyle(fontSize: 24),
                        )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: backgroundBranco,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                Text("Repetições"),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    checkReadyToDescansar();
                                  },
                                  controller: repeticoesController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Manter repetições"),
                                      GestureDetector(
                                        onTap: () {
                                          if (repeticoesController
                                              .text.isEmpty) {
                                            repeticoesController.text = "0";
                                          }
                                          setState(() {
                                            manterRepeticoes =
                                                !manterRepeticoes;
                                            checkReadyToDescansar();
                                          });
                                        },
                                        child: Icon(
                                          manterRepeticoes
                                              ? Icons.check_box_outlined
                                              : Icons.check_box_outline_blank,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text("Carga"),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    checkReadyToDescansar();
                                  },
                                  controller: CargaController,
                                  decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 12, 0, 0),
                                        child: Text("KG"),
                                      ),
                                      border: OutlineInputBorder()),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Manter carga"),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (CargaController.text.isEmpty) {
                                              CargaController.text = "0";
                                            }
                                            manterCarga = !manterCarga;
                                            checkReadyToDescansar();
                                          });
                                        },
                                        child: Icon(
                                          manterCarga
                                              ? Icons.check_box_outlined
                                              : Icons.check_box_outline_blank,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isDescanso) {
                          exitCountdown();
                        } else {
                          timer = widget.exercicio.segundosDeDescanso;
                          if (seriesExecutadas !=
                              widget.exercicio.numeroDeSeries) {
                            setState(() {
                              widget.adicionarSerie(
                                  modelSerie(seriesExecutadas, 10.0, 10.0),
                                  widget.indexExercicio);
                              seriesExecutadas++;
                              descansar();
                            });
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 48),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: !isDescanso
                                ? readyToDescansar
                                    ? Colors.green
                                    : Colors.grey
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text(
                              seriesExecutadas ==
                                      widget.exercicio.numeroDeSeries
                                  ? "Finalizar"
                                  : isDescanso
                                      ? "Continuar"
                                      : readyToDescansar
                                          ? "Descansar"
                                          : "Preencha os campos",
                                 style: const TextStyle(fontSize: 28),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
