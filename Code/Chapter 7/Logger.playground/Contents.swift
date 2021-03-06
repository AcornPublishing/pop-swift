//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



enum LogLevels: String {
    case Fatal
    case Error
    case Warn
    case Debug
    case Info
    
    static let allValues = [Fatal, Error, Warn, Debug, Info]
}

protocol LoggerProfileProtocol {
    var loggerProfileId: String {get}
    func writeLog(level: String, message: String)
}

extension LoggerProfileProtocol {
    func getCurrentDateString() -> String{
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm"
        return dateFormatter.stringFromDate(date)
    }
}


protocol LoggerProtocol {
    static var loggers: [LogLevels:[LoggerProfileProtocol]] {get set}
    static func writeLog(logLevel: LogLevels, message: String)
}


extension LoggerProtocol {
    
    static func logLevelContainsProfile(logLevel: LogLevels, loggerProfile: LoggerProfileProtocol) -> Bool {
        if let logProfiles = loggers[logLevel] {
            for logProfile in logProfiles where logProfile.loggerProfileId == loggerProfile.loggerProfileId {
                return true
            }
        }
        return false
    }
    
    static func setLogLevel(logLevel: LogLevels, loggerProfile: LoggerProfileProtocol) {
        if let _ = loggers[logLevel] {
            if !logLevelContainsProfile(logLevel, loggerProfile: loggerProfile) {
                loggers[logLevel]?.append(loggerProfile)
            }
        } else {
            var a = [LoggerProfileProtocol]()
            a.append(loggerProfile)
            loggers[logLevel] = a
        }
    }
    
    static func addLogProfileToAllLevels(defaultLoggerProfile: LoggerProfileProtocol) {
        for level in LogLevels.allValues {
            setLogLevel(level, loggerProfile: defaultLoggerProfile)
        }
    }
    
    static func removeLogProfileFromLevel(logLevel: LogLevels, loggerProfile:LoggerProfileProtocol) {
        if var logProfiles = loggers[logLevel] {
            if let index = logProfiles.indexOf({$0.loggerProfileId == loggerProfile.loggerProfileId}) {
                logProfiles.removeAtIndex(index)
            }
            loggers[logLevel] = logProfiles
        }
    }
    
    static func removeLogProfileFromAllLevels(loggerProfile:LoggerProfileProtocol) {
        for level in LogLevels.allValues {
            removeLogProfileFromLevel(level, loggerProfile: loggerProfile)
        }
    }
    
    static func haveLoggersForLevel(logLevel: LogLevels) -> Bool {
        guard let _ = loggers[logLevel] else {
            return false
        }
        return true
    }
}

struct LoggerNull: LoggerProfileProtocol {
    let loggerProfileId = "hoffman.jon.logger.null"
    func writeLog(level: String, message: String) {
        // Do nothing
    }
}

struct LoggerConsole: LoggerProfileProtocol {
    let loggerProfileId = "hoffman.jon.logger.console"
    func writeLog(level: String, message: String) {
        let now = getCurrentDateString()
        print("\(now): \(level) - \(message)")
    }
}

struct LoggerDataBase: LoggerProfileProtocol {
    let loggerProfileId = "hoffman.jon.logger.database"
    func writeLog(level: String, message: String) {
        let now = getCurrentDateString()
        print("\(now): \(level) - Going to DB \(message)")
    }
}

struct LoggerFile: LoggerProfileProtocol {
    let loggerProfileId = "hoffman.jon.logger.file"
    func writeLog(level: String, message: String) {
        let now = getCurrentDateString()
        print("\(now): \(level) - Going to File \(message)")
    }
}


struct Logger: LoggerProtocol {
    static var loggers = [LogLevels:[LoggerProfileProtocol]]()
    
    static func writeLog(logLevel: LogLevels, message: String) {
        guard haveLoggersForLevel(logLevel) else {
            print("No logger")
            return
        }
        
        if let logProfiles = loggers[logLevel] {
            for logProfile in logProfiles {
                logProfile.writeLog(logLevel.rawValue, message: message)
            }
        }
    }
}



Logger.addLogProfileToAllLevels(LoggerConsole())
Logger.writeLog(LogLevels.Debug, message: "Debug Message 1")
Logger.setLogLevel(LogLevels.Error, loggerProfile: LoggerDataBase())
Logger.writeLog(LogLevels.Error, message: "Error Message 1")
Logger.setLogLevel(LogLevels.Error, loggerProfile: LoggerConsole())
Logger.writeLog(LogLevels.Error, message: "Error Message 2")

Logger.removeLogProfileFromLevel(LogLevels.Error, loggerProfile: LoggerDataBase())
Logger.writeLog(LogLevels.Error, message: "Error Message 3")






