import 'package:movie_app_flutter/core/entity/keyword.dart';
import 'package:movie_app_flutter/core/models/keyword.dart';

class Keyword {
  static KeywordEntity toEntity(KeywordModel keywordModel) {
    return KeywordEntity(
      name: keywordModel.name,
      id: keywordModel.id,
    );
  }
}
