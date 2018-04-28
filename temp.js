//declare a variable that holds all accounts provided by ethereum testrpc
//and use them as input to register users, cars and houses for sales
var acct = web3.eth.accounts;

User.at(User.address).registerUser("Meheret","Tesfaye","Agena","get.meheret.tesfaye@gmail.com","meheretu",{from:acct[0]});
User.at(User.address).registerUser("Tesfaye","Belachew","Abebe","get.tesfaye.belachew@gmail.com","tesfanur",{from:acct[1]});
User.at(User.address).registerUser("Yared","Taye","Benti","get.yared.taye@gmail.com","gune",{from:acct[2]});
User.at(User.address).registerUser("Sisay","Belachew","Abebe","get.sisay.belachew@gmail.com","belsti",{from:acct[3]});
User.at(User.address).registerUser("Ejigayew","Belachew","Abebe","get.ejigayew.belachew@gmail.com","mango",{from:acct[4]});
User.at(User.address).registerUser("Netsanet","Belachew","Abebe","get.netsanet.belachew@gmail.com","mitu",{from:acct[5]});
User.at(User.address).registerUser("Yirga","Badima","Agena","get.yirga.badima@gmail.com","yirgalem",{from:acct[6]});
User.at(User.address).registerUser("Dawit","Jemberu","Agena","get.dawit.jemberu@gmail.com","dave",{from:acct[7]});
User.at(User.address).registerUser("Redamichael","Jemberu","Agena","get.redamichael.jemberu@gmail.com","reda",{from:acct[8]});
User.at(User.address).registerUser("Mebratu","T/Haimanot","Agena","get.mebratu.thaimanot@gmail.com","mebre",{from:acct[9]});
//Buyer inherits User contract and hence you can call any function from buyer contract but you need to uss user address
Buyer.at(User.address).registerUser("Meheret","Tesfaye","Agena","get.meheret.tesfaye@gmail.com","meheretu",{from:acct[0]});
//get all registerd users/buyers and sellers
User.at(User.address).getAllUsers();
//you can also call for all user info from buyer contract
Buyer.at(User.address).getAllUsers()
//get user detail info using his/her public key or account
User.at(User.address).getUser({from:acct[1]});
//----
User.at(User.address).getUser({from:acct[9]});
//login user feature
User.at(User.address).login({from:acct[0]});

//test user info from truffle console
truffle(develop)> User.at(User.address).getUser({from:acct[7]})
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
   CarTrade.at(CarTrade.address).registerCarDetailInfo("TOYOTA","1M8GDM8AXMP042790",2001,true,"Ford","Japan","http://www.toyota.com",{from:acct[5]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("VITZ","1M8GDE8AXMP041791",2012,true,"Marchedes","china","http://www.vitz.com",{from:acct[6]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("MARCHEDES","1M8LDE8AXMP041791",2015,true,"Iveco","USA","http://www.marchedes.com",{from:acct[7]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("LANDCRUZER","5C8JDM9AYKP042792",2003,true,"Toyota","USA","http://www.landcruzer.com",{from:acct[8]})

//get all cars detail info
  CarTrade.at(CarTrade.address).getAllCarsDetailInfo()
//to get car detail information by it vin num call the following function
  CarTrade.at(CarTrade.address).getCarDetailInfoByVinNum("1M8GDE8AXMP041791")
//register house
  HouseTrade.at(HouseTrade.address).registerHouseDetailInfo("Hayat Real State","123456",1998,true,"Semit",100,1000000,"Residential")
  HouseTrade.at(HouseTrade.address).registerHouseDetailInfo("Tsehay Real State","654321",2006,false,"CMC",500,3000000,"Office")
  HouseTrade.at(HouseTrade.address).registerHouseDetailInfo("Adran Real State","754321",2006,true,"CMC",1000,5000000,"Office")
//get all registerd Houses
HouseTrade.at(HouseTrade.address).getAllHousesDetailInfo()//TODO: fix problem related to returning empty array element values
//to get house infor by houseNum
HouseTrade.at(HouseTrade.address).getHouseDetailInfoByHouseNum("754321")
