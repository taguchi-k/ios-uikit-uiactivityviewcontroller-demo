//
//  ViewController.swift
//  ios-uikit-uiactivityviewcontroller-demo
//
//  Created by Eiji Kushida on 2017/02/22.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit
import Accounts

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapSNS(_ sender: UIButton) {
        
        let activityVC = shareText(text: "Share Text")
        activityVC.completionWithItemsHandler = createHandler()
        self.present(activityVC, animated: true, completion: nil)
    }
    
    /// テキストをシェアする
    private func shareText(text: String) -> UIActivityViewController{

        let items = [text]
        
        let activityViewController = UIActivityViewController(activityItems: items,
                                              applicationActivities: nil)
        
        // 使用しないアクティビティタイプを指定する
        let excludedActivityTypes = [
            UIActivityType.postToFacebook,
            UIActivityType.postToTwitter,
            UIActivityType.message,
            UIActivityType.saveToCameraRoll,
            UIActivityType.print
        ]
        
        activityViewController.excludedActivityTypes = excludedActivityTypes
        return activityViewController
    }
    
    
    /// テキストと画像をシェアする
    private func shareTextAndImage(text: String, image: UIImage) -> UIActivityViewController{
        
        let items = [text, image] as [Any]
        
        let activityViewController = UIActivityViewController(activityItems: items,
                                                  applicationActivities: nil)
        
        // 使用しないアクティビティタイプを指定する
        let excludedActivityTypes = [
            UIActivityType.postToFacebook,
            UIActivityType.postToTwitter,
            UIActivityType.message,
            UIActivityType.saveToCameraRoll,
            UIActivityType.print
        ]
        
        activityViewController.excludedActivityTypes = excludedActivityTypes
        return activityViewController
    }


    /// ActivityViewControllerの完了後に呼ばれるハンドラを作成して返す
    private func createHandler() -> UIActivityViewControllerCompletionWithItemsHandler? {

        return { (activityType: UIActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in

            if let activityType = activityType {
                print("activityType = \(activityType)")
            }

            if completed {
                print("サービス実行完了しました。")
            } else {
                // キャンセルしたり、サービス実行完了しなかった場合
                print("サービス実行完了しませんでした。")
            }

            if let returnedItems = returnedItems {
                print("returnedItems: \(returnedItems)")
            }

            if let error = error {
                print("error: \(error)")
            }
        }
    }
}

