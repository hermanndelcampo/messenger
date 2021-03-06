part of messenger.events;


 /**
  * NewMessageEvent
  * 
  * this event is triggered if a new message receives
  * 
  * @author Christian Hotz-Behofsits <chris.hotz.behofsits@gmail.com>
  */

class NewMessageEvent implements Event{
  var path;
  var defaultPrevented;
  var currentTarget;
  var clipboardData;
  var cancelable = false;
  var bubbles;
  var type;
  var eventPhase;
  var target;
  var matchingTarget;
  var timeStamp;
  
  void stopImmediatePropagation(){}
  void preventDefault(){}
  void stopPropagation(){}
  
  final MessengerMessage data;
  
  NewMessageEvent(this.data);
  
  MessengerMessage getMessage() => data;
}

