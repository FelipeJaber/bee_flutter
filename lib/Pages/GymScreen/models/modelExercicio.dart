class modelExercicio{

  String _nomeExercicio;
  String _descricaoExercicio;
  String _urlPreview;
  List<String> _imgsExercicio;
  List<String> _tags;

  modelExercicio(this._nomeExercicio, this._descricaoExercicio, this._urlPreview,
      this._imgsExercicio, this._tags);

  List<String> get tags => _tags;

  set tags(List<String> value) {
    _tags = value;
  }

  List<String> get imgsExercicio => _imgsExercicio;

  set imgsExercicio(List<String> value) {
    _imgsExercicio = value;
  }

  String get urlPreview => _urlPreview;

  set urlPreview(String value) {
    _urlPreview = value;
  }

  String get descricaoExercicio => _descricaoExercicio;

  set descricaoExercicio(String value) {
    _descricaoExercicio = value;
  }

  String get nomeExercicio => _nomeExercicio;

  set nomeExercicio(String value) {
    _nomeExercicio = value;
  }
}