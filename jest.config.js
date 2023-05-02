// It should probably be this:
// const webpackConfig = require('./config/webpack/test')
const webpackConfig = {}
const webpackConfigMerger = require('webpack-config-merger')

module.exports = {
  moduleFileExtensions: [
    'js',
    'jsx',
    'ts',
    'tsx',
    'json',
    'vue'
  ],
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/app/javascript/packs/$1'
  },
  transform: {
    '^.+\\.(js|jsx|tsx|ts)?$': 'babel-jest',
  },
  transformIgnorePatterns: [
    '/node_modules/'
  ],
  setupFilesAfterEnv: [
    '@testing-library/jest-dom/extend-expect',
    '<rootDir>/frontend/spec/jest.setup.js'
  ],
  globals: {
    'vue-jest': {
      hideStyleWarn: true
    }
  },
  verbose: true,
  // testURL: 'http://localhost/',
  collectCoverage: true,
  collectCoverageFrom: [
    '**/*.{js,vue}',
    '!**/node_modules/**',
    '!**/vendor/**',
    '!**/config/**',
    '!**/spec/**',
    '!**/jest.config.js',
    '!**/webpacker/**',
    '!**/app/javascript/packs/**',
    '!**/app/javascript/channels/**'
  ],
  coverageReporters: [
    'html',
    'text-summary'
  ],
  coverageDirectory: '<rootDir>/coverage',
  snapshotSerializers: [],
  testEnvironment: 'jsdom',
  testMatch: [
    '<rootDir>/frontend/spec/**/*.(spec|test).[jt]s?(x)',
    '<rootDir>/frontend/src/**/*.(spec|test).[jt]s?(x)'
  ],
  moduleNameMapper: {
    '\\.(css|scss)$': 'jest-transform-stub'
  },
  globals: {
    'webpackConfig': webpackConfigMerger(
      webpackConfig,
      { mode: 'development' },
      { mode: 'test' }
    )
  }
}
