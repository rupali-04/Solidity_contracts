// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Campaign{
    
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
    }
    mapping(address =>mapping(uint => bool)) approvals;
    
    Request[] public requests;
    address public manager;
    uint public minAmount;
    mapping(address => bool) private approvers;
    
    modifier onlyManager {
        require(msg.sender == manager);
        _;
    }
    
    constructor(uint _amt){
        manager = msg.sender;
        minAmount = _amt;
    }
    
    function contribute() public payable {
        require(msg.value > minAmount);
       approvers[msg.sender] = true;
    }
    
    function createRequest(string memory description,uint value,address recipient) public onlyManager {
        
        Request memory newRequest = Request({
            description: description,
            value: value,
            recipient: recipient,
            complete: false,
            approvalCount: 0
        });
        requests.push(newRequest);
        
    }
    
    function approvalRequest(uint index) public {
        require(approvers[msg.sender]);
        require(approvals[msg.sender][index] == false,"Sorry can't approve for secound time");
         approvals[msg.sender][index] = true;
        requests[index].approvalCount++;
       
    }
    
}
