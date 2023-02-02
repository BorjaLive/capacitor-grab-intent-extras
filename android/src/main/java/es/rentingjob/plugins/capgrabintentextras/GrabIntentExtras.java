package es.rentingjob.plugins.capgrabintentextras;

import android.os.Bundle;
import com.getcapacitor.JSObject;

public class GrabIntentExtras {

    public static void setExtras(Bundle bundle){
        JSObject extras = new JSObject();
        JSObject json = new JSObject();
        for (String key : bundle.keySet()) {
            Object value = bundle.get(key);
            json.put(key, value);
        }
        extras.put("extras", json);
        GrabIntentExtrasPlugin instance = GrabIntentExtrasPlugin.getPluginInstance();
        if (instance != null) {
            instance.emitExtras(extras);
        }
    }
}
