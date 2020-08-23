import 'package:flutter/material.dart';
import 'package:flutter_all/http/httpRequests/http_service.dart';
import 'package:flutter_all/http/httpRequests/post_model.dart';

class PostDetails extends StatefulWidget {
  final Post post;
  final HttpService httpService = HttpService();
  PostDetails({@required this.post});
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () async {
          await widget.httpService.deletePost(widget.post.id);
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              ListTile(
                title: Text("Title"),
                subtitle: Text(widget.post.title),
              ),
              ListTile(
                title: Text("ID"),
                subtitle: Text(widget.post.id.toString()),
              ),
              ListTile(
                title: Text("Body"),
                subtitle: Text(widget.post.body.toString()),
              ),
              ListTile(
                title: Text("User ID"),
                subtitle: Text(widget.post.userId.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
