//
//  MyCalenderViewController.swift
//  CovidTracker
//
//  Created by Tushar Chitnavis on 2020/04/26.
//  Copyright © 2020 Tushar Chitnavis. All rights reserved.
//

import UIKit

import Foundation
import UIKit
import CoreData

extension QuarantineViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfPastMonths + numberOfFutureMonths + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "calendarHeaderView", for: indexPath) as? CalendarHeaderView {
            
            let year = self.year(at: indexPath)
            let month = self.month(at: indexPath)
            let dateComponents = DateComponents(year: year, month: month)
            let date = calendar.date(from: dateComponents)
            sectionHeader.titleLabel.text = date?.toString(dateFormat: "MMMM")
            
            return sectionHeader
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let indexPath = IndexPath(item: 0, section: section)
        
        let year = self.year(at: indexPath)
        let month = self.month(at: indexPath)
        let dateComponents = DateComponents(year: year, month: month)
        let date = calendar.date(from: dateComponents)!
        
        let daysInMonth = calendar.range(of: .day, in: .month, for: date)!.count
        let dayOffset = self.dayOffset(year: year, month: month)
        
        return daysInMonth + dayOffset
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCell", for: indexPath) as! CalendarViewCell
        
        // Display the weekday ordinal in the calendar cell
        let year = self.year(at: indexPath)
        let month = self.month(at: indexPath)
        if let day = day(at: indexPath) {
            let date = calendar.date(from: DateComponents(calendar: calendar, year: year, month: month, day: day))!
            cell.date = date
            cell.numberLabel.text = "\(day)"
            cell.cellView.layer.borderColor = UIColor(rgb: 0x909090).withAlphaComponent(1).cgColor
            // If the day matches today, highlight the number with a different color
            if calendar.compare(date, to: Date(), toGranularity: .day) == .orderedSame {
                cell.numberLabel.textColor = .black
                cell.numberLabel.font = .boldSystemFont(ofSize: 11)
            } else {
                cell.numberLabel.textColor = .label
            }
        } else {
            cell.date = nil
            cell.numberLabel.text = ""
            cell.numberLabel.textColor = .label
            cell.cellView.layer.borderColor = UIColor(rgb: 0x909090).withAlphaComponent(0.4).cgColor
        }
        
        
        return cell
    }
    
    /// Returns the year that should be displayed at the specified index path
    private func year(at indexPath: IndexPath) -> Int {
        let shiftedDate = calendar.date(byAdding: .month, value: indexPath.section, to: Date())!
        let year = calendar.component(.year, from: shiftedDate)
        return year
    }
    
    /// Returns month that should be displayed at the specified index path
    private func month(at indexPath: IndexPath) -> Int {
        let shiftedDate = calendar.date(byAdding: .month, value: indexPath.section - numberOfPastMonths, to: Date())!
        let month = calendar.component(.month, from: shiftedDate)
        return month
    }
    
    /// Returns the day of month that should be displayed at the specified index path
    private func day(at indexPath: IndexPath) -> Int? {
        let year = self.year(at: indexPath)
        let month = self.month(at: indexPath)
        
        // Account for the empty filler cells at the start of the month when
        // determining the day for the index path
        let day = indexPath.row - dayOffset(year: year, month: month) + 1
        
        guard day >= 1 else {
            return nil
        }
        
        return day
    }
    
    /// Returns the day offset for the specified year and month. The day
    /// offset is used to shift the days in the calendar view so the weekday
    /// ordinal is aligned with the correct weekday.
    func dayOffset(year: Int, month: Int) -> Int {
        // Get the weekday ordinal for the first day of the month
        let firstOfMonthDateComponents = DateComponents(calendar: calendar, year: year, month: month, day:  1)
        let startOfMonth = calendar.date(from: firstOfMonthDateComponents)!
        let dayOffset = calendar.component(.weekday, from: startOfMonth) - 1
        return dayOffset
    }
}

extension QuarantineViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Size the items so there are seven columns in each row of the collection view
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.minimumInteritemSpacing * CGFloat(6)
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(7))
        
        return CGSize(width: size, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: Int(gradientView.bounds.width), height: headerHeight)
    }
}

extension QuarantineViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCell = collectionView.cellForItem(at: indexPath) as? CalendarViewCell else {
            return
        }
        
        // If cell has no date, it's just a filler cell
        if let date = selectedCell.date {
            self.selectedDate = date
//            self.performSegue(withIdentifier: "daySegue", sender: self)
            print(self.selectedDate?.toString(dateFormat: "dd MMMM YYYY"))
//            selectedCell.cellView.layer.borderWidth = 2
        }
    }
    
//     func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//            guard let selectedCell = collectionView.cellForItem(at: indexPath) as? CalendarViewCell else {
//                return
//            }
//
//            // If cell has no date, it's just a filler cell
//            if let date = selectedCell.date {
//                self.selectedDate = date
//    //            self.performSegue(withIdentifier: "daySegue", sender: self)
//                selectedCell.cellView.layer.borderWidth = 0.3
//            }
//        }
}


