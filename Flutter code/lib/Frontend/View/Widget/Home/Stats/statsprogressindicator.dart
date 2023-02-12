import 'package:flutter/material.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appcolors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class StatsProgressIndicator extends StatelessWidget {
  const StatsProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SfRadialGauge(enableLoadingAnimation: true, axes: <RadialAxis>[
        RadialAxis(
          showLabels: false,
          showTicks: false,
          startAngle: 180,
          endAngle: 0,
          //radiusFactor: 0.9,
          canScaleToFit: true,
          axisLineStyle: const AxisLineStyle(
              thickness: 0.1,
              color: AppColors.primarycolor,
              thicknessUnit: GaugeSizeUnit.factor,
              cornerStyle: CornerStyle.startCurve),
          pointers: const <GaugePointer>[
            RangePointer(
              value: 42,
              width: 0.1,
              sizeUnit: GaugeSizeUnit.factor,
              color: AppColors.buttonscolor,
              cornerStyle: CornerStyle.bothCurve,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                positionFactor: 0.4,
                angle: 90,
                widget: Column(
                  children: const [
                    Text(
                      "42%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.buttonscolor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Spent from your budget",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.buttonscolor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ))
          ],
        ),
      ]),
    );
  }
}
