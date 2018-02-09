LOCAL_PATH := $(call my-dir)
 
prebuilt_stdcxx_PATH := /home/hailong/Android/android-ndk-r15b/sources/cxx-stl/gnu-libstdc++/4.9
prebuild_stdcxx_LIBDIR := $(prebuilt_stdcxx_PATH)/libs/armeabi-v7a
 
OSG_SRC_FILES 		:= \
JNIosgViewer.cpp \
JNIosg.cpp \
JNIosgDB.cpp \
JNIosgUtil.cpp \
JNIosgGA.cpp \
JNIUtils.cpp \
MultiViewNode.cpp \
GLES2ShaderGenVisitor.cpp

OSG_LDLIBS := \
-losgdb_osg \
-losgdb_ive \
-losgdb_rgb \
-losgdb_openflight \
-losgdb_serializers_osgvolume \
-losgdb_serializers_osgtext \
-losgdb_serializers_osgterrain \
-losgdb_serializers_osgsim \
-losgdb_serializers_osgshadow \
-losgdb_serializers_osgparticle \
-losgdb_serializers_osgmanipulator \
-losgdb_serializers_osgfx \
-losgdb_serializers_osganimation \
-losgdb_serializers_osgui \
-losgdb_serializers_osgviewer \
-losgdb_serializers_osgga \
-losgdb_serializers_osgutil \
-losgdb_serializers_osg \
-losgdb_deprecated_osgwidget \
-losgdb_deprecated_osgviewer \
-losgdb_deprecated_osgvolume \
-losgdb_deprecated_osgtext \
-losgdb_deprecated_osgterrain \
-losgdb_deprecated_osgsim \
-losgdb_deprecated_osgshadow \
-losgdb_deprecated_osgparticle \
-losgdb_deprecated_osgfx \
-losgdb_deprecated_osganimation \
-losgdb_deprecated_osg \
-losgPresentation \
-losgWidget \
-losgUI \
-losgViewer \
-losgVolume \
-losgTerrain \
-losgText \
-losgShadow \
-losgSim \
-losgParticle \
-losgManipulator \
-losgGA \
-losgFX \
-losgDB \
-losgAnimation \
-losgUtil \
-losg \
-lOpenThreads \
-L$(prebuild_stdcxx_LIBDIR) -lgnustl_static -lsupc++


### GLES1 build
#include $(CLEAR_VARS)
#OSG_SDK := "/home/hailong/OSG/TerrainGis340/dependence/OpenSceneGraph-3.0.1" #/Users/rgaitan/Projects/OSG/osg-trunk-android-static-gles1-sdk
#OSG_SDK_LIB_PATH := $(OSG_SDK)/lib_android/local/armeabi-v7a
#OSG_SDK_PLUGIN_PATH := $(OSG_SDK_LIB_PATH)
#ifneq (,$(wildcard $(OSG_SDK)/include_android/osg/Config))

 #   APP_MODULES       := jniosg-gles1
 #   LOCAL_CFLAGS      := -Werror -fno-short-enums -fPIC
 #   LOCAL_CPPFLAGS    := -DOSG_LIBRARY_STATIC 
 #   LOCAL_SRC_FILES   := $(OSG_SRC_FILES)
 #   LOCAL_MODULE      := libjniosg-gles1
 #   LOCAL_LDLIBS      := -llog -lGLESv1_CM -ldl 
 #   LOCAL_C_INCLUDES  := $(OSG_SDK)/include
 #   TARGET_LDLIBS     := $(OSG_LDLIBS)
 #   LOCAL_LDFLAGS := -L$(OSG_SDK_LIB_PATH) -L$(OSG_SDK_PLUGIN_PATH) 
 #   include $(BUILD_SHARED_LIBRARY)
#else
 #   $(warning Unable to find osg/Config file in the headers, not building libjniosg-gles1 module)
#endif

### GLES2 build
include $(CLEAR_VARS)
OSG_SDK := /home/hailong/OSG/TerrainGis340/dependence/OpenSceneGraph-3.0.1
OSG_SDK_LIB_PATH := $(OSG_SDK)/lib_android/local/armeabi-v7a
OSG_SDK_PLUGIN_PATH := $(OSG_SDK_LIB_PATH)
ifneq ( ,$(wildcard $(OSG_SDK)/include_android/osg/Config))
    APP_MODULES       += jniosg-gles2
    LOCAL_CFLAGS      := -Werror -fno-short-enums -fPIC
    LOCAL_CPPFLAGS    := -DOSG_LIBRARY_STATIC 
    LOCAL_SRC_FILES   := $(OSG_SRC_FILES)
    LOCAL_MODULE      := libjniosg-gles2
    LOCAL_LDLIBS      := -llog -lGLESv2 -ldl -lz 
    LOCAL_C_INCLUDES  := $(OSG_SDK)/include_android
    TARGET_LDLIBS     := $(OSG_LDLIBS)
    LOCAL_LDFLAGS     := -L$(OSG_SDK_LIB_PATH) -L$(OSG_SDK_PLUGIN_PATH) 
    include $(BUILD_SHARED_LIBRARY)
else
    $(warning Unable to find osg/Config file in the headers, not building libjniosg-gles2 module)
endif

