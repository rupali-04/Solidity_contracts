// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Will {
    address owner;
    uint fortne;
    bool deceased;
   constructor() payable{
        owner = msg.sender; // msg sender represents the wallet address 
        fortne = msg.value; // msg value represents the balance in the wallet 
        deceased = false;
    }
    // modifer cna help to control are functions
    //1. create modifer so that only owner can call this function
        modifier onlyOwner(){
            require(msg.sender == owner);
            _;
        }
    //2. transfer funds only if the grandparent is deceased...
    modifier mustbeDisease(){
        require(deceased==true);
        _;
    }
    // create arrays of family wallet of address type
    address payable[] familyWallets;
    
    // mapping means iterating to each value
    // iterate through each family wallet
    
    mapping(address => uint) inheritance;
    
    function setInheritance(address payable wallet,uint amount) public onlyOwner {
        // add wallet to familyWallets
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
        
        
    }
    // 
    // function getInheritance() onlyOwner public view returns (address){
    //     return familyWallets[0];
    // }
    
    // Pay each family member based on their wallet address
    
    function payout() private mustbeDisease {
        for(uint i=0;i<familyWallets.length;i++){
            familyWallets[i].transfer(inheritance[familyWallets[i]]);
            // transfer the funds from the owner address to the reciver address.
            
        }
        
    }
    function hasDeceased() public onlyOwner {
        deceased = true;
        payout();
    }
    
}
