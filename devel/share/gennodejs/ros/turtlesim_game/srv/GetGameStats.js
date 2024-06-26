// Auto-generated. Do not edit!

// (in-package turtlesim_game.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetGameStatsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetGameStatsRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetGameStatsRequest
    let len;
    let data = new GetGameStatsRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtlesim_game/GetGameStatsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetGameStatsRequest(null);
    return resolved;
    }
};

class GetGameStatsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.catches = null;
      this.average_time = null;
      this.game_status = null;
    }
    else {
      if (initObj.hasOwnProperty('catches')) {
        this.catches = initObj.catches
      }
      else {
        this.catches = 0;
      }
      if (initObj.hasOwnProperty('average_time')) {
        this.average_time = initObj.average_time
      }
      else {
        this.average_time = 0.0;
      }
      if (initObj.hasOwnProperty('game_status')) {
        this.game_status = initObj.game_status
      }
      else {
        this.game_status = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetGameStatsResponse
    // Serialize message field [catches]
    bufferOffset = _serializer.int32(obj.catches, buffer, bufferOffset);
    // Serialize message field [average_time]
    bufferOffset = _serializer.float32(obj.average_time, buffer, bufferOffset);
    // Serialize message field [game_status]
    bufferOffset = _serializer.string(obj.game_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetGameStatsResponse
    let len;
    let data = new GetGameStatsResponse(null);
    // Deserialize message field [catches]
    data.catches = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [average_time]
    data.average_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [game_status]
    data.game_status = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.game_status);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtlesim_game/GetGameStatsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7c5d5a8df822594016cbcf60c0ddc011';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 catches
    float32 average_time
    string game_status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetGameStatsResponse(null);
    if (msg.catches !== undefined) {
      resolved.catches = msg.catches;
    }
    else {
      resolved.catches = 0
    }

    if (msg.average_time !== undefined) {
      resolved.average_time = msg.average_time;
    }
    else {
      resolved.average_time = 0.0
    }

    if (msg.game_status !== undefined) {
      resolved.game_status = msg.game_status;
    }
    else {
      resolved.game_status = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: GetGameStatsRequest,
  Response: GetGameStatsResponse,
  md5sum() { return '7c5d5a8df822594016cbcf60c0ddc011'; },
  datatype() { return 'turtlesim_game/GetGameStats'; }
};
