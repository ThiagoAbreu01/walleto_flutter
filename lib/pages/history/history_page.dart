import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue, // começa azul
              Colors.green,
              Colors.purple, // termina roxo
            ],
            stops: [
              0.2,
              0.5,
              0.8,
            ], // posição das cores
          ),
        ),
      ),
//       body: Container(
//   decoration: const BoxDecoration(
//     gradient: RadialGradient(
//       center: Alignment.center,
//       radius: 0.8,
//       colors: [
//         Colors.blue,
//         Colors.transparent,
//       ],
//     ),
//   ),
// ),
    );
  }
}
