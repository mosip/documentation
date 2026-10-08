---
description: Explore the tools, components, and architecture powering eSignet.
---

# Technology

eSignet's Go implementation is built on a small, deliberately chosen set of open-source tools rather than a sprawling dependency tree: a statically typed, compiled language for its backend services, a relational database and an in-memory store for persistence, and a React-based interface for the screens a user actually sees. Each choice below is meant to keep the platform straightforward to run, secure to operate, and simple to audit, whether the goal is deploying it, extending it, or clearing it for a compliance review.

For eSignet's internal building blocks and how they fit together, see [**Developer Guide**](../develop/)**.**

### Language & Runtime

eSignet's Go implementation is written in Go itself, chosen for its built-in concurrency model, fast compilation, and suitability for network and infrastructure services.

| Tool/Technology       | Version | Description                                                                                                                                                                                              | License                                                          |
| --------------------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| [Go](https://go.dev/) | 1.26    | Go is a statically typed, compiled programming language designed by Google for simplicity, built-in concurrency, and fast compilation, commonly used for building networked and infrastructure services. | [BSD-3-Clause](https://github.com/golang/go/blob/master/LICENSE) |

### API & Service Layer

Rather than building HTTP handling and OIDC/OAuth2 flow logic from scratch, eSignet composes a small set of focused pieces: Go's own standard library for HTTP, an embedded authorization engine for the OIDC/OAuth2 flow itself, structured logging for observability, and a dedicated component for key management and cryptographic operations.

| Tool/Technology                                             | Version                                 | Description                                                                                                                                                                  | License                                                                                 |
| ----------------------------------------------------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| [net/http](https://pkg.go.dev/net/http)                     | Go 1.26 stdlib                          | Go's standard library package for building HTTP clients and servers; eSignet's HTTP entrypoint and routing are built directly on it, with no third-party web framework.      | [BSD-3-Clause](https://github.com/golang/go/blob/master/LICENSE)                        |
| [ThunderID engine](https://github.com/thunder-id/thunderid) | pinned via `go.mod` `replace` directive | An OIDC/OAuth2 authorization engine providing flow orchestration and a pluggable authenticator/executor model; eSignet embeds it as the core of its authorization-code flow. | [Mozilla Public License 2.0](https://github.com/thunder-id/thunderid/blob/main/LICENSE) |
| [log/slog](https://pkg.go.dev/log/slog)                     | Go 1.26 stdlib                          | Go's standard library package for structured, leveled logging; eSignet emits structured JSON logs through it.                                                                | [BSD-3-Clause](https://github.com/golang/go/blob/master/LICENSE)                        |
| Keymanager (embedded)                                       | part of `esignet-service`               | Provides secure storage, provisioning, and management of cryptographic keys, including encryption/decryption and digital signature/verification operations.                  | [Mozilla Public License 2.0](https://claude.ai/LICENSE)                                 |

### Data & Storage

eSignet separates data by durability need across two stores: a relational database for anything that needs to persist, and an in-memory store for short-lived flow and session state.

| Tool/Technology                         | Version                                    | Description                                                                                                                                                                                                   | License                                                          |
| --------------------------------------- | ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| [Postgres](https://www.postgresql.org/) | 15                                         | A free and open-source relational database management system (RDBMS) emphasizing extensibility and SQL compliance. eSignet uses it for OIDC client management and for the keymanager's key/certificate store. | [PostgreSQL License](https://opensource.org/license/postgresql/) |
| [Redis](https://redis.io/)              | 6.0 and above (requires `KEEPTTL` support) | An open-source, in-memory data store used as a database, cache, streaming engine, and message broker. eSignet uses it to hold runtime flow, session, and pushed-authorization-request state.                  | [BSD License](https://redis.io/docs/about/license/)              |

### Frontend

The login and consent screens a user actually interacts with are a separate React application that the OIDC/OAuth2 provider redirects to during an authorization request.

| Tool/Technology                | Version | Description                                                                                                      | License                                                            |
| ------------------------------ | ------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| [React JS](https://react.dev/) | 19      | Lets you build user interfaces out of individual pieces called components; it powers eSignet's login/consent UI. | [MIT License](https://github.com/facebook/react/blob/main/LICENSE) |

### Build, Packaging & Deployment

eSignet is packaged as Docker containers and deployed via Helm charts, with dependency management and CI/CD handled by tooling native to each side of the stack — Go modules for the backend, npm for the UI.

| Tool/Technology                                           | Version                               | Description                                                                                                                 | License                                                                       |
| --------------------------------------------------------- | ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| [Go modules](https://go.dev/ref/mod)                      | Go 1.26                               | Go's built-in dependency-management system, recording a project's dependencies and their versions in `go.mod`/`go.sum`.     | [BSD-3-Clause](https://github.com/golang/go/blob/master/LICENSE)              |
| [Docker](https://www.docker.com/)                         | 20.4 and above                        | A set of platform-as-a-service products that use OS-level virtualization to deliver software in packages called containers. | [Apache License 2.0](https://github.com/moby/moby/blob/master/LICENSE)        |
| [npm](https://www.npmjs.com/)                             | Node.js 18 and above, npm 9 and above | The package manager for the Node.js JavaScript platform; it installs and manages the UI's dependencies.                     | [Artistic License 2.0](https://docs.npmjs.com/policies/npm-license)           |
| [Helm Chart (MOSIP)](https://github.com/mosip/mosip-helm) | depends on eSignet version            | Helps manage Kubernetes applications — defining, installing, and upgrading them via versioned, shareable charts.            | [Apache License 2.0](https://github.com/mosip/mosip-helm/blob/master/LICENSE) |
| [kattu (MOSIP)](https://github.com/mosip/kattu)           | reusable CI/CD workflow               | Holds the reusable GitHub Actions workflows used to build, test, and gate MOSIP projects' pull requests and releases.       | [Apache License 2.0](https://github.com/mosip/kattu/blob/master/LICENSE)      |

### Testing

eSignet's automated tests span two levels: Go's own unit-testing tooling for the backend logic itself, and Postman/Newman-driven tests that exercise its APIs end to end.

| Tool/Technology                                                                                                | Version                  | Description                                                                                                                                                     | License                                                                                                                                   |
| -------------------------------------------------------------------------------------------------------------- | ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| [Go testing](https://pkg.go.dev/testing) / [testify](https://github.com/stretchr/testify)                      | Go 1.26 stdlib / v1.11.1 | Go's built-in `testing` package, together with the testify toolkit (assertions and suite-based test structure), used to write and run unit tests via `go test`. | [BSD-3-Clause](https://github.com/golang/go/blob/master/LICENSE) / [MIT License](https://github.com/stretchr/testify/blob/master/LICENSE) |
| [Newman](https://learning.postman.com/docs/collections/using-newman-cli/command-line-integration-with-newman/) | —                        | A command-line tool that runs Postman collections and automates API tests; used for CI/CD-integrated API testing.                                               | [Apache License 2.0](https://apache.org/licenses/LICENSE-2.0)                                                                             |
