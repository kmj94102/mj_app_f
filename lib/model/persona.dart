class PersonaSchedule {
  String? date;
  List<PersonaScheduleInfo>? items;

  PersonaSchedule({date, items});

  PersonaSchedule.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['items'] != null) {
      items = <PersonaScheduleInfo>[];
      json['items'].forEach((v) {
        items!.add(PersonaScheduleInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String getMonth() {
    final parts = date?.split(".") ?? [];
    if (parts.isEmpty) return "";

    final month = int.tryParse(parts[0]) ?? 0;

    return "$month월";
  }

  String getDate() {
    return '${items?.first.day ?? 1}일 ${items?.first.dayOfWeek ?? '월'}요일';
  }

  List<int> getIdxList() {
    return items?.map((e) => e.idx ?? 0).toList() ?? [];
  }
}

class PersonaScheduleInfo {
  int? idx;
  int? month;
  int? day;
  String? dayOfWeek;
  String? title;
  String? contents;
  int? rank;
  bool? isComplete;
  int? communityIdx;

  PersonaScheduleInfo(
      {idx,
        month,
        day,
        dayOfWeek,
        title,
        contents,
        rank,
        isComplete,
        communityIdx});

  PersonaScheduleInfo.fromJson(Map<String, dynamic> json) {
    idx = json['idx'];
    month = json['month'];
    day = json['day'];
    dayOfWeek = json['dayOfWeek'];
    title = json['title'];
    contents = json['contents'];
    rank = json['rank'];
    isComplete = json['isComplete'];
    communityIdx = json['communityIdx'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idx'] = idx;
    data['month'] = month;
    data['day'] = day;
    data['dayOfWeek'] = dayOfWeek;
    data['title'] = title;
    data['contents'] = contents;
    data['rank'] = rank;
    data['isComplete'] = isComplete;
    data['communityIdx'] = communityIdx;
    return data;
  }
}
