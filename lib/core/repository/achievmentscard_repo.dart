import 'package:hive/hive.dart';
import 'package:panakj_app/core/db/adapters/achievment_adapter/achievment_adapter.dart';

class AchievmentsRepository {
  static const String boxName = 'achievmentBox';

  Future<void> addAchievments(AchievmentDB achievmentData) async {
    final box = await Hive.openBox<AchievmentDB>(boxName);
    await box.add(achievmentData);
  }

  Future<List<AchievmentDB>> getAllAchievments() async {
    final box = await Hive.openBox<AchievmentDB>(boxName);
    return box.values.toList();
  }
}
