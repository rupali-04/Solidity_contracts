// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// This contract helps you to deploy one Smart Contract with the help of other smart Contract.
// Foo Contract is Deployed using contractFactory Contract.
contract contractFactory{
    address[] public deployedContract;
    
    Foo newContract ;
    
    function createCampaign(uint minAmt) public {
        newContract = new Foo(minAmt);
        deployedContract.push(address(newContract));
    }
    
}

contract Foo{
    uint public amt;
    constructor(uint minAmt) {
        amt = minAmt;
    }
    function increment() public{
        amt++;
    }
}
