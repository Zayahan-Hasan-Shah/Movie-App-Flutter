import 'package:flutter/material.dart';

class VideoReleaseDate extends StatelessWidget {
  final DateTime videoReleaseDate;
  const VideoReleaseDate({super.key, required this.videoReleaseDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_month,
          size: 20,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          videoReleaseDate.toString().split(' ')[0],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
