import 'package:chess_game/components/piece.dart';
import 'package:chess_game/values/colors.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final bool isSelected;
  final ChessPiece? piece;
  final void Function()? onTap;
  final bool isValidMove;
  const Square(
      {super.key,
      required this.isWhite,
      required this.piece,
      required this.isSelected,
      required this.onTap,
      required this.isValidMove});

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    // if Selected Square is green
    if (isSelected) {
      squareColor = const Color.fromARGB(255, 85, 168, 88);
    } else if (isValidMove) {
      squareColor = const Color.fromARGB(255, 136, 224, 139);
    } else {
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        color: squareColor,
        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? Colors.white : Colors.black,
              )
            : null,
      ),
    );
  }
}
