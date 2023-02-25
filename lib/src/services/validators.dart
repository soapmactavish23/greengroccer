import 'package:validadores/Validador.dart';

String? emailValidator(String? email) {
  return Validador().add(Validar.EMAIL, msg: "E-mail inválido").validar(email);
}

String? passwordValidator(String? value) {
  return Validador()
      .minLength(7, msg: "A senha deve ter pelo menos 7 caracteres")
      .validar(value);
}

String? nameValidator(String? value) {
  return Validador()
      .add(Validar.OBRIGATORIO, msg: "Nome é obrigatório")
      .validar(value);
}

String? phoneValidator(String? value) {
  return Validador()
      .add(Validar.OBRIGATORIO, msg: "Contato é obrigatório")
      .validar(value);
}

String? cpfValidator(String? value) {
  return Validador()
      .add(Validar.CPF, msg: "CPF inválido")
      .validar(value);
}
