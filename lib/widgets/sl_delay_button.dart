library timer_button;

import 'dart:async';

import 'package:flutter/material.dart';

typedef SlDelayButtonBuilder = Widget Function(
    BuildContext context, int seconds);

class SlDelayButton extends StatefulWidget {
  final String label;

  ///[timeOutInSeconds] after which the button is enabled
  final int timeOutInSeconds;

  ///[onPressed] Called when the button is tapped or otherwise activated.
  final VoidCallback onPressed;

  final bool timeUpFlag;

  const SlDelayButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.timeOutInSeconds,
    this.timeUpFlag = false,
  }) : super(key: key);

  @override
  State<SlDelayButton> createState() => _SlDelayButtonState();
}

class _SlDelayButtonState extends State<SlDelayButton> {
  bool _timeUpFlag = false;
  int _timeCounter = 0;
  late Timer _timer;

  String get _timerText => '$_timeCounter s';

  @override
  void initState() {
    super.initState();
    _timeCounter = widget.timeOutInSeconds;
    _timeUpFlag = widget.timeUpFlag;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  void _updateTime() {
    if (_timeUpFlag) {
      return;
    }
    _timer = Timer(const Duration(seconds: 1), () async {
      if (!mounted) return;
      _timeCounter--;
      _updateState();
      if (_timeCounter >= 0) {
        _updateTime();
      } else {
        _timeUpFlag = true;
      }
    });
  }

  void _onPressed() {
    _timeUpFlag = false;
    _timeCounter = widget.timeOutInSeconds;
    _updateState();
    widget.onPressed();
    _updateTime();
  }

  @override
  Widget build(BuildContext context) {
    final child = SlDelayButtonChild(
      timeUpFlag: _timeUpFlag,
      label: widget.label,
      timerText: _timerText,
    );

    return TextButton(
      onPressed: _timeUpFlag ? _onPressed : null,
      child: child,
    );
  }
}

class SlDelayButtonChild extends StatelessWidget {
  final bool timeUpFlag;
  final String label;
  final String timerText;
  const SlDelayButtonChild({
    Key? key,
    required this.timeUpFlag,
    required this.label,
    required this.timerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = timeUpFlag ? label : '$label  |  $timerText';

    return Text(
      text,
    );
  }
}
