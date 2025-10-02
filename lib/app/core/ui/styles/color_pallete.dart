// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum PalleteOptions {
  dark_green,
  yellow, //2
  red, //3
  light_blue, //4
  dark_orange, //5
  purple, //6
  orange, //7
  grey, //8
  brown, //9
  cyan, //10
  teal, //11
  pink, //12
  indigo, //13
  salmon, //14
  wine, //15
  sky_blue, //16
  yogurt, //17
  strong_yellow, //18
  lime, //19
  christalle, //20
  affair, //21
  mandys_pink, //22
  buddha_gold, //23
  chocolate, //24
  magnolia, //25
  ultramarine, //26
  strikemaster, //27
  amaranth, //28
  light_green, //1
  white, //29
}

class ColorPallete {
  static Color getColor(PalleteOptions palleteOptions) {
    switch (palleteOptions) {
      case PalleteOptions.dark_green:
        return Colors.green;
      case PalleteOptions.yellow:
        return Colors.yellow;
      case PalleteOptions.red:
        return Colors.red;
      case PalleteOptions.light_blue:
        return Colors.lightBlue;
      case PalleteOptions.dark_orange:
        return Colors.orangeAccent;
      case PalleteOptions.purple:
        return Colors.purple;
      case PalleteOptions.orange:
        return Colors.orange;
      case PalleteOptions.grey:
        return Colors.grey;
      case PalleteOptions.brown:
        return Colors.brown;
      case PalleteOptions.cyan:
        return Colors.cyan;
      case PalleteOptions.teal:
        return Colors.teal;
      case PalleteOptions.pink:
        return Colors.pink;
      case PalleteOptions.indigo:
        return Colors.indigo;
      case PalleteOptions.salmon:
        return const Color.fromRGBO(250, 128, 114, 1);
      case PalleteOptions.wine:
        return const Color.fromRGBO(108, 30, 46, 1);
      case PalleteOptions.sky_blue:
        return const Color.fromRGBO(155, 202, 208, 1);
      case PalleteOptions.yogurt:
        return const Color.fromRGBO(246, 168, 129, 1);
      case PalleteOptions.strong_yellow:
        return const Color.fromRGBO(250, 191, 37, 1);
      case PalleteOptions.lime:
        return const Color.fromRGBO(193, 255, 134, 1);
      case PalleteOptions.christalle:
        return const Color.fromRGBO(56, 5, 104, 1);
      case PalleteOptions.affair:
        return const Color.fromRGBO(127, 70, 131, 1);
      case PalleteOptions.mandys_pink:
        return const Color.fromRGBO(240, 200, 163, 1);
      case PalleteOptions.buddha_gold:
        return const Color.fromRGBO(186, 175, 7, 1);
      case PalleteOptions.chocolate:
        return const Color.fromRGBO(54, 6, 1, 1);
      case PalleteOptions.magnolia:
        return const Color.fromRGBO(248, 241, 255, 1);
      case PalleteOptions.ultramarine:
        return const Color.fromRGBO(19, 11, 149, 1);
      case PalleteOptions.strikemaster:
        return const Color.fromRGBO(138, 99, 135, 1);
      case PalleteOptions.amaranth:
        return const Color.fromRGBO(236, 63, 71, 1);
      case PalleteOptions.light_green:
        return Colors.lightGreen;
      case PalleteOptions.white:
        return Colors.white;
      // ignore: unreachable_switch_default
      default:
        return Colors
            .transparent; // You can choose a default color or handle it differently
    }
  }

  static PalleteOptions fromString(String data) {
    switch (data) {
      case 'dark_green':
        return PalleteOptions.dark_green;
      case 'yellow':
        return PalleteOptions.yellow;
      case 'red':
        return PalleteOptions.red;
      case 'light_blue':
        return PalleteOptions.light_blue;
      case 'dark_orange':
        return PalleteOptions.dark_orange;
      case 'purple':
        return PalleteOptions.purple;
      case 'orange':
        return PalleteOptions.orange;
      case 'grey':
        return PalleteOptions.grey;
      case 'brown':
        return PalleteOptions.brown;
      case 'cyan':
        return PalleteOptions.cyan;
      case 'teal':
        return PalleteOptions.teal;
      case 'pink':
        return PalleteOptions.pink;
      case 'indigo':
        return PalleteOptions.indigo;
      case 'salmon':
        return PalleteOptions.salmon;
      case 'wine':
        return PalleteOptions.wine;
      case 'sky_blue':
        return PalleteOptions.sky_blue;
      case 'yogurt':
        return PalleteOptions.yogurt;
      case 'strong_yellow':
        return PalleteOptions.strong_yellow;
      case 'lime':
        return PalleteOptions.lime;
      case 'christalle':
        return PalleteOptions.christalle;
      case 'affair':
        return PalleteOptions.affair;
      case 'mandys_pink':
        return PalleteOptions.mandys_pink;
      case 'buddha_gold':
        return PalleteOptions.buddha_gold;
      case 'chocolate':
        return PalleteOptions.chocolate;
      case 'magnolia':
        return PalleteOptions.magnolia;
      case 'ultramarine':
        return PalleteOptions.ultramarine;
      case 'strikemaster':
        return PalleteOptions.strikemaster;
      case 'amaranth':
        return PalleteOptions.amaranth;
      case 'light_green':
        return PalleteOptions.light_green;
      case 'white':
        return PalleteOptions.white;
      default:
        return PalleteOptions.white;
    }
  }

  static List<PalleteOptions> listColors = [
    PalleteOptions.dark_green,
    PalleteOptions.yellow,
    PalleteOptions.red,
    PalleteOptions.light_blue,
    PalleteOptions.dark_orange,
    PalleteOptions.purple,
    PalleteOptions.orange,
    PalleteOptions.grey,
    PalleteOptions.brown,
    PalleteOptions.cyan,
    PalleteOptions.teal,
    PalleteOptions.pink,
    PalleteOptions.indigo,
    PalleteOptions.salmon,
    PalleteOptions.wine,
    PalleteOptions.sky_blue,
    PalleteOptions.strong_yellow,
    PalleteOptions.lime,
    PalleteOptions.christalle,
    PalleteOptions.affair,
    PalleteOptions.mandys_pink,
    PalleteOptions.buddha_gold,
    PalleteOptions.chocolate,
    PalleteOptions.magnolia,
    PalleteOptions.ultramarine,
    PalleteOptions.strikemaster,
    PalleteOptions.amaranth,
    PalleteOptions.light_green,
    PalleteOptions.white,
  ];
}
