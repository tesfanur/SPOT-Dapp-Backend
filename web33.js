> web3
Web3 {
  _requestManager:
   RequestManager {
     provider:
      HttpProvider {
        host: 'http://localhost:8545',
        timeout: 0,
        user: undefined,
        password: undefined,
        headers: undefined },
     polls: {},
     timeout: null },
  currentProvider:
   HttpProvider {
     host: 'http://localhost:8545',
     timeout: 0,
     user: undefined,
     password: undefined,
     headers: undefined },
  eth:
   Eth {
     _requestManager: RequestManager { provider: [Object], polls: {}, timeout: null },
     getBalance: { [Function: send] request: [Function: bound ], call: 'eth_getBalance' },
     getStorageAt: { [Function: send] request: [Function: bound ], call: 'eth_getStorageAt' },
     getCode: { [Function: send] request: [Function: bound ], call: 'eth_getCode' },
     getBlock: { [Function: send] request: [Function: bound ], call: [Function: blockCall] },
     getUncle: { [Function: send] request: [Function: bound ], call: [Function: uncleCall] },
     getCompilers: { [Function: send] request: [Function: bound ], call: 'eth_getCompilers' },
     getBlockTransactionCount:
      { [Function: send]ion: send] request: [Function: bound ], call: 'eth_getCompilers' },
        request: [Function: bound ],,
        call: [Function: getBlockTransactionCountCall] },
     getBlockUncleCount: bound ],ei],
      { [Function: send]tBlockTransactionCountCall] },
        request: [Function: bound ], toTwosComplement],
        call: [Function: uncleCountCall] },
     getTransaction: on: bound ],sBigNumber],
      { [Function: send]cleCountCall] },rictAddress],
        request: [Function: bound ],
        call: 'eth_getTransactionByHash' },cksumAddress],
     getTransactionFromBlock:  ],ion: toChecksumAddress],
      { [Function: send]actionByHash' },n],
        request: [Function: bound ],g],
        call: [Function: transactionFromBlockCall] },
     getTransactionReceipt: nd ],oolean],
      { [Function: send]ansactionFromBlockCall] },
        request: [Function: bound ],
        call: 'eth_getTransactionReceipt' },
     getTransactionCount: { [Function: send] request: [Function: bound ], call: 'eth_getTransactionCount' },
     call: { [Function: send] request: [Function: bound ], call: 'eth_call' },
     estimateGas: { [Function: send] request: [Function: bound ], call: 'eth_estimateGas' },tionCount' },
     sendRawTransaction: { [Function: send] request: [Function: bound ], call: 'eth_sendRawTransaction' },
     signTransaction: { [Function: send] request: [Function: bound ], call: 'eth_signTransaction' },
     sendTransaction: { [Function: send] request: [Function: bound ], call: 'eth_sendTransaction' }, },
     sign: { [Function: send] request: [Function: bound ], call: 'eth_sign' },signTransaction' },
     compile: { solidity: [Object], lll: [Object], serpent: [Object] },: 'eth_sendTransaction' },
     submitWork: { [Function: send] request: [Function: bound ], call: 'eth_submitWork' },
     getWork: { [Function: send] request: [Function: bound ], call: 'eth_getWork' },
     coinbase: [Getter],on: send] request: [Function: bound ], call: 'eth_compileSolidity' },
     getCoinbase: { [Function: get] request: [Function: bound ] },th_compileLLL' },
     mining: [Getter],ion: send] request: [Function: bound ], call: 'eth_compileSerpent' } },
     getMining: { [Function: get] request: [Function: bound ] },ll: 'eth_submitWork' },
     hashrate: [Getter],send] request: [Function: bound ], call: 'eth_getWork' },
     getHashrate: { [Function: get] request: [Function: bound ] },
     syncing: [Getter],ion: get] request: [Function: bound ] },
     getSyncing: { [Function: get] request: [Function: bound ] },
     gasPrice: [Getter],: get] request: [Function: bound ] },
     getGasPrice: { [Function: get] request: [Function: bound ] },
     accounts: [Getter],on: get] request: [Function: bound ] },
     getAccounts: { [Function: get] request: [Function: bound ] },
     blockNumber: [Getter],get] request: [Function: bound ] },
     getBlockNumber: { [Function: get] request: [Function: bound ] },
     protocolVersion: [Getter],] request: [Function: bound ] },
     getProtocolVersion: { [Function: get] request: [Function: bound ] },
     iban: ts: { [Function: get] request: [Function: bound ] },
      { [Function: Iban]
        fromAddress: [Function],et] request: [Function: bound ] },
        fromBban: [Function],
        createIndirect: [Function],get] request: [Function: bound ] },
        isValid: [Function] },
     sendIBANTransaction: [Function: bound transfer] },
  db: romAddress: [Function],
   DB {omBban: [Function],
     _requestManager: RequestManager { provider: [Object], polls: {}, timeout: null },
     putString: { [Function: send] request: [Function: bound ], call: 'db_putString' },
     getString: { [Function: send] request: [Function: bound ], call: 'db_getString' },
     putHex: { [Function: send] request: [Function: bound ], call: 'db_putHex' },
     getHex: { [Function: send] request: [Function: bound ], call: 'db_getHex' } },
  shh:  [Getter],
   Shh {e: { [Function: get] request: [Function: bound ] },
     _requestManager: RequestManager { provider: [Object], polls: {}, timeout: null },
     version: { [Function: send] request: [Function: bound ], call: 'shh_version' },
     info: { [Function: send] request: [Function: bound ], call: 'shh_info' },
     setMaxMessageSize: { [Function: send] request: [Function: bound ], call: 'shh_setMaxMessageSize' },
     setMinPoW: { [Function: send] request: [Function: bound ], call: 'shh_setMinPoW' },
     markTrustedPeer: { [Function: send] request: [Function: bound ], call: 'shh_markTrustedPeer' },
     newKeyPair: { [Function: send] request: [Function: bound ], call: 'shh_newKeyPair' },
     addPrivateKey: { [Function: send] request: [Function: bound ], call: 'shh_addPrivateKey' },
     deleteKeyPair: { [Function: send] request: [Function: bound ], call: 'shh_deleteKeyPair' },
     hasKeyPair: { [Function: send] request: [Function: bound ], call: 'shh_hasKeyPair' },
     getPublicKey: { [Function: send] request: [Function: bound ], call: 'shh_getPublicKey' },
     getPrivateKey: { [Function: send] request: [Function: bound ], call: 'shh_getPrivateKey' },
     newSymKey: { [Function: send] request: [Function: bound ], call: 'shh_newSymKey' },
     addSymKey: { [Function: send] request: [Function: bound ], call: 'shh_addSymKey' },
     generateSymKeyFromPassword:
      { [Function: send]
        request: [Function: bound ],
        call: 'shh_generateSymKeyFromPassword' },
     hasSymKey: { [Function: send] request: [Function: bound ], call: 'shh_hasSymKey' },
     getSymKey: { [Function: send] request: [Function: bound ], call: 'shh_getSymKey' },
     deleteSymKey: { [Function: send] request: [Function: bound ], call: 'shh_deleteSymKey' },
     post: { [Function: send] request: [Function: bound ], call: 'shh_post' } },
  net:
   Net {
     _requestManager: RequestManager { provider: [Object], polls: {}, timeout: null },
     listening: [Getter],
     getListening: { [Function: get] request: [Function: bound ] },
     peerCount: [Getter],
     getPeerCount: { [Function: get] request: [Function: bound ] } },
  personal:
   Personal {
     _requestManager: RequestManager { provider: [Object], polls: {}, timeout: null },
     newAccount: { [Function: send] request: [Function: bound ], call: 'personal_newAccount' },
     importRawKey: { [Function: send] request: [Function: bound ], call: 'personal_importRawKey' },
     unlockAccount: { [Function: send] request: [Function: bound ], call: 'personal_unlockAccount' },
     ecRecover: { [Function: send] request: [Function: bound ], call: 'personal_ecRecover' },
     sign: { [Function: send] request: [Function: bound ], call: 'personal_sign' },
     sendTransaction:
      { [Function: send]
        request: [Function: bound ],
        call: 'personal_sendTransaction' },
     lockAccount: { [Function: send] request: [Function: bound ], call: 'personal_lockAccount' },
     listAccounts: [Getter],
     getListAccounts: { [Function: get] request: [Function: bound ] } },
  bzz:
   Swarm {
     _requestManager: RequestManager { provider: [Object], polls: {}, timeout: null },
     blockNetworkRead: { [Function: send] request: [Function: bound ], call: 'bzz_blockNetworkRead' },
     syncEnabled: { [Function: send] request: [Function: bound ], call: 'bzz_syncEnabled' },
     swapEnabled: { [Function: send] request: [Function: bound ], call: 'bzz_swapEnabled' },
     download: { [Function: send] request: [Function: bound ], call: 'bzz_download' },
     upload: { [Function: send] request: [Function: bound ], call: 'bzz_upload' },
     retrieve: { [Function: send] request: [Function: bound ], call: 'bzz_retrieve' },
     store: { [Function: send] request: [Function: bound ], call: 'bzz_store' },
     get: { [Function: send] request: [Function: bound ], call: 'bzz_get' },
     put: { [Function: send] request: [Function: bound ], call: 'bzz_put' },
     modify: { [Function: send] request: [Function: bound ], call: 'bzz_modify' },
     hive: [Getter],
     getHive: { [Function: get] request: [Function: bound ] },
     info: [Getter],
     getInfo: { [Function: get] request: [Function: bound ] } },
  settings: Settings { defaultBlock: 'latest', defaultAccount: undefined },
  version:
   { api: '0.20.6',
     node: [Getter],
     getNode: { [Function: get] request: [Function: bound ] },
     network: [Getter],
     getNetwork: { [Function: get] request: [Function: bound ] },
     ethereum: [Getter],
     getEthereum: { [Function: get] request: [Function: bound ] },
     whisper: [Getter],
     getWhisper: { [Function: get] request: [Function: bound ] } },
  providers:
   { HttpProvider: [Function: HttpProvider],
     IpcProvider: [Function: IpcProvider] },
  _extend:
   { [Function: ex]
     formatters:
      { inputDefaultBlockNumberFormatter: [Function: inputDefaultBlockNumberFormatter],
        inputBlockNumberFormatter: [Function: inputBlockNumberFormatter],
        inputCallFormatter: [Function: inputCallFormatter],
        inputTransactionFormatter: [Function: inputTransactionFormatter],
        inputAddressFormatter: [Function: inputAddressFormatter],
        inputPostFormatter: [Function: inputPostFormatter],
        outputBigNumberFormatter: [Function: outputBigNumberFormatter],
        outputTransactionFormatter: [Function: outputTransactionFormatter],
        outputTransactionReceiptFormatter: [Function: outputTransactionReceiptFormatter],
        outputBlockFormatter: [Function: outputBlockFormatter],
        outputLogFormatter: [Function: outputLogFormatter],
        outputPostFormatter: [Function: outputPostFormatter],
        outputSyncingFormatter: [Function: outputSyncingFormatter] },
     utils:
      { padLeft: [Function: padLeft],
        padRight: [Function: padRight],
        toHex: [Function: toHex],
        toDecimal: [Function: toDecimal],
        fromDecimal: [Function: fromDecimal],
        toUtf8: [Function: toUtf8],
        toAscii: [Function: toAscii],
        fromUtf8: [Function: fromUtf8],
        fromAscii: [Function: fromAscii],
        transformToFullName: [Function: transformToFullName],
        extractDisplayName: [Function: extractDisplayName],
        extractTypeName: [Function: extractTypeName],
        toWei: [Function: toWei],
        fromWei: [Function: fromWei],
        toBigNumber: [Function: toBigNumber],
        toTwosComplement: [Function: toTwosComplement],
        toAddress: [Function: toAddress],
        isBigNumber: [Function: isBigNumber],
        isStrictAddress: [Function: isStrictAddress],
        isAddress: [Function: isAddress],
        isChecksumAddress: [Function: isChecksumAddress],
        toChecksumAddress: [Function: toChecksumAddress],
        isFunction: [Function: isFunction],
        isString: [Function: isString],
        isObject: [Function: isObject],
        isBoolean: [Function: isBoolean],
        isArray: [Function: isArray],
        isJson: [Function: isJson],
        isBloom: [Function: isBloom],
        isTopic: [Function: isTopic] },
     Method: [Function: Method],
     Property: [Function: Property] } }
