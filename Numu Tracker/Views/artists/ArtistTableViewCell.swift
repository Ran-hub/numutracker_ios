//
//  ArtistTableViewCell.swift
//  Numu Tracker
//
//  Created by Bradley Root on 10/15/16.
//  Copyright © 2016 Numu Tracker. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var releasesData: UILabel!
    @IBOutlet weak var artistArt: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    var thumbUrl: URL!
    var followStatus: String = "0"
    @IBOutlet weak var recentReleaseLabel: UILabel!
    @IBOutlet weak var albumActivityIndicator: UIActivityIndicatorView!

    func configure(artistInfo: ArtistItem) {
        artistNameLabel.text = artistInfo.artistName
        thumbUrl = artistInfo.thumbUrl
        followStatus = artistInfo.followStatus

        if artistInfo.recentRelease == "December 31, 1969" {
            recentReleaseLabel.text = "No Releases"
        } else {
            recentReleaseLabel.text = artistInfo.recentRelease
        }
        let intTotalReleases = Int(artistInfo.totalReleases)!
        let intUnlistened = Int(artistInfo.unlistened)!

        if intTotalReleases > 0 {
            var percentageListened = (Double(intUnlistened) / Double(intTotalReleases))
            percentageListened *= 100
            releasesData.text = String(100-Int(percentageListened)) + "% Listened"

        } else {
            releasesData.text = "100% Listened"
        }

        artistArt.layer.shadowColor = UIColor.black.cgColor
        artistArt.layer.shadowOpacity = 0.3
        artistArt.layer.shadowOffset = .zero
        artistArt.layer.shadowRadius = 5

    }

}
