import {
  AppRegistry,
} from 'react-native';
import { App } from './App'
import {name as appName} from './package.json';

// Module name
AppRegistry.registerComponent(appName, () => App);