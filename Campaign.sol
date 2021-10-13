// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.0;


contract Campaign{
 struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
    }

    address public manager;
    
    constructor(uint _amt){
        manager = msg.sender;
    }
}
