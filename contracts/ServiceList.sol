// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ServiceList{
    uint public servicecount;

    struct Service{
        string details;
        string photohash;
        string customeremail;
        address customerpublic;
    }  

    mapping(uint => Service) public serv1;

    event ServiceCreated(string service,string email,uint taskNumber);

    constructor() public {
        servicecount =0;
    }
    
    function createTask(string memory _details,string memory _photohash,string memory _customeremail,address _customerpublic) public{
        serv1[servicecount++] = Service(_details,_photohash,_customeremail,_customerpublic);
        emit ServiceCreated(_details,_customeremail,servicecount-1);
    }


}