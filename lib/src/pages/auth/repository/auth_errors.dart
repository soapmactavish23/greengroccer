String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'E-mail ou senha inválidos';
    default:
      return 'Um erro indefinido ocorreu';
  }
}
