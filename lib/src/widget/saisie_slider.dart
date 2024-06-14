import 'package:flutter/material.dart';

class SaisieSlider extends StatefulWidget {
  const SaisieSlider({super.key, required this.currentSliderValue, required this.saveValeur});

  final double currentSliderValue;
  final void Function(double newValeur) saveValeur;

  @override
  State<SaisieSlider> createState() => _SaisieSliderState();
}

class _SaisieSliderState extends State<SaisieSlider> {
  late double _currentSliderValue;
  late void Function(double newValeur) _saveValeur;

  @override
  void initState() {
    _currentSliderValue = widget.currentSliderValue;
    _saveValeur = widget.saveValeur;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 5,
      divisions: 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        _saveValeur(value);
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
