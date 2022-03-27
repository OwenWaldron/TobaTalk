//
//  FileController.swift
//  TobaTalk
//
//  Created by Owen Waldron on 2022-03-27.
//

import Foundation

class FileController {
    let manager = FileManager.default
    let url: URL
    
    init() {
        self.url = manager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
    }
    
    func getWords() {
        // Get words from disc
        
    }
}
