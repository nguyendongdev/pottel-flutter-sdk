# Global Loading System

## Overview
This implementation provides a global loading overlay system that can be used throughout the Flutter application with or without a BuildContext.

## Files
- `global_loading.dart` - Contains the loading overlay widget and manager
- `loading_example.dart` - Example usage demonstrations

## Usage

### Method 1: With Context
```dart
// Start loading
Common.startLoading(context);

// Stop loading
Common.stopLoading();
```

### Method 2: Without Context (using NavigatorKey)
```dart
// Start loading (uses NavigatorService.context internally)
Common.startLoading();

// Stop loading
Common.stopLoading();
```

### Method 3: In Async Functions
```dart
void performAsyncOperation() async {
  Common.startLoading(context);
  
  try {
    // Your async operation here
    await someApiCall();
  } catch (e) {
    // Handle error
  } finally {
    // Always stop loading
    Common.stopLoading();
  }
}
```

### Method 4: Error Recovery
```dart
// Force clear loading state in case of errors
Common.clearLoading();
```

## Features
- ✅ Works with or without BuildContext
- ✅ Uses NavigatorKey when context is not available
- ✅ Prevents multiple overlays from being shown
- ✅ Semi-transparent background with white loading indicator
- ✅ Easy to use static methods
- ✅ Backward compatible with existing code
- ✅ Error handling and recovery methods
- ✅ Safe overlay management

## Implementation Details

### GlobalLoadingOverlay
A Material widget that displays a circular progress indicator with a semi-transparent black background.

### LoadingManager
Static class that manages the overlay entry:
- `show(BuildContext context)` - Shows the loading overlay
- `hide()` - Hides the loading overlay
- `isLoading` - Returns current loading state
- `forceClear()` - Force clear loading state (error recovery)

### Common Class Updates
Added static methods:
- `startLoading([BuildContext? context])` - Start loading with optional context
- `stopLoading()` - Stop loading
- `clearLoading()` - Force clear loading state (error recovery)

The system automatically falls back to using `NavigatorService.context` when no context is provided.

## Migration from Old System
The old instance methods are still available for backward compatibility:
- `startLoadingDialog()` - Old dialog-based loading
- `stopLoadingDialog()` - Stop dialog-based loading

## Best Practices
1. Always call `stopLoading()` in a `finally` block for async operations
2. Use `context.mounted` checks when showing messages after async operations
3. Prefer the new static methods over the old instance methods
4. Use the context parameter when available for better performance 