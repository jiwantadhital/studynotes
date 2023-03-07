import 'dart:convert';

import 'package:studynotes/models/question_model.dart';
import 'package:studynotes/models/qyear_model.dart';
import 'package:studynotes/models/semester_model.dart';
import 'package:studynotes/models/subject_model.dart';
import 'package:studynotes/models/syllabus_model.dart';
import 'package:studynotes/repositories/get_repo.dart';
import 'package:studynotes/resources/constants.dart';

class NotesController{
    GetRepo getRepository = GetRepo();

//subjects
  List<SemesterModel>  semesterModel = [];

  Future<List<SemesterModel>> getSemester() async{
    var response = await getRepository.getRepository("${ApiClass.semesterApi}");
    List data = jsonDecode(response.body);
    print(response.body);
   semesterModel = data.map((e) => SemesterModel.fromJson(e)).toList();
    return data.map(((e)=> SemesterModel.fromJson(e))).toList();  
  }


  //subjects
  List<SubjectModel>  subjectModel = [];

  Future<List<SubjectModel>> getSubject(id) async{
    var response = await getRepository.getRepository("${ApiClass.subjectApi}/${id}");
    List data = jsonDecode(response.body);
   subjectModel = data.map((e) => SubjectModel.fromJson(e)).toList();
    return data.map(((e)=> SubjectModel.fromJson(e))).toList();  
  }

  //syllabus
  List<SyllabusModel>  syllabusModel = [];

  Future<List<SyllabusModel>> getSyllabus(id) async{
    var response = await getRepository.getRepository("${ApiClass.syllabusApi}/${id}");
    List data = jsonDecode(response.body);
   syllabusModel = data.map((e) => SyllabusModel.fromJson(e)).toList();
    return data.map(((e)=> SyllabusModel.fromJson(e))).toList();  
  }

  //questions
  List<QuestionModel>  questionModel = [];

  Future<List<QuestionModel>> getQuestions(id, year_id) async{
    var response = await getRepository.getRepository("${ApiClass.questionApi}/${id}/${year_id}");
    List data = jsonDecode(response.body);
   questionModel = data.map((e) => QuestionModel.fromJson(e)).toList();
    return data.map(((e)=> QuestionModel.fromJson(e))).toList();  
  }

  //question year
  List<QyearModel>  qyearModel = [];

  Future<List<QyearModel>> getQyear() async{
    var response = await getRepository.getRepository("${ApiClass.qyearApi}");
    List data = jsonDecode(response.body);
   qyearModel = data.map((e) => QyearModel.fromJson(e)).toList();
    return data.map(((e)=> QyearModel.fromJson(e))).toList();  
  }
}