//
//  Orders.swift
//  SlideInTransition
//
//  Created by 董紫琪 on 2020/6/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class Order
{
    var title = ""
    var subtitle = ""
    var featuredImage: UIImage
    var pollution = ""
    var orderIntro = ""
    
    init(title: String, subtitle: String, featuredImage: UIImage, pollution: String, orderIntro: String)
    {
        self.title = title
        self.subtitle = subtitle
        self.featuredImage = featuredImage
        self.pollution = pollution
        self.orderIntro = orderIntro
    }
    
    static func fetchOrders() -> [Order]
    {
        return [
            Order(title: "Adult Beetles", subtitle: "Coleopteta", featuredImage: UIImage(named: "adult-beetles")!, pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by."),
            Order(title: "Larval Beetles", subtitle: "Coleopteta", featuredImage: UIImage(named: "larval-beetles")!, pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by."),
            Order(title: "True Flies", subtitle: "Diptera", featuredImage: UIImage(named: "true-flies")!, pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by."),
            Order(title: "Mayfiles", subtitle: "Ephemeroptera", featuredImage: UIImage(named: "mayfiles")!, pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by."),
            Order(title: "True Bug", subtitle: "Hemiptera", featuredImage: UIImage(named: "true-bug")!, pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by."),
            Order(title: "Aquatic Caterpillars", subtitle: "Lepidoptera", featuredImage: UIImage(named: "aquatic")!, pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by."),
            Order(title: "Alderflier, Dobsonflies & Fishflies", subtitle: "Megaloptera", featuredImage: UIImage(named: "alderflier")!, pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by."),
            Order(title: "Dragonflies & Damselflies", subtitle: "Odonata", featuredImage: UIImage(named: "dragonflies")!, pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by."),
            Order(title: "Stoneflies", subtitle: "Plecoptera", featuredImage: UIImage(named: "stoneflies")!, pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by."),
            Order(title: "Caddisflies", subtitle: "Trichoptera", featuredImage: UIImage(named: "caddisflies")!, pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by."),
        ]
    }
}
