class ZukartSocket {
  static String socketServer = "";
  // static String socketServer = "https://socket.zukarte.com";
  // static String socketServer = "http://13.203.196.229:6000/";

  /// QA
  // static String socketServer = "http://13.203.196.229:4000/";   //// DEV
  // static String socketServer = "https://socket.zukarte.com";

  static setDevId() {
    socketServer = "http://13.232.222.229:5000/";
  }

  static setQaId() {
    socketServer = "http://13.203.196.229:5000/";
  }
}
