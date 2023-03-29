// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'desc_bloc.dart';

abstract class DescState extends Equatable {
  const DescState();
  
  @override
  List<Object> get props => [];
}

class DescInitial extends DescState {}
class DescLoading extends DescState {}
class DescGot extends DescState {
  List<DescDatabaseModel> desc;
  DescGot({
    required this.desc,
  });
}
class DescError extends DescState {
  String message;
  DescError({
    required this.message,
  });
}
