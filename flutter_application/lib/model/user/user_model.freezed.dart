// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  String? get id;
  String? get firstName;
  String? get lastName;
  String? get email;
  DateTime? get dob;
  String? get sex;
  String? get profileImage;
  String? get glucoseValue;
  String? get heartRateValue;
  String? get stepsValue;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.glucoseValue, glucoseValue) ||
                other.glucoseValue == glucoseValue) &&
            (identical(other.heartRateValue, heartRateValue) ||
                other.heartRateValue == heartRateValue) &&
            (identical(other.stepsValue, stepsValue) ||
                other.stepsValue == stepsValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      dob, sex, profileImage, glucoseValue, heartRateValue, stepsValue);

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, dob: $dob, sex: $sex, profileImage: $profileImage, glucoseValue: $glucoseValue, heartRateValue: $heartRateValue, stepsValue: $stepsValue)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? email,
      DateTime? dob,
      String? sex,
      String? profileImage,
      String? glucoseValue,
      String? heartRateValue,
      String? stepsValue});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? dob = freezed,
    Object? sex = freezed,
    Object? profileImage = freezed,
    Object? glucoseValue = freezed,
    Object? heartRateValue = freezed,
    Object? stepsValue = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sex: freezed == sex
          ? _self.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      glucoseValue: freezed == glucoseValue
          ? _self.glucoseValue
          : glucoseValue // ignore: cast_nullable_to_non_nullable
              as String?,
      heartRateValue: freezed == heartRateValue
          ? _self.heartRateValue
          : heartRateValue // ignore: cast_nullable_to_non_nullable
              as String?,
      stepsValue: freezed == stepsValue
          ? _self.stepsValue
          : stepsValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  const _UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.dob,
      this.sex,
      this.profileImage,
      this.glucoseValue,
      this.heartRateValue,
      this.stepsValue});
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final DateTime? dob;
  @override
  final String? sex;
  @override
  final String? profileImage;
  @override
  final String? glucoseValue;
  @override
  final String? heartRateValue;
  @override
  final String? stepsValue;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.glucoseValue, glucoseValue) ||
                other.glucoseValue == glucoseValue) &&
            (identical(other.heartRateValue, heartRateValue) ||
                other.heartRateValue == heartRateValue) &&
            (identical(other.stepsValue, stepsValue) ||
                other.stepsValue == stepsValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      dob, sex, profileImage, glucoseValue, heartRateValue, stepsValue);

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, dob: $dob, sex: $sex, profileImage: $profileImage, glucoseValue: $glucoseValue, heartRateValue: $heartRateValue, stepsValue: $stepsValue)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? email,
      DateTime? dob,
      String? sex,
      String? profileImage,
      String? glucoseValue,
      String? heartRateValue,
      String? stepsValue});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? dob = freezed,
    Object? sex = freezed,
    Object? profileImage = freezed,
    Object? glucoseValue = freezed,
    Object? heartRateValue = freezed,
    Object? stepsValue = freezed,
  }) {
    return _then(_UserModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sex: freezed == sex
          ? _self.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      glucoseValue: freezed == glucoseValue
          ? _self.glucoseValue
          : glucoseValue // ignore: cast_nullable_to_non_nullable
              as String?,
      heartRateValue: freezed == heartRateValue
          ? _self.heartRateValue
          : heartRateValue // ignore: cast_nullable_to_non_nullable
              as String?,
      stepsValue: freezed == stepsValue
          ? _self.stepsValue
          : stepsValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
