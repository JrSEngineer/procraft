abstract class IStorageService<T extends Object?> {
  Future<T> saveInLocalStorage(String storageId, T data);
  Future<T> retrieveDataFromLocalStorage(String storageId);
  Future<void> removeFromLocalStorage(String storageId);
}
