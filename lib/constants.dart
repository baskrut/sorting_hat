const tokenLesHeaders = {
  "Content-Type": "Application/json",
  "Accept": "Application/json",
  "Accept-Encoding": "gzip, deflate, br",
};

const String baseUrl = 'https://hp-api.herokuapp.com/api';

const String charactersUrl = '$baseUrl/characters';

const int httpTimeOut = 10;

const int httpError = 588;
const int httpConnectionError = 599;
