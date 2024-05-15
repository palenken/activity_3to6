import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  stdout.write('Enter city name: ');
  String city = stdin.readLineSync()!;
  try {
    final weatherData = await fetchWeatherData(city);
    print('Weather Data for $city:');
    print(weatherData);
  } catch (error) {
    print('Error fetching weather data: $error');
  }
}

Future<Map<String, dynamic>> fetchWeatherData(String city) async {
  final String apiKey = 'HnXz4kDt7avdCGObYhW+ig==FhYbRQzKIIAJ0WQk'; // Replace with your actual API key
  final String apiUrl = 'https://api.api-ninjas.com/v1/weather?city=$city';

  HttpClient httpClient = HttpClient();

  try {
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(apiUrl));
    // Include the API key in request headers
    request.headers.add('X-Api-Key', apiKey);
    
    HttpClientResponse response = await request.close();

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to fetch data: ${response.statusCode}');
    }

    String responseBody = await response.transform(utf8.decoder).join();
    Map<String, dynamic> jsonData = json.decode(responseBody);

    httpClient.close();

    // Extract specific fields from jsonData
    Map<String, dynamic> selectedData = {
      'cloud_pct': jsonData['cloud_pct'],
      'humidity': jsonData['humidity'],
      'min_temp': jsonData['min_temp'],
      'max_temp': jsonData['max_temp']
    };

    return selectedData;
  } catch (error) {
    httpClient.close();
    throw Exception('Failed to fetch data: $error');
  }
}
