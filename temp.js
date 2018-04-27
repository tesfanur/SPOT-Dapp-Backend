var acct = web3.eth.accounts;

Authentication.at(Authentication.address).registerUser("Meheret","Tesfaye","Agena","get.meheret.tesfaye@gmail.com","meheretu",{from:acct[0]});
Authentication.at(Authentication.address).registerUser("Tesfaye","Belachew","Abebe","get.tesfaye.belachew@gmail.com","tesfanur",{from:acct[1]});
Authentication.at(Authentication.address).registerUser("Yared","Taye","Benti","get.yared.taye@gmail.com","gune",{from:acct[2]});
Authentication.at(Authentication.address).registerUser("Sisay","Belachew","Abebe","get.sisay.belachew@gmail.com","belsti",{from:acct[3]});
Authentication.at(Authentication.address).registerUser("Ejigayew","Belachew","Abebe","get.ejigayew.belachew@gmail.com","mango",{from:acct[4]});
Authentication.at(Authentication.address).registerUser("Netsanet","Belachew","Abebe","get.netsanet.belachew@gmail.com","mitu",{from:acct[5]});
Authentication.at(Authentication.address).registerUser("Yirga","Badima","Agena","get.yirga.badima@gmail.com","yirgalem",{from:acct[6]});
Authentication.at(Authentication.address).registerUser("Dawit","Jemberu","Agena","get.dawit.jemberu@gmail.com","dave",{from:acct[7]});
Authentication.at(Authentication.address).registerUser("Redamichael","Jemberu","Agena","get.redamichael.jemberu@gmail.com","reda",{from:acct[8]});
Authentication.at(Authentication.address).registerUser("Mebratu","T/Haimanot","Agena","get.mebratu.thaimanot@gmail.com","mebre",{from:acct[9]});




truffle(develop)> Authentication.at(Authentication.address).getUser({from:acct[7]})
[ '0x0f4f2ac550a1b4e2280d04c21cea7ebd822934b5',
  '0x4461776974000000000000000000000000000000000000000000000000000000',
  '0x4167656e61000000000000000000000000000000000000000000000000000000',
  '0x4a656d6265727500000000000000000000000000000000000000000000000000',
  '0x6765742e64617769742e6a656d6265727540676d61696c2e636f6d0000000000',
  '0x6461766500000000000000000000000000000000000000000000000000000000' ]

//register cars
   CarTrade.at(CarTrade.address).registerCarDetailInfo("Corolla","1M8GDM9AXKP042788",2001,true,"Ford","Japan","http://www.ford.com",{from:acct[1]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("Lambrigini","2A8GDM9AXKP042789",2009,true,"Marchedes","France","http://www.marchedes.com",{from:acct[2]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("Prado","3B8GDM9AXKP042787",2015,true,"Iveco","USA","http://www.iveco.com",{from:acct[3]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("V8","4C8GDM9AXKP042786",2006,true,"Toyota","UK","http://www.toyota.com",{from:acct[4]})
//get all cars detail info
  CarTrade.at(CarTrade.address).getAllCarsDetailInfo()
//register house
  HouseTrade.at(HouseTrade.address).registerHouseDetailInfo("Hayat Real State","123456",1998,true,"Semit",100,1000000,"Residential")
  HouseTrade.at(HouseTrade.address).registerHouseDetailInfo("Tsehay Real State","654321",2006,false,"CMC",500,3000000,"Office")
  HouseTrade.at(HouseTrade.address).registerHouseDetailInfo("Adran Real State","754321",2006,true,"CMC",1000,5000000,"Office")
//get all registerd Houses
HouseTrade.at(HouseTrade.address).getAllHousesDetailInfo()
