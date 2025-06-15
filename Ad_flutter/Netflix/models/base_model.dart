import 'package:flutter/foundation.dart'; // For ChangeNotifier

/// A base model that can notify listeners about changes.
/// This allows views and controllers to react to state changes in the model.
abstract class BaseModel with ChangeNotifier {
  // Common methods for models can go here if needed.
  // For now, it primarily provides ChangeNotifier functionality.
}