import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/model/school_group/school_group.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class GetAllFieldVerficationService {
  Future<List<SchoolGroup>> getAllSchoolGroups() async {
    final response =
        await Supabase.instance.client.from('edu_5_groups').select().execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data.length}');
    return data
        .map((json) => SchoolGroup.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<FieldVerificationModel>> lifeStatus() async {
    final response =
        await Supabase.instance.client.from('life_status').select().execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data}');
    return data
        .map((json) =>
            FieldVerificationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<FieldVerificationModel>> parentseducation() async {
    final response = await Supabase.instance.client
        .from('parents_education')
        .select()
        .execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data}');
    return data
        .map((json) =>
            FieldVerificationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<FieldVerificationModel>> monthlyincome() async {
    final response = await Supabase.instance.client
        .from('parents_income')
        .select()
        .execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data}');
    return data
        .map((json) =>
            FieldVerificationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<FieldVerificationModel>> plotsize() async {
    final response = await Supabase.instance.client
        .from('house_6_plot_size')
        .select()
        .execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data}');
    return data
        .map((json) =>
            FieldVerificationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<FieldVerificationModel>> houseRoof() async {
    final response =
        await Supabase.instance.client.from('house_2_roof').select().execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data}');
    return data
        .map((json) =>
            FieldVerificationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<FieldVerificationModel>> housePlastering() async {
    final response = await Supabase.instance.client
        .from('house_5_plastering')
        .select()
        .execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data}');
    return data
        .map((json) =>
            FieldVerificationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<FieldVerificationModel>> getwaterSource() async {
    final response =
        await Supabase.instance.client.from('house_3_water').select().execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data}');
    return data
        .map((json) =>
            FieldVerificationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<FieldVerificationModel>> getrentalHouse() async {
    final response =
        await Supabase.instance.client.from('house_4_rent').select().execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data}');
    return data
        .map((json) =>
            FieldVerificationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<FieldVerificationModel>> getSiblingEducational() async {
    final response = await Supabase.instance.client
        .from('sibling_qualification')
        .select()
        .execute();

    if (response == null) {
      print('error');
      throw Exception('Failed to fetch countries');
    }

    final List<dynamic> data = response.data ?? [];

    // ignore: avoid_print
    print('my response from applicants ${data}');
    return data
        .map((json) =>
            FieldVerificationModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
