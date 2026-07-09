// SPDX-License-Identifier: MIT
pragma solidity >=0.8.29 <0.9.0;

import { Script } from "forge-std/src/Script.sol";

abstract contract BaseScript is Script {
    modifier broadcast() {
        vm.startBroadcast();
        _;
        vm.stopBroadcast();
    }
}
