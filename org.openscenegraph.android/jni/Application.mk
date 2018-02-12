#ANDROID APPLICATION MAKEFILE
APP_BUILD_SCRIPT := $(call my-dir)/Android.mk
#APP_PROJECT_PATH := $(call my-dir)

APP_OPTIM := release

APP_PLATFORM 	:= android-8
APP_STL 	:= gnustl_static
APP_CPPFLAGS 	:= -fexceptions -frtti
APP_ABI 	:= armeabi-v7a
APP_MODULES     := jniosg-gles1
NDK_TOOLCHAIN_VERSION := 4.9
