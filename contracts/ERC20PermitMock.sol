pragma solidity ^0.8.0;

//import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "./ERC20Permit.sol";

contract ERC20PermitMock is ERC20Permit {

    constructor(
        string memory name,
        string memory symbol,
        string memory version,
        address initialAccount,
        uint256 initialBalance
    ) payable ERC20(name, symbol) ERC20Permit(name, version) {
        _mint(initialAccount, initialBalance);
    }

    function getChainId() external view returns (uint256) {
        return block.chainid;
    }
}