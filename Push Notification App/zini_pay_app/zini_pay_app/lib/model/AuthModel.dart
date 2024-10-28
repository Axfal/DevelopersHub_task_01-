/// success : true
/// data : [{"_id":"6706213fdb3859c3408b3cb3","message":"Test message now","from":"+923339636238","time":"2024-10-9T10:00:00Z"},{"_id":"6706215fdb3859c3408b3cb4","message":"hi hello","from":"03339636238","time":"2024-10-9T10:00:00Z"},{"_id":"6704d65fdb3859c3408b3cad","message":"Test message now","from":"+1234567890","time":"2024-07-31T10:00:00Z"},{"_id":"6704d67fdb3859c3408b3cae","message":"hi","from":"+03339636238","time":"2024-07-31T10:00:00Z"},{"_id":"6704fdccdb3859c3408b3caf","message":"hi","from":"+03339636238","time":"2024-07-31T10:00:00Z"},{"_id":"670560e5db3859c3408b3cb0","message":"INCOMMING_SMS","from":"+1234567890","time":"2024-07-31T10:00:00Z"},{"_id":"670560fcdb3859c3408b3cb1","message":"INCOMMING_SMS","from":"01722983931","time":"2024-07-31T10:00:00Z"},{"_id":"6705611edb3859c3408b3cb2","message":"INCOMMING_SMS","from":"01731090564","time":"2024-07-31T10:00:00Z"}]

class AuthModel {
  AuthModel({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  AuthModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Data>? _data;
AuthModel copyWith({  bool? success,
  List<Data>? data,
}) => AuthModel(  success: success ?? _success,
  data: data ?? _data,
);
  bool? get success => _success;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "6706213fdb3859c3408b3cb3"
/// message : "Test message now"
/// from : "+923339636238"
/// time : "2024-10-9T10:00:00Z"

class Data {
  Data({
      String? id, 
      String? message, 
      String? from, 
      String? time,}){
    _id = id;
    _message = message;
    _from = from;
    _time = time;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _message = json['message'];
    _from = json['from'];
    _time = json['time'];
  }
  String? _id;
  String? _message;
  String? _from;
  String? _time;
Data copyWith({  String? id,
  String? message,
  String? from,
  String? time,
}) => Data(  id: id ?? _id,
  message: message ?? _message,
  from: from ?? _from,
  time: time ?? _time,
);
  String? get id => _id;
  String? get message => _message;
  String? get from => _from;
  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['message'] = _message;
    map['from'] = _from;
    map['time'] = _time;
    return map;
  }

}