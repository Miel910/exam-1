import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:shelf/shelf.dart';

Future<Response> logIn(Request req) async {
  try {
    final Map body = json.decode(await req.readAsString());

    if (!body.containsKey("Email")) {
      return Response.badRequest(body: 'Please enter your email.');
    }
    if (!body.containsKey("Password")) {
      return Response.badRequest(body: 'Please enter your password.');
    }

    var input = await File('data.json').readAsString();
    var map = jsonDecode(input);
    if (body['Email'] != map['Email'] || body['Password'] != map['Password']) {
      return Response.badRequest(
        body:
            'You have entered wrong email or password, Please try again again.',
      );
    }

    return Response.ok('Welcome!');
  } catch (error) {
    log(error.toString());

    return Response.badRequest(
      body: 'Something wrong happend, Please try again.',
    );
  }
}
