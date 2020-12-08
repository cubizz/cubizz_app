part of 'index.dart';

class UserImage extends BaseModel {
  FileModel _image;
  UserAnswer _answer;
  int _sortOrder;

  FileModel get image => _image;
  UserAnswer get answer => _answer;
  int get sortOrder => _sortOrder;

  List<Color> get gradient => _answer?.gradient ?? _answer?.question?.gradient;

  Color get color => gradient.isExistAndNotEmpty
      ? null
      : _answer != null
          ? _answer._color ??
              _answer.question?.color ??
              ColorOfAnswer.defaultColor.color
          : Colors.transparent;
  Color get textColor => _answer != null
      ? _answer.textColor ??
          _answer.question?.textColor ??
          ColorOfAnswer.defaultColor.textColor
      : null;

  double get opacity => _image != null ? Config.userImageOpacity : 1.0;

  @override
  void mapping(Mapper map) {
    super.mapping(map);
    map<FileModel>('image', _image, (v) => _image = v);
    map<UserAnswer>('userAnswer', _answer, (v) => _answer = v);
    map('sortOrder', _sortOrder, (v) => _sortOrder = v);
  }

  static String get graphqlQuery => '''{
        id
        image ${FileModel.graphqlQuery}
        userAnswer ${UserAnswer.graphqlQuery}
        sortOrder
      }''';
}
