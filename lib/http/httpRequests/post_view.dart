import 'package:flutter/material.dart';
import 'package:flutter_all/http/httpRequests/http_service.dart';
import 'package:flutter_all/http/httpRequests/post_details.dart';
import 'package:flutter_all/http/httpRequests/post_model.dart';

class Postpage extends StatefulWidget {
  @override
  _PostpageState createState() => _PostpageState();
}

class _PostpageState extends State<Postpage> {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> post = snapshot.data;
              return ListView(
                children: post
                    .map((Post post) => ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.id.toString()),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (contex) => PostDetails(post: post,)));
                          },
                        ))
                    .toList(),
              );
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
