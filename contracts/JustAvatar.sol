// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract JustAvatar is ERC721 {
    using Strings for uint256;

    // sate variable
    uint256 public immutable MAX_AVATAR = 1000;
    string public constant TOKEN_URI =
        "https://nice.4everland.store/just-avatar-json/";

    //contract variable
    uint256 private s_tokenCounter;

    //event
    event JAMinted(uint256 indexed tokenIdd);

    constructor() ERC721("JustAvatar", "JA") {
        s_tokenCounter = 0;
    }

    function mintNft() public {
        require(s_tokenCounter <= MAX_AVATAR - 1, "Purchase would exceed max supply of AVATAR");
        _safeMint(msg.sender, s_tokenCounter);
        emit JAMinted(s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        return string(abi.encodePacked(TOKEN_URI, tokenId.toString()));
    }

    function totalSupply() public view virtual returns (uint256) {
        // _tokenOwners are indexed by tokenIds, so .length() returns the number of tokenIds
        return MAX_AVATAR;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
