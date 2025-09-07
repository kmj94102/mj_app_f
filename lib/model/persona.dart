class PersonaSchedule {
  int? month;
  int? day;
  String? title;
  int? rank;
  String? communityIdx;
  String? dayOfWeek;
  int? idx;
  String? contents;
  bool? isComplete;

  PersonaSchedule({
    month,
    day,
    title,
    rank,
    communityIdx,
    dayOfWeek,
    idx,
    contents,
    isComplete,
  });

  PersonaSchedule.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    day = json['day'];
    title = json['title'];
    rank = json['rank'];
    communityIdx = json['communityIdx'];
    dayOfWeek = json['dayOfWeek'];
    idx = json['idx'];
    contents = json['contents'];
    isComplete = json['isComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['day'] = day;
    data['title'] = title;
    data['rank'] = rank;
    data['communityIdx'] = communityIdx;
    data['dayOfWeek'] = dayOfWeek;
    data['idx'] = idx;
    data['contents'] = contents;
    data['isComplete'] = isComplete;
    return data;
  }
}
