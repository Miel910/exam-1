import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

data(Request _) async {
  var input = await File('data.json').readAsString();
  var map = jsonDecode(input);

  return Response.ok(json.encode(input));
}
