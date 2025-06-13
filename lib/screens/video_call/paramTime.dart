class ParamTime {
  String? startCall;
  String? connected;
  int? type;
  String? stopCall;
  String? roomId;

  ParamTime(
      {this.startCall, this.connected, this.type, this.stopCall, this.roomId});

  ParamTime.fromJson(Map<String, dynamic> json) {
    startCall = json['startCall'];
    connected = json['connected'];
    type = json['type'];
    stopCall = json['stopCall'];
    roomId = json['room_id'];
  }

  ParamTime copyWith({
    String? startCall,
    String? connected,
    int? type,
    String? stopCall,
    String? roomId,
  }) {
    return ParamTime(
      startCall: startCall ?? this.startCall,
      connected: connected ?? this.connected,
      type: type ?? this.type,
      stopCall: stopCall ?? this.stopCall,
      roomId: roomId ?? this.roomId,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startCall'] = startCall;
    data['connected'] = connected;
    data['type'] = type;
    data['stopCall'] = stopCall;
    data['room_id'] = roomId;
    return data;
  }
}
