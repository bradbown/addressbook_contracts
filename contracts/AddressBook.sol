pragma solidity ^0.5.16;

contract AddressBook {

    mapping(address => address[]) private _addresses;
    mapping(address => mapping(address => string)) private _aliases;

    function getAddressArray(address addr) public view returns (address[] memory) {
        return _addresses[addr];
    }

    function addAddress(address addr, string memory addrAlias) public {
        _addresses[msg.sender].push(addr);
        _aliases[msg.sender][addr] = addrAlias;
    }

    function removeAddress(address addr) public {
        uint length = _addresses[msg.sender].length;
        for(uint i = 0; i < length; i++) {
            if (addr == _addresses[msg.sender][i]) {
                if(1 < _addresses[msg.sender].length && i < length-1) {
                    _addresses[msg.sender][i] = _addresses[msg.sender][length-1];
                }
                delete _addresses[msg.sender][length-1];
                _addresses[msg.sender].length--;
                delete _aliases[msg.sender][addr];
                break;
            }
        }
    }
    
    //Gets the alias for your address
    function getAlias(address addrowner, address addr) public view returns (string memory) {
        return _aliases[addrowner][addr];
    }
}