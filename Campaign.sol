// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Campaign{
    address public manager;
    
    constructor(uint _amt){
        manager = msg.sender;
    }
}
