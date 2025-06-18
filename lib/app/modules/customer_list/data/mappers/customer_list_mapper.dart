import 'package:customer_list/app/modules/customer_list/model/customer_list_entity.dart';

class CustomerListMapper {
  static CustomerListEntity fromMap(Map<String, dynamic> json) {
    return CustomerListEntity(
      id: json['id'] as int,
      nome: json['nome'] as String,
      idade: json['idade'] as int,
      email: json['email'] as String,
      endereco: json['endereco'] as String,
      cidade: json['cidade'] as String,
      estado: json['estado'] as String,
    );
  }

  static Map<String, dynamic> toMap(CustomerListEntity entity) {
    return {
      'id': entity.id,
      'nome': entity.nome,
      'idade': entity.idade,
      'email': entity.email,
      'endereco': entity.endereco,
      'cidade': entity.cidade,
      'estado': entity.estado,
    };
  }

  static List<CustomerListEntity> fromList(Map<String, dynamic> json) {
    if (json['clientes'] == null) return [];
    final List<dynamic> customerList = json['clientes'] as List<dynamic>;
    return customerList
        .map((customerJson) => fromMap(customerJson as Map<String, dynamic>))
        .toList();
  }
}
