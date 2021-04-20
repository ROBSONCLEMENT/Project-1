pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

/**
 * The UJToken contract does this and that...
 */
contract UJToken is ERC20 {
  constructor() ERC20('UJT Stablecoin', 'UJToken') public {}

  function faucet(address to, uint amount) external{
    _mint(to, amount);
  }
}

