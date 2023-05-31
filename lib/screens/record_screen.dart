import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:microphone/microphone.dart';
import 'package:just_audio_web/just_audio_web.dart';
import 'dart:developer';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';
import 'fill_in_buttom.dart';

enum AudioState { recording, stop, play }

const veryDarkBlue = Color(0xff172133);
const kindaDarkBlue = Color(0xff202641);

class RecordingScreen extends StatefulWidget {
  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  AudioState audioState;
  MicrophoneRecorder _recorder;
  AudioPlayer _audioPlayer;
  bool _fllIn = false;
  @override
  void initState() {
    super.initState();
    _recorder = MicrophoneRecorder()..init();
  }

  void handleAudioState(AudioState state) async {
    setState(() {
      if (audioState == null) {
        // Starts recording
        setState(() {
          _fllIn = true;
        });
        audioState = AudioState.recording;
        _recorder.start();
        // Finished recording
      } else if (audioState == AudioState.recording) {
        audioState = AudioState.play;
        _recorder.stop();
        // Play recorded audio
      } else if (audioState == AudioState.play) {
        audioState = AudioState.stop;
        _audioPlayer = AudioPlayer();

        _audioPlayer.setUrl(_recorder.value.recording.url).then((_) {
          return _audioPlayer.play().then((_) {
            setState(() => audioState = AudioState.play);
          });
        });
        // Stop recorded audio
      } else if (audioState == AudioState.stop) {
        audioState = AudioState.play;
        _audioPlayer.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Microphone Flutter Web',
      home: Scaffold(
        // backgroundColor: veryDarkBlue,
        body: Center(
          child: Column(
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: FillingButtom("eeehaahha", Duration(seconds: 5), _fllIn),
              // ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: handleAudioColour(),
                    ),
                    child: RawMaterialButton(
                      fillColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(30),
                      onPressed: () => handleAudioState(audioState),
                      child: getIcon(audioState),
                    ),
                  ),
                  SizedBox(width: 20),
                  if (audioState == AudioState.play ||
                      audioState == AudioState.stop)
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kindaDarkBlue,
                      ),
                      child: RawMaterialButton(
                        fillColor: Colors.white,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(30),
                        onPressed: () => setState(() {
                          audioState = null;
                          print(_recorder.toBytes());
                          _recorder.dispose();
                          _recorder = MicrophoneRecorder()..init();
                          // FillingButtom("eeehaahha", Duration(seconds: 5), _fllIn);
                        }),
                        child: Icon(Icons.replay, size: 50),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color handleAudioColour() {
    if (audioState == AudioState.recording) {
      return Colors.deepOrangeAccent.shade700.withOpacity(0.5);
    } else if (audioState == AudioState.stop) {
      return Colors.green.shade900;
    } else {
      return kindaDarkBlue;
    }
  }

  Icon getIcon(AudioState state) {
    switch (state) {
      case AudioState.play:
        return Icon(Icons.play_arrow, size: 50);
      case AudioState.stop:
        return Icon(Icons.stop, size: 50);
      case AudioState.recording:
        return Icon(Icons.mic, color: Colors.redAccent, size: 50);
      default:
        return Icon(Icons.mic, size: 50);
    }
  }
}
