# Keep rules for cached_network_image and Fresco
-keep class com.facebook.imagepipeline.** { *; }
-keep class com.facebook.fresco.** { *; }
-keep class com.facebook.drawee.** { *; }
-keep class com.facebook.imagepipeline.nativecode.** { *; }
-keep class com.facebook.imagepipeline.webp.** { *; }

# Keep WebP Transcoder specifically
-keep class com.facebook.imagepipeline.nativecode.WebpTranscoder { *; }
-keep class com.facebook.imagepipeline.nativecode.WebpTranscoderImpl { *; }
-keep class com.facebook.imagepipeline.nativecode.WebpTranscoderFactory { *; }

# Keep all native methods
-keepclassmembers class * {
    native <methods>;
}

# Additional rules for cached_network_image
-keep class com.example.cachednetworkimage.** { *; }
-dontwarn com.facebook.imagepipeline.**
-dontwarn com.facebook.fresco.**