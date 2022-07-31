import 'package:flutter/material.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';
import 'package:hackthon_game/shared/components/components.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double dx = 0;
  double dy = 0;
  double velocity=0;
  int endTime=0;
  int startTime=0 ;
  @override
  Widget build(BuildContext context) {
    return XGestureDetector(
      child: Material(
        child: Center(
          child:Column(
            children: [
              defualtGauges(currentValue: dx),
              defualtGauges(currentValue: dy),
              defualtGauges(currentValue: velocity),
            ],
          ),
        ),
      ),
      onMoveStart: onMoveStart,
      onMoveEnd: onMoveEnd,
      onMoveUpdate: onMoveUpdate,
      bypassTapEventOnDoubleTap: false,
    );
  }


  void onMoveUpdate(MoveEvent event) {

    setState((){
      startTime=DateTime.now().microsecond;
      dx = event.localPos.dx;
      dy = event.localPos.dy;
      endTime=DateTime.now().microsecond;
      velocity=(event.localPos.distance*10/(endTime-startTime)).abs();
    });
    print('onMoveUpdate - pos: ${event.localPos} delta: ${event.delta}...distance=${event.localPos.distance}...velocity=${velocity}');
  }

  void onMoveEnd(localPos) {
    // setLastEventName('onMoveEnd');

    print('onMoveEnd - pos: $localPos');
  }

  void onMoveStart(localPos) {
    // setLastEventName('onMoveStart');
    print('onMoveStart - pos: $localPos');
  }


}
