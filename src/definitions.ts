export interface GrabIntentExtrasPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
