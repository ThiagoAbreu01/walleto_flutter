
// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterViewModel {
  String nome;
  String email;
  String cpf;
  String telefone;
  final String password;
  final String confirmPassword;
  // final bool checkBoxIsChecked;
  RegisterViewModel({
    required this.nome,
    required this.email,
    required this.cpf,
    required this.telefone,
    required this.password,
    required this.confirmPassword,
  });

}
