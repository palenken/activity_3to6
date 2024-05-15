import 'dart:io';
import 'dart:convert';

void main() {
  // Read numbers from a file
  File('C:/Users/Administrator/Downloads/iloveyou.txt').openRead().transform(utf8.decoder).join().then((data) {
    List<double> numbers = data.split(',').map((num) {
      try {
        return double.parse(num);
      } catch (e) {
        return 0.0; // Handle invalid numbers by setting them to 0.0
      }
    }).toList().map((num) => num.toDouble()).toList();

    // Calculate the sum
    double sum = numbers.reduce((a, b) => a + b);

    // Write the sum to another file
    var file = File('C:/Users/Administrator/Downloads/sum.txt');

    File('C:/Users/Administrator/Downloads/sum.txt').writeAsString('$sum');
    print('successfully added to $file');
  });
}
