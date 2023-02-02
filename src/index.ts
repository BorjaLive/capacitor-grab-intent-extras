import { registerPlugin } from '@capacitor/core';

import type { GrabIntentExtrasPlugin } from './definitions';

const GrabIntentExtras = registerPlugin<GrabIntentExtrasPlugin>('GrabIntentExtras', {
  web: () => import('./web').then(m => new m.GrabIntentExtrasWeb()),
});

export * from './definitions';
export { GrabIntentExtras };
