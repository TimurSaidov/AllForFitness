//
//  FitnessTableViewController.swift
//  AllForFitness
//
//  Created by Timur Saidov on 25.03.2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class FitnessTableViewController: UITableViewController {

    var trains: [Training] = [
        Training(name: "Берёзка", type: "Комлексное", image: "berezka.png", description: "Данное упражнение направлено на укрепление мышц пресса, спины, а также разработку шейного отдела."),
        Training(name: "Махи ногой", type: "Комлексное", image: "makhi.png", description: "Отличное упражнение, помогающее не только нагрузить пресс, который в момент выполнения будет в постоянном напряжении, а и немного проработать ягодичные мышцы."),
        Training(name: "Мостик", type: "Комлексное", image: "mostik.png", description: "Эффетивное упражнение, направленное на укрепление ягодичных мышц и задней поверхности бедра. Дополнительную нагрузку получают, при соблюдении техники выполнения, спина и пресс."),
        Training(name: "Ножницы", type: "Комлексное", image: "nozhnitsy.png", description: "Универсальное упражнение, помогающее проработать все мышцы брюшной полости, а также избавиться от лишних килограммов в этой проблемной области."),
        Training(name: "Повороты с упором на локоть", type: "Комлексное", image: "povoroty.png", description: "Упражнение, направленное на проработку мышц бокового пресса и помогающее развить координацию движений."),
        Training(name: "Приседания до параллели", type: "Базовое", image: "prisedaniya.png", description: "Базовое упражнение, являющееся одним из важнейших для тренировки ягодиц."),
        Training(name: "Прогибы назад", type: "Базовое", image: "berezka.png", description: "Упражнение, помогающее размяться и растянуть спину, подготовив ее к дальнейшим нагрузкам."),
        Training(name: "Прыжки в сторону", type: "Комлексное", image: "pryzhki.png", description: "Довольно специфическое, но оттого не менее эффективное упражнение, помогающее проработать мышцы бедер, ягодицы и квадрицепсы."),
        Training(name: "Двойные скручивания", type: "Комлексное", image: "skruchivaniya.png", description: "Сложное упражнение, направленное на проработку верхнего и нижнего отделов пресса. Выполнять его можно только предварительно размявшись."),
        Training(name: "Выпады", type: "Базовое", image: "vypady.png", description: "Базовое упражнение для тренировки ягодиц.")]
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true // Прячем Navigation Bar при проматывании вниз.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil) // Убрать текст "Все тренировки" из кнопки назад в Navigation Bar.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trains.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FitnessTableViewCell
        cell.fitnessImageView.image = UIImage(named: trains[indexPath.row].image)
        cell.fitnessImageView.layer.cornerRadius = 32.5
        cell.fitnessImageView.clipsToBounds = true
        cell.nameLabel.text = trains[indexPath.row].name
        return cell
    }

    // Custom Row Actions для выбранной ячейки (смахивание влево - поделиться и удалить).
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Поделиться") { (action: UITableViewRowAction, indexPath) -> Void in
            let defaultText = "Я сейчас выполняю" + self.trains[indexPath.row].name
            if let image = UIImage(named: self.trains[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
        let delete = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Удалить") { (action: UITableViewRowAction, indexPath) -> Void in
            self.trains.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        share.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        return [delete, share]
    }

}
