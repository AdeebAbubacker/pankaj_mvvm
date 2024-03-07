import 'package:hive/hive.dart';
import 'package:panakj_app/core/db/adapters/siblingcard_adapter/siblingcard_adapter.dart';

class SiblingRepository {
  static const String boxName = 'aseebsiblingbox';

  Future<void> addSibling(SiblingCardDB siblingData) async {
    final box = await Hive.openBox<SiblingCardDB>(boxName);
    await box.add(siblingData);
  }

  Future<List<SiblingCardDB>> getAllSiblings() async {
    final box = await Hive.openBox<SiblingCardDB>(boxName);
    return box.values.toList();
  }
}
