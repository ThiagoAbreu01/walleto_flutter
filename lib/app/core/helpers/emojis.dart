// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';

class Emojis {
  static Emojis? _instance;

  Emojis._();

  static Emojis get i {
    _instance ??= Emojis._();
    return _instance!;
  }

  static const sinal_aviso = '⚠️';
  static const placa_aviso = '🚧';
  static const construcao = '🏗️';
  static const tijolo = '🧱';
  static const fabrica = '🏭';
  static const check_box = '✅';
  static const check = '✔️';
  static const erro = '❌';
  static const extintor = '🧯';
  static const colete = '🦺';
  static const capacete_medico = '⛑️';
  static const foguete = '🚀';
  static const escritorio = '🏢';
  static const engenheiro0 = '👷';
  static const engenheiro1 = '👷🏻';
  static const engenheiro2 = '👷🏽';
  static const engenheiro3 = '👷🏾‍♂️';
  static const engenheiro4 = '👷🏿‍♂️';
  static const engenheira0 = '👷‍♀️';
  static const engenheira1 = '👷🏻‍♀️';
  static const engenheira2 = '👷🏽‍♀️';
  static const engenheira3 = '👷🏾‍♀️';
  static const engenheira4 = '👷🏼‍♀️';
  static const engenheira5 = '👷🏿‍♀️';
  static const programador0 = '👨‍💻';
  static const programador1 = '👨🏻‍💻';
  static const programador2 = '👨🏼‍💻';
  static const programador3 = '👨🏽‍💻';
  static const programador4 = '👨🏾‍💻';
  static const programador5 = '👨🏿‍💻';
  static const programadora0 = '👩‍💻';
  static const programadora1 = '👩🏻‍💻';
  static const programadora2 = '👩🏼‍💻';
  static const programadora3 = '👩🏽‍💻';
  static const programadora4 = '👩🏾‍💻';
  static const programadora5 = '👩🏿‍💻';
  static const cafe = '☕';
  static const laptop = '💻';
  static const teclado = '⌨️';
  static const monitor = '🖥';
  static const telefone = '📱';
  static const telefone_seta = '📲';
  static const camera = '📷';
  static const salvar = '💾';
  static const diamante = '💎';
  static const alvo = '🎯';
  static const lupa = '🔎';
}

extension EmojisAppExtension on BuildContext {
  Emojis get emojis => Emojis.i;
}
