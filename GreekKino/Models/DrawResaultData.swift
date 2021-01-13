//
//  DrawResaultData.swift
//  GreekKino
//
//  Created by Aca on 13/01/2021.
//

import Foundation
import Alamofire

protocol ResaultDataDelegate: NSObject {
    func dataRes()
}

class DrawResaultData {
    
    let requestString = "https://api.opap.gr/draws/v3.0/%7BgameId%7D/draw-date/2021-01-12/2021-01-13"
    var res: [ResaultData]?
    var convertedTime: Date?
    
    var delegate: ResaultDataDelegate?
    
    func getData() {
        AF.request(requestString).responseJSON { [weak self] (response)
            in
            switch response.result {
            case .success:
                let jsonData = response.data
                do {
                    if let jData = jsonData {
                        self?.res = try JSONDecoder().decode([ResaultData].self, from: jData)
                        if let _ = self?.res {
                            self?.delegate?.dataRes()
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
    
   
}
