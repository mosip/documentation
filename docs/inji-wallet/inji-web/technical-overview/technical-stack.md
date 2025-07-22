# Technology Stack

## UI & Rest end points

The table below outlines the frameworks, tools, and technologies employed by Inji Web:

<table>
  <thead>
    <tr>
      <th>Tool / Technology</th>
      <th>Version</th>
      <th width="603">Description</th>
      <th>License</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="https://react.dev/">React JS</a></td>
      <td>18.3.1</td>
      <td>React enables building user interfaces from individual units called components.</td>
      <td><a href="https://github.com/facebook/react/blob/main/LICENSE">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://www.typescriptlang.org/">TypeScript</a></td>
      <td>4.9.5</td>
      <td>A strongly typed programming language that builds on JavaScript and uses <strong>type inference</strong> to give great tooling without additional code.</td>
      <td><a href="https://github.com/microsoft/TypeScript/blob/main/LICENSE.txt">Apache 2.0</a></td>
    </tr>
    <tr>
      <td><a href="https://redux-toolkit.js.org/">Redux Toolkit</a></td>
      <td>2.2.3</td>
      <td>The official, recommended way to write Redux logic, simplifying the configuration and setup of global state management.</td>
      <td><a href="https://github.com/reduxjs/redux-toolkit/blob/master/LICENSE.md">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://reactrouter.com/">React Router DOM</a></td>
      <td>6.22.0</td>
      <td>Declarative routing for React apps, enabling dynamic navigation between components and views.</td>
      <td><a href="https://github.com/remix-run/react-router/blob/main/LICENSE">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://tailwindcss.com/">Tailwind CSS</a></td>
      <td>3.4.3</td>
      <td>A utility-first CSS framework for rapid UI development with pre-designed utility classes.</td>
      <td><a href="https://github.com/tailwindlabs/tailwindcss/blob/master/LICENSE">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://www.i18next.com/">i18next</a></td>
      <td>23.11.2</td>
      <td>Internationalization (i18n) framework for translating and localizing content in web apps.</td>
      <td><a href="https://github.com/i18next/i18next/blob/master/LICENSE">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://react.i18next.com/">react-i18next</a></td>
      <td>14.1.0</td>
      <td>React bindings for i18next, enabling seamless localization in React applications.</td>
      <td><a href="https://github.com/i18next/react-i18next/blob/master/LICENSE">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://www.npmjs.com/package/react-pdf">react-pdf</a></td>
      <td>9.2.1</td>
      <td>Displays PDF documents using PDF.js in React applications.</td>
      <td><a href="https://github.com/wojtekmaj/react-pdf/blob/main/LICENSE">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://www.npmjs.com/package/crypto-js">crypto-js</a></td>
      <td>4.2.0</td>
      <td>Provides cryptographic algorithms like AES, SHA1, SHA256 for client-side encryption/decryption.</td>
      <td><a href="https://github.com/brix/crypto-js/blob/develop/LICENSE">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://react-cookie.github.io/">react-cookie</a></td>
      <td>8.0.0</td>
      <td>Universal cookie management for React applications.</td>
      <td><a href="https://github.com/reactivestack/cookies/blob/master/LICENSE">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://fkhadra.github.io/react-toastify/">react-toastify</a></td>
      <td>10.0.5</td>
      <td>Adds toast notifications to React apps with ease and flexibility.</td>
      <td><a href="https://github.com/fkhadra/react-toastify/blob/main/LICENSE">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://testing-library.com/docs/react-testing-library/intro/">@testing-library/react</a></td>
      <td>16.0.1</td>
      <td>Lightweight solution for testing React components by focusing on user interaction.</td>
      <td><a href="https://github.com/testing-library/react-testing-library/blob/main/LICENSE">MIT License</a></td>
    </tr>
    <tr>
      <td><a href="https://jestjs.io/docs/tutorial-react">Jest</a></td>
      <td>27.5.2</td>
      <td>A popular JavaScript testing framework used extensively in React applications.</td>
      <td><a href="https://github.com/facebook/jest/blob/main/LICENSE">MIT License</a></td>
    </tr>
  </tbody>
</table>

## Deployment

The table below specifies the tools to deploy Inji Web:

| Tool / Technology                                         | Version                     | Description                                                                                                                                                                                                                                 | License                                                             |
| --------------------------------------------------------- | --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| [Docker](https://www.docker.com/)                         | 20.4 and above              | Docker is a set of platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers.                                                                                                | [OpenSource License](https://www.docker.com/community/open-source/) |
| [npm](https://www.npmjs.com/)                             |                             | npm is the package manager for the Node JavaScript platform. It puts modules in place so that node can find them, and manages dependency conflicts intelligently                                                                            | [Artistic License 2.0](https://docs.npmjs.com/policies/npm-license) |
| [Helm Chart (MOSIP)](https://github.com/mosip/mosip-helm) | depends on Inji-web version | Helm helps in managing Kubernetes applications - helps define, install, and upgrade even the most complex Kubernetes application. Charts are easy to create, version, share, and publish — so start using Helm and stop the copy-and-paste. |                                                                     |
