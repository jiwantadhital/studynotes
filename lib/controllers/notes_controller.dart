import 'dart:convert';

import 'package:studynotes/models/semester_model.dart';
import 'package:studynotes/models/subject_model.dart';
import 'package:studynotes/repositories/get_repo.dart';
import 'package:studynotes/resources/constants.dart';

class NotesController{
    GetRepo getRepository = GetRepo();

//subjects
  List<SemesterModel>  semesterModel = [];

  Future<List<SemesterModel>> getSemester() async{
    var response = await getRepository.getRepository("${ApiClass.semesterApi}");
    List data = jsonDecode(response.body);
   semesterModel = data.map((e) => SemesterModel.fromJson(e)).toList();
    return data.map(((e)=> SemesterModel.fromJson(e))).toList();  
  }


  //subjects
  List<SubjectModel>  subjectModel = [];

  Future<List<SubjectModel>> getSubject() async{
    var response = await getRepository.getRepository("${ApiClass.subjectApi}");
    List data = jsonDecode(response.body);
   subjectModel = data.map((e) => SubjectModel.fromJson(e)).toList();
    return data.map(((e)=> SubjectModel.fromJson(e))).toList();  
  }
}