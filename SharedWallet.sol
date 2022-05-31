// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Allowence.sol";

contract SharedWallet is Allowence{
  
    event MoneySent(address indexed _sentTo,  uint _amount);
    event MoneyRecived(string func, address indexed _from, uint _amount);

    uint public balanceRecived;

    receive () external payable{
        emit MoneyRecived("receive: ",msg.sender, msg.value);

    }

    fallback() external payable {
        emit MoneyRecived("fallback example ",msg.sender, msg.value);
    }

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount){
        require(_amount <= getBalance(), "There are not enough funds stored in this smart contract");
        if(msg.sender != owner() ){
            reduceAllowence(msg.sender, _amount);
        }
        _to.transfer(_amount);
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function renounceOwnership() public pure override{
        revert("Can't renounce ownership here!!!");
    }

 /*   function receiveMoney() public payable{
        balanceRecived += msg.value;
    }
*/

}