import 'package:api_with_provider/data/exceptions/app_exceptions.dart';
import 'package:api_with_provider/utils/utils.dart';

class BaseErrorHandler {
  void handleError(error) {
    if (error is BadRequestException) {
      var message = error.toString();
      Utils.errorToastMessage(message);
    } else if (error is FetchDataException) {
      var message = error.toString();
      Utils.errorToastMessage(message);
    } else if (error is ApiNotRespondingException) {
      Utils.errorToastMessage("Oops! It took longer to respond");
    }
  }
}
