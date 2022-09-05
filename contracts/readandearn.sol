// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./readerToken.sol";

/*

The goal of the project:
Write a smart contract that mints tokens to the address of the caller, having read an article within a specified time.
So, what are we exploring? 
State Variables stating the time they started reading and the time they ended reading the article.
Function to help us know when someone calls the function read.
Function to help us know when the user completes the reading and then mints the token to the reader.
Function to get the total number of addresses that call the function.
Since we are mionting tokens, we should create an ERC20 token that gets minted and sent to the calling address.
Create a function that determines the status of each article to either read or completed?



*/

contract ReadandEarn {
   uint startTime;
   uint endtime;
   address[] public acceptedReaders;

    address owner;
    
    mapping(address => uint) public tokenEarned;
    

    receive() external payable{}
    fallback() external payable{}

    constructor() {
        owner = msg.sender;
      
    }

    // To push the address of readers to the array.

    function readArticle() public {
        startTime = block.timestamp;
        acceptedReaders.push(msg.sender);
        
    }

    /* or

    function readArticle(address _readers) public {
        startTime = block.timestamp;
        acceptedReaders.push(_readers)
    }

    */


    function doneReading() public  {
        endtime = block.timestamp + 600;




       
    }


    // To get the total address of those who call the read function
    function getReadersAddress() public view returns(address[] memory){
        //return tokenEarned[msg.sender];
        return acceptedReaders;
        

    }
}