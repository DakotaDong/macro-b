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
    var id:Int
    var commonName = ""
    var scientificName = ""
    var featuredImage = ""
    var pollution = ""
    var orderIntro = ""
    var lifeHistory = ""
    var illustrationImage = ""
    var secondImage = ""
    
  init(id:Int, commonName: String, scientificName: String, featuredImage: String, pollution: String, orderIntro: String, lifeHistory:String, illustrationImage:String, secondImage:String)
    {
        self.id = id
        self.commonName = commonName
        self.scientificName = scientificName
        self.featuredImage = featuredImage
        self.pollution = pollution
        self.orderIntro = orderIntro
        self.lifeHistory = lifeHistory
        self.illustrationImage = illustrationImage
        self.secondImage = secondImage
    }
    
//    static func fetchOrders() -> [Order]
//    {
//        return [
//          Order(id:1, commonName: "Adult Beetles", scientificName: "Coleopteta", featuredImage:  "adult-beetles", pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.", lifeHistory: "life history place holder"),
//          Order(id:2, commonName: "Larval Beetles", scientificName: "Coleopteta", featuredImage:  "larval-beetles", pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.", lifeHistory: "life history place holder"),
//          Order(id:3, commonName: "True Flies", scientificName: "Diptera", featuredImage:  "true-flies", pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.", lifeHistory: "life history place holder"),
//          Order(id:4, commonName: "Mayfiles", scientificName: "Ephemeroptera", featuredImage:  "mayfiles", pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.", lifeHistory: "life history place holder"),
//          Order(id:5, commonName: "True Bug", scientificName: "Hemiptera", featuredImage:  "true-bug", pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.", lifeHistory: "life history place holder"),
//          Order(id:6, commonName: "Aquatic Caterpillars", scientificName: "Lepidoptera", featuredImage:  "aquatic", pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.", lifeHistory: "life history place holder"),
//          Order(id:7, commonName: "Alderflier, Dobsonflies & Fishflies", scientificName: "Megaloptera", featuredImage:  "alderflier", pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.", lifeHistory: "life history place holder"),
//          Order(id:8, commonName: "Dragonflies & Damselflies", scientificName: "Odonata", featuredImage:  "dragonflies", pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.", lifeHistory: "life history place holder"),
//          Order(id:9, commonName: "Stoneflies", scientificName: "Plecoptera", featuredImage:  "stoneflies", pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.", lifeHistory: "life history place holder"),
//          Order(id:10, commonName: "Caddisflies", scientificName: "Trichoptera", featuredImage:  "caddisflies", pollution: "Sensitive", orderIntro: "Surprise steepest recurred landlord mr wandered amounted of. Continuing devonshire but considered its. Rose past oh shew roof is song neat. Do depend better praise do friend garden an wonder to. Intention age nay otherwise but breakfast. Around garden beyond to extent by.", lifeHistory: "life history place holder"),
//        ]
//    }
}
