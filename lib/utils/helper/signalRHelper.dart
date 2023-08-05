

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart' as wsc;
import 'package:web_socket_channel/io.dart';

import 'dart:html' as html;

class MQTTClientManager {
  MqttServerClient client =
  MqttServerClient.withPort('138.68.82.103', 'mobile_client', 1883);


  Future<int> connect() async {
    client.logging(on: true);
    client.keepAlivePeriod = 60;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    final connMessage =
    MqttConnectMessage().startClean().withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;

    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      debugPrint('MQTTClient::Client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      debugPrint('MQTTClient::Socket exception - $e');
      client.disconnect();
    }

    return 0;
  }

  void disconnect(){
    client.disconnect();
  }

  void subscribe(String topic) {
    client.subscribe(topic, MqttQos.atLeastOnce);
  }

  void onConnected() {
    debugPrint('MQTTClient::Connected');
  }

  void onDisconnected() {
    debugPrint('MQTTClient::Disconnected');
  }

  void onSubscribed(String topic) {
    debugPrint('MQTTClient::Subscribed to topic: $topic');
  }

  void pong() {
    debugPrint('MQTTClient::Ping response received');
  }

  void publishMessage(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  Stream<List<MqttReceivedMessage<MqttMessage>>>? getMessagesStream() {
    return client.updates;
  }
}

class WebSocketClientManager {
  IOWebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;

  Future<int> connect() async {
    _channel = IOWebSocketChannel.connect('ws://localhost:5002/ws');
    debugPrint('--------------------------------------------------------------------------');
    debugPrint('${_channel?.sink.done}');
    debugPrint('--------------------------------------------------------------------------');
    return 0;
  }

  void disconnect() {
    _subscription?.cancel();
    _channel?.sink.close();
  }

  void subscribe(String topic) {
    // WebSocket üzerinden MQTT sunucusuna abone olmak için bu kısmı WebSocket protokolüne uygun şekilde değiştirmeniz gerekebilir.
  }

  void onConnected() {
    debugPrint('MQTTClient::Connected');
    // Abonelikleri burada başlatabilirsiniz.
  }

  void onDisconnected() {
    debugPrint('MQTTClient::Disconnected');
    // Abonelikleri burada iptal edebilirsiniz.
  }

  void onSubscribed(String topic) {
    debugPrint('MQTTClient::Subscribed to topic: $topic');
  }

  void pong() {
    debugPrint('MQTTClient::Ping response received');
  }

  void publishMessage(String topic, String message) {
    final Map<String, dynamic> payload = {
      'topic': topic,
      'message': message,
    };
    _channel?.sink.add(payload.toString());
  }

  Stream<dynamic>? getMessagesStream() {
    // WebSocket üzerinden gelen mesajları dinlemek için bu kısmı WebSocket protokolüne uygun şekilde değiştirmeniz gerekebilir.
    return _channel?.stream;
  }

  // Dinlemeyi başlatmak ve durdurmak için metotlar
  void startListening() {
    _subscription = _channel?.stream.listen((event) {
      // Mesajları dinleyin ve istediğiniz işlemleri yapın.
      debugPrint('Mesaj geldi: $event');
    });
  }

  void stopListening() {
    _subscription?.cancel();
  }
}


class WebSocketClientManagerWeb {
  html.WebSocket? _webSocket;
  StreamSubscription<html.MessageEvent>? _subscription;

  Future<int> connect() async {
    _webSocket = html.WebSocket('ws://localhost:5002/ws');
    debugPrint('--------------------------------------------------------------------------');
    debugPrint('${_webSocket?.readyState}');
    debugPrint('--------------------------------------------------------------------------');

    // WebSocket açıldığında
    _webSocket?.onOpen.listen((event) {
      onConnected();
    });

    // WebSocket kapandığında
    _webSocket?.onClose.listen((event) {
      onDisconnected();
    });

    return 0;
  }

  void disconnect() {
    _subscription?.cancel();
    _webSocket?.close();
  }

  void subscribe(String topic) {
    // WebSocket üzerinden MQTT sunucusuna abone olmak için bu kısmı WebSocket protokolüne uygun şekilde değiştirmeniz gerekebilir.
  }

  void onConnected() {
    debugPrint('MQTTClient::Connected');
    // Abonelikleri burada başlatabilirsiniz.
  }

  void onDisconnected() {
    debugPrint('MQTTClient::Disconnected');
    // Abonelikleri burada iptal edebilirsiniz.
  }

  void onSubscribed(String topic) {
    debugPrint('MQTTClient::Subscribed to topic: $topic');
  }

  void pong() {
    debugPrint('MQTTClient::Ping response received');
  }

  void publishMessage(String topic, String message) {
    final Map<String, dynamic> payload = {
      'topic': topic,
      'message': message,
    };
    _webSocket?.send(payload.toString());
  }

  Stream<html.MessageEvent>? getMessagesStream() {
    // WebSocket üzerinden gelen mesajları dinlemek için bu kısmı WebSocket protokolüne uygun şekilde değiştirmeniz gerekebilir.
    return _webSocket?.onMessage;
  }

  // Dinlemeyi başlatmak ve durdurmak için metotlar
  void startListening() {
    _subscription = _webSocket?.onMessage.listen((event) {
      // Mesajları dinleyin ve istediğiniz işlemleri yapın.
      debugPrint('Mesaj geldi: ${event.data}');
    });
  }

  void stopListening() {
    _subscription?.cancel();
  }
}