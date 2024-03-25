import 'package:bee_flutter/Commons/Colors.dart';
import 'package:bee_flutter/Pages/GymScreen/Ferramentas/GymTrackerIntern.dart';
import 'package:bee_flutter/Pages/GymScreen/Ferramentas/relogio.dart';
import 'package:bee_flutter/Pages/GymScreen/models/modelExercicio.dart';
import 'package:bee_flutter/Pages/GymScreen/models/modelFichaExercicio.dart';
import 'package:bee_flutter/Pages/GymScreen/models/modelSerie.dart';
import 'package:bee_flutter/Pages/GymScreen/models/modelTreino.dart';
import 'package:bee_flutter/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GymTracker extends StatefulWidget {
  GymTracker({Key? key}) : super(key: key);

  @override
  _GymTrackerState createState() {
    return _GymTrackerState();
  }
}

class _GymTrackerState extends State<GymTracker> {
  late modelTreino treino;
  List<modelFichaExercicio> listaExercicios = [];
  DateTime hoje = DateTime.now();
  late int dia;

  void adicionarSerie(modelSerie serie, int indexExercicio) {
    print(indexExercicio);
    print(treino.exercicios[indexExercicio].historicoDeSeries.length);
    print(treino.exercicios[indexExercicio].descricao);
    print("--------------------");
    if(treino.exercicios[indexExercicio].historicoDeSeries.length <= treino.exercicios[indexExercicio].numeroDeSeries){
      setState(() {
        treino.exercicios[indexExercicio].historicoDeSeries.add(serie);
      });
    }
  }

  @override
  void initState() {
    dia = hoje.weekday;
    getListaExercicios();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String obterNomeDoDia(int numeroDoDia) {
    switch (numeroDoDia) {
      case 1:
        return 'Segunda-feira';
      case 2:
        return 'Terça-feira';
      case 3:
        return 'Quarta-feira';
      case 4:
        return 'Quinta-feira';
      case 5:
        return 'Sexta-feira';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
      default:
        return 'Dia inválido';
    }
  }

  String obterSaudacao(int horas) {
    switch (horas) {
      case > 7:
        return 'Bom dia';
      case > 11 && < 18:
        return 'Boa tarde';
      default:
        return 'Bom ---';
    }
  }

  void getListaExercicios() {
    setState(() {
      var fichaexercicio = modelFichaExercicio(
        "111111",
        modelExercicio(
          "SUPINO BARRA",
          "_descricaoExercicio",
          "https://s1.static.brasilescola.uol.com.br/be/conteudo/images/imagem-em-lente-convexa.jpg",
          [],
          [],
        ),
        12,
        3,
        true,
        [],
        90,
      );
      var fichaexercicio2 = modelFichaExercicio(
        "222222",
        modelExercicio(
          "BICEPS PULLEY",
          "_descricaoaaExercicio",
          "https://s1.static.brasilescola.uol.com.br/be/conteudo/images/imagem-em-lente-convexa.jpg",
          [],
          [],
        ),
        12,
        3,
        true,
        [],
        90,
      );
      listaExercicios.add(fichaexercicio);
      treino = modelTreino("peito", [], 1,
          "_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino_descricaoTreino");
      treino.exercicios.add(fichaexercicio);
      treino.exercicios.add(fichaexercicio2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: azulOxford,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: 50,
                height: 50,
                child: Icon(Icons.arrow_back),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: widthScreen,
                      height: 180,
                      decoration: BoxDecoration(
                        color: backgroundBranco,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                              child: Text(
                                "${obterSaudacao(hoje.hour)}, hoje é ${obterNomeDoDia(dia)} dia de ${treino.nomeTreino}",
                                style: TextStyle(fontSize: 22),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                    child: Center(child: RelogioWidget()))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  treino.descricaoTreino.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: backgroundBranco,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                treino.descricaoTreino,
                                style: TextStyle(fontSize: 21),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
                      child: Container(
                        width: widthScreen,
                        decoration: BoxDecoration(
                          color: backgroundBranco,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: ListView.builder(
                          itemCount: treino.exercicios.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: mainBranco,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CachedNetworkImage(
                                              height: 80,
                                              width: 80,
                                              fit: BoxFit.fill,
                                              imageUrl: treino.exercicios[index]
                                                  .exercicio.urlPreview),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 8, 0, 8),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                treino.exercicios[index]
                                                    .exercicio.nomeExercicio,
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              Text(
                                                "Séries: ${treino.exercicios[index].numeroDeSeries.toString()}",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Text(
                                                "Repetições: ${treino.exercicios[index].numeroDeRepeticoes.toString()}",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              print(index);
                                              return GymTrackerIntern(adicionarSerie: adicionarSerie, indexExercicio: index,exercicio: treino.exercicios[index],);
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.play_arrow_rounded,
                                          size: 80,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
