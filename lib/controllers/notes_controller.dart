import 'dart:convert';

import 'package:studynotes/models/all_notes_model.dart';
import 'package:studynotes/models/all_subjects_model.dart';
import 'package:studynotes/models/chapter_model.dart';
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


  //allsubjects
  List<AllSubjectModel>  allSubjectmodel = [];

  Future<List<AllSubjectModel>> getAllSubject() async{
    var response = await getRepository.getRepository("${ApiClass.allsubjectApi}");
    List data = jsonDecode(response.body);
   allSubjectmodel = data.map((e) => AllSubjectModel.fromJson(e)).toList();
    return data.map(((e)=> AllSubjectModel.fromJson(e))).toList();  
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

  //solutions
  List<SolutionModel>  solutionModel = [];

  Future<List<SolutionModel>> getSolutions(id, year_id) async{
    var response = await getRepository.getRepository("${ApiClass.solutionApi}/${id}/${year_id}");
    List data = jsonDecode(response.body);
   solutionModel = data.map((e) => SolutionModel.fromJson(e)).toList();
    return data.map(((e)=> SolutionModel.fromJson(e))).toList();  
  }

  //question year
  List<QyearModel>  qyearModel = [];

  Future<List<QyearModel>> getQyear() async{
    var response = await getRepository.getRepository("${ApiClass.qyearApi}");
    List data = jsonDecode(response.body);
   qyearModel = data.map((e) => QyearModel.fromJson(e)).toList();
    return data.map(((e)=> QyearModel.fromJson(e))).toList();  
  }

  //chapters
  List<ChapterModel>  chapterModel = [];

  Future<List<ChapterModel>> getChapters(id) async{
    var response = await getRepository.getRepository("${ApiClass.chapterApi}/${id}");
    List data = jsonDecode(response.body);
   chapterModel = data.map((e) => ChapterModel.fromJson(e)).toList();
    return data.map(((e)=> ChapterModel.fromJson(e))).toList();  
  }

  //all notes
  AllNotesModel allNotesModel = AllNotesModel();
  List allnotes = [];

  Future<AllNotesModel> getNotes(id) async{
    var response = await getRepository.getRepository("${ApiClass.allNotesApi}/${id}");
    var data = jsonDecode(response.body);
   allNotesModel = AllNotesModel.fromJson(data);
   allnotes =[];
   allnotes.add(allNotesModel);
    return AllNotesModel.fromJson(data);  
  }
}