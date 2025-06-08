
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    DateTime? dob,
    String? sex,
    String? profileImage,
    String? glucoseValue,
    String? heartRateValue,
    String? stepsValue,
    
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  

}
  
