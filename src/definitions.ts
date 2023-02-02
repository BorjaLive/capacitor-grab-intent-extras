import { PluginListenerHandle } from "@capacitor/core";

export interface GrabIntentExtrasPlugin {
  getIntentExtras(): Promise<{ extras: IntentExtras }>;
  addListener(eventName: 'intentExtras', listenerFunc: (extras: IntentExtras) => void): Promise<PluginListenerHandle> & PluginListenerHandle;
}

export interface IntentExtras {[key: string]: string};