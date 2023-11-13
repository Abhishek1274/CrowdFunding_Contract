// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

contract Factory{
    address factoryOwner;
    constructor(){
        factoryOwner=msg.sender;
    }
    function deployCrowdFunding(address fundraiser_) public returns (address) {
        CrowdFunding fund = new CrowdFunding(fundraiser_);
        return address(fund);
    }
    
}

contract CrowdFunding{
    address payable curr_FundRaiser;
    uint amnt;
    uint curr_amnt=0;
    string Name;
    address[] donors;
    mapping(uint=>address) donor;
    uint id=0;
    uint val=0;
    constructor(address  fundraiser_){
        curr_FundRaiser=  payable(fundraiser_);
    }
    function setAmnt(uint amnt_,string memory Name_) public{
        amnt=amnt_;
        Name=Name_;
    }


    function donate() public payable returns(bool){
        require(msg.sender!=curr_FundRaiser,"fundraiser can not donate");
        require(msg.value>= 1 ether,"amnt must be greater than 1 ether");
        
        donors.push(msg.sender);
        donor[id++]=msg.sender;
        
        //donors[id-1]=donor[id-1];
        // This has to be modified as it is showing error at initial stage
        

        return true;
    } 

    //CREATE VALIDATE FUNCTION
    function approve() public returns(bool){
        for(uint i=0;i<id;i++){
            if(donor[i]==msg.sender){
                val++;
                return true;
            }
        }
        return false;
    }
    function showDonor() public view returns(address[] memory){
        return donors;
    }
    //This will withdrwa the fund to fundraiser.
    function withdraw(string memory reason,uint withdraw_amt) public returns(string memory,bool){
            require(msg.sender==curr_FundRaiser,"money can withdraw by fundRaiser only");
            require(withdraw_amt*(10**18)<=curr_FundRaiser.balance,"withdraw amnt must be less than or equal total raisedFund");
            //require(valid==true,"donors have rejected the withdrawl process");
            require(val>=id/2,"Not approved yet by the donor");
            curr_FundRaiser.transfer(withdraw_amt*(10**18));
            val=0;

            return(reason,true);
            

    }




}