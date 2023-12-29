// import 'dart:async';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:mysql1/mysql1.dart';

// class Server {
//   final String host;
//   final int port;
//   final String user;
//   final String password;
//   final String database;

//   Server(
//       {this.host = 'localhost',
//       this.port = 3306,
//       this.user = 'root',
//       this.password = '',
//       this.database = 'ice_project'}) {
//     // Connect to the database
//     this.connection = new MySqlConnection(
//         host: host, port: port, user: user, password: password, db: database);
//   }

//   MySqlConnection connection;

//   Future<bool> login(String username, String password) async {
//     // Retrieve the user from the database
//     var result = await connection.query(
//         'SELECT * FROM users WHERE username = ? AND password = ?', [username, password]);

//     // If the user exists, return true
//     return result.rows.isNotEmpty;
//   }

//   Future<String> getUserRole(String username) async {
//     // Retrieve the user from the database
//     var result = await connection.query(
//         'SELECT role FROM users WHERE username = ?', [username]);

//     // If the user exists, return their role
//     return result.rows.first['role'];
//   }

//   Future<void> close() async {
//     // Close the database connection
//     await connection.close();
//   }
// }
