pragma solidity ^0.4.17;

import "./ServiceCenter.sol";

contract Regulator {

   address owner;
   int constant STATUS_SUBMITTED = 0;
   int constant STATUS_ACCEPTED  = 1;
   int constant STATUS_REJECTED  = 2;

   event ProposalSubmitted(address msgSender,bytes32 msg,uint timestamp);
   event ProposalAccepted (address msgSender,bytes32 msg,uint timestamp);
   event ProposalRejected (address msgSender,bytes32 msg,uint timestamp);

   event AddAMRA (address msgSender,bytes32 msg,uint timestamp);
   event UpdateAMRAStatus (address msgSender,bytes32 msg,uint timestamp);
   event RegulatoryContractDeployed (address msgSender,bytes32 msg,uint timestamp);
   event ServiceCenterContractDeployed (address msgSender,bytes32 msg,uint timestamp);
   event UploadCenterProtocol (address msgSender,bytes msg,uint timestamp);

   struct AMRAIdentity {
      bytes32  name;
      bytes32  url;
      address addr;
      int   status;  //values: SUBMITTED, ACCEPTED, REJECTED
   }

   struct CenterProposal {
      address AMRAAddr;
      bytes32  drugName;
      uint32  startDate;
      uint32  endDate;
      bytes  ipfsHash;
      int   status; // values: SUBMITTED, ACCEPTED, REJECTED
      address Center;  // clinical Center contract; 0x0 if none
   }

   AMRAIdentity[]AMRAs;
   CenterProposal[]proposals;

   modifier AMRAsOnly {
      bool found = false;
      for (uint32 i = 0; i < AMRAs.length; i++) {
         if (AMRAs[i].addr == msg.sender && AMRAs[i].status == STATUS_ACCEPTED) {
            found = true;
            break;
         }
      }
      if (!found) 
       revert();
      _;
   }

   modifier ownerOnly {
      if (msg.sender != owner) 
       revert();
      _;
   }

   function Regulator() {
      owner = msg.sender;
      RegulatoryContractDeployed(msg.sender,"Mined",block.timestamp);
   }

   function submitProposal(bytes32 _drugName, uint32 _startDate, uint32 _endDate) {

      CenterProposal memory proposal;
      proposal.AMRAAddr   = msg.sender;
      proposal.drugName  = _drugName;
      proposal.startDate = _startDate;
      proposal.endDate   = _endDate;
      proposal.status    = STATUS_SUBMITTED;

      proposals.push(proposal);

      ProposalSubmitted(msg.sender,proposal.drugName,block.timestamp);
   }

   function submitCenterProtocolDocument(uint32 _id, bytes _docHash) constant returns (bytes _docIpfsHash) {
      if (_id >= proposals.length) {
         return;
      }
      CenterProposal memory tp = proposals[_id];
      tp.ipfsHash = _docHash;
      _docIpfsHash = tp.ipfsHash;
      UploadCenterProtocol (msg.sender,tp.ipfsHash,block.timestamp);
   }

   function getProposalsCount() constant returns (uint _counter) {
      _counter = proposals.length;
   }

   function getProposalById(uint32 _id) constant returns(address _AMRAAddr, bytes32 _drugName, uint32 _startDate, uint32 _endDate, bytes _ipfsHash, int _status, address _Center) {
      if (_id >= proposals.length) {
         return;
      }
      CenterProposal memory tp = proposals[_id];
      _AMRAAddr = tp.AMRAAddr;
      _drugName = tp.drugName;
      _startDate = tp.startDate;
      _endDate = tp.endDate;
      _ipfsHash = tp.ipfsHash;
      _status = tp.status;
      _Center = tp.Center;
   }

   function acceptProposal(uint _id) constant returns (address _ServiceCenter) {

      if(_id >= proposals.length) {
         revert();
      }

      CenterProposal memory tp = proposals[_id];
      if (tp.status == STATUS_ACCEPTED) {
         revert();
      }

      // deploy the actual clinical Center contract and return it
      ServiceCenter Center = new ServiceCenter(owner, tp.AMRAAddr, _id, tp.startDate, tp.endDate, tp.drugName, tp.ipfsHash);

      proposals[_id].Center = Center;
      proposals[_id].status = STATUS_ACCEPTED;

      _ServiceCenter = proposals[_id].Center;

      ProposalAccepted (msg.sender,tp.drugName,block.timestamp);
      ServiceCenterContractDeployed (msg.sender,"Mined",block.timestamp);
   }

   function rejectProposal(uint _id) {

      if (_id >= proposals.length) {
         revert();
      }

      proposals[_id].status = STATUS_REJECTED;

      CenterProposal memory tp = proposals[_id];
      ProposalRejected (tp.AMRAAddr, tp.drugName, _id);
   }

   function submitAMRA(bytes32 _name, bytes32 _url) {
      AMRAIdentity memory AMRA;
      AMRA.name = _name;
      AMRA.url = _url;
      AMRA.addr = msg.sender;
      AMRA.status = STATUS_SUBMITTED;

      AMRAs.push(AMRA);

      AddAMRA(msg.sender,AMRA.name,block.timestamp);
   }

   function changeAMRAStatus(address _addr, uint8 _status) {
      for (uint32 i = 0; i < AMRAs.length; i++) {
         if (AMRAs[i].addr == _addr) {
            AMRAs[i].status = _status;
            if (AMRAs[i].status == STATUS_ACCEPTED) {
               UpdateAMRAStatus(msg.sender,"Approved",block.timestamp);
            } else {
               UpdateAMRAStatus(msg.sender,"Rejected",block.timestamp);
            }
            break;
         }
      }
      
   }

   function getAMRAsCounter() constant returns (uint _counter) {
      _counter = AMRAs.length;
   }

   function getAMRAById(uint _id) constant returns(bytes32 _name, bytes32 _url, address _addr, int _status) {

      if (_id >= AMRAs.length) {
         revert();
      }

      AMRAIdentity memory ci = AMRAs[_id];
      _name = ci.name;
      _url = ci.url;
      _addr = ci.addr;
      _status = ci.status;
   }

}