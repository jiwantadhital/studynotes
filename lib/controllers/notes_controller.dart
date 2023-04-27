import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:studynotes/models/all_notes_model.dart';
import 'package:studynotes/models/all_subjects_model.dart';
import 'package:studynotes/models/chapter_model.dart';
import 'package:studynotes/models/lab_model.dart';
import 'package:studynotes/models/question_model.dart';
import 'package:studynotes/models/qyear_model.dart';
import 'package:studynotes/models/semester_model.dart';
import 'package:studynotes/models/solution_model.dart';
import 'package:studynotes/models/subject_model.dart';
import 'package:studynotes/models/syllabus_model.dart';
import 'package:studynotes/repositories/get_repo.dart';
import 'package:studynotes/resources/constants.dart';

class NotesController{
    GetRepo getRepository = GetRepo();

//subjects
  List<SemesterModel>  semesterModel = [];

  Future<List<SemesterModel>> getSemester() async{
    var response = await getRepository.getRepository(ApiClass.semesterApi);
    List data = jsonDecode(response.body);
    print(response.body);
   semesterModel = data.map((e) => SemesterModel.fromJson(e)).toList();
    return data.map(((e)=> SemesterModel.fromJson(e))).toList();  
  }


  //subjects
  List<SubjectModel>  subjectModel = [];

  Future<List<SubjectModel>> getSubject(id) async{
    var response = await getRepository.getRepository("${ApiClass.subjectApi}/$id");
    List data = jsonDecode(response.body);
   subjectModel = data.map((e) => SubjectModel.fromJson(e)).toList();
    return data.map(((e)=> SubjectModel.fromJson(e))).toList();  
  }

  //labs
  List<LabModel>  labModel = [];

  Future<List<LabModel>> getLabs(id) async{
    var response = await getRepository.getRepository("${ApiClass.labApi}/$id");
    List data = jsonDecode(response.body);
   labModel = data.map((e) => LabModel.fromJson(e)).toList();
    return data.map(((e)=> LabModel.fromJson(e))).toList();  
  }


  //allsubjects
  List<AllSubjectModel>  allSubjectmodel = [];

  Future<List<AllSubjectModel>> getAllSubject() async{
    var response = await getRepository.getRepository(ApiClass.allsubjectApi);
    List data = jsonDecode(response.body);
   allSubjectmodel = data.map((e) => AllSubjectModel.fromJson(e)).toList();
    return data.map(((e)=> AllSubjectModel.fromJson(e))).toList();  
  }

  //syllabus
  List<SyllabusModel>  syllabusModel = [];

  Future<List<SyllabusModel>> getSyllabus(id) async{
    var response = await getRepository.getRepository("${ApiClass.syllabusApi}/$id");
    List data = jsonDecode(response.body);
   syllabusModel = data.map((e) => SyllabusModel.fromJson(e)).toList();
    return data.map(((e)=> SyllabusModel.fromJson(e))).toList();  
  }

  //questions
  List<QuestionModel>  questionModel = [];

  Future<List<QuestionModel>> getQuestions(id, yearId) async{
    var response = await getRepository.getRepository("${ApiClass.questionApi}/$id/$yearId");
    List data = jsonDecode(response.body);
   questionModel = data.map((e) => QuestionModel.fromJson(e)).toList();
    return data.map(((e)=> QuestionModel.fromJson(e))).toList();  
  }

  //solutions
  List<SolutionModel>  solutionModel = [];

  Future<List<SolutionModel>> getSolutions(id, yearId) async{
    var response = await getRepository.getRepository("${ApiClass.solutionApi}/$id/$yearId");
    List data = jsonDecode(response.body);
   solutionModel = data.map((e) => SolutionModel.fromJson(e)).toList();
    return data.map(((e)=> SolutionModel.fromJson(e))).toList();  
  }

  //question year
  List<QyearModel>  qyearModel = [];

  Future<List<QyearModel>> getQyear() async{
    var response = await getRepository.getRepository(ApiClass.qyearApi);
    List data = jsonDecode(response.body);
   qyearModel = data.map((e) => QyearModel.fromJson(e)).toList();
    return data.map(((e)=> QyearModel.fromJson(e))).toList();  
  }

  //chapters
  List<ChapterModel>  chapterModel = [];

  Future<List<ChapterModel>> getChapters(id) async{
    var response = await getRepository.getRepository("${ApiClass.chapterApi}/$id");
    List data = jsonDecode(response.body);
   chapterModel = data.map((e) => ChapterModel.fromJson(e)).toList();
    return data.map(((e)=> ChapterModel.fromJson(e))).toList();  
  }


//All Notes
// Future<AllNotesModel> fetchData(String datas, Function(AllNotesModel) callback) {
//   return compute(_getData, {'datas': datas, 'callback': callback});
// }

// AllNotesModel _getData(Map<String, dynamic> data) {
//   final datas = data['datas'];
//   final callback = data['callback'];
//   final allNotesModel = AllNotesModel.fromJson(jsonDecode(datas));
//   callback(allNotesModel); // Execute callback on the main isolate
//   return allNotesModel;
// }
//   AllNotesModel allNotesModel = AllNotesModel();
//   List allnotes = [];
// Future<AllNotesModel> getNotes(id) async {
//   final response = await getRepository.getRepository("${ApiClass.allNotesApi}/${id}");
//   final allNotesModelCompleter = Completer<AllNotesModel>();
//   final allNotesModel = AllNotesModel.fromJson(jsonDecode(response.body));
//      allnotes =[];
//    allnotes.add(allNotesModel);
//   allNotesModelCompleter.complete(allNotesModel);
//   return allNotesModelCompleter.future;
// }
Future<AllNotesModel> fetchData(String datas ){
  return compute(_getData,datas);
}

AllNotesModel _getData(String encodedJson){
  return AllNotesModel.fromJson(jsonDecode(encodedJson));
}

  AllNotesModel allNotesModel = AllNotesModel();
  List allnotes = [];

  Future<AllNotesModel> getNotes(id) async{
    var response = await getRepository.getRepository("${ApiClass.allNotesApi}/$id");
    var data = fetchData(response.body);
   allNotesModel = AllNotesModel.fromJson(jsonDecode(response.body));
   allnotes =[];
   allnotes.add(allNotesModel);
    return data;  
  }



}