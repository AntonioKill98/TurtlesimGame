// Auto-generated. Do not edit!

// (in-package turtlesim_game.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GameStats {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.time_to_catch = null;
      this.game_status = null;
    }
    else {
      if (initObj.hasOwnProperty('time_to_catch')) {
        this.time_to_catch = initObj.time_to_catch
      }
      else {
        this.time_to_catch = 0.0;
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
    // Serializes a message object of type GameStats
    // Serialize message field [time_to_catch]
    bufferOffset = _serializer.float32(obj.time_to_catch, buffer, bufferOffset);
    // Serialize message field [game_status]
    bufferOffset = _serializer.string(obj.game_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GameStats
    let len;
    let data = new GameStats(null);
    // Deserialize message field [time_to_catch]
    data.time_to_catch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [game_status]
    data.game_status = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.game_status);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'turtlesim_game/GameStats';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '26961f3470581d1619e4ee331e4dca0d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 time_to_catch
    string game_status
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GameStats(null);
    if (msg.time_to_catch !== undefined) {
      resolved.time_to_catch = msg.time_to_catch;
    }
    else {
      resolved.time_to_catch = 0.0
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

module.exports = GameStats;
