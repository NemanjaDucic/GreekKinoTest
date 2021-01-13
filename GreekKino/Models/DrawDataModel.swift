//
//  AlamofireGetData.swift
//  GreekKino
//
//  Created by Nemanja Ducic on 1/11/21.
//

import Foundation
import Alamofire

protocol DrawDataDelegate: NSObject {
    func dataDrew()
}

class DrawDataModel {
    
    let requestString = "https://api.opap.gr/draws/v3.0/1100/upcoming/20"
    var data: [DrawData]?
    var convertedTime: Date?
    
    var delegate: DrawDataDelegate?
    
    func getData() {
        AF.request(requestString).responseJSON { [weak self] (response)
            in
            switch response.result {
            case .success:
                let jsonData = response.data
                do {
                    if let jData = jsonData {
                        self?.data = try JSONDecoder().decode([DrawData].self, from: jData)
                        if let _ = self?.data {
                            self?.delegate?.dataDrew()
                        }
                    }
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func convertTime(data: DrawData) {
        convertedTime = Date.init(milliseconds: data.drawTime)
    }
}
