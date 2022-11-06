// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Decentralist {
    mapping(address => bool) public listMapping;
}

contract RoyaltyEnforcingNft is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    Decentralist public listContract;

    constructor(address list, string memory name, string memory symbol) ERC721(name, symbol) {
        listContract = Decentralist(list);
    }

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override(ERC721) {
        //revert if transfer is not a mint, not a burn and msg.sender is not on the whitelist
        if (
            from != address(0) &&
            to != address(0) &&
            !listContract.listMapping(msg.sender)
        ) {
            revert("RoyaltyEnforcingNft: illegal operator");
        }
        super._beforeTokenTransfer(from, to, tokenId);
    }
}