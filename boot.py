# This file is executed on every boot (including wake-boot from deepsleep)
import esp
esp.osdebug(None) #redirect vendor O/S debugging messages to UART(0) 0 or None
import uos, machine
#uos.dupterm(None, 1) # disable REPL on UART(0)
import gc
import webrepl
webrepl.start()
gc.collect()
# setup WiFi connection
# import wifi_connection
# wifi_connection.do_connect()

# import _thread
# import script

# script.transit()    # Pivot
# _thread.start_new_thread(script.detection, ())
# _thread.start_new_thread(script.scan, ())

# script.detection()    # car detection
# multitask.schedular()   # test threading
