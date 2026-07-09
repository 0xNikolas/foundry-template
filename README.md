# Foundry Template [![Github Actions][gha-badge]][gha] [![Foundry][foundry-badge]][foundry] [![License: MIT][license-badge]][license]

[gha]: https://github.com/0xNikolas/foundry-template/actions
[gha-badge]: https://github.com/0xNikolas/foundry-template/actions/workflows/ci.yml/badge.svg
[foundry]: https://getfoundry.sh/
[foundry-badge]: https://img.shields.io/badge/Built%20with-Foundry-FFDB1C.svg
[license]: https://opensource.org/licenses/MIT
[license-badge]: https://img.shields.io/badge/License-MIT-blue.svg

A Foundry-based template for developing Solidity smart contracts, with sensible defaults. Dependencies are managed as
Node.js packages via [Bun](https://bun.sh) rather than git submodules, and the template ships preconfigured with Forge
Std, OpenZeppelin Contracts, Prettier, and Solhint.

## What's Inside

- [Forge](https://github.com/foundry-rs/foundry/blob/master/crates/forge): compile, test, fuzz, format, and deploy smart
  contracts
- [Forge Std](https://github.com/foundry-rs/forge-std): collection of helpful contracts and utilities for testing
- [Bun](https://bun.sh): manage Foundry dependencies as Node.js packages instead of git submodules
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts): library of secure, community-vetted
  smart contracts (pre-installed)
- [Prettier](https://github.com/prettier/prettier): code formatter for non-Solidity files
- [Solhint](https://github.com/protofire/solhint): linter for Solidity code

## Links

- [Use this template](https://github.com/0xNikolas/foundry-template/generate)
- [Foundry Book](https://book.getfoundry.sh)
- [Writing Tests](https://book.getfoundry.sh/forge/writing-tests.html)

## Handling Private Keys

Deployment scripts broadcast with an argument-less `vm.startBroadcast()`, so the broadcaster is taken from the command
line — via `--private-key` or `--account` — with no changes to the scripts.

This is a deliberate choice: the key is never read from an env var, so no `PRIVATE_KEY` entry ever sits in `.env` or any
other project file waiting to be committed by mistake. Instead, supply it at deploy time in one of the following ways,
none of which leaves the plaintext key on disk or in your shell history.

### From a Password Manager

```sh
forge script script/Deploy.s.sol --broadcast --rpc-url http://localhost:8545 \
  --private-key "$(<password-manager-cli> read deployer-key)"
```

### From a GPG-Encrypted File

```sh
forge script script/Deploy.s.sol --broadcast --rpc-url http://localhost:8545 \
  --private-key "$(gpg --decrypt --quiet deployer.key.gpg)"
```

### From an Encrypted Keystore

Import the key once — typed interactively — and pick a keystore password:

```sh
cast wallet import deployer --interactive
```

This writes an encrypted ERC-2335 keystore JSON to `~/.foundry/keystores/deployer`. From then on, deploy with
`--account` and enter the password when prompted:

```sh
forge script script/Deploy.s.sol --broadcast --rpc-url http://localhost:8545 \
  --account deployer
```

## Related Projects

- [defi-wonderland/foundry-template](https://github.com/defi-wonderland/foundry-template)
- [foundry-rs/forge-template](https://github.com/foundry-rs/forge-template)
- [abigger87/femplate](https://github.com/abigger87/femplate)
- [cleanunicorn/ethereum-smartcontract-template](https://github.com/cleanunicorn/ethereum-smartcontract-template)
- [FrankieIsLost/forge-template](https://github.com/FrankieIsLost/forge-template)

## Contributing

Contributions are welcome. See [`AGENTS.md`](AGENTS.md) for the development workflow, commands, and conventions.

## License

This project is licensed under MIT — see the [LICENSE](LICENSE.md) file for details.
