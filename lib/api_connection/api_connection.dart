import 'package:firebase_auth/firebase_auth.dart';
import 'package:ice_durable_articles/api_model/asset_followStatusAdmin.dart';
import 'package:ice_durable_articles/api_model/asset_group.dart';
import 'package:http/http.dart' as http;
import 'package:ice_durable_articles/api_connection/base_url.dart';
import 'dart:convert';

import 'package:ice_durable_articles/api_model/asset_brs.dart';
import 'package:ice_durable_articles/api_model/asset_historyborrow_model.dart';
import 'package:ice_durable_articles/api_model/asset_insertBorrow.dart';
import 'package:ice_durable_articles/api_model/asset_profile.dart';
import 'package:ice_durable_articles/api_model/asset_qrSearch.dart';
import 'package:ice_durable_articles/api_model/asset_scanAdminDetails.dart';
import 'package:ice_durable_articles/api_model/asset_updateReturn.dart';
import 'package:ice_durable_articles/api_model/asset_veriflyAllAdmin.dart';
import 'package:ice_durable_articles/api_model/asset_veriflyDetails.dart';

class API {
  //ถ้า IP เครื่องเปลี่ยน ต้องเปลี่ยนด้วย check cmd  ipconfig
  // static const hostConnect = "http://10.0.101.125/ice_project";
  static final base_url = "http://10.0.101.125/ice_project";

  // static final String base_url = "http://10.1.179.110/ice_project";

  static final String serviceUrl = "kittipong.synology.me:3036";
  static final String serviceUrlHTTP = "http://kittipong.synology.me:3036";

// Search
  static Future<List<QRSearch>> getAssetQRSearch(String qr_id) async {
    var url = Uri.http(serviceUrl, '/ice_project_borrow/QR_Search.php');
    final response = await http.post(url, body: {
      "qr_id": qr_id,
    });
    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<QRSearch>((json) {
        return QRSearch.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

// เรียก user_id มาใช้ ในหน้า QR_Scanner
  static Future<List<AssetProfile>> getAssetProfile(
      // getAssetGroupBorrow คือ ชื่อ function ที่เราตั้งเอง
      // String user_id, ส่งค่า user_id ไปให้ API
      String user_id) async {
    var url = Uri.http(serviceUrl, '/ice_project_borrow/profile.php');
    final response = await http.post(url, body: {
      "user_id": user_id,
    });
    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<AssetProfile>((json) {
        return AssetProfile.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  // API หน้า QR_details เพื่อทำสถานะ ว่าง / ไม่ว่าง ปุ่ม ยืม คืน
  static Future<List<BRSPOST>> getAssetBRS(
      String user_id, String qr_code) async {
    var url = Uri.http(
        serviceUrl, '/ice_project_borrow/borrow_return_status.php');
    print("in funtion getAssetBRS");
    print(url.toString());

    final response = await http.post(url, body: {
      "user_id": user_id,
      "QR_code": qr_code,
    });

    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<BRSPOST>((json) {
        return BRSPOST.fromJson(json);
      }).toList();
      print("response_200 in getAssetBRS");
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  // สำหรับปุ่ม update คืน
  static Future<List<UpdateReturn>> getAssetUpdateReturn(
      String user_id, String qr_code) async {
    var url = Uri.http(
        serviceUrl, '/ice_project_borrow/update_retrun.php');
    print("in funtion UpdateReturn");
    print(url.toString());

    final response = await http.post(url, body: {
      "user_id": user_id,
      "QR_code": qr_code,
    });

    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<UpdateReturn>((json) {
        return UpdateReturn.fromJson(json);
      }).toList();
      print("response_200 in getAssetBRS");
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }
// สำหรับปุ่ม เพิ่มการยืม
  static Future<List<InsertBorrow>> getAssetInsertBorrow(
      String user_id, String qr_code, String name, String room , String D_number , String fig,) async {
    var url = Uri.http(
        serviceUrl, '/ice_project_borrow/insert_borrow.php');
    print("in funtion getAssetBRS");
    print(url.toString());

    final response = await http.post(url, body: {
      "user_id": user_id,
      "QR_code": qr_code,
      "name": name,
      "room": room,
      "D_number": D_number,
      "fig": fig,


    });

    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<InsertBorrow>((json) {
        return InsertBorrow.fromJson(json);
      }).toList();
      print("response_200 in getAssetInsertBorrow");
      print("friend = "+friend_data.toString());

      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  // static Future<List<BRSPOST>> getBRS_(String user_id, String qr_code) async {
  //   // Uri.parse('http://kittipong.synology.me:3036/BeeSom/Tborrow.php?user_id&&qr_code'));
  //   // Uri.parse('http://kittipong.synology.me:3036/BeeSom/Tborrow_copy.php'));
  //   // Uri.parse(API.serviceUrlHTTP+'/BeeSom/Tborrow.php?user_id&&qr_code'));
  //   var url = Uri.http(API.base_url + '/Tborrow.php?user_id&&qr_code');
  //   print("get Tborrow");
  //   final response = await http.post(url, body: {
  //     // อันนี้แบบ POST  ส่วนใน qr detail เป็น GET
  //     "user_id": user_id,
  //     "qr_code": qr_code,
  //     // "status": status,
  //   });
  //   print(response.statusCode.toString());
  //   if (response.statusCode == 200) {
  //     final response_data = jsonDecode(response.body);
  //     final friend_data = await response_data.map<BRSPOST>((json) {
  //       return BRSPOST.fromJson(json);
  //     }).toList();
  //     return friend_data;
  //   } else {
  //     throw Exception('Fail to load Todo from the Internet');
  //   }
  // }

  static Future<List<Data_borrow>> get_all_borrow(
      String user_id, String his) async {
    var url = Uri.http(serviceUrl, '/ice_project_borrow/history_all.php');
    // var url = Uri.http(base_url + '/history_all.php');
    print("URL" + url.toString());
    print("CALL PHP");
    // var url = Uri.http('http://localhost/ice_project/history_all.php');

    // "http://localhost/ice_project/history_all.php?user_id=634659115&&history=1"
    final response = await http.post(url, body: {
      // "user_id": "634659115",
      "user_id": user_id,
      "history": his,
    });
    print("user_id from homeHistory = " + user_id);
    print("history from homeHistory = " + his);
    if (response.statusCode == 200) {
      print("in 200");
      final response_data = jsonDecode(response.body);
      print(response_data);
      final friend_data = await response_data.map<Data_borrow>((json) {
        return Data_borrow.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  // static Future<List<HistoryBorrowGroup>> get_assetgroup_history(
  //     String user_id, String history) async {
  //   var url = Uri.http(base_url, '/history_all.php');
  //   final response = await http.post(url, body: {
  //     "user_id": user_id,
  //     "history": history,
  //   });
  //   if (response.statusCode == 200) {
  //     print("200 From API !! ");
  //     final response_data = jsonDecode(response.body);
  //     final friend_data = await response_data.map<HistoryBorrowGroup>((json) {
  //       return HistoryBorrowGroup.fromJson(json);
  //     }).toList();
  //     return friend_data;
  //   } else {
  //     throw Exception('Fail to load Todo from the Internet');
  //   }
  // }

  static Future<List<FollowStatusAdmin>> getFollowStatusAdmin(
      String follow_status, ) async {
    var url = Uri.http(serviceUrl, '/ice_project_borrow/follow_status.php');
    print("URL" + url.toString());
    print("CALL PHP");
    final response = await http.post(url, body: {
      "follow_status": follow_status,
      
    });
    print("user_id from homeHistory = " + follow_status);
    if (response.statusCode == 200) {
      print("in 200");
      final response_data = jsonDecode(response.body);
      print(response_data);
      final friend_data = await response_data.map<FollowStatusAdmin>((json) {
        return FollowStatusAdmin.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }


  static Future<List<VeriflyDetails>> getAssetVeriflyDetails(
      // getAssetGroupBorrow คือ ชื่อ function ที่เราตั้งเอง
      // String user_id, ส่งค่า user_id ไปให้ API
      String borrow_id) async {
    var url = Uri.http(serviceUrl, '/ice_project_borrow/verifly_detel.php');
    final response = await http.post(url, body: {
      "borrow_id": borrow_id,
    });
    if (response.statusCode == 200) {
      print("in 200");
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<VeriflyDetails>((json) {
        return VeriflyDetails.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  static Future<List<VeriflyDetails>> getAssetVeriflyRepair(
      // getAssetGroupBorrow คือ ชื่อ function ที่เราตั้งเอง
      // String user_id, ส่งค่า user_id ไปให้ API
      String borrow_id) async {
    var url = Uri.http(serviceUrl, '/ice_project_borrow/verifly_repair.php');
    final response = await http.post(url, body: {
      "borrow_id": borrow_id,
    });
    if (response.statusCode == 200) {
      print("in 200");
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<VeriflyDetails>((json) {
        return VeriflyDetails.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  static Future<List<VeriflyAllAdmin>> getVeriflyAllAdmin(
      // getAssetGroupBorrow คือ ชื่อ function ที่เราตั้งเอง
      // String user_id, ส่งค่า user_id ไปให้ API
      String verifly) async {
    var url = Uri.http(serviceUrl, '/ice_project_borrow/verifly_all.php');
    final response = await http.post(url, body: {
      "verifly": verifly,
    });
    if (response.statusCode == 200) {
      print("in 200");
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<VeriflyAllAdmin>((json) {
        return VeriflyAllAdmin.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  static Future<List<ScanAdminDetails>> getScanAdminDetails(
      // getAssetGroupBorrow คือ ชื่อ function ที่เราตั้งเอง
      // String user_id, ส่งค่า user_id ไปให้ API
      String qr_code) async {
    var url = Uri.http(serviceUrl, '/ice_project_borrow/scan_admindetail.php');
    final response = await http.post(url, body: {
      "QR_code": qr_code,
    });
    if (response.statusCode == 200) {
      print("in 200");
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<ScanAdminDetails>((json) {
        return ScanAdminDetails.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }




}
