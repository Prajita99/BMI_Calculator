import 'package:flutter/material.dart';

class HeightSlider extends StatefulWidget {
  final double height;
  final ValueChanged<double> onChanged;

  HeightSlider({required this.height, required this.onChanged});

  @override
  _HeightSliderState createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  double _normalizedHeight = 0.0;
  double _minHeight = 2.0;
  double _maxHeight = 8.0;

  @override
  void initState() {
    super.initState();
    _normalizeHeight(widget.height);
  }

  void _normalizeHeight(double height) {
    // Clamp the height to the min/max values
    height = height.clamp(_minHeight, _maxHeight);

    // Split the height into feet and inches
    double feet = height.floorToDouble();
    double inches = (height - feet) * 12;

    // Normalize the inches
    if (inches >= 12) {
      feet += 1;
      inches -= 12;
    } else if (inches < 0) {
      feet -= 1;
      inches += 12;
    }

    // Round the inches to the nearest tenth
    double normalizedInches = (inches * 10).roundToDouble() / 10;

    // Convert back to a single decimal value
    _normalizedHeight = feet + (normalizedInches / 12);
  }

  void _handleChanged(double value) {
    _normalizeHeight(value);
    widget.onChanged(_normalizedHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: widget.height,
      min: _minHeight,
      max: _maxHeight,
      divisions: (_maxHeight.toInt() - _minHeight.toInt()) * 12,
      onChanged: _handleChanged,
    );
  }
}
