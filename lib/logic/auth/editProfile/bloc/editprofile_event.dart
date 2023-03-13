// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'editprofile_bloc.dart';

abstract class EditprofileEvent extends Equatable {
  const EditprofileEvent();

  @override
  List<Object> get props => [];
}

class EditingEvent extends EditprofileEvent {
  String name;
  String phone;
  String? college;
  String sem;
  String image;
  EditingEvent({
    required this.name,
    required this.phone,
    this.college,
    required this.sem,
    required this.image,
  });
}

