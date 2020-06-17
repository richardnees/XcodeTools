#!/usr/bin/env xcrun --toolchain com.apple.dt.toolchain.Default --sdk macosx swift

import Foundation
import XcodeTools

class ConfigurationTool {
    
    func run() {
        Log.note("Detected platform:")
        Log.note(Environment.platformName.rawValue, indentation: 1)
        Log.note("Detected configuration:")

        if let configurationName = Environment.configurationName {
            Log.note(configurationName, indentation: 1)
        } else {
            Log.error("Missing configuration", indentation: 1)
        }

        if let infoPlistURL = Environment.infoPlistURL {
            Log.note(infoPlistURL.path, indentation: 1)
            
            if let infoPlist = NSDictionary(contentsOf: infoPlistURL) {
                Log.note("Info Plist:")
                
                for (key, value) in infoPlist {
                    Log.note(String(describing: key), indentation: 1)
                    Log.note(String(describing: value), indentation: 2)
                }
            }
        } else {
            Log.error("Missing infoPlistURL", indentation: 1)
        }
        
        Log.warning("Here is a warning!")
        Log.error("Here is an error!")

    }
}

ConfigurationTool().run()
