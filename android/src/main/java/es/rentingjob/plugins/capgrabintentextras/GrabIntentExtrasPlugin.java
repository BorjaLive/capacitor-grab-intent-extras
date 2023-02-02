package es.rentingjob.plugins.capgrabintentextras;

import com.getcapacitor.annotation.CapacitorPlugin;
import com.getcapacitor.*;

@CapacitorPlugin(name = "GrabIntentExtras")
public class GrabIntentExtrasPlugin extends Plugin {

    public static Bridge staticBridge = null;
    private GrabIntentExtras implementation = new GrabIntentExtras();
    private JSObject storedExtra = null;

    public void load() {
        staticBridge = this.bridge;
    }

    @PluginMethod
    public void getIntentExtras(PluginCall call) {
        JSObject extras = storedExtra;
        storedExtra = null;
        call.resolve(extras);
    }

    public void emitExtras(JSObject extras) {
        if(hasListeners("intentExtras"))
            notifyListeners("intentExtras", extras);
        else
            storedExtra = extras;
    }

    public static GrabIntentExtrasPlugin getPluginInstance() {
        if (staticBridge != null && staticBridge.getWebView() != null) {
            PluginHandle handle = staticBridge.getPlugin("GrabIntentExtras");
            if (handle == null) {
                return null;
            }
            return (GrabIntentExtrasPlugin) handle.getInstance();
        }
        return null;
    }
}
