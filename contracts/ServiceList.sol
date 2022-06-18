// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ServiceList{
    uint public servicecount;

    struct Service{
        string customeremail;
        string carreg;
        string servicehash;
    }  

    mapping(uint => Service) public serv1;

    event ServiceCreated(string _customeremail,string carreg,string servicehash);

    constructor() public {
        servicecount =0;
    }
    
    function createService(string memory _customeremail,string memory _carreg,string memory _servicehash) public{
        serv1[servicecount++] = Service(_customeremail,_carreg,_servicehash);
        emit ServiceCreated(_customeremail,_carreg,_servicehash);
    }


}