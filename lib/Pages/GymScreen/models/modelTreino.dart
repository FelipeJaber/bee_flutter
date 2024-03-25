import 'modelFichaExercicio.dart';

class modelTreino{

  String _nomeTreino;
  List<modelFichaExercicio> _exercicios;
  int _diaDoTreino;
  String _descricaoTreino;

  modelTreino(this._nomeTreino, this._exercicios, this._diaDoTreino,
      this._descricaoTreino);

  String get descricaoTreino => _descricaoTreino;

  set descricaoTreino(String value) {
    _descricaoTreino = value;
  }

  List<modelFichaExercicio> get exercicios => _exercicios;

  set exercicios(List<modelFichaExercicio> value) {
    _exercicios = value;
  }

  String get nomeTreino => _nomeTreino;

  set nomeTreino(String value) {
    _nomeTreino = value;
  }

  int get diaDoTreino => _diaDoTreino;

  set diaDoTreino(int value) {
    _diaDoTreino = value;
  }
}