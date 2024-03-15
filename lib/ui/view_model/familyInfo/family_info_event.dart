part of 'family_info_bloc.dart';

@freezed
class FamilyInfoEvent with _$FamilyInfoEvent {
  const factory FamilyInfoEvent.started() = _Started;
  const factory FamilyInfoEvent.postFamilyInfo({
    final String? fathername,
    final String? falive,
    final String? fdisabled,
    final String? focupation,
    final String? fincome,
     final String? mathername,
    final String? malive,
    final String? mdisabled,
    final String? mocupation,
    final String? mincome,
         final String? gathername,
    final String? galive,
    final String? gdisabled,
    final String? gocupation,
    final String? gincome,
    dynamic SiblingsdatafromHive,
    // final int? focupation,
    // final String? fincome,
    // final String? frelation,
    // final String? mothername,
    // final int? malive,
    // final int? mdisabled,
    // final int? mocupation,
    // final int? mincome,
    // final String? mrelation,
    // final String? guardianname,
    // final int? galive,
    // final int? gdisabled,
    // final int? gocupation,
    // final int? gincome,
    // final String? grelation,
    //  final int? student_id,
  }) = PostFamilyInfo;
  //   const factory FamilyInfoEvent.postSibling({
  //   final int? student_id,

  // }) = PostSibling;
}
