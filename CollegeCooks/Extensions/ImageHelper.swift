//
//  ImageHelper.swift
//  Webster
//
//  Created by Arthur Roolfs on 11/28/22.
//

import Foundation
import UIKit

/*
 From Apple:
    async enables a function to suspend
    await marks where an async function may suspend execution
    other work can happen during a suspension
    once an awaited async call completes, execution resumes.
 */

class ImageHelper {
    
    func fetchImage(url: String) async throws -> UIImage {
        
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw URLError.BadURL }
            
            guard let image = UIImage(data: data) else { throw URLError.BadData }
            return image
        }
        return UIImage()
    }
}
