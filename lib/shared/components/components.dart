import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

Widget defualtGauges ({
  required currentValue
})=>Expanded(
  child:   PrettyGauge(

    gaugeSize: 200,

    minValue: 0,

    maxValue: 700,

    segments: [

      GaugeSegment('Low', 300, Colors.green),

      GaugeSegment('Medium', 300, Colors.orange),

      GaugeSegment('High', 100, Colors.red),

    ],

    currentValue: currentValue,

  ),
);