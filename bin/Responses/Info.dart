import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

Future<Response> userInfo(Request req) async {
  try {
    // final Map body = json.decode(await req.readAsString());
    final contentType = MediaType.parse(req.headers["Content-Type"]!);

    // var input = await File('data.json').readAsString();

    // final file = File('bin/user_info/');

    // final save = await req.read().toList();
    // await file.writeAsString(save);
    // print(body);

    final body = await req.read().expand((bit) => bit).toList();
    final id = Random().nextInt(99999999);
    final file = File('bin/user_images/$id');

    return Response.ok("Your info has been saved successfully!");
  } catch (error) {
    // log(error.toString());

    return Response.badRequest(
      body: 'Something wrong happend, Please try again.',
    );
  }
}
