// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";

contract Allowence is Ownable{
    using SafeMath for uint;
    event AllowenceChanged(address indexed _forWho, address indexed _fromWho, uint _oldAmount, uint _newAmount);
    mapping(address => uint) public allowence;

    function addAllowence(address _who, uint _amount) public onlyOwner{
        emit AllowenceChanged(_who, msg.sender, allowence[_who], _amount);
        allowence[_who] == _amount;
    }

    modifier ownerOrAllowed(uint _amount) {
        require(msg.sender == owner() || allowence[msg.sender] > _amount,"You are not allowed");
        _;
    }

    function reduceAllowence(address _who, uint _amount) internal{
                emit AllowenceChanged(_who, msg.sender, allowence[_who],allowence[_who].sub(_amount));

        allowence[_who] = allowence[_who].sub(_amount);
    }

}