import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:studenthub/blocs/global_bloc/global_event.dart';
import 'package:studenthub/blocs/global_bloc/global_state.dart';
import 'package:studenthub/services/global/global.dart';
import 'package:studenthub/utils/logger.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc()
      : super(const GlobalState(
          dataSourceSkillSet: [],
          dataSourceTeckstacks: [],
        )) {
    on<GetAllTeckStackEventMetadata>(_onGetAllTeckStack);
    on<GetAllSkillSetEventMetadata>(_onGetAllSkillSet);
    on<ResetPasswordEvent>(_onResetPassword);
  }

  GlobalService globalService = GlobalService();

  FutureOr<void> _onGetAllTeckStack(
      GetAllTeckStackEventMetadata event, Emitter<GlobalState> emit) async {
    final response = await globalService.getAllTechStack();
    if (response.statusCode! <= 300) {
      emit(state.update(dataSourceTeckstacks: response.data ?? []));
      event.onSuccess!(response.data);
    }
  }

  FutureOr<void> _onGetAllSkillSet(
      GetAllSkillSetEventMetadata event, Emitter<GlobalState> emit) async {
    try {
      EasyLoading.show(status: 'loading');
      final response = await globalService.getAllSkillSet();
      if (response.statusCode! <= 300) {
        emit(state.update(dataSourceSkillSet: response.data ?? []));
        event.onSuccess!(response.data);
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
      logger.e(e);
    }
  }

  FutureOr<void> _onResetPassword(
      ResetPasswordEvent event, Emitter<GlobalState> emit) async {
    try {
      EasyLoading.show(status: 'loading');
      final response = await globalService.resetPassword(event.email);
      if (response.statusCode! <= 300) {
        event.onSuccess!();
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
      logger.e(e);
    }
  }
}
