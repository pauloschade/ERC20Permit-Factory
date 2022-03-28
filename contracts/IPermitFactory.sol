// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC20PermitMock.sol";

interface IPermitFactory {

    function createPermit(
        string memory name,
        string memory symbol,
        string memory version,
        address initialAccount,
        uint256 initialBalance
    ) external;

    // Event for Permit creation
    event PermitCreated(string indexed name, string symbol, uint256 totalSupply, ERC20PermitMock indexed permit);
}