import 'package:hestia/core/common/data/model/home_dto.dart';
import 'package:hestia/core/common/util/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model_dto.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
  fieldRename: FieldRename.snake,
)
class UserModelDto {
  final bool isLoggedIn;
  final String name;
  final bool? isNew;
  final int? age;
  final String? sex;
  final List<HomeDto> homes;

  const UserModelDto({
    required this.isLoggedIn,
    required this.name,
    required this.homes,
    this.isNew,
    this.age,
    this.sex,
  });

  factory UserModelDto.fromJson(Json json) => _$UserModelDtoFromJson(json);

  Json toJson() => _$UserModelDtoToJson(this);
}
