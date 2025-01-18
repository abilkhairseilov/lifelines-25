import 'package:flutter/material.dart';

class SOSButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SOSButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
      ),
      child: const Text(
        'SOS',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

