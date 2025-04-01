import type {Config} from 'jest';

const config: Config = {
  coverageProvider: "v8",
  globalSetup: "./test/setup.ts",
  preset: "ts-jest",
  verbose: true,
};

export default config;
