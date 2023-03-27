import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:studynotes/controllers/notices_controller.dart';
import 'package:studynotes/models/notice_model.dart';

part 'notices_event.dart';
part 'notices_state.dart';

class NoticesBloc extends HydratedBloc<NoticesEvent, NoticesState> {
  int page =1;
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  int finalNo = 0;
  List<NoticeModel> noticeModel = [];
  NoticeController noticeController;
  NoticesBloc({required this.noticeController}) : super(NoticesInitial()) {
    scrollController.addListener(() {
     add(NoticeFetchingEvent()); 
    },);
    on<NoticeGetEvent>((event, emit) async{
      emit(NoticesLoading());
      try{
        var data = await noticeController.getNotice(page);
        emit(NoticesGot(noticeModel: data));
      }
      catch(e){
        if(noticeModel.isEmpty){
        emit(NoticesError(error: e.toString()));
        }
        else{
          emit(NoticesGot(noticeModel: noticeModel));
        }
      }
    });

    on<NoticeFetchingEvent>((event, emit) async{
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        isLoadingMore = true;
        page++;
        var data = await noticeController.getNotice(page);
        finalNo = finalNo+data.length;
        var no = noticeController.pageNo;
        if(finalNo==no){
          isLoadingMore=false;
        }
        else{
         isLoadingMore = true;
        }
        emit(NoticesGot(noticeModel: [...state.noticeModel, ...data]));
      }
    },);
  }
  
  @override
  NoticesState? fromJson(Map<String, dynamic> json) {
       try {
      final noticeModelList = (json['noticeModel'] as List)
          .map((e) => NoticeModel.fromJson(e))
          .toList();
          noticeModel = noticeModelList;
      return NoticesGot(noticeModel: noticeModelList);
    } catch (_) {
      return null;
    }
  }
  
  @override
  Map<String, dynamic>? toJson(NoticesState state) {
    if(state is NoticesGot){
      return {'noticeModel': state.noticeModel.map((e) => e.toJson()).toList()};
   }
   return null;
  }
}
