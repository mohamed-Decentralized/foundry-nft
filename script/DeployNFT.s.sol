// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {NFT} from "../src/NFT.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {console} from "forge-std/console.sol";

contract DeployNFT is Script {
    uint256 private DEFAULT_PRIVATE_KEY =
        0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

    function run() external returns (NFT) {
        uint256 deployerKey;
        if (block.chainid == 11155111) {
            deployerKey = vm.envUint("PRIVATE_KEY");
        } else {
            deployerKey = DEFAULT_PRIVATE_KEY;
        }
        vm.startBroadcast(deployerKey);
        NFT nftToken = new NFT();
        vm.stopBroadcast();
        return nftToken;
    }

  
}
