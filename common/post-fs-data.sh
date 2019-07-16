#!/system/bin/sh
# Do NOT assume where your module will be located.
# ALWAYS use $MODDIR if you need to know where this script
# and module is placed.
# This will make sure your module will still work
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# setup selinux policy
magiskpolicy --live "allow adbd magisk unix_stream_socket { connectto }"
magiskpolicy --live "allow untrusted_app vendor_default_prop file { read open }"
magiskpolicy --live "allow adbd vendor_toolbox_exec file { getattr execute execute_no_trans read open }"

# fakelocation xposed
magiskpolicy --live "allow nfc app_data_file dir { search }"
