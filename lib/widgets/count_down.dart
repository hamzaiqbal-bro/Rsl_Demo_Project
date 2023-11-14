import 'package:flutter/material.dart';
import 'package:rsl_app/widgets/text_widget.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CountDownWidget extends StatefulWidget {
  final String nameEvent;

  const CountDownWidget({super.key, required this.nameEvent});

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  int timerCount = 6000000;
  bool isTimerFinished = false;

  countDownTimer() async {
    for (int x = 60; x > 0; x--) {
      await Future.delayed(const Duration(seconds: 1)).then((_) {
        if (timerCount == 1) isTimerFinished = true;
        setState(() {
          timerCount -= 1;
        });
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDownTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Container(
        height: 75,
        width: MediaQuery.of(context).size.width / 4,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade100, spreadRadius: 2),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Countdown(
              seconds: 200,
              build: (BuildContext context, double time) => textWidget(text: time.toString(), color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold),
              interval: const Duration(seconds: 1),
              onFinished: () {
                print('Timer is done!');
              },
            ),
            SizedBox(height: 5.0,),
            textWidget(
                text: widget.nameEvent,
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}
