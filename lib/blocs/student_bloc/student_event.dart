import 'package:flutter/material.dart';
import 'package:studenthub/models/student/student_create_profile/education_model.dart';
import 'package:studenthub/models/student/student_create_profile/language_model.dart';
import 'package:studenthub/models/student/student_create_profile/project_model.dart';
import 'package:studenthub/models/student/student_create_profile/skillset_model.dart';

@immutable
abstract class StudentEvent {}

class GetAllTeckStackEvent extends StudentEvent {
  final Function? onSuccess;
  GetAllTeckStackEvent({this.onSuccess});
}

class GetAllSkillSetEvent extends StudentEvent {
  final Function? onSuccess;
  GetAllSkillSetEvent({this.onSuccess});
}

class GetAllEducationEvent extends StudentEvent {
  final Function? onSuccess;
  final int id;
  GetAllEducationEvent({this.onSuccess, required this.id});
}

class GetAllExperienceEvent extends StudentEvent {
  final Function? onSuccess;
  final int id;
  GetAllExperienceEvent({this.onSuccess, required this.id});
}

class AddSkillSetEvent extends StudentEvent {
  final SkillSet skill;

  AddSkillSetEvent(this.skill);
}

class RemoveSkillSetEvent extends StudentEvent {
  final SkillSet skill;

  RemoveSkillSetEvent(this.skill);
}

class AddLanguageEvent extends StudentEvent {
  final Language language;
  final Function? onSuccess;

  AddLanguageEvent({required this.language, this.onSuccess});
}

class RemoveLanguageEvent extends StudentEvent {
  final Language language;
  final Function? onSuccess;

  RemoveLanguageEvent({required this.language, this.onSuccess});
}

class UpdateLanguageEvent extends StudentEvent {
  final List<Language> languages;
  final int userId;
  final Function? onSuccess;

  UpdateLanguageEvent({required this.languages, required this.onSuccess, required this.userId});
}

class GetAllLanguageEvent extends StudentEvent {
  final int userId;
  final Function? onSuccess;

  GetAllLanguageEvent({required this.onSuccess, required this.userId});
}

class AddEducationEvent extends StudentEvent {
  final Education education;
  final Function? onSuccess;

  AddEducationEvent({required this.education, required this.onSuccess});
}

class RemoveEducationEvent extends StudentEvent {
  final Education education;
  final Function? onSuccess;

  RemoveEducationEvent({required this.education, required this.onSuccess});
}

class UpdateEducationEvent extends StudentEvent {
  final List<Education> educations;
  final int userId;
  final Function? onSuccess;

  UpdateEducationEvent({required this.educations, required this.onSuccess, required this.userId});
}

class AddProjectEvent extends StudentEvent {
  final ProjectResume project;
  final Function? onSuccess;

  AddProjectEvent({required this.project, required this.onSuccess});
}

class UpdateProjectEvent extends StudentEvent {
  final ProjectResume project;
  final Function? onSuccess;

  UpdateProjectEvent({required this.project, required this.onSuccess});
}

class RemoveProjectEvents extends StudentEvent {
  final ProjectResume project;
  final Function? onSuccess;

  RemoveProjectEvents({required this.project, required this.onSuccess});
}