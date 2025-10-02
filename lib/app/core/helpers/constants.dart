// ignore_for_file: constant_identifier_names

class Constants {
  Constants._();

  //!
  static const ENV_BASE_URL_KEY = 'base_url';
  static const ENV_REST_CLIENT_CONNECT_TIMEOUT_KEY =
      'rest_client_connect_timeout';
  static const ENV_REST_CLIENT_RECEIVE_TIMEOUT_KEY =
      'rest_client_receive_timeout';
  static const REST_CLIENT_AUTH_REQUIRED_KEY = 'auth_required';

  //!
  static const LOCAL_STORAGE_ACCESS_TOKEN_KEY = 'access_token';
  static const LOCAL_STORAGE_REFRESH_TOKEN_KEY = 'refresh_token';
  static const LOCAL_STORAGE_EMAIL_KEY = 'email';
  static const LOCAL_STORAGE_PASSWORD_KEY = 'password';
  static const LOCAL_STORE_LOGGED_USER_MODEL = 'logged_user_model';

  static const APP_VERSION = 'app_version';
  static const List<String> listaIcones = [
    "architect_icon",
    "building_icon",
    "engineer_icon",
    "excavator_icon",
    "helmet_icon",
    "home_repair_icon",
    "person_home_icon",
    "property_icon",
    "service_tools_icon",
    "tools_icon",
    "under_construction_sign_icon"
  ];

  static const List<String> titulosIcones = [
    "Projeto",
    "Construção",
    "Engenheiro",
    "Escavadeira",
    "Capacete",
    "Reparo",
    "Casa e Técnico",
    "Imóvel",
    "Serviços",
    "Ferramentas",
    "Em Construção"
  ];
}
