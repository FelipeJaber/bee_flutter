import 'dart:async';

import 'package:flutter/material.dart';

class RelogioWidget extends StatefulWidget {
  @override
  _RelogioWidgetState createState() => _RelogioWidgetState();
}

class _RelogioWidgetState extends State<RelogioWidget> {
  String _horarioAtual = '';

  @override
  void initState() {
    super.initState();
    _atualizarHorario();
    // Atualiza o horário a cada minuto
    Timer.periodic(Duration(seconds: 1), (timer) {
      _atualizarHorario();
    });
  }

  void _atualizarHorario() {
    final agora = DateTime.now();
    final hora = agora.hour.toString().padLeft(2, '0');
    final minuto = agora.minute.toString().padLeft(2, '0');
    setState(() {
      _horarioAtual = '$hora:$minuto';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_horarioAtual',
      style: TextStyle(fontSize: 60),
    );
  }
}
