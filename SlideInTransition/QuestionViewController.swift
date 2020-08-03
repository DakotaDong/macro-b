//
//  QuestionViewController.swift
//  macroApp2
//
//  Created by Chelsea Cui on 4/4/20.
//  Copyright © 2020 Chelsea Cui. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UICollectionViewDelegate, UIPopoverPresentationControllerDelegate, UICollectionViewDataSource {
  
    let questions = [0: Question(is_order: false,
                     image_names:["jointed-legs"],
                     question: "Are there jointed legs?",
                     num_of_choice: 4,
                     choices: [Choice(text: "6 Legs", point_to: 1), Choice(text: "8 Legs", point_to: 30), Choice(text: "10 Legs", point_to: 30), Choice(text: "No", point_to: 3)],
                     description: "Jointed Legs: \nTrue legs, legs capable of bending."),
                     
                      1: Question(is_order: false,
                      image_names:["piercing-needle-mouthparts"],
                      question: "Does it have piercing or needle-like mouthparts?",
                      num_of_choice: 2,
                      choices: [Choice(text: "Yes", point_to: 16), Choice(text: "No", point_to: 2)],
                      description: "Piercing or Needle-like Mouthparts: \nMouthparts adapted to sucking of food items such as blood or plant fluids."),
                     
                      2: Question(is_order: false,
                      image_names:["portable-case"],
                      question: "Does it have a portable case?",
                      num_of_choice: 2,
                      choices: [Choice(text: "No", point_to: 4), Choice(text: "Yes", point_to: 17)],
                      description: "Portable Cases: \nStructure made of leaves, twigs, or sand that some caddisfly and midge larvae carry with them."),
                      
                      3: Question(is_order: false,
                      image_names:["shells"],
                      question: "Does it have a shell?",
                      num_of_choice: 2,
                      choices: [Choice(text: "No", point_to: 5), Choice(text: "Yes", point_to: 30)],
                      description: "Shells: \nRigid or hard outer covering."),
                      
                      4: Question(is_order: false,
                      image_names:["wings","wing-pads"],
                      question: "Does it have wings/wing pads?",
                      num_of_choice: 2,
                      choices: [Choice(text: "No", point_to: 8), Choice(text: "Yes", point_to: 7)],
                      description: "Wings: \nStructure that provides means of limited flight; found on thorax. \n\nWing Pads: \nDeveloping wings or the sheath of a developing wing"),
                      
                      5: Question(is_order: false,
                      image_names:["fleshy-protrusions","heads"],
                      question: "Does it have a head/fleshy protrusions?",
                      num_of_choice: 2,
                      choices: [Choice(text: "No", point_to: 6), Choice(text: "Yes", point_to: 29)],
                      description: "Fleshy Protrusions: \nTiny extensions found on the abdomen. \n\nHeads: \nPart of the body where the main receptor parts are located."),
                      
                      6: Question(is_order: false,
                      image_names:["body-segments"],
                      question: "How many segments are there?",
                      num_of_choice: 2,
                      choices: [Choice(text: "11-12 Body Segments", point_to: 29), Choice(text: "0 or More than 12 Body Segments", point_to: 30)],
                      description: "Body Segments: \nDistinct visible sections of body."),
                      
                      7: Question(is_order: false,
                      image_names:["tail-filaments"],
                      question: "Does it have tail filaments?",
                      num_of_choice: 2,
                      choices: [Choice(text: "No", point_to: 11), Choice(text: "Yes", point_to: 10)],
                      description: "Tail Filaments: \nAn appendage located on the abdomen; used often for navigation and respiration."),
                      
                      8: Question(is_order: false,
                      image_names:["tails","hooks"],
                      question: "Are there observable tails or hooks at end of body?",
                      num_of_choice: 3,
                      choices: [Choice(text: "Yes, 2 Tails", point_to: 18), Choice(text: "Yes", point_to: 9), Choice(text: "No", point_to: 12)],
                      description: "Tail Filaments: \nAn appendage located on the abdomen; used often for navigation and respiration. \n\nHooks: \nA curved and sharp appendage used for catching, holding or pulling."),
                      
                      9: Question(is_order: false,
                      image_names:["lateral-filaments"],
                      question: "Does it have lateral filaments?",
                      num_of_choice: 2,
                      choices: [Choice(text: "No", point_to: 13), Choice(text: "Yes", point_to: 20)],
                      description: "Lateral Filaments: \nSlender and thin appendage off the sides of the body."),
                      
                      10: Question(is_order: false,
                      image_names:["abdominal-gills"],
                      question: "Does it have dorsal or lateral abdominal gills?",
                      num_of_choice: 2,
                      choices: [Choice(text: "No", point_to: 15), Choice(text: "Yes", point_to: 22)],
                      description: "Abdominal Gills: \nGills located on the third and most posterior major body region."),
                      
                      11: Question(is_order: false,
                      image_names:["wings","wing-pads"],
                      question: "Does it have wing pads or wings?",
                      num_of_choice: 2,
                      choices: [Choice(text: "Wing Pads", point_to: 25), Choice(text: "Wings", point_to: 14)],
                      description: "Wings: \nStructure that provides means of limited flight; found on thorax. \n\nWing Pads: \nDeveloping wings or the sheath of a developing wing"),
                      
                      12: Question(is_order: false,
                      image_names:["lateral-filaments"],
                      question: "Does it have lateral filaments?",
                      num_of_choice: 2,
                      choices: [Choice(text: "No", point_to: 23), Choice(text: "Yes", point_to: 21)],
                      description: "Lateral Filaments: \nSlender and thin appendage off the sides of the body."),
                      
                      13: Question(is_order: false,
                      image_names:["branced-ventral-gills"],
                      question: "Does it have branched gills?",
                      num_of_choice: 2,
                      choices: [Choice(text: "No", point_to: 17), Choice(text: "Yes", point_to: 19)],
                      description: "Branched Ventral Gills: \nGills that have divisions or an offshoot off the main axis; branching."),
                      
                      14: Question(is_order: false,
                      image_names:["hard-wings","leathery-wings"],
                      question: "Are they hard or leathery?",
                      num_of_choice: 2,
                      choices: [Choice(text: "Hard", point_to: 27), Choice(text: "Leathery", point_to: 28)],
                      description: "Hard Wings: \nWings that are commonly platelike; found in adult coleoptera. \n\nLeathery Wings: \nWings that are somewhat pliable and membranous; found in adult hemiptera."),
                      
                      15: Question(is_order: false,
                      image_names:["two-tails","three-tails"],
                      question: "How many tails are there?",
                      num_of_choice: 2,
                      choices: [Choice(text: "2 Tails", point_to: 24), Choice(text: "3 Tails", point_to: 26)],
                      description: "Two Tails: \nHaving two tail filaments. \n\nThree Tails: \nHaving three tail filaments."),
                      
                      
                      16: Question(is_order: true, question: "Hemiptera - True Bugs"),
                      17: Question(is_order: true, question: "Trichoptera - Other Caddisfly"),
                      18: Question(is_order: true, question: "Plecoptera - Stoneflies"),
                      19: Question(is_order: true, question: "Trichoptera - Net-Spinning Caddisfly"),
                      20: Question(is_order: true, question: "Megaloptera - Dobstonflies/Fishflies"),
                      21: Question(is_order: true, question: "Megaloptera - Alderflies"),
                      22: Question(is_order: true, question: "Ephemeroptera - Mayflies"),
                      23: Question(is_order: true, question: "Coleoptera - Adult or Larval Beetles"),
                      24: Question(is_order: true, question: "Plecoptera - Stoneflies"),
                      25: Question(is_order: true, question: "Odonata - Dragonflies"),
                      26: Question(is_order: true, question: "Odonata - Damselflies"),
                      27: Question(is_order: true, question: "Coleoptera - Adult Beetles"),
                      28: Question(is_order: true, question: "Hemiptera - True Bugs"),
                      29: Question(is_order: true, question: "Diptera - True Flies"),
                      30: Question(is_order: true, question: "Non-Insects")
        ]

  
              
  
    var question: Question?
  
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var help: UIButton!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
  
    var altImageArray = [UIImage(named: "dc"), UIImage(named: "dc"), UIImage(named: "dc")]
    var imageArray = [UIImage]()
    var imageNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false;
        if let q = question {
          loadKeyImages(q.image_names)
          questionLabel?.text = q.question
          choice1.setTitle(q.choices?[0].text, for: .normal)
          choice2.setTitle(q.choices?[1].text, for: .normal)
          if q.num_of_choice == 3 {
            choice3.setTitle(q.choices?[2].text, for: .normal)
            choice4.isHidden = true
          } else if q.num_of_choice == 4{
            choice3.setTitle(q.choices?[2].text, for: .normal)
            choice4.setTitle(q.choices?[3].text, for: .normal)
          }else{
            choice3.isHidden = true
            choice4.isHidden = true
          }
        }
    }
  
    func loadKeyImages(_ image_names:[String]?) {
      let fm = FileManager.default
      
      if let names = image_names {
        for name in names {
          let path = Bundle.main.resourceURL!.appendingPathComponent("img").appendingPathComponent("key_img").appendingPathComponent("\(name)").path
          let formatted_name = name.components(separatedBy:"-").joined(separator: " ").uppercased()
          do {
             let items = try fm.contentsOfDirectory(atPath: path)
             for item in items {
               if item.hasPrefix(name) && item.hasSuffix(".png") {
                 let imageURL = Bundle.main.resourceURL!.appendingPathComponent("img/key_img/\(name)/\(item)")
                 imageArray.append(UIImage(contentsOfFile: imageURL.path) ?? UIImage(named: "dc")!)
                 imageNames.append(formatted_name)
               }
             }
         } catch let error {
           imageArray = altImageArray as! [UIImage]
           imageNames.append("")
         }
        }
      }else{
        imageArray = altImageArray as! [UIImage]
        imageNames.append("")
      }
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      choice1.backgroundColor = UIColor.white
      choice1.setTitleColor(UIColor.black, for: .normal)
      choice2.backgroundColor = UIColor.white
      choice2.setTitleColor(UIColor.black, for: .normal)
      choice3.backgroundColor = UIColor.white
      choice3.setTitleColor(UIColor.black, for: .normal)
      choice4.backgroundColor = UIColor.white
      choice4.setTitleColor(UIColor.black, for: .normal)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionImageCollectionViewCell",  for: indexPath) as! QuestionImageCollectionViewCell
      
      cell.questionImage.image = imageArray[indexPath.row] //UIImage(named: "dc")
      cell.questionImageLabel.text = imageNames[indexPath.row]
      cell.layer.shadowColor = UIColor.black.cgColor
      cell.layer.shadowOffset = CGSize(width: 0, height: 3.0)
      cell.layer.shadowRadius = 2.0
      cell.layer.shadowOpacity = 0.3
      
      return cell
    }
  
  
    @IBAction func helpTapped(_ sender: UIButton){
      
        //get the button frame
        /* 1 */
        let button = sender as? UIButton
        let buttonFrame = button?.frame ?? CGRect.zero
        let message = question?.description ?? "Definition not available"


        /* 2 */
        //Configure the presentation controller
        let popoverContentController = self.storyboard?.instantiateViewController(withIdentifier: "PopoverContentController") as? PopoverContentController
        popoverContentController?.modalPresentationStyle = .popover
        popoverContentController?.definition = message
         
        /* 3 */
        if let popoverPresentationController = popoverContentController?.popoverPresentationController {
          popoverPresentationController.permittedArrowDirections = .right
          popoverPresentationController.sourceView = self.view
          popoverPresentationController.sourceRect = buttonFrame
          popoverPresentationController.delegate = self
          popoverPresentationController.backgroundColor = UIColor(red: 0.96, green: 0.62, blue: 0.14, alpha: 1.00) /* #f49e23 */
          if let popoverController = popoverContentController {
            present(popoverController, animated: true, completion: nil)
          }
        }
      }
  
      @IBAction func buttonTapped(button: UIButton ) {
        button.backgroundColor = UIColor(hue: 195/360, saturation: 89/100, brightness: 94/100, alpha: 1.0) /* #19b9f1 */
        button.setTitleColor(UIColor.white, for: .normal)
        let next_id: Int?
        
        if button == choice1 {
          next_id = question?.choices?[0].point_to
        }else if button == choice2 {
          next_id = question?.choices?[1].point_to
        }else if button == choice3 {
          next_id = question?.choices?[2].point_to
        }else {
          next_id = question?.choices?[3].point_to
        }
        
        let next_question = questions[next_id!]
        let newQuestionBoard = UIStoryboard(name: "Key", bundle: nil)
        
        if next_question?.is_order == true {
          let vc = newQuestionBoard.instantiateViewController(withIdentifier: "QuestionResult") as! QuestionResultViewController
          vc.question = next_question
          self.navigationController?.pushViewController(vc, animated: true)
        } else {
          let vc = newQuestionBoard.instantiateViewController(withIdentifier: "QuestionScreen") as! QuestionViewController
          vc.question = next_question
          self.navigationController?.pushViewController(vc, animated: true)
        }
      }
  
      //UIPopoverPresentationControllerDelegate inherits from UIAdaptivePresentationControllerDelegate, we will use this method to define the presentation style for popover presentation controller
      func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
      }
       
      //UIPopoverPresentationControllerDelegate
      func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
       
      }
       
      func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
      }
    

}
