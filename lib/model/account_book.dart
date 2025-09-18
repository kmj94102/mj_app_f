class FixedItem {
  int? id;
  String? date;
  String? usageType;
  bool? isIncome;
  int? amount;
  String? whereToUse;

  FixedItem({
    this.id,
    this.date,
    this.usageType,
    this.isIncome,
    this.amount,
    this.whereToUse,
  });

  FixedItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    usageType = json['usageType'];
    isIncome = json['isIncome'];
    amount = json['amount'];
    whereToUse = json['whereToUse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['usageType'] = usageType;
    data['isIncome'] = isIncome;
    data['amount'] = amount;
    data['whereToUse'] = whereToUse;
    return data;
  }

  String getAmountFormat() {
    if (amount == null) {
      return '';
    } else {
      return '${amount!.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} 원';
    }
  }
}
