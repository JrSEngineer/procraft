abstract class ProcraftClient {
  Future get(String path, {Map<String, String>? headers});
  Future post(String path, {Object? body, Map<String, String>? headers});
  Future put(String path, {Object? body, Map<String, String>? headers});
  Future delete(String path, {Object body, Map<String, String>? headers});
}
