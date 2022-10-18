// contracts/Project.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Issue.sol';

contract Project {
    mapping(uint => address) public _issues;
    string public _name;
    string public _owner;

    event IssueAdded(uint id, address issuer);

    constructor(string memory name, string memory owner)  {
        _name = name;
        _owner = owner;
    }

    function getName() public view returns (string memory) {
        return _name;
    }

    function getOwner() public view returns (string memory) {
        return _owner;
    }

    function createIssue(uint _id) public returns (address) {
        Issue issue = new Issue(_id);
        address issueAddress = address(issue);
        _issues[_id] = issueAddress;
        emit IssueAdded(_id, issueAddress);
        return issueAddress;
    }

    function getIssue(uint id) public view returns (address) {
        return _issues[id];
    }
}
