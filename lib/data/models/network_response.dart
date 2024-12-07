class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
   String? errorMessage;
     dynamic responserData;

  NetworkResponse({required this.statusCode, required this.isSuccess,  this.errorMessage ="Something went Wrong!!!", this.responserData});
}