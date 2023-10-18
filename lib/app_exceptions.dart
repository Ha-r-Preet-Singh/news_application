class AppException implements Exception {
  String title;
  String body;

  AppException({required this.title, required this.body});

  String toString() {
    return "$title: $body";
  }
}



// class FetchDataException extends AppException{
//
//
//
//
// }
