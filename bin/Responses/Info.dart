import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

userInfo(Request req) async {
  final contentType = MediaType.parse(req.headers["Content-Type"]!);

  print(contentType.type);

  final body = await req.read().first;
  final id = Random().nextInt(99999999);
  final file = File('bin/user_info/$id.${contentType.subtype}');

  await file.writeAsBytes(body);
  print(body);

  return Response.ok("Your info has been saved successfully!");
}
