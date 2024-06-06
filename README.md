## Inventory Management Smart Contract
- This repository contains a Solidity smart contract for managing an inventory system on the Ethereum blockchain. The contract allows the owner to add and remove items from the inventory and provides functionality to lock and unlock the inventory.

## Overview
The inventory smart contract includes the following features:

- Owner Restricted Access: Only the contract owner can add or remove items from the inventory.
- Lock/Unlock Mechanism: The inventory can be locked and unlocked by the owner to prevent or allow modifications.
- Item Management: Add and remove items with unique IDs and names.
## Smart Contract Description
- The inventory contract is written in Solidity and designed to be deployed on the Ethereum blockchain. Below is a detailed description of the contract's components and functions.

## State Variables
- uint256 public item: Tracks the number of items in the inventory.
- bool public lock: Indicates whether the inventory is locked (true) or unlocked (false).
- address owner: Stores the address of the contract owner.
- mapping(uint => string) public Item: A mapping that associates item IDs with their names.
## Modifiers
- onlyOwner(): Ensures that only the contract owner can call certain functions.
## Functions
- constructor(): Sets the deployer of the contract as the owner.
- addItem(uint256 _id, string memory name) public onlyOwner: Adds an item to the inventory with a unique ID and name. The inventory must be unlocked.
- removeItem(uint256 _id) public onlyOwner: Removes an item from the inventory using its ID. The inventory must be unlocked.
- lockUnlockInventory(string memory message) public onlyOwner: Locks or unlocks the inventory based on the provided message. The message must be "Open" to unlock or "Close" to lock the inventory.
## Usage
- To deploy and interact with this contract, you will need to use an Ethereum development environment such as Remix, Truffle, or Hardhat. Here is a brief guide on how to use the contract:

## Deployment:

- Deploy the contract on the Ethereum network (testnet or mainnet) using a deployment tool or script.
The deploying address will be set as the owner of the contract.
## Adding Items:

Call the addItem function with a unique item ID and name. Ensure the inventory is unlocked before adding items.
## Removing Items:

Call the removeItem function with the item ID to remove the corresponding item. Ensure the inventory is unlocked before removing items.
## Locking/Unlocking Inventory:

Call the lockUnlockInventory function with the message "Open" to unlock or "Close" to lock the inventory.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Module1.sol). Copy and paste the following code into the file:

```solidity
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile Module1" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Module1" contract from the dropdown menu, and then click on the "Deploy" button.



## Authors

M.Prithvin
prithvin04@gmail.com


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
