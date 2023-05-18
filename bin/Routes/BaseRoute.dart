import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/Data.dart';
import '../Responses/Info.dart';
import '../Responses/Login.dart';
import '../Responses/Post.dart';

class BaseRoute {
  Handler get handler {
    final router = Router()
      ..get('/', checkServer)
      ..post('/login', logIn)
      ..post('/post', postImage)
      ..post('/info', userInfo)
      ..all('/data', data)
      ..delete('/delete', checkServer)
      ..put('/update', checkServer);

    return router;
  }

  // Check if server is working
  Response checkServer(Request _) => Response.ok('Server is working.');
}
