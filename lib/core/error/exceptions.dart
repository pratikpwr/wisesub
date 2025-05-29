class CacheException implements Exception {
  final String message;
  const CacheException([this.message = 'Cache exception occurred']);
}

class ServerException implements Exception {
  final String message;
  const ServerException([this.message = 'Server exception occurred']);
}

class StorageException implements Exception {
  final String message;
  const StorageException([this.message = 'Storage exception occurred']);
}

class ValidationException implements Exception {
  final String message;
  const ValidationException([this.message = 'Validation exception occurred']);
}
