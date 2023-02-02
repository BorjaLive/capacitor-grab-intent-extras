import { WebPlugin } from '@capacitor/core';

import type { GrabIntentExtrasPlugin } from './definitions';

export class GrabIntentExtrasWeb extends WebPlugin implements GrabIntentExtrasPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
