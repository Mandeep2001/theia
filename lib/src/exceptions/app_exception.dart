class AppException implements Exception {
  final String message;

  AppException(
      [this.message =
          'Qualcosa è andato storto, controlla la tua connessione ad internet e riprova.']);
}
