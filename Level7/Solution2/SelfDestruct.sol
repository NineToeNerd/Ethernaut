// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract SelfDestruct {
    
    fallback() external payable {
        // Just take the money!
    }
    
    function selfDestruct(address _sendMoneyTo) external {
        selfdestruct(payable(_sendMoneyTo));
    }
}
