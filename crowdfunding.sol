/ SPDX-License-Identifier: MIT

pragma solidity >= 0.5.0 < 0.9.0;

contract crowdfunding
{
    mapping (address=>uint) public contributors;
    address public manager;
    uint public minimumcontribution;
    uint public deadline;
    uint public target;
    uint public raisedamount;
    uint public noOfContributors;

    constructor(uint _target, uint _deadline)
    {
        target=_target;
        deadline=block.timestamp+_deadline;
        minimumcontribution=100 wei;
        manager = msg.sender;
    }

    function sendEth() public payable 
    {
        require(block.timestamp < deadline,"deadline has passed");
        require(msg.value >= minimumcontribution,"minimun contribution is not met");

        if(contributors[msg.sender]==0)
        {
            noOfContributors++;
        }
        contributors[msg.sender]+=msg.value;
        raisedamount+= msg.value;
    } 

    function getcontractbalance() public view returns(uint)
    {
        return address(this).balance;
    } 
}