import ReactOnRails from 'react-on-rails';

import { Hello } from '../components/hello_react';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  Hello,
});
