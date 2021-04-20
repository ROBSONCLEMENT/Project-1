pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';


/**
 * The PaymentProcessor contract does this and that...
 */
contract PaymentProcessor {

    address public bursar;
    IERC20 public UJToken;

    event PaymentDone(
        address payer,
        uint amount,
        uint paymentId,
        uint date
        );

  constructor(address bursarAddress, address UJTokenAddress) public {
    bursar = bursarAddress;
    UJToken = IERC20(UJTokenAddress);

  }

  function payFees(uint amount, uint paymentId) external {

    UJToken.transferFrom(msg.sender, bursar, amount);
    emit PaymentDone(msg.sender, amount, paymentId, block.timestamp);
  }
}

