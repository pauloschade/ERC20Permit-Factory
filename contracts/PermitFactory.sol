// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC20PermitMock.sol";
import "./IPermitFactory.sol";

contract PermitFactory {

    address _owner;

    event PermitCreated(string indexed name, string symbol, uint256 totalSupply, ERC20PermitMock indexed permit);

    constructor() {
        _owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == _owner, "PermitFactory: Not Allowed");
        _;
    }


    function createPermit(
        string memory name,
        string memory symbol,
        string memory version,
        uint256 initialBalance
    ) public onlyOwner {

        ERC20PermitMock token = new ERC20PermitMock(name,symbol, version, msg.sender, initialBalance);

        emit PermitCreated(name, symbol, initialBalance, token);
    }
}