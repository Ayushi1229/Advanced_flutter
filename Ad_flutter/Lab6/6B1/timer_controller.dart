import 'dart:async';
import 'package:get/get.dart';
import 'timer_model.dart';

class TimerController extends GetxController {
  final TimerModel model;
  late RxInt remainingSeconds;
  Timer? _timer;

  TimerController(this.model) {
    remainingSeconds = model.initialSeconds.obs;
  }

  void startTimer() {
    _timer?.cancel(); // Reset previous timer if any
    remainingSeconds.value = model.initialSeconds;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
