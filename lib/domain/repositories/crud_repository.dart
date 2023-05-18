abstract class CrudRepository<T> {
  Future<T> create({required int userId, required T resource});
  Future<List<T>> readAll({required int userId, int? resourceId});
  Future<bool> delete({required int userId, int resourceId});
}
