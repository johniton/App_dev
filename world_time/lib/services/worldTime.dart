import 'dart:convert';
import 'package:http/http.dart' as http;

class Worldtime {
  String location; //
  String continent;
  String flag;

  Future<String> getTime() async {
    try {
      final url = Uri.parse(
          'https://www.timeapi.io/api/Time/current/zone?timeZone=$continent/$location');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map timeData = jsonDecode(response.body);
        return timeData['time']; // Returns a String
      } else {
        print("Failed to fetch time. Status Code: ${response.statusCode}");
        return "Error";
      }
    } catch (e) {
      print("Error: $e");
      return "Error"; // Ensures the function always returns a String
    }
  }

  Worldtime(
      {required this.location, required this.continent, required this.flag});
}
