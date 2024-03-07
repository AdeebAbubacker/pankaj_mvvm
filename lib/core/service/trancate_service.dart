
import 'package:supabase_flutter/supabase_flutter.dart';


class TruncateService {
  Future<void> truncateColleges() async {
    try {
      // Use a condition that is always true to delete all records
      await Supabase.instance.client
          .from('student_1_invite_list')
          .delete()
          .eq('id', '*') // Example condition that is always true
          .execute();
      print('Table deleted successfully');
    } catch (e) {
      print('Error truncating table: $e');
      throw Exception('Failed to truncate colleges table');
    }
  }
}