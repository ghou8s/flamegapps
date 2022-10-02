#!/sbin/sh
#
###########################################
#
# Copyright (C) 2021 FlameGApps Project
#
# This file is part of the FlameGApps Project created by ayandebnath
#
# The FlameGApps scripts are free software, you can redistribute and/or modify them.
#
# These scripts are distributed in the hope that they will be useful, but WITHOUT ANY WARRANTY.
#
###########################################
# File Name    : installer.sh
###########################################
##
# List of the basic edition gapps files
gapps_list_basic="
CalendarSync
AndroidMigrate
CalendarSync
GoogleBackupTransport
GoogleRestore
MarkupGoogle
SoundPickerGoogle"

# List of the full edition gapps files
gapps_list_full="
AndroidAutoStub
AndroidMigrate
CalendarSync
DeviceHealthServices
DigitalWellbeing
GoogleBackupTransport
GoogleCalculator
GoogleCalendar
GoogleClock
GoogleContacts
GoogleDialer
GoogleKeyboard
GoogleMessages
GooglePackageInstaller
GooglePhotos
GoogleRestore
MarkupGoogle
SetupWizard
SoundPickerGoogle
WallpaperPickerGoogle"

# List of extra/optional files
extra_list="
PixelConfig"

# List of pre-installed unnecessary files
rm_list_basic="
app/ExtShared
app/GoogleCalendarSyncAdapter
app/GoogleContactsSyncAdapter
app/GoogleExtShared
app/GoogleLocationHistory
app/MarkupGoogle
app/MarkupGooglePrebuilt
app/SoundPickerGooglePrebuilt
etc/default-permissions/default-permissions.xml
etc/default-permissions/opengapps-permissions.xml
etc/permissions/com.google.android.dialer.support.xml
etc/permissions/com.google.android.maps.xml
etc/permissions/com.google.android.media.effects.xml
etc/permissions/privapp-permissions-google.xml
etc/permissions/split-permissions-google.xml
etc/preferred-apps/google.xml
etc/sysconfig/dialer_experience.xml
etc/sysconfig/google-hiddenapi-package-whitelist.xml
etc/sysconfig/google.xml
etc/sysconfig/google_build.xml
etc/sysconfig/google_exclusives_enable.xml
etc/sysconfig/nexus.xml
etc/sysconfig/pixel_2018_exclusive.xml
etc/sysconfig/pixel_experience_2017.xml
etc/sysconfig/pixel_experience_2018.xml
framework/com.google.android.dialer.support.jar
framework/com.google.android.maps.jar
framework/com.google.android.media.effects.jar
lib64/libsketchology_native.so
overlay/forceQueryablePackagesOverlay.apk
priv-app/AndroidMigratePrebuilt
priv-app/AndroidPlatformServices
priv-app/CarrierSetup
priv-app/ConfigUpdater
priv-app/ExtServices
priv-app/GmsCore
priv-app/GmsCoreSetupPrebuilt
priv-app/GoogleBackupTransport
priv-app/GoogleExtServices
priv-app/GoogleRestore
priv-app/GoogleServicesFramework
priv-app/Phonesky
priv-app/PrebuiltGmsCore
priv-app/PrebuiltGmsCorePi
priv-app/PrebuiltGmsCoreQt"

rm_list_full="
app/AndroidAutoStubPrebuilt
app/AudioFX
app/Browser
app/Browser2
app/BrowserPrebuilt
app/Calculator
app/Calculator2
app/CalculatorGooglePrebuilt
app/Calendar
app/CalendarGooglePrebuilt
app/CalendarPrebuilt
app/ChromePublic
app/Clock
app/DashClock
app/DeskClock
app/Eleven
app/Email
app/Email2
app/Etar
app/ExactCalculator
app/ExtShared
app/Gallery2
app/GalleryGo
app/GalleryGoPrebuilt
app/GoogleCalendarSyncAdapter
app/GoogleContactsSyncAdapter
app/GoogleExtShared
app/GoogleLocationHistory
app/Hangouts
app/Jelly
app/LatinIMEGoogle
app/LatinIMEGooglePrebuilt
app/MarkupGoogle
app/MarkupGooglePrebuilt
app/MarkupPrebuilt
app/Music
app/Music2
app/MusicPrebuilt
app/Photos
app/PhotosPrebuilt
app/PrebuiltBugle
app/PrebuiltDeskClock
app/PrebuiltDeskClockGoogle
app/RetroMusicPlayer
app/RetroMusicPlayerPrebuilt
app/RevengeOSCalculator
app/SimpleCalendar
app/SimpleGallery
app/SoundPickerGooglePrebuilt
app/Via
app/ViaBrowser
app/ViaBrowserPrebuilt
app/ViaPrebuilt
app/WallpaperPicker
app/WallpaperPickerGooglePrebuilt
app/WallpaperPickerGoogleRelease
app/WallpaperPickerPrebuilt
etc/default-permissions/default-permissions.xml
etc/default-permissions/opengapps-permissions.xml
etc/permissions/com.google.android.dialer.support.xml
etc/permissions/com.google.android.maps.xml
etc/permissions/com.google.android.media.effects.xml
etc/permissions/privapp-permissions-google.xml
etc/permissions/split-permissions-google.xml
etc/preferred-apps/google.xml
etc/sysconfig/dialer_experience.xml
etc/sysconfig/google-hiddenapi-package-whitelist.xml
etc/sysconfig/google.xml
etc/sysconfig/google_build.xml
etc/sysconfig/google_exclusives_enable.xml
etc/sysconfig/nexus.xml
etc/sysconfig/pixel_2018_exclusive.xml
etc/sysconfig/pixel_experience_2017.xml
etc/sysconfig/pixel_experience_2018.xml
framework/com.google.android.dialer.support.jar
framework/com.google.android.maps.jar
framework/com.google.android.media.effects.jar
lib64/libjni_latinimegoogle.so
lib64/libsketchology_native.so
overlay/forceQueryablePackagesOverlay.apk
overlay/GoogleDialerOverlay.apk
priv-app/AndroidAutoStubPrebuilt
priv-app/AndroidMigratePrebuilt
priv-app/AndroidPlafoPlatformServices
priv-app/AudioFX
priv-app/Browser
priv-app/Browser2
priv-app/BrowserPrebuilt
priv-app/Calculator
priv-app/Calendar
priv-app/CarrierSetup
priv-app/Clock
priv-app/ConfigUpdater
priv-app/crDroidMusic
priv-app/DeviceHealthService
priv-app/Eleven
priv-app/Email
priv-app/Email2
priv-app/ExtServices
priv-app/Gallery
priv-app/Gallery2
priv-app/Gallery3d
priv-app/GalleryGo
priv-app/GalleryGoPrebuilt
priv-app/GalleryPrebuilt
priv-app/GmsCore
priv-app/GmsCorePrebuilt
priv-app/GmsCoreSetupPrebuilt
priv-app/GoogleBackupTransport
priv-app/GoogleContacts
priv-app/GoogleDialer
priv-app/GoogleExtServices
priv-app/GooglePackageInstaller
priv-app/GoogleRestore
priv-app/GoogleServicesFramework
priv-app/Hangouts
priv-app/Jelly
priv-app/LatinIMEGooglePrebuilt
priv-app/MarkupGoogle
priv-app/MarkupGooglePrebuilt
priv-app/Music
priv-app/Music2
priv-app/MusicPrebuilt
priv-app/Phonesky
priv-app/Photos
priv-app/PixelSetupWizard
priv-app/PrebuiltDeskClock
priv-app/PrebuiltGalleryGo
priv-app/PrebuiltGmsCore
priv-app/PrebuiltGmsCorePi
priv-app/PrebuiltGmsCoreQt
priv-app/RetroMusicPlayer
priv-app/RetroMusicPlayerPrebuilt
priv-app/SetupWizard
priv-app/SetupWizardPrebuilt
priv-app/SimpleGallery
priv-app/SnapGallery
priv-app/SnapdragonGallery
priv-app/Turbo
priv-app/TurboPrebuilt
priv-app/Via
priv-app/ViaBrowser
priv-app/ViaBrowserPrebuilt
priv-app/ViaPrebuilt
priv-app/WallpaperGooglePrebuilt
priv-app/WallpaperPickerGoogleRelease
priv-app/WallpapersGooglePrebuilt
priv-app/Wellbeing
priv-app/WellbeingGooglePrebuilt
priv-app/WellbeingPrebuilt"

stock_camera="
app/Camera2
app/SimpleCamera
app/Snap
priv-app/Camera2
priv-app/SimpleCamera
priv-app/Snap"

stock_messages="
app/message
app/messages
app/Messages
app/messaging
app/Messaging
app/Messenger
app/QKSMS
app/RevengeMessages
priv-app/messaging
priv-app/Messaging"

stock_soundpicker="
app/PrebuiltSoundPicker
app/SoundPicker
app/SoundPickerPrebuilt
priv-app/PrebuiltSoundPicker
priv-app/SoundPicker
priv-app/SoundPickerPrebuilt"

provision="
app/provision
app/Provision
priv-app/provision
priv-app/Provision"

lineage_setup="
priv-app/LineageSetupWizard"

aosp_dialer="
app/Dialer
priv-app/Dialer"

aosp_contacts="
app/Contact
app/Contacts
priv-app/Contact
priv-app/Contacts"

aosp_keyboard="
app/LatinIME
app/LatinIMEPrebuilt
priv-app/LatinIME
priv-app/LatinIMEPrebuilt"

aosp_packageinstaller="
priv-app/PackageInstaller"

ui_print() {
  echo "ui_print $1
    ui_print" >> $OUTFD
}

set_progress() { echo "set_progress $1" >> $OUTFD; }

contains() { echo "$1" | grep -q "$2" && return 0 || return 1; }

is_pixel_device() { contains "$pixel_device_list" "$device_code" && return 0 || return 1; }

is_mounted() { mount | grep -q " $1 "; }

find_slot() {
  local slot=$(getprop ro.boot.slot_suffix 2>/dev/null)
  [ "$slot" ] || slot=$(grep -o 'androidboot.slot_suffix=.*$' /proc/cmdline | cut -d\  -f1 | cut -d= -f2)
  if [ ! "$slot" ]; then
    slot=$(getprop ro.boot.slot 2>/dev/null)
    [ "$slot" ] || slot=$(grep -o 'androidboot.slot=.*$' /proc/cmdline | cut -d\  -f1 | cut -d= -f2)
    [ "$slot" ] && slot=_$slot
  fi
  [ "$slot" ] && echo "$slot"
}

setup_mountpoint() {
  [ -L $1 ] && mv -f $1 ${1}_link
  if [ ! -d $1 ]; then
    rm -f $1
    mkdir -p $1
  fi
}

clean_up() {
  rm -rf /tmp/flamegapps
  rm -rf /tmp/config.prop
  rm -rf /tmp/flame.prop
  rm -rf /tmp/tar_gapps
  rm -rf /tmp/unzip_dir
  rm -rf $backup_script
  rm -rf $temp_backup_script
}

path_info() {
  ls / > "$log_dir/rootpathinfo.txt"
  ls -RZl $SYSTEM > "$log_dir/systempathinfo.txt"
  ls -RZl /product > "$log_dir/productpathinfo.txt" 2>/dev/null
  ls -RZl /system_ext > "$log_dir/systemextpathinfo.txt" 2>/dev/null
}

log_space() { df -h > $log_dir/space_$1.txt; }

take_logs() {
  ui_print " "
  ui_print "- Copying logs to /sdcard & $zip_dir"
  cp -f $TMP/recovery.log $log_dir/recovery.log
  cd $log_dir
  tar -cz -f "$TMP/flamegapps_debug_logs.tar.gz" *
  cp -f $TMP/flamegapps_debug_logs.tar.gz "$zip_dir/flamegapps_debug_logs.tar.gz"
  cp -f $TMP/flamegapps_debug_logs.tar.gz /sdcard/flamegapps_debug_logs.tar.gz
  cd /
  rm -rf $TMP/flamegapps_debug_logs.tar.gz
}

get_size() {
  local FILE_SIZE=0
  FILE_SIZE=`du -sk "$1" | cut -f1`
  printf "$FILE_SIZE"
}

get_file_prop() {
  grep -m1 "^$2=" "$1" | cut -d= -f2
}

get_prop() {
  # check known .prop files using get_file_prop
  for f in $PROPFILES; do
    if [ -e "$f" ]; then
      prop="$(get_file_prop "$f" "$1")"
      if [ -n "$prop" ]; then
        break # if an entry has been found, break out of the loop
      fi
    fi
  done
  # if prop is still empty; try to use recovery's built-in getprop method; otherwise output current result
  if [ -z "$prop" ]; then
    getprop "$1" | cut -c1-
  else
    printf "$prop"
  fi
}

get_available_space() {
  local available_space=0 partition_info
  partition_info=`df -k $1 | tail -n 1`
  case $partition_info in
    /dev/*) available_space=`echo "$partition_info" | awk '{print $4}'`
    ;;
    *) available_space=`echo "$partition_info" | awk '{print $3}'`
    ;;
  esac
  printf $available_space
}

check_available_space() {
  local file_size
  local partition="$1"
  [ -e $partition ] || return 1
  space_required=`get_prop ro.flame.required_size`
  space_required=$(($space_required + $buffer_space))
  space_available=$(get_available_space "$partition")
  for f in $removal_list; do
    if [ -e "$partition/$f" ]; then
      file_size=`get_size "$partition/$f"`
      space_available=$(($space_available + $file_size))
    fi
  done
  echo -e "\n- Available space in ${partition}: $space_available" >> $flame_log
  if [ "$space_available" -ge "$space_required" ]; then
    return 0
  else
    return 1
  fi
}

# replace_line <file> <line replace string> <replacement line>; modified; for reference, check: https://github.com/osm0sis/AnyKernel3/blob/master/tools/ak3-core.sh
replace_line() {
  local line
  if grep -q "$2" $1; then
    line=$(grep -n "$2" $1 | cut -d: -f1)
    sed -i "${line}s;.*;${3};" $1;
  fi
}

remove_fd() {
  local LIST="$1"
  for f in $LIST; do
    rm -rf $SYSTEM/$f
    rm -rf $SYSTEM/product/$f
    if [ "$rom_sdk" -gt "29" ]; then
      rm -rf $SYSTEM/system_ext/$f
    fi
  done
}

abort() {
  sleep 1
  ui_print "- Aborting..."
  sleep 3
  path_info
  unmount_all
  take_logs
  clean_up
  recovery_cleanup
  exit 1;
}

exit_all() {
  sleep 0.5
  path_info
  log_space "after"
  unmount_all
  sleep 0.5
  set_progress 0.90
  take_logs
  clean_up
  recovery_cleanup
  sleep 0.5
  ui_print " "
  ui_print "- Installation Successful..!"
  ui_print " "
  set_progress 1.00
  exit 0;
}

mount_apex() {
  # For reference, check: https://github.com/osm0sis/AnyKernel3/blob/master/META-INF/com/google/android/update-binary
  [ -d /system_root/system/apex ] || return 1
  local apex dest loop minorx num
  setup_mountpoint /apex
  minorx=1
  [ -e /dev/block/loop1 ] && minorx=$(ls -l /dev/block/loop1 | awk '{ print $6 }')
  num=0
  for apex in /system_root/system/apex/*; do
    dest=/apex/$(basename $apex .apex)
    [ "$dest" = /apex/com.android.runtime.release ] && dest=/apex/com.android.runtime
    mkdir -p $dest
    case $apex in
      *.apex)
        unzip -qo $apex apex_payload.img -d /apex
        mv -f /apex/apex_payload.img $dest.img
        mount -t ext4 -o ro,noatime $dest.img $dest 2>/dev/null
        if [ $? != 0 ]; then
          while [ $num -lt 64 ]; do
            loop=/dev/block/loop$num
            (mknod $loop b 7 $((num * minorx))
            losetup $loop $dest.img) 2>/dev/null
            num=$((num + 1))
            losetup $loop | grep -q $dest.img && break
          done
          mount -t ext4 -o ro,loop,noatime $loop $dest
          if [ $? != 0 ]; then
            losetup -d $loop 2>/dev/null
          fi
        fi
      ;;
      *) mount -o bind $apex $dest;;
    esac
  done
  export ANDROID_RUNTIME_ROOT=/apex/com.android.runtime
  export ANDROID_TZDATA_ROOT=/apex/com.android.tzdata
  export BOOTCLASSPATH=/apex/com.android.runtime/javalib/core-oj.jar:/apex/com.android.runtime/javalib/core-libart.jar:/apex/com.android.runtime/javalib/okhttp.jar:/apex/com.android.runtime/javalib/bouncycastle.jar:/apex/com.android.runtime/javalib/apache-xml.jar:/system/framework/framework.jar:/system/framework/ext.jar:/system/framework/telephony-common.jar:/system/framework/voip-common.jar:/system/framework/ims-common.jar:/system/framework/android.test.base.jar:/system/framework/telephony-ext.jar:/apex/com.android.conscrypt/javalib/conscrypt.jar:/apex/com.android.media/javalib/updatable-media.jar
}

unmount_apex() {
  if [ -d /apex ]; then
    local dest loop
    for dest in $(find /apex -type d -mindepth 1 -maxdepth 1); do
      if [ -f $dest.img ]; then
        loop=$(mount | grep $dest | cut -d" " -f1)
      fi
      (umount -l $dest
      losetup -d $loop) 2>/dev/null
    done
    rm -rf /apex 2>/dev/null
    unset ANDROID_RUNTIME_ROOT ANDROID_TZDATA_ROOT BOOTCLASSPATH
  fi
}

mount_all() {
  # For reference, check: https://github.com/osm0sis/AnyKernel3/blob/master/META-INF/com/google/android/update-binary
  set_progress 0.10
  ui_print " "
  ui_print "- Mounting partitions"
  sleep 1

  local byname mount slot system

  if ! is_mounted /cache; then
    if [ -d /cache ]; then
      ui_print "- Mounting /cache"
      mount /cache
      unmount_cache=true
    fi
  fi
  if ! is_mounted /data; then
    if [ -d /data ]; then
      ui_print "- Mounting /data"
      mount /data
      unmount_data=true
    fi
  fi

  for mount in /vendor /product /system_ext; do
    ui_print "- Mounting $mount"
    mount -o ro -t auto $mount 2>/dev/null
  done

  setup_mountpoint $ANDROID_ROOT

  if ! is_mounted $ANDROID_ROOT; then
    ui_print "- Mounting $ANDROID_ROOT"
    mount -o ro -t auto $ANDROID_ROOT
  fi

  byname=bootdevice/by-name
  [ -d /dev/block/$byname ] || byname=$(find /dev/block/platform -type d -name by-name 2>/dev/null | head -n1 | cut -d/ -f4-)
  [ -d /dev/block/mapper ] && byname=mapper
  [ -e /dev/block/$byname/system ] || slot=$(find_slot)

  case $ANDROID_ROOT in
    /system_root) setup_mountpoint /system;;
    /system)
      if ! is_mounted /system && ! is_mounted /system_root; then
        setup_mountpoint /system_root
        mount -o ro -t auto /system_root
      elif [ -f /system/system/build.prop ]; then
        setup_mountpoint /system_root
        mount --move /system /system_root
      fi
      if [ $? != 0 ]; then
        (umount /system
        umount -l /system) 2>/dev/null
        mount -o ro -t auto /dev/block/$byname/system$slot /system_root
      fi
    ;;
  esac

  [ -f /system_root/system/build.prop ] && system=/system
  for mount in /vendor /product /system_ext; do
    if ! is_mounted $mount && [ -L /system$mount -o -L /system_root$system$mount ]; then
      setup_mountpoint $mount
      mount -o ro -t auto /dev/block/$byname$mount$slot $mount
    fi
  done

  if is_mounted /system_root; then
    mount_apex
    mount -o bind /system_root$system /system
  fi
}

unmount_all() {
  ui_print " "
  ui_print "- Unmounting partitions"
  local mount
  [ "$OLD_LD_PATH" ] && export LD_LIBRARY_PATH=$OLD_LD_PATH
  [ "$OLD_LD_PRE" ] && export LD_PRELOAD=$OLD_LD_PRE
  [ "$OLD_LD_CFG" ] && export LD_CONFIG_FILE=$OLD_LD_CFG
  unset OLD_LD_PATH OLD_LD_PRE OLD_LD_CFG
  if [ "$unmount_data" ]; then
    umount /data
    umount -l /data
  fi
  if [ "$unmount_cache" ]; then
    umount /cache
    umount -l /cache
  fi
  unmount_apex
  for mount in /system /system_root /mnt/system /vendor /mnt/vendor /product /mnt/product /system_ext /mnt/system_ext; do
    if [ -e $mount ]; then
      (umount $mount
      umount -l $mount) 2>/dev/null
    fi
  done
}

# ------------------------ Start the Installation -----------------------------

[ "$ANDROID_ROOT" ] || ANDROID_ROOT=/system

BOOTMODE=false
ps | grep zygote | grep -v grep >/dev/null && BOOTMODE=true
$BOOTMODE || ps -A 2>/dev/null | grep zygote | grep -v grep >/dev/null && BOOTMODE=true

if ! $BOOTMODE; then
  mount -o bind /dev/urandom /dev/random
  if [ -L /etc ]; then
    setup_mountpoint /etc
    cp -af /etc_link/* /etc
    sed -i 's; / ; /system_root ;' /etc/fstab
  fi
  unmount_all
  mount_all
  OLD_LD_PATH=$LD_LIBRARY_PATH
  OLD_LD_PRE=$LD_PRELOAD
  OLD_LD_CFG=$LD_CONFIG_FILE
  unset LD_LIBRARY_PATH LD_PRELOAD LD_CONFIG_FILE
fi

if [ -d /dev/block/mapper ]; then
  for block in system vendor product; do
    for slot in "" _a _b; do
      blockdev --setrw /dev/block/mapper/$block$slot 2>/dev/null
    done
  done
fi

mount -o rw,remount -t auto /system
(mount -o rw,remount -t auto /vendor
mount -o rw,remount -t auto /product
mount -o rw,remount -t auto /system_ext) 2>/dev/null

SYSTEM=/system

PROPFILES="$SYSTEM/build.prop $TMP/flame.prop"
CORE_DIR="$TMP/tar_core"
GAPPS_DIR="$TMP/tar_gapps"
EXTRA_DIR="$TMP/tar_extra"
UNZIP_FOLDER="$TMP/unzip_dir"
EX_SYSTEM="$UNZIP_FOLDER/src"
zip_dir="$(dirname "$ZIPFILE")"
log_dir="$TMP/flamegapps/logs"
flame_log="$log_dir/installation_log.txt"
build_info="$log_dir/build_info.prop"
backup_script="$TMP/backup_script.sh"
temp_backup_script="$TMP/temp_backup_script.sh"
overlay_installed="false"
buffer_space=2000
pixel_device_list="sailfish marlin walleye taimen blueline crosshatch sargo bonito flame coral sunfish bramble redfin dragon oriole raven"
mkdir -p $UNZIP_FOLDER
mkdir -p $log_dir
log_space "before"

# Get ROM, device & package information
flame_android=`get_prop ro.flame.android`
flame_sdk=`get_prop ro.flame.sdk`
flame_arch=`get_prop ro.flame.arch`
flame_edition=`get_prop ro.flame.edition`
rom_version=`get_prop ro.build.version.release`
rom_sdk=`get_prop ro.build.version.sdk`
device_architecture=`get_file_prop "$SYSTEM/build.prop" "ro.product.cpu.abilist"`
device_code=`get_prop ro.product.device`

if [ -z "$device_architecture" ]; then
  device_architecture=`get_prop ro.product.cpu.abi`
fi

case "$device_architecture" in
  *x86_64*) arch="x86_64"
    ;;
  *x86*) arch="x86"
    ;;
  *arm64*) arch="arm64"
    ;;
  *armeabi*) arch="arm"
    ;;
  *) arch="unknown"
    ;;
esac

echo ------------------------------------------------------------------- >> $flame_log
(echo "  --------------- FlameGApps Installation Logs ---------------"
echo "- Android Root: $ANDROID_ROOT"
echo "- Flame version: $flame_android"
echo "- Flame SDK: $flame_sdk"
echo "- Flame ARCH: $flame_arch"
echo "- ROM version: $rom_version"
echo "- ROM SDK: $rom_sdk"
echo "- Device ARCH: $device_architecture ($arch)"
echo "- Device code: $device_code") >> $flame_log
cat $SYSTEM/build.prop > $build_info
cat $TMP/flame.prop >> $build_info

set_progress 0.20
sleep 1
ui_print " "
ui_print "- Android: $rom_version, SDK: $rom_sdk, ARCH: $arch"
sleep 1

if [ ! "$rom_sdk" = "$flame_sdk" ]; then
  ui_print " "
  ui_print "****************** WARNING *******************"
  ui_print " "
  ui_print "! Wrong android version detected"
  sleep 0.5
  ui_print "This package is for android: $flame_android only"
  sleep 0.5
  ui_print "Your ROM is Android: $rom_version"
  sleep 0.5
  ui_print " "
  ui_print "******* FlameGApps Installation Failed *******"
  ui_print " "
  abort
fi

if [ ! "$arch" = "$flame_arch" ]; then
  ui_print " "
  ui_print "****************** WARNING *******************"
  ui_print " "
  ui_print "! Wrong device architecture detected"
  sleep 0.5
  ui_print "This package is for device: $flame_arch only"
  sleep 0.5
  ui_print "Your device is: $arch"
  sleep 0.5
  ui_print " "
  ui_print "******* FlameGApps Installation Failed *******"
  ui_print " "
  abort
fi

if [ "$flame_edition" = "basic" ]; then
  removal_list="$rm_list_basic"
  gapps_list="$gapps_list_basic"
elif [ "$flame_edition" = "full" ]; then
  removal_list="$rm_list_full"
  gapps_list="$gapps_list_full"
else
  ui_print " "
  ui_print "****************** WARNING *******************"
  ui_print " "
  sleep 0.5
  ui_print "! Failed to detect FlameGApps edition type"
  sleep 0.5
  ui_print " "
  ui_print "******* FlameGApps Installation Failed *******"
  ui_print " "
  abort
fi

# Check available space and choose the preferred partition for gapps installation
PREFERRED_PARTITION=$SYSTEM
insufficient_space="true"
for p in $SYSTEM/system_ext $SYSTEM/product $SYSTEM; do
  if check_available_space "$p"; then
    insufficient_space="false"
    PREFERRED_PARTITION=$p
    PREFERRED_PARTITION_PREFIX="/system"
    if contains "$PREFERRED_PARTITION" "/system_ext"; then
      PREFERRED_PARTITION_NAME="system_ext"
    elif contains "$PREFERRED_PARTITION" "/product"; then
      PREFERRED_PARTITION_NAME="product"
    else
      PREFERRED_PARTITION_NAME="system"
      PREFERRED_PARTITION_PREFIX=""
    fi
    break
  fi
done

ui_print " "
ui_print "- Preferred partition $PREFERRED_PARTITION"
ui_print " "
ui_print "- Availabe space: $space_available KB"
(echo -e "\n- Availabe space $space_available"
echo -e "\n- Required space $space_required") >> $flame_log
if [ "$insufficient_space" = "true" ]; then
  ui_print " "
  ui_print "****************** WARNING *******************"
  ui_print " "
  sleep 0.5
  ui_print "! Insufficient available space"
  sleep 0.5
  ui_print "Availbale space is $space_available KB"
  sleep 0.5
  ui_print "Space required $space_required KB"
  sleep 0.5
  ui_print " "
  ui_print "******* FlameGApps Installation Failed *******"
  ui_print " "
  abort
fi

# Remove pre-installed unnecessary system apps
ui_print " "
ui_print "- Removing unnecessary system apps"
ui_print " "
set_progress 0.30
sleep 0.5
echo -e "\n- Removing $flame_edition list files" >> $flame_log
remove_fd "$removal_list"

check_gapps_config() {
  for p in "$zip_dir" /sdcard; do
    if [ -e "$p/flamegapps-config.txt" ] && [ ! -e $TMP/config.prop ]; then
      ui_print "- GApps config detected"
      ui_print " "
      cp -f "$p/flamegapps-config.txt" $TMP/config.prop
      cp -f $TMP/config.prop $log_dir/config.prop
      chmod 0644 $TMP/config.prop
      gapps_config="true"
    fi
  done
}

update_gapps_list() {
  echo -e "\n- Updating gapps list" >> $flame_log
  if is_pixel_device; then
    gapps_list=${gapps_list/GoogleRestore}
  else
    gapps_list=${gapps_list/AndroidMigrate}
  fi
}

extract_and_install() {
  local TYPE="$1"
  local SOURCE="$2"
  local FILE="$3"
  unzip -o "$ZIPFILE" "tar_${TYPE}/$FILE.tar.xz" -d $TMP
  tar -xf "$SOURCE/$FILE.tar.xz" -C $UNZIP_FOLDER
  rm -rf $SOURCE/$FILE.tar.xz
  installed_list="$installed_list\n${FILE}"
  file_list="$(find "$EX_SYSTEM/" -mindepth 1 -type f | cut -d/ -f5-)"
  dir_list="$(find "$EX_SYSTEM/" -mindepth 1 -type d | cut -d/ -f5-)"
  for file in $file_list; do
    if contains "$file" "overlay/"; then
      if [ "$PREFERRED_PARTITION_NAME" = "system" ]; then
        OVERLAY_DEST='product'
      else
        OVERLAY_DEST=$PREFERRED_PARTITION_NAME
      fi
      install -D "$EX_SYSTEM/${file}" "$SYSTEM/$OVERLAY_DEST/${file}"
      chcon -h u:object_r:vendor_overlay_file:s0 "$SYSTEM/$OVERLAY_DEST/${file}"
      chmod 0644 "$SYSTEM/$OVERLAY_DEST/${file}"
      backup_file_list="$backup_file_list\n$OVERLAY_DEST/${file}"
      overlay_installed="true"
    else
      install -D "$EX_SYSTEM/${file}" "$PREFERRED_PARTITION/${file}"
      chcon -h u:object_r:system_file:s0 "$PREFERRED_PARTITION/${file}"
      chmod 0644 "$PREFERRED_PARTITION/${file}"
      if [ "$PREFERRED_PARTITION_NAME" = "system" ]; then
        backup_file_list="$backup_file_list\n${file}"
      else
        backup_file_list="$backup_file_list\n${PREFERRED_PARTITION_NAME}/${file}"
      fi
    fi
  done
  for dir in $dir_list; do
    if ! contains "$dir" "overlay"; then
      chcon -h u:object_r:system_file:s0 "$PREFERRED_PARTITION/${dir}"
      chmod 0755 "$PREFERRED_PARTITION/${dir}"
    fi
  done
  rm -rf $UNZIP_FOLDER/*
}

install_core() {
  set_progress 0.50
  ui_print "- Installing Core GApps"
  ui_print " "
  extract_and_install "core" "$CORE_DIR" "Core"
  rm -rf $CORE_DIR
}

install_gapps() {
  set_progress 0.70
  update_gapps_list
  for g in $gapps_list; do
    local gapps=""
    if [ "$gapps_config" = "true" ]; then
      if [ "$(get_file_prop $TMP/config.prop "$g")" -eq "1" ]; then
        gapps="$g"
      else
        ui_print "- Skipping $g"
      fi
    else
      gapps="$g"
    fi
    if [ -n "$gapps" ]; then
      ui_print "- Installing $gapps"
      extract_and_install "gapps" "$GAPPS_DIR" "$gapps"
    fi
  done
}

install_extra() {
  set_progress 0.75
  ui_print " "
  for g in $extra_list; do
    local extra=""
    if [ "$(get_file_prop $TMP/config.prop "$g")" -eq "1" ]; then
      extra="$g"
    fi
    if [ -n "$extra" ]; then
      ui_print "- Installing $extra"
      extract_and_install "extra" "$EXTRA_DIR" "$extra"
    fi
  done
}

# Check for config
check_gapps_config

# Install core gapps files
echo -e "\n- Installing core gapps files" >> $flame_log
install_core >> $flame_log

# Install gapps files
echo -e "\n- Installing gapps files" >> $flame_log
install_gapps >> $flame_log

# Install extra/optional files (gapps config necessary)
if [ "$gapps_config" = "true" ]; then
  echo -e "\n- Installing extra files" >> $flame_log
  install_extra >> $flame_log
fi

echo -e "\n                 Installation Finished            " >> $flame_log
echo ----------------------------------------------------------------- >> $flame_log

sleep 0.5
set_progress 0.80
ui_print " "
ui_print "- Performing other tasks"
# Change context of overlay dir
[ "$overlay_installed" = "true" ] && chcon -h u:object_r:vendor_overlay_file:s0 "$SYSTEM/$OVERLAY_DEST/overlay"

# Check for stock cam removal
if [ "$gapps_config" = "true" ] && [ "$(get_file_prop $TMP/config.prop "ro.remove.snap")" -eq "1" ]; then
  remove_camera="true"
  remove_fd "$stock_camera"
else
  remove_camera="false"
fi

# Delete AOSP PackageInstaller if Google PackageInstaller is present
if contains "$installed_list" "GooglePackageInstaller"; then
  google_packageinstaller="true"
  remove_fd "$aosp_packageinstaller"
fi

# Delete provision and lineage setupwizard if Google SetupWizard is present
if contains "$installed_list" "SetupWizard"; then
  google_setupwizard="true"
  remove_fd "$provision"
  remove_fd "$lineage_setup"
fi

# Delete AOSP Dialer if Google Dialer is present
if contains "$installed_list" "GoogleDialer"; then
  google_dialer="true"
  remove_fd "$aosp_dialer"
fi

# Delete AOSP Contacts if Google Contacts is present
if contains "$installed_list" "GoogleContacts"; then
  google_contacts="true"
  remove_fd "$aosp_contacts"
fi

# Delete AOSP/other Meassages if Google Messages is present
if contains "$installed_list" "GoogleMessages"; then
  google_messages="true"
  remove_fd "$stock_messages"
fi

# Delete AOSP Keyboard if Gboard is present
if contains "$installed_list" "GoogleKeyboard"; then
  google_keyboard="true"
  remove_fd "$aosp_keyboard"
fi

# Delete stock SoundPicker if Google SoundPicker is present
if contains "$installed_list" "SoundPickerGoogle"; then
  google_soundpicker="true"
  remove_fd "$stock_soundpicker"
fi

# Install addon.d script
if [ -d $SYSTEM/addon.d ]; then
  rm -rf $SYSTEM/addon.d/69-flame.sh
  if [ "$gapps_config" = "true" ] && [ "$(get_file_prop $TMP/config.prop "ro.skip.backup_script")" -eq "1" ]; then
    echo -e "\nSkipping addon.d script installation" >> $flame_log
  else
    echo -e "\nInstalling addon.d script" >> $flame_log
    echo '#!/sbin/sh
#
# ADDOND_VERSION=2
#
# /system/addon.d/69-flame.sh
#
. /tmp/backuptool.functions

rm_list="' > $temp_backup_script
    if [ "$remove_camera" = "true" ]; then
      echo "$stock_camera" | sed '/^$/d' >> $temp_backup_script
    fi
    if [ "$google_packageinstaller" = "true" ]; then
      echo "$aosp_packageinstaller" | sed '/^$/d' >> $temp_backup_script
    fi
    if [ "$google_setupwizard" = "true" ]; then
      echo "$provision" | sed '/^$/d' >> $temp_backup_script
      echo "$lineage_setup" | sed '/^$/d' >> $temp_backup_script
    fi
    if [ "$google_dialer" = "true" ]; then
      echo "$aosp_dialer" | sed '/^$/d' >> $temp_backup_script
    fi
    if [ "$google_contacts" = "true" ]; then
      echo "$aosp_contacts" | sed '/^$/d' >> $temp_backup_script
    fi
    if [ "$google_messages" = "true" ]; then
      echo "$stock_messages" | sed '/^$/d' >> $temp_backup_script
    fi
    if [ "$google_keyboard" = "true" ]; then
      echo "$aosp_keyboard" | sed '/^$/d' >> $temp_backup_script
    fi
    if [ "$google_soundpicker" = "true" ]; then
      echo "$stock_soundpicker" | sed '/^$/d' >> $temp_backup_script
    fi
    if [ "$flame_edition" = "basic" ]; then
      echo -n "$rm_list_basic" | sed '/^$/d' >> $temp_backup_script
    elif [ "$flame_edition" = "full" ]; then
      echo -n "$rm_list_full" | sed '/^$/d' >> $temp_backup_script
    fi
    echo -e '"\n\nlist_files() {
cat <<EOF' >> $temp_backup_script
    echo -e "$backup_file_list" | sed '/^$/d' | sort >> $temp_backup_script
    echo 'etc/flame.prop' >> $temp_backup_script
    echo -e 'EOF
}\n' >> $temp_backup_script
    cat $temp_backup_script > $TMP/69-flame.sh
    cat $backup_script >> $TMP/69-flame.sh
    cp -f $TMP/69-flame.sh $SYSTEM/addon.d/69-flame.sh
    chcon -h u:object_r:system_file:s0 "$SYSTEM/addon.d/69-flame.sh"
    chmod 0755 "$SYSTEM/addon.d/69-flame.sh"
  fi
fi

# Create lib symlinks
if contains "$installed_list" "MarkupGoogle"; then
  install -d "$PREFERRED_PARTITION/app/MarkupGoogle/lib/arm64"
  ln -sfn "${PREFERRED_PARTITION_PREFIX}/${PREFERRED_PARTITION_NAME}/lib64/libsketchology_native.so" "${PREFERRED_PARTITION_PREFIX}/${PREFERRED_PARTITION_NAME}/app/MarkupGoogle/lib/arm64/libsketchology_native.so"
fi
if contains "$installed_list" "GoogleKeyboard"; then
  install -d "$PREFERRED_PARTITION/app/LatinIMEGooglePrebuilt/lib64/arm64"
  ln -sfn "${PREFERRED_PARTITION_PREFIX}/${PREFERRED_PARTITION_NAME}/lib64/libjni_latinimegoogle.so" "${PREFERRED_PARTITION_PREFIX}/${PREFERRED_PARTITION_NAME}/app/LatinIMEGooglePrebuilt/lib64/arm64/libjni_latinimegoogle.so"
fi

# Update *.jar file path inside xml files
if [ ! "$PREFERRED_PARTITION_NAME" = "system" ]; then
  for f in "com.google.android.dialer.support" "com.google.android.maps" "com.google.android.media.effects"; do
    replace_line $PREFERRED_PARTITION/etc/permissions/${f}.xml "file=\"/system/framework/${f}.jar\" />" "file=\"${PREFERRED_PARTITION_PREFIX}/${PREFERRED_PARTITION_NAME}/framework/${f}.jar\" />"
  done
fi

# Install flame.prop
rm -rf $SYSTEM/etc/flame.prop
cp -f $TMP/flame.prop $SYSTEM/etc/flame.prop
chcon -h u:object_r:system_file:s0 "$SYSTEM/etc/flame.prop"
chmod 0644 "$SYSTEM/etc/flame.prop"

exit_all;
