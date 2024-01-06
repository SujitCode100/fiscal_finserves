class ApiAppConstants {
  // Network Constants
  // static String apiEndPoint = "http://13.232.155.58:4000/"; //dev new
  // static String apiEndPoint = "http://35.154.67.184:4000/"; //dev new
    static String apiEndPoint = "http://13.126.126.9:4000/"; //dev new


  static String apiKey = "b402a414b1aa49699e8c35c68bf91c2f";

  // User
  static const String login = 'user/login';
  static const String signUp = 'user/signup';
  static const String otp = 'user/verifyOtp';
  static const String updateUser = 'user/updateUser';
  static const String userDetailsById = 'user/userDetailsById/';

  //Course
  static const String getCourses = 'course/getCourses';
  static const String getLectureByCourseId = 'lecture/getLectureByCourseId/';
}
