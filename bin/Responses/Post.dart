import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

postImage(Request req) async {
  final contentType = MediaType.parse(req.headers["Content-Type"]!);

  if (contentType.mimeType != 'image/png' &&
      contentType.mimeType != 'image/jpg') {
    return Response.badRequest(body: 'Invalid format.');
  }
  print(contentType.type);

  final body = await req.read().expand((bit) => bit).toList();
  final id = Random().nextInt(99999999);
  final file = File('bin/user_images/$id.${contentType.subtype}');

  await file.writeAsBytes(body);
  print(body);

  return Response.ok("Your image has been published successfully!");
}
