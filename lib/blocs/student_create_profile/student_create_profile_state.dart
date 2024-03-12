import 'package:equatable/equatable.dart';
import 'package:studenthub/models/student_create_profile/education_model.dart';
import 'package:studenthub/models/student_create_profile/language_model.dart';
import 'package:studenthub/models/student_create_profile/skillset_model.dart';

class StudentCreateProfileState extends Equatable {
  final List<SkillSet> skillset;
  final List<Language> languages;
  final List<Education> edutcations;
  final bool isChange;

  const StudentCreateProfileState(
      {required this.skillset, required this.isChange, required this.languages, required this.edutcations});

  @override
  List<Object?> get props => [skillset, isChange, languages, edutcations];

  StudentCreateProfileState update({
    List<SkillSet>? skillset,
    bool? isChange,
    List<Language>? languages,
    List<Education>? edutcations,
  }) {
    return StudentCreateProfileState(
      skillset: skillset ?? this.skillset,
      isChange: isChange ?? this.isChange,
      languages: languages ?? this.languages,
      edutcations: edutcations ?? this.edutcations,
    );
  }
}