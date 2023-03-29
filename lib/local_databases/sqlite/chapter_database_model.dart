import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
final String tableChapter = "tchaptes";

class ChapterFields{
static final List<String> values = [id,semester,s_id,subject,c_id,c_name,c_number,c_desc,pdf];

static final String id = "_id";
static final String semester = "_semester";
static final String s_id = "_s_id";
static final String subject = "_subject";
static final String c_id = "_c_id";
static final String c_name = "_c_name";
static final String c_number = "_c_number";
static final String c_desc = "_c_desc";
static final String pdf = "_pdf";
}

class ChapterModelDatabase {
  int? id;
  String semester;
  int s_id;
  String subject;
  int c_id;
  String c_name;
  String c_number;
  String c_desc; 
  String pdf; 
  ChapterModelDatabase({
    this.id,
    required this.semester,
    required this.s_id,
    required this.subject,
    required this.c_id,
    required this.c_name,
    required this.c_number,
    required this.c_desc,
    required this.pdf,
  });
 
   ChapterModelDatabase copy({
    int? id,
    String? semester,
    int? s_id,
    String? subject,
    int? c_id,
    String? c_name,
    String? c_number,
    String? c_desc, 
    String? pdf, 
  })=>ChapterModelDatabase(
    id: id??this.id,
    semester: semester??this.semester,
    s_id: s_id??this.s_id,
    subject: subject??this.subject,
    c_id: c_id??this.c_id,
    c_name: c_name??this.c_name,
    c_number: c_number??this.c_number,
    c_desc: c_desc??this.c_desc,
    pdf: c_desc??this.pdf,
    );

    static ChapterModelDatabase fromJson(Map<String, Object?> json)=>
    ChapterModelDatabase(
      id: json[ChapterFields.id] as int?,
      semester: json[ChapterFields.semester] as String,
       s_id: json[ChapterFields.s_id] as int,
      subject: json[ChapterFields.subject] as String,
      c_id: json[ChapterFields.c_id] as int,
      c_name: json[ChapterFields.c_name] as String,
      c_number: json[ChapterFields.c_number] as String,
      c_desc: json[ChapterFields.c_desc] as String,
      pdf: json[ChapterFields.pdf] as String
      );

      Map<String, Object?> toJson()=>{
        ChapterFields.id:id,
        ChapterFields.semester:semester,
        ChapterFields.s_id:s_id,
        ChapterFields.subject:subject,
        ChapterFields.c_id:c_id,
        ChapterFields.c_name:c_name,
        ChapterFields.c_number:c_number,
        ChapterFields.c_desc:c_desc,
        ChapterFields.pdf:pdf 
     };

}

class SubjectDatabaseModel {
   int s_id;
  String subject;
  String semester;
  SubjectDatabaseModel({
    required this.s_id,
    required this.subject,
     required this.semester,
  });

  SubjectDatabaseModel copy({
    int? s_id,
    String? subject,
    String? semester,
  }) {
    return SubjectDatabaseModel(
      s_id: s_id ?? this.s_id,
      subject: subject ?? this.subject,
      semester: subject ?? this.semester,
    );
  }

    static SubjectDatabaseModel fromJson(Map<String, Object?> json)=>
    SubjectDatabaseModel(
       s_id: json[ChapterFields.s_id] as int,
      subject: json[ChapterFields.subject] as String,
      semester: json[ChapterFields.semester] as String,
      );

      Map<String, Object?> toJson()=>{
        ChapterFields.s_id:s_id,
        ChapterFields.subject:subject,
        ChapterFields.semester:semester,
      };

}



//chapters
class ChapterDModel {
  int? id;
  String semester;
  int s_id;
  String subject;
  int c_id;
  String c_name;
  String c_number;
  String pdf;
  ChapterDModel({
    this.id,
    required this.semester,
    required this.s_id,
    required this.subject,
    required this.c_id,
    required this.c_name,
    required this.c_number,
    required this.pdf,
  });
 
   ChapterDModel copy({
    int? id,
    String? semester,
    int? s_id,
    String? subject,
    int? c_id,
    String? c_name,
    String? c_number,
    String? pdf
      })=>ChapterDModel(
    id: id??this.id,
    semester: semester??this.semester,
    s_id: s_id??this.s_id,
    subject: subject??this.subject,
    c_id: c_id??this.c_id,
    c_name: c_name??this.c_name,
    c_number: c_number??this.c_number,
    pdf: pdf??this.pdf,
        );

    static ChapterDModel fromJson(Map<String, Object?> json)=>
    ChapterDModel(
      id: json[ChapterFields.id] as int?,
      semester: json[ChapterFields.semester] as String,
       s_id: json[ChapterFields.s_id] as int,
      subject: json[ChapterFields.subject] as String,
      c_id: json[ChapterFields.c_id] as int,
      c_name: json[ChapterFields.c_name] as String,
      c_number: json[ChapterFields.c_number] as String,
      pdf: json[ChapterFields.pdf] as String,
            );

      Map<String, Object?> toJson()=>{
        ChapterFields.id:id,
        ChapterFields.semester:semester,
        ChapterFields.s_id:s_id,
        ChapterFields.subject:subject,
        ChapterFields.c_id:c_id,
        ChapterFields.c_name:c_name,
        ChapterFields.c_number:c_number,
        ChapterFields.pdf:pdf
      };
}
//desc
class DescDatabaseModel {
   int c_id;
  String c_desc;
  String pdf;
  DescDatabaseModel({
    required this.c_id,
     required this.c_desc,
     required this.pdf,
  });

  DescDatabaseModel copy({
    int? c_id,
    String? c_desc,
    String? pdf,
  }) {
    return DescDatabaseModel(
      c_id: c_id ?? this.c_id,
      c_desc: c_desc ?? this.c_desc,
      pdf: c_desc ?? this.pdf,
    );
  }

    static DescDatabaseModel fromJson(Map<String, Object?> json)=>
    DescDatabaseModel(
       c_id: json[ChapterFields.c_id] as int,
      c_desc: json[ChapterFields.c_desc] as String,
      pdf: json[ChapterFields.pdf] as String,
      );

      Map<String, Object?> toJson()=>{
        ChapterFields.c_id:c_id,
        ChapterFields.c_desc:c_desc,
        ChapterFields.pdf:pdf,
      };

}