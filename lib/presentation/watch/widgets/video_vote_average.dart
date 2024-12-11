import 'package:flutter/material.dart';

class VidoeVoteAverage extends StatelessWidget {
  final double voteAverage;
  const VidoeVoteAverage({
    super.key,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.start,
          color: Colors.amber,
          size: 20,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          voteAverage.toStringAsFixed(1),
        ),
      ],
    );
  }
}
