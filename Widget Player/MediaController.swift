//
//  MediaController.swift
//  Widget Player
//
//  Created by Sandeep Dilip on 9/22/20.
//

import Foundation
import Combine
import MediaPlayer

class MediaController: ObservableObject {
    private var player: MPMusicPlayerController!
    private var nowPlayingUpdater: AnyCancellable?
    private var playerStateUpdater: AnyCancellable?
    
    @Published var image: UIImage? = nil
    @Published var songTitle: String? = nil
    @Published var playing = false
    
    init() {
        player = .systemMusicPlayer
        player.beginGeneratingPlaybackNotifications()
        logger.debug("Started notifications")
        
        updateArtwork()
        updateSongTitle()
        updateState()
        
        nowPlayingUpdater = NotificationCenter.default
            .publisher(for: Notification.Name.MPMusicPlayerControllerNowPlayingItemDidChange, object: player)
            .receive(on: RunLoop.main)
            .sink { _ in
                self.updateArtwork()
                self.updateSongTitle()
                logger.debug("Song changed")
            }
        
        playerStateUpdater = NotificationCenter.default
            .publisher(for: Notification.Name.MPMusicPlayerControllerPlaybackStateDidChange, object: player)
            .receive(on: RunLoop.main)
            .sink { _ in
                self.updateState()
                logger.debug("State changed")
            }
    }
    
    private func updateArtwork() {
        if let artwork = player.nowPlayingItem?.artwork {
            image = artwork.image(at: artwork.bounds.size)
            logger.debug("Updated image")
        } else {
            image = nil
        }
    }
    
    private func updateSongTitle() {
        if let title = player.nowPlayingItem?.title {
            songTitle = title
            logger.debug("Now playing: \(title)")
        } else {
            songTitle = nil
        }
    }
    
    private func updateState() {
        logger.debug("State is \(self.player.playbackState.rawValue)")
        if player.playbackState == .playing {
            playing = true
        } else {
            playing = false
        }
    }
    
    func togglePlayback() {
        if !playing {
            player.play()
        } else {
            player.pause()
        }
    }
    
    func skip() {
        player.skipToNextItem()
    }
    
    func prev() {
        if player.currentPlaybackTime <= 3 {
            player.skipToPreviousItem()
        } else {
            player.skipToBeginning()
        }
    }
    
}
