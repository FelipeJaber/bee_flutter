import 'package:bee_flutter/Pages/GymScreen/models/modelExercicio.dart';

import 'modelSerie.dart';

class modelFichaExercicio{

  String _descricao;
  modelExercicio _exercicio;
  int _numeroDeRepeticoes;
  int _numeroDeSeries;
  int _segundosDeDescanso;
  bool _isCargaContinua;
  List<modelSerie> _historicoDeSeries;

  modelFichaExercicio(
      this._descricao,
      this._exercicio,
      this._numeroDeRepeticoes,
      this._numeroDeSeries,
      this._isCargaContinua,
      this._historicoDeSeries,
      this._segundosDeDescanso
      );

  List<modelSerie> get historicoDeSeries => _historicoDeSeries;

  set historicoDeSeries(List<modelSerie> value) {
    _historicoDeSeries = value;
  }

  bool get isCargaContinua => _isCargaContinua;

  set isCargaContinua(bool value) {
    _isCargaContinua = value;
  }

  int get numeroDeSeries => _numeroDeSeries;

  set numeroDeSeries(int value) {
    _numeroDeSeries = value;
  }

  int get numeroDeRepeticoes => _numeroDeRepeticoes;

  set numeroDeRepeticoes(int value) {
    _numeroDeRepeticoes = value;
  }

  modelExercicio get exercicio => _exercicio;

  set exercicio(modelExercicio value) {
    _exercicio = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  int get segundosDeDescanso => _segundosDeDescanso;

  set segundosDeDescanso(int value) {
    _segundosDeDescanso = value;
  }
}