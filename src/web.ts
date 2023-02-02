import { WebPlugin } from '@capacitor/core';

import type { GrabIntentExtrasPlugin, IntentExtras } from './definitions';

export class GrabIntentExtrasWeb extends WebPlugin implements GrabIntentExtrasPlugin {
  async getIntentExtras(): Promise<{ extras: IntentExtras }> {
    console.log('EXTRAS ON THE WEB ARE NOT SUPPORTED');
    return { extras: {} };
  }
}
