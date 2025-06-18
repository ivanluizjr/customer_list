abstract interface class ICustomerListDatasource {
  Future<List<Map<String, dynamic>>> getCustomers();
}
