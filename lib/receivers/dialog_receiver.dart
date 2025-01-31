import 'dart:async';

import 'package:flutter/foundation.dart';

final DialogReceiver dialogReceiver = DialogReceiver();

class DialogReceiver {
  DialogReceiver() : _dialogStream = StreamController<DialogEvent>.broadcast();

  late final StreamController<DialogEvent> _dialogStream;

  void add(DialogEvent event) {
    _dialogStream.add(event);
  }

  Future<void> close() async {
    await _dialogStream.close();
  }

  StreamSubscription<DialogEvent> listen(ValueChanged<DialogEvent> onData) {
    return _dialogStream.stream.listen(onData);
  }
}

class DialogEvent {
  const DialogEvent();
}
