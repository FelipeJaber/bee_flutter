import 'dart:ffi';

class modelSerie{

  int _numeroDaSerie;
  double _carga;
  double _rep;

  modelSerie(this._numeroDaSerie, this._carga, this._rep);

  double get rep => _rep;

  set rep(double value) {
    _rep = value;
  }

  double get carga => _carga;

  set carga(double value) {
    _carga = value;
  }

  int get numeroDaSerie => _numeroDaSerie;

  set numeroDaSerie(int value) {
    _numeroDaSerie = value;
  }
}