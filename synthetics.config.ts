import type { SyntheticsConfig } from '@elastic/synthetics';

export default env => {
  const config: SyntheticsConfig = {
    params: {
      url: 'https://elastic.github.io/synthetics-demo/',
    },
    playwrightOptions: {
      ignoreHTTPSErrors: false,
    },
    /**
     * Configure global monitor settings
     */
    monitor: {
      schedule: 3,
      locations: ['india'],
      privateLocations: [],
    },
    /**
     * Project monitors settings
     */
    project: {
      id: 'synthetics-surak',
      url: 'https://f86c0f9dcdd143a89d2fe4cb63024121.us-east-2.aws.elastic-cloud.com:443',
      space: 'default',
    },
  };
  if (env !== 'development') {
    /**
     * Override configuration specific to environment
     * Ex: config.params.url = ""
     */
  }
  return config;
};
