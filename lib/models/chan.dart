import 'dart:convert';

class ChanModel {
  static List<Item> items = [];

  //get items on basis of id.
  Item getById(int id) =>
      // ignore: null_closures
      items.firstWhere((element) => element.id == id, orElse: null);

  //get by position.

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String chanid;

  Item({
    required this.id,
    required this.chanid,
  });

  Item copyWith({
    int? id,
    String? chanid,
  }) {
    return Item(
      id: id ?? this.id,
      chanid: chanid ?? this.chanid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chanid': chanid,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(id: map['id'], chanid: map['chanid']);
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, chanid: $chanid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item && other.id == id && other.chanid == chanid;
  }

  @override
  int get hashCode {
    return id.hashCode ^ chanid.hashCode;
  }
}
