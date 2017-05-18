//
//  CampusMapTableView.swift
//  Tafe Buddy
//
//  Created by Ti Chuot on 7/4/17.
//  Copyright © 2017 Ti Chuot. All rights reserved.
//

import UIKit

class CampusMapTableView: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    
    var campusArray : [CampusDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Add Campus Location
        campusLocation()
    }
    
    // Table view
    func numberOfSections(in tableView: UITableView) -> Int {return 1}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campusArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //Add multiple lines for table cell
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping
        
        let campus = campusArray[indexPath.row]
        cell.textLabel?.text = campus.title
        cell.detailTextLabel?.text = campus.subTitle //Go to table view cell change style to Subtitle
        return cell
    }// End table view
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{return 70}
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{return 60}
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{return 90}
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Campus Map"}
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        return "Made by Ti Chuot"}
    
    //var selectedRow = 0//(1)
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //selectedRow = indexPath.row
        //print(selectedRow)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // if let indexPath = self.tableView.indexPathForSelectedRow {
        
        //indexPath == the selected row. Then let campus == that selected row in campusArray
                let indexPath = tableView.indexPathForSelectedRow
                let campus = campusArray[(indexPath?.row)!]
        //(1)let campus = campusArray[selectedRow] Use this code not working. WHY?
                let controller : CampusMap = segue.destination as! CampusMap
                controller.detailItem = campus
      //  }
    }
    
    //Campus Location
    func campusLocation(){
        let map1 = CampusDetails(latitude:-34.923990,longtitude: 138.59492,title:"Adelaide City Campus",subTitle:"Tafe SA")
        let map2 = CampusDetails(latitude:-34.924345,longtitude: 138.592337,title:"Adelaide College of the Arts",subTitle:"Art School")
        let map3 = CampusDetails(latitude:-34.762962,longtitude: 138.647457,title:"Salisbury Campus",subTitle:"Tafe SA")
        let map4 = CampusDetails(latitude:-34.873225,longtitude: 138.568542,title:"Regency Campus",subTitle:"College in Regency Park, South Australia")
        let map5 = CampusDetails(latitude:-34.789226,longtitude: 138.635041,title:"Parafield Campus",subTitle:"Technical school in Parafield, South Australia")
        let map6 = CampusDetails(latitude:-34.970137,longtitude: 138.626863,title:"Urrbrae Campus",subTitle:"Adult education school in Netherby, South Australia")
        campusArray=[map1,map2,map3,map4,map5,map6]
        campusArray.sort( by: {$0.title < $1.title})
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    
}
