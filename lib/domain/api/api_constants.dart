final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(minutes: 1);
  static const Duration receiveTimeout = Duration(minutes: 1);

  static const String baseUrl = "https://api.themoviedb.org/v3";

  static const String apiTMDBUpcoming = "/movie/upcoming";
  static const String apiTMDBPopular= "/movie/popular";
  static const String apiTMDBTopRated = "/movie/top_rated";




// Query parameters
  static final Map<String, String> header = {
    "api_key": ApiConst.apiKey,
    "Content-Type": "application/json",
  };

  // Account and API Keys
  static const String accountId = "21460780";
  static const String apiKey = "9fe21bcc3c49eaa1df5d00bc414b721bfed686cc";
}

final class ApiParams {
  const ApiParams._();

  // Method to generate authorization header
  static Map<String, String> authorizationHeader() => {
        "Authorization": "Bearer ${ApiConst.apiKey}",
        "Content-Type": "application/json",
      };

  // Parameters for sending SMS verification code
  static Map<String, dynamic> cabinetSmsCheckParams({
    required String phone,
    required String code,
  }) =>
      <String, dynamic>{
        "phone": phone,
        "code": code,
      };

  // Empty parameter map when no additional parameters are needed
  static Map<String, dynamic> emptyParams() => <String, dynamic>{};

  // Query parameters for requesting a movie list with pagination
  static Map<String, dynamic> movieListParams({required int page}) => {
        "api_key": ApiConst.apiKey,
        "account_id": ApiConst.accountId,
        "page": page,
      };
}
