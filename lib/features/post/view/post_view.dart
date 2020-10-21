import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_http/features/post/view_model/post_view_model.dart';

class PostView extends StatelessWidget {
  final _viewModel = PostViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _viewModel.getAllPost();
        },
      ),
      body: Center(child: Observer(
        builder: (_) {
          return ListView.builder(
              itemCount: _viewModel.posts.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(_viewModel.posts[index].title),
                    subtitle: Text(_viewModel.posts[index].body),
                    trailing: Text(_viewModel.posts[index].userId.toString()),
                  ));
        },
      )),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: Text("Soner97"),
        leading: Observer(
          builder: (_) {
            return Visibility(
              visible: _viewModel.isServicesRequestLoading,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepPurple,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            );
          },
        ));
  }
}
