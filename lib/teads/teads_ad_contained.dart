import 'package:flutter/material.dart';
import 'package:teads/teads/teads_ad.dart';
import 'package:teads/teads/teads_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class TeadsAdContained extends StatefulWidget {
  const TeadsAdContained({
    Key key,
    @required this.pid,
    this.onRatioUpdated,
    this.onTeadsViewCreated,
    this.settings,
  }) : super(key: key);

  final int pid;
  final TeadsAdSettings settings;
  final void Function(double adRatio) onRatioUpdated;
  final TeadsViewCreatedCallback onTeadsViewCreated;

  @override
  _TeadsAdContainedState createState() => _TeadsAdContainedState();
}

class _TeadsAdContainedState extends State<TeadsAdContained> {
  double _size = 0;
  void _resizeAd(double adRatio) {
    Size mediaQuery = MediaQuery.of(context).size;
    double height = mediaQuery.width / adRatio;

    setState(() {
      if (height > mediaQuery.height)
        _size = height;
      else
        _size = mediaQuery.width / adRatio;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("WIDth: $_size");
    return Container(
      height: _size,
      child: TeadsAd(
        pid: widget.pid,
        settings: widget.settings,
        onRatioUpdated: (double adRatio) {
          _resizeAd(adRatio);
          widget.onRatioUpdated?.call(adRatio);
        },
        onTeadsViewCreated: widget.onTeadsViewCreated,
      ),
    );
  }
}
