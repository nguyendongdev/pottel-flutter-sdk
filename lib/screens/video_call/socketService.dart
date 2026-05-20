import 'package:pottel_sdk/pottel_sdk_config.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket? _io;
  final String baseUrl = PottelSdkConfig.baseUrlSocket;

  connect() {
    _io =
        IO.io(baseUrl, IO.OptionBuilder().setTransports(['websocket']).build());

    _io!.onConnect((data) => print('Connection established'));
    _io!.onConnectError((data) => print('Connect Error: $data'));
    _io!.onDisconnect((data) => print('Socket.IO server disconnected'));
    print('Connection ${_io!.connected}data');
  }

  disconnect() {
    if (_io != null) {
      _io!.disconnect();
    }
  }

  void on(String event, Function(dynamic data) listener) {
    if (_io != null) {
      _io!.on(event, listener);
    } else {
      print('Socket not connected, cannot listen to event: $event');
    }
  }

  void emit(String event, dynamic data) {
    if (_io != null) {
      _io!.emit(event, data);
    } else {
      print('Socket not connected, cannot emit event: $event');
    }
  }
}
