import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'Routes/BaseRoute.dart';

void main() {
  withHotreload(() => createServer(), logLevel: Level.INFO);
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;

  final pipeline = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(BaseRoute().handler);

  final port = int.parse(Platform.environment['PORT'] ?? '1818');
  final server = await serve(pipeline, ip, port);
  print(
    'Server listening on port http://${server.address.host}:${server.port}',
  );

  return server;
}
