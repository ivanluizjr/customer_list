class CustomerListEntity {
  final int id;
  final String nome;
  final int idade;
  final String email;
  final String endereco;
  final String cidade;
  final String estado;

  const CustomerListEntity({
    required this.id,
    required this.nome,
    required this.idade,
    required this.email,
    required this.endereco,
    required this.cidade,
    required this.estado,
  });

  factory CustomerListEntity.empty() {
    return const CustomerListEntity(
      id: 0,
      nome: '',
      idade: 0,
      email: '',
      endereco: '',
      cidade: '',
      estado: '',
    );
  }
}
