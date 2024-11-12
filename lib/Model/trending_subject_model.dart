class TrendingSubjectModel {
  TrendingSubjectModel({
      this.subID, 
      this.subjectName,});

  TrendingSubjectModel.fromJson(dynamic json) {
    subID = json['SubID'];
    subjectName = json['Subject_Name'];
  }
  num? subID;
  String? subjectName;
TrendingSubjectModel copyWith({  num? subID,
  String? subjectName,
}) => TrendingSubjectModel(  subID: subID ?? this.subID,
  subjectName: subjectName ?? this.subjectName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SubID'] = subID;
    map['Subject_Name'] = subjectName;
    return map;
  }

}