//
//  MainViewController.swift
//  SampleAudioStreaming
//
//  Created by Tri Vo on 7/18/16.
//  Copyright © 2016 acumenvn. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Jukebox

class MainViewController: UIViewController {

    var myJukeBox : Jukebox?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func streamAudio() {
        let mp3Link = "http://data.chiasenhac.com/downloads/1675/1/1674121-9c20603f/128/Like%20A%20Dream%20-%20Ben%20[MP3%20128kbps].mp3"
        let audioURL = NSURL(string: mp3Link)
        /*
         STKAudioPlayer* audioPlayer = [[STKAudioPlayer alloc] init];
         
         [audioPlayer play:@"http://www.abstractpath.com/files/audiosamples/sample.mp3"];
         
         jukebox = Jukebox(delegate: self, items: [
         JukeboxItem(URL: NSURL(string: "http://www.noiseaddicts.com/samples_1w72b820/2514.mp3")!),
         JukeboxItem(URL: NSURL(string: "http://www.noiseaddicts.com/samples_1w72b820/2958.mp3")!)
         ])
         */
        
        self.myJukeBox = Jukebox(delegate: self, items: [
            JukeboxItem(URL: audioURL!)
            ])
        
        self.myJukeBox!.play()
        
    }

    @IBAction func btn_Touched(sender: AnyObject) {
        
        self.streamAudio()
    }
    @IBAction func btnSeek_Touched(sender: AnyObject) {
        self.myJukeBox!.seek(toSecond: 60)
    }
}

extension MainViewController : AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        
    }
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer, error: NSError?) {
        
    }
}

extension MainViewController : JukeboxDelegate {
    func jukeboxStateDidChange(state: Jukebox) {
        
    }
    
    func jukeboxPlaybackProgressDidChange(jukebox: Jukebox) {
        print("process " + String(jukebox.currentItem?.currentTime))
    }
    
    func jukeboxDidLoadItem(jukebox: Jukebox, item: JukeboxItem) {
        print(item)
    }
    
    func jukeboxDidUpdateMetadata(jukebox: Jukebox, forItem: JukeboxItem) {
        
    }
}
