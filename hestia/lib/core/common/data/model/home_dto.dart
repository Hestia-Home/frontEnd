import 'package:hestia/core/common/util/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_dto.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
  fieldRename: FieldRename.snake,
)
class HomeDto {
  final String homeId;
  final bool? isConfirmed;
  const HomeDto({
    required this.homeId,
    this.isConfirmed,
  });

  factory HomeDto.fromJson(Json json) => _$HomeDtoFromJson(json);

  Json toJson() => _$HomeDtoToJson(this);
}
