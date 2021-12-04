Meta-Coin v0.001 by Cidne
====================================
Based on a fork of Racket-Coin v1.0 by Boro Sitnikovski

To clone me:  
```
git clone https://github.com/cidne/meta-coin
```

You can run [DrRacket](https://racket-lang.org/) with `main.rkt`. Otherwise, for command line, first install dependencies by writing `make deps` and then run `make` or `make run`.

Some reads related to the project:

- Boro Sitnikovski's book [Gentle Introduction to Blockchain with Lisp](https://leanpub.com/gibl)
- Logic is based on [this tutorial](https://medium.com/programmers-blockchain/create-simple-blockchain-java-tutorial-from-scratch-6eeed3cb03fa).
- Short theoretical tutorial [here](https://blockgeeks.com/guides/what-is-bitcoin/).
- Bitcoin paper [here](https://bitcoin.org/bitcoin.pdf).

Project structure:
- `main.rkt` contains an example code which uses the other files.
- `main-helper.rkt` contains printing and other helper procedures for `main.rkt`.
- `main-p2p.rkt` contains an example code which uses the other files, plus peer-to-peer support.
- `src/` contains all the files for the actual implementation:
  - `blockchain.rkt` contains the implementation of the blockchain.
  - `block.rkt` contains the implementation of a block.
  - `wallet.rkt` contains the implementation of a wallet.
  - `transaction.rkt` contains the implementation of transactions.
  - `transaction-io.rkt` contains the implementation for input and output transactions.
  - `utils.rkt` contains some generally useful procedures.
  - `peer-to-peer.rkt` contains procedures for syncing blockchains between peers, syncing valid peers, etc.

Note that this is just an example cryptocurrency implementation in Racket and is being modified to be run in pseudo production.  😝

Example output:
```
Making genesis transaction...
Mining genesis block...

Wallet A balance: 100
Wallet B balance: 0

Mining second transaction...

Wallet A balance: 98.00000001
Wallet B balance: 2

Mining third transaction...

Wallet A balance: 99.00000001
Wallet B balance: 1.00000001

Attempting to mine fourth (not-valid) transaction...

Wallet A balance: 99.00000001
Wallet B balance: 1.00000001

Blockchain is valid: #t

Block information
=================
Hash:	022034501c3e251aff6b6b3063ad9c4b5e8e7f3be5f7cc2be4f7b2df8c0dcfca
Hash_p:	3c201f6a2dcca610c6e6b4182ed1c36a102343f974857c72a5fd29678e2a847e
Stamp:	1638583706535
Nonce:	26
Data:	...00d0ad8dab1b8e20... sends ...00e1619e56b49e3b... an amount of 1.

Block information
=================
Hash:	3c201f6a2dcca610c6e6b4182ed1c36a102343f974857c72a5fd29678e2a847e
Hash_p:	84200d95a2270acd8f9ba6d52c40d3341d17b2b83fe9a789d73fbab05b9f2467
Stamp:	1638583706499
Nonce:	285
Data:	...00e1619e56b49e3b... sends ...00d0ad8dab1b8e20... an amount of 2.

Block information
=================
Hash:	84200d95a2270acd8f9ba6d52c40d3341d17b2b83fe9a789d73fbab05b9f2467
Hash_p:	67367e6f7bda842d0fe572342fd268ded3ea3c7c24ddebb818764637ab9a3f2ca9e4e37fdc8531af8221a14b545e9d61bb8430687e91fb713485d185291b8d324e22867f0fe23505ca14a82fac2553cfeb44a5d7ab64c9e6d1a19fe4a79d429f1b4fc0b3fdcd79690ca43157089e58e97bfbce95c12ae1d1bc057c953aadf6ed159095dcc98f3c40b762852d7dd02d8965021fcfb8f44627e039fc1dfa55423530d35815d73432d78652ab4ce4035ba4255e13610c32d27f485c0c0cc32f79220f0c7ef6fbb1f48dbce7a6d65c6ee8ad16eb02b9c2b1f40794fcd2bf4b5e36e0197a1341d80ff22ce7fcddd92c201783e4b012d12bf3d7feee3bcadececa44e0f96e1c5b6e0b878ac2905c912b5d4fe7a52237bb93cffa72e35e84ef6a108fc9de128ce16e6f95a93721459b7476b8bfb55d7ba9af27815fc23b0c4d5b8a67236df5ac94396ac7b19d27fc50a93d1a106f79f74b5e2b9a4610bfa8997609f4bce1e8801a0079480c4b346b41b295e12537567f0bc6b6b7aa13505ee51074ce00d040b38c2060b47a71792daec151249b5b9dc8cd5507c2c8ba891b53cda5dbf64d72d8088de6fa82c0c1f65bfb2234fa92dc22d61d845ff408e627bd3934cb7b18e6ff98d2b8b782bc5610044722194a2e94671db171904adca3dfd2a0c7523e4242fe1d5a2dd0fc4a87a45f8f1ac3d71270016105e74c357ffd68582e293f67c0dc19ed768bb252bc4178cf19bf2d82ee85750cc42675787796b4ebf115888faaff76fbcf1a75292045278ce7079b5705141d7a31df5b6bfb21e71b7e5366d2e0b4ad33fd5e97961826d7568b822c5694ee4bae35f557a3a400bc3bcf1c6e685cbd64cb4e1e68ade6dd1c6601d4f7ec25e6f5c99d9f745e4ae9ace9bdaba33b54b46ef374a1bfc7d89a026ff898d6133cd2ca6e8628cb182a22b90f2357f22b324ad76369507188de3433e7c6f4c83db32eee79b63f5cd1068a05ecec4ab430d3ac450afe6beecff5bad7805bb5f4d0fd35de60164fdf69ea6a3cc4eda76934af381c3b5c2b04021ab761da4abf034d0fba297a0977456cc266d23b73c64b2976a7250c52680a6fa97f97fe8f04845c98f873ba1dc48d98ac5237ea824ef0b4a7f66947b5a7ffc5426ea0f20190dcd8097fae3d24bf671ce75c3981686e4dc5bc688daf6696990226b48c1b8353867ae0b7b20c36aa7b99185c4ec1e40abe2956cd33003b55b84f2f5076eba67ff586b530de2a3334ffbfcc71a9a6f9d14ad59e4162e5b12bd081da56eb9029ff1ddff4fc1c376639cec054612fceb1283848d13186955d857970505d8e1c7fe12f76bb26d69383e72232eb7813161884bab14e514225d8feaea70d21b7c2e8ea6d108a7a99168aa7a98dab9912977c172356f075884f36c078ec20810e4bb4034a5f512ad6d684bb3ef63f9ab93f421bf4609eacb8eafa29e1bbee63b7b81708cd286edf5ce50f61f23100f299e5b2e203c8a35103de3e177243e15f04b01c1ec69a1290970a2d45e016ba10d9e5126a10805e70e05a668764334d957ea766d53fea2cd9027c64a2150ce606aac7d8744966efc8ff3b1fbc9aa19a72c5585584a59676ae5453d5130972b5f632eef33450bde91a99bbf1c74b8352c5a947adc360c099607a26192b24b4032485795c6ee57303236467ed10c7d2c89d2d88c829bda5106ce28de7f4a0581392340828eeec4dd2cd9e89097783bacdf2e8369f3507b469ad4944231cf41d6669fb51cdf99ba35597f7b1d1fb0b4abc9a964065dbd393c6b8bfa08971d86c1c5952ca8496efce6ba4d0ecf303545244abceca048660ea3daabdab173b5f4d20f408c07be758cd460f07ba611a089b4aa90e5eb3d3bfff41dca3c703de9d50ef594e14c72df4ef47f23cbf5799d741659cfc473cf1866089180a7e3bced63cfb428b061e0f4e94a920f3586bb743b7beaa7578d552615e10ba744b6f98c760ee983947bbfc749f3c6d9b33f6d80d3ea2ed0fff80705a42b0d59378a03469a8cd08e6cb7dc423c85b82992df5aade4fa431145bc69df1662398dda7b672127ab775aa673a2638298f1c5b0b82ff630975065fcd6e1ad90e8355d3449373041b20a2f8be930084cd7212f94a9e8eb46658644d87243750b8910947f01c6a23ea5a3efa3f31d129dd7608c7d539dfb5ed12150326ca095e4d46f9397ad9c5b2b4035c873108ceb97a3c7b3e547ab4f319c8dfd1942db4e39fd58bdf3a06e49cfb10276d1970a21bb42ee4b70c2f32dc0a8a81cfdcac359cd39f6240c919b3b77eb12d35360963a8caaaf368b1cf3b552f553c7709fe29937dd198b8c5d9de00cfd8e8a77382f6ada47c55db7699948b51fc1885b6ff4376de589918c3cb30bfd14b76475269c0aa7d9e0ebb5ab6282a8094d4f3da4795ab56aedaac462720d82dcc970178224fd14810d20f7cd9bb080cd22211fba41cbc6070d3a20b2d987b9dc082f4d6c5bc2dcd58b541648beb2d524d4d7b03c82a0335066c80565ad0a7b34831c90ec5f4e42da68b136bfa820c4967677837f43a880aca4c8a52b7ccea8900348fb0ad498596a6251aa40fe45f64c2aba0418a8a79509d4f40ab5d4d386293b2ab3f83ae3588a26cb3a5d772e4dd0ee66b97499e5b7a2cf3ed022d45ee08a060539d88a61f2d3837b4a6ac5bff8347910f73db4fcd7f779c19f0f9bfc2b4e12798905278ebf10d86635f9a11c1e397952a482254ef2b87e3ddd0bb27907597d8497f728e25b1d42f864ad9db0c983bfec6ac826c559ca0e817cbc5de4f6a29d59c0a14b55731d5f9a983d9ff5f1539142c6035f662ef8894b4f2d70ab58f7618e985052f3f971641585df4f77e23120b5254a47243cb74e96ad4c8d30e6cfde672d7dc34a87c
Stamp:	1638583706430
Nonce:	462
Data:	...00aa672e9ffb3e92... sends ...00e1619e56b49e3b... an amount of 100.

Exported blockchain to 'blockchain.data'...
```

My hope is to turn this project into a simple, somewhat secure tool for managing household projects (e.g., chores, garden sensor data, perishables, etc.)  I'm really just goofing around--I'm sure there are much better projects out there if you're looking for something serious.

Cidne

Licensed under GPL.  Read LICENSE for more information.

Dec, 2021
