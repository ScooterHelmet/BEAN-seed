pragma solidity ^0.4.17;

import "./Regulator.sol";

contract ServiceCenter {

   address amra;
   address regulator;

   uint public proposalId;

   uint public startDate;
   uint public endDate;
   uint public createdDate;

   bytes32 public partNumber;
   bytes public ipfsHash;

   event AddSubject(address msgSender,bytes32 msg,uint timestamp);
   event AddDataPoint(address msgSender,bytes32 msg,uint timestamp);

   struct DataPoint {
      uint timestamp;
      bytes32 json;
   }

   bytes32[]subjects;
   mapping(bytes32 => DataPoint[]) data; // index sha3(subjectId)

   modifier amraOnly {
      if(msg.sender != amra) {
         throw;
      }
      _;
   }

   modifier serviceIdOpen {
      if( now < startDate || now > endDate ) {
         throw;
      }
      _;
   }

   modifier dateBeforeStart {
      if( now > startDate ) {
         throw;
      }
      _;
   }

   function ServiceCenter(address _regulator, address _amra, uint _proposalId, uint _startDate, uint _endDate, bytes32 _partNumber, bytes _ipfsHash) {
      amra = _amra;
      regulator = _regulator;
      proposalId = _proposalId;
      startDate = _startDate;
      endDate = _endDate;
      partNumber = _partNumber;
      ipfsHash = _ipfsHash;
      createdDate = now;
   }

   function getSubjectsCount() constant returns (uint _counter) {
      _counter = subjects.length;
   }

   function getSubjectById(uint _id) constant returns (bytes32 _subject) {
      if( _id >= subjects.length ) {
         _subject = "";
         return;
      }
      _subject = subjects[_id];
   }

   function getDataCounterForSubject(uint _subjectId) constant returns (uint _counter) {
      if( _subjectId >= subjects.length ) {
         _counter = 0;
         return;
      }
      bytes32 ident = getSubjectIdentById(_subjectId);
      _counter = data[ident].length;
   }

   function getSubjectIdentById(uint _subjectId) constant returns (bytes32 _ident) {
      if( _subjectId >= subjects.length ) {
         _ident = "";
         return;
      }
      _ident = sha3(subjects[_subjectId]);
   }

   function getDataPointForSubject(uint _subjectId, uint _dataPointId) constant returns (uint _timestamp, bytes32 _json) {
      if( _subjectId >= subjects.length ) {
         _timestamp = 0;
         _json = "";
         return;
      }

      bytes32 ident = getSubjectIdentById(_subjectId);
      if(_dataPointId >= data[ident].length) {
         _timestamp = 0;
         _json = "";
         return;
      }

      _timestamp = data[ident][_dataPointId].timestamp;
      _json = data[ident][_dataPointId].json;
   }

   // add modifier dateBeforeStart in the production release
   function addSubject(bytes32 _subject) amraOnly returns (bool _success) {
      subjects.push(_subject);
      AddSubject(msg.sender,_subject,block.timestamp);
      return true;
   }

   // add modifier serviceIdOpen in the production release
   function addDataPoint(uint _subjectId, bytes32 _json) amraOnly serviceIdOpen returns (bool _success) {
      if( _subjectId >= subjects.length ) {
         throw;
      }

      bytes32 ident = getSubjectIdentById(_subjectId);
      DataPoint memory dp;
      dp.timestamp = now;
      dp.json = _json;

      data[ident].push(dp);
      return true;
   }
}