import 'dart:convert';

import 'package:panakj_app/core/model/create_new_invited_student/create_new_invited_student.dart';
import 'package:panakj_app/core/model/delete_student_invite_list/delete_student_invite_list.dart';
import 'package:panakj_app/core/model/parents_education/parents_education.dart';
import 'package:panakj_app/core/model/school_group/school_group.dart';
import 'package:panakj_app/core/model/students_invite_list_model/students_invite_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:panakj_app/core/model/update_student_data/update_student_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future<StudentsInviteListModel> getinvitedStudentsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Print the stored access token
    String accessToken = prefs.getString('accessToken') ?? 'Access Token empty';
    print('Stored Access Token: $accessToken');
    // var authToken =
    //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDk1YzJjMzZhZjhjMzdjNTA4ZjQ2MWY3NmNmYTkwMjllMDgzYjY2OTViZWMyZDI3YzViNTQ2NTNmZDQ0ZDE5YzhmZDM0ZTFjOTUwZjA0OGUiLCJpYXQiOjE3MTAyMzUzMTIuMzQyMTEzLCJuYmYiOjE3MTAyMzUzMTIuMzQyMTE1LCJleHAiOjE3NDE3NzEzMTIuMzM5MTE3LCJzdWIiOiIxNSIsInNjb3BlcyI6W119.sctqM_IL31kUsn_X__FJHVDBCSYKHDgBSjRCrDJvh0xtWYw28CQS_mZ8UxWTWibPHFujnxhRNjCyAPrKz56_oE-Tn5vBrI0O3JRmbQm0vcMxjzYnqSyiffbxUpq7Jq1XDRV3d8QIgkpR_nQw8ctVm_ApEP-3-xpENXUZK0Qq06f5cQfqjD3LT5e3MrWl3GzaLS-S3VFFMxLtw7GyrD_sq6PHQ2nhydTBfTsMoqmHmyCykPR8iVZHgUgbSwpuvSici5fZ0KTtmrn8tpp1gc6WiuhYVpEJ6G_CnatyIfLbfXm5yalygWqaZE98QddFn52-XDXzHR4LnVFZowbk5NL79yEQVFvIO_eUhcFRZ1VO-1s8taeP3Z7fO7boykcR4RKGIqUzRz4NBDiUB1gUNQ-tvGLV8I6D_PHVrx4mVCE-RzFChrO-0ErXenkzXZLWRcE9029NvzhCOkP5vyxgCUwgYYeZ4mhQ9jJXsahKRGTrOKDNJxtMhmi7RoX3CglcYP17d2zP2Dw3hb8I-MA-yjNbITnnep2YaV78sMbk1hRcj4yGa5yqDb7AF6COSqyv-lu4Ulpj3Tb7vUq4xHN4WM7y89Bqsz4JYNxJnwbWqehZRfak5_4m4xjoo9Q7g84KHOvB-orQ0_t2ZPX0tukuQG-zpDYH7tP9tlnckZerobgNbic";

    try {
      final response = await http.get(
        Uri.parse('https://pankajtrust.org/api/invitelist'),
        headers: {
          'Authorization': 'Bearer $accessToken', // Include token in the header
        },
      );

      if (response.statusCode == 200) {
        print('success from service');
        final Map<String, dynamic> data = json.decode(response.body);
        StudentsInviteListModel studentsInviteListModel =
            StudentsInviteListModel.fromJson(data);
        return studentsInviteListModel;
      } else {
        // Handle error if the request was not successful
        print(
            'Failed to load dropdown data, status code: ${response.statusCode}');
        throw Exception('Failed to load dropdown data');
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error retrieving dropdown data: $e');
      throw e;
    }
  }

  Future<CreateNewInvitedStudent> postnewinvitedStudent({
    required String name,
    required String phoneNo,
    required String schoolId,
    required String email,
  }) async {
    final url = Uri.parse('https://pankajtrust.org/api/invitelist/create');
    // final authToken =
    //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDk1YzJjMzZhZjhjMzdjNTA4ZjQ2MWY3NmNmYTkwMjllMDgzYjY2OTViZWMyZDI3YzViNTQ2NTNmZDQ0ZDE5YzhmZDM0ZTFjOTUwZjA0OGUiLCJpYXQiOjE3MTAyMzUzMTIuMzQyMTEzLCJuYmYiOjE3MTAyMzUzMTIuMzQyMTE1LCJleHAiOjE3NDE3NzEzMTIuMzM5MTE3LCJzdWIiOiIxNSIsInNjb3BlcyI6W119.sctqM_IL31kUsn_X__FJHVDBCSYKHDgBSjRCrDJvh0xtWYw28CQS_mZ8UxWTWibPHFujnxhRNjCyAPrKz56_oE-Tn5vBrI0O3JRmbQm0vcMxjzYnqSyiffbxUpq7Jq1XDRV3d8QIgkpR_nQw8ctVm_ApEP-3-xpENXUZK0Qq06f5cQfqjD3LT5e3MrWl3GzaLS-S3VFFMxLtw7GyrD_sq6PHQ2nhydTBfTsMoqmHmyCykPR8iVZHgUgbSwpuvSici5fZ0KTtmrn8tpp1gc6WiuhYVpEJ6G_CnatyIfLbfXm5yalygWqaZE98QddFn52-XDXzHR4LnVFZowbk5NL79yEQVFvIO_eUhcFRZ1VO-1s8taeP3Z7fO7boykcR4RKGIqUzRz4NBDiUB1gUNQ-tvGLV8I6D_PHVrx4mVCE-RzFChrO-0ErXenkzXZLWRcE9029NvzhCOkP5vyxgCUwgYYeZ4mhQ9jJXsahKRGTrOKDNJxtMhmi7RoX3CglcYP17d2zP2Dw3hb8I-MA-yjNbITnnep2YaV78sMbk1hRcj4yGa5yqDb7AF6COSqyv-lu4Ulpj3Tb7vUq4xHN4WM7y89Bqsz4JYNxJnwbWqehZRfak5_4m4xjoo9Q7g84KHOvB-orQ0_t2ZPX0tukuQG-zpDYH7tP9tlnckZerobgNbic"; // Replace with your actual token

    // Create a Map to hold the form data
    final formData = {
      'name': name,
      'school_id': schoolId, // Include only if not null
      'email': email, // Include only if not null
      'phone': phoneNo, // Include only if not null
    };

    // Encode the form data using JSON encoding
    final encodedFormData = jsonEncode(formData);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Print the stored access token
    String accessToken = prefs.getString('accessToken') ?? 'Access Token empty';
    print('Stored Access Token: $accessToken');

    try {
      final response = await http.post(
        url,
        body: encodedFormData,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json', // Set content type to JSON
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final CreateNewInvitedStudent studentsInviteListModel =
            CreateNewInvitedStudent.fromJson(data);
        print(studentsInviteListModel.data?[0].email);
        print('creation success');
        return studentsInviteListModel;
      } else {
        print('creation failure');
        // Handle error gracefully
        print(
            'Failed to load dropdown data, status code: ${response.statusCode}');
        throw Exception(
            'Failed to load dropdown data: ${response.body}'); // Provide more context in the exception message
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error retrieving dropdown data: $e');
      throw e;
    }
  }

  Future<UpdateStudentData> updateStudentData({
    required String studentid,
    required String name,
    required String phoneNo,
    required String schoolId,
    required String email,
  }) async {
    final url = Uri.parse(
        'https://pankajtrust.org/api/invitelist/update?id=${studentid}');
    // final authToken =
    //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDk1YzJjMzZhZjhjMzdjNTA4ZjQ2MWY3NmNmYTkwMjllMDgzYjY2OTViZWMyZDI3YzViNTQ2NTNmZDQ0ZDE5YzhmZDM0ZTFjOTUwZjA0OGUiLCJpYXQiOjE3MTAyMzUzMTIuMzQyMTEzLCJuYmYiOjE3MTAyMzUzMTIuMzQyMTE1LCJleHAiOjE3NDE3NzEzMTIuMzM5MTE3LCJzdWIiOiIxNSIsInNjb3BlcyI6W119.sctqM_IL31kUsn_X__FJHVDBCSYKHDgBSjRCrDJvh0xtWYw28CQS_mZ8UxWTWibPHFujnxhRNjCyAPrKz56_oE-Tn5vBrI0O3JRmbQm0vcMxjzYnqSyiffbxUpq7Jq1XDRV3d8QIgkpR_nQw8ctVm_ApEP-3-xpENXUZK0Qq06f5cQfqjD3LT5e3MrWl3GzaLS-S3VFFMxLtw7GyrD_sq6PHQ2nhydTBfTsMoqmHmyCykPR8iVZHgUgbSwpuvSici5fZ0KTtmrn8tpp1gc6WiuhYVpEJ6G_CnatyIfLbfXm5yalygWqaZE98QddFn52-XDXzHR4LnVFZowbk5NL79yEQVFvIO_eUhcFRZ1VO-1s8taeP3Z7fO7boykcR4RKGIqUzRz4NBDiUB1gUNQ-tvGLV8I6D_PHVrx4mVCE-RzFChrO-0ErXenkzXZLWRcE9029NvzhCOkP5vyxgCUwgYYeZ4mhQ9jJXsahKRGTrOKDNJxtMhmi7RoX3CglcYP17d2zP2Dw3hb8I-MA-yjNbITnnep2YaV78sMbk1hRcj4yGa5yqDb7AF6COSqyv-lu4Ulpj3Tb7vUq4xHN4WM7y89Bqsz4JYNxJnwbWqehZRfak5_4m4xjoo9Q7g84KHOvB-orQ0_t2ZPX0tukuQG-zpDYH7tP9tlnckZerobgNbic"; // Replace with your actual token

    // Create a Map to hold the form data
    final formData = {
      'name': name,
      'school_id': schoolId, // Include only if not null
      'email': email, // Include only if not null
      'phone': phoneNo, // Include only if not null
    };

    // Encode the form data using JSON encoding
    final encodedFormData = jsonEncode(formData);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Print the stored access token
    String accessToken = prefs.getString('accessToken') ?? 'Access Token empty';
    print('Stored Access Token: $accessToken');

    try {
      final response = await http.post(
        url,
        body: encodedFormData,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json', // Set content type to JSON
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final UpdateStudentData updateStudentData =
            UpdateStudentData.fromJson(data);
        print(updateStudentData.data?[0].email);
        return updateStudentData;
      } else {
        // Handle error gracefully
        print(
            'Failed to load dropdown data, status code: ${response.statusCode}');
        throw Exception(
            'Failed to load dropdown data: ${response.body}'); // Provide more context in the exception message
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error retrieving dropdown data: $e');
      throw e;
    }
  }

  Future<DeleteStudentInviteList> deleteStudentData({
    required String studentid,
  }) async {
    final url = Uri.parse(
        'https://pankajtrust.org/api/invitelist/destroy?id=$studentid&cancel_reason=wrong');
    // final authToken =
    //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDk1YzJjMzZhZjhjMzdjNTA4ZjQ2MWY3NmNmYTkwMjllMDgzYjY2OTViZWMyZDI3YzViNTQ2NTNmZDQ0ZDE5YzhmZDM0ZTFjOTUwZjA0OGUiLCJpYXQiOjE3MTAyMzUzMTIuMzQyMTEzLCJuYmYiOjE3MTAyMzUzMTIuMzQyMTE1LCJleHAiOjE3NDE3NzEzMTIuMzM5MTE3LCJzdWIiOiIxNSIsInNjb3BlcyI6W119.sctqM_IL31kUsn_X__FJHVDBCSYKHDgBSjRCrDJvh0xtWYw28CQS_mZ8UxWTWibPHFujnxhRNjCyAPrKz56_oE-Tn5vBrI0O3JRmbQm0vcMxjzYnqSyiffbxUpq7Jq1XDRV3d8QIgkpR_nQw8ctVm_ApEP-3-xpENXUZK0Qq06f5cQfqjD3LT5e3MrWl3GzaLS-S3VFFMxLtw7GyrD_sq6PHQ2nhydTBfTsMoqmHmyCykPR8iVZHgUgbSwpuvSici5fZ0KTtmrn8tpp1gc6WiuhYVpEJ6G_CnatyIfLbfXm5yalygWqaZE98QddFn52-XDXzHR4LnVFZowbk5NL79yEQVFvIO_eUhcFRZ1VO-1s8taeP3Z7fO7boykcR4RKGIqUzRz4NBDiUB1gUNQ-tvGLV8I6D_PHVrx4mVCE-RzFChrO-0ErXenkzXZLWRcE9029NvzhCOkP5vyxgCUwgYYeZ4mhQ9jJXsahKRGTrOKDNJxtMhmi7RoX3CglcYP17d2zP2Dw3hb8I-MA-yjNbITnnep2YaV78sMbk1hRcj4yGa5yqDb7AF6COSqyv-lu4Ulpj3Tb7vUq4xHN4WM7y89Bqsz4JYNxJnwbWqehZRfak5_4m4xjoo9Q7g84KHOvB-orQ0_t2ZPX0tukuQG-zpDYH7tP9tlnckZerobgNbic"; // Replace with your actual token

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Print the stored access token
    String accessToken = prefs.getString('accessToken') ?? 'Access Token empty';
    print('Stored Access Token: $accessToken');

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json', // Set content type to JSON
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final DeleteStudentInviteList deleteStudentInviteList =
            DeleteStudentInviteList.fromJson(data);
        print(deleteStudentInviteList.data?[0].email);
        return deleteStudentInviteList;
      } else {
        // Handle error gracefully
        print(
            'Failed to load dropdown data, status code: ${response.statusCode}');
        throw Exception(
            'Failed to load dropdown data: ${response.body}'); // Provide more context in the exception message
      }
    } catch (e) {
      // Handle any other exceptions
      print('Error retrieving dropdown data: $e');
      throw e;
    }
  }
}
