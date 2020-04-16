//
//  DocumentDelegate.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/14.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import Foundation

public enum SourceType: Int {
    case files
    case folder
}

protocol DocumentDelegate: class {
    func didPickDocuments(documents: [Document]?)
    func didPickDocumentURL(urls: [URL]?)
}
