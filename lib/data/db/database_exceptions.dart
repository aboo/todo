abstract class DatabaseException implements Exception {
  const DatabaseException();
  String? get message;
}

class UnableToCreate extends DatabaseException {
  @override
  String? message;
  UnableToCreate({this.message});
}

class UnableToRead extends DatabaseException {
  @override
  String? message;
  UnableToRead({this.message});
}

class UnableToUpdate extends DatabaseException {
  @override
  String? message;
  UnableToUpdate({this.message});
}

class UnableToDelete extends DatabaseException {
  @override
  String? message;
  UnableToDelete({this.message});
}
