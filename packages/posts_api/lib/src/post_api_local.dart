import 'dart:convert';

import 'package:posts_api/src/models/post_model.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:rxdart/rxdart.dart';

import 'posts_api_abstract.dart';

class PostsApiLocal extends PostsApi {
  PostsApiLocal() {
    rootBundle.loadString('assets/json/posts.json').then((json) {
      if (json.isNotEmpty) {
        final List<dynamic> data = jsonDecode(json);
        final products = data.map((el) => PostModel.fromJson(el)).toList();
        _productStreamCtrl.add(products);
      } else {
        _productStreamCtrl.add(const []);
      }
    });
  }

  final _productStreamCtrl = BehaviorSubject<List<PostModel>>.seeded(const []);

  @override
  Stream<List<PostModel>> getPosts() => _productStreamCtrl.asBroadcastStream();

  @override
  PostModel getPostById(int id) {
    return _productStreamCtrl.value.firstWhere((post) => post.id == id);
  }
}
