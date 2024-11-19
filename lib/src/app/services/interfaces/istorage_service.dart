abstract class IStorageService<T extends Object> {
  Future<T> saveInLocalStorage(T data);
  Future<T> retrieveDataFromLocalStorage(String storageId);
  Future<void> removeFromLocalStorage(String storageId);
}
