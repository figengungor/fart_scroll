library fart_scroll;

import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

mixin FartScrollMixin<T extends StatefulWidget> on State<T> {
  ScrollController? _scrollController;
  AudioPlayer? _audioPlayer;
  double _fartOffset = 0.0;
  ScrollDirection _prevDirection = ScrollDirection.reverse;
  double _fartScrollDistance = 300.0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _scrollController = ScrollController();

    _scrollController?.addListener(() {
      if (_scrollController?.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_fartOffset < _scrollController!.offset) {
          //Reverse Fart
          _fartOffset = _fartOffset + _fartScrollDistance;
          _loadFileAndPlay('fart.mp3');
          _resetOffsetIfDirectionChanged();
        }
      } else {
        if (_fartOffset > _scrollController!.offset) {
          //Forward Fart
          _fartOffset = _fartOffset - _fartScrollDistance;
          _loadFileAndPlay('fart.mp3');
          _resetOffsetIfDirectionChanged();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _audioPlayer?.release();
    super.dispose();
  }

  void _resetOffsetIfDirectionChanged() {
    if (_prevDirection != _scrollController?.position.userScrollDirection) {
      _prevDirection = _scrollController!.position.userScrollDirection;
      _fartOffset = _scrollController!.offset;
    }
  }

  Future _loadFileAndPlay(String path) async {
    final file = new File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(
        (await rootBundle.load('packages/fart_scroll/assets/$path'))
            .buffer
            .asUint8List());
    await _audioPlayer?.play(DeviceFileSource(file.path));
  }

  ScrollController? get fartScrollController => _scrollController;
}
