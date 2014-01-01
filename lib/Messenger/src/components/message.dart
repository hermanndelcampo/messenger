library messenger.message;

import 'dart:convert';

class Message{
  final String msg;
  final MessageType mtype;
  
  Message(String this.msg, [MessageType this.mtype = MessageType.STRING]);
  
  
  String toString(){
    return msg;
  }
  
  MessageType getMessageType() => mtype;
  
  static Object serialize(Message value) {
    if (value == null) return null;
    
    final Map<String, String>result = {};
    result["msg"] = value.msg;
    result["mtype"] = MessageType.serialize(value.mtype);
    
    return JSON.encode(result);
  }
  
  factory Message.fromString(String data){
    if (data == null) return null;
    
    Map<String, String> json = JSON.decode(data);
    
    return new Message(json["msg"], new MessageType.fromString(json["mtype"]));
  }
  
}

//result.nextPageToken = identity();
//result.items = map(Event.parse)(json["items"]);
//result.kind = identity(json["kind"]);

/**
 * some sort of enumeration
 */
class MessageType{
  final String name;
  final int value;
  
  static const MessageType STRING = const MessageType._create('STRING', 1);
  static const MessageType SERIALIZED = const MessageType._create('SERIALIZED', 2);
  static const MessageType SIGNAL = const MessageType._create('SIGNAL', 3);
  static const MessageType UNDEFINED = const MessageType._create('UNDEFINED', 4);
  static const MessageType ICE_CANDIDATE = const MessageType._create('ICE_CANDIDATE', 5);
  static const MessageType WEBRTC_OFFER = const MessageType._create('WEBRTC_OFFER', 6);
  static const MessageType WEBRTC_ANSWER = const MessageType._create('WEBRTC_ANSWER', 7);
  
  static const MessageType PEER_ID = const MessageType._create('PEER_ID', 8);
  static const MessageType AKN_PEER_ID = const MessageType._create('AKN_PEER_ID', 9);
  
  const MessageType._create(this.name, this.value);
  
  /**
   * serialize MessageType
   */
  static String serialize(MessageType value) {
    if (value == null) return null;
    final Map<String, String> result = {};
    result["name"] = value.name;
    
    result["value"] = value.value.toString();
    return JSON.encode(result);
  }
  
  /**
   * deserialize MessageType
   */
  factory MessageType.fromString(String data) {
    if (data == null) return null;
    
    final Map<String, String> json = JSON.decode(data);
    
    switch(json["name"]){
      case "DC_CONNECTING":
        return const MessageType._create('DC_CONNECTING', 11);
      case "STRING":
        return const MessageType._create('STRING', 1);
      case "SERIALIZED":
        return const MessageType._create('SERIALIZED', 2);
      case "SIGNAL":
        return const MessageType._create('SIGNAL', 3);
      case "ICE_CANDIDATE":
        return const MessageType._create('ICE_CANDIDATE', 5);
      case "WEBRTC_OFFER":
        return const MessageType._create('WEBRTC_OFFER', 6);
      case "WEBRTC_ANSWER":
        return const MessageType._create('WEBRTC_ANSWER', 7);
      default:
        return const MessageType._create('UNDEFINED', 4);
    }
    
  }
  
}