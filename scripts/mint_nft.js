const { ethers } = require("hardhat")


async function mintNft() {
    const nft= await ethers.getContract("JustAvatar")


    for (let index = 0; index < 3; index++) {

        console.log("Minting NFT...")
        const mintTx = await nft.mintNft()
        const mintTxReceipt = await mintTx.wait(1)
        console.log(`Minted the ${index}th NFT `)
        
    }


    
}

mintNft()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })