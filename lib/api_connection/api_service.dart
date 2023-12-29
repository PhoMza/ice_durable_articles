// import 'package:ice_durable_kpn/models/assetgroup.dart';
// import 'package:ice_durable_kpn/models/each_assetgroup.dart';
// import 'package:ice_durable_kpn/models/year.dart';
// import 'package:ice_durable_kpn/models/room.dart';
import 'package:http/http.dart' as http;
import 'package:ice_durable_articles/models/assetgroup.dart';
import 'package:ice_durable_articles/models/each_assetgroup.dart';
import 'package:ice_durable_articles/models/room.dart';
import 'dart:convert';

import 'package:ice_durable_articles/models/year.dart';

class ApiService {
  static final String serviceUrl = "kittipong.synology.me:3036";

  //Get All Year
  static Future<List<AllYear>> get_allYear() async {
    var url = Uri.http(
        serviceUrl, '/DurableArticles/ice_durable_kpn/get_all_year.php');
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<AllYear>((json) {
        return AllYear.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  //Get room with asset
  static Future<List<AllRoom>> get_roomwithasset(String Year) async {
    var url = Uri.http(serviceUrl,
        '/DurableArticles/ice_durable_kpn/get_room_with_assets.php');
    final response = await http.post(url, body: {
      "Year": Year,
    });
    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<AllRoom>((json) {
        return AllRoom.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  //Get asset in group (affter room click)
  static Future<List<AssetGroup>> get_assetgroup(
      String Year, String Room) async {
    var url = Uri.http(
        serviceUrl, '/DurableArticles/ice_durable_kpn/get_assetgroup_room.php');
    final response = await http.post(url, body: {
      "Year": Year,
      "Room": Room,
    });
    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<AssetGroup>((json) {
        return AssetGroup.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  //Get asset in each group (affter click group asset)
  static Future<List<EachAssetGroup>> get_each_assetgroup(
      String Room, String DurableName, String Name, String Year) async {
    var url = Uri.http(serviceUrl,
        '/DurableArticles/ice_durable_kpn/get_each_assetgroup_room.php');
    final response = await http.post(url, body: {
      "Room": Room,
      "DurableName": DurableName,
      "Name": Name,
      "Year": Year,
    });
    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<EachAssetGroup>((json) {
        return EachAssetGroup.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }

  //Get asset in group (from search page)
  static Future<List<AssetGroup>> get_assetgroup_search(String keyword) async {
    var url = Uri.http(serviceUrl,
        '/DurableArticles/ice_durable_kpn/get_assetgroup_search.php');
        // '/ice_project_borrow/QR_Search.php');

    final response = await http.post(url, body: {
      "keyword": keyword,
    });
    if (response.statusCode == 200) {
      final response_data = jsonDecode(response.body);
      final friend_data = await response_data.map<AssetGroup>((json) {
        return AssetGroup.fromJson(json);
      }).toList();
      return friend_data;
    } else {
      throw Exception('Fail to load Todo from the Internet');
    }
  }
  
}
