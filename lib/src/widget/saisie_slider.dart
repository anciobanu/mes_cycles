import 'package:flutter/material.dart';

class SaisieSlider extends StatefulWidget {
  const SaisieSlider({super.key});

  @override
  State<SaisieSlider> createState() => _SaisieSliderState();
}

class _SaisieSliderState extends State<SaisieSlider> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 5,
      divisions: 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
