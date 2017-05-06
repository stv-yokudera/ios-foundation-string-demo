//
//  ViewController.swift
//  ios-foundation-string-demo
//
//  Created by Kentaro on 2017/02/08.
//  Copyright © 2017年 Kentao Taguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - option
    
    /// 空文字チェックをする
    private func sampleIsEmpty() {
        let string = "foo"
        print(string.isEmpty ? "空です" : string)
        
        let emptyString = ""
        print(emptyString.isEmpty ? "空です" : emptyString)
    }
    
    /// 文字数を取得する
    private func sampleCount() {
        let string = "1234567890"
        print(string.characters.count)
    }
    
    /// 文字列の一部を取得する
    private func sampleSubstring() {
        let string = "1234567890"
        
        /* substring(to: ) 指定したIndexより前の文字列を取得 */
        print(string.substring(to: string.index(string.startIndex, offsetBy: 5)))
        
        // 11文字以上なければ、処理しない
        if let index = string.index(string.startIndex, offsetBy: 11, limitedBy: string.endIndex) {
            print("\(string.substring(to: index))")
        }
        
        /* substring(from: ) 指定したIndexより後ろの文字列を取得 */
        print(string.substring(from: string.index(string.endIndex, offsetBy: -3)))
        
        // 15文字以上なければ、処理しない
        if let index = string.index(string.endIndex, offsetBy: -15, limitedBy: string.startIndex) {
            print("\(string.substring(from: index))")
        }
        
        // 先頭から3文字〜末尾から3文字の範囲
        print(string.substring(with: string.index(string.startIndex, offsetBy: 3) ..< string.index(string.endIndex, offsetBy: -3)))
    }
    
    /// 文字列を数値に変換する
    private func sampleInt() {
        let testData = ["1","2","♥","4","あ"]
        
        testData.forEach {
            print(Int($0) ?? "数値以外")
        }
    }
    
    /// 文字列を区切り文字で分割する
    private func sampleComponents() {
        let string = "a,b,c,d,e,f,g"
        let separatedArray = string.components(separatedBy: ",")
        
        separatedArray.forEach {
            print($0)
        }
    }
    
    /// 文字列を置換する
    private func sampleReplacingOccurrences() {
        let string = "S♥T♥V"
        print(string.replacingOccurrences(of: "♥", with: ""))
    }
    
    /// 文字列のPrefixを調べる
    private func sampleHasPrefix() {
        let testData = ["stv001","Stv002","stv003","ssd004","s"]
        
        let stvMembers = testData.filter {
            $0.hasPrefix("stv")
        }
        
        stvMembers.forEach {
            print($0)
        }
    }
    
    /// 文字列のSuffixを調べる
    private func sampleHasSuffix() {
        let testData = ["stv001","Stv002","stv003","ssd004","s001"]
        
        let firstMembers = testData.filter {
            $0.hasSuffix("001")
        }
        
        firstMembers.forEach {
            print($0)
        }
    }
    
    /// 文字列に該当の文字列が含まれるか調べる
    private func sampleRange() {
        let string = "あああああああああstvいいいいいいいいいいいいい"
        
        if let index = string.range(of: "stv") {
            print("見つかりました。 index: \(string.distance(from: string.startIndex, to: index.lowerBound))")
        } else {
            print("見つかりませんでした")
        }
    }
    
    /// 文字列の前後の空白を削除する
    private func sampleTrimmingCharacters() {
        let string = " STV　"
        print(string.trimmingCharacters(in: .whitespaces).uppercased())
    }
    
    /// 文字列の前後の改行を削除する
    private func sampleTrimmingCharactersWhitespacesAndNewlines() {
        let string = "\nSTV\n"
        print(string.trimmingCharacters(in: .whitespacesAndNewlines).uppercased())
    }
    
    /// 文字列をURLエンコードする
    private func sampleAddingPercentEncoding() {
        let string = "スマートテック・ベンチャーズ"
        print(string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "エンコードできませんでした")
    }
    
    /// 文字列をURLデコードする
    private func sampleRemovingPercentEncoding() {
        let string = "%E3%82%B9%E3%83%9E%E3%83%BC%E3%83%88%E3%83%86%E3%83%83%E3%82%AF%E3%83%BB%E3%83%99%E3%83%B3%E3%83%81%E3%83%A3%E3%83%BC%E3%82%BA"
        print(string.removingPercentEncoding ?? "デコードできませんでした")
    }
    
    /// 文字列を大文字に変換する
    private func sampleUppercased() {
        let string = "stv"
        print(string.uppercased())
    }
    
    /// 文字列を小文字に変換する
    private func sampleLowercased() {
        let string = "STV"
        print(string.lowercased())
    }
    
}
