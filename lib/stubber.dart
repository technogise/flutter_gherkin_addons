import 'dart:collection';
import 'dart:io';
import 'package:mock_web_server/mock_web_server.dart';
class Stubber {
  MockWebServer _mockWebServer = MockWebServer(port: 8081);
  HashMap<String,Stub> stubs=HashMap();
  start() async {
    await _mockWebServer.start();
    _mockWebServer.dispatcher = _dispatcher;
  }
  stop() async {
    return _mockWebServer.shutdown();
  }
  stub(Stub stub){
    stubs[stub.to_key()] = stub;
  }
  _request_to_key(HttpRequest request){
    return request.method + ":" + request.uri.toString();
  }
  Future<MockResponse> _dispatcher(HttpRequest request) async {
    if( stubs.containsKey(_request_to_key(request))){
      var _stub=stubs[_request_to_key(request)];
      return MockResponse()
        ..httpCode = _stub._response._statusCode
        ..body = _stub._response._body
        ..headers = _stub._response.headers;
    }
    return _defaultAnswer;
  }
  get _defaultAnswer => MockResponse()..httpCode = 404;
}
class Stub{
  final String url;
  final String method;
  final Response _response;

  Stub(this.method,this.url, this._response);
  String to_key(){
    return this.method + ":" + this.url;
  }
}
class Response {
  int _statusCode;
  String _body;
  Map<String, String> headers;

  Response(this._statusCode, this._body, {this.headers});
}