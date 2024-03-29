//declare a variable that holds all accounts provided by ethereum testrpc
//and use them as input to register users, cars and houses for sales
var acct = web3.eth.accounts;

User.at(User.address).register("Meheret","Tesfaye","Agena","get.meheret.tesfaye@gmail.com","meheretu",{from:acct[0]});
User.at(User.address).register("Tesfaye","Belachew","Abebe","get.tesfaye.belachew@gmail.com","tesfanur",{from:acct[1]});
User.at(User.address).register("Yared","Taye","Benti","get.yared.taye@gmail.com","gune",{from:acct[2]});
User.at(User.address).register("Sisay","Belachew","Abebe","get.sisay.belachew@gmail.com","belsti",{from:acct[3]});
User.at(User.address).register("Ejigayew","Belachew","Abebe","get.ejigayew.belachew@gmail.com","mango",{from:acct[4]});
User.at(User.address).register("Netsanet","Belachew","Abebe","get.netsanet.belachew@gmail.com","mitu",{from:acct[5]});
User.at(User.address).register("Yirga","Badima","Agena","get.yirga.badima@gmail.com","yirgalem",{from:acct[6]});
User.at(User.address).register("Dawit","Jemberu","Agena","get.dawit.jemberu@gmail.com","dave",{from:acct[7]});
User.at(User.address).register("Redamichael","Jemberu","Agena","get.redamichael.jemberu@gmail.com","reda",{from:acct[8]});
User.at(User.address).register("Mebratu","T/Haimanot","Agena","get.mebratu.thaimanot@gmail.com","mebre",{from:acct[9]});
//Buyer inherits User contract and hence you can call any function from buyer contract but you need to uss user address
Buyer.at(User.address).register("Meheret","Tesfaye","Agena","get.meheret.tesfaye@gmail.com","meheretu",{from:acct[0]});
//get all registerd users/buyers and sellers
User.at(User.address).getAllUsers();
//get user accounts and their corresponding ether balance
User.at(User.address).getBalancesOfAllUsers();
//send ether to a Buyer contract address from user account address
 Buyer.at(Buyer.address).receiveEther.sendTransaction({from:acct[8],to:Buyer.address, value:10000000000000000000});
//send ether to a HouseTrade contract address from user account address
 HouseTrade.at(HouseTrade.address).receiveEther.sendTransaction({from:acct[8],to:HouseTrade.address, value:10000000000000000000});
 //get balance of account in ether
 web3._extend.utils.fromWei(web3.eth.getBalance(web3.eth.accounts[0]),"ether").toNumber() //ether
 //get ether balance stored in a contract
 web3._extend.utils.fromWei(web3.eth.getBalance(Buyer.address),"ether").toNumber()//ether
 //get ether balance stored in a HouseTrade contract
 web3._extend.utils.fromWei(web3.eth.getBalance(HouseTrade.address),"ether").toNumber()//ether
 //send 10 ether from one account to another
 web3.eth.sendTransaction({from:acct[8],to:acct[9], value:10000000000000000000});
//transfer a certain ether from buyers contract balance to another account
Buyer.at(Buyer.address).transferTo(web3.eth.accounts[8],10000000000000000000)
//get Buyer contract balance
Buyer.at(User.address).getContractBalance()
//you can also call for all user info from buyer contract
Buyer.at(User.address).getAllUsers()
//get user detail info using his/her public key or account
User.at(User.address).getUser({from:acct[1]});
//----
User.at(User.address).getUser({from:acct[9]});
//login user feature
User.at(User.address).login({acct[0]);

//test user info from truffle console
truffle(develop)> User.at(User.address).getUser({from:acct[7]})
[ '0x0f4f2ac550a1b4e2280d04c21cea7ebd822934b5',
  '0x4461776974000000000000000000000000000000000000000000000000000000',
  '0x4167656e61000000000000000000000000000000000000000000000000000000',
  '0x4a656d6265727500000000000000000000000000000000000000000000000000',
  '0x6765742e64617769742e6a656d6265727540676d61696c2e636f6d0000000000',
  '0x6461766500000000000000000000000000000000000000000000000000000000' ]

//register cars
   CarTrade.at(CarTrade.address).registerCarDetailInfo("Corolla","1M2GDM9AXKP052787",2001,true,"Hyundi","China","http://www.hyundi.com",360000,{from:acct[0]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("Corolla","1M8GDM9AXKP042788",2001,true,"Ford","Japan","http://www.ford.com",350000,{from:acct[1]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("Lambrigini","2A8GDM9AXKP042789",2009,true,"Marchedes","France","http://www.marchedes.com",750000,{from:acct[2]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("Prado","3B8GDM9AXKP042787",2015,true,"Iveco","USA","http://www.iveco.com",56000,{from:acct[3]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("V8","4C8GDM9AXKP042786",2006,true,"Toyota","UK","http://www.toyota.com",550000,{from:acct[4]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("TOYOTA","1M8GDM8AXMP042790",2001,true,"Ford","Japan","http://www.toyota.com",560000,{from:acct[5]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("VITZ","1M8GDE8AXMP041791",2012,true,"Marchedes","china","http://www.vitz.com",850000,{from:acct[6]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("MARCHEDES","1M8LDE8AXMP041791",2015,true,"Iveco","USA","http://www.marchedes.com",4550000,{from:acct[7]})
   CarTrade.at(CarTrade.address).registerCarDetailInfo("LANDCRUZER","5C8JDM9AYKP042792",2003,true,"Toyota","USA","http://www.landcruzer.com",9550000,{from:acct[8]})

//get all cars detail info
  CarTrade.at(CarTrade.address).getAllCarsDetailInfo()
//to get car detail information by it vin num call the following function
  CarTrade.at(CarTrade.address).getCarDetailInfoByVinNum("1M8GDE8AXMP041791");
  //change car price
  CarTrade.at(CarTrade.address).changeCarPrice("1M2GDM9AXKP052787",5000000000,{from:acct[0]})
  //find owner's address
  CarTrade.at(CarTrade.address).ownerOf("1M2GDM9AXKP052787")
 //register house
  HouseTrade.at(HouseTrade.address).registerHouseDetailInfo("Hayat Real State","123456",1998,true,"Semit",100,1000000,"Residential",{from:acct[0]})
  HouseTrade.at(HouseTrade.address).registerHouseDetailInfo("Tsehay Real State","654321",2006,false,"CMC",500,3000000,"Office",{from:acct[1]})
  HouseTrade.at(HouseTrade.address).registerHouseDetailInfo("Adran Real State","754321",2006,true,"CMC",1000,5000000,"Office",{from:acct[2]})
//get all registerd Houses
HouseTrade.at(HouseTrade.address).getAllHousesDetailInfo()//TODO: fix problem related to returning empty array element values
//to get house infor by houseNum
HouseTrade.at(HouseTrade.address).getHouseDetailInfoByHouseNum("754321")
//get list of all house owners
HouseTrade.at(HouseTrade.address).getListOfHouseOwners()
//change owner
HouseTrade.at(HouseTrade.address).changeCarOwnerShip(acct[4],"123456")

//to transfer ether to a contract address or account
//use the following truffle cli commands or smart contract interactions
//receiveEther is custom solidity function for a contract to receive ether value
//this can be done using fallback function but it has security risks
Buyer.at(Buyer.address).receiveEther.sendTransaction({from:acct[8],to:Buyer.address, value:10000000000000000000});
// returns: '0x192cc014a2d39facd19d3540c00833ec36b2b5058b73b3f71d8239afe6cd65d1'
 web3._extend.utils.fromWei(web3.eth.getBalance(Buyer.address),"ether").toNumber()
// returns: 20
web3._extend.utils.fromWei(web3.eth.getBalance(acct[8]),"ether").toNumber()//buyers balance
//returns: 49.89565779999977
