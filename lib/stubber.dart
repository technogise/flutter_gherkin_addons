import 'dart:collection';
import 'dart:io';

import 'package:mock_web_server/mock_web_server.dart';

class Stubber {
  Set<Uri> missingStubs = Set<Uri>();

  MockWebServer _mockWebServer = MockWebServer(port: 8081);

  HashMap<String, Stub> stubs = HashMap();
  start() async {
    await _mockWebServer.start();
    _mockWebServer.dispatcher = _dispatcher;
  }

  stop() async {
    return _mockWebServer.shutdown();
  }

  stub(Stub stub) {
    stubs[stub.toKey()] = stub;
  }

  _requestToKey(HttpRequest request) {
    return request.method + ":" + request.uri.toString();
  }

  Future<MockResponse> _dispatcher(HttpRequest request) async {
    if (stubs.containsKey(_requestToKey(request))) {
      var _stub = stubs[_requestToKey(request)];
      var _response = _stub._responseBuilder(request);
      return MockResponse()
        ..httpCode = _response._statusCode
        ..body = _response._body
        ..headers = _response.headers;
    } else {
      missingStubs.add(request.requestedUri);
    }
    return _defaultAnswer;
  }

  get _defaultAnswer => MockResponse()..httpCode = 404;
}

typedef Response ResponseBuilder(HttpRequest request);

class Stub {
  final String url;
  final String method;
  final ResponseBuilder _responseBuilder;

  Stub(this.method, this.url, this._responseBuilder);
  String toKey() {
    return this.method + ":" + this.url;
  }
}

class Response {
  int _statusCode;
  String _body;
  Map<String, String> headers;

  Response(this._statusCode, this._body, {this.headers});
}

class StubFor {
  static Stub staticHttpGet(String url, Response response) {
    return _staticStub("GET", url, response);
  }

  static Stub staticHttpPost(String url, Response response) {
    return _staticStub("POST", url, response);
  }

  static Stub staticHttpPut(String url, Response response) {
    return _staticStub("PUT", url, response);
  }

  static Stub staticHttpPatch(String url, Response response) {
    return _staticStub("PATCH", url, response);
  }

  static Stub staticHttpDelete(String url, Response response) {
    return _staticStub("DELETE", url, response);
  }

  static Stub _staticStub(String method, String url, Response response) {
    return Stub(method, url, (request) {
      return response;
    });
  }

  static Stub httpGet(String url, ResponseBuilder responseBuilder) {
    return Stub("GET", url, responseBuilder);
  }

  static Stub httpPost(String url, ResponseBuilder responseBuilder) {
    return Stub("POST", url, responseBuilder);
  }

  static Stub httpPut(String url, ResponseBuilder responseBuilder) {
    return Stub("PUT", url, responseBuilder);
  }

  static Stub httpPatch(String url, ResponseBuilder responseBuilder) {
    return Stub("PATCH", url, responseBuilder);
  }

  static Stub httpDelete(String url, ResponseBuilder responseBuilder) {
    return Stub("DELETE", url, responseBuilder);
  }
}
