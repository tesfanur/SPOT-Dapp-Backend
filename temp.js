Authentication.at(Authentication.address).registerUser("Tesfaye","Belachew","Abebe","get.tesfaye.belachew@gmail.com","tesfanur",{from:acct[1]});
Authentication.at(Authentication.address).registerUser("Yared","Taye","Benti","get.yared.taye@gmail.com","gune",{from:acct[2]});
Authentication.at(Authentication.address).registerUser("Sisay","Belachew","Abebe","get.sisay.belachew@gmail.com","belsti",{from:acct[3]});
Authentication.at(Authentication.address).registerUser("Ejigayew","Belachew","Abebe","get.ejigayew.belachew@gmail.com","mango",{from:acct[4]});
Authentication.at(Authentication.address).registerUser("Netsanet","Belachew","Abebe","get.netsanet.belachew@gmail.com","mitu",{from:acct[5]});
Authentication.at(Authentication.address).registerUser("Yirga","Badima","Agena","get.yirga.badima@gmail.com","yirgalem",{from:acct[6]});
Authentication.at(Authentication.address).registerUser("Dawit","Jemberu","Agena","get.dawit.jemberu@gmail.com","dave",{from:acct[7]});


truffle(develop)> Authentication.at(Authentication.address).getUser({from:acct[7]})
[ '0x0f4f2ac550a1b4e2280d04c21cea7ebd822934b5',
  '0x4461776974000000000000000000000000000000000000000000000000000000',
  '0x4167656e61000000000000000000000000000000000000000000000000000000',
  '0x4a656d6265727500000000000000000000000000000000000000000000000000',
  '0x6765742e64617769742e6a656d6265727540676d61696c2e636f6d0000000000',
  '0x6461766500000000000000000000000000000000000000000000000000000000' ]
