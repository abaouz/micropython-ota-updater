

def connectToWifiAndUpdate():
    import network, gc, app.secrets as secrets
    from app.ota_updater import OTAUpdater

    sta_if = network.WLAN(network.STA_IF)
    if not sta_if.isconnected():
        print('connecting to network...')
        sta_if.active(True)
        sta_if.connect(secrets.WIFI_SSID, secrets.WIFI_PASSWORD)
        while not sta_if.isconnected():
            pass
    print('network config:', sta_if.ifconfig())
    otaUpdater = OTAUpdater('https://github.com/rdehuyss/micropython-ota-updater', main_dir='app', secrets_file="secrets.py")
    otaUpdater.install_update_if_available()
    del(otaUpdater)
    gc.collect()

def startApp():
    import app.start


connectToWifiAndUpdate()
startApp()