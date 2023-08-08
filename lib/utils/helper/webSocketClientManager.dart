import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketClientManager {
  late WebSocketChannel _channel;
  late Stream<dynamic> _messageStream;

  WebSocketClientManager(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _messageStream = _channel.stream;
  }

  StreamSubscription listen(void Function(dynamic data)? onData, {Function? onError, void Function()? onDone, bool cancelOnError = false})
  {
    return _messageStream.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  void send(dynamic data) {
    _channel.sink.add(data);
    _channel.sink.close(status.goingAway);
  }

  void close() {
    _channel.sink.close();
  }
}