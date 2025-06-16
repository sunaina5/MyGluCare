import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GlucoseGauge extends StatelessWidget {
  final double predictedBG;

  const GlucoseGauge({super.key, required this.predictedBG});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 10,
            showLabels: false,
            showTicks: false,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: 3.9,
                color: Colors.red,
                label: 'Low',
                sizeUnit: GaugeSizeUnit.factor,
                startWidth: 0.15,
                endWidth: 0.15,
              ),
              GaugeRange(
                startValue: 3.9,
                endValue: 6.9,
                color: Colors.green,
                label: 'Normal',
                sizeUnit: GaugeSizeUnit.factor,
                startWidth: 0.15,
                endWidth: 0.15,
              ),
              GaugeRange(
                startValue: 6.9,
                endValue: 10,
                color: Colors.redAccent,
                label: 'High',
                sizeUnit: GaugeSizeUnit.factor,
                startWidth: 0.15,
                endWidth: 0.15,
              ),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(value: predictedBG),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                  predictedBG.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                angle: 90,
                positionFactor: 0.5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
