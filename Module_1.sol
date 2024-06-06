//SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

contract inventory{
    uint256 public item=0;
    bool public lock=false;
    address owner=msg.sender;
    mapping(uint=>string)public Item;
    modifier onlyOwner() {
        require(msg.sender==owner,"Only owner can call");
        _;
    }

    function addItem(uint256 _id,string memory name)public onlyOwner {
        assert(lock==false);
        if(_id<0){
            revert("Invalid id");
        }
        Item[_id]=name;
        item+=1;

    }
    function removeItem(uint256 _id)public onlyOwner{
        assert(lock==false);
        if(_id<0){
            revert("Invalid id");
        }
        delete Item[_id];
        item-=1;
    }
    
    function lockUnlockInventory(string memory message)public onlyOwner{
        require(keccak256(abi.encodePacked(message)) == keccak256(abi.encodePacked("Open"))||
        keccak256(abi.encodePacked(message)) == keccak256(abi.encodePacked("Close")),
        "Please enter 'Open' or 'Close'");
        if(keccak256(abi.encodePacked(message)) == keccak256(abi.encodePacked("Open"))){
            lock=false;
        }
        else{
            lock=true;
        }
        
    }
    
}
