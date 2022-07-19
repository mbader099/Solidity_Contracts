# Solidity_Contracts
A collection of Solidity contracts that I've built

## Allowance.sol
This contact utilized the ownable contract from OpenZepplin to provide full control for the deploying address to the funds stored within the contract. The owner of this contract now has full access to the funds stored and can delegate all funds to other addresses.

## ItemManager.sol
This smart contract was created to simulate a small Marketplace where items that are created are assigned an item ID and then sold if paid for.

## SharedWallet.sol
Inherits the Allowance smart contracted and is essentially just a simple wallet I've written in solidity.   

## MultiSigWallet.sol
This contracts simulates a digital wallet that requires more than one private key to sign and authorize a crypto transaction.
