/// I'm gonna keep this simple for now and improve later in production
abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerError extends Failure {
  ServerError(super.message);
}

class AuthException extends Failure {
  AuthException(super.message);
}
