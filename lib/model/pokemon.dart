import 'dart:ui';

import 'package:get/get.dart';

import '../util/constants.dart';

class PokemonInfoList {
  List<PokemonInfo>? list;
  int? totalSize;

  PokemonInfoList({list, totalSize});

  PokemonInfoList.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <PokemonInfo>[];
      json['list'].forEach((v) {
        list!.add(PokemonInfo.fromJson(v));
      });
    }
    totalSize = json['totalSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    data['totalSize'] = totalSize;
    return data;
  }
}

class PokemonInfo {
  int? index;
  String? number;
  String? name;
  String? spotlight;
  String? shinySpotlight;
  bool? isCatch;
  String? image;
  String? shinyImage;

  PokemonInfo({
    index,
    number,
    name,
    spotlight,
    shinySpotlight,
    isCatch,
    image,
    shinyImage,
  });

  PokemonInfo.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    number = json['number'];
    name = json['name'];
    spotlight = json['spotlight'];
    shinySpotlight = json['shinySpotlight'];
    isCatch = json['isCatch'];
    image = json['image'];
    shinyImage = json['shinyImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['number'] = number;
    data['name'] = name;
    data['spotlight'] = spotlight;
    data['shinySpotlight'] = shinySpotlight;
    data['isCatch'] = isCatch;
    data['image'] = image;
    data['shinyImage'] = shinyImage;
    return data;
  }
}

class PokemonType {
  String koreanName;
  String image;
  Color color;
  bool isSelect;

  PokemonType(this.koreanName, this.image, this.color, this.isSelect);
}

List<PokemonType> getPokemonTypes() => [
  PokemonType(
    '전체',
    '${Constants.imageAddress}/img_type_normal.png',
    Color(0xFF919AA2),
    true,
  ),
  PokemonType(
    '노말',
    '${Constants.imageAddress}/img_type_normal.png',
    Color(0xFF919AA2),
    false,
  ),
  PokemonType(
    '불',
    '${Constants.imageAddress}/img_type_fire.png',
    Color(0xFFFF9741),
    false,
  ),
  PokemonType(
    '물',
    '${Constants.imageAddress}/img_type_water.png',
    Color(0xFF3692DC),
    false,
  ),
  PokemonType(
    '전기',
    '${Constants.imageAddress}/img_type_electric.png',
    Color(0xFFFBD100),
    false,
  ),
  PokemonType(
    '풀',
    '${Constants.imageAddress}/img_type_grass.png',
    Color(0xFF38BF4B),
    false,
  ),
  PokemonType(
    '얼음',
    '${Constants.imageAddress}/img_type_ice.png',
    Color(0xFF4CD1C0),
    false,
  ),
  PokemonType(
    '격투',
    '${Constants.imageAddress}/img_type_fighting.png',
    Color(0xFFE0306A),
    false,
  ),
  PokemonType(
    '독',
    '${Constants.imageAddress}/img_type_poison.png',
    Color(0xFFB567CE),
    false,
  ),
  PokemonType(
    '땅',
    '${Constants.imageAddress}/img_type_ground.png',
    Color(0xFFE87236),
    false,
  ),
  PokemonType(
    '비행',
    '${Constants.imageAddress}/img_type_flying.png',
    Color(0xFF89AAE3),
    false,
  ),
  PokemonType(
    '에스퍼',
    '${Constants.imageAddress}/img_type_psychic.png',
    Color(0xFFFF6675),
    false,
  ),
  PokemonType(
    '벌레',
    '${Constants.imageAddress}/img_type_bug.png',
    Color(0xFF83C300),
    false,
  ),
  PokemonType(
    '바위',
    '${Constants.imageAddress}/img_type_rock.png',
    Color(0xFFC8B686),
    false,
  ),
  PokemonType(
    '고스트',
    '${Constants.imageAddress}/img_type_ghost.png',
    Color(0xFF4C6AB2),
    false,
  ),
  PokemonType(
    '드래곤',
    '${Constants.imageAddress}/img_type_dragon.png',
    Color(0xFF006FC9),
    false,
  ),
  PokemonType(
    '악',
    '${Constants.imageAddress}/img_type_dark.png',
    Color(0xFF5B5466),
    false,
  ),
  PokemonType(
    '강철',
    '${Constants.imageAddress}/img_type_steel.png',
    Color(0xFF5A8EA2),
    false,
  ),
  PokemonType(
    '페어리',
    '${Constants.imageAddress}/img_type_fairy.png',
    Color(0xFFFB89EB),
    false,
  ),
];

PokemonType? getPokemonType(String name) {
  return getPokemonTypes().firstWhereOrNull(
    (element) => element.koreanName == name,
  );
}

class PokemonGeneration {
  String koreanName;
  int generation;
  bool isSelect;

  PokemonGeneration(this.koreanName, this.generation, this.isSelect);
}

List<PokemonGeneration> getPokemonGeneration() {
  return [
    PokemonGeneration('전체', 0, true),
    PokemonGeneration('1세대', 1, false),
    PokemonGeneration('2세대', 2, false),
    PokemonGeneration('3세대', 3, false),
    PokemonGeneration('4세대', 4, false),
    PokemonGeneration('5세대', 5, false),
    PokemonGeneration('6세대', 6, false),
    PokemonGeneration('7세대', 7, false),
    PokemonGeneration('8세대', 8, false),
    PokemonGeneration('9세대', 9, false),
    PokemonGeneration('레전드 아르세우스', 99, false),
  ];
}

class PokemonSearchInfo {
  String name;
  int skip;
  int limit;
  String generation;
  String types;
  bool isCatch;

  PokemonSearchInfo({
    required this.name,
    required this.skip,
    required this.limit,
    required this.generation,
    required this.types,
    required this.isCatch,
  });

  List<String> getSearchInfoList() {
    List<String> result = [name] + generation.split(',') + types.split(',');
    if (!isCatch) result.add('안 잡은 포켓몬 만');

    return result.where((element) => element.trim().isNotEmpty).toList();
  }
}

class PokemonDetailInfo {
  PokemonDetail? pokemonInfo;
  BeforeInfo? beforeInfo;
  BeforeInfo? nextInfo;
  List<EvolutionInfo>? evolutionInfo;

  PokemonDetailInfo({pokemonInfo, beforeInfo, nextInfo, evolutionInfo});

  PokemonDetailInfo.fromJson(Map<String, dynamic> json) {
    pokemonInfo =
        json['pokemonInfo'] != null
            ? PokemonDetail.fromJson(json['pokemonInfo'])
            : null;
    beforeInfo =
        json['beforeInfo'] != null
            ? BeforeInfo.fromJson(json['beforeInfo'])
            : null;
    nextInfo =
        json['nextInfo'] != null ? BeforeInfo.fromJson(json['nextInfo']) : null;
    if (json['evolutionInfo'] != null) {
      evolutionInfo = <EvolutionInfo>[];
      json['evolutionInfo'].forEach((v) {
        evolutionInfo!.add(EvolutionInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pokemonInfo != null) {
      data['pokemonInfo'] = pokemonInfo!.toJson();
    }
    if (beforeInfo != null) {
      data['beforeInfo'] = beforeInfo!.toJson();
    }
    if (nextInfo != null) {
      data['nextInfo'] = nextInfo!.toJson();
    }
    if (evolutionInfo != null) {
      data['evolutionInfo'] = evolutionInfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String get number => pokemonInfo?.number ?? '';

  String get name => pokemonInfo?.name ?? '';

  String get image => pokemonInfo?.image ?? '';

  String get shinyImage => pokemonInfo?.shinyImage ?? Constants.eggAddress;

  String get spotlight => pokemonInfo?.spotlight ?? Constants.eggAddress;

  String get description => pokemonInfo?.description ?? '';

  String get classification => pokemonInfo?.classification ?? '';

  List<EvolutionInfo> get evolutionList => evolutionInfo ?? [];

  bool get isEvolution => evolutionInfo?.isNotEmpty ?? false;

  bool get isCatch => pokemonInfo?.isCatch ?? false;

  String get status => pokemonInfo?.status ?? '';

  String get attribute => pokemonInfo?.attribute ?? '';

  PokemonType? get firstType => getPokemonType(
    pokemonInfo?.attribute?.split(',').elementAtOrNull(0) ?? '',
  );

  PokemonType? get secondType => getPokemonType(
    pokemonInfo?.attribute?.split(',').elementAtOrNull(1) ?? '',
  );

  PokemonEffectGrouping get effectGrouping => calculateEffect(
    getPokemonWeekInfo(firstType?.koreanName ?? ''),
    secondType?.koreanName == '' ? null : getPokemonWeekInfo(secondType?.koreanName ?? ''),
  );
}

class PokemonDetail {
  String? number;
  String? status;
  int? index;
  String? characteristic;
  String? image;
  String? shinyImage;
  String? shinySpotlight;
  int? generation;
  String? name;
  String? classification;
  String? attribute;
  String? spotlight;
  String? description;
  bool? isCatch;

  PokemonDetail({
    number,
    status,
    index,
    characteristic,
    image,
    shinyImage,
    shinySpotlight,
    generation,
    name,
    classification,
    attribute,
    spotlight,
    description,
    isCatch,
  });

  PokemonDetail.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    status = json['status'];
    index = json['index'];
    characteristic = json['characteristic'];
    image = json['image'];
    shinyImage = json['shinyImage'];
    shinySpotlight = json['shinySpotlight'];
    generation = json['generation'];
    name = json['name'];
    classification = json['classification'];
    attribute = json['attribute'];
    spotlight = json['spotlight'];
    description = json['description'];
    isCatch = json['isCatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['status'] = status;
    data['index'] = index;
    data['characteristic'] = characteristic;
    data['image'] = image;
    data['shinyImage'] = shinyImage;
    data['shinySpotlight'] = shinySpotlight;
    data['generation'] = generation;
    data['name'] = name;
    data['classification'] = classification;
    data['attribute'] = attribute;
    data['spotlight'] = spotlight;
    data['description'] = description;
    data['isCatch'] = isCatch;
    return data;
  }
}

class BeforeInfo {
  String? number;
  String? image;
  String? shinyImage;

  BeforeInfo({number, image, shinyImage});

  BeforeInfo.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    image = json['image'];
    shinyImage = json['shinyImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['image'] = image;
    data['shinyImage'] = shinyImage;
    return data;
  }
}

class EvolutionInfo {
  String? beforeDot;
  String? beforeShinyDot;
  String? afterDot;
  String? afterShinyDot;
  String? beforeNumber;
  String? afterNumber;
  String? evolutionImage;
  String? evolutionCondition;

  EvolutionInfo({
    beforeDot,
    beforeShinyDot,
    afterDot,
    afterShinyDot,
    beforeNumber,
    afterNumber,
    evolutionImage,
    evolutionCondition,
  });

  EvolutionInfo.fromJson(Map<String, dynamic> json) {
    beforeDot = json['beforeDot'];
    beforeShinyDot = json['beforeShinyDot'];
    afterDot = json['afterDot'];
    afterShinyDot = json['afterShinyDot'];
    beforeNumber = json['beforeNumber'];
    afterNumber = json['afterNumber'];
    evolutionImage = json['evolutionImage'];
    evolutionCondition = json['evolutionCondition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['beforeDot'] = beforeDot;
    data['beforeShinyDot'] = beforeShinyDot;
    data['afterDot'] = afterDot;
    data['afterShinyDot'] = afterShinyDot;
    data['beforeNumber'] = beforeNumber;
    data['afterNumber'] = afterNumber;
    data['evolutionImage'] = evolutionImage;
    data['evolutionCondition'] = evolutionCondition;
    return data;
  }
}

class PokemonEffectGrouping {
  final List<PokemonType> superEffective; // 2x 이상
  final List<PokemonType> normal; // 1x
  final List<PokemonType> notEffective; // 0.5x
  final List<PokemonType> noEffect; // 0x

  PokemonEffectGrouping({
    required this.superEffective,
    required this.normal,
    required this.notEffective,
    required this.noEffect,
  });
}

PokemonEffectGrouping calculateEffect(List<double> type1, List<double>? type2) {
  List<PokemonType> types = getPokemonTypes().sublist(1);

  List<double> result = List.generate(
    types.length,
    (i) => type2 == null ? type1[i] : type1[i] * type2[i],
  );

  List<PokemonType> superEffective = [];
  List<PokemonType> normal = [];
  List<PokemonType> notEffective = [];
  List<PokemonType> noEffect = [];

  for (int i = 0; i < result.length; i++) {
    double value = result[i];
    PokemonType type = types[i];

    if (value >= 2) {
      superEffective.add(type);
    } else if (value == 1) {
      normal.add(type);
    } else if (value == 0.5) {
      notEffective.add(type);
    } else if (value == 0) {
      noEffect.add(type);
    }
  }

  return PokemonEffectGrouping(
    superEffective: superEffective,
    normal: normal,
    notEffective: notEffective,
    noEffect: noEffect,
  );
}

List<double> getPokemonWeekInfo(String type) {
  switch (type) {
    case '노말':
      return [
        1, 1, 1, 1, 1, 1,
        2, 1, 1, 1, 1, 1,
        1, 0, 1, 1, 1, 1,
      ];
    case '불':
      return [
        1, 0.5, 2, 1, 0.5, 0.5,
        1, 1, 2, 1, 1, 0.5,
        2, 1, 1, 1, 0.5, 0.5,
      ];
    case '물':
      return [
        1, 0.5, 0.5, 2, 2, 0.5,
        1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 0.5, 1,
      ];
    case '풀':
      return [
        1, 2, 0.5, 0.5, 0.5, 2,
        1, 2, 0.5, 2, 1, 2,
        1, 1, 1, 1, 1, 1,
      ];
    case '전기':
      return [
        1, 1, 1, 0.5, 1, 1,
        1, 1, 2, 0.5, 1, 1,
        1, 1, 1, 1, 0.5, 1,
      ];
    case '얼음':
      return [
        1, 2, 1, 1, 1, 0.5,
        2, 1, 1, 1, 1, 1,
        2, 1, 1, 1, 2, 1,
      ];
    case '격투':
      return [
        1, 1, 1, 1, 1, 1,
        1, 1, 1, 2, 2, 0.5,
        0.5, 1, 1, 0.5, 1, 2,
      ];
    case '땅':
      return [
        1, 1, 2, 0.5, 2, 2,
        1, 0.5, 1, 1, 1, 1,
        0.5, 1, 1, 1, 1, 1,
      ];
    case '독':
      return [
        1, 1, 1, 1, 0.5, 1,
        0.5, 0.5, 2, 1, 2, 0.5,
        1, 1, 1, 1, 1, 0.5,
      ];
    case '비행':
      return [
        1, 1, 1, 2, 0.5, 2,
        0.5, 1, 0, 1, 1, 0.5,
        2, 1, 1, 1, 1, 1,
      ];
    case '바위':
      return [
        0.5, 0.5, 2, 1, 2, 1,
        2, 0.5, 2, 0.5, 1, 1,
        1, 1, 1, 1, 2, 1,
      ];
    case '에스퍼':
      return [
        1, 1, 1, 1, 1, 1,
        0.5, 1, 1, 1, 0.5, 2,
        1, 2, 1, 2, 1, 1,
      ];
    case '벌레':
      return [
        1, 2, 1, 1, 0.5, 1,
        0.5, 1, 0.5, 2, 1, 1,
        2, 1, 1, 1, 1, 1,
      ];
    case '고스트':
      return [
        0, 1, 1, 1, 1, 1,
        0, 0.5, 1, 1, 1, 0.5,
        1, 2, 1, 2, 1, 1,
      ];
    case '드래곤':
      return [
        1, 0.5, 0.5, 0.5, 0.5, 2,
        1, 1, 1, 1, 1, 1,
        1, 1, 2, 1, 1, 2,
      ];
    case '강철':
      return [
        0.5, 2, 1, 1, 0.5, 0.5,
        2, 0.5, 2, 0.5, 0.5, 0.5,
        0.5, 1, 0.5, 1, 0.5, 0.5,
      ];
    case '악':
      return [
        1, 1, 1, 1, 1, 1,
        2, 1, 1, 1, 0.5, 2,
        1, 0.5, 1, 0.5, 1, 2,
      ];
    case '페어리':
      return [
        1, 1, 1, 1, 1, 1,
        0.5, 2, 1, 1, 1, 0.5,
        1, 1, 0, 0.5, 2, 1
      ];
    default:
      return [
        1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1
      ];
  }
}
