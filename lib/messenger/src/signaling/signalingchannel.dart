
/**
 * SignalingChannel
 * 
 * bidirectional communication channel to establish peer connections
 * 
 * @author Christian Hotz-Behofsits <chris.hotz.behofsits@gmail.com>
 * @version 1
 */


part of messenger.signaling;

abstract class SignalingChannel{
  StreamController<NewMessageEvent> newMessageController;
  Completer<String> connection_completer = new Completer<String>();
  
  /**
   * constructor
   */
  SignalingChannel(){
    ///init
    newMessageController = new StreamController<NewMessageEvent>.broadcast();
  }
  
  /**
   * unique identifer
   */
  int get id => this.hashCode;
  
  /**
   * establish connection
   */
  void connect(var options);
  
  /**
   * send String to other side of Channel
   */
  send(MessengerMessage);
  
  /**
   * listen for incoming messages
   */
  Stream get onReceive => newMessageController.stream;
  
  /**
   * close connection and free ressources
   */
  close();
}