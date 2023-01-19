pragma solidity ^0.8.0;

contract Notary {
    mapping(bytes32 => bool) public notarized;
    address public notary;
    event DocumentNotarized(bytes32 documentHash);

    constructor(address _notary) public {
        notary = _notary;
    }

    function notarizeDocument(bytes32 documentHash) public {
        require(msg.sender == notary);
        require(!notarized[documentHash]);
        notarized[documentHash] = true;
        emit DocumentNotarized(documentHash);
    }

    function checkNotarization(bytes32 documentHash) public view returns (bool) {
        return notarized[documentHash];
    }
}
