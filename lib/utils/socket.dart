// ignore: library_prefixes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:studenthub/app.dart';
import 'package:studenthub/blocs/auth_bloc/auth_bloc.dart';
import 'package:studenthub/utils/logger.dart';

class SocketService {
  static final IO.Socket _socket =
      IO.io("https://api.studenthub.dev", OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());
  static final IO.Socket _socketNotification =
      IO.io("https://api.studenthub.dev", OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());

  void initSocket(String token, String projectId) {
    _socket.io.options?['extraHeaders'] = {
      'Authorization': 'Bearer $token',
    };
    _socket.io.options?['query'] = {'project_id': projectId};

    _socket.connect();

    // ignore: avoid_print
    _socket.onConnectError((data) => logger.e('SOCKET ON CONNECT ERROR: $data'));
    // ignore: avoid_print
    _socket.onError((data) => print('SOCKET ON ERROR $data'));
    // ignore: avoid_print
    _socket.on("ERROR", (data) => print('SOCKET ERROR $data'));

    _socket.onConnect((data) => {
          logger.d('Connected'),
        });
  }

  void initSocketForNotification(BuildContext context) {
    _socketNotification.io.options?['extraHeaders'] = {
      'Authorization': 'Bearer ${context.read<AuthBloc>().state.userModel.token ?? ''}',
    };
    _socketNotification.connect();

    // ignore: avoid_print
    _socketNotification.onConnectError((data) => logger.e('SOCKET ON CONNECT ERROR: $data'));
    // ignore: avoid_print
    _socketNotification.onError((data) => print('SOCKET ON ERROR $data'));
    // ignore: avoid_print
    _socketNotification.on("ERROR", (data) => print('SOCKET ERROR $data'));

    _socketNotification.onConnect((data) => {
          logger.d('Connected Notification'),
        });
  }

  // get socket
  IO.Socket get socketNotification => _socketNotification;

  void receiveNotification(String userId, dynamic Function(dynamic) callback) {
    logger.d('NOTI_$userId');
    _socket.on('NOTI_$userId', callback);
  }

  void subscribe(String event, dynamic Function(dynamic) callback) {
    _socket.on(event, callback);
  }

  void receiveMessage(dynamic Function(dynamic) callback) {
    _socket.on('RECEIVE_MESSAGE', callback);
  }

  void sendMessage(dynamic message) {
    _socket.emit('SEND_MESSAGE', message);
  }

  void sendInterview(dynamic data) {
    _socket.emit('SCHEDULE_INTERVIEW', data);
  }

  void receiveInterview(dynamic Function(dynamic) callback) {
    _socket.on('RECEIVE_INTERVIEW', callback);
  }

  void disconnect() {
    _socket.disconnect();
  }
}
