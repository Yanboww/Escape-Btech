//
//  AudioPlayerViewModel.swift
//  Escape_Btech
//
//  Created by Student on 6/3/25.
//  https://www.kodeco.com/books/swiftui-cookbook/v1.0/chapters/1-create-an-audio-player-in-swiftui

import AVFoundation

class AudioPlayerViewModel: ObservableObject {
  var audioPlayer: AVAudioPlayer?

  @Published var isPlaying = false

  init() {
    if let sound = Bundle.main.path(forResource: "music", ofType: "mp3") {
      do {
        self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
      } catch {
        print("AVAudioPlayer could not be instantiated.")
      }
    } else {
      print("Audio file could not be found.")
    }
  }

  func playOrPause() {
    guard let player = audioPlayer else { return }

    if player.isPlaying {
      player.pause()
      isPlaying = false
        print("stoped")
    } else {
      player.play()
      isPlaying = true
        print("plaay")
    }
  }
}
