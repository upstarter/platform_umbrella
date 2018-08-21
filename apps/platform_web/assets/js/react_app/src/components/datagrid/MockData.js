import * as CryptoLogos from '../../../../../static/images/crypto-logos'

export const generateID = () =>
  // Math.random should be unique because of its seeding algorithm.
  // Convert it to base 36 (numbers + letters), and grab the first 9 characters
  // after the decimal.
  Math.random()
    .toString(36)
    .substr(2, 9)

const Tokens = [
  {
    logo: CryptoLogos.ethereum,
    holding: 'ETH (Ethereum)',
    desc: `Ethereum is an open-source, public, blockchain-based distributed computing platform and operating system featuring smart contract functionality.`,
    weight: 0,
    id: generateID()
  },
  {
    logo: CryptoLogos.bitcoin,
    holding: 'BTC (Bitcoin)',
    desc: `Bitcoin is a cryptocurrency, a form of electronic cash. It is a decentralized digital currency without a central bank or single administrator.`,
    weight: 3,
    id: generateID()
  },
  {
    logo: CryptoLogos.bitcoinCash,
    holding: 'BCH (Bitcoin Cash)',
    desc: `In mid-2017, a group of developers wanting to increase bitcoin's block size limit prepared a code change. The change, called a hard fork, took effect on 1 August 2017.`,
    weight: 1,
    id: generateID()
  },
  {
    logo: CryptoLogos.peercoin,
    holding: 'ICN (Peercoin)',
    desc: `Peercoin, also known as PPCoin or PPC, is a peer-to-peer cryptocurrency utilizing both proof-of-stake and proof-of-work systems.`,
    weight: 6,
    id: generateID()
  },
  {
    logo: CryptoLogos.potcoin,
    holding: 'STEEM (Potcoin)',
    desc: `PotCoin is a peer-to-peer cryptocurrency which exists with the aim of becoming the standard form of payment for the legalized cannabis industry.`,
    weight: 2,
    id: generateID()
  },
  {
    logo: CryptoLogos.powerledger,
    holding: 'POWR (Power Ledger)',
    desc: `Power Ledger, a blockchain-based platform, plans to completely revolutionalize the worldwide energy industry by enabling local areas the ability to sell and distribute solar power to its neighbors without the need of a middleman.`,
    weight: 4,
    id: generateID()
  },
  {
    logo: CryptoLogos.santiment,
    holding: 'SAN (Santiment)',
    desc: `We’re building a platform and developing a community around new types of data sources and ways of reading the market that haven’t existed before.`,
    weight: 5,
    id: generateID()
  },
  {
    logo: CryptoLogos.storj,
    holding: 'SJCX (Storj)',
    desc: `Storj Labs is the provider of the Storj decentralized cloud storage network, and the company behind STORJ token, a cryptocurrency on the Ethereum blockchain that powers digital storage and data retrieval on its cloud storage platform.`,
    weight: 6,
    id: generateID()
  },
  {
    logo: CryptoLogos.streamrDatacoin,
    holding: 'DATA (Streamr Datacoin)',
    desc: `Streamr is creating an open source platform for the free and fair exchange of the world’s realtime data. Our blockchain-backed data Marketplace and powerful tools put your data back where it belongs `,
    weight: 7,
    id: generateID()
  }
]

export default Tokens
